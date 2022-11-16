Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA1962B96A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Nov 2022 11:42:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NC03c1H7yz3fJF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Nov 2022 21:42:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=c+lc3Q9Z;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KXl78EDb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=c+lc3Q9Z;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KXl78EDb;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NBzn85BCrz3cMS
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Nov 2022 21:29:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668594569;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G0FpSSTO1Nfi3hHjZY1vs8kl28xrhbJvR/VmU2bZlrg=;
	b=c+lc3Q9ZJTbnMBMVTIGm57g+AWk9tBbJZmuB/aj9gmDfTcstw2nuRWDGVLHY+FvJ3JjVCc
	rREfTaMhmsZLDckloQtPPslPUcLZ24Tev0u0lrkXD2Q5DYTqsnvMIT+7W73WF0NVSb5lut
	FyoSEnpItVrJCRVevsX3IgZtsfhmlYo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668594570;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G0FpSSTO1Nfi3hHjZY1vs8kl28xrhbJvR/VmU2bZlrg=;
	b=KXl78EDbiAsX1Ipc7Klvgmiq3VCDLgTAv30Ux56S8uHM36BQnANQL1C0lmgvjQjigxj4kX
	685ktq5CkbovVVbxHIFuttVAhA0QWkrfvqz7rcNGXBNalOu0QCu9De1bxxkTR183J0oANo
	lruIq30a1+4Ck//E11qUm2SW7kNlS4I=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-652-smSH3VzZPoqE7rq7qnypxQ-1; Wed, 16 Nov 2022 05:29:26 -0500
X-MC-Unique: smSH3VzZPoqE7rq7qnypxQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2D136101A528;
	Wed, 16 Nov 2022 10:29:25 +0000 (UTC)
Received: from t480s.fritz.box (unknown [10.39.193.216])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AF3102024CC8;
	Wed, 16 Nov 2022 10:29:15 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH mm-unstable v1 16/20] mm/frame-vector: remove FOLL_FORCE usage
Date: Wed, 16 Nov 2022 11:26:55 +0100
Message-Id: <20221116102659.70287-17-david@redhat.com>
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
Cc: linux-ia64@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, David Hildenbrand <david@redhat.com>, dri-devel@lists.freedesktop.org, Hans Verkuil <hverkuil@xs4all.nl>, linux-mm@kvack.org, Nadav Amit <namit@vmware.com>, linux-kselftest@vger.kernel.org, sparclinux@vger.kernel.org, Shuah Khan <shuah@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Andrea Arcangeli <aarcange@redhat.com>, linux-samsung-soc@vger.kernel.org, linux-rdma@vger.kernel.org, David Airlie <airlied@gmail.com>, x86@kernel.org, Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>, Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@suse.cz>, linux-media@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, John Hubbard <jhubbard@nvidia.com>, linux-um@lists.infradead.org, etnaviv@lists.freedesktop.org, Alex Williamson <alex.williamson@redhat.com>, Peter Xu <peterx@redhat.com>, Muchun Song <songmuchun@bytedance.com>, Mauro Carvalho Chehab
  <mchehab@kernel.org>, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, Oded Gabbay <ogabbay@kernel.org>, linux-mips@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>, linux-perf-users@vger.kernel.org, linux-security-module@vger.kernel.org, linux-alpha@vger.kernel.org, linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Lucas Stach <l.stach@pengutronix.de>, Linus Torvalds <torvalds@linux-foundation.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

FOLL_FORCE is really only for ptrace access. According to commit
707947247e95 ("media: videobuf2-vmalloc: get_userptr: buffers are always
writable"), get_vaddr_frames() currently pins all pages writable as a
workaround for issues with read-only buffers.

FOLL_FORCE, however, seems to be a legacy leftover as it predates
commit 707947247e95 ("media: videobuf2-vmalloc: get_userptr: buffers are
always writable"). Let's just remove it.

Once the read-only buffer issue has been resolved, FOLL_WRITE could
again be set depending on the DMA direction.

Cc: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Tomasz Figa <tfiga@chromium.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 drivers/media/common/videobuf2/frame_vector.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/common/videobuf2/frame_vector.c b/drivers/media/common/videobuf2/frame_vector.c
index 542dde9d2609..062e98148c53 100644
--- a/drivers/media/common/videobuf2/frame_vector.c
+++ b/drivers/media/common/videobuf2/frame_vector.c
@@ -50,7 +50,7 @@ int get_vaddr_frames(unsigned long start, unsigned int nr_frames,
 	start = untagged_addr(start);
 
 	ret = pin_user_pages_fast(start, nr_frames,
-				  FOLL_FORCE | FOLL_WRITE | FOLL_LONGTERM,
+				  FOLL_WRITE | FOLL_LONGTERM,
 				  (struct page **)(vec->ptrs));
 	if (ret > 0) {
 		vec->got_ref = true;
-- 
2.38.1

