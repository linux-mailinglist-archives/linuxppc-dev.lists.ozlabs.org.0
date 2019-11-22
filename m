Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A6C106726
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Nov 2019 08:39:36 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47K7c619jszDr2F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Nov 2019 18:39:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="LSkc94EA"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47K5j93DSyzDr6P
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Nov 2019 17:13:49 +1100 (AEDT)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 21CA82068E;
 Fri, 22 Nov 2019 06:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1574403227;
 bh=5WIS6H9GfOjXchxXxGvWQfONvCwhwRy3yvUMfZS+QTQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LSkc94EADE29b9FauHsUfEElklTSN+vSppfC6Gza4tmLrsg7aC1OaUsKCc3VWnNsN
 xxGF/887BNWsJcn0mBo09gkOffjB+t9p8zK9TQ+yHwkDeYchsDKht8kVNiVnUCRRch
 O0+psnVFLfx07uBuaqCd5ewwuu5OtpDmzkkZdZh0=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.4 41/68] powerpc/mm: Make NULL pointer deferences
 explicit on bad page faults.
Date: Fri, 22 Nov 2019 01:12:34 -0500
Message-Id: <20191122061301.4947-40-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191122061301.4947-1-sashal@kernel.org>
References: <20191122061301.4947-1-sashal@kernel.org>
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
Cc: linuxppc-dev@lists.ozlabs.org, Sasha Levin <sashal@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Christophe Leroy <christophe.leroy@c-s.fr>

[ Upstream commit 49a502ea23bf9dec47f8f3c3960909ff409cd1bb ]

As several other arches including x86, this patch makes it explicit
that a bad page fault is a NULL pointer dereference when the fault
address is lower than PAGE_SIZE

In the mean time, this page makes all bad_page_fault() messages
shorter so that they remain on one single line. And it prefixes them
by "BUG: " so that they get easily grepped.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
[mpe: Avoid pr_cont()]
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/mm/fault.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
index d154e333f76b7..d1f860ca03ade 100644
--- a/arch/powerpc/mm/fault.c
+++ b/arch/powerpc/mm/fault.c
@@ -521,21 +521,22 @@ void bad_page_fault(struct pt_regs *regs, unsigned long address, int sig)
 	switch (regs->trap) {
 	case 0x300:
 	case 0x380:
-		printk(KERN_ALERT "Unable to handle kernel paging request for "
-			"data at address 0x%08lx\n", regs->dar);
+		pr_alert("BUG: %s at 0x%08lx\n",
+			 regs->dar < PAGE_SIZE ? "Kernel NULL pointer dereference" :
+			 "Unable to handle kernel data access", regs->dar);
 		break;
 	case 0x400:
 	case 0x480:
-		printk(KERN_ALERT "Unable to handle kernel paging request for "
-			"instruction fetch\n");
+		pr_alert("BUG: Unable to handle kernel instruction fetch%s",
+			 regs->nip < PAGE_SIZE ? " (NULL pointer?)\n" : "\n");
 		break;
 	case 0x600:
-		printk(KERN_ALERT "Unable to handle kernel paging request for "
-			"unaligned access at address 0x%08lx\n", regs->dar);
+		pr_alert("BUG: Unable to handle kernel unaligned access at 0x%08lx\n",
+			 regs->dar);
 		break;
 	default:
-		printk(KERN_ALERT "Unable to handle kernel paging request for "
-			"unknown fault\n");
+		pr_alert("BUG: Unable to handle unknown paging fault at 0x%08lx\n",
+			 regs->dar);
 		break;
 	}
 	printk(KERN_ALERT "Faulting instruction address: 0x%08lx\n",
-- 
2.20.1

