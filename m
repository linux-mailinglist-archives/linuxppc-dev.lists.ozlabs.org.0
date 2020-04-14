Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E441B1A747D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 09:17:05 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 491cHg08hQzDqZR
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 17:17:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+4a22011dcb1da0b09bf4+6078+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=bombadil.20170209 header.b=shGFAATh; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 491byR48ZNzDqXB
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Apr 2020 17:02:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=PqrAb/R+T1+weUMpxzPvgPO+qhhXZzaZTaIC3FpFndY=; b=shGFAAThy+2ClIl03W3qrPhTZZ
 YiIoEhLSMwgyWDyIeQeC3VXXlOCOtS8NYwEmW8hsGoj/IzTDpp46tBATY+m6pr3Xb51D/W8DTWqaK
 aIgvc8CP+sX8Ti65id35W3OobQpFFW8uAGf6MqG+kU1aXuEAhw+rLJH0nBVELavuGjvZBxPyG1xyF
 kbKiFH/1vgIBTZp3rnyXgQbY4cdsule8sf8OVKzuIMtSOlsuuBW/T9Yx3+FAfL1Gmt6rcDo448EMK
 ysReccNTBd0QAORYfljkognerhewzL7IzawHmYflSNLc1r+ze42NXwXXlv94jNDhnCHgVC1dFAjqD
 KanZ5feg==;
Received: from [2001:4bb8:180:384b:4c21:af7:dd95:e552] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jOFa6-0005ZO-1a; Tue, 14 Apr 2020 07:02:02 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>
Subject: [PATCH 6/8] binfmt_elf_fdpic: remove the set_fs(KERNEL_DS) in
 elf_fdpic_core_dump
Date: Tue, 14 Apr 2020 09:01:40 +0200
Message-Id: <20200414070142.288696-7-hch@lst.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200414070142.288696-1-hch@lst.de>
References: <20200414070142.288696-1-hch@lst.de>
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
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 Jeremy Kerr <jk@ozlabs.org>, linux-fsdevel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, "Eric W . Biederman" <ebiederm@xmission.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There is no logic in elf_fdpic_core_dump itself that uses uaccess
routines on kernel pointers, the file writes are nicely encapsulated in
dump_emit which does its own set_fs.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/binfmt_elf_fdpic.c | 31 ++++++++++++-------------------
 1 file changed, 12 insertions(+), 19 deletions(-)

diff --git a/fs/binfmt_elf_fdpic.c b/fs/binfmt_elf_fdpic.c
index 240f66663543..c62c17a5c34a 100644
--- a/fs/binfmt_elf_fdpic.c
+++ b/fs/binfmt_elf_fdpic.c
@@ -1549,7 +1549,6 @@ static int elf_fdpic_core_dump(struct coredump_params *cprm)
 {
 #define	NUM_NOTES	6
 	int has_dumped = 0;
-	mm_segment_t fs;
 	int segs;
 	int i;
 	struct vm_area_struct *vma;
@@ -1678,9 +1677,6 @@ static int elf_fdpic_core_dump(struct coredump_params *cprm)
 			  "LINUX", ELF_CORE_XFPREG_TYPE, sizeof(*xfpu), xfpu);
 #endif
 
-	fs = get_fs();
-	set_fs(KERNEL_DS);
-
 	offset += sizeof(*elf);				/* Elf header */
 	offset += segs * sizeof(struct elf_phdr);	/* Program headers */
 
@@ -1695,7 +1691,7 @@ static int elf_fdpic_core_dump(struct coredump_params *cprm)
 
 		phdr4note = kmalloc(sizeof(*phdr4note), GFP_KERNEL);
 		if (!phdr4note)
-			goto end_coredump;
+			goto cleanup;
 
 		fill_elf_note_phdr(phdr4note, sz, offset);
 		offset += sz;
@@ -1711,17 +1707,17 @@ static int elf_fdpic_core_dump(struct coredump_params *cprm)
 	if (e_phnum == PN_XNUM) {
 		shdr4extnum = kmalloc(sizeof(*shdr4extnum), GFP_KERNEL);
 		if (!shdr4extnum)
-			goto end_coredump;
+			goto cleanup;
 		fill_extnum_info(elf, shdr4extnum, e_shoff, segs);
 	}
 
 	offset = dataoff;
 
 	if (!dump_emit(cprm, elf, sizeof(*elf)))
-		goto end_coredump;
+		goto cleanup;
 
 	if (!dump_emit(cprm, phdr4note, sizeof(*phdr4note)))
-		goto end_coredump;
+		goto cleanup;
 
 	/* write program headers for segments dump */
 	for (vma = current->mm->mmap; vma; vma = vma->vm_next) {
@@ -1745,16 +1741,16 @@ static int elf_fdpic_core_dump(struct coredump_params *cprm)
 		phdr.p_align = ELF_EXEC_PAGESIZE;
 
 		if (!dump_emit(cprm, &phdr, sizeof(phdr)))
-			goto end_coredump;
+			goto cleanup;
 	}
 
 	if (!elf_core_write_extra_phdrs(cprm, offset))
-		goto end_coredump;
+		goto cleanup;
 
  	/* write out the notes section */
 	for (i = 0; i < numnote; i++)
 		if (!writenote(notes + i, cprm))
-			goto end_coredump;
+			goto cleanup;
 
 	/* write out the thread status notes section */
 	list_for_each(t, &thread_list) {
@@ -1763,21 +1759,21 @@ static int elf_fdpic_core_dump(struct coredump_params *cprm)
 
 		for (i = 0; i < tmp->num_notes; i++)
 			if (!writenote(&tmp->notes[i], cprm))
-				goto end_coredump;
+				goto cleanup;
 	}
 
 	if (!dump_skip(cprm, dataoff - cprm->pos))
-		goto end_coredump;
+		goto cleanup;
 
 	if (!elf_fdpic_dump_segments(cprm))
-		goto end_coredump;
+		goto cleanup;
 
 	if (!elf_core_write_extra_data(cprm))
-		goto end_coredump;
+		goto cleanup;
 
 	if (e_phnum == PN_XNUM) {
 		if (!dump_emit(cprm, shdr4extnum, sizeof(*shdr4extnum)))
-			goto end_coredump;
+			goto cleanup;
 	}
 
 	if (cprm->file->f_pos != offset) {
@@ -1787,9 +1783,6 @@ static int elf_fdpic_core_dump(struct coredump_params *cprm)
 		       cprm->file->f_pos, offset);
 	}
 
-end_coredump:
-	set_fs(fs);
-
 cleanup:
 	while (!list_empty(&thread_list)) {
 		struct list_head *tmp = thread_list.next;
-- 
2.25.1

