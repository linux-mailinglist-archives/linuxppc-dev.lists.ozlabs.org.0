Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1578166D78C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Jan 2023 09:08:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nx1kD6tj4z3fBy
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Jan 2023 19:08:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gondor.apana.org.au (client-ip=216.24.177.18; helo=formenos.hmeau.com; envelope-from=herbert@gondor.apana.org.au; receiver=<UNKNOWN>)
X-Greylist: delayed 2504 seconds by postgrey-1.36 at boromir; Tue, 17 Jan 2023 19:08:22 AEDT
Received: from formenos.hmeau.com (helcar.hmeau.com [216.24.177.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nx1jf0VR6z3bSw
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Jan 2023 19:08:22 +1100 (AEDT)
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
	id 1pHgMS-000o0z-Ry; Tue, 17 Jan 2023 15:26:25 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Tue, 17 Jan 2023 15:26:24 +0800
Date: Tue, 17 Jan 2023 15:26:24 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: crypto: p10-aes-gcm - Add asm markings necessary for kernel code
Message-ID: <Y8ZNoBSX5P0ieJ3t@gondor.apana.org.au>
References: <20230117144747.37115c52@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230117144747.37115c52@canb.auug.org.au>
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Danny Tsen <dtsen@linux.ibm.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Crypto List <linux-crypto@vger.kernel.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jan 17, 2023 at 02:47:47PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the crypto tree, today's linux-next build (powerpc
> pseries_le_defconfig) failed like this:
> 
> arch/powerpc/crypto/p10_aes_gcm.o: warning: objtool: .text+0x884: unannotated intra-function call
> arch/powerpc/crypto/aesp8-ppc.o: warning: objtool: aes_p8_set_encrypt_key+0x44: unannotated intra-function call
> ld: arch/powerpc/crypto/p10_aes_gcm.o: ABI version 1 is not compatible with ABI version 2 output
> ld: failed to merge target specific data of file arch/powerpc/crypto/p10_aes_gcm.o
> 
> Caused by commit
> 
>   ca68a96c37eb ("crypto: p10-aes-gcm - An accelerated AES/GCM stitched implementation")
> 
> I have applied the following hack for today.

Thanks Stephen, I'm going to update the previous fix as follows:

---8<---
_GLOBAL is needed instead of .global on Linux in assembly code.

The explicit abiversion setting is removed as the code should
with either ABI.

Mark local functions to avoid objdump warnings.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Fixes: cc40379b6e19 ("crypto: p10-aes-gcm - Glue code for AES/GCM stitched implementation")
Fixes: 3b47eccaaff4 ("crypto: p10-aes-gcm - Supporting functions for AES")
Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>

diff --git a/arch/powerpc/crypto/aesp8-ppc.pl b/arch/powerpc/crypto/aesp8-ppc.pl
index 50a0a18f35da..cdbcf6e13efc 100644
--- a/arch/powerpc/crypto/aesp8-ppc.pl
+++ b/arch/powerpc/crypto/aesp8-ppc.pl
@@ -121,6 +121,22 @@ my ($inp,$bits,$out,$ptr,$cnt,$rounds)=map("r$_",(3..8));
 my ($zero,$in0,$in1,$key,$rcon,$mask,$tmp)=map("v$_",(0..6));
 my ($stage,$outperm,$outmask,$outhead,$outtail)=map("v$_",(7..11));
 
+sub declare_function() {
+	my ($name) = @_;
+	if ($kernel) {
+		$code .= "SYM_FUNC_START_LOCAL($name)\n";
+	} else {
+		$code .= "L$name:\n";
+	}
+}
+
+sub end_function() {
+	my ($name) = @_;
+	if ($kernel) {
+		$code .= "SYM_FUNC_END($name)\n";
+	}
+}
+
 $code.=<<___;
 .machine	"any"
 
@@ -132,13 +148,18 @@ rcon:
 .long	0x1b000000, 0x1b000000, 0x1b000000, 0x1b000000	?rev
 .long	0x0d0e0f0c, 0x0d0e0f0c, 0x0d0e0f0c, 0x0d0e0f0c	?rev
 .long	0,0,0,0						?asis
-Lconsts:
+___
+&declare_function("consts");
+$code.=<<___;
 	mflr	r0
 	bcl	20,31,\$+4
 	mflr	$ptr	 #vvvvv "distance between . and rcon
 	addi	$ptr,$ptr,-0x48
 	mtlr	r0
 	blr
+___
+&end_function("consts");
+$code.=<<___;
 	.long	0
 	.byte	0,12,0x14,0,0,0,0,0
 .asciz	"AES for PowerISA 2.07, CRYPTOGAMS by <appro\@openssl.org>"
diff --git a/arch/powerpc/crypto/p10_aes_gcm.S b/arch/powerpc/crypto/p10_aes_gcm.S
index 2306ad7c5e36..153388733eae 100644
--- a/arch/powerpc/crypto/p10_aes_gcm.S
+++ b/arch/powerpc/crypto/p10_aes_gcm.S
@@ -38,8 +38,10 @@
  # ===================================================================================
  #
 
+#include <asm/ppc_asm.h>
+#include <linux/linkage.h>
+
 .machine        "any"
-.abiversion     1
 .text
 
  # 4x loops
@@ -569,9 +571,7 @@ ppc_aes_gcm_ghash:
  #    rounds is at offset 240 in rk
  #    Xi is at 0 in gcm_table (Xip).
  #
-.global aes_p10_gcm_encrypt
-.align 5
-aes_p10_gcm_encrypt:
+_GLOBAL(aes_p10_gcm_encrypt)
 
 	SAVE_REGS
 
@@ -989,7 +989,7 @@ Normal_block:
  # Handle multiple partial blocks for encrypt and decrypt
  #   operations.
  #
-Do_partial_block:
+SYM_FUNC_START_LOCAL(Do_partial_block)
 	add	17, 15, 5
 	cmpdi	17, 16
 	bgt	Big_block
@@ -1075,6 +1075,7 @@ Save_partial:
 
 Partial_done:
 	blr
+SYM_FUNC_END(Do_partial_block)
 
  #
  # Write partial block
@@ -1082,7 +1083,7 @@ Partial_done:
  # r12 - remaining bytes
  # v15 - partial input data
  #
-Write_partial_block:
+SYM_FUNC_START_LOCAL(Write_partial_block)
 	li		10, 192
 	stxvb16x	15+32, 10, 1		# last block
 
@@ -1097,6 +1098,7 @@ Write_last_byte:
 	stbu		14, 1(10)
         bdnz		Write_last_byte
 	blr
+SYM_FUNC_END(Write_partial_block)
 
 aes_gcm_out:
 	# out = state
@@ -1109,9 +1111,7 @@ aes_gcm_out:
  #
  # 8x Decrypt
  #
-.global aes_p10_gcm_decrypt
-.align 5
-aes_p10_gcm_decrypt:
+_GLOBAL(aes_p10_gcm_decrypt)
 
 	SAVE_REGS
 
diff --git a/arch/powerpc/crypto/ppc-xlate.pl b/arch/powerpc/crypto/ppc-xlate.pl
index 23cca703ce29..d1dcb914858c 100644
--- a/arch/powerpc/crypto/ppc-xlate.pl
+++ b/arch/powerpc/crypto/ppc-xlate.pl
@@ -198,6 +198,7 @@ my $mtsle	= sub {
 };
 
 print "#include <asm/ppc_asm.h>\n" if $flavour =~ /linux/;
+print "#include <linux/linkage.h>\n" if $flavour =~ /linux/;
 
 while($line=<>) {
 
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
