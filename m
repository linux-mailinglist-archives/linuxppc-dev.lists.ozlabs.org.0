Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4714755C3B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jun 2019 01:23:55 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45YMfw6KnDzDqbg
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jun 2019 09:23:52 +1000 (AEST)
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
 header.b="Tf7CDu3b"; dkim-atps=neutral
X-Greylist: delayed 2126 seconds by postgrey-1.36 at bilbo;
 Wed, 26 Jun 2019 05:30:13 AEST
Received: from smtp.duncanthrax.net (smtp.duncanthrax.net
 [IPv6:2001:470:70c5:1111::170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45YGTK13xLzDqND
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jun 2019 05:30:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=duncanthrax.net; s=dkim; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:
 To:From:Date; bh=xlnBXvLto8FDy+4M/HpNYsJYMrOS5HEmV3B7SjbEluk=; b=Tf7CDu3bX6MX
 WA19P3nJ+uJo6Ix4HfXISVbESGJ4eV7gQ+jfTFY/T8/xyqelx/HuZ2wRdC0MlNdC9wnDB31I+QqkF
 2A0ep8soNN9a14TaI5HJoxbieDsHcpiX6mchT88nfPixS8YkgBK7uNycCj2IlbxK8Hw/AYpQ1zvOb
 p6KK4=;
Received: from [134.3.44.134] (helo=t470p.stackframe.org)
 by smtp.eurescom.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.86_2) (envelope-from <svens@stackframe.org>)
 id 1hfqaS-0003ba-PX; Tue, 25 Jun 2019 20:54:37 +0200
Date: Tue, 25 Jun 2019 20:54:34 +0200
From: Sven Schnelle <svens@stackframe.org>
To: kexec@lists.infradead.org
Subject: [PATCH RFC] generic ELF support for kexec
Message-ID: <20190625185433.GA10934@t470p.stackframe.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Wed, 26 Jun 2019 09:22:23 +1000
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
Cc: linux-s390@vger.kernel.org, deller@gmx.de, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi List,

i recently started working on kexec for PA-RISC. While doing so, i figured
that powerpc already has support for reading ELF images inside of the Kernel.
My first attempt was to steal the source code and modify it for PA-RISC, but
it turned out that i didn't had to change much. Only ARM specific stuff like
fdt blob fetching had to be removed.

So instead of duplicating the code, i thought about moving the ELF stuff to
the core kexec code, and exposing several function to use that code from the
arch specific code.

I'm attaching the patch to this Mail. What do you think about that change?
s390 also uses ELF files, and (maybe?) could also switch to this implementation.
But i don't know anything about S/390 and don't have one in my basement. So
i'll leave s390 to the IBM folks.

I haven't really tested PowerPC yet. Can anyone give me a helping hand what
would be a good target to test this code in QEMU? Or even better, test this
code on real Hardware?

If that change is acceptable i would finish the patch and submit it. I think
best would be to push this change through Helge's parisc tree, so we don't
have any dependencies to sort out.

Regards,
Sven

[PATCH] kexec: add generic support for elf kernel images

Signed-off-by: Sven Schnelle <svens@stackframe.org>
---
 arch/Kconfig                       |   3 +
 arch/powerpc/Kconfig               |   1 +
 arch/powerpc/kernel/kexec_elf_64.c | 547 +--------------------------
 include/linux/kexec.h              |  35 ++
 kernel/Makefile                    |   1 +
 kernel/kexec_file_elf.c            | 574 +++++++++++++++++++++++++++++
 6 files changed, 619 insertions(+), 542 deletions(-)
 create mode 100644 kernel/kexec_file_elf.c

diff --git a/arch/Kconfig b/arch/Kconfig
index c47b328eada0..de7520100136 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -18,6 +18,9 @@ config KEXEC_CORE
 	select CRASH_CORE
 	bool
 
+config KEXEC_FILE_ELF
+	bool
+
 config HAVE_IMA_KEXEC
 	bool
 
diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 8c1c636308c8..48241260b6ae 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -502,6 +502,7 @@ config KEXEC_FILE
 	select KEXEC_CORE
 	select HAVE_IMA_KEXEC
 	select BUILD_BIN2C
+	select KEXEC_FILE_ELF
 	depends on PPC64
 	depends on CRYPTO=y
 	depends on CRYPTO_SHA256=y
diff --git a/arch/powerpc/kernel/kexec_elf_64.c b/arch/powerpc/kernel/kexec_elf_64.c
index ba4f18a43ee8..0059e36913e9 100644
--- a/arch/powerpc/kernel/kexec_elf_64.c
+++ b/arch/powerpc/kernel/kexec_elf_64.c
@@ -21,8 +21,6 @@
  * GNU General Public License for more details.
  */
 
-#define pr_fmt(fmt)	"kexec_elf: " fmt
-
 #include <linux/elf.h>
 #include <linux/kexec.h>
 #include <linux/libfdt.h>
@@ -31,540 +29,6 @@
 #include <linux/slab.h>
 #include <linux/types.h>
 
-#define PURGATORY_STACK_SIZE	(16 * 1024)
-
-#define elf_addr_to_cpu	elf64_to_cpu
-
-#ifndef Elf_Rel
-#define Elf_Rel		Elf64_Rel
-#endif /* Elf_Rel */
-
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
@@ -577,17 +41,17 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
 	void *fdt;
 	const void *slave_code;
 	struct elfhdr ehdr;
-	struct elf_info elf_info;
+	struct kexec_elf_info elf_info;
 	struct kexec_buf kbuf = { .image = image, .buf_min = 0,
 				  .buf_max = ppc64_rma_size };
 	struct kexec_buf pbuf = { .image = image, .buf_min = 0,
 				  .buf_max = ppc64_rma_size, .top_down = true };
 
-	ret = build_elf_exec_info(kernel_buf, kernel_len, &ehdr, &elf_info);
+	ret = kexec_build_elf_info(kernel_buf, kernel_len, &ehdr, &elf_info);
 	if (ret)
 		goto out;
 
-	ret = elf_exec_load(image, &ehdr, &elf_info, &kernel_load_addr);
+	ret = kexec_elf_load(image, &ehdr, &elf_info, &kbuf, &kernel_load_addr);
 	if (ret)
 		goto out;
 
@@ -652,13 +116,12 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
 		pr_err("Error setting up the purgatory.\n");
 
 out:
-	elf_free_info(&elf_info);
-
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
index b9b1bc5f9669..49b23b425f84 100644
--- a/include/linux/kexec.h
+++ b/include/linux/kexec.h
@@ -216,6 +216,41 @@ extern int crash_prepare_elf64_headers(struct crash_mem *mem, int kernel_map,
 				       void **addr, unsigned long *sz);
 #endif /* CONFIG_KEXEC_FILE */
 
+#ifdef CONFIG_KEXEC_FILE_ELF
+
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
+void kexec_free_elf_info(struct kexec_elf_info *elf_info);
+
+int kexec_build_elf_info(const char *buf, size_t len, struct elfhdr *ehdr,
+			  struct kexec_elf_info *elf_info);
+
+int kexec_elf_kernel_load(struct kimage *image, struct kexec_buf *kbuf,
+			  char *kernel_buf, unsigned long kernel_len,
+			  unsigned long *kernel_load_addr);
+
+int kexec_elf_probe(const char *buf, unsigned long len);
+
+int kexec_elf_load(struct kimage *image, struct elfhdr *ehdr,
+			 struct kexec_elf_info *elf_info,
+			 struct kexec_buf *kbuf,
+			 unsigned long *lowest_load_addr);
+
+int kexec_elf_load(struct kimage *image, struct elfhdr *ehdr,
+			 struct kexec_elf_info *elf_info,
+			 struct kexec_buf *kbuf,
+			 unsigned long *lowest_load_addr);
+#endif
 struct kimage {
 	kimage_entry_t head;
 	kimage_entry_t *entry;
diff --git a/kernel/Makefile b/kernel/Makefile
index 33824f0385b3..fdba91785977 100644
--- a/kernel/Makefile
+++ b/kernel/Makefile
@@ -64,6 +64,7 @@ obj-$(CONFIG_CRASH_CORE) += crash_core.o
 obj-$(CONFIG_KEXEC_CORE) += kexec_core.o
 obj-$(CONFIG_KEXEC) += kexec.o
 obj-$(CONFIG_KEXEC_FILE) += kexec_file.o
+obj-$(CONFIG_KEXEC_FILE_ELF) += kexec_file_elf.o
 obj-$(CONFIG_BACKTRACE_SELF_TEST) += backtracetest.o
 obj-$(CONFIG_COMPAT) += compat.o
 obj-$(CONFIG_CGROUPS) += cgroup/
diff --git a/kernel/kexec_file_elf.c b/kernel/kexec_file_elf.c
new file mode 100644
index 000000000000..bb966c93492c
--- /dev/null
+++ b/kernel/kexec_file_elf.c
@@ -0,0 +1,574 @@
+/*
+ * Load ELF vmlinux file for the kexec_file_load syscall.
+ *
+ * Copyright (C) 2004  Adam Litke (agl@us.ibm.com)
+ * Copyright (C) 2004  IBM Corp.
+ * Copyright (C) 2005  R Sharada (sharada@in.ibm.com)
+ * Copyright (C) 2006  Mohan Kumar M (mohan@in.ibm.com)
+ * Copyright (C) 2016  IBM Corporation
+ *
+ * Based on kexec-tools' kexec-elf-exec.c and kexec-elf-ppc64.c.
+ * Heavily modified for the kernel by
+ * Thiago Jung Bauermann <bauerman@linux.vnet.ibm.com>.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation (version 2 of the License).
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#define pr_fmt(fmt)	"kexec_elf: " fmt
+
+#include <linux/elf.h>
+#include <linux/kexec.h>
+#include <linux/libfdt.h>
+#include <linux/module.h>
+#include <linux/of_fdt.h>
+#include <linux/slab.h>
+#include <linux/types.h>
+
+#define elf_addr_to_cpu	elf64_to_cpu
+
+#ifndef Elf_Rel
+#define Elf_Rel		Elf64_Rel
+#endif /* Elf_Rel */
+
+static inline bool elf_is_elf_file(const struct elfhdr *ehdr)
+{
+       return memcmp(ehdr->e_ident, ELFMAG, SELFMAG) == 0;
+}
+
+static uint64_t elf64_to_cpu(const struct elfhdr *ehdr, uint64_t value)
+{
+	if (ehdr->e_ident[EI_DATA] == ELFDATA2LSB)
+		value = le64_to_cpu(value);
+	else if (ehdr->e_ident[EI_DATA] == ELFDATA2MSB)
+		value = be64_to_cpu(value);
+
+	return value;
+}
+
+static uint16_t elf16_to_cpu(const struct elfhdr *ehdr, uint16_t value)
+{
+	if (ehdr->e_ident[EI_DATA] == ELFDATA2LSB)
+		value = le16_to_cpu(value);
+	else if (ehdr->e_ident[EI_DATA] == ELFDATA2MSB)
+		value = be16_to_cpu(value);
+
+	return value;
+}
+
+static uint32_t elf32_to_cpu(const struct elfhdr *ehdr, uint32_t value)
+{
+	if (ehdr->e_ident[EI_DATA] == ELFDATA2LSB)
+		value = le32_to_cpu(value);
+	else if (ehdr->e_ident[EI_DATA] == ELFDATA2MSB)
+		value = be32_to_cpu(value);
+
+	return value;
+}
+
+/**
+ * elf_is_ehdr_sane - check that it is safe to use the ELF header
+ * @buf_len:	size of the buffer in which the ELF file is loaded.
+ */
+static bool elf_is_ehdr_sane(const struct elfhdr *ehdr, size_t buf_len)
+{
+	if (ehdr->e_phnum > 0 && ehdr->e_phentsize != sizeof(struct elf_phdr)) {
+		pr_debug("Bad program header size.\n");
+		return false;
+	} else if (ehdr->e_shnum > 0 &&
+		   ehdr->e_shentsize != sizeof(struct elf_shdr)) {
+		pr_debug("Bad section header size.\n");
+		return false;
+	} else if (ehdr->e_ident[EI_VERSION] != EV_CURRENT ||
+		   ehdr->e_version != EV_CURRENT) {
+		pr_debug("Unknown ELF version.\n");
+		return false;
+	}
+
+	if (ehdr->e_phoff > 0 && ehdr->e_phnum > 0) {
+		size_t phdr_size;
+
+		/*
+		 * e_phnum is at most 65535 so calculating the size of the
+		 * program header cannot overflow.
+		 */
+		phdr_size = sizeof(struct elf_phdr) * ehdr->e_phnum;
+
+		/* Sanity check the program header table location. */
+		if (ehdr->e_phoff + phdr_size < ehdr->e_phoff) {
+			pr_debug("Program headers at invalid location.\n");
+			return false;
+		} else if (ehdr->e_phoff + phdr_size > buf_len) {
+			pr_debug("Program headers truncated.\n");
+			return false;
+		}
+	}
+
+	if (ehdr->e_shoff > 0 && ehdr->e_shnum > 0) {
+		size_t shdr_size;
+
+		/*
+		 * e_shnum is at most 65536 so calculating
+		 * the size of the section header cannot overflow.
+		 */
+		shdr_size = sizeof(struct elf_shdr) * ehdr->e_shnum;
+
+		/* Sanity check the section header table location. */
+		if (ehdr->e_shoff + shdr_size < ehdr->e_shoff) {
+			pr_debug("Section headers at invalid location.\n");
+			return false;
+		} else if (ehdr->e_shoff + shdr_size > buf_len) {
+			pr_debug("Section headers truncated.\n");
+			return false;
+		}
+	}
+
+	return true;
+}
+
+static int elf_read_ehdr(const char *buf, size_t len, struct elfhdr *ehdr)
+{
+	struct elfhdr *buf_ehdr;
+
+	if (len < sizeof(*buf_ehdr)) {
+		pr_debug("Buffer is too small to hold ELF header.\n");
+		return -ENOEXEC;
+	}
+
+	memset(ehdr, 0, sizeof(*ehdr));
+	memcpy(ehdr->e_ident, buf, sizeof(ehdr->e_ident));
+	if (!elf_is_elf_file(ehdr)) {
+		pr_debug("No ELF header magic.\n");
+		return -ENOEXEC;
+	}
+
+	if (ehdr->e_ident[EI_CLASS] != ELF_CLASS) {
+		pr_debug("Not a supported ELF class.\n");
+		return -ENOEXEC;
+	} else  if (ehdr->e_ident[EI_DATA] != ELFDATA2LSB &&
+		ehdr->e_ident[EI_DATA] != ELFDATA2MSB) {
+		pr_debug("Not a supported ELF data format.\n");
+		return -ENOEXEC;
+	}
+
+	buf_ehdr = (struct elfhdr *) buf;
+	if (elf16_to_cpu(ehdr, buf_ehdr->e_ehsize) != sizeof(*buf_ehdr)) {
+		pr_debug("Bad ELF header size.\n");
+		return -ENOEXEC;
+	}
+
+	ehdr->e_type      = elf16_to_cpu(ehdr, buf_ehdr->e_type);
+	ehdr->e_machine   = elf16_to_cpu(ehdr, buf_ehdr->e_machine);
+	ehdr->e_version   = elf32_to_cpu(ehdr, buf_ehdr->e_version);
+	ehdr->e_entry     = elf_addr_to_cpu(ehdr, buf_ehdr->e_entry);
+	ehdr->e_phoff     = elf_addr_to_cpu(ehdr, buf_ehdr->e_phoff);
+	ehdr->e_shoff     = elf_addr_to_cpu(ehdr, buf_ehdr->e_shoff);
+	ehdr->e_flags     = elf32_to_cpu(ehdr, buf_ehdr->e_flags);
+	ehdr->e_phentsize = elf16_to_cpu(ehdr, buf_ehdr->e_phentsize);
+	ehdr->e_phnum     = elf16_to_cpu(ehdr, buf_ehdr->e_phnum);
+	ehdr->e_shentsize = elf16_to_cpu(ehdr, buf_ehdr->e_shentsize);
+	ehdr->e_shnum     = elf16_to_cpu(ehdr, buf_ehdr->e_shnum);
+	ehdr->e_shstrndx  = elf16_to_cpu(ehdr, buf_ehdr->e_shstrndx);
+
+	return elf_is_ehdr_sane(ehdr, len) ? 0 : -ENOEXEC;
+}
+
+/**
+ * elf_is_phdr_sane - check that it is safe to use the program header
+ * @buf_len:	size of the buffer in which the ELF file is loaded.
+ */
+static bool elf_is_phdr_sane(const struct elf_phdr *phdr, size_t buf_len)
+{
+
+	if (phdr->p_offset + phdr->p_filesz < phdr->p_offset) {
+		pr_debug("ELF segment location wraps around.\n");
+		return false;
+	} else if (phdr->p_offset + phdr->p_filesz > buf_len) {
+		pr_debug("ELF segment not in file.\n");
+		return false;
+	} else if (phdr->p_paddr + phdr->p_memsz < phdr->p_paddr) {
+		pr_debug("ELF segment address wraps around.\n");
+		return false;
+	}
+
+	return true;
+}
+
+static int elf_read_phdr(const char *buf, size_t len, struct kexec_elf_info *elf_info,
+			 int idx)
+{
+	/* Override the const in proghdrs, we are the ones doing the loading. */
+	struct elf_phdr *phdr = (struct elf_phdr *) &elf_info->proghdrs[idx];
+	const char *pbuf;
+	struct elf_phdr *buf_phdr;
+
+	pbuf = buf + elf_info->ehdr->e_phoff + (idx * sizeof(*buf_phdr));
+	buf_phdr = (struct elf_phdr *) pbuf;
+
+	phdr->p_type   = elf32_to_cpu(elf_info->ehdr, buf_phdr->p_type);
+	phdr->p_offset = elf_addr_to_cpu(elf_info->ehdr, buf_phdr->p_offset);
+	phdr->p_paddr  = elf_addr_to_cpu(elf_info->ehdr, buf_phdr->p_paddr);
+	phdr->p_vaddr  = elf_addr_to_cpu(elf_info->ehdr, buf_phdr->p_vaddr);
+	phdr->p_flags  = elf32_to_cpu(elf_info->ehdr, buf_phdr->p_flags);
+
+	/*
+	 * The following fields have a type equivalent to Elf_Addr
+	 * both in 32 bit and 64 bit ELF.
+	 */
+	phdr->p_filesz = elf_addr_to_cpu(elf_info->ehdr, buf_phdr->p_filesz);
+	phdr->p_memsz  = elf_addr_to_cpu(elf_info->ehdr, buf_phdr->p_memsz);
+	phdr->p_align  = elf_addr_to_cpu(elf_info->ehdr, buf_phdr->p_align);
+
+	return elf_is_phdr_sane(phdr, len) ? 0 : -ENOEXEC;
+}
+
+/**
+ * elf_read_phdrs - read the program headers from the buffer
+ *
+ * This function assumes that the program header table was checked for sanity.
+ * Use elf_is_ehdr_sane() if it wasn't.
+ */
+static int elf_read_phdrs(const char *buf, size_t len,
+			  struct kexec_elf_info *elf_info)
+{
+	size_t phdr_size, i;
+	const struct elfhdr *ehdr = elf_info->ehdr;
+
+	/*
+	 * e_phnum is at most 65535 so calculating the size of the
+	 * program header cannot overflow.
+	 */
+	phdr_size = sizeof(struct elf_phdr) * ehdr->e_phnum;
+
+	elf_info->proghdrs = kzalloc(phdr_size, GFP_KERNEL);
+	if (!elf_info->proghdrs)
+		return -ENOMEM;
+
+	for (i = 0; i < ehdr->e_phnum; i++) {
+		int ret;
+
+		ret = elf_read_phdr(buf, len, elf_info, i);
+		if (ret) {
+			kfree(elf_info->proghdrs);
+			elf_info->proghdrs = NULL;
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+/**
+ * elf_is_shdr_sane - check that it is safe to use the section header
+ * @buf_len:	size of the buffer in which the ELF file is loaded.
+ */
+static bool elf_is_shdr_sane(const struct elf_shdr *shdr, size_t buf_len)
+{
+	bool size_ok;
+
+	/* SHT_NULL headers have undefined values, so we can't check them. */
+	if (shdr->sh_type == SHT_NULL)
+		return true;
+
+	/* Now verify sh_entsize */
+	switch (shdr->sh_type) {
+	case SHT_SYMTAB:
+		size_ok = shdr->sh_entsize == sizeof(Elf_Sym);
+		break;
+	case SHT_RELA:
+		size_ok = shdr->sh_entsize == sizeof(Elf_Rela);
+		break;
+	case SHT_DYNAMIC:
+		size_ok = shdr->sh_entsize == sizeof(Elf_Dyn);
+		break;
+	case SHT_REL:
+		size_ok = shdr->sh_entsize == sizeof(Elf_Rel);
+		break;
+	case SHT_NOTE:
+	case SHT_PROGBITS:
+	case SHT_HASH:
+	case SHT_NOBITS:
+	default:
+		/*
+		 * This is a section whose entsize requirements
+		 * I don't care about.  If I don't know about
+		 * the section I can't care about it's entsize
+		 * requirements.
+		 */
+		size_ok = true;
+		break;
+	}
+
+	if (!size_ok) {
+		pr_debug("ELF section with wrong entry size.\n");
+		return false;
+	} else if (shdr->sh_addr + shdr->sh_size < shdr->sh_addr) {
+		pr_debug("ELF section address wraps around.\n");
+		return false;
+	}
+
+	if (shdr->sh_type != SHT_NOBITS) {
+		if (shdr->sh_offset + shdr->sh_size < shdr->sh_offset) {
+			pr_debug("ELF section location wraps around.\n");
+			return false;
+		} else if (shdr->sh_offset + shdr->sh_size > buf_len) {
+			pr_debug("ELF section not in file.\n");
+			return false;
+		}
+	}
+
+	return true;
+}
+
+static int elf_read_shdr(const char *buf, size_t len, struct kexec_elf_info *elf_info,
+			 int idx)
+{
+	struct elf_shdr *shdr = &elf_info->sechdrs[idx];
+	const struct elfhdr *ehdr = elf_info->ehdr;
+	const char *sbuf;
+	struct elf_shdr *buf_shdr;
+
+	sbuf = buf + ehdr->e_shoff + idx * sizeof(*buf_shdr);
+	buf_shdr = (struct elf_shdr *) sbuf;
+
+	shdr->sh_name      = elf32_to_cpu(ehdr, buf_shdr->sh_name);
+	shdr->sh_type      = elf32_to_cpu(ehdr, buf_shdr->sh_type);
+	shdr->sh_addr      = elf_addr_to_cpu(ehdr, buf_shdr->sh_addr);
+	shdr->sh_offset    = elf_addr_to_cpu(ehdr, buf_shdr->sh_offset);
+	shdr->sh_link      = elf32_to_cpu(ehdr, buf_shdr->sh_link);
+	shdr->sh_info      = elf32_to_cpu(ehdr, buf_shdr->sh_info);
+
+	/*
+	 * The following fields have a type equivalent to Elf_Addr
+	 * both in 32 bit and 64 bit ELF.
+	 */
+	shdr->sh_flags     = elf_addr_to_cpu(ehdr, buf_shdr->sh_flags);
+	shdr->sh_size      = elf_addr_to_cpu(ehdr, buf_shdr->sh_size);
+	shdr->sh_addralign = elf_addr_to_cpu(ehdr, buf_shdr->sh_addralign);
+	shdr->sh_entsize   = elf_addr_to_cpu(ehdr, buf_shdr->sh_entsize);
+
+	return elf_is_shdr_sane(shdr, len) ? 0 : -ENOEXEC;
+}
+
+/**
+ * elf_read_shdrs - read the section headers from the buffer
+ *
+ * This function assumes that the section header table was checked for sanity.
+ * Use elf_is_ehdr_sane() if it wasn't.
+ */
+static int elf_read_shdrs(const char *buf, size_t len,
+			  struct kexec_elf_info *elf_info)
+{
+	size_t shdr_size, i;
+
+	/*
+	 * e_shnum is at most 65536 so calculating
+	 * the size of the section header cannot overflow.
+	 */
+	shdr_size = sizeof(struct elf_shdr) * elf_info->ehdr->e_shnum;
+
+	elf_info->sechdrs = kzalloc(shdr_size, GFP_KERNEL);
+	if (!elf_info->sechdrs)
+		return -ENOMEM;
+
+	for (i = 0; i < elf_info->ehdr->e_shnum; i++) {
+		int ret;
+
+		ret = elf_read_shdr(buf, len, elf_info, i);
+		if (ret) {
+			kfree(elf_info->sechdrs);
+			elf_info->sechdrs = NULL;
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+/**
+ * elf_read_from_buffer - read ELF file and sets up ELF header and ELF info
+ * @buf:	Buffer to read ELF file from.
+ * @len:	Size of @buf.
+ * @ehdr:	Pointer to existing struct which will be populated.
+ * @elf_info:	Pointer to existing struct which will be populated.
+ *
+ * This function allows reading ELF files with different byte order than
+ * the kernel, byte-swapping the fields as needed.
+ *
+ * Return:
+ * On success returns 0, and the caller should call kexec_free_elf_info(elf_info) to
+ * free the memory allocated for the section and program headers.
+ */
+int elf_read_from_buffer(const char *buf, size_t len, struct elfhdr *ehdr,
+			 struct kexec_elf_info *elf_info)
+{
+	int ret;
+
+	ret = elf_read_ehdr(buf, len, ehdr);
+	if (ret)
+		return ret;
+
+	elf_info->buffer = buf;
+	elf_info->ehdr = ehdr;
+	if (ehdr->e_phoff > 0 && ehdr->e_phnum > 0) {
+		ret = elf_read_phdrs(buf, len, elf_info);
+		if (ret)
+			return ret;
+	}
+	if (ehdr->e_shoff > 0 && ehdr->e_shnum > 0) {
+		ret = elf_read_shdrs(buf, len, elf_info);
+		if (ret) {
+			kfree(elf_info->proghdrs);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+/**
+ * kexec_free_elf_info - free memory allocated by elf_read_from_buffer
+ */
+void kexec_free_elf_info(struct kexec_elf_info *elf_info)
+{
+	kfree(elf_info->proghdrs);
+	kfree(elf_info->sechdrs);
+	memset(elf_info, 0, sizeof(*elf_info));
+}
+EXPORT_SYMBOL(kexec_free_elf_info);
+
+/**
+ * kexec_build_elf_info - read ELF executable and check that we can use it
+ */
+int kexec_build_elf_info(const char *buf, size_t len, struct elfhdr *ehdr,
+			  struct kexec_elf_info *elf_info)
+{
+	int i;
+	int ret;
+
+	ret = elf_read_from_buffer(buf, len, ehdr, elf_info);
+	if (ret)
+		return ret;
+
+	/* Big endian vmlinux has type ET_DYN. */
+	if (ehdr->e_type != ET_EXEC && ehdr->e_type != ET_DYN) {
+		pr_err("Not an ELF executable.\n");
+		goto error;
+	} else if (!elf_info->proghdrs) {
+		pr_err("No ELF program header.\n");
+		goto error;
+	}
+
+	for (i = 0; i < ehdr->e_phnum; i++) {
+		/*
+		 * Kexec does not support loading interpreters.
+		 * In addition this check keeps us from attempting
+		 * to kexec ordinay executables.
+		 */
+		if (elf_info->proghdrs[i].p_type == PT_INTERP) {
+			pr_err("Requires an ELF interpreter.\n");
+			goto error;
+		}
+	}
+
+	return 0;
+error:
+	kexec_free_elf_info(elf_info);
+	return -ENOEXEC;
+}
+EXPORT_SYMBOL(kexec_build_elf_info);
+
+/**
+ * elf_exec_load - load ELF executable image
+ * @lowest_load_addr:	On return, will be the address where the first PT_LOAD
+ *			section will be loaded in memory.
+ *
+ * Return:
+ * 0 on success, negative value on failure.
+ */
+int kexec_elf_load(struct kimage *image, struct elfhdr *ehdr,
+		   struct kexec_elf_info *elf_info,
+		   struct kexec_buf *kbuf,
+		   unsigned long *lowest_load_addr)
+{
+	unsigned long lowest_addr = UINT_MAX;
+	int ret;
+	size_t i;
+	/* Read in the PT_LOAD segments. */
+	for (i = 0; i < ehdr->e_phnum; i++) {
+		unsigned long load_addr;
+		size_t size;
+		const struct elf_phdr *phdr;
+
+		phdr = &elf_info->proghdrs[i];
+		if (phdr->p_type != PT_LOAD)
+			continue;
+
+		size = phdr->p_filesz;
+		if (size > phdr->p_memsz)
+			size = phdr->p_memsz;
+
+		kbuf->buffer = (void *) elf_info->buffer + phdr->p_offset;
+		kbuf->bufsz = size;
+		kbuf->memsz = phdr->p_memsz;
+		kbuf->buf_align = phdr->p_align;
+		kbuf->buf_min = phdr->p_paddr;
+		kbuf->mem = KEXEC_BUF_MEM_UNKNOWN;
+		ret = kexec_add_buffer(kbuf);
+		if (ret)
+			goto out;
+		load_addr = kbuf->mem;
+
+		if (load_addr < lowest_addr)
+			lowest_addr = load_addr;
+	}
+
+	image->start = ehdr->e_entry;
+	*lowest_load_addr = lowest_addr;
+	ret = 0;
+ out:
+	return ret;
+}
+EXPORT_SYMBOL(kexec_elf_load);
+
+int kexec_elf_kernel_load(struct kimage *image, struct kexec_buf *kbuf,
+			char *kernel_buf, unsigned long kernel_len,
+			unsigned long *kernel_load_addr)
+{
+	int ret;
+	struct elfhdr ehdr;
+	struct kexec_elf_info elf_info;
+
+	ret = kexec_build_elf_info(kernel_buf, kernel_len, &ehdr, &elf_info);
+	if (ret)
+		goto out;
+
+	ret = kexec_elf_load(image, &ehdr, &elf_info, kbuf, kernel_load_addr);
+out:
+	kexec_free_elf_info(&elf_info);
+	return ret;
+
+}
+EXPORT_SYMBOL(kexec_elf_kernel_load);
+
+int kexec_elf_probe(const char *buf, unsigned long len)
+{
+	struct elfhdr ehdr;
+	struct kexec_elf_info elf_info;
+	int ret;
+
+	ret = kexec_build_elf_info(buf, len, &ehdr, &elf_info);
+	if (ret)
+		return ret;
+
+	kexec_free_elf_info(&elf_info);
+
+	return elf_check_arch(&ehdr) ? 0 : -ENOEXEC;
+}
+EXPORT_SYMBOL(kexec_elf_probe);
-- 
2.20.1

