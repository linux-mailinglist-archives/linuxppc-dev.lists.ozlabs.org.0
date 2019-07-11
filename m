Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B92664890
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jul 2019 16:40:44 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45kMLJ1PctzDqcg
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jul 2019 00:40:40 +1000 (AEST)
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
 header.b="RoIu9+ui"; dkim-atps=neutral
Received: from smtp.duncanthrax.net (smtp.duncanthrax.net
 [IPv6:2001:470:70c5:1111::170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45kM6L2hZhzDqR5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jul 2019 00:30:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=duncanthrax.net; s=dkim; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=DoYe02SNtSbz/wMlwdl2Sf3uy6xQY5X3g61B22wOSx4=; b=RoIu9+ui3jhvhPbFAiDlhyf29E
 /wFDgyCC9WSOBLhASfW0GtjOpoqLPwzkc5HGAYbpXde+fSWTcyR8iam0VYkm8FuB0EkKmQJlaMT/u
 PfVxeAGAVC9HIGihBnWoennLeRTaNliyuT8pfI+nNHfOj6Nl3Ix04tuW77LjbTar1qUU=;
Received: from [134.3.44.134] (helo=t470p.stackframe.org)
 by smtp.eurescom.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <svens@stackframe.org>)
 id 1hlDbp-0004hm-Kf; Wed, 10 Jul 2019 16:30:13 +0200
From: Sven Schnelle <svens@stackframe.org>
To: kexec@lists.infradead.org
Subject: [PATCH v3 1/7] kexec: add KEXEC_ELF
Date: Wed, 10 Jul 2019 16:29:38 +0200
Message-Id: <20190710142944.2774-2-svens@stackframe.org>
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

Right now powerpc provides an implementation to read elf files
with the kexec_file() syscall. Make that available as a public
kexec interface so it can be re-used on other architectures.

Signed-off-by: Sven Schnelle <svens@stackframe.org>
---
 arch/Kconfig                                  |   3 +
 arch/powerpc/Kconfig                          |   1 +
 arch/powerpc/kernel/kexec_elf_64.c            | 551 +-----------------
 include/linux/kexec.h                         |  24 +
 kernel/Makefile                               |   1 +
 .../kexec_elf_64.c => kernel/kexec_elf.c      | 199 ++-----
 6 files changed, 75 insertions(+), 704 deletions(-)
 copy arch/powerpc/kernel/kexec_elf_64.c => kernel/kexec_elf.c (71%)

diff --git a/arch/Kconfig b/arch/Kconfig
index c47b328eada0..30694aca4316 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -18,6 +18,9 @@ config KEXEC_CORE
 	select CRASH_CORE
 	bool
 
+config KEXEC_ELF
+	bool
+
 config HAVE_IMA_KEXEC
 	bool
 
diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 12cee37f15c4..addc2dad78e0 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -510,6 +510,7 @@ config KEXEC_FILE
 	select KEXEC_CORE
 	select HAVE_IMA_KEXEC
 	select BUILD_BIN2C
+	select KEXEC_ELF
 	depends on PPC64
 	depends on CRYPTO=y
 	depends on CRYPTO_SHA256=y
diff --git a/arch/powerpc/kernel/kexec_elf_64.c b/arch/powerpc/kernel/kexec_elf_64.c
index ba4f18a43ee8..30bd57a93c17 100644
--- a/arch/powerpc/kernel/kexec_elf_64.c
+++ b/arch/powerpc/kernel/kexec_elf_64.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0-only
 /*
  * Load ELF vmlinux file for the kexec_file_load syscall.
  *
@@ -10,15 +11,6 @@
  * Based on kexec-tools' kexec-elf-exec.c and kexec-elf-ppc64.c.
  * Heavily modified for the kernel by
  * Thiago Jung Bauermann <bauerman@linux.vnet.ibm.com>.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation (version 2 of the License).
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
  */
 
 #define pr_fmt(fmt)	"kexec_elf: " fmt
@@ -39,532 +31,6 @@
 #define Elf_Rel		Elf64_Rel
 #endif /* Elf_Rel */
 
-struct elf_info {
-	/*
-	 * Where the ELF binary contents are kept.
-	 * Memory managed by the user of the struct.
-	 */
-	const char *buffer;
-
-	const struct elfhdr *ehdr;
-	const struct elf_phdr *proghdrs;
-	struct elf_shdr *sechdrs;
-};
-
-static inline bool elf_is_elf_file(const struct elfhdr *ehdr)
-{
-       return memcmp(ehdr->e_ident, ELFMAG, SELFMAG) == 0;
-}
-
-static uint64_t elf64_to_cpu(const struct elfhdr *ehdr, uint64_t value)
-{
-	if (ehdr->e_ident[EI_DATA] == ELFDATA2LSB)
-		value = le64_to_cpu(value);
-	else if (ehdr->e_ident[EI_DATA] == ELFDATA2MSB)
-		value = be64_to_cpu(value);
-
-	return value;
-}
-
-static uint16_t elf16_to_cpu(const struct elfhdr *ehdr, uint16_t value)
-{
-	if (ehdr->e_ident[EI_DATA] == ELFDATA2LSB)
-		value = le16_to_cpu(value);
-	else if (ehdr->e_ident[EI_DATA] == ELFDATA2MSB)
-		value = be16_to_cpu(value);
-
-	return value;
-}
-
-static uint32_t elf32_to_cpu(const struct elfhdr *ehdr, uint32_t value)
-{
-	if (ehdr->e_ident[EI_DATA] == ELFDATA2LSB)
-		value = le32_to_cpu(value);
-	else if (ehdr->e_ident[EI_DATA] == ELFDATA2MSB)
-		value = be32_to_cpu(value);
-
-	return value;
-}
-
-/**
- * elf_is_ehdr_sane - check that it is safe to use the ELF header
- * @buf_len:	size of the buffer in which the ELF file is loaded.
- */
-static bool elf_is_ehdr_sane(const struct elfhdr *ehdr, size_t buf_len)
-{
-	if (ehdr->e_phnum > 0 && ehdr->e_phentsize != sizeof(struct elf_phdr)) {
-		pr_debug("Bad program header size.\n");
-		return false;
-	} else if (ehdr->e_shnum > 0 &&
-		   ehdr->e_shentsize != sizeof(struct elf_shdr)) {
-		pr_debug("Bad section header size.\n");
-		return false;
-	} else if (ehdr->e_ident[EI_VERSION] != EV_CURRENT ||
-		   ehdr->e_version != EV_CURRENT) {
-		pr_debug("Unknown ELF version.\n");
-		return false;
-	}
-
-	if (ehdr->e_phoff > 0 && ehdr->e_phnum > 0) {
-		size_t phdr_size;
-
-		/*
-		 * e_phnum is at most 65535 so calculating the size of the
-		 * program header cannot overflow.
-		 */
-		phdr_size = sizeof(struct elf_phdr) * ehdr->e_phnum;
-
-		/* Sanity check the program header table location. */
-		if (ehdr->e_phoff + phdr_size < ehdr->e_phoff) {
-			pr_debug("Program headers at invalid location.\n");
-			return false;
-		} else if (ehdr->e_phoff + phdr_size > buf_len) {
-			pr_debug("Program headers truncated.\n");
-			return false;
-		}
-	}
-
-	if (ehdr->e_shoff > 0 && ehdr->e_shnum > 0) {
-		size_t shdr_size;
-
-		/*
-		 * e_shnum is at most 65536 so calculating
-		 * the size of the section header cannot overflow.
-		 */
-		shdr_size = sizeof(struct elf_shdr) * ehdr->e_shnum;
-
-		/* Sanity check the section header table location. */
-		if (ehdr->e_shoff + shdr_size < ehdr->e_shoff) {
-			pr_debug("Section headers at invalid location.\n");
-			return false;
-		} else if (ehdr->e_shoff + shdr_size > buf_len) {
-			pr_debug("Section headers truncated.\n");
-			return false;
-		}
-	}
-
-	return true;
-}
-
-static int elf_read_ehdr(const char *buf, size_t len, struct elfhdr *ehdr)
-{
-	struct elfhdr *buf_ehdr;
-
-	if (len < sizeof(*buf_ehdr)) {
-		pr_debug("Buffer is too small to hold ELF header.\n");
-		return -ENOEXEC;
-	}
-
-	memset(ehdr, 0, sizeof(*ehdr));
-	memcpy(ehdr->e_ident, buf, sizeof(ehdr->e_ident));
-	if (!elf_is_elf_file(ehdr)) {
-		pr_debug("No ELF header magic.\n");
-		return -ENOEXEC;
-	}
-
-	if (ehdr->e_ident[EI_CLASS] != ELF_CLASS) {
-		pr_debug("Not a supported ELF class.\n");
-		return -ENOEXEC;
-	} else  if (ehdr->e_ident[EI_DATA] != ELFDATA2LSB &&
-		ehdr->e_ident[EI_DATA] != ELFDATA2MSB) {
-		pr_debug("Not a supported ELF data format.\n");
-		return -ENOEXEC;
-	}
-
-	buf_ehdr = (struct elfhdr *) buf;
-	if (elf16_to_cpu(ehdr, buf_ehdr->e_ehsize) != sizeof(*buf_ehdr)) {
-		pr_debug("Bad ELF header size.\n");
-		return -ENOEXEC;
-	}
-
-	ehdr->e_type      = elf16_to_cpu(ehdr, buf_ehdr->e_type);
-	ehdr->e_machine   = elf16_to_cpu(ehdr, buf_ehdr->e_machine);
-	ehdr->e_version   = elf32_to_cpu(ehdr, buf_ehdr->e_version);
-	ehdr->e_entry     = elf_addr_to_cpu(ehdr, buf_ehdr->e_entry);
-	ehdr->e_phoff     = elf_addr_to_cpu(ehdr, buf_ehdr->e_phoff);
-	ehdr->e_shoff     = elf_addr_to_cpu(ehdr, buf_ehdr->e_shoff);
-	ehdr->e_flags     = elf32_to_cpu(ehdr, buf_ehdr->e_flags);
-	ehdr->e_phentsize = elf16_to_cpu(ehdr, buf_ehdr->e_phentsize);
-	ehdr->e_phnum     = elf16_to_cpu(ehdr, buf_ehdr->e_phnum);
-	ehdr->e_shentsize = elf16_to_cpu(ehdr, buf_ehdr->e_shentsize);
-	ehdr->e_shnum     = elf16_to_cpu(ehdr, buf_ehdr->e_shnum);
-	ehdr->e_shstrndx  = elf16_to_cpu(ehdr, buf_ehdr->e_shstrndx);
-
-	return elf_is_ehdr_sane(ehdr, len) ? 0 : -ENOEXEC;
-}
-
-/**
- * elf_is_phdr_sane - check that it is safe to use the program header
- * @buf_len:	size of the buffer in which the ELF file is loaded.
- */
-static bool elf_is_phdr_sane(const struct elf_phdr *phdr, size_t buf_len)
-{
-
-	if (phdr->p_offset + phdr->p_filesz < phdr->p_offset) {
-		pr_debug("ELF segment location wraps around.\n");
-		return false;
-	} else if (phdr->p_offset + phdr->p_filesz > buf_len) {
-		pr_debug("ELF segment not in file.\n");
-		return false;
-	} else if (phdr->p_paddr + phdr->p_memsz < phdr->p_paddr) {
-		pr_debug("ELF segment address wraps around.\n");
-		return false;
-	}
-
-	return true;
-}
-
-static int elf_read_phdr(const char *buf, size_t len, struct elf_info *elf_info,
-			 int idx)
-{
-	/* Override the const in proghdrs, we are the ones doing the loading. */
-	struct elf_phdr *phdr = (struct elf_phdr *) &elf_info->proghdrs[idx];
-	const char *pbuf;
-	struct elf_phdr *buf_phdr;
-
-	pbuf = buf + elf_info->ehdr->e_phoff + (idx * sizeof(*buf_phdr));
-	buf_phdr = (struct elf_phdr *) pbuf;
-
-	phdr->p_type   = elf32_to_cpu(elf_info->ehdr, buf_phdr->p_type);
-	phdr->p_offset = elf_addr_to_cpu(elf_info->ehdr, buf_phdr->p_offset);
-	phdr->p_paddr  = elf_addr_to_cpu(elf_info->ehdr, buf_phdr->p_paddr);
-	phdr->p_vaddr  = elf_addr_to_cpu(elf_info->ehdr, buf_phdr->p_vaddr);
-	phdr->p_flags  = elf32_to_cpu(elf_info->ehdr, buf_phdr->p_flags);
-
-	/*
-	 * The following fields have a type equivalent to Elf_Addr
-	 * both in 32 bit and 64 bit ELF.
-	 */
-	phdr->p_filesz = elf_addr_to_cpu(elf_info->ehdr, buf_phdr->p_filesz);
-	phdr->p_memsz  = elf_addr_to_cpu(elf_info->ehdr, buf_phdr->p_memsz);
-	phdr->p_align  = elf_addr_to_cpu(elf_info->ehdr, buf_phdr->p_align);
-
-	return elf_is_phdr_sane(phdr, len) ? 0 : -ENOEXEC;
-}
-
-/**
- * elf_read_phdrs - read the program headers from the buffer
- *
- * This function assumes that the program header table was checked for sanity.
- * Use elf_is_ehdr_sane() if it wasn't.
- */
-static int elf_read_phdrs(const char *buf, size_t len,
-			  struct elf_info *elf_info)
-{
-	size_t phdr_size, i;
-	const struct elfhdr *ehdr = elf_info->ehdr;
-
-	/*
-	 * e_phnum is at most 65535 so calculating the size of the
-	 * program header cannot overflow.
-	 */
-	phdr_size = sizeof(struct elf_phdr) * ehdr->e_phnum;
-
-	elf_info->proghdrs = kzalloc(phdr_size, GFP_KERNEL);
-	if (!elf_info->proghdrs)
-		return -ENOMEM;
-
-	for (i = 0; i < ehdr->e_phnum; i++) {
-		int ret;
-
-		ret = elf_read_phdr(buf, len, elf_info, i);
-		if (ret) {
-			kfree(elf_info->proghdrs);
-			elf_info->proghdrs = NULL;
-			return ret;
-		}
-	}
-
-	return 0;
-}
-
-/**
- * elf_is_shdr_sane - check that it is safe to use the section header
- * @buf_len:	size of the buffer in which the ELF file is loaded.
- */
-static bool elf_is_shdr_sane(const struct elf_shdr *shdr, size_t buf_len)
-{
-	bool size_ok;
-
-	/* SHT_NULL headers have undefined values, so we can't check them. */
-	if (shdr->sh_type == SHT_NULL)
-		return true;
-
-	/* Now verify sh_entsize */
-	switch (shdr->sh_type) {
-	case SHT_SYMTAB:
-		size_ok = shdr->sh_entsize == sizeof(Elf_Sym);
-		break;
-	case SHT_RELA:
-		size_ok = shdr->sh_entsize == sizeof(Elf_Rela);
-		break;
-	case SHT_DYNAMIC:
-		size_ok = shdr->sh_entsize == sizeof(Elf_Dyn);
-		break;
-	case SHT_REL:
-		size_ok = shdr->sh_entsize == sizeof(Elf_Rel);
-		break;
-	case SHT_NOTE:
-	case SHT_PROGBITS:
-	case SHT_HASH:
-	case SHT_NOBITS:
-	default:
-		/*
-		 * This is a section whose entsize requirements
-		 * I don't care about.  If I don't know about
-		 * the section I can't care about it's entsize
-		 * requirements.
-		 */
-		size_ok = true;
-		break;
-	}
-
-	if (!size_ok) {
-		pr_debug("ELF section with wrong entry size.\n");
-		return false;
-	} else if (shdr->sh_addr + shdr->sh_size < shdr->sh_addr) {
-		pr_debug("ELF section address wraps around.\n");
-		return false;
-	}
-
-	if (shdr->sh_type != SHT_NOBITS) {
-		if (shdr->sh_offset + shdr->sh_size < shdr->sh_offset) {
-			pr_debug("ELF section location wraps around.\n");
-			return false;
-		} else if (shdr->sh_offset + shdr->sh_size > buf_len) {
-			pr_debug("ELF section not in file.\n");
-			return false;
-		}
-	}
-
-	return true;
-}
-
-static int elf_read_shdr(const char *buf, size_t len, struct elf_info *elf_info,
-			 int idx)
-{
-	struct elf_shdr *shdr = &elf_info->sechdrs[idx];
-	const struct elfhdr *ehdr = elf_info->ehdr;
-	const char *sbuf;
-	struct elf_shdr *buf_shdr;
-
-	sbuf = buf + ehdr->e_shoff + idx * sizeof(*buf_shdr);
-	buf_shdr = (struct elf_shdr *) sbuf;
-
-	shdr->sh_name      = elf32_to_cpu(ehdr, buf_shdr->sh_name);
-	shdr->sh_type      = elf32_to_cpu(ehdr, buf_shdr->sh_type);
-	shdr->sh_addr      = elf_addr_to_cpu(ehdr, buf_shdr->sh_addr);
-	shdr->sh_offset    = elf_addr_to_cpu(ehdr, buf_shdr->sh_offset);
-	shdr->sh_link      = elf32_to_cpu(ehdr, buf_shdr->sh_link);
-	shdr->sh_info      = elf32_to_cpu(ehdr, buf_shdr->sh_info);
-
-	/*
-	 * The following fields have a type equivalent to Elf_Addr
-	 * both in 32 bit and 64 bit ELF.
-	 */
-	shdr->sh_flags     = elf_addr_to_cpu(ehdr, buf_shdr->sh_flags);
-	shdr->sh_size      = elf_addr_to_cpu(ehdr, buf_shdr->sh_size);
-	shdr->sh_addralign = elf_addr_to_cpu(ehdr, buf_shdr->sh_addralign);
-	shdr->sh_entsize   = elf_addr_to_cpu(ehdr, buf_shdr->sh_entsize);
-
-	return elf_is_shdr_sane(shdr, len) ? 0 : -ENOEXEC;
-}
-
-/**
- * elf_read_shdrs - read the section headers from the buffer
- *
- * This function assumes that the section header table was checked for sanity.
- * Use elf_is_ehdr_sane() if it wasn't.
- */
-static int elf_read_shdrs(const char *buf, size_t len,
-			  struct elf_info *elf_info)
-{
-	size_t shdr_size, i;
-
-	/*
-	 * e_shnum is at most 65536 so calculating
-	 * the size of the section header cannot overflow.
-	 */
-	shdr_size = sizeof(struct elf_shdr) * elf_info->ehdr->e_shnum;
-
-	elf_info->sechdrs = kzalloc(shdr_size, GFP_KERNEL);
-	if (!elf_info->sechdrs)
-		return -ENOMEM;
-
-	for (i = 0; i < elf_info->ehdr->e_shnum; i++) {
-		int ret;
-
-		ret = elf_read_shdr(buf, len, elf_info, i);
-		if (ret) {
-			kfree(elf_info->sechdrs);
-			elf_info->sechdrs = NULL;
-			return ret;
-		}
-	}
-
-	return 0;
-}
-
-/**
- * elf_read_from_buffer - read ELF file and sets up ELF header and ELF info
- * @buf:	Buffer to read ELF file from.
- * @len:	Size of @buf.
- * @ehdr:	Pointer to existing struct which will be populated.
- * @elf_info:	Pointer to existing struct which will be populated.
- *
- * This function allows reading ELF files with different byte order than
- * the kernel, byte-swapping the fields as needed.
- *
- * Return:
- * On success returns 0, and the caller should call elf_free_info(elf_info) to
- * free the memory allocated for the section and program headers.
- */
-int elf_read_from_buffer(const char *buf, size_t len, struct elfhdr *ehdr,
-			 struct elf_info *elf_info)
-{
-	int ret;
-
-	ret = elf_read_ehdr(buf, len, ehdr);
-	if (ret)
-		return ret;
-
-	elf_info->buffer = buf;
-	elf_info->ehdr = ehdr;
-	if (ehdr->e_phoff > 0 && ehdr->e_phnum > 0) {
-		ret = elf_read_phdrs(buf, len, elf_info);
-		if (ret)
-			return ret;
-	}
-	if (ehdr->e_shoff > 0 && ehdr->e_shnum > 0) {
-		ret = elf_read_shdrs(buf, len, elf_info);
-		if (ret) {
-			kfree(elf_info->proghdrs);
-			return ret;
-		}
-	}
-
-	return 0;
-}
-
-/**
- * elf_free_info - free memory allocated by elf_read_from_buffer
- */
-void elf_free_info(struct elf_info *elf_info)
-{
-	kfree(elf_info->proghdrs);
-	kfree(elf_info->sechdrs);
-	memset(elf_info, 0, sizeof(*elf_info));
-}
-/**
- * build_elf_exec_info - read ELF executable and check that we can use it
- */
-static int build_elf_exec_info(const char *buf, size_t len, struct elfhdr *ehdr,
-			       struct elf_info *elf_info)
-{
-	int i;
-	int ret;
-
-	ret = elf_read_from_buffer(buf, len, ehdr, elf_info);
-	if (ret)
-		return ret;
-
-	/* Big endian vmlinux has type ET_DYN. */
-	if (ehdr->e_type != ET_EXEC && ehdr->e_type != ET_DYN) {
-		pr_err("Not an ELF executable.\n");
-		goto error;
-	} else if (!elf_info->proghdrs) {
-		pr_err("No ELF program header.\n");
-		goto error;
-	}
-
-	for (i = 0; i < ehdr->e_phnum; i++) {
-		/*
-		 * Kexec does not support loading interpreters.
-		 * In addition this check keeps us from attempting
-		 * to kexec ordinay executables.
-		 */
-		if (elf_info->proghdrs[i].p_type == PT_INTERP) {
-			pr_err("Requires an ELF interpreter.\n");
-			goto error;
-		}
-	}
-
-	return 0;
-error:
-	elf_free_info(elf_info);
-	return -ENOEXEC;
-}
-
-static int elf64_probe(const char *buf, unsigned long len)
-{
-	struct elfhdr ehdr;
-	struct elf_info elf_info;
-	int ret;
-
-	ret = build_elf_exec_info(buf, len, &ehdr, &elf_info);
-	if (ret)
-		return ret;
-
-	elf_free_info(&elf_info);
-
-	return elf_check_arch(&ehdr) ? 0 : -ENOEXEC;
-}
-
-/**
- * elf_exec_load - load ELF executable image
- * @lowest_load_addr:	On return, will be the address where the first PT_LOAD
- *			section will be loaded in memory.
- *
- * Return:
- * 0 on success, negative value on failure.
- */
-static int elf_exec_load(struct kimage *image, struct elfhdr *ehdr,
-			 struct elf_info *elf_info,
-			 unsigned long *lowest_load_addr)
-{
-	unsigned long base = 0, lowest_addr = UINT_MAX;
-	int ret;
-	size_t i;
-	struct kexec_buf kbuf = { .image = image, .buf_max = ppc64_rma_size,
-				  .top_down = false };
-
-	/* Read in the PT_LOAD segments. */
-	for (i = 0; i < ehdr->e_phnum; i++) {
-		unsigned long load_addr;
-		size_t size;
-		const struct elf_phdr *phdr;
-
-		phdr = &elf_info->proghdrs[i];
-		if (phdr->p_type != PT_LOAD)
-			continue;
-
-		size = phdr->p_filesz;
-		if (size > phdr->p_memsz)
-			size = phdr->p_memsz;
-
-		kbuf.buffer = (void *) elf_info->buffer + phdr->p_offset;
-		kbuf.bufsz = size;
-		kbuf.memsz = phdr->p_memsz;
-		kbuf.buf_align = phdr->p_align;
-		kbuf.buf_min = phdr->p_paddr + base;
-		ret = kexec_add_buffer(&kbuf);
-		if (ret)
-			goto out;
-		load_addr = kbuf.mem;
-
-		if (load_addr < lowest_addr)
-			lowest_addr = load_addr;
-	}
-
-	/* Update entry point to reflect new load address. */
-	ehdr->e_entry += base;
-
-	*lowest_load_addr = lowest_addr;
-	ret = 0;
- out:
-	return ret;
-}
-
 static void *elf64_load(struct kimage *image, char *kernel_buf,
 			unsigned long kernel_len, char *initrd,
 			unsigned long initrd_len, char *cmdline,
@@ -577,17 +43,18 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
 	void *fdt;
 	const void *slave_code;
 	struct elfhdr ehdr;
-	struct elf_info elf_info;
+	struct kexec_elf_info elf_info;
 	struct kexec_buf kbuf = { .image = image, .buf_min = 0,
 				  .buf_max = ppc64_rma_size };
 	struct kexec_buf pbuf = { .image = image, .buf_min = 0,
-				  .buf_max = ppc64_rma_size, .top_down = true };
+				  .buf_max = ppc64_rma_size, .top_down = true,
+				  .mem = KEXEC_BUF_MEM_UNKNOWN };
 
-	ret = build_elf_exec_info(kernel_buf, kernel_len, &ehdr, &elf_info);
+	ret = kexec_build_elf_info(kernel_buf, kernel_len, &ehdr, &elf_info);
 	if (ret)
 		goto out;
 
-	ret = elf_exec_load(image, &ehdr, &elf_info, &kernel_load_addr);
+	ret = kexec_elf_load(image, &ehdr, &elf_info, &kbuf, &kernel_load_addr);
 	if (ret)
 		goto out;
 
@@ -606,6 +73,7 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
 		kbuf.bufsz = kbuf.memsz = initrd_len;
 		kbuf.buf_align = PAGE_SIZE;
 		kbuf.top_down = false;
+		kbuf.mem = KEXEC_BUF_MEM_UNKNOWN;
 		ret = kexec_add_buffer(&kbuf);
 		if (ret)
 			goto out;
@@ -638,6 +106,7 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
 	kbuf.bufsz = kbuf.memsz = fdt_size;
 	kbuf.buf_align = PAGE_SIZE;
 	kbuf.top_down = true;
+	kbuf.mem = KEXEC_BUF_MEM_UNKNOWN;
 	ret = kexec_add_buffer(&kbuf);
 	if (ret)
 		goto out;
@@ -652,13 +121,13 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
 		pr_err("Error setting up the purgatory.\n");
 
 out:
-	elf_free_info(&elf_info);
+	kexec_free_elf_info(&elf_info);
 
 	/* Make kimage_file_post_load_cleanup free the fdt buffer for us. */
 	return ret ? ERR_PTR(ret) : fdt;
 }
 
 const struct kexec_file_ops kexec_elf64_ops = {
-	.probe = elf64_probe,
+	.probe = kexec_elf_probe,
 	.load = elf64_load,
 };
diff --git a/include/linux/kexec.h b/include/linux/kexec.h
index b9b1bc5f9669..da2a6b1d69e7 100644
--- a/include/linux/kexec.h
+++ b/include/linux/kexec.h
@@ -216,6 +216,30 @@ extern int crash_prepare_elf64_headers(struct crash_mem *mem, int kernel_map,
 				       void **addr, unsigned long *sz);
 #endif /* CONFIG_KEXEC_FILE */
 
+#ifdef CONFIG_KEXEC_ELF
+struct kexec_elf_info {
+	/*
+	 * Where the ELF binary contents are kept.
+	 * Memory managed by the user of the struct.
+	 */
+	const char *buffer;
+
+	const struct elfhdr *ehdr;
+	const struct elf_phdr *proghdrs;
+	struct elf_shdr *sechdrs;
+};
+
+int kexec_build_elf_info(const char *buf, size_t len, struct elfhdr *ehdr,
+			       struct kexec_elf_info *elf_info);
+
+int kexec_elf_load(struct kimage *image, struct elfhdr *ehdr,
+			 struct kexec_elf_info *elf_info,
+			 struct kexec_buf *kbuf,
+			 unsigned long *lowest_load_addr);
+
+void kexec_free_elf_info(struct kexec_elf_info *elf_info);
+int kexec_elf_probe(const char *buf, unsigned long len);
+#endif
 struct kimage {
 	kimage_entry_t head;
 	kimage_entry_t *entry;
diff --git a/kernel/Makefile b/kernel/Makefile
index 33824f0385b3..7062306de9b7 100644
--- a/kernel/Makefile
+++ b/kernel/Makefile
@@ -64,6 +64,7 @@ obj-$(CONFIG_CRASH_CORE) += crash_core.o
 obj-$(CONFIG_KEXEC_CORE) += kexec_core.o
 obj-$(CONFIG_KEXEC) += kexec.o
 obj-$(CONFIG_KEXEC_FILE) += kexec_file.o
+obj-$(CONFIG_KEXEC_ELF) += kexec_elf.o
 obj-$(CONFIG_BACKTRACE_SELF_TEST) += backtracetest.o
 obj-$(CONFIG_COMPAT) += compat.o
 obj-$(CONFIG_CGROUPS) += cgroup/
diff --git a/arch/powerpc/kernel/kexec_elf_64.c b/kernel/kexec_elf.c
similarity index 71%
copy from arch/powerpc/kernel/kexec_elf_64.c
copy to kernel/kexec_elf.c
index ba4f18a43ee8..6e9f52171ede 100644
--- a/arch/powerpc/kernel/kexec_elf_64.c
+++ b/kernel/kexec_elf.c
@@ -1,33 +1,10 @@
-/*
- * Load ELF vmlinux file for the kexec_file_load syscall.
- *
- * Copyright (C) 2004  Adam Litke (agl@us.ibm.com)
- * Copyright (C) 2004  IBM Corp.
- * Copyright (C) 2005  R Sharada (sharada@in.ibm.com)
- * Copyright (C) 2006  Mohan Kumar M (mohan@in.ibm.com)
- * Copyright (C) 2016  IBM Corporation
- *
- * Based on kexec-tools' kexec-elf-exec.c and kexec-elf-ppc64.c.
- * Heavily modified for the kernel by
- * Thiago Jung Bauermann <bauerman@linux.vnet.ibm.com>.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation (version 2 of the License).
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- */
+// SPDX-License-Identifier: GPL-2.0-only
 
 #define pr_fmt(fmt)	"kexec_elf: " fmt
 
 #include <linux/elf.h>
 #include <linux/kexec.h>
-#include <linux/libfdt.h>
 #include <linux/module.h>
-#include <linux/of_fdt.h>
 #include <linux/slab.h>
 #include <linux/types.h>
 
@@ -39,21 +16,9 @@
 #define Elf_Rel		Elf64_Rel
 #endif /* Elf_Rel */
 
-struct elf_info {
-	/*
-	 * Where the ELF binary contents are kept.
-	 * Memory managed by the user of the struct.
-	 */
-	const char *buffer;
-
-	const struct elfhdr *ehdr;
-	const struct elf_phdr *proghdrs;
-	struct elf_shdr *sechdrs;
-};
-
 static inline bool elf_is_elf_file(const struct elfhdr *ehdr)
 {
-       return memcmp(ehdr->e_ident, ELFMAG, SELFMAG) == 0;
+	return memcmp(ehdr->e_ident, ELFMAG, SELFMAG) == 0;
 }
 
 static uint64_t elf64_to_cpu(const struct elfhdr *ehdr, uint64_t value)
@@ -214,7 +179,8 @@ static bool elf_is_phdr_sane(const struct elf_phdr *phdr, size_t buf_len)
 	return true;
 }
 
-static int elf_read_phdr(const char *buf, size_t len, struct elf_info *elf_info,
+static int elf_read_phdr(const char *buf, size_t len,
+			 struct kexec_elf_info *elf_info,
 			 int idx)
 {
 	/* Override the const in proghdrs, we are the ones doing the loading. */
@@ -249,7 +215,7 @@ static int elf_read_phdr(const char *buf, size_t len, struct elf_info *elf_info,
  * Use elf_is_ehdr_sane() if it wasn't.
  */
 static int elf_read_phdrs(const char *buf, size_t len,
-			  struct elf_info *elf_info)
+			  struct kexec_elf_info *elf_info)
 {
 	size_t phdr_size, i;
 	const struct elfhdr *ehdr = elf_info->ehdr;
@@ -340,7 +306,8 @@ static bool elf_is_shdr_sane(const struct elf_shdr *shdr, size_t buf_len)
 	return true;
 }
 
-static int elf_read_shdr(const char *buf, size_t len, struct elf_info *elf_info,
+static int elf_read_shdr(const char *buf, size_t len,
+			 struct kexec_elf_info *elf_info,
 			 int idx)
 {
 	struct elf_shdr *shdr = &elf_info->sechdrs[idx];
@@ -377,7 +344,7 @@ static int elf_read_shdr(const char *buf, size_t len, struct elf_info *elf_info,
  * Use elf_is_ehdr_sane() if it wasn't.
  */
 static int elf_read_shdrs(const char *buf, size_t len,
-			  struct elf_info *elf_info)
+			  struct kexec_elf_info *elf_info)
 {
 	size_t shdr_size, i;
 
@@ -416,11 +383,13 @@ static int elf_read_shdrs(const char *buf, size_t len,
  * the kernel, byte-swapping the fields as needed.
  *
  * Return:
- * On success returns 0, and the caller should call elf_free_info(elf_info) to
- * free the memory allocated for the section and program headers.
+ * On success returns 0, and the caller should call
+ * kexec_free_elf_info(elf_info) to free the memory allocated for the section
+ * and program headers.
  */
-int elf_read_from_buffer(const char *buf, size_t len, struct elfhdr *ehdr,
-			 struct elf_info *elf_info)
+static int elf_read_from_buffer(const char *buf, size_t len,
+				struct elfhdr *ehdr,
+				struct kexec_elf_info *elf_info)
 {
 	int ret;
 
@@ -447,19 +416,19 @@ int elf_read_from_buffer(const char *buf, size_t len, struct elfhdr *ehdr,
 }
 
 /**
- * elf_free_info - free memory allocated by elf_read_from_buffer
+ * kexec_free_elf_info - free memory allocated by elf_read_from_buffer
  */
-void elf_free_info(struct elf_info *elf_info)
+void kexec_free_elf_info(struct kexec_elf_info *elf_info)
 {
 	kfree(elf_info->proghdrs);
 	kfree(elf_info->sechdrs);
 	memset(elf_info, 0, sizeof(*elf_info));
 }
 /**
- * build_elf_exec_info - read ELF executable and check that we can use it
+ * kexec_build_elf_info - read ELF executable and check that we can use it
  */
-static int build_elf_exec_info(const char *buf, size_t len, struct elfhdr *ehdr,
-			       struct elf_info *elf_info)
+int kexec_build_elf_info(const char *buf, size_t len, struct elfhdr *ehdr,
+			       struct kexec_elf_info *elf_info)
 {
 	int i;
 	int ret;
@@ -491,42 +460,42 @@ static int build_elf_exec_info(const char *buf, size_t len, struct elfhdr *ehdr,
 
 	return 0;
 error:
-	elf_free_info(elf_info);
+	kexec_free_elf_info(elf_info);
 	return -ENOEXEC;
 }
 
-static int elf64_probe(const char *buf, unsigned long len)
+
+int kexec_elf_probe(const char *buf, unsigned long len)
 {
 	struct elfhdr ehdr;
-	struct elf_info elf_info;
+	struct kexec_elf_info elf_info;
 	int ret;
 
-	ret = build_elf_exec_info(buf, len, &ehdr, &elf_info);
+	ret = kexec_build_elf_info(buf, len, &ehdr, &elf_info);
 	if (ret)
 		return ret;
 
-	elf_free_info(&elf_info);
+	kexec_free_elf_info(&elf_info);
 
 	return elf_check_arch(&ehdr) ? 0 : -ENOEXEC;
 }
 
 /**
- * elf_exec_load - load ELF executable image
+ * kexec_elf_load - load ELF executable image
  * @lowest_load_addr:	On return, will be the address where the first PT_LOAD
  *			section will be loaded in memory.
  *
  * Return:
  * 0 on success, negative value on failure.
  */
-static int elf_exec_load(struct kimage *image, struct elfhdr *ehdr,
-			 struct elf_info *elf_info,
+int kexec_elf_load(struct kimage *image, struct elfhdr *ehdr,
+			 struct kexec_elf_info *elf_info,
+			 struct kexec_buf *kbuf,
 			 unsigned long *lowest_load_addr)
 {
 	unsigned long base = 0, lowest_addr = UINT_MAX;
 	int ret;
 	size_t i;
-	struct kexec_buf kbuf = { .image = image, .buf_max = ppc64_rma_size,
-				  .top_down = false };
 
 	/* Read in the PT_LOAD segments. */
 	for (i = 0; i < ehdr->e_phnum; i++) {
@@ -542,15 +511,15 @@ static int elf_exec_load(struct kimage *image, struct elfhdr *ehdr,
 		if (size > phdr->p_memsz)
 			size = phdr->p_memsz;
 
-		kbuf.buffer = (void *) elf_info->buffer + phdr->p_offset;
-		kbuf.bufsz = size;
-		kbuf.memsz = phdr->p_memsz;
-		kbuf.buf_align = phdr->p_align;
-		kbuf.buf_min = phdr->p_paddr + base;
-		ret = kexec_add_buffer(&kbuf);
+		kbuf->buffer = (void *) elf_info->buffer + phdr->p_offset;
+		kbuf->bufsz = size;
+		kbuf->memsz = phdr->p_memsz;
+		kbuf->buf_align = phdr->p_align;
+		kbuf->buf_min = phdr->p_paddr + base;
+		ret = kexec_add_buffer(kbuf);
 		if (ret)
 			goto out;
-		load_addr = kbuf.mem;
+		load_addr = kbuf->mem;
 
 		if (load_addr < lowest_addr)
 			lowest_addr = load_addr;
@@ -565,100 +534,4 @@ static int elf_exec_load(struct kimage *image, struct elfhdr *ehdr,
 	return ret;
 }
 
-static void *elf64_load(struct kimage *image, char *kernel_buf,
-			unsigned long kernel_len, char *initrd,
-			unsigned long initrd_len, char *cmdline,
-			unsigned long cmdline_len)
-{
-	int ret;
-	unsigned int fdt_size;
-	unsigned long kernel_load_addr;
-	unsigned long initrd_load_addr = 0, fdt_load_addr;
-	void *fdt;
-	const void *slave_code;
-	struct elfhdr ehdr;
-	struct elf_info elf_info;
-	struct kexec_buf kbuf = { .image = image, .buf_min = 0,
-				  .buf_max = ppc64_rma_size };
-	struct kexec_buf pbuf = { .image = image, .buf_min = 0,
-				  .buf_max = ppc64_rma_size, .top_down = true };
-
-	ret = build_elf_exec_info(kernel_buf, kernel_len, &ehdr, &elf_info);
-	if (ret)
-		goto out;
-
-	ret = elf_exec_load(image, &ehdr, &elf_info, &kernel_load_addr);
-	if (ret)
-		goto out;
-
-	pr_debug("Loaded the kernel at 0x%lx\n", kernel_load_addr);
-
-	ret = kexec_load_purgatory(image, &pbuf);
-	if (ret) {
-		pr_err("Loading purgatory failed.\n");
-		goto out;
-	}
-
-	pr_debug("Loaded purgatory at 0x%lx\n", pbuf.mem);
-
-	if (initrd != NULL) {
-		kbuf.buffer = initrd;
-		kbuf.bufsz = kbuf.memsz = initrd_len;
-		kbuf.buf_align = PAGE_SIZE;
-		kbuf.top_down = false;
-		ret = kexec_add_buffer(&kbuf);
-		if (ret)
-			goto out;
-		initrd_load_addr = kbuf.mem;
-
-		pr_debug("Loaded initrd at 0x%lx\n", initrd_load_addr);
-	}
-
-	fdt_size = fdt_totalsize(initial_boot_params) * 2;
-	fdt = kmalloc(fdt_size, GFP_KERNEL);
-	if (!fdt) {
-		pr_err("Not enough memory for the device tree.\n");
-		ret = -ENOMEM;
-		goto out;
-	}
-	ret = fdt_open_into(initial_boot_params, fdt, fdt_size);
-	if (ret < 0) {
-		pr_err("Error setting up the new device tree.\n");
-		ret = -EINVAL;
-		goto out;
-	}
-
-	ret = setup_new_fdt(image, fdt, initrd_load_addr, initrd_len, cmdline);
-	if (ret)
-		goto out;
-
-	fdt_pack(fdt);
-
-	kbuf.buffer = fdt;
-	kbuf.bufsz = kbuf.memsz = fdt_size;
-	kbuf.buf_align = PAGE_SIZE;
-	kbuf.top_down = true;
-	ret = kexec_add_buffer(&kbuf);
-	if (ret)
-		goto out;
-	fdt_load_addr = kbuf.mem;
-
-	pr_debug("Loaded device tree at 0x%lx\n", fdt_load_addr);
-
-	slave_code = elf_info.buffer + elf_info.proghdrs[0].p_offset;
-	ret = setup_purgatory(image, slave_code, fdt, kernel_load_addr,
-			      fdt_load_addr);
-	if (ret)
-		pr_err("Error setting up the purgatory.\n");
-
-out:
-	elf_free_info(&elf_info);
-
-	/* Make kimage_file_post_load_cleanup free the fdt buffer for us. */
-	return ret ? ERR_PTR(ret) : fdt;
-}
 
-const struct kexec_file_ops kexec_elf64_ops = {
-	.probe = elf64_probe,
-	.load = elf64_load,
-};
-- 
2.20.1

