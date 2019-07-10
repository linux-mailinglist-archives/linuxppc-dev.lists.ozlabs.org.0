Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B78D6489B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jul 2019 16:47:38 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45kMVH35BNzDqLX
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jul 2019 00:47:35 +1000 (AEST)
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
 header.b="J98yODC3"; dkim-atps=neutral
Received: from smtp.duncanthrax.net (smtp.duncanthrax.net
 [IPv6:2001:470:70c5:1111::170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45kM6L1kHhzDqKX
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jul 2019 00:30:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=duncanthrax.net; s=dkim; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=Vkxm0H9rDcCAwVn3U4wp8JZAu0mqfV7kPwynX7pUS7w=; b=J98yODC3Qnbpuq4zji0hqKS2Aa
 ZZR2XpkQHG/0JdwcT5+JfnWBd6y4hS1jfEndEjWasfxIn+6c8/3TvRt8+k9AdFN1m9Mu1TMkDLjWZ
 GXe9sF4owwjvB/Y5kKiNgHQbM9BsTQKxL9kvK/sg9zmomdDW9wFt9beWikrNgKNnrdA0=;
Received: from [134.3.44.134] (helo=t470p.stackframe.org)
 by smtp.eurescom.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <svens@stackframe.org>)
 id 1hlDbq-0004hm-FM; Wed, 10 Jul 2019 16:30:14 +0200
From: Sven Schnelle <svens@stackframe.org>
To: kexec@lists.infradead.org
Subject: [PATCH v3 5/7] kexec_elf: remove elf_addr_to_cpu macro
Date: Wed, 10 Jul 2019 16:29:42 +0200
Message-Id: <20190710142944.2774-6-svens@stackframe.org>
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

It had only one definition, so just use the function directly.

Signed-off-by: Sven Schnelle <svens@stackframe.org>
---
 kernel/kexec_elf.c | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/kernel/kexec_elf.c b/kernel/kexec_elf.c
index 70d31b8feeae..99e6d63b5dfc 100644
--- a/kernel/kexec_elf.c
+++ b/kernel/kexec_elf.c
@@ -8,8 +8,6 @@
 #include <linux/slab.h>
 #include <linux/types.h>
 
-#define elf_addr_to_cpu	elf64_to_cpu
-
 #ifndef Elf_Rel
 #define Elf_Rel		Elf64_Rel
 #endif /* Elf_Rel */
@@ -143,9 +141,9 @@ static int elf_read_ehdr(const char *buf, size_t len, struct elfhdr *ehdr)
 	ehdr->e_type      = elf16_to_cpu(ehdr, buf_ehdr->e_type);
 	ehdr->e_machine   = elf16_to_cpu(ehdr, buf_ehdr->e_machine);
 	ehdr->e_version   = elf32_to_cpu(ehdr, buf_ehdr->e_version);
-	ehdr->e_entry     = elf_addr_to_cpu(ehdr, buf_ehdr->e_entry);
-	ehdr->e_phoff     = elf_addr_to_cpu(ehdr, buf_ehdr->e_phoff);
-	ehdr->e_shoff     = elf_addr_to_cpu(ehdr, buf_ehdr->e_shoff);
+	ehdr->e_entry     = elf64_to_cpu(ehdr, buf_ehdr->e_entry);
+	ehdr->e_phoff     = elf64_to_cpu(ehdr, buf_ehdr->e_phoff);
+	ehdr->e_shoff     = elf64_to_cpu(ehdr, buf_ehdr->e_shoff);
 	ehdr->e_flags     = elf32_to_cpu(ehdr, buf_ehdr->e_flags);
 	ehdr->e_phentsize = elf16_to_cpu(ehdr, buf_ehdr->e_phentsize);
 	ehdr->e_phnum     = elf16_to_cpu(ehdr, buf_ehdr->e_phnum);
@@ -190,18 +188,18 @@ static int elf_read_phdr(const char *buf, size_t len,
 	buf_phdr = (struct elf_phdr *) pbuf;
 
 	phdr->p_type   = elf32_to_cpu(elf_info->ehdr, buf_phdr->p_type);
-	phdr->p_offset = elf_addr_to_cpu(elf_info->ehdr, buf_phdr->p_offset);
-	phdr->p_paddr  = elf_addr_to_cpu(elf_info->ehdr, buf_phdr->p_paddr);
-	phdr->p_vaddr  = elf_addr_to_cpu(elf_info->ehdr, buf_phdr->p_vaddr);
+	phdr->p_offset = elf64_to_cpu(elf_info->ehdr, buf_phdr->p_offset);
+	phdr->p_paddr  = elf64_to_cpu(elf_info->ehdr, buf_phdr->p_paddr);
+	phdr->p_vaddr  = elf64_to_cpu(elf_info->ehdr, buf_phdr->p_vaddr);
 	phdr->p_flags  = elf32_to_cpu(elf_info->ehdr, buf_phdr->p_flags);
 
 	/*
 	 * The following fields have a type equivalent to Elf_Addr
 	 * both in 32 bit and 64 bit ELF.
 	 */
-	phdr->p_filesz = elf_addr_to_cpu(elf_info->ehdr, buf_phdr->p_filesz);
-	phdr->p_memsz  = elf_addr_to_cpu(elf_info->ehdr, buf_phdr->p_memsz);
-	phdr->p_align  = elf_addr_to_cpu(elf_info->ehdr, buf_phdr->p_align);
+	phdr->p_filesz = elf64_to_cpu(elf_info->ehdr, buf_phdr->p_filesz);
+	phdr->p_memsz  = elf64_to_cpu(elf_info->ehdr, buf_phdr->p_memsz);
+	phdr->p_align  = elf64_to_cpu(elf_info->ehdr, buf_phdr->p_align);
 
 	return elf_is_phdr_sane(phdr, len) ? 0 : -ENOEXEC;
 }
-- 
2.20.1

