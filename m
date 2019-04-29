Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 643BBE744
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2019 18:06:58 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44t8g35JZCzDq7k
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2019 02:06:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44t8Tz4NXvzDqRS
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2019 01:59:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=nxp.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 44t8Tz2kLkz8w0H
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2019 01:59:03 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 44t8Tz2RxXz9s70; Tue, 30 Apr 2019 01:59:03 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=92.121.34.13; helo=inva020.nxp.com;
 envelope-from=diana.craciun@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 44t8Ty6DGDz9sDQ
 for <linuxppc-dev@ozlabs.org>; Tue, 30 Apr 2019 01:59:02 +1000 (AEST)
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id F21ED1A0175;
 Mon, 29 Apr 2019 17:49:36 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com
 [134.27.226.22])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id E602A1A0020;
 Mon, 29 Apr 2019 17:49:36 +0200 (CEST)
Received: from fsr-ub1664-009.ea.freescale.net
 (fsr-ub1664-009.ea.freescale.net [10.171.71.77])
 by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 9BC92205EE;
 Mon, 29 Apr 2019 17:49:36 +0200 (CEST)
From: Diana Craciun <diana.craciun@nxp.com>
To: stable@vger.kernel.org,
	gregkh@linuxfoundation.org
Subject: [PATCH stable v4.4 5/8] powerpc/fsl: Sanitize the syscall table for
 NXP PowerPC 32 bit platforms
Date: Mon, 29 Apr 2019 18:49:05 +0300
Message-Id: <1556552948-24957-6-git-send-email-diana.craciun@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1556552948-24957-1-git-send-email-diana.craciun@nxp.com>
References: <1556552948-24957-1-git-send-email-diana.craciun@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
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
Cc: Diana Craciun <diana.craciun@nxp.com>, linuxppc-dev@ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

commit c28218d4abbf4f2035495334d8bfcba64bda4787 upstream.

Used barrier_nospec to sanitize the syscall table.

Signed-off-by: Diana Craciun <diana.craciun@nxp.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/kernel/entry_32.S | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
index 3728e617e17e..609bc7d01f13 100644
--- a/arch/powerpc/kernel/entry_32.S
+++ b/arch/powerpc/kernel/entry_32.S
@@ -33,6 +33,7 @@
 #include <asm/unistd.h>
 #include <asm/ftrace.h>
 #include <asm/ptrace.h>
+#include <asm/barrier.h>
 
 /*
  * MSR_KERNEL is > 0x10000 on 4xx/Book-E since it include MSR_CE.
@@ -340,6 +341,15 @@ syscall_dotrace_cont:
 	ori	r10,r10,sys_call_table@l
 	slwi	r0,r0,2
 	bge-	66f
+
+	barrier_nospec_asm
+	/*
+	 * Prevent the load of the handler below (based on the user-passed
+	 * system call number) being speculatively executed until the test
+	 * against NR_syscalls and branch to .66f above has
+	 * committed.
+	 */
+
 	lwzx	r10,r10,r0	/* Fetch system call handler [ptr] */
 	mtlr	r10
 	addi	r9,r1,STACK_FRAME_OVERHEAD
-- 
2.17.1

