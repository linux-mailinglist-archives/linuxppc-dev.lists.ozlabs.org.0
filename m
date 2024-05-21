Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id D0D1F8CAE7E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 May 2024 14:46:49 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=KZ5ZVNpZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VkDYL24f2z3gGX
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 May 2024 22:40:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=KZ5ZVNpZ;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VkDXc0mSPz3fp7
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 May 2024 22:39:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1716295183;
	bh=mppIXiXoLcuRe3+LxvWfWg1SEmVE0I7B3O6Xsc+0bdY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KZ5ZVNpZaNOGLdWzyODs9BFE4jk/VI+2f/zvHIKI5rUtGUzHQS1O/xZJBE9UiGH5j
	 UfgoFtnUQiLw2TZukPEWPxKuGquDS9+KawUxf1eEbIkgR0yP3VsVIai6AajPLt4pEY
	 uQBeioXc2aSD+GxIztlu7VZ+XTstpcHIrjC2BgGulOIhRKgoP+FnTg4ZRuQVil3ERx
	 wC9uox90ShYVHRlGqe24ExbttRML3FSqEz0nZrILJ/RJGJbkVjqj3SpUcsUd6IIMC5
	 DZ+DYO37JkeHSmtQlBNp5Ms8Wl0NpL1enP6MD9u6CVZhxBEzprvDNIzTY3tZYbBh4r
	 JAOmCA3ao3uCA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VkDXb1Q0Wz4wyQ;
	Tue, 21 May 2024 22:39:43 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 2/2] powerpc/uaccess: Use YZ asm constraint for ld
Date: Tue, 21 May 2024 22:39:19 +1000
Message-ID: <20240521123919.245886-2-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240521123919.245886-1-mpe@ellerman.id.au>
References: <20240521123919.245886-1-mpe@ellerman.id.au>
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
Cc: nathan@kernel.org, ndesaulniers@google.com, linkw@gcc.gnu.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The 'ld' instruction requires a 4-byte aligned displacement because it
is a DS-form instruction. But the "m" asm constraint doesn't enforce
that.

Add a special case of __get_user_asm2_goto() so that the "YZ" constraint
can be used for "ld".

The "Z" constraint is documented in the GCC manual PowerPC machine
constraints, and specifies a "memory operand accessed with indexed or
indirect addressing". "Y" is not documented in the manual but specifies
a "memory operand for a DS-form instruction". Using both allows the
compiler to generate a DS-form "ld" or X-form "ldx" as appropriate.

The change has to be conditional on CONFIG_PPC_KERNEL_PREFIXED because
the "Y" constraint does not guarantee 4-byte alignment when prefixed
instructions are enabled.

No build errors have been reported due to this, but the possibility is
there depending on compiler code generation decisions.

Fixes: c20beffeec3c ("powerpc/uaccess: Use flexible addressing with __put_user()/__get_user()")
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/include/asm/uaccess.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
index 4cba724c8899..fd594bf6c6a9 100644
--- a/arch/powerpc/include/asm/uaccess.h
+++ b/arch/powerpc/include/asm/uaccess.h
@@ -181,8 +181,19 @@ do {								\
 #endif
 
 #ifdef __powerpc64__
+#ifdef CONFIG_PPC_KERNEL_PREFIXED
 #define __get_user_asm2_goto(x, addr, label)			\
 	__get_user_asm_goto(x, addr, label, "ld")
+#else
+#define __get_user_asm2_goto(x, addr, label)			\
+	asm_goto_output(					\
+		"1:	ld%U1%X1 %0, %1	# get_user\n"		\
+		EX_TABLE(1b, %l2)				\
+		: "=r" (x)					\
+		: DS_FORM_CONSTRAINT (*addr)			\
+		:						\
+		: label)
+#endif // CONFIG_PPC_KERNEL_PREFIXED
 #else /* __powerpc64__ */
 #define __get_user_asm2_goto(x, addr, label)			\
 	asm_goto_output(					\
-- 
2.45.1

