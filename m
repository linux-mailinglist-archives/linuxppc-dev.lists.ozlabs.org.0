Return-Path: <linuxppc-dev+bounces-3640-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB489DF7E0
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Dec 2024 02:10:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y1m0S1FNPz2ywR;
	Mon,  2 Dec 2024 12:09:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733101784;
	cv=none; b=I/uxvphwVWDsZZtYS5eFnegaflB7ydVET541dsnNW4pAz1cVm7cp1Dz4sqC6RWGwmFREz9oAyN9mccO+wV/BFCBwJZjndmG15SmsCZtppZlOxYVKJ7dRsCgfzcJgtn0zsHjLcZAJ0We0ekZ/qRNPlDyUT+kAOGnbP6moujCZ+xNTpXIow7ntGJpT37OqYlwTGZQgJS6c/R8b7rQzfFTUQQBBJHLeTs0+Fp6Dgj1T1xH5htATzDARvnowagQQ00IwB0xKqUyFvqBdEQX/yHwMZ8UR9SXfCaGSFsgkrtjSg8yZ8xsC3Zw1k1NisiMHK/Xd8TeGWPakcQMePz0TYlnbSw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733101784; c=relaxed/relaxed;
	bh=98aAhony+oG7dxlmfuBhSzcm5NZAJPMsHXlN//Enqt0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cqTK8np4acfy2Ao5KYbHIOaLDqmU3DCS3QVjmqUqk8iHodZp7xJnPa1aeHy9TffOlthYuinJ7Skzspka3mB8Qp/Oj+9bincijzDR7WaBQSK1W2jFex1ld8mF6BqFD0NLzT49a6MB2bz1wINp20TOkrND5lfZAUnCJvx7FBozEjpgHG3yBoGwBtqLhY0lfSv1FigoatJkrQa+oJvY4RC3hY0bUwTWJPm+PIGw31HlB7lqGCpEMjm/Z7bvGtJFyQO1SHxeEsWNyXeA+Ko59xlBB/6IlMcJ5+o94OfyFmH5cIFP/35udGfaiEC7VbvMeKGXqaetesemjdFWt9Bit46QSA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sT/vap6R; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sT/vap6R;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y1m0M1W31z2ygY
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Dec 2024 12:09:37 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 574C2A40C1E;
	Mon,  2 Dec 2024 01:07:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10744C4CEDD;
	Mon,  2 Dec 2024 01:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733101775;
	bh=l+CLrwqJVSvfyOKygspLh9Mjv7UjhIJ0MHuliD+HqG4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sT/vap6RPh46beKww4TVJmC7hJ1nlRZguIaqKyI2L2sjnF0Q3JAc3a+fcPACVF2/X
	 iRozDD804ndJyynJIWjWRZIzKOt9C/DJBDJx47gyLFh90zPxPqnbPJuvp4mXi8JyMc
	 BnK15oWiSL6nTQLCyZJQcQ3FV2xAd1EmuWEWf2HlJlTXcKxbYF7eaMn8um5tGMH8EZ
	 ZgDWFM8jRXt9wVjpOLdPPWx5LIGYaF9jllwYz6HJ9TxsD81OfHbxgUGSBIybwHoCVH
	 u+ngQdT+SVxwSV3UYqtb1szMPTdg3TkLoyq2xjTRlHV0B9k0c/4X5zXiQUI5Tl1+g8
	 kCprWDCmk/mKA==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org,
	linux-ext4@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Ard Biesheuvel <ardb@kernel.org>
Subject: [PATCH v4 11/19] x86/crc32: update prototype for crc_pcl()
Date: Sun,  1 Dec 2024 17:08:36 -0800
Message-ID: <20241202010844.144356-12-ebiggers@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241202010844.144356-1-ebiggers@kernel.org>
References: <20241202010844.144356-1-ebiggers@kernel.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: Eric Biggers <ebiggers@google.com>

- Change the len parameter from unsigned int to size_t, so that the
  library function which takes a size_t can safely use this code.

- Rename to crc32c_x86_3way() which is much clearer.

- Move the crc parameter to the front, as this is the usual convention.

Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/x86/crypto/crc32c-intel_glue.c       |  7 ++-
 arch/x86/crypto/crc32c-pcl-intel-asm_64.S | 63 ++++++++++++-----------
 2 files changed, 35 insertions(+), 35 deletions(-)

diff --git a/arch/x86/crypto/crc32c-intel_glue.c b/arch/x86/crypto/crc32c-intel_glue.c
index 52c5d47ef5a1..603d159de400 100644
--- a/arch/x86/crypto/crc32c-intel_glue.c
+++ b/arch/x86/crypto/crc32c-intel_glue.c
@@ -39,12 +39,11 @@
  * size is >= 512 to account
  * for fpu state save/restore overhead.
  */
 #define CRC32C_PCL_BREAKEVEN	512
 
-asmlinkage unsigned int crc_pcl(const u8 *buffer, unsigned int len,
-				unsigned int crc_init);
+asmlinkage u32 crc32c_x86_3way(u32 crc, const u8 *buffer, size_t len);
 #endif /* CONFIG_X86_64 */
 
 static u32 crc32c_intel_le_hw_byte(u32 crc, unsigned char const *data, size_t length)
 {
 	while (length--) {
@@ -157,11 +156,11 @@ static int crc32c_pcl_intel_update(struct shash_desc *desc, const u8 *data,
 	 * use faster PCL version if datasize is large enough to
 	 * overcome kernel fpu state save/restore overhead
 	 */
 	if (len >= CRC32C_PCL_BREAKEVEN && crypto_simd_usable()) {
 		kernel_fpu_begin();
-		*crcp = crc_pcl(data, len, *crcp);
+		*crcp = crc32c_x86_3way(*crcp, data, len);
 		kernel_fpu_end();
 	} else
 		*crcp = crc32c_intel_le_hw(*crcp, data, len);
 	return 0;
 }
@@ -169,11 +168,11 @@ static int crc32c_pcl_intel_update(struct shash_desc *desc, const u8 *data,
 static int __crc32c_pcl_intel_finup(u32 *crcp, const u8 *data, unsigned int len,
 				u8 *out)
 {
 	if (len >= CRC32C_PCL_BREAKEVEN && crypto_simd_usable()) {
 		kernel_fpu_begin();
-		*(__le32 *)out = ~cpu_to_le32(crc_pcl(data, len, *crcp));
+		*(__le32 *)out = ~cpu_to_le32(crc32c_x86_3way(*crcp, data, len));
 		kernel_fpu_end();
 	} else
 		*(__le32 *)out =
 			~cpu_to_le32(crc32c_intel_le_hw(*crcp, data, len));
 	return 0;
diff --git a/arch/x86/crypto/crc32c-pcl-intel-asm_64.S b/arch/x86/crypto/crc32c-pcl-intel-asm_64.S
index 752812bc4991..9b8770503bbc 100644
--- a/arch/x86/crypto/crc32c-pcl-intel-asm_64.S
+++ b/arch/x86/crypto/crc32c-pcl-intel-asm_64.S
@@ -50,19 +50,20 @@
 
 # Define threshold below which buffers are considered "small" and routed to
 # regular CRC code that does not interleave the CRC instructions.
 #define SMALL_SIZE 200
 
-# unsigned int crc_pcl(const u8 *buffer, unsigned int len, unsigned int crc_init);
+# u32 crc32c_x86_3way(u32 crc, const u8 *buffer, size_t len);
 
 .text
-SYM_FUNC_START(crc_pcl)
-#define    bufp		  %rdi
-#define    bufp_d	  %edi
-#define    len		  %esi
-#define    crc_init	  %edx
-#define    crc_init_q	  %rdx
+SYM_FUNC_START(crc32c_x86_3way)
+#define    crc0		  %edi
+#define    crc0_q	  %rdi
+#define    bufp		  %rsi
+#define    bufp_d	  %esi
+#define    len		  %rdx
+#define    len_dw	  %edx
 #define    n_misaligned	  %ecx /* overlaps chunk_bytes! */
 #define    n_misaligned_q %rcx
 #define    chunk_bytes	  %ecx /* overlaps n_misaligned! */
 #define    chunk_bytes_q  %rcx
 #define    crc1		  %r8
@@ -83,13 +84,13 @@ SYM_FUNC_START(crc_pcl)
 	# Process 1 <= n_misaligned <= 7 bytes individually in order to align
 	# the remaining data to an 8-byte boundary.
 .Ldo_align:
 	movq	(bufp), %rax
 	add	n_misaligned_q, bufp
-	sub	n_misaligned, len
+	sub	n_misaligned_q, len
 .Lalign_loop:
-	crc32b	%al, crc_init		# compute crc32 of 1-byte
+	crc32b	%al, crc0		# compute crc32 of 1-byte
 	shr	$8, %rax		# get next byte
 	dec	n_misaligned
 	jne     .Lalign_loop
 .Laligned:
 
@@ -100,11 +101,11 @@ SYM_FUNC_START(crc_pcl)
 	cmp	$128*24, len
 	jae     .Lfull_block
 
 .Lpartial_block:
 	# Compute floor(len / 24) to get num qwords to process from each lane.
-	imul	$2731, len, %eax	# 2731 = ceil(2^16 / 24)
+	imul	$2731, len_dw, %eax	# 2731 = ceil(2^16 / 24)
 	shr	$16, %eax
 	jmp	.Lcrc_3lanes
 
 .Lfull_block:
 	# Processing 128 qwords from each lane.
@@ -123,20 +124,20 @@ SYM_FUNC_START(crc_pcl)
 	jl	.Lcrc_3lanes_4x_done
 
 	# Unroll the loop by a factor of 4 to reduce the overhead of the loop
 	# bookkeeping instructions, which can compete with crc32q for the ALUs.
 .Lcrc_3lanes_4x_loop:
-	crc32q	(bufp), crc_init_q
+	crc32q	(bufp), crc0_q
 	crc32q	(bufp,chunk_bytes_q), crc1
 	crc32q	(bufp,chunk_bytes_q,2), crc2
-	crc32q	8(bufp), crc_init_q
+	crc32q	8(bufp), crc0_q
 	crc32q	8(bufp,chunk_bytes_q), crc1
 	crc32q	8(bufp,chunk_bytes_q,2), crc2
-	crc32q	16(bufp), crc_init_q
+	crc32q	16(bufp), crc0_q
 	crc32q	16(bufp,chunk_bytes_q), crc1
 	crc32q	16(bufp,chunk_bytes_q,2), crc2
-	crc32q	24(bufp), crc_init_q
+	crc32q	24(bufp), crc0_q
 	crc32q	24(bufp,chunk_bytes_q), crc1
 	crc32q	24(bufp,chunk_bytes_q,2), crc2
 	add	$32, bufp
 	sub	$4, %eax
 	jge	.Lcrc_3lanes_4x_loop
@@ -144,42 +145,42 @@ SYM_FUNC_START(crc_pcl)
 .Lcrc_3lanes_4x_done:
 	add	$4, %eax
 	jz	.Lcrc_3lanes_last_qword
 
 .Lcrc_3lanes_1x_loop:
-	crc32q	(bufp), crc_init_q
+	crc32q	(bufp), crc0_q
 	crc32q	(bufp,chunk_bytes_q), crc1
 	crc32q	(bufp,chunk_bytes_q,2), crc2
 	add	$8, bufp
 	dec	%eax
 	jnz	.Lcrc_3lanes_1x_loop
 
 .Lcrc_3lanes_last_qword:
-	crc32q	(bufp), crc_init_q
+	crc32q	(bufp), crc0_q
 	crc32q	(bufp,chunk_bytes_q), crc1
 # SKIP  crc32q	(bufp,chunk_bytes_q,2), crc2	; Don't do this one yet
 
 	################################################################
 	## 4) Combine three results:
 	################################################################
 
 	lea	(K_table-8)(%rip), %rax		# first entry is for idx 1
 	pmovzxdq (%rax,chunk_bytes_q), %xmm0	# 2 consts: K1:K2
 	lea	(chunk_bytes,chunk_bytes,2), %eax # chunk_bytes * 3
-	sub	%eax, len			# len -= chunk_bytes * 3
+	sub	%rax, len			# len -= chunk_bytes * 3
 
-	movq	crc_init_q, %xmm1		# CRC for block 1
+	movq	crc0_q, %xmm1			# CRC for block 1
 	pclmulqdq $0x00, %xmm0, %xmm1		# Multiply by K2
 
 	movq    crc1, %xmm2			# CRC for block 2
 	pclmulqdq $0x10, %xmm0, %xmm2		# Multiply by K1
 
 	pxor    %xmm2,%xmm1
 	movq    %xmm1, %rax
 	xor	(bufp,chunk_bytes_q,2), %rax
-	mov	crc2, crc_init_q
-	crc32	%rax, crc_init_q
+	mov	crc2, crc0_q
+	crc32	%rax, crc0_q
 	lea	8(bufp,chunk_bytes_q,2), bufp
 
 	################################################################
 	## 5) If more blocks remain, goto (2):
 	################################################################
@@ -191,38 +192,38 @@ SYM_FUNC_START(crc_pcl)
 
 	#######################################################################
 	## 6) Process any remainder without interleaving:
 	#######################################################################
 .Lsmall:
-	test	len, len
+	test	len_dw, len_dw
 	jz	.Ldone
-	mov	len, %eax
+	mov	len_dw, %eax
 	shr	$3, %eax
 	jz	.Ldo_dword
 .Ldo_qwords:
-	crc32q	(bufp), crc_init_q
+	crc32q	(bufp), crc0_q
 	add	$8, bufp
 	dec	%eax
 	jnz	.Ldo_qwords
 .Ldo_dword:
-	test	$4, len
+	test	$4, len_dw
 	jz	.Ldo_word
-	crc32l	(bufp), crc_init
+	crc32l	(bufp), crc0
 	add	$4, bufp
 .Ldo_word:
-	test	$2, len
+	test	$2, len_dw
 	jz	.Ldo_byte
-	crc32w	(bufp), crc_init
+	crc32w	(bufp), crc0
 	add	$2, bufp
 .Ldo_byte:
-	test	$1, len
+	test	$1, len_dw
 	jz	.Ldone
-	crc32b	(bufp), crc_init
+	crc32b	(bufp), crc0
 .Ldone:
-	mov	crc_init, %eax
+	mov	crc0, %eax
         RET
-SYM_FUNC_END(crc_pcl)
+SYM_FUNC_END(crc32c_x86_3way)
 
 .section	.rodata, "a", @progbits
 	################################################################
 	## PCLMULQDQ tables
 	## Table is 128 entries x 2 words (8 bytes) each
-- 
2.47.1


