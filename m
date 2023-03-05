Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 94CCE6AB0F3
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Mar 2023 15:12:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PV3ZN3VTNz3fWN
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Mar 2023 01:12:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Ns9cGxMc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Ns9cGxMc;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PV39X06wQz3cjC
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Mar 2023 00:54:40 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 500DA60B38;
	Sun,  5 Mar 2023 13:54:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DA6FC433EF;
	Sun,  5 Mar 2023 13:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678024478;
	bh=V8GrjHTdp/YzaPZLletIm2+ljKjPc8/5CtDA5lj08DM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ns9cGxMcPiZZ5IGRbs3ImPSLHFDEcXrwIr78jp6tyNZApiGrvV5OuK3bp6mgMg9lO
	 /HMRIq0Z8pzTW9qWb63S4CwEo3giiCF2PX8sbpb4pfwyQrKq5qhgscULnitFyBTd5S
	 8YGE2FlVeOjtEibQW2+zQevABmBQk57IjLAFeZAHMnpaRVMxVi2IObhBLnTSuXpJPU
	 AyEtQoCm0GLssD/dovmbr86rgff33O9x7f/DL3E/bdXZ0uKirKa3+SMOY66d1MmTS8
	 YaOzno8tOqf2iVnZRGQf5m48sEQmXwrXJRPhA8CkB6NygD6pal3KzFG5X2WnNKuoSD
	 h8eqQf+L0hw5Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 4/8] powerpc/kcsan: Exclude udelay to prevent recursive instrumentation
Date: Sun,  5 Mar 2023 08:54:21 -0500
Message-Id: <20230305135425.1793964-4-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230305135425.1793964-1-sashal@kernel.org>
References: <20230305135425.1793964-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Rohan McLure <rmclure@linux.ibm.com>, ganeshgr@linux.ibm.com, npiggin@gmail.com, linuxppc-dev@lists.ozlabs.org, heying24@huawei.com, joel@jms.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Rohan McLure <rmclure@linux.ibm.com>

[ Upstream commit 2a7ce82dc46c591c9244057d89a6591c9639b9b9 ]

In order for KCSAN to increase its likelihood of observing a data race,
it sets a watchpoint on memory accesses and stalls, allowing for
detection of conflicting accesses by other kernel threads or interrupts.

Stalls are implemented by injecting a call to udelay in instrumented code.
To prevent recursive instrumentation, exclude udelay from being instrumented.

Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/20230206021801.105268-3-rmclure@linux.ibm.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/kernel/time.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/time.c b/arch/powerpc/kernel/time.c
index 1d20f0f77a920..ba9b54d35f570 100644
--- a/arch/powerpc/kernel/time.c
+++ b/arch/powerpc/kernel/time.c
@@ -436,7 +436,7 @@ void vtime_flush(struct task_struct *tsk)
 #define calc_cputime_factors()
 #endif
 
-void __delay(unsigned long loops)
+void __no_kcsan __delay(unsigned long loops)
 {
 	unsigned long start;
 
@@ -457,7 +457,7 @@ void __delay(unsigned long loops)
 }
 EXPORT_SYMBOL(__delay);
 
-void udelay(unsigned long usecs)
+void __no_kcsan udelay(unsigned long usecs)
 {
 	__delay(tb_ticks_per_usec * usecs);
 }
-- 
2.39.2

