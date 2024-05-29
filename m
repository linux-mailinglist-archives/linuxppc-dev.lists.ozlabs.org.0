Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTP id 720B78D3694
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 May 2024 14:41:49 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=gyvWNwyX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vq8012kCJz87s5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 May 2024 22:32:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=gyvWNwyX;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vq7yS3qHcz7B44
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 May 2024 22:30:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1716985835;
	bh=RF0cy/oMp4l303qpFBdSHaqIahuNEEuJJlJ9hneZaAk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=gyvWNwyXnYGMGaLoSi8QeURZXLlgnPM5XY1XvcmeYThXfbciZ0qjcwMm+NFBnusMb
	 TaGy5+O8BK7uGODGpPvPvs8ZeRGaVlToAHSmbxF1ko9t54rBZEJKi6MuhBYGUiRqme
	 9A56V8svlgQj64JNVgVcTfMjsbuevfR7+BB4J9qAlrsQew3/99mNdzgjtrelF2tp+M
	 lLPzBnJ9UxzohEqKzLHDVFoHelNRpBJrPtAldlBiAObx5zE/XB5iA1RdweLGTsbjEk
	 6LIv+5I6FbgPXPes16SrxyZCMyQj5azoadUvN1MbkTEm84goA+u5110cCfk8v1VPQF
	 hylT9EJd+qRqw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Vq7yM2bxpz4wyY;
	Wed, 29 May 2024 22:30:35 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH v2 2/2] powerpc/uaccess: Use YZ asm constraint for ld
Date: Wed, 29 May 2024 22:30:29 +1000
Message-ID: <20240529123029.146953-2-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240529123029.146953-1-mpe@ellerman.id.au>
References: <20240529123029.146953-1-mpe@ellerman.id.au>
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

v2: Unchanged.

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

