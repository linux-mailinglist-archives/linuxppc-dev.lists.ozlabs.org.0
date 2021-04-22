Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 284B7367DD0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Apr 2021 11:36:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FQskR0NLfz3bV2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Apr 2021 19:36:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=107.174.27.60; helo=ozlabs.ru;
 envelope-from=aik@ozlabs.ru; receiver=<UNKNOWN>)
X-Greylist: delayed 509 seconds by postgrey-1.36 at boromir;
 Thu, 22 Apr 2021 19:36:14 AEST
Received: from ozlabs.ru (ozlabs.ru [107.174.27.60])
 by lists.ozlabs.org (Postfix) with ESMTP id 4FQsk64VRDz2xfl
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Apr 2021 19:36:14 +1000 (AEST)
Received: from fstn1-p1.ozlabs.ibm.com (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id 562BFAE80049;
 Thu, 22 Apr 2021 05:27:39 -0400 (EDT)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH kernel] powerpc/makefile: Do not redefine $(CPP) for
 preprocessor
Date: Thu, 22 Apr 2021 19:27:37 +1000
Message-Id: <20210422092737.895392-1-aik@ozlabs.ru>
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The $(CPP) (do only preprocessing) macro is already defined in Makefile.
However POWERPC redefines it and adds $(KBUILD_CFLAGS) which results
in flags duplication. Which is not a big deal by itself except for
the flags which depend on other flags and the compiler checks them
as it parses the command line.

Specifically, scripts/Makefile.build:304 generates ksyms for .S files.
If clang+llvm+sanitizer are enabled, this results in
-fno-lto -flto -fsanitize=cfi-mfcall  .... -fno-lto -flto -fsanitize=cfi-mfcall
in the clang command line and triggers error:

clang-13: error: invalid argument '-fsanitize=cfi-mfcall' only allowed with '-flto'

This removes unnecessary CPP redifinition.

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
 arch/powerpc/Makefile | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index c9d2c7825cd6..3a2f2001c62b 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -214,7 +214,6 @@ KBUILD_CPPFLAGS	+= -I $(srctree)/arch/$(ARCH) $(asinstr)
 KBUILD_AFLAGS	+= $(AFLAGS-y)
 KBUILD_CFLAGS	+= $(call cc-option,-msoft-float)
 KBUILD_CFLAGS	+= -pipe $(CFLAGS-y)
-CPP		= $(CC) -E $(KBUILD_CFLAGS)
 
 CHECKFLAGS	+= -m$(BITS) -D__powerpc__ -D__powerpc$(BITS)__
 ifdef CONFIG_CPU_BIG_ENDIAN
-- 
2.25.1

