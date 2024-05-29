Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id E60308D3683
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 May 2024 14:37:03 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=d6VD0YQQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vq7zD5Sbjz87Tj
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 May 2024 22:31:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=d6VD0YQQ;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vq7yS4VFHz7B46
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 May 2024 22:30:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1716985834;
	bh=ZWHbpMl1iBdOEctt+/E4HavsyvoLIUt1k9kkxhHeE/0=;
	h=From:To:Subject:Date:From;
	b=d6VD0YQQb4RmUG+ClvZJ/CCMqQ/KMG1Z1LYED9pAL6XJSeCo65aTwgsNpYBRckFmf
	 IlZtbdPIKscCus8pDn0zd4vCiJtFouhmGfbedB9vHf59Fkg16q3xjEV7dNe63sfMfe
	 q/kzrN746VhdIYHUd0XZnr50AKDCh8/D/xqu6Ql/bLU7EGhY/4cWqT6cA8TWi66VJU
	 EsV5Qz0AcK5HWDYrbFGjwWfFZGg1Xstgo+G0cZqni/zd5+sqb1CDzQxkNXjXTBV07u
	 rKaw5bArbALsxnuA/vGIBcNHHHM6hLJb1ktbrecxpwweVi9TEj9VieHZSBKfj+JafV
	 llKrlNKsf6HHg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Vq7yL5wqyz4wyS;
	Wed, 29 May 2024 22:30:34 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH v2 1/2] powerpc/uaccess: Fix build errors seen with GCC 13/14
Date: Wed, 29 May 2024 22:30:28 +1000
Message-ID: <20240529123029.146953-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Building ppc64le_defconfig with GCC 14 fails with assembler errors:

    CC      fs/readdir.o
  /tmp/ccdQn0mD.s: Assembler messages:
  /tmp/ccdQn0mD.s:212: Error: operand out of domain (18 is not a multiple of 4)
  /tmp/ccdQn0mD.s:226: Error: operand out of domain (18 is not a multiple of 4)
  ... [6 lines]
  /tmp/ccdQn0mD.s:1699: Error: operand out of domain (18 is not a multiple of 4)

A snippet of the asm shows:

  # ../fs/readdir.c:210:         unsafe_copy_dirent_name(dirent->d_name, name, namlen, efault_end);
         ld 9,0(29)       # MEM[(u64 *)name_38(D) + _88 * 1], MEM[(u64 *)name_38(D) + _88 * 1]
  # 210 "../fs/readdir.c" 1
         1:      std 9,18(8)     # put_user       # *__pus_addr_52, MEM[(u64 *)name_38(D) + _88 * 1]

The 'std' instruction requires a 4-byte aligned displacement because
it is a DS-form instruction, and as the assembler says, 18 is not a
multiple of 4.

A similar error is seen with GCC 13 and CONFIG_UBSAN_SIGNED_WRAP=y.

The fix is to change the constraint on the memory operand to put_user(),
from "m" which is a general memory reference to "YZ".

The "Z" constraint is documented in the GCC manual PowerPC machine
constraints, and specifies a "memory operand accessed with indexed or
indirect addressing". "Y" is not documented in the manual but specifies
a "memory operand for a DS-form instruction". Using both allows the
compiler to generate a DS-form "std" or X-form "stdx" as appropriate.

The change has to be conditional on CONFIG_PPC_KERNEL_PREFIXED because
the "Y" constraint does not guarantee 4-byte alignment when prefixed
instructions are enabled.

Unfortunately clang doesn't support the "Y" constraint so that has to be
behind an ifdef.

Although the build error is only seen with GCC 13/14, that appears
to just be luck. The constraint has been incorrect since it was first
added.

Fixes: c20beffeec3c ("powerpc/uaccess: Use flexible addressing with __put_user()/__get_user()")
Cc: stable@vger.kernel.org # v5.10+
Suggested-by: Kewen Lin <linkw@gcc.gnu.org>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/include/asm/uaccess.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

v2: Update changelog to mention breakage with GCC 13 and UBSAN.

diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
index de10437fd206..4cba724c8899 100644
--- a/arch/powerpc/include/asm/uaccess.h
+++ b/arch/powerpc/include/asm/uaccess.h
@@ -92,9 +92,25 @@ __pu_failed:							\
 		: label)
 #endif
 
+#ifdef CONFIG_CC_IS_CLANG
+#define DS_FORM_CONSTRAINT "Z<>"
+#else
+#define DS_FORM_CONSTRAINT "YZ<>"
+#endif
+
 #ifdef __powerpc64__
+#ifdef CONFIG_PPC_KERNEL_PREFIXED
 #define __put_user_asm2_goto(x, ptr, label)			\
 	__put_user_asm_goto(x, ptr, label, "std")
+#else
+#define __put_user_asm2_goto(x, addr, label)			\
+	asm goto ("1: std%U1%X1 %0,%1	# put_user\n"		\
+		EX_TABLE(1b, %l2)				\
+		:						\
+		: "r" (x), DS_FORM_CONSTRAINT (*addr)		\
+		:						\
+		: label)
+#endif // CONFIG_PPC_KERNEL_PREFIXED
 #else /* __powerpc64__ */
 #define __put_user_asm2_goto(x, addr, label)			\
 	asm goto(					\
-- 
2.45.1

