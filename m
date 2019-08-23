Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D665E9B7E4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Aug 2019 22:51:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46FYTr4PNRzDqTl
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Aug 2019 06:51:28 +1000 (AEST)
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
 header.b="Z42gmiAU"; dkim-atps=neutral
Received: from smtp.duncanthrax.net (smtp.duncanthrax.net
 [IPv6:2001:470:70c5:1111::170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46FYCy3kJPzDqww
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Aug 2019 06:39:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=duncanthrax.net; s=dkim; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=H4eOft3mmhMmM4qIstVdgVIAgDkeI6V05OnxkDQA5RQ=; b=Z42gmiAU84qIhJsbBCXC7B6km8
 ft1liMbGsKfaXHl9j1+f4Kl3o9APmEsyQtDfQGpnzF6FvqhVwnjpRZjg6qGaVpQQfMdpvGw7uTzO2
 YYBH0sy4ue0FVkDyY37mMaEpESlaPZzC1n8uJmq+ZG4fDG67rjam7JYjBlbzBreZUad4=;
Received: from [134.3.44.134] (helo=x280.stackframe.org)
 by smtp.eurescom.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <svens@stackframe.org>)
 id 1i1FZ3-00071n-Ej; Fri, 23 Aug 2019 21:49:37 +0200
From: Sven Schnelle <svens@stackframe.org>
To: kexec@lists.infradead.org
Subject: [PATCH v5 7/7] kexec_elf: support 32 bit ELF files
Date: Fri, 23 Aug 2019 21:49:19 +0200
Message-Id: <20190823194919.30916-8-svens@stackframe.org>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <20190823194919.30916-1-svens@stackframe.org>
References: <20190823194919.30916-1-svens@stackframe.org>
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
Cc: Sven Schnelle <svens@stackframe.org>, Helge Deller <deller@gmx.de>,
 linuxppc-dev@lists.ozlabs.org, Thiago Jung Bauermann <bauerman@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The powerpc version only supported 64 bit. Add some
code to switch decoding of fields during runtime so
we can kexec a 32 bit kernel from a 64 bit kernel and
vice versa.

Signed-off-by: Sven Schnelle <svens@stackframe.org>
Reviewed-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
---
 kernel/kexec_elf.c | 57 ++++++++++++++++++++++++++++++++++------------
 1 file changed, 42 insertions(+), 15 deletions(-)

diff --git a/kernel/kexec_elf.c b/kernel/kexec_elf.c
index 85f2bd177d6e..d3689632e8b9 100644
--- a/kernel/kexec_elf.c
+++ b/kernel/kexec_elf.c
@@ -21,8 +21,6 @@
 #include <linux/slab.h>
 #include <linux/types.h>
 
-#define elf_addr_to_cpu	elf64_to_cpu
-
 static inline bool elf_is_elf_file(const struct elfhdr *ehdr)
 {
 	return memcmp(ehdr->e_ident, ELFMAG, SELFMAG) == 0;
@@ -152,9 +150,6 @@ static int elf_read_ehdr(const char *buf, size_t len, struct elfhdr *ehdr)
 	ehdr->e_type      = elf16_to_cpu(ehdr, buf_ehdr->e_type);
 	ehdr->e_machine   = elf16_to_cpu(ehdr, buf_ehdr->e_machine);
 	ehdr->e_version   = elf32_to_cpu(ehdr, buf_ehdr->e_version);
-	ehdr->e_entry     = elf_addr_to_cpu(ehdr, buf_ehdr->e_entry);
-	ehdr->e_phoff     = elf_addr_to_cpu(ehdr, buf_ehdr->e_phoff);
-	ehdr->e_shoff     = elf_addr_to_cpu(ehdr, buf_ehdr->e_shoff);
 	ehdr->e_flags     = elf32_to_cpu(ehdr, buf_ehdr->e_flags);
 	ehdr->e_phentsize = elf16_to_cpu(ehdr, buf_ehdr->e_phentsize);
 	ehdr->e_phnum     = elf16_to_cpu(ehdr, buf_ehdr->e_phnum);
@@ -162,6 +157,24 @@ static int elf_read_ehdr(const char *buf, size_t len, struct elfhdr *ehdr)
 	ehdr->e_shnum     = elf16_to_cpu(ehdr, buf_ehdr->e_shnum);
 	ehdr->e_shstrndx  = elf16_to_cpu(ehdr, buf_ehdr->e_shstrndx);
 
+	switch (ehdr->e_ident[EI_CLASS]) {
+	case ELFCLASS64:
+		ehdr->e_entry = elf64_to_cpu(ehdr, buf_ehdr->e_entry);
+		ehdr->e_phoff = elf64_to_cpu(ehdr, buf_ehdr->e_phoff);
+		ehdr->e_shoff = elf64_to_cpu(ehdr, buf_ehdr->e_shoff);
+		break;
+
+	case ELFCLASS32:
+		ehdr->e_entry = elf32_to_cpu(ehdr, buf_ehdr->e_entry);
+		ehdr->e_phoff = elf32_to_cpu(ehdr, buf_ehdr->e_phoff);
+		ehdr->e_shoff = elf32_to_cpu(ehdr, buf_ehdr->e_shoff);
+		break;
+
+	default:
+		pr_debug("Unknown ELF class.\n");
+		return -EINVAL;
+	}
+
 	return elf_is_ehdr_sane(ehdr, len) ? 0 : -ENOEXEC;
 }
 
@@ -192,6 +205,7 @@ static int elf_read_phdr(const char *buf, size_t len,
 {
 	/* Override the const in proghdrs, we are the ones doing the loading. */
 	struct elf_phdr *phdr = (struct elf_phdr *) &elf_info->proghdrs[idx];
+	const struct elfhdr *ehdr = elf_info->ehdr;
 	const char *pbuf;
 	struct elf_phdr *buf_phdr;
 
@@ -199,18 +213,31 @@ static int elf_read_phdr(const char *buf, size_t len,
 	buf_phdr = (struct elf_phdr *) pbuf;
 
 	phdr->p_type   = elf32_to_cpu(elf_info->ehdr, buf_phdr->p_type);
-	phdr->p_offset = elf_addr_to_cpu(elf_info->ehdr, buf_phdr->p_offset);
-	phdr->p_paddr  = elf_addr_to_cpu(elf_info->ehdr, buf_phdr->p_paddr);
-	phdr->p_vaddr  = elf_addr_to_cpu(elf_info->ehdr, buf_phdr->p_vaddr);
 	phdr->p_flags  = elf32_to_cpu(elf_info->ehdr, buf_phdr->p_flags);
 
-	/*
-	 * The following fields have a type equivalent to Elf_Addr
-	 * both in 32 bit and 64 bit ELF.
-	 */
-	phdr->p_filesz = elf_addr_to_cpu(elf_info->ehdr, buf_phdr->p_filesz);
-	phdr->p_memsz  = elf_addr_to_cpu(elf_info->ehdr, buf_phdr->p_memsz);
-	phdr->p_align  = elf_addr_to_cpu(elf_info->ehdr, buf_phdr->p_align);
+	switch (ehdr->e_ident[EI_CLASS]) {
+	case ELFCLASS64:
+		phdr->p_offset = elf64_to_cpu(ehdr, buf_phdr->p_offset);
+		phdr->p_paddr  = elf64_to_cpu(ehdr, buf_phdr->p_paddr);
+		phdr->p_vaddr  = elf64_to_cpu(ehdr, buf_phdr->p_vaddr);
+		phdr->p_filesz = elf64_to_cpu(ehdr, buf_phdr->p_filesz);
+		phdr->p_memsz  = elf64_to_cpu(ehdr, buf_phdr->p_memsz);
+		phdr->p_align  = elf64_to_cpu(ehdr, buf_phdr->p_align);
+		break;
+
+	case ELFCLASS32:
+		phdr->p_offset = elf32_to_cpu(ehdr, buf_phdr->p_offset);
+		phdr->p_paddr  = elf32_to_cpu(ehdr, buf_phdr->p_paddr);
+		phdr->p_vaddr  = elf32_to_cpu(ehdr, buf_phdr->p_vaddr);
+		phdr->p_filesz = elf32_to_cpu(ehdr, buf_phdr->p_filesz);
+		phdr->p_memsz  = elf32_to_cpu(ehdr, buf_phdr->p_memsz);
+		phdr->p_align  = elf32_to_cpu(ehdr, buf_phdr->p_align);
+		break;
+
+	default:
+		pr_debug("Unknown ELF class.\n");
+		return -EINVAL;
+	}
 
 	return elf_is_phdr_sane(phdr, len) ? 0 : -ENOEXEC;
 }
-- 
2.23.0.rc1

