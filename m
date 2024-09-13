Return-Path: <linuxppc-dev+bounces-1309-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DA14F9778AF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Sep 2024 08:14:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X4kYF5MkKz2yDp;
	Fri, 13 Sep 2024 16:14:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726208081;
	cv=none; b=fPdRWpJEepcujrmU+rMqMuEgGG5MgKYLEmQaiWQHmyE1qttTKt/E9G9wB8Ieo3diPMJyQYC1nAXId0J0jGzHfWAamvvR0069EB27tosvn+fmDCz+MRQ8YbTEcxRB5+rDEYV2DsxRonMjbcHOEAseX3bbf/lRc7oOPWFCcjqzj/BYfwrjGAiqsj7Dgb2TGsUygAJkwaHF9KqtJ0bxEXYbI3Eef27ONhj8Po955PXoxD1Ely+PW8YOEMNwp/8YTGzRPVxfB7BTFZSMYGDGSsTrbt+zfIzdskthAxik6uJcgjswwsSwnqenklheLy2XiRLn/i9JddHZ+FnaMRE8lehq/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726208081; c=relaxed/relaxed;
	bh=pv14U27lZwvmjQ2nrB1sdkH7AzMnFdE3Edq0sg90Zws=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XG+YFsPngQoe3LjTGvsdA8RpUNIwO4LHtwOhJjwkE8yxYeC1l4966gVpzDgD6dMcCv/LrAPhmJ4bVhqMS9E6dMEdIkcUtCETU0KlWBi+Gt7xmTQ39X8/Og0V86IhLt27bXj4a4hqxxDMdrmhdt66RMn87BfbV1rIORT66w7xgCDnTJAr+UT6bKWlAGaAS7mLw8h0p8vwZDP7ShgAybWf7E4BemnGBvNPS3E35aDRjJBwQRvmQDFg/0173lW1YbkqRNw/pe0jJ41SZ6C+N+bXzbFKbb8pwjIVoGHcJ7+qSL1DGWoytDiLzxNQci8m2SAtQWyl1jc5ELZ7FRFQMeFweQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X4kYF36Cmz2xpp
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Sep 2024 16:14:40 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4X4kY85Gs0z9sxD;
	Fri, 13 Sep 2024 08:14:36 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qFt_Fj9D9qCj; Fri, 13 Sep 2024 08:14:36 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4X4kY848K4z9sx8;
	Fri, 13 Sep 2024 08:14:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 7D2EE8B77A;
	Fri, 13 Sep 2024 08:14:36 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id BwLdywYuVOlU; Fri, 13 Sep 2024 08:14:36 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.233.70])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 1A8C68B766;
	Fri, 13 Sep 2024 08:14:36 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH] powerpc/vdso: Should VDSO64 functions be flagged as functions like VDSO32 ?
Date: Fri, 13 Sep 2024 08:14:33 +0200
Message-ID: <6fa86f3de610ffc180ae0f5dbd511453e7473b36.1726208058.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.44.0
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726208074; l=3666; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=ue4rH+i1tHnl4doLUOAue2Eqx2y0vQEBqittaq3A0AI=; b=x1ACUxhbKyS0F6m6D9/E+pdOtiUKCKgyq+c+UoEIEdJ784NuDI8QVbGYviqXwWUzp2IixT2Nm TDxkPaan0lcDAJdyhnAPGE9uyUxA35gFhTayTPr9Glc2mlyJr+YYede
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit

On powerpc64 as shown below by readelf, vDSO functions symbols have
type NOTYPE.

$ powerpc64-linux-gnu-readelf -a arch/powerpc/kernel/vdso/vdso64.so.dbg
ELF Header:
  Magic:   7f 45 4c 46 02 02 01 00 00 00 00 00 00 00 00 00
  Class:                             ELF64
  Data:                              2's complement, big endian
  Version:                           1 (current)
  OS/ABI:                            UNIX - System V
  ABI Version:                       0
  Type:                              DYN (Shared object file)
  Machine:                           PowerPC64
  Version:                           0x1
...

Symbol table '.dynsym' contains 12 entries:
   Num:    Value          Size Type    Bind   Vis      Ndx Name
...
     1: 0000000000000524    84 NOTYPE  GLOBAL DEFAULT    8 __[...]@@LINUX_2.6.15
...
     4: 0000000000000000     0 OBJECT  GLOBAL DEFAULT  ABS LINUX_2.6.15
     5: 00000000000006c0    48 NOTYPE  GLOBAL DEFAULT    8 __[...]@@LINUX_2.6.15

Symbol table '.symtab' contains 56 entries:
   Num:    Value          Size Type    Bind   Vis      Ndx Name
...
    45: 0000000000000000     0 OBJECT  GLOBAL DEFAULT  ABS LINUX_2.6.15
    46: 00000000000006c0    48 NOTYPE  GLOBAL DEFAULT    8 __kernel_getcpu
    47: 0000000000000524    84 NOTYPE  GLOBAL DEFAULT    8 __kernel_clock_getres

To overcome that, commit ba83b3239e65 ("selftests: vDSO: fix vDSO
symbols lookup for powerpc64") was proposed to make selftests also
look for NOTYPE symbols, but is it the correct fix ?

VDSO32 functions are flagged as functions, why not VDSO64 functions ?
Is it because VDSO functions are not traditional C functions using
the standard API ? But it is exactly the same for VDSO32 functions,
allthough they are flagged as functions.

So lets flag them as functions and revert the selftest change.

What's your opinion on that ?

It predates git kernel history and both VDSO32 and VDSO64 were brough by
arch/ppc64/ with that difference already.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
commit ba83b3239e65 is in random git tree at the moment : https://git.kernel.org/pub/scm/linux/kernel/git/crng/random.git/commit/?id=ba83b3239e657469709d15dcea5f9b65bf9dbf34
On the list at : https://lore.kernel.org/lkml/fc1a0862516b1e11b336d409f2cb8aab10a97337.1725020674.git.christophe.leroy@csgroup.eu/T/#u
---
 arch/powerpc/include/asm/vdso.h           | 1 +
 tools/testing/selftests/vDSO/parse_vdso.c | 3 +--
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/vdso.h b/arch/powerpc/include/asm/vdso.h
index 7650b6ce14c8..8d972bc98b55 100644
--- a/arch/powerpc/include/asm/vdso.h
+++ b/arch/powerpc/include/asm/vdso.h
@@ -25,6 +25,7 @@ int vdso_getcpu_init(void);
 #ifdef __VDSO64__
 #define V_FUNCTION_BEGIN(name)		\
 	.globl name;			\
+	.type name,@function; 		\
 	name:				\
 
 #define V_FUNCTION_END(name)		\
diff --git a/tools/testing/selftests/vDSO/parse_vdso.c b/tools/testing/selftests/vDSO/parse_vdso.c
index d9ccc5acac18..4ae417372e9e 100644
--- a/tools/testing/selftests/vDSO/parse_vdso.c
+++ b/tools/testing/selftests/vDSO/parse_vdso.c
@@ -216,8 +216,7 @@ void *vdso_sym(const char *version, const char *name)
 		ELF(Sym) *sym = &vdso_info.symtab[chain];
 
 		/* Check for a defined global or weak function w/ right name. */
-		if (ELF64_ST_TYPE(sym->st_info) != STT_FUNC &&
-		    ELF64_ST_TYPE(sym->st_info) != STT_NOTYPE)
+		if (ELF64_ST_TYPE(sym->st_info) != STT_FUNC)
 			continue;
 		if (ELF64_ST_BIND(sym->st_info) != STB_GLOBAL &&
 		    ELF64_ST_BIND(sym->st_info) != STB_WEAK)
-- 
2.44.0


