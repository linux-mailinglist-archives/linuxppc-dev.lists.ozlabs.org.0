Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 078B36E051
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jul 2019 06:48:20 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45qdmd2BdhzDqVK
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jul 2019 14:48:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="UkbzVNEp"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45qcpn5qFFzDqd3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jul 2019 14:05:05 +1000 (AEST)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7FDB3218A3;
 Fri, 19 Jul 2019 04:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1563509104;
 bh=Pexeou4pNE0W1eZxwC5+0i3R4UWBqXSliIsFpaicnF4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UkbzVNEp8YaSoir3/iJbC7g7vrpZUxjhOG5t3nP1R4j034MYR0yYkEuHR3a/DMBUw
 fOSeVduz4W2ESrzBMvCx7r22GfT6PM1RlaLjB2SlXQIzm6BKTGzCjk5vz0ck19bu2U
 UKzrl+MY/PO1C0a0eTnhtqX27Pe6BoDYFrmXsZjM=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.1 070/141] powerpc/xmon: Fix disabling tracing while
 in xmon
Date: Fri, 19 Jul 2019 00:01:35 -0400
Message-Id: <20190719040246.15945-70-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>,
 "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>

[ Upstream commit aaf06665f7ea3ee9f9754e16c1a507a89f1de5b1 ]

Commit ed49f7fd6438d ("powerpc/xmon: Disable tracing when entering
xmon") added code to disable recording trace entries while in xmon. The
commit introduced a variable 'tracing_enabled' to record if tracing was
enabled on xmon entry, and used this to conditionally enable tracing
during exit from xmon.

However, we are not checking the value of 'fromipi' variable in
xmon_core() when setting 'tracing_enabled'. Due to this, when secondary
cpus enter xmon, they will see tracing as being disabled already and
tracing won't be re-enabled on exit. Fix the same.

Fixes: ed49f7fd6438d ("powerpc/xmon: Disable tracing when entering xmon")
Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/xmon/xmon.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index a0f44f992360..c608e3fa6d3b 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -466,8 +466,10 @@ static int xmon_core(struct pt_regs *regs, int fromipi)
 	local_irq_save(flags);
 	hard_irq_disable();
 
-	tracing_enabled = tracing_is_on();
-	tracing_off();
+	if (!fromipi) {
+		tracing_enabled = tracing_is_on();
+		tracing_off();
+	}
 
 	bp = in_breakpoint_table(regs->nip, &offset);
 	if (bp != NULL) {
-- 
2.20.1

