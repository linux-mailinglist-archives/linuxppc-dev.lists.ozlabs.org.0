Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5014455509A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jun 2022 18:01:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LSp5f24fvz3gLQ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jun 2022 02:01:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.189; helo=szxga03-in.huawei.com; envelope-from=chenzhongjin@huawei.com; receiver=<UNKNOWN>)
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LSnw95dwxz3bw7
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jun 2022 01:52:57 +1000 (AEST)
Received: from dggpemm500020.china.huawei.com (unknown [172.30.72.55])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4LSnvK21rJzDs3V;
	Wed, 22 Jun 2022 23:52:13 +0800 (CST)
Received: from dggpemm500013.china.huawei.com (7.185.36.172) by
 dggpemm500020.china.huawei.com (7.185.36.49) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 22 Jun 2022 23:52:46 +0800
Received: from ubuntu1804.huawei.com (10.67.175.36) by
 dggpemm500013.china.huawei.com (7.185.36.172) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 22 Jun 2022 23:52:46 +0800
From: Chen Zhongjin <chenzhongjin@huawei.com>
To: <linux-kernel@vger.kernel.org>, <linux-arch@vger.kernel.org>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kbuild@vger.kernel.org>, <live-patching@vger.kernel.org>
Subject: [PATCH v5 25/33] arm64: crypto: Mark constant as data
Date: Wed, 22 Jun 2022 23:49:12 +0800
Message-ID: <20220622154920.95075-26-chenzhongjin@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220622154920.95075-1-chenzhongjin@huawei.com>
References: <20220622154920.95075-1-chenzhongjin@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.175.36]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500013.china.huawei.com (7.185.36.172)
X-CFilter-Loop: Reflected
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
Cc: mark.rutland@arm.com, madvenka@linux.microsoft.com, michal.lkml@markovi.net, pasha.tatashin@soleen.com, peterz@infradead.org, catalin.marinas@arm.com, masahiroy@kernel.org, ndesaulniers@google.com, chenzhongjin@huawei.com, rmk+kernel@armlinux.org.uk, broonie@kernel.org, will@kernel.org, jpoimboe@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Use SYM_DATA_* macros to annotate data bytes in the middle of .text
sections.

For local symbols, ".L" prefix needs to be dropped as the assembler
exclude the symbols from the .o symbol table, making objtool unable
to see them.

Signed-off-by: Julien Thierry <jthierry@redhat.com>
Signed-off-by: Chen Zhongjin <chenzhongjin@huawei.com>
---
 arch/arm64/crypto/aes-neonbs-core.S | 14 +++++++-------
 arch/arm64/crypto/poly1305-armv8.pl |  4 ++++
 arch/arm64/crypto/sha512-armv8.pl   | 24 ++++++++++++++----------
 3 files changed, 25 insertions(+), 17 deletions(-)

diff --git a/arch/arm64/crypto/aes-neonbs-core.S b/arch/arm64/crypto/aes-neonbs-core.S
index d427f4556b6e..fa161d1bf264 100644
--- a/arch/arm64/crypto/aes-neonbs-core.S
+++ b/arch/arm64/crypto/aes-neonbs-core.S
@@ -367,15 +367,15 @@
 
 
 	.align		6
-M0:	.octa		0x0004080c0105090d02060a0e03070b0f
+SYM_DATA_LOCAL(M0,	.octa		0x0004080c0105090d02060a0e03070b0f)
 
-M0SR:	.octa		0x0004080c05090d010a0e02060f03070b
-SR:	.octa		0x0f0e0d0c0a09080b0504070600030201
-SRM0:	.octa		0x01060b0c0207080d0304090e00050a0f
+SYM_DATA_LOCAL(M0SR,	.octa		0x0004080c05090d010a0e02060f03070b)
+SYM_DATA_LOCAL(SR,	.octa		0x0f0e0d0c0a09080b0504070600030201)
+SYM_DATA_LOCAL(SRM0,	.octa		0x01060b0c0207080d0304090e00050a0f)
 
-M0ISR:	.octa		0x0004080c0d0105090a0e0206070b0f03
-ISR:	.octa		0x0f0e0d0c080b0a090504070602010003
-ISRM0:	.octa		0x0306090c00070a0d01040b0e0205080f
+SYM_DATA_LOCAL(M0ISR,	.octa		0x0004080c0d0105090a0e0206070b0f03)
+SYM_DATA_LOCAL(ISR,	.octa		0x0f0e0d0c080b0a090504070602010003)
+SYM_DATA_LOCAL(ISRM0,	.octa		0x0306090c00070a0d01040b0e0205080f)
 
 	/*
 	 * void aesbs_convert_key(u8 out[], u32 const rk[], int rounds)
diff --git a/arch/arm64/crypto/poly1305-armv8.pl b/arch/arm64/crypto/poly1305-armv8.pl
index cbc980fb02e3..f460f33c127a 100644
--- a/arch/arm64/crypto/poly1305-armv8.pl
+++ b/arch/arm64/crypto/poly1305-armv8.pl
@@ -47,6 +47,8 @@ my ($mac,$nonce)=($inp,$len);
 my ($h0,$h1,$h2,$r0,$r1,$s1,$t0,$t1,$d0,$d1,$d2) = map("x$_",(4..14));
 
 $code.=<<___;
+#include <linux/linkage.h>
+
 #ifndef __KERNEL__
 # include "arm_arch.h"
 .extern	OPENSSL_armcap_P
@@ -888,8 +890,10 @@ poly1305_blocks_neon:
 .align	5
 .Lzeros:
 .long	0,0,0,0,0,0,0,0
+SYM_DATA_START_LOCAL(POLY1305_str)
 .asciz	"Poly1305 for ARMv8, CRYPTOGAMS by \@dot-asm"
 .align	2
+SYM_DATA_END(POLY1305_str)
 #if !defined(__KERNEL__) && !defined(_WIN64)
 .comm	OPENSSL_armcap_P,4,4
 .hidden	OPENSSL_armcap_P
diff --git a/arch/arm64/crypto/sha512-armv8.pl b/arch/arm64/crypto/sha512-armv8.pl
index 35ec9ae99fe1..1882c4110026 100644
--- a/arch/arm64/crypto/sha512-armv8.pl
+++ b/arch/arm64/crypto/sha512-armv8.pl
@@ -193,6 +193,8 @@ ___
 }
 
 $code.=<<___;
+#include <linux/linkage.h>
+
 #ifndef	__KERNEL__
 # include "arm_arch.h"
 #endif
@@ -208,11 +210,11 @@ ___
 $code.=<<___	if ($SZ==4);
 #ifndef	__KERNEL__
 # ifdef	__ILP32__
-	ldrsw	x16,.LOPENSSL_armcap_P
+	ldrsw	x16,OPENSSL_armcap_P_rel
 # else
-	ldr	x16,.LOPENSSL_armcap_P
+	ldr	x16,OPENSSL_armcap_P_rel
 # endif
-	adr	x17,.LOPENSSL_armcap_P
+	adr	x17,OPENSSL_armcap_P_rel
 	add	x16,x16,x17
 	ldr	w16,[x16]
 	tst	w16,#ARMV8_SHA256
@@ -237,7 +239,7 @@ $code.=<<___;
 	ldp	$E,$F,[$ctx,#4*$SZ]
 	add	$num,$inp,$num,lsl#`log(16*$SZ)/log(2)`	// end of input
 	ldp	$G,$H,[$ctx,#6*$SZ]
-	adr	$Ktbl,.LK$BITS
+	adr	$Ktbl,K$BITS
 	stp	$ctx,$num,[x29,#96]
 
 .Loop:
@@ -287,8 +289,7 @@ $code.=<<___;
 .size	$func,.-$func
 
 .align	6
-.type	.LK$BITS,%object
-.LK$BITS:
+SYM_DATA_START_LOCAL(K$BITS)
 ___
 $code.=<<___ if ($SZ==8);
 	.quad	0x428a2f98d728ae22,0x7137449123ef65cd
@@ -353,18 +354,21 @@ $code.=<<___ if ($SZ==4);
 	.long	0	//terminator
 ___
 $code.=<<___;
-.size	.LK$BITS,.-.LK$BITS
+SYM_DATA_END(K$BITS)
 #ifndef	__KERNEL__
 .align	3
-.LOPENSSL_armcap_P:
+SYM_DATA_START_LOCAL(OPENSSL_armcap_P_rel)
 # ifdef	__ILP32__
 	.long	OPENSSL_armcap_P-.
 # else
 	.quad	OPENSSL_armcap_P-.
 # endif
+SYM_DATA_END(OPENSSL_armcap_P_rel)
 #endif
+SYM_DATA_START_LOCAL(OPENSSL_str)
 .asciz	"SHA$BITS block transform for ARMv8, CRYPTOGAMS by <appro\@openssl.org>"
 .align	2
+SYM_DATA_END(OPENSSL_str)
 ___
 
 if ($SZ==4) {
@@ -385,7 +389,7 @@ sha256_block_armv8:
 	add		x29,sp,#0
 
 	ld1.32		{$ABCD,$EFGH},[$ctx]
-	adr		$Ktbl,.LK256
+	adr		$Ktbl,K256
 
 .Loop_hw:
 	ld1		{@MSG[0]-@MSG[3]},[$inp],#64
@@ -648,7 +652,7 @@ sha256_block_neon:
 	mov	x29, sp
 	sub	sp,sp,#16*4
 
-	adr	$Ktbl,.LK256
+	adr	$Ktbl,K256
 	add	$num,$inp,$num,lsl#6	// len to point at the end of inp
 
 	ld1.8	{@X[0]},[$inp], #16
-- 
2.17.1

