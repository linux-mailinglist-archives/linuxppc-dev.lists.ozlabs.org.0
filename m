Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DEB562B923
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Nov 2022 11:39:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NC00Z2JLsz3f3Z
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Nov 2022 21:39:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WwdgC/fw;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WwdgC/fw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WwdgC/fw;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WwdgC/fw;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NBzmk08WFz3cNJ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Nov 2022 21:29:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668594547;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PtZFIm00BoukAq0r3vxYea1/oUxWby/yeQnBgXcmZG8=;
	b=WwdgC/fwMUGkNp6bcRBEmHDi3uQXzqT4Sxt0UX6MxCyGlQbtIzyDNszJr9mxnEGRCtuauQ
	+tGSw2rg7cuiv2FGgwFK2FGewck/e0owNDiBf8lsbINReQS9lKhuxhOxV0pZXgxlbFW9tg
	e189QT72drOIe2cuuYC9eGeUVROVkgg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668594547;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PtZFIm00BoukAq0r3vxYea1/oUxWby/yeQnBgXcmZG8=;
	b=WwdgC/fwMUGkNp6bcRBEmHDi3uQXzqT4Sxt0UX6MxCyGlQbtIzyDNszJr9mxnEGRCtuauQ
	+tGSw2rg7cuiv2FGgwFK2FGewck/e0owNDiBf8lsbINReQS9lKhuxhOxV0pZXgxlbFW9tg
	e189QT72drOIe2cuuYC9eGeUVROVkgg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-618-uLqpp3ByOjmb0y4uEYa0gA-1; Wed, 16 Nov 2022 05:29:02 -0500
X-MC-Unique: uLqpp3ByOjmb0y4uEYa0gA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 95160811E7A;
	Wed, 16 Nov 2022 10:29:00 +0000 (UTC)
Received: from t480s.fritz.box (unknown [10.39.193.216])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4EDB82028E8F;
	Wed, 16 Nov 2022 10:28:53 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH mm-unstable v1 13/20] media: videobuf-dma-sg: remove FOLL_FORCE usage
Date: Wed, 16 Nov 2022 11:26:52 +0100
Message-Id: <20221116102659.70287-14-david@redhat.com>
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
Cc: linux-ia64@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, David Hildenbrand <david@redhat.com>, dri-devel@lists.freedesktop.org, linux-mm@kvack.org, Nadav Amit <namit@vmware.com>, linux-kselftest@vger.kernel.org, sparclinux@vger.kernel.org, Shuah Khan <shuah@kernel.org>, Andrea Arcangeli <aarcange@redhat.com>, linux-samsung-soc@vger.kernel.org, linux-rdma@vger.kernel.org, David Airlie <airlied@gmail.com>, x86@kernel.org, Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>, Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@suse.cz>, linux-media@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, John Hubbard <jhubbard@nvidia.com>, linux-um@lists.infradead.org, etnaviv@lists.freedesktop.org, Alex Williamson <alex.williamson@redhat.com>, Peter Xu <peterx@redhat.com>, Muchun Song <songmuchun@bytedance.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.
 ozlabs.org, Oded Gabbay <ogabbay@kernel.org>, linux-mips@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-security-module@vger.kernel.org, linux-alpha@vger.kernel.org, linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Lucas Stach <l.stach@pengutronix.de>, Linus Torvalds <torvalds@linux-foundation.org>, Mike Kravetz <mike.kravetz@oracle.com>
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

Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 drivers/media/v4l2-core/videobuf-dma-sg.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/media/v4l2-core/videobuf-dma-sg.c b/drivers/media/v4l2-core/videobuf-dma-sg.c
index f75e5eedeee0..234e9f647c96 100644
--- a/drivers/media/v4l2-core/videobuf-dma-sg.c
+++ b/drivers/media/v4l2-core/videobuf-dma-sg.c
@@ -151,17 +151,16 @@ static void videobuf_dma_init(struct videobuf_dmabuf *dma)
 static int videobuf_dma_init_user_locked(struct videobuf_dmabuf *dma,
 			int direction, unsigned long data, unsigned long size)
 {
+	unsigned int gup_flags = FOLL_LONGTERM;
 	unsigned long first, last;
-	int err, rw = 0;
-	unsigned int flags = FOLL_FORCE;
+	int err;
 
 	dma->direction = direction;
 	switch (dma->direction) {
 	case DMA_FROM_DEVICE:
-		rw = READ;
+		gup_flags |= FOLL_WRITE;
 		break;
 	case DMA_TO_DEVICE:
-		rw = WRITE;
 		break;
 	default:
 		BUG();
@@ -177,14 +176,11 @@ static int videobuf_dma_init_user_locked(struct videobuf_dmabuf *dma,
 	if (NULL == dma->pages)
 		return -ENOMEM;
 
-	if (rw == READ)
-		flags |= FOLL_WRITE;
-
 	dprintk(1, "init user [0x%lx+0x%lx => %lu pages]\n",
 		data, size, dma->nr_pages);
 
-	err = pin_user_pages(data & PAGE_MASK, dma->nr_pages,
-			     flags | FOLL_LONGTERM, dma->pages, NULL);
+	err = pin_user_pages(data & PAGE_MASK, dma->nr_pages, gup_flags,
+			     dma->pages, NULL);
 
 	if (err != dma->nr_pages) {
 		dma->nr_pages = (err >= 0) ? err : 0;
-- 
2.38.1

