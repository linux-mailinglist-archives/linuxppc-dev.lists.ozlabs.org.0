Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4450F6E056
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jul 2019 06:50:48 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45qdqT5Q7vzDqMw
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jul 2019 14:50:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="O7YSSNYx"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45qcpq6Xt8zDqGT
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jul 2019 14:05:07 +1000 (AEST)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 947F6218B8;
 Fri, 19 Jul 2019 04:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1563509106;
 bh=vx2vWh9eODayEyi7NmcYmZ1q6GxdvboP6NB7tsl66xU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=O7YSSNYxPTrEPWiahUId+KqxTkfNZO1zwiRoRCyL5YgNqvvKEHvM22WObxfks+/0a
 juNZL1xYBmFCKtWNN+qZRKqemOInDSds2QtEFfDDfPMc5ClrLOeTThNeMxLv9t53+B
 DisslQJy1x4PUoB9F2WyHZ6j1amga9rb+rF9tkyg=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.1 071/141] powerpc/rtas: retry when cpu offline
 races with suspend/migration
Date: Fri, 19 Jul 2019 00:01:36 -0400
Message-Id: <20190719040246.15945-71-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190719040246.15945-1-sashal@kernel.org>
References: <20190719040246.15945-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Sasha Levin <sashal@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Nathan Lynch <nathanl@linux.ibm.com>

[ Upstream commit 9fb603050ffd94f8127df99c699cca2f575eb6a0 ]

The protocol for suspending or migrating an LPAR requires all present
processor threads to enter H_JOIN. So if we have threads offline, we
have to temporarily bring them up. This can race with administrator
actions such as SMT state changes. As of dfd718a2ed1f ("powerpc/rtas:
Fix a potential race between CPU-Offline & Migration"),
rtas_ibm_suspend_me() accounts for this, but errors out with -EBUSY
for what almost certainly is a transient condition in any reasonable
scenario.

Callers of rtas_ibm_suspend_me() already retry when -EAGAIN is
returned, and it is typical during a migration for that to happen
repeatedly for several minutes polling the H_VASI_STATE hcall result
before proceeding to the next stage.

So return -EAGAIN instead of -EBUSY when this race is
encountered. Additionally: logging this event is still appropriate but
use pr_info instead of pr_err; and remove use of unlikely() while here
as this is not a hot path at all.

Fixes: dfd718a2ed1f ("powerpc/rtas: Fix a potential race between CPU-Offline & Migration")
Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/kernel/rtas.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index fbc676160adf..9b4d2a2ffb4f 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -984,10 +984,9 @@ int rtas_ibm_suspend_me(u64 handle)
 	cpu_hotplug_disable();
 
 	/* Check if we raced with a CPU-Offline Operation */
-	if (unlikely(!cpumask_equal(cpu_present_mask, cpu_online_mask))) {
-		pr_err("%s: Raced against a concurrent CPU-Offline\n",
-		       __func__);
-		atomic_set(&data.error, -EBUSY);
+	if (!cpumask_equal(cpu_present_mask, cpu_online_mask)) {
+		pr_info("%s: Raced against a concurrent CPU-Offline\n", __func__);
+		atomic_set(&data.error, -EAGAIN);
 		goto out_hotplug_enable;
 	}
 
-- 
2.20.1

