Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0772C1C8AFB
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 May 2020 14:35:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49HtGx65zXzDqDP
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 May 2020 22:35:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49HtCx3dcHzDqKL
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 May 2020 22:33:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=BuVdygpM; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 49HtCx1hW6z9sSc; Thu,  7 May 2020 22:33:17 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 49HtCx0rZWz9sSd; Thu,  7 May 2020 22:33:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1588854797;
 bh=ca6a/u5N4cA3QZ9qOqMaGcvR14S3dyR0eYW4mF33QqY=;
 h=From:To:Cc:Subject:Date:From;
 b=BuVdygpMBkmDdSHQXE0Ujc28DP97Ekoad0Bjm60gWK1pzWD7thsXUHuRzjkcRF+KD
 DLY5/YqLS1Cd9732tFIM0Y80kTQbNug0+m9aYbo7L4bVgsS26X8p8yayKfAxFSnUXf
 hsVNBz6clahMVqkX0wOntdECmSEl4UIKgIwEK8pZ3CE88z7QMe4DiqF5o4+ecbz7S2
 RgINSTfRbYPFAZD6bFESRYDgBhGZ4nhCscg3/aQVsWdmKKQ9IoFPz/LEr2EuIIKORf
 pYUg/7hMZzXRR3FjD7w/AiIFHKnLaPMLcw/VGFhD+fI22b7PHEN1VHZ5Jfoqb6SLNR
 f5VYxruyQm0Ig==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH] powerpc/uaccess: Don't use "m<>" constraint
Date: Thu,  7 May 2020 22:33:24 +1000
Message-Id: <20200507123324.2250024-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.25.1
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The "m<>" constraint breaks compilation with GCC 4.6.x era compilers.

The use of the constraint allows the compiler to use update-form
instructions, however in practice current compilers never generate
those forms for any of the current uses of __put_user_asm_goto().

We anticipate that GCC 4.6 will be declared unsupported for building
the kernel in the not too distant future. So for now just switch to
the "m" constraint.

Fixes: 334710b1496a ("powerpc/uaccess: Implement unsafe_put_user() using 'asm goto'")
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/include/asm/uaccess.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
index 62cc8d7640ec..164112007f54 100644
--- a/arch/powerpc/include/asm/uaccess.h
+++ b/arch/powerpc/include/asm/uaccess.h
@@ -210,7 +210,7 @@ do {								\
 		"1:	" op "%U1%X1 %0,%1	# put_user\n"	\
 		EX_TABLE(1b, %l2)				\
 		:						\
-		: "r" (x), "m<>" (*addr)				\
+		: "r" (x), "m" (*addr)				\
 		:						\
 		: label)
 
-- 
2.25.1

