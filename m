Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A979B7D9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Aug 2019 22:46:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46FYNR3LTrzDrJv
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Aug 2019 06:46:47 +1000 (AEST)
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
 header.b="h2tqFoc8"; dkim-atps=neutral
Received: from smtp.duncanthrax.net (smtp.duncanthrax.net
 [IPv6:2001:470:70c5:1111::170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46FYCh055PzDsNq
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Aug 2019 06:39:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=duncanthrax.net; s=dkim; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=2ZP8jNHjKayjWxrgpiIhe90wemxxnK4Tvq4Ce1UL22c=; b=h2tqFoc8Tg3fF5VgzpYUlVLpDq
 7MZLqY9aLfD6ADhkUBAo+2UKUy3u3X53qmNoYOyhzlPsqUQxuk1qgJdHi+qVLiXaLeZyHYOPRVbGV
 3v+5d3JlfyyuxDU/VcnB0Pxu/6W6qnuFVU9Amsr6HlWFwdNOzzw2P9RpMh1Kc2I1CKN8=;
Received: from [134.3.44.134] (helo=x280.stackframe.org)
 by smtp.eurescom.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <svens@stackframe.org>)
 id 1i1FZ2-00071n-Nb; Fri, 23 Aug 2019 21:49:36 +0200
From: Sven Schnelle <svens@stackframe.org>
To: kexec@lists.infradead.org
Subject: [PATCH v5 3/7] kexec_elf: remove parsing of section headers
Date: Fri, 23 Aug 2019 21:49:15 +0200
Message-Id: <20190823194919.30916-4-svens@stackframe.org>
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

We're not using them, so we can drop the parsing.

Signed-off-by: Sven Schnelle <svens@stackframe.org>
Reviewed-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
---
 include/linux/kexec.h |   1 -
 kernel/kexec_elf.c    | 137 ------------------------------------------
 2 files changed, 138 deletions(-)

diff --git a/include/linux/kexec.h b/include/linux/kexec.h
index da2a6b1d69e7..f0b809258ed3 100644
--- a/include/linux/kexec.h
+++ b/include/linux/kexec.h
@@ -226,7 +226,6 @@ struct kexec_elf_info {
 
 	const struct elfhdr *ehdr;
 	const struct elf_phdr *proghdrs;
-	struct elf_shdr *sechdrs;
 };
 
 int kexec_build_elf_info(const char *buf, size_t len, struct elfhdr *ehdr,
diff --git a/kernel/kexec_elf.c b/kernel/kexec_elf.c
index 34376fbc55be..137037603117 100644
--- a/kernel/kexec_elf.c
+++ b/kernel/kexec_elf.c
@@ -257,134 +257,6 @@ static int elf_read_phdrs(const char *buf, size_t len,
 	return 0;
 }
 
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
-static int elf_read_shdr(const char *buf, size_t len,
-			 struct kexec_elf_info *elf_info,
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
-			  struct kexec_elf_info *elf_info)
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
 /**
  * elf_read_from_buffer - read ELF file and sets up ELF header and ELF info
  * @buf:	Buffer to read ELF file from.
@@ -417,14 +289,6 @@ static int elf_read_from_buffer(const char *buf, size_t len,
 		if (ret)
 			return ret;
 	}
-	if (ehdr->e_shoff > 0 && ehdr->e_shnum > 0) {
-		ret = elf_read_shdrs(buf, len, elf_info);
-		if (ret) {
-			kfree(elf_info->proghdrs);
-			return ret;
-		}
-	}
-
 	return 0;
 }
 
@@ -434,7 +298,6 @@ static int elf_read_from_buffer(const char *buf, size_t len,
 void kexec_free_elf_info(struct kexec_elf_info *elf_info)
 {
 	kfree(elf_info->proghdrs);
-	kfree(elf_info->sechdrs);
 	memset(elf_info, 0, sizeof(*elf_info));
 }
 /**
-- 
2.23.0.rc1

