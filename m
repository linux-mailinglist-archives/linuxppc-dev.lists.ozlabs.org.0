Return-Path: <linuxppc-dev+bounces-9905-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B8A7AEDE04
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Jun 2025 15:03:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bW5rx40Qvz3069;
	Mon, 30 Jun 2025 23:01:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751288497;
	cv=none; b=OfG5VmV1cDQYcsr6KLjIhoSHSfWu3qjasyp7flwHVHczCxDnPCUUMewcvdpxwJaZHuPAQ4iRxRwRUQq6HHDOogZEqj6q+nNvIwi+YYNDmHCsEi4XvcYSmx16RXvOWE6qjGq/unPBPfL8FcgudVsVzF0+d/ZjsOJ0JKFjcU8H4gUnil45+7ISNK/061z3+w3pDyAnpqWh86GPHbi2DNoq5LNB1LvNajydJUFCWlb5uiAUUXf22LjvCTA4f5f/pezX8s0Iibj70aN+RlICbBvWPY6X0eO9wOKlhCY39RkNxMEQcAlkFyeBiTKPya6tZWfj44kxYsxSAEYFr5QkcYjCpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751288497; c=relaxed/relaxed;
	bh=sNIKdrm33pmadL5+MWfVmqXzrIDEGwSSahCLerJeLDg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=f71LtYZABSNrJXD01HjIbc8BQfoaao5jJ9DKq/UFGGgRINNfVFPFbLQaJShJ8Pv5+y8QsA3TzkbRA5cFk5lsFtI3hvbSefUBLQfMAMcEkC9Xm4P6NFsnJJfYXw1B9xkeZ4aaiAzAna+1Jnaxx0SaUfgFoS0twUfjxz8Oay5QDtn+6GflV+S+y1lnh/5MWe4/EPxdvhNoyNFmCLroG+njZ1wp39QTMAGgipcWxKDBAWXdF00ZwLramD8J/aR0ICkG9j+6+vKOLjCz0NVz/FB6AMblwqN5rsk5Y/UW/UjrNiicNRnu35yifexXuefF36UT/KodIhJGoEqWnW7G/XFCuw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UhANXV7I; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UhANXV7I; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UhANXV7I;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UhANXV7I;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bW5rw6DT8z2yb9
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Jun 2025 23:01:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751288494;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sNIKdrm33pmadL5+MWfVmqXzrIDEGwSSahCLerJeLDg=;
	b=UhANXV7IKSeTGMOsCFXabxqpOlg8MuTvlnB4zX3ERGEzm/kwQNa0JusfVNpLonlgmCOP75
	vVUV8JHdgwgB4CEWaaYsTWJcTbPr2O310Vd54ihSklPa1cV9aR1PajDucDVFqfxle9dXKG
	OiSNxRTDx/9hMtJWwn2frbflnKP+3MU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751288494;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sNIKdrm33pmadL5+MWfVmqXzrIDEGwSSahCLerJeLDg=;
	b=UhANXV7IKSeTGMOsCFXabxqpOlg8MuTvlnB4zX3ERGEzm/kwQNa0JusfVNpLonlgmCOP75
	vVUV8JHdgwgB4CEWaaYsTWJcTbPr2O310Vd54ihSklPa1cV9aR1PajDucDVFqfxle9dXKG
	OiSNxRTDx/9hMtJWwn2frbflnKP+3MU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-553-RQkIgQRRMxOx5JGVAJkjJw-1; Mon, 30 Jun 2025 09:01:32 -0400
X-MC-Unique: RQkIgQRRMxOx5JGVAJkjJw-1
X-Mimecast-MFC-AGG-ID: RQkIgQRRMxOx5JGVAJkjJw_1751288491
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4530c186394so9160675e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Jun 2025 06:01:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751288491; x=1751893291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sNIKdrm33pmadL5+MWfVmqXzrIDEGwSSahCLerJeLDg=;
        b=ZJNoU1lpZZ3wjzcfpEVBgvsfSYhzvGZQXWpzSX9DOJ8O/8yxnHX/CBwI3oMVOifJ/J
         PZIvmVTxUNCH2DBkZOoUJSsZVKkhqFd9OI328WjedhtCbE+eBkamd3ulw5vOxBacf4i/
         5AzxQaXtNodvU7Gw2SqVfJSwEDHIhJSg7YFZZ9/YqcJ7yF8pRr3uYSm+JLDoTmb2SMKz
         N8uiU8nV1bPED4DvMDql0gs5cn595nuiD/+9WO3GMuc2U8cth9AfMXG1rT/QH/lgCJFB
         6/kSpFfSR0jjBkvZeKk+WTxkEgu0d7YyaF0TY3LSaOyqWJh2JxqD2oQinfiwjZEAQ6Fd
         db/A==
X-Forwarded-Encrypted: i=1; AJvYcCVJ7qhsbWVq46W4pyzfUfiBzHwh3SlNLc1Qsua8lOkwo4AL+H+tZZZ2OZx83EBrmFRRzQHkZcyg3bVoQeI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx+G7PKWEqMjiCwrTsP9szH0LCYZ5Lfr2Pb0QZu0Y5kWWFyONWv
	YQliD5rl0nKwszoZfWHrFleyHYi4WR7AHLdS/d5kRX2u1xcKaywVj+UGOavpG7VJRSQmJlNIZZd
	Nsf/KxV7hNZk8JjreL1nXg9ghbJIvKbgP6ktdZG/pRXjbjBlx05dRmOJYdYKsDFY3Y70=
X-Gm-Gg: ASbGnct/387VKKxMkqpAhz2Q67skcx2uMqeUgIloL+TjpizsizhhPtbOJzTAgUhBqdA
	C/bzeuhsjH4SiTM5W1Bd5ODd2aHspeirxrB9kdi9Lo59J8/f5jLF+Zsb3DMuCZiOcb2rlXsJfD1
	Y/m0DwFLv5oRZLeqvp/XHcPqjUIcPxEOouLnfcCvbrPssJjFpG98+Tgl+8kk7F1j0OFri0D7Jvk
	5hgQOOB8XqMf7U2gcU8R94XLI6umYWLQgAlGQz90Vk4eRblz64wurYVG2hUNy9folJBvyb96byS
	RZZmveogn3WJygaBKXV6oH/SrMw0HFraEaKgZGvANprzF3mJukRbueKK9XQvFijFrg6EMuLL8DH
	sGgPhvoU=
X-Received: by 2002:a05:600c:4fd1:b0:453:6f1:bdba with SMTP id 5b1f17b1804b1-4538ee60a60mr107461065e9.20.1751288490657;
        Mon, 30 Jun 2025 06:01:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHvKPbKK01jDGKdO7HMFpJHGVfeP34xEfryqVjaTqeCy8FfNy/5uAgcgaE7N6g1euFItwJ1Ng==
X-Received: by 2002:a05:600c:4fd1:b0:453:6f1:bdba with SMTP id 5b1f17b1804b1-4538ee60a60mr107459575e9.20.1751288488983;
        Mon, 30 Jun 2025 06:01:28 -0700 (PDT)
Received: from localhost (p200300d82f40b30053f7d260aff47256.dip0.t-ipconnect.de. [2003:d8:2f40:b300:53f7:d260:aff4:7256])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-453823ad01csm166146565e9.22.2025.06.30.06.01.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 06:01:28 -0700 (PDT)
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
Subject: [PATCH v1 25/29] mm: simplify folio_expected_ref_count()
Date: Mon, 30 Jun 2025 15:00:06 +0200
Message-ID: <20250630130011.330477-26-david@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250630130011.330477-1-david@redhat.com>
References: <20250630130011.330477-1-david@redhat.com>
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
X-Mimecast-MFC-PROC-ID: sAHirZ0_MPmTevnZmOe6aTeR0OLrqyhJmRLeVR0EOfo_1751288491
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

Reviewed-by: Zi Yan <ziy@nvidia.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/mm.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 6a5447bd43fd8..f6ef4c4eb536b 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2176,13 +2176,13 @@ static inline int folio_expected_ref_count(const struct folio *folio)
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


