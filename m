Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1429B47B9CB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Dec 2021 07:00:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JJ5Qy0TrNz3c91
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Dec 2021 17:00:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=107.174.27.60; helo=ozlabs.ru;
 envelope-from=aik@ozlabs.ru; receiver=<UNKNOWN>)
Received: from ozlabs.ru (unknown [107.174.27.60])
 by lists.ozlabs.org (Postfix) with ESMTP id 4JJ5Pt5Ztnz3c5D
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Dec 2021 16:59:30 +1100 (AEDT)
Received: from fstn1-p1.ozlabs.ibm.com. (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id 4A7C781FD1;
 Tue, 21 Dec 2021 00:59:22 -0500 (EST)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH llvm 2/6] powerpc: check for support for -Wa,-m{power4,any}
Date: Tue, 21 Dec 2021 16:59:00 +1100
Message-Id: <20211221055904.555763-3-aik@ozlabs.ru>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211221055904.555763-1-aik@ozlabs.ru>
References: <20211221055904.555763-1-aik@ozlabs.ru>
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, llvm@lists.linux.dev,
 Nick Desaulniers <ndesaulniers@google.com>, Alan Modra <amodra@au1.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Daniel Axtens <dja@axtens.net>

LLVM's integrated assembler does not like either -Wa,-mpower4
or -Wa,-many. So just don't pass them if they're not supported.

Signed-off-by: Daniel Axtens <dja@axtens.net>
Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
 arch/powerpc/Makefile | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index e9aa4e8b07dd..5f16ac1583c5 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -245,7 +245,9 @@ cpu-as-$(CONFIG_E500)		+= -Wa,-me500
 # When using '-many -mpower4' gas will first try and find a matching power4
 # mnemonic and failing that it will allow any valid mnemonic that GAS knows
 # about. GCC will pass -many to GAS when assembling, clang does not.
-cpu-as-$(CONFIG_PPC_BOOK3S_64)	+= -Wa,-mpower4 -Wa,-many
+# LLVM IAS doesn't understand either flag: https://github.com/ClangBuiltLinux/linux/issues/675
+# but LLVM IAS only supports ISA >= 2.06 for Book3S 64 anyway...
+cpu-as-$(CONFIG_PPC_BOOK3S_64)	+= $(call as-option,-Wa$(comma)-mpower4) $(call as-option,-Wa$(comma)-many)
 cpu-as-$(CONFIG_PPC_E500MC)	+= $(call as-option,-Wa$(comma)-me500mc)
 
 KBUILD_AFLAGS += $(cpu-as-y)
-- 
2.30.2

