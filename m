Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D61FD908ACD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jun 2024 13:28:46 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=HDRqOyt2;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W0xqb4Hjcz3cXQ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jun 2024 21:28:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=HDRqOyt2;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W0xpY72MDz3cXT
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Jun 2024 21:27:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1718364463;
	bh=7gppcvHTZmlspy/+NJ1PKqP/0pbXM0SdZyYHmhfIhbs=;
	h=From:To:Cc:Subject:Date:From;
	b=HDRqOyt2f0/NjZKYa+A6N6ydYNbQyF4m2Jz+vx4ubWyiYPHmIzXuPxENs41+8OPaK
	 aqP3BBZeu4XkutieWyyfF3JUPML4HoxjEcFxiADaFA9ot/bZLOSBrCkFXliiELIgKh
	 bgzmHaP2JQcTS4OL2l1uKTuw3JOhj/aVfv8/TjdQiUiXYo9CvqRp3xG8DvOYxl9KnS
	 BYBbT/H1Yvtk55Ypl7DoTJwgGcheDWm/BIMN+v2AhzYxu0Ki+oREOklFaTmLxDrZBy
	 VvdRd2Ubw+26Zbluow66DwZc2ZIXC0h56JWB34LbixJGRNc4OmwVWIN8Za/j/FcaUT
	 Ul8VOd76XECUQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4W0xpR1Lx0z4wyw;
	Fri, 14 Jun 2024 21:27:43 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <stable@vger.kernel.org>
Subject: [PATCH v5.15] powerpc/uaccess: Fix build errors seen with GCC 13/14
Date: Fri, 14 Jun 2024 21:27:34 +1000
Message-ID: <20240614112734.3482854-1-mpe@ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

commit 2d43cc701b96f910f50915ac4c2a0cae5deb734c upstream.

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

Unfortunately clang doesn't support the "Y" constraint so that has to be
behind an ifdef.

Although the build error is only seen with GCC 13/14, that appears
to just be luck. The constraint has been incorrect since it was first
added.

Fixes: c20beffeec3c ("powerpc/uaccess: Use flexible addressing with __put_user()/__get_user()")
Suggested-by: Kewen Lin <linkw@gcc.gnu.org>
[mpe: Drop CONFIG_PPC_KERNEL_PREFIXED ifdef for backport]
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://msgid.link/20240529123029.146953-1-mpe@ellerman.id.au
---
 arch/powerpc/include/asm/uaccess.h | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
index b2680070d65d..6013a7fc74ba 100644
--- a/arch/powerpc/include/asm/uaccess.h
+++ b/arch/powerpc/include/asm/uaccess.h
@@ -90,9 +90,20 @@ __pu_failed:							\
 		:						\
 		: label)
 
+#ifdef CONFIG_CC_IS_CLANG
+#define DS_FORM_CONSTRAINT "Z<>"
+#else
+#define DS_FORM_CONSTRAINT "YZ<>"
+#endif
+
 #ifdef __powerpc64__
-#define __put_user_asm2_goto(x, ptr, label)			\
-	__put_user_asm_goto(x, ptr, label, "std")
+#define __put_user_asm2_goto(x, addr, label)			\
+	asm goto ("1: std%U1%X1 %0,%1	# put_user\n"		\
+		EX_TABLE(1b, %l2)				\
+		:						\
+		: "r" (x), DS_FORM_CONSTRAINT (*addr)		\
+		:						\
+		: label)
 #else /* __powerpc64__ */
 #define __put_user_asm2_goto(x, addr, label)			\
 	asm_volatile_goto(					\
-- 
2.45.1

