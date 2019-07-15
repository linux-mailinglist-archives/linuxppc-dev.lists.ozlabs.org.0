Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4934F68598
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jul 2019 10:34:18 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45nGzC1Dx0zDqTk
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jul 2019 18:34:15 +1000 (AEST)
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
 header.b="oyE5uVro"; dkim-atps=neutral
Received: from smtp.duncanthrax.net (smtp.duncanthrax.net
 [IPv6:2001:470:70c5:1111::170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45nGqY69Z1zDqV9
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jul 2019 18:27:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=duncanthrax.net; s=dkim; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=z8W9W6QwR0W0eMECiQ26IE6hEHL+BbH5N25UyJpt5cY=; b=oyE5uVroKS3kpUw2YKCTNGZ7Fv
 bCZ2SiDadWPwc1fbu0kZuEjiPz+KfIkm3ARqK2DT7EP0r0aL9jDBEGIGk8Hu9rIZu+q/UvmmBTVg1
 4zwOz7gIAzdKWVtvjuTSs1JCPPq98buW+vBwSEfBejKIyTvp2eZ7R60EOdAYTDeI9e3I=;
Received: from frobwit.duncanthrax.net ([89.31.1.178] helo=t470p.intern)
 by smtp.eurescom.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <svens@stackframe.org>)
 id 1hmwKa-0005LV-4w; Mon, 15 Jul 2019 10:27:32 +0200
From: Sven Schnelle <svens@stackframe.org>
To: kexec@lists.infradead.org
Subject: [PATCH v4 6/7] kexec_elf: remove unused variable in kexec_elf_load()
Date: Mon, 15 Jul 2019 10:27:01 +0200
Message-Id: <20190715082702.27308-7-svens@stackframe.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190715082702.27308-1-svens@stackframe.org>
References: <20190715082702.27308-1-svens@stackframe.org>
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

base was never assigned, so we can remove it.

Reviewed-by: Christophe Leroy <christophe.leroy@c-s.fr>
Signed-off-by: Sven Schnelle <svens@stackframe.org>
---
 kernel/kexec_elf.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/kernel/kexec_elf.c b/kernel/kexec_elf.c
index e346659af324..9421eebbacf0 100644
--- a/kernel/kexec_elf.c
+++ b/kernel/kexec_elf.c
@@ -350,7 +350,7 @@ int kexec_elf_load(struct kimage *image, struct elfhdr *ehdr,
 			 struct kexec_buf *kbuf,
 			 unsigned long *lowest_load_addr)
 {
-	unsigned long base = 0, lowest_addr = UINT_MAX;
+	unsigned long lowest_addr = UINT_MAX;
 	int ret;
 	size_t i;
 
@@ -372,7 +372,7 @@ int kexec_elf_load(struct kimage *image, struct elfhdr *ehdr,
 		kbuf->bufsz = size;
 		kbuf->memsz = phdr->p_memsz;
 		kbuf->buf_align = phdr->p_align;
-		kbuf->buf_min = phdr->p_paddr + base;
+		kbuf->buf_min = phdr->p_paddr;
 		ret = kexec_add_buffer(kbuf);
 		if (ret)
 			goto out;
@@ -382,9 +382,6 @@ int kexec_elf_load(struct kimage *image, struct elfhdr *ehdr,
 			lowest_addr = load_addr;
 	}
 
-	/* Update entry point to reflect new load address. */
-	ehdr->e_entry += base;
-
 	*lowest_load_addr = lowest_addr;
 	ret = 0;
  out:
-- 
2.20.1

