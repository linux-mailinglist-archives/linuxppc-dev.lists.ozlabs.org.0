Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6E064879
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jul 2019 16:36:09 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45kMF05DJNzDqdG
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jul 2019 00:36:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=stackframe.org
 (client-ip=2001:470:70c5:1111::170; helo=smtp.duncanthrax.net;
 envelope-from=svens@stackframe.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=stackframe.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=duncanthrax.net header.i=@duncanthrax.net
 header.b="QxH/mK2+"; dkim-atps=neutral
Received: from smtp.duncanthrax.net (smtp.duncanthrax.net
 [IPv6:2001:470:70c5:1111::170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45kM6L2f6WzDqPb
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jul 2019 00:30:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=duncanthrax.net; s=dkim; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=roPkL3987tSUlgZQQbJuu94Oaf/ohBLtK+a05FWNfM0=; b=QxH/mK2+ygCWTqNfYpHfoX+3iG
 0D6K5MvnMxAFqeOBY7HZ8ndNwp0Zw5mSTVJlwYDKBjbevaBDrer4y2vGZAvPVgcRjm1Po1EdZS8eF
 4A5oA7bndBOYwDR8zf9JQfjoEZ/gy2R1Atf5tTeGKgUqjov6OBvMJDYDHDolCktW3f4Q=;
Received: from [134.3.44.134] (helo=t470p.stackframe.org)
 by smtp.eurescom.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <svens@stackframe.org>)
 id 1hlDbq-0004hm-Kp; Wed, 10 Jul 2019 16:30:14 +0200
From: Sven Schnelle <svens@stackframe.org>
To: kexec@lists.infradead.org
Subject: [PATCH v3 6/7] kexec_elf: remove Elf_Rel macro
Date: Wed, 10 Jul 2019 16:29:43 +0200
Message-Id: <20190710142944.2774-7-svens@stackframe.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190710142944.2774-1-svens@stackframe.org>
References: <20190710142944.2774-1-svens@stackframe.org>
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
Cc: Sven Schnelle <svens@stackframe.org>, deller@gmx.de,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

It wasn't used anywhere, so lets drop it.

Signed-off-by: Sven Schnelle <svens@stackframe.org>
---
 kernel/kexec_elf.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/kernel/kexec_elf.c b/kernel/kexec_elf.c
index 99e6d63b5dfc..b7e47ddd7cad 100644
--- a/kernel/kexec_elf.c
+++ b/kernel/kexec_elf.c
@@ -8,10 +8,6 @@
 #include <linux/slab.h>
 #include <linux/types.h>
 
-#ifndef Elf_Rel
-#define Elf_Rel		Elf64_Rel
-#endif /* Elf_Rel */
-
 static inline bool elf_is_elf_file(const struct elfhdr *ehdr)
 {
 	return memcmp(ehdr->e_ident, ELFMAG, SELFMAG) == 0;
-- 
2.20.1

