Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E43F186C938
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Feb 2024 13:28:51 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Pw2smrY1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tlr9s3ZTRz3vkl
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Feb 2024 23:28:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Pw2smrY1;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tlr623Tphz3bTt
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Feb 2024 23:25:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1709209530;
	bh=J4Tkz5Da4wzDFqFrTyD5vz94svufX690AEutU57mltE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Pw2smrY1vzVQqU/EDRcnKpvMBtorjrkjZ6xJ3v9p5w7buLbKz3WqTXIO9Soc15G/i
	 rvj8/LvQrK2X3Zcv9tIBMX8j8tUFhwpE/nV5ZcvDbZH9DECFxQUUM94JhR8GYeOEpz
	 gOB4vOWzyQ94c2DaDXU3/i94doHxwJbuUa0dUO/iQ4YgoDPH1s40lc7ySPmVDLrSD0
	 3WbcMpROb9CZu4jVTHG9YGXnIf/CqHTVLY9Auxgg4zWVGyWq+Se9GygcE7IR1H479k
	 GXqyT4dthhoNosen0aW1Z6zqdCNnrTXyZTCSFwIF7x+lTTUJEqp33ccy4/EdA1c2X3
	 RhgK2wUOdDbYA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Tlr622Jpfz4wp0;
	Thu, 29 Feb 2024 23:25:30 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 5/5] powerpc: Remove cpu-as-y completely
Date: Thu, 29 Feb 2024 23:25:21 +1100
Message-ID: <20240229122521.762431-5-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240229122521.762431-1-mpe@ellerman.id.au>
References: <20240229122521.762431-1-mpe@ellerman.id.au>
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

From: Christophe Leroy <christophe.leroy@csgroup.eu>

cpu-as-y is there to force assembler building options. But there is no
need for that. GCC is passed the necessary options and it automatically
pass the appropriate option to GAS.

GCC is given -maltivec when relevant, so no need for -Wa,-maltivec
either.

And -Wa,-many is wrong as it will hide innapropriate instructions.
Better to detect them and handle them on a case by case basis.

The setting of -Wa,-many was added by commit 960e30029863
("powerpc/Makefile: Fix PPC_BOOK3S_64 ASFLAGS") in order to fix an issue
with clang and the passed -Wa,-mpower4 option. But we have now removed
it expecting the compiler to automatically pass the proper options and
instructions based on -mcpu=power4.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/Makefile | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index 051247027da0..098133b34b68 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -219,18 +219,6 @@ KBUILD_CFLAGS += -fno-asynchronous-unwind-tables
 # often slow when they are implemented at all
 KBUILD_CFLAGS		+= $(call cc-option,-mno-string)
 
-cpu-as-$(CONFIG_ALTIVEC)	+= $(call as-option,-Wa$(comma)-maltivec)
-
-# When using '-many -mpower4' gas will first try and find a matching power4
-# mnemonic and failing that it will allow any valid mnemonic that GAS knows
-# about. GCC will pass -many to GAS when assembling, clang does not.
-# LLVM IAS doesn't understand either flag: https://github.com/ClangBuiltLinux/linux/issues/675
-# but LLVM IAS only supports ISA >= 2.06 for Book3S 64 anyway...
-cpu-as-$(CONFIG_PPC_BOOK3S_64)	+= $(call as-option,-Wa$(comma)-mpower4) $(call as-option,-Wa$(comma)-many)
-
-KBUILD_AFLAGS += $(cpu-as-y)
-KBUILD_CFLAGS += $(cpu-as-y)
-
 KBUILD_AFLAGS += $(aflags-y)
 KBUILD_CFLAGS += $(cflags-y)
 
-- 
2.43.2

