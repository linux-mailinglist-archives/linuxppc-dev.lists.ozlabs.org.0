Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 450E410E6A7
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Dec 2019 09:07:02 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47RHl6560VzDq9G
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Dec 2019 19:06:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="iiiniL6F"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47RHXG50QJzDqSB
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Dec 2019 18:57:31 +1100 (AEDT)
Received: from localhost (mailhub1-ext [192.168.12.233])
 by localhost (Postfix) with ESMTP id 47RHX33DnBz9txsv;
 Mon,  2 Dec 2019 08:57:23 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=iiiniL6F; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id R58n3sRMPppC; Mon,  2 Dec 2019 08:57:23 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 47RHX32CX7z9txsp;
 Mon,  2 Dec 2019 08:57:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1575273443; bh=908ictPM0d9tdAvkWhNTctaYRgZOsXF5jkHRnAfr4Tk=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=iiiniL6F2B9F1429Fs12lLyHze+ezcS1QUlhNwHeDXjNDX6bmSIPLa6U6no3ZhXFl
 as+u/DN2I6mcVH8csvnBU5oGVP1kIsy3nmNm+tdDtdRTm3dDMVEbi0Gd4sDSJYiO7t
 ndi8TUtNXZq/XfkLM38NUDT9ziOOnWEOWsK0RU4Y=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E607F8B79B;
 Mon,  2 Dec 2019 08:57:27 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id bMSixq0Kfd52; Mon,  2 Dec 2019 08:57:27 +0100 (CET)
Received: from po16098vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.103])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BF8AF8B79A;
 Mon,  2 Dec 2019 08:57:27 +0100 (CET)
Received: by po16098vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id B247A63600; Mon,  2 Dec 2019 07:57:27 +0000 (UTC)
Message-Id: <eaac4b6494ecff1811220fccc895bf282aab884a.1575273217.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1575273217.git.christophe.leroy@c-s.fr>
References: <cover.1575273217.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v4 1/8] powerpc/32: Add VDSO version of getcpu on non SMP
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Mon,  2 Dec 2019 07:57:27 +0000 (UTC)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, arnd@arndb.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit 18ad51dd342a ("powerpc: Add VDSO version of getcpu") added
getcpu() for PPC64 only, by making use of a user readable general
purpose SPR.

PPC32 doesn't have any such SPR.

For non SMP, just return CPU id 0 from the VDSO directly.
PPC32 doesn't support CONFIG_NUMA so NUMA node is always 0.

Before the patch, vdsotest reported:
getcpu: syscall: 1572 nsec/call
getcpu:    libc: 1787 nsec/call
getcpu:    vdso: not tested

Now, vdsotest reports:
getcpu: syscall: 1582 nsec/call
getcpu:    libc: 502 nsec/call
getcpu:    vdso: 187 nsec/call

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>

---
v2: fixed build error in getcpu.S
v3: dropped the fast system call, only support non SMP for now.
---
 arch/powerpc/kernel/vdso32/Makefile     |  4 +---
 arch/powerpc/kernel/vdso32/getcpu.S     | 17 +++++++++++++++++
 arch/powerpc/kernel/vdso32/vdso32.lds.S |  2 +-
 3 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kernel/vdso32/Makefile b/arch/powerpc/kernel/vdso32/Makefile
index 06f54d947057..e147bbdc12cd 100644
--- a/arch/powerpc/kernel/vdso32/Makefile
+++ b/arch/powerpc/kernel/vdso32/Makefile
@@ -2,9 +2,7 @@
 
 # List of files in the vdso, has to be asm only for now
 
-obj-vdso32-$(CONFIG_PPC64) = getcpu.o
-obj-vdso32 = sigtramp.o gettimeofday.o datapage.o cacheflush.o note.o \
-		$(obj-vdso32-y)
+obj-vdso32 = sigtramp.o gettimeofday.o datapage.o cacheflush.o note.o getcpu.o
 
 # Build rules
 
diff --git a/arch/powerpc/kernel/vdso32/getcpu.S b/arch/powerpc/kernel/vdso32/getcpu.S
index 63e914539e1a..90b39af14383 100644
--- a/arch/powerpc/kernel/vdso32/getcpu.S
+++ b/arch/powerpc/kernel/vdso32/getcpu.S
@@ -15,6 +15,7 @@
  * int __kernel_getcpu(unsigned *cpu, unsigned *node);
  *
  */
+#if defined(CONFIG_PPC64)
 V_FUNCTION_BEGIN(__kernel_getcpu)
   .cfi_startproc
 	mfspr	r5,SPRN_SPRG_VDSO_READ
@@ -31,3 +32,19 @@ V_FUNCTION_BEGIN(__kernel_getcpu)
 	blr
   .cfi_endproc
 V_FUNCTION_END(__kernel_getcpu)
+#elif !defined(CONFIG_SMP)
+V_FUNCTION_BEGIN(__kernel_getcpu)
+  .cfi_startproc
+	cmpwi	cr0, r3, 0
+	cmpwi	cr1, r4, 0
+	li	r5, 0
+	beq	cr0, 1f
+	stw	r5, 0(r3)
+1:	li	r3, 0			/* always success */
+	crclr	cr0*4+so
+	beqlr	cr1
+	stw	r5, 0(r4)
+	blr
+  .cfi_endproc
+V_FUNCTION_END(__kernel_getcpu)
+#endif
diff --git a/arch/powerpc/kernel/vdso32/vdso32.lds.S b/arch/powerpc/kernel/vdso32/vdso32.lds.S
index 00c025ba4a92..5206c2eb2a1d 100644
--- a/arch/powerpc/kernel/vdso32/vdso32.lds.S
+++ b/arch/powerpc/kernel/vdso32/vdso32.lds.S
@@ -155,7 +155,7 @@ VERSION
 		__kernel_sync_dicache_p5;
 		__kernel_sigtramp32;
 		__kernel_sigtramp_rt32;
-#ifdef CONFIG_PPC64
+#if defined(CONFIG_PPC64) || !defined(CONFIG_SMP)
 		__kernel_getcpu;
 #endif
 
-- 
2.13.3

