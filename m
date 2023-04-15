Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B726E2FF1
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Apr 2023 11:09:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pz6vn1gw7z3fSv
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Apr 2023 19:09:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=nIsKl560;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com; envelope-from=lstoakes@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=nIsKl560;
	dkim-atps=neutral
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pz6tv0bPlz2xVn
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Apr 2023 19:08:54 +1000 (AEST)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-3f0acdd46f2so3271735e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Apr 2023 02:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681549730; x=1684141730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=InhEM3EHiRkXrRv+rDOd/57bP6C2VpOkdZxgrLu5jHw=;
        b=nIsKl560k8l1z5w+7Vj9euFCWZH9iEYRsj90660ZNXMvB3jyD9wfY0wtUFEPNkAAWr
         DM6hd7rU2kNk23Pc+1FSpvcnPwXlB0bt0zS1jjavZpkr6ffnt04azfiMIHD5DTwYuv4S
         C5XoRspwhOTPB2qwBSsm0HzAiNcEpf2KkiLZFtmKge8HFu/5PEZyeLddBuKAPjEXxn4T
         Khp3w3pCQoHTkm4L5NakurRQD9sY0L+KWM7tvBwGcJlRyNXUdQSC2YMJ0hNJy1q73DSk
         H1a9uPS+UUpLKnnhcDdM7CpraDeMo3FTa0RLWUsBx7q30BVtBuAXvfSO2aVDdxKRnJIn
         wppw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681549730; x=1684141730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=InhEM3EHiRkXrRv+rDOd/57bP6C2VpOkdZxgrLu5jHw=;
        b=X4tlQ6RHKSPgapGDI3QKd88whPRqICMcM/8Bgc/aSc7Rq3dh+vUAnZbbvjex7xA5Pn
         riagHijrG6pt2hObh7NoxEeDC1thVhrKOadcCEOthLTQjf/GfnZcKWuNt5V1nfVkZ42W
         cYE4k0RngWJph5BWErU98AeQxncSQaefTqtqHlHuckJyEdRAzjmeiiwD0ztumlMq/nfg
         ffLPhqmQyp9FIEG4TL+Vh087BvZUoum2g6PdXjqo0B3MxwlBxwahbLH1nuM8TkguosoV
         r0AkKuUwXvvcm1Za/Qq+e09EMi36B5hvf9dBRbMOriX6ZF+ATC26ty1peCkTLlchHWpI
         RbAw==
X-Gm-Message-State: AAQBX9ftH3U2ogfq3uEQFiz7K8cF1ZjtxhI1x9zeBdf7TsmaxnaHjvKi
	uGeStdpHdQA0wb+RdBdPP6k=
X-Google-Smtp-Source: AKy350Z5pLswAXLOFSTYMOtF/X2jVhBWwPLFnyPBpYeO/k93TYYcoLOvVvEGvTS833bwvHj8k46jZA==
X-Received: by 2002:adf:f183:0:b0:2e4:d8d7:839a with SMTP id h3-20020adff183000000b002e4d8d7839amr1028458wro.43.1681549729931;
        Sat, 15 Apr 2023 02:08:49 -0700 (PDT)
Received: from lucifer.home ([2a00:23c5:dc8c:8701:1663:9a35:5a7b:1d76])
        by smtp.googlemail.com with ESMTPSA id j4-20020a5d5644000000b002f02df4c7a3sm5338874wrw.30.2023.04.15.02.08.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Apr 2023 02:08:49 -0700 (PDT)
From: Lorenzo Stoakes <lstoakes@gmail.com>
To: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 6/7] mm/gup: remove vmas parameter from pin_user_pages()
Date: Sat, 15 Apr 2023 10:08:45 +0100
Message-Id: <925661e55664dd65a6aaa9f60e96bd0d71ed8197.1681547405.git.lstoakes@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <cover.1681547405.git.lstoakes@gmail.com>
References: <cover.1681547405.git.lstoakes@gmail.com>
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
Cc: Nelson Escobar <neescoba@cisco.com>, kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>, Alexei Starovoitov <ast@kernel.org>, virtualization@lists.linux-foundation.org, Eric Dumazet <edumazet@google.com>, Leon Romanovsky <leon@kernel.org>, Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>, linux-rdma@vger.kernel.org, "Michael S . Tsirkin" <mst@redhat.com>, John Fastabend <john.fastabend@gmail.com>, Matthew Wilcox <willy@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>, Bernard Metzler <bmt@zurich.ibm.com>, Paolo Abeni <pabeni@redhat.com>, linux-media@vger.kernel.org, Maciej Fijalkowski <maciej.fijalkowski@intel.com>, Jesper Dangaard Brouer <hawk@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, io-uring@vger.kernel.org, Magnus Karlsson <magnus.karlsson@intel.com>, Lorenzo Stoakes <lstoakes@gmail.com>, Jens Axboe <axboe@kernel.dk>, Daniel Borkmann <daniel
 @iogearbox.net>, netdev@vger.kernel.org, Pavel Begunkov <asml.silence@gmail.com>, Bjorn Topel <bjorn@kernel.org>, Jonathan Lemon <jonathan.lemon@gmail.com>, bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>, Christian Benvenuti <benve@cisco.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

After the introduction of FOLL_SAME_FILE we no longer require vmas for any
invocation of pin_user_pages(), so eliminate this parameter from the
function and all callers.

This clears the way to removing the vmas parameter from GUP altogether.

Signed-off-by: Lorenzo Stoakes <lstoakes@gmail.com>
---
 arch/powerpc/mm/book3s64/iommu_api.c       | 2 +-
 drivers/infiniband/hw/qib/qib_user_pages.c | 2 +-
 drivers/infiniband/hw/usnic/usnic_uiom.c   | 2 +-
 drivers/infiniband/sw/siw/siw_mem.c        | 2 +-
 drivers/media/v4l2-core/videobuf-dma-sg.c  | 2 +-
 drivers/vdpa/vdpa_user/vduse_dev.c         | 2 +-
 drivers/vhost/vdpa.c                       | 2 +-
 include/linux/mm.h                         | 3 +--
 io_uring/rsrc.c                            | 2 +-
 mm/gup.c                                   | 9 +++------
 mm/gup_test.c                              | 9 ++++-----
 net/xdp/xdp_umem.c                         | 2 +-
 12 files changed, 17 insertions(+), 22 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/iommu_api.c b/arch/powerpc/mm/book3s64/iommu_api.c
index 81d7185e2ae8..d19fb1f3007d 100644
--- a/arch/powerpc/mm/book3s64/iommu_api.c
+++ b/arch/powerpc/mm/book3s64/iommu_api.c
@@ -105,7 +105,7 @@ static long mm_iommu_do_alloc(struct mm_struct *mm, unsigned long ua,
 
 		ret = pin_user_pages(ua + (entry << PAGE_SHIFT), n,
 				FOLL_WRITE | FOLL_LONGTERM,
-				mem->hpages + entry, NULL);
+				mem->hpages + entry);
 		if (ret == n) {
 			pinned += n;
 			continue;
diff --git a/drivers/infiniband/hw/qib/qib_user_pages.c b/drivers/infiniband/hw/qib/qib_user_pages.c
index f693bc753b6b..1bb7507325bc 100644
--- a/drivers/infiniband/hw/qib/qib_user_pages.c
+++ b/drivers/infiniband/hw/qib/qib_user_pages.c
@@ -111,7 +111,7 @@ int qib_get_user_pages(unsigned long start_page, size_t num_pages,
 		ret = pin_user_pages(start_page + got * PAGE_SIZE,
 				     num_pages - got,
 				     FOLL_LONGTERM | FOLL_WRITE,
-				     p + got, NULL);
+				     p + got);
 		if (ret < 0) {
 			mmap_read_unlock(current->mm);
 			goto bail_release;
diff --git a/drivers/infiniband/hw/usnic/usnic_uiom.c b/drivers/infiniband/hw/usnic/usnic_uiom.c
index 2a5cac2658ec..84e0f41e7dfa 100644
--- a/drivers/infiniband/hw/usnic/usnic_uiom.c
+++ b/drivers/infiniband/hw/usnic/usnic_uiom.c
@@ -140,7 +140,7 @@ static int usnic_uiom_get_pages(unsigned long addr, size_t size, int writable,
 		ret = pin_user_pages(cur_base,
 				     min_t(unsigned long, npages,
 				     PAGE_SIZE / sizeof(struct page *)),
-				     gup_flags, page_list, NULL);
+				     gup_flags, page_list);
 
 		if (ret < 0)
 			goto out;
diff --git a/drivers/infiniband/sw/siw/siw_mem.c b/drivers/infiniband/sw/siw/siw_mem.c
index f51ab2ccf151..e6e25f15567d 100644
--- a/drivers/infiniband/sw/siw/siw_mem.c
+++ b/drivers/infiniband/sw/siw/siw_mem.c
@@ -422,7 +422,7 @@ struct siw_umem *siw_umem_get(u64 start, u64 len, bool writable)
 		umem->page_chunk[i].plist = plist;
 		while (nents) {
 			rv = pin_user_pages(first_page_va, nents, foll_flags,
-					    plist, NULL);
+					    plist);
 			if (rv < 0)
 				goto out_sem_up;
 
diff --git a/drivers/media/v4l2-core/videobuf-dma-sg.c b/drivers/media/v4l2-core/videobuf-dma-sg.c
index 53001532e8e3..405b89ea1054 100644
--- a/drivers/media/v4l2-core/videobuf-dma-sg.c
+++ b/drivers/media/v4l2-core/videobuf-dma-sg.c
@@ -180,7 +180,7 @@ static int videobuf_dma_init_user_locked(struct videobuf_dmabuf *dma,
 		data, size, dma->nr_pages);
 
 	err = pin_user_pages(data & PAGE_MASK, dma->nr_pages, gup_flags,
-			     dma->pages, NULL);
+			     dma->pages);
 
 	if (err != dma->nr_pages) {
 		dma->nr_pages = (err >= 0) ? err : 0;
diff --git a/drivers/vdpa/vdpa_user/vduse_dev.c b/drivers/vdpa/vdpa_user/vduse_dev.c
index 0c3b48616a9f..1f80254604f0 100644
--- a/drivers/vdpa/vdpa_user/vduse_dev.c
+++ b/drivers/vdpa/vdpa_user/vduse_dev.c
@@ -995,7 +995,7 @@ static int vduse_dev_reg_umem(struct vduse_dev *dev,
 		goto out;
 
 	pinned = pin_user_pages(uaddr, npages, FOLL_LONGTERM | FOLL_WRITE,
-				page_list, NULL);
+				page_list);
 	if (pinned != npages) {
 		ret = pinned < 0 ? pinned : -ENOMEM;
 		goto out;
diff --git a/drivers/vhost/vdpa.c b/drivers/vhost/vdpa.c
index 7be9d9d8f01c..4317128c1c62 100644
--- a/drivers/vhost/vdpa.c
+++ b/drivers/vhost/vdpa.c
@@ -952,7 +952,7 @@ static int vhost_vdpa_pa_map(struct vhost_vdpa *v,
 	while (npages) {
 		sz2pin = min_t(unsigned long, npages, list_size);
 		pinned = pin_user_pages(cur_base, sz2pin,
-					gup_flags, page_list, NULL);
+					gup_flags, page_list);
 		if (sz2pin != pinned) {
 			if (pinned < 0) {
 				ret = pinned;
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 1bfe73a2b6d3..363e3d0d46f4 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2382,8 +2382,7 @@ long pin_user_pages_remote(struct mm_struct *mm,
 long get_user_pages(unsigned long start, unsigned long nr_pages,
 		    unsigned int gup_flags, struct page **pages);
 long pin_user_pages(unsigned long start, unsigned long nr_pages,
-		    unsigned int gup_flags, struct page **pages,
-		    struct vm_area_struct **vmas);
+		    unsigned int gup_flags, struct page **pages);
 long get_user_pages_unlocked(unsigned long start, unsigned long nr_pages,
 		    struct page **pages, unsigned int gup_flags);
 long pin_user_pages_unlocked(unsigned long start, unsigned long nr_pages,
diff --git a/io_uring/rsrc.c b/io_uring/rsrc.c
index adc860bcbd4f..92d0d47e322c 100644
--- a/io_uring/rsrc.c
+++ b/io_uring/rsrc.c
@@ -1157,7 +1157,7 @@ struct page **io_pin_pages(unsigned long ubuf, unsigned long len, int *npages)
 
 	pret = pin_user_pages(ubuf, nr_pages,
 			      FOLL_WRITE | FOLL_LONGTERM | FOLL_SAME_FILE,
-			      pages, NULL);
+			      pages);
 	if (pret == nr_pages) {
 		/*
 		 * lookup the first VMA, we require that all VMAs in range
diff --git a/mm/gup.c b/mm/gup.c
index 3954ce499a4a..714970ef3b30 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -3132,8 +3132,6 @@ EXPORT_SYMBOL(pin_user_pages_remote);
  * @gup_flags:	flags modifying lookup behaviour
  * @pages:	array that receives pointers to the pages pinned.
  *		Should be at least nr_pages long.
- * @vmas:	array of pointers to vmas corresponding to each page.
- *		Or NULL if the caller does not require them.
  *
  * Nearly the same as get_user_pages(), except that FOLL_TOUCH is not set, and
  * FOLL_PIN is set.
@@ -3142,15 +3140,14 @@ EXPORT_SYMBOL(pin_user_pages_remote);
  * see Documentation/core-api/pin_user_pages.rst for details.
  */
 long pin_user_pages(unsigned long start, unsigned long nr_pages,
-		    unsigned int gup_flags, struct page **pages,
-		    struct vm_area_struct **vmas)
+		    unsigned int gup_flags, struct page **pages)
 {
 	int locked = 1;
 
-	if (!is_valid_gup_args(pages, vmas, NULL, &gup_flags, FOLL_PIN))
+	if (!is_valid_gup_args(pages, NULL, NULL, &gup_flags, FOLL_PIN))
 		return 0;
 	return __gup_longterm_locked(current->mm, start, nr_pages,
-				     pages, vmas, &locked, gup_flags);
+				     pages, NULL, &locked, gup_flags);
 }
 EXPORT_SYMBOL(pin_user_pages);
 
diff --git a/mm/gup_test.c b/mm/gup_test.c
index 9ba8ea23f84e..1668ce0e0783 100644
--- a/mm/gup_test.c
+++ b/mm/gup_test.c
@@ -146,18 +146,17 @@ static int __gup_test_ioctl(unsigned int cmd,
 						 pages + i);
 			break;
 		case PIN_BASIC_TEST:
-			nr = pin_user_pages(addr, nr, gup->gup_flags, pages + i,
-					    NULL);
+			nr = pin_user_pages(addr, nr, gup->gup_flags, pages + i);
 			break;
 		case PIN_LONGTERM_BENCHMARK:
 			nr = pin_user_pages(addr, nr,
 					    gup->gup_flags | FOLL_LONGTERM,
-					    pages + i, NULL);
+					    pages + i);
 			break;
 		case DUMP_USER_PAGES_TEST:
 			if (gup->test_flags & GUP_TEST_FLAG_DUMP_PAGES_USE_PIN)
 				nr = pin_user_pages(addr, nr, gup->gup_flags,
-						    pages + i, NULL);
+						    pages + i);
 			else
 				nr = get_user_pages(addr, nr, gup->gup_flags,
 						    pages + i);
@@ -270,7 +269,7 @@ static inline int pin_longterm_test_start(unsigned long arg)
 							gup_flags, pages);
 		else
 			cur_pages = pin_user_pages(addr, remaining_pages,
-						   gup_flags, pages, NULL);
+						   gup_flags, pages);
 		if (cur_pages < 0) {
 			pin_longterm_test_stop();
 			ret = cur_pages;
diff --git a/net/xdp/xdp_umem.c b/net/xdp/xdp_umem.c
index 02207e852d79..06cead2b8e34 100644
--- a/net/xdp/xdp_umem.c
+++ b/net/xdp/xdp_umem.c
@@ -103,7 +103,7 @@ static int xdp_umem_pin_pages(struct xdp_umem *umem, unsigned long address)
 
 	mmap_read_lock(current->mm);
 	npgs = pin_user_pages(address, umem->npgs,
-			      gup_flags | FOLL_LONGTERM, &umem->pgs[0], NULL);
+			      gup_flags | FOLL_LONGTERM, &umem->pgs[0]);
 	mmap_read_unlock(current->mm);
 
 	if (npgs != umem->npgs) {
-- 
2.40.0

