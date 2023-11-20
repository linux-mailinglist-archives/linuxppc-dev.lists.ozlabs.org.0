Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED057F21B7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Nov 2023 00:55:30 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=guedQSHx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SZ4Bm2Swxz3ckp
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Nov 2023 10:55:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=guedQSHx;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SZ49v74hpz30fM
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Nov 2023 10:54:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1700524483;
	bh=j6X3QRN6KdQb6V7Rpw95CieB+Vyt1a13PFiNYbjDqIc=;
	h=From:To:Cc:Subject:Date:From;
	b=guedQSHxo+Swt7kZ8tOoUi8bL83LkgtpCdwvron+hgS0k2OUKJCPL6LDG5TYLJTF2
	 vJfYaR2ePhZjaPeRz9Uv3XZf5kqNZBMdwdSf4qrg3fc/7iyG7xW7NfRMioG6kYf8Nt
	 FBrChSPL9sM0Jq8/RTmdLvRSYzcU+26oB7nqEO6HwDTN9qea3KHbik2FzEgxfXX2YR
	 gVGufn28LJNzJ3ArSqEs6lSOl0qmRC4uRDCgpgETK/xnu9w0kxJQLJNVQq2B3ilkf5
	 l8unu+6KYYrCoT+LH6R9Tr145JJ61aQ9ruLLCY5Rrucy273P9ot5jbzMZrIO5ayYd0
	 6XAP1bizmbnSA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SZ49v66NXz4x1p;
	Tue, 21 Nov 2023 10:54:43 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] powerpc/lib: Avoid array bounds warnings in vec ops
Date: Tue, 21 Nov 2023 10:54:36 +1100
Message-ID: <20231120235436.1569255-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: gustavo@embeddedor.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Building with GCC 13 (which has -array-bounds enabled) there are several
warnings in sstep.c along the lines of:

  In function ‘do_byte_reverse’,
      inlined from ‘do_vec_load’ at arch/powerpc/lib/sstep.c:691:3,
      inlined from ‘emulate_loadstore’ at arch/powerpc/lib/sstep.c:3439:9:
  arch/powerpc/lib/sstep.c:289:23: error: array subscript 2 is outside array bounds of ‘u8[16]’ {aka ‘unsigned char[16]’} [-Werror=array-bounds=]
    289 |                 up[2] = byterev_8(up[1]);
        |                 ~~~~~~^~~~~~~~~~~~~~~~~~
  arch/powerpc/lib/sstep.c: In function ‘emulate_loadstore’:
  arch/powerpc/lib/sstep.c:681:11: note: at offset 16 into object ‘u’ of size 16
    681 |         } u = {};
        |           ^

do_byte_reverse() supports a size up to 32 bytes, but in these cases the
caller is only passing a 16 byte buffer. In practice there is no bug,
do_vec_load() is only called from the LOAD_VMX case in emulate_loadstore().
That in turn is only reached when analyse_instr() recognises VMX ops,
and in all cases the size is no greater than 16:

  $ git grep -w LOAD_VMX arch/powerpc/lib/sstep.c
  arch/powerpc/lib/sstep.c:                        op->type = MKOP(LOAD_VMX, 0, 1);
  arch/powerpc/lib/sstep.c:                        op->type = MKOP(LOAD_VMX, 0, 2);
  arch/powerpc/lib/sstep.c:                        op->type = MKOP(LOAD_VMX, 0, 4);
  arch/powerpc/lib/sstep.c:                        op->type = MKOP(LOAD_VMX, 0, 16);

Similarly for do_vec_store().

Although the warning is incorrect, the code would be safer if it clamped
the size from the caller to the known size of the buffer. Do that using
min_t().

Reported-by: Bagas Sanjaya <bagasdotme@gmail.com>
Reported-by: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Reported-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/lib/sstep.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
index a4ab8625061a..a13f05cfc7db 100644
--- a/arch/powerpc/lib/sstep.c
+++ b/arch/powerpc/lib/sstep.c
@@ -688,7 +688,7 @@ static nokprobe_inline int do_vec_load(int rn, unsigned long ea,
 	if (err)
 		return err;
 	if (unlikely(cross_endian))
-		do_byte_reverse(&u.b[ea & 0xf], size);
+		do_byte_reverse(&u.b[ea & 0xf], min_t(size_t, size, sizeof(u)));
 	preempt_disable();
 	if (regs->msr & MSR_VEC)
 		put_vr(rn, &u.v);
@@ -719,7 +719,7 @@ static nokprobe_inline int do_vec_store(int rn, unsigned long ea,
 		u.v = current->thread.vr_state.vr[rn];
 	preempt_enable();
 	if (unlikely(cross_endian))
-		do_byte_reverse(&u.b[ea & 0xf], size);
+		do_byte_reverse(&u.b[ea & 0xf], min_t(size_t, size, sizeof(u)));
 	return copy_mem_out(&u.b[ea & 0xf], ea, size, regs);
 }
 #endif /* CONFIG_ALTIVEC */
-- 
2.41.0

