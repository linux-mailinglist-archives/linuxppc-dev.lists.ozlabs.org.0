Return-Path: <linuxppc-dev+bounces-9986-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 02CE6AEF831
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Jul 2025 14:20:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bWhvH6fj3z30FR;
	Tue,  1 Jul 2025 22:20:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.236.30
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751372443;
	cv=none; b=WNp2ijcc5Uhn6S+KF+d/loAEKGZh5nhs9A9C2byybs5wzlKQ5wthpY4npEngW2b+ACUa8pC5qXHb15bcSVqvje7NZR+IB6EX5/Z0nO0e2FItmGZM1m+Hj/3YeH2n5/aIA3B5Hby6muJqWdtwRAPQXVUxnBOlccYFCp4mHOzp3IYP3/iJ/UGa0zzDhoJxBr2Xww2JBAunlPzfNmSFmpu2Nk5j/zCjzaYxXSLrVv/zm56EP37wtJxjD+CLd3oPu09y/0f01hNRuDR6XZwL1np2HbQ4htj/EJw/EJJXB9HKd9BiAHEP9eBuNwEIWdz+yt5FQItl1BpEFql2Z24dqQiC/g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751372443; c=relaxed/relaxed;
	bh=rHxUCsTrJtF7m7ut/7SaSnSngUFKELeGlbAN6JhZgA8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JTRJ+IjiLPQsBorsVKmAPDjVN6KD/kh9VTvFrgLzG667IEdV7vyeFb3uHS/s5+7NQtVEK//q5K/Gmg3PEsoxC1T5+noKHvYTsl6By3UfLpLHvrRvMQZy2x4mibg29gvSlokG3A55xuenfuFZCJqNKKBgmt+PzVGikNr/zw4eSPKKpK4/dKzj0XORTqORAHHPICDwZVJkhfywZrSipqj/SrL/YivNMNp0J/ZwxXCu0alYcgJ7Oitw692K0jq8XABjaEgFEGbjIVZDRs8N7htvVQjyXDRlUMG7trtMQu2BV4pKIxbI6LoNmG0uUqAtCwe92fQQoZgKDRx9J+jpGS2ETw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bWhvH2zQkz30DP
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Jul 2025 22:20:43 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4bWft33dNrz9v5M;
	Tue,  1 Jul 2025 12:49:31 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6txJhLz5S1Ji; Tue,  1 Jul 2025 12:49:31 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4bWft32qhJz9v53;
	Tue,  1 Jul 2025 12:49:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 5B4DA8B765;
	Tue,  1 Jul 2025 12:49:31 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 5LaM2CoUw8eA; Tue,  1 Jul 2025 12:49:31 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 89E108B763;
	Tue,  1 Jul 2025 12:49:30 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] arch/powerpc: Remove .interp section in vmlinux
Date: Tue,  1 Jul 2025 12:49:29 +0200
Message-ID: <eeaf8fd6628a75d19872ab31cf7e7179e2baef5e.1751366959.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.49.0
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751366969; l=1053; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=edM7g36LIzxnpCXk4fNdHPOI8dVpw9r0Fa+ZaaP4vC0=; b=onBYVdrKpVDLsab8iFcNaM/Z4XjUhzuEjMbpiSMR/HQMbd7GooQ6Lezo3cC5QbEwjGUWWmrt6 MNli6DDn0xvCw+mvkU1TqBvrjIDbt7JBQJhEaCYO7TERnNFYklFqFHh
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

When building with CONFIG_RELOCATABLE, there is a .interp section
which contains the name of the expected ELF interpreter:

Contents of section .interp:
 c0000000021c1bac 2f757372 2f6c6962 2f6c642e 736f2e31  /usr/lib/ld.so.1
 c0000000021c1bbc 00                                   .

That information is useless and even likely wrong. Remove it.

Link: https://github.com/linuxppc/issues/issues/434
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index f3804103c56c..9753fb87217c 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -101,7 +101,7 @@ KBUILD_LDFLAGS	+= -m elf$(BITS)$(LDEMULATION)
 endif
 
 LDFLAGS_vmlinux-y := -Bstatic
-LDFLAGS_vmlinux-$(CONFIG_RELOCATABLE) := -pie
+LDFLAGS_vmlinux-$(CONFIG_RELOCATABLE) := -pie --no-dynamic-linker
 LDFLAGS_vmlinux-$(CONFIG_RELOCATABLE) += -z notext
 LDFLAGS_vmlinux	:= $(LDFLAGS_vmlinux-y)
 
-- 
2.49.0


