Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 689141BAF26
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Apr 2020 22:17:34 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 499x0C5SHVzDqgN
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Apr 2020 06:17:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+7fdffca6c44e2812a750+6091+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 499wll60yYzDqdR
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Apr 2020 06:06:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=1+WS1Xhpo5dh5/K2iq/WBTCS2RIT+YVHJWX5t7HhvUg=; b=cuHYqPJhmemVEW4g5IZkPvFnAx
 4QYYX+TRsj5yeIFpNZRUrX0hYCsMPYxpQIS76eH+vpCmUtBRTO17yNYSw7BBkmBOCngDdqYetZzc1
 yrzgSiFidwVjPAbCiPQ6kNIRJjN8jqbl7aLVtrw7oW/gtSjYYw8sMP7MyrjqR2aRDt/L4BBhKJYLn
 5fkZh0SVb3uWAP1mQbueLOFgPnyihnXMuSpsstQyPKY/e5P+DMUMfiKW01Pi8v74mXfRki+IZ29MH
 n+GPb3ZgUnOkng9EL8E/ZJ3GZdxwueolVaKbOR0y2tSUSjyqTN02WNnzXVyTRL9O0RfYzd1zAg4VH
 hqh8MCRw==;
Received: from [2001:4bb8:193:f203:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTA1W-00018Y-4n; Mon, 27 Apr 2020 20:06:38 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>
Subject: [PATCH 4/5] binfmt_elf: remove the set_fs(KERNEL_DS) in elf_core_dump
Date: Mon, 27 Apr 2020 22:06:24 +0200
Message-Id: <20200427200626.1622060-5-hch@lst.de>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200427200626.1622060-1-hch@lst.de>
References: <20200427200626.1622060-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: Arnd Bergmann <arnd@arndb.de>,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org,
 Jeremy Kerr <jk@ozlabs.org>, linux-fsdevel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, "Eric W . Biederman" <ebiederm@xmission.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There is no logic in elf_core_dump itself or in the various arch helpers
called from it which use uaccess routines on kernel pointers except for
the file writes thate are nicely encapsulated by using __kernel_write in
dump_emit.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/binfmt_elf.c | 40 +++++++++++++---------------------------
 1 file changed, 13 insertions(+), 27 deletions(-)

diff --git a/fs/binfmt_elf.c b/fs/binfmt_elf.c
index a1f57e20c3cf2..b29b84595b09f 100644
--- a/fs/binfmt_elf.c
+++ b/fs/binfmt_elf.c
@@ -1355,7 +1355,6 @@ static unsigned long vma_dump_size(struct vm_area_struct *vma,
 	    vma->vm_pgoff == 0 && (vma->vm_flags & VM_READ)) {
 		u32 __user *header = (u32 __user *) vma->vm_start;
 		u32 word;
-		mm_segment_t fs = get_fs();
 		/*
 		 * Doing it this way gets the constant folded by GCC.
 		 */
@@ -1368,14 +1367,8 @@ static unsigned long vma_dump_size(struct vm_area_struct *vma,
 		magic.elfmag[EI_MAG1] = ELFMAG1;
 		magic.elfmag[EI_MAG2] = ELFMAG2;
 		magic.elfmag[EI_MAG3] = ELFMAG3;
-		/*
-		 * Switch to the user "segment" for get_user(),
-		 * then put back what elf_core_dump() had in place.
-		 */
-		set_fs(USER_DS);
 		if (unlikely(get_user(word, header)))
 			word = 0;
-		set_fs(fs);
 		if (word == magic.cmp)
 			return PAGE_SIZE;
 	}
@@ -2183,7 +2176,6 @@ static void fill_extnum_info(struct elfhdr *elf, struct elf_shdr *shdr4extnum,
 static int elf_core_dump(struct coredump_params *cprm)
 {
 	int has_dumped = 0;
-	mm_segment_t fs;
 	int segs, i;
 	size_t vma_data_size = 0;
 	struct vm_area_struct *vma, *gate_vma;
@@ -2236,9 +2228,6 @@ static int elf_core_dump(struct coredump_params *cprm)
 
 	has_dumped = 1;
 
-	fs = get_fs();
-	set_fs(KERNEL_DS);
-
 	offset += sizeof(elf);				/* Elf header */
 	offset += segs * sizeof(struct elf_phdr);	/* Program headers */
 
@@ -2250,7 +2239,7 @@ static int elf_core_dump(struct coredump_params *cprm)
 
 		phdr4note = kmalloc(sizeof(*phdr4note), GFP_KERNEL);
 		if (!phdr4note)
-			goto end_coredump;
+			goto cleanup;
 
 		fill_elf_note_phdr(phdr4note, sz, offset);
 		offset += sz;
@@ -2265,7 +2254,7 @@ static int elf_core_dump(struct coredump_params *cprm)
 	vma_filesz = kvmalloc(array_size(sizeof(*vma_filesz), (segs - 1)),
 			      GFP_KERNEL);
 	if (!vma_filesz)
-		goto end_coredump;
+		goto cleanup;
 
 	for (i = 0, vma = first_vma(current, gate_vma); vma != NULL;
 			vma = next_vma(vma, gate_vma)) {
@@ -2283,17 +2272,17 @@ static int elf_core_dump(struct coredump_params *cprm)
 	if (e_phnum == PN_XNUM) {
 		shdr4extnum = kmalloc(sizeof(*shdr4extnum), GFP_KERNEL);
 		if (!shdr4extnum)
-			goto end_coredump;
+			goto cleanup;
 		fill_extnum_info(&elf, shdr4extnum, e_shoff, segs);
 	}
 
 	offset = dataoff;
 
 	if (!dump_emit(cprm, &elf, sizeof(elf)))
-		goto end_coredump;
+		goto cleanup;
 
 	if (!dump_emit(cprm, phdr4note, sizeof(*phdr4note)))
-		goto end_coredump;
+		goto cleanup;
 
 	/* Write program headers for segments dump */
 	for (i = 0, vma = first_vma(current, gate_vma); vma != NULL;
@@ -2315,22 +2304,22 @@ static int elf_core_dump(struct coredump_params *cprm)
 		phdr.p_align = ELF_EXEC_PAGESIZE;
 
 		if (!dump_emit(cprm, &phdr, sizeof(phdr)))
-			goto end_coredump;
+			goto cleanup;
 	}
 
 	if (!elf_core_write_extra_phdrs(cprm, offset))
-		goto end_coredump;
+		goto cleanup;
 
  	/* write out the notes section */
 	if (!write_note_info(&info, cprm))
-		goto end_coredump;
+		goto cleanup;
 
 	if (elf_coredump_extra_notes_write(cprm))
-		goto end_coredump;
+		goto cleanup;
 
 	/* Align to page */
 	if (!dump_skip(cprm, dataoff - cprm->pos))
-		goto end_coredump;
+		goto cleanup;
 
 	for (i = 0, vma = first_vma(current, gate_vma); vma != NULL;
 			vma = next_vma(vma, gate_vma)) {
@@ -2352,22 +2341,19 @@ static int elf_core_dump(struct coredump_params *cprm)
 			} else
 				stop = !dump_skip(cprm, PAGE_SIZE);
 			if (stop)
-				goto end_coredump;
+				goto cleanup;
 		}
 	}
 	dump_truncate(cprm);
 
 	if (!elf_core_write_extra_data(cprm))
-		goto end_coredump;
+		goto cleanup;
 
 	if (e_phnum == PN_XNUM) {
 		if (!dump_emit(cprm, shdr4extnum, sizeof(*shdr4extnum)))
-			goto end_coredump;
+			goto cleanup;
 	}
 
-end_coredump:
-	set_fs(fs);
-
 cleanup:
 	free_note_info(&info);
 	kfree(shdr4extnum);
-- 
2.26.1

