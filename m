Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1530362B8F6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Nov 2022 11:37:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NBzyN6wzyz3cKn
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Nov 2022 21:37:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bpmJTPzf;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ViNgEILn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bpmJTPzf;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ViNgEILn;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NBzmR2nfdz3cP0
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Nov 2022 21:28:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668594532;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AXY/UyjjpCuDyNIViwtXXXaWlWVq5fOjr9nC+t8u+wk=;
	b=bpmJTPzf1VnkDmm2BM3gxvRChC4ZpYwv2cFDFVRGRvkYFXR3WQw3fxu0Yq/fVZui9JENsC
	t2OhDgm+ZBKH6qLVfDyXeeyPbgrXj/l39+P6AfvoKFqMKVQWWUj52nHcjTwKKMcN7g7Tzd
	vR8gNy2CoNW034zt/oc7XKdDRz03asM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668594533;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AXY/UyjjpCuDyNIViwtXXXaWlWVq5fOjr9nC+t8u+wk=;
	b=ViNgEILnT2DKkpBfgVD3aM12XHjeb0VD9liNNvWmDOS0W+qNEFRH9K0+ue69AtBXz4Mp26
	+iN3XNh4OycecBOd+pxdqsx2dsBoJLYVAamPcDvDZg+H3ZuyE3C1Bj+X2slaIgKCaPO4uG
	4PEWfKuomMaCVLSV7B8y0TTH8uStv1Q=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-325-nf3OqAa0Mp2NEpiQ4Fl_4w-1; Wed, 16 Nov 2022 05:28:47 -0500
X-MC-Unique: nf3OqAa0Mp2NEpiQ4Fl_4w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 43CBC1C0A10F;
	Wed, 16 Nov 2022 10:28:45 +0000 (UTC)
Received: from t480s.fritz.box (unknown [10.39.193.216])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C3F5B2028E8F;
	Wed, 16 Nov 2022 10:28:37 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH mm-unstable v1 11/20] RDMA/usnic: remove FOLL_FORCE usage
Date: Wed, 16 Nov 2022 11:26:50 +0100
Message-Id: <20221116102659.70287-12-david@redhat.com>
In-Reply-To: <20221116102659.70287-1-david@redhat.com>
References: <20221116102659.70287-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
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
Cc: Nelson Escobar <neescoba@cisco.com>, linux-ia64@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Christian Benvenuti <benve@cisco.com>, David Hildenbrand <david@redhat.com>, dri-devel@lists.freedesktop.org, linux-mm@kvack.org, Nadav Amit <namit@vmware.com>, linux-kselftest@vger.kernel.org, sparclinux@vger.kernel.org, Shuah Khan <shuah@kernel.org>, Andrea Arcangeli <aarcange@redhat.com>, linux-samsung-soc@vger.kernel.org, Leon Romanovsky <leon@kernel.org>, linux-rdma@vger.kernel.org, David Airlie <airlied@gmail.com>, x86@kernel.org, Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>, Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@suse.cz>, linux-media@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, John Hubbard <jhubbard@nvidia.com>, linux-um@lists.infradead.org, etnaviv@lists.freedesktop.org, Alex Williamson <alex.williamson@redhat.com>, Peter Xu <peterx@redhat.com>, Muchun Song <songmuchun@byteda
 nce.com>, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, Oded Gabbay <ogabbay@kernel.org>, linux-mips@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-security-module@vger.kernel.org, linux-alpha@vger.kernel.org, linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Lucas Stach <l.stach@pengutronix.de>, Linus Torvalds <torvalds@linux-foundation.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

GUP now supports reliable R/O long-term pinning in COW mappings, such
that we break COW early. MAP_SHARED VMAs only use the shared zeropage so
far in one corner case (DAXFS file with holes), which can be ignored
because GUP does not support long-term pinning in fsdax (see
check_vma_flags()).

Consequently, FOLL_FORCE | FOLL_WRITE | FOLL_LONGTERM is no longer required
for reliable R/O long-term pinning: FOLL_LONGTERM is sufficient. So stop
using FOLL_FORCE, which is really only for ptrace access.

Cc: Christian Benvenuti <benve@cisco.com>
Cc: Nelson Escobar <neescoba@cisco.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Leon Romanovsky <leon@kernel.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 drivers/infiniband/hw/usnic/usnic_uiom.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/infiniband/hw/usnic/usnic_uiom.c b/drivers/infiniband/hw/usnic/usnic_uiom.c
index 67923ced6e2d..c301b3be9f30 100644
--- a/drivers/infiniband/hw/usnic/usnic_uiom.c
+++ b/drivers/infiniband/hw/usnic/usnic_uiom.c
@@ -85,6 +85,7 @@ static int usnic_uiom_get_pages(unsigned long addr, size_t size, int writable,
 				int dmasync, struct usnic_uiom_reg *uiomr)
 {
 	struct list_head *chunk_list = &uiomr->chunk_list;
+	unsigned int gup_flags = FOLL_LONGTERM;
 	struct page **page_list;
 	struct scatterlist *sg;
 	struct usnic_uiom_chunk *chunk;
@@ -96,7 +97,6 @@ static int usnic_uiom_get_pages(unsigned long addr, size_t size, int writable,
 	int off;
 	int i;
 	dma_addr_t pa;
-	unsigned int gup_flags;
 	struct mm_struct *mm;
 
 	/*
@@ -131,8 +131,8 @@ static int usnic_uiom_get_pages(unsigned long addr, size_t size, int writable,
 		goto out;
 	}
 
-	gup_flags = FOLL_WRITE;
-	gup_flags |= (writable) ? 0 : FOLL_FORCE;
+	if (writable)
+		gup_flags |= FOLL_WRITE;
 	cur_base = addr & PAGE_MASK;
 	ret = 0;
 
@@ -140,8 +140,7 @@ static int usnic_uiom_get_pages(unsigned long addr, size_t size, int writable,
 		ret = pin_user_pages(cur_base,
 				     min_t(unsigned long, npages,
 				     PAGE_SIZE / sizeof(struct page *)),
-				     gup_flags | FOLL_LONGTERM,
-				     page_list, NULL);
+				     gup_flags, page_list, NULL);
 
 		if (ret < 0)
 			goto out;
-- 
2.38.1

