Return-Path: <linuxppc-dev+bounces-9482-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A2803ADF471
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jun 2025 19:43:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bMrdV4tYYz3bwL;
	Thu, 19 Jun 2025 03:41:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750268494;
	cv=none; b=fVdfPJX5T619bZt5bp34kH6d/q44FaGR0nRreSYiHn4lt3FBTa4ihFQeswX1DpTynQ1/DSTQUGaoDtW2AEqnA/kYDWp1kgaUICzeIs21EuYh/0+xhFS8Ip3UN9RILHzFUhbo1hdDpvZdLnWqlSxre4O+FR0J7prMq2HRZ9LF0mBI9lq9rKGlq4t5FHZoz9afUACBSAn3aOQifD5jvdkpbPnfEVZTPkGwDzeGqd2yRKqaf8H0lmjaHwjaAOPkslOHm4QFrdmTbF55D8ESRKwfreogr64oD19fsAmNDmgf/NleKsw5yFaFt170xruK5zDr+1llyf7fqxs9/aAaG7IIWw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750268494; c=relaxed/relaxed;
	bh=UnwUSh7o+5ZmaRZCKb6UInkhBSWZlCwshIxY9Qz5Cgk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=iQv1oMXGzSzW6DFXZfCbsBbYW1IjBSoTKsd5+/mmrcRTrPkXoxZfj4OBbCXFLglxA9eqQKIVnNNNfGcILmW8Co8LyovsXwkog41PXthAxXQayTi/78z8z5XBGnNnDR7y5gMLgbdYU3SU9GL54X4/lBuX2dxBPTsDxc80jm7qFHvVwcHetZ39M/TQR/OwPralnQI43KqJae7ZsOF0VCArR0ZVXvNvOE0r784/umfNLU9tqiMxiSOjUqa5quFN8t48U6+QziKlQF8sptbg8/LDGx5xbYVEytWlgfmGVY72OZHEZhVmT8S6RALiQy/xQveF9Wu398djdSw7afhyudMuhw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iqYspXra; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=d5eGVDkG; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iqYspXra;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=d5eGVDkG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bMrdT6pMRz3btl
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Jun 2025 03:41:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750268490;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UnwUSh7o+5ZmaRZCKb6UInkhBSWZlCwshIxY9Qz5Cgk=;
	b=iqYspXra72veIRXhd3MGayt5Od5lLZhwBx+IpFiKjipOguf/FQH7fxZkxDCBbj+pGbc+SA
	tci69OdNqy/vjcnnLUtf4TDvVeoSklX0DknzHaboyJbR0cdQEqD6yvTJXUG42P90qeJ2oi
	/wA8GNSfIJp5zanmXs/1BfmH701IyPE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750268491;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UnwUSh7o+5ZmaRZCKb6UInkhBSWZlCwshIxY9Qz5Cgk=;
	b=d5eGVDkGjuTUAIQoSYp9iASldTJB/hQWg/S0zbbmjdeYar+OTGeAt1EOrwu6B4WKHu2HlU
	cdc/ZzLDaXUyk4HmoVeVAxEEX+7v5u06ZLd2DJO4W3uo9+43vpTFL0xQKxuKuRJcYS35UH
	pFMUQM+h34Oz2Z48smsUxj20jPe5ASk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-322-T3aONh89P4yXRsKZ2ZxENQ-1; Wed, 18 Jun 2025 13:41:27 -0400
X-MC-Unique: T3aONh89P4yXRsKZ2ZxENQ-1
X-Mimecast-MFC-AGG-ID: T3aONh89P4yXRsKZ2ZxENQ_1750268485
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43eed325461so45822765e9.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jun 2025 10:41:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750268485; x=1750873285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UnwUSh7o+5ZmaRZCKb6UInkhBSWZlCwshIxY9Qz5Cgk=;
        b=SZzAHTBw3X2f6jhCB53/1Mkbu6nJu453i4ObWiDu9PiZFzA3OTQ5jOU1maa59+PqwP
         cn9O4YY8FY3Tg/hHe9ro50At0mAjoBukMwhBW7K0vFkhv0pvweLuXLishKAwmJ7DQ2xV
         rtiv7itJBnMeWZPjTR8edQNJFB+KhZF/a/9huXZVFv214jgR5H75uc9NMVvcO6GtecEp
         GsqkXxK4twMTacEBGu/VTzBFwUhgnU5VHsDYvg+2BeN3ygZ3bvS8X9aVgMO4yTe4UjEO
         SObe6cevncxHK9dpb55z5WcIqJwmp7zijiq9AE9gGtvVHH+mjiiATIi6R5HAvY4uwuYt
         im5A==
X-Forwarded-Encrypted: i=1; AJvYcCVRF8A98Y98dRKGv8YHzsHwv5Jkg7anTeB8K3F6Oy10HKGZ1vlGHcW5O1pT6Z+iNrpeacgCqJTC8oi+I/Q=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxZNmYPRLGPspZIiV3xQ5YcnY/MJgCVIyya/L3HJ9WgAUzziE1a
	+HCvb4b+ECQTlfQM33VJp8deKienOgWaS0eWp1c2VVngeilDH4uPNSvMSidwoJmZ0GH1Jcb0pOV
	CdAFNFxFD+C4dtHBFlyasU7AFCHJojzlhGIEjeiY8MNyPcETfpCZKJfZg7VziSNC1J+U=
X-Gm-Gg: ASbGncvxaKLt62UOIokr61pOMUqCR5xAOO7/Y+vWZwB6U4z3lOACnHUcsFTmWT5bPL5
	r/E3Lnn3jU5qlxqBuqpw4GS4qcnAWNEnVvuQ7xuUjGZ2d9lJ3rB7EzMhWy6kcbCZYfRGTN7qWeg
	v1BzlhyX4lpGCh1CHD5TEKicRXNYxnpegaiMTsZVmonmEiA8nnQ+9SSAeOYxkkPzSgIDVZ6HjNe
	8h5q+poUUx/qTSULNaKwrr8dHHFXL/yin9xqjK5CPSBu++QeKF3JtrPsVqcKvw5f1994yLXvIc1
	XsQKiZBoGMq4nP7PtJ9IiPklJfgPg+pyzR5ynQPXReyuu7Kqwmb5LblfkgclfNPxjAtsAvc44dj
	KRSuF7A==
X-Received: by 2002:a05:600d:1:b0:453:5a04:b60e with SMTP id 5b1f17b1804b1-4535a04bc8amr21843215e9.26.1750268485379;
        Wed, 18 Jun 2025 10:41:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEv5K+zuY4+JCApu2tViRQi8tnrUP4BMaDADA459jpWP1i37cwdJ2pp4j+WJZa019DgSPcT4A==
X-Received: by 2002:a05:600d:1:b0:453:5a04:b60e with SMTP id 5b1f17b1804b1-4535a04bc8amr21842675e9.26.1750268484986;
        Wed, 18 Jun 2025 10:41:24 -0700 (PDT)
Received: from localhost (p200300d82f2d2400405203b5fff94ed0.dip0.t-ipconnect.de. [2003:d8:2f2d:2400:4052:3b5:fff9:4ed0])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4535ebced8asm3463925e9.40.2025.06.18.10.41.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 10:41:24 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	virtualization@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Jerrin Shaji George <jerrin.shaji-george@broadcom.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Zi Yan <ziy@nvidia.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>,
	Rakie Kim <rakie.kim@sk.com>,
	Byungchul Park <byungchul@sk.com>,
	Gregory Price <gourry@gourry.net>,
	Ying Huang <ying.huang@linux.alibaba.com>,
	Alistair Popple <apopple@nvidia.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Minchan Kim <minchan@kernel.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Brendan Jackman <jackmanb@google.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	John Hubbard <jhubbard@nvidia.com>,
	Peter Xu <peterx@redhat.com>,
	Xu Xin <xu.xin16@zte.com.cn>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Miaohe Lin <linmiaohe@huawei.com>,
	Naoya Horiguchi <nao.horiguchi@gmail.com>,
	Oscar Salvador <osalvador@suse.de>,
	Rik van Riel <riel@surriel.com>,
	Harry Yoo <harry.yoo@oracle.com>,
	Qi Zheng <zhengqi.arch@bytedance.com>,
	Shakeel Butt <shakeel.butt@linux.dev>
Subject: [PATCH RFC 25/29] mm: simplify folio_expected_ref_count()
Date: Wed, 18 Jun 2025 19:40:08 +0200
Message-ID: <20250618174014.1168640-26-david@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250618174014.1168640-1-david@redhat.com>
References: <20250618174014.1168640-1-david@redhat.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: m4OJxTTbG5BD0oq14litDvx3k9BihTS_Im9PKdCoIJU_1750268485
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Now that PAGE_MAPPING_MOVABLE is gone, we can simplify and rely on the
folio_test_anon() test only.

... but staring at the users, this function should never even have been
called on movable_ops pages. E.g.,
* __buffer_migrate_folio() does not make sense for them
* folio_migrate_mapping() does not make sense for them
* migrate_huge_page_move_mapping() does not make sense for them
* __migrate_folio() does not make sense for them
* ... and khugepaged should never stumble over them

Let's simply refuse typed pages (which includes slab) except hugetlb,
and WARN.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/mm.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 98a606908307b..61da588dda892 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2167,13 +2167,13 @@ static inline int folio_expected_ref_count(const struct folio *folio)
 	const int order = folio_order(folio);
 	int ref_count = 0;
 
-	if (WARN_ON_ONCE(folio_test_slab(folio)))
+	if (WARN_ON_ONCE(page_has_type(&folio->page) && !folio_test_hugetlb(folio)))
 		return 0;
 
 	if (folio_test_anon(folio)) {
 		/* One reference per page from the swapcache. */
 		ref_count += folio_test_swapcache(folio) << order;
-	} else if (!((unsigned long)folio->mapping & PAGE_MAPPING_FLAGS)) {
+	} else {
 		/* One reference per page from the pagecache. */
 		ref_count += !!folio->mapping << order;
 		/* One reference from PG_private. */
-- 
2.49.0


