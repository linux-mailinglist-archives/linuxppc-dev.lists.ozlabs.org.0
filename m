Return-Path: <linuxppc-dev+bounces-9895-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ADEBAEDDED
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Jun 2025 15:02:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bW5rL4Kyyz3bNt;
	Mon, 30 Jun 2025 23:01:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751288466;
	cv=none; b=nKbLHJBPTp7yKBibKejSztbwp+goBoWKPPPyey2jQG9rnzPAAOHU/FoXxp9TQzkNpvjCHXw286oMoyvcwtwBatLtjhJ4CiysqrAeiZ1EreGDk5GvX9wGLDFFZkINrID1PeESKCi1CWob+YXpL4AXyTPDrE2rb6/wMdpOFoICT5mdWrpzEjNqiJ2WM7bXnWIZppKFjkzadhyi+VB4jNZiUsUvOpm1P5N5HoliRc3sz/iUZojywprHV/fu943Rd/zmYMU880mynpp8Y6dZLiE/0HUEx1fCarYpIO1a8fiTHL2XaMalEEfB0dYCeVvdtQP9BC52KfjOd9lSISsbPTMSPA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751288466; c=relaxed/relaxed;
	bh=HE4ZFr/3yO/kcvQGBFxRWJWFhigh7sWDavgkH8Q96v8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=k+7+huW/0Mk9NSUNckfdwWJxusXU7sQXEAMHQLTncBXhQrll2I84P4yDnwu9GwlcAu+pbz3aBn9vz2Bf8B6IlVktU06LjPAL2Hfyd5ZL+2K6LX1UFpzrCA6hgxR9OuVQ5idvO6e8UljYDV63OhDxH45MNrBjoBZDxO/1hsMy1lZk/VtilPtrSLTHaPOXiu1Z4lktxpw18iWAJ3Di3NBxcIJPcW8gCgwNbKyefkwEHkfUtvKOd0788OT3cr5vRbvEyTMie12ZgazNS5JQfXVXq5mVn/lYx5dIzjjO5g8hOEHwWmGYZbzysgPPDdGAOZ1vhOfZbM7EVV5MIsCvtAltUA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OQOhgiV8; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dW0tFJCt; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OQOhgiV8;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dW0tFJCt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bW5rH64Psz30hF
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Jun 2025 23:01:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751288459;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HE4ZFr/3yO/kcvQGBFxRWJWFhigh7sWDavgkH8Q96v8=;
	b=OQOhgiV880XdhNoTDuDwg/hY7Zc6YftUWYsqr2ZMMiCEDRKLLxqPFbsjhpZpwVW2nEYIuy
	CbZV2+baCMPmPDLGjW06EdHLRnyg6scpPaG4UQwz0ndFdY6guQ5eI3JPSQFW4PuGfJIiH3
	b0HjGnmOtu+JCj4NE32LS2wsPKnETi0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751288460;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HE4ZFr/3yO/kcvQGBFxRWJWFhigh7sWDavgkH8Q96v8=;
	b=dW0tFJCtkzJCXU1LQ0zOfC5h5uRSxOSIb5u4WKjzdhE4Gjl73p9JcMwQr9Nw9TQKcre6ZM
	8y/p3QNw6Gf+JwYlUHo637tVifxX6t298iZ+ON1XmkclJyO9Ryq01tiY2a5EP3mAQ4c0yT
	Ko3gjSPyAJyN+SY6zgyge2yWaXpTRW4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-226-REO5xzALMFWbq-a9dD73JA-1; Mon, 30 Jun 2025 09:00:50 -0400
X-MC-Unique: REO5xzALMFWbq-a9dD73JA-1
X-Mimecast-MFC-AGG-ID: REO5xzALMFWbq-a9dD73JA_1751288449
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a503f28b09so2270002f8f.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Jun 2025 06:00:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751288449; x=1751893249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HE4ZFr/3yO/kcvQGBFxRWJWFhigh7sWDavgkH8Q96v8=;
        b=SDpcbZDCr/ZgN+8HrmOodnWURIJ8Kup/oGTkHKWUZVcvPtjOuC1U30xMZeCtMd+W6B
         CrH6J/nafs9rBSxsUel13BxjqhnSK/9St0OblnmuwraWuscpyzah92pB3odR1fBRFzwm
         UOoHW4QHXnZFhgIKnhTHrd9FQT9QeRedRter1sPr59lid+pxCI1EC5mg8aQYi3YPeSDx
         Z0IaeDCvJZceiquupOx9AMPpxXp50/4jBPZ4lFse3icACbl5R+EURu6Joi/ghhuvZPA+
         nzzyJbXMRpmyNNwy+Q/jp/1TnbBD1q9bZ/aQM6mC9N4xqSAApb696y2PAyKnKILOSJbg
         wsdg==
X-Forwarded-Encrypted: i=1; AJvYcCW68zj8z8CzXT9YRNqy6vEA4noxL+VJJ3WzAt99EhVCQCcv6LeuR+0DZlHFu5loFc7kymW04fMREc1nA+g=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yze1AiErEvYdRXWPVPjI2xeNTcCKQ7tz8WMEEW4nXQXj/o4ISE7
	q8O8FEpC4u5TlMTwLM5QbNULSRvnYWAYlQNwvzaajDpxUo1fMIYSQbyYx3fibmSA4qDf0EOWZ0c
	yWCHKLFT7p3NQrGD8iAAC+fSgEWC3mKAImgIyO9O9wd3vcfo0zg9EdM07f+GYR4xvmXA=
X-Gm-Gg: ASbGnctBojeePMu1/wv34q2Yt9XLoKD1V8z9WHqaOgZfi3wK/NjER0hz1T/tdf9uQwf
	G1bb9TBt/XyniLX4vQZC46HqXxjnhdmEh8z9GJv7J9LbNHqWymUnKJAM3gcdqpbkv0T+HsV86vM
	oClOi94YJNPJXqoOjeG71XPk+ofFLUHuPcIsE7aOSx4T/Jz4g980Xzu10mFMrCPeEQkACLTm8Ep
	ToW/2/7kkQC+2CLWK7aL4plMb5IBMMlw8LymVUI0gO6zirv5bQhAWT8G0VOi2h8StxS3SMPVIVn
	8iS+mAjk/WdJpPjU0pweD0nYlKZ0Di0ZHB+C05JNR8O3MH0ylXoJ+Bzf3Uy0FFKSLjdEb8cLqYZ
	BHDOnA94=
X-Received: by 2002:a05:6000:2186:b0:3aa:ac7b:705a with SMTP id ffacd0b85a97d-3aaac7b761amr5970041f8f.11.1751288448886;
        Mon, 30 Jun 2025 06:00:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHB1TGCDIUZET9zX0pBSLAtGHjOK3AMuobCCTliN5r8xMP/2a92mQUobTb4bSUGBJMrG9p6Jg==
X-Received: by 2002:a05:6000:2186:b0:3aa:ac7b:705a with SMTP id ffacd0b85a97d-3aaac7b761amr5969952f8f.11.1751288447748;
        Mon, 30 Jun 2025 06:00:47 -0700 (PDT)
Received: from localhost (p200300d82f40b30053f7d260aff47256.dip0.t-ipconnect.de. [2003:d8:2f40:b300:53f7:d260:aff4:7256])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a88c80b5aesm10252042f8f.44.2025.06.30.06.00.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 06:00:47 -0700 (PDT)
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
Subject: [PATCH v1 12/29] mm/zsmalloc: stop using __ClearPageMovable()
Date: Mon, 30 Jun 2025 14:59:53 +0200
Message-ID: <20250630130011.330477-13-david@redhat.com>
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
X-Mimecast-MFC-PROC-ID: i2EdY9datEx7A-U9SL5vaweXxZTDalKhcUeET7XWwjo_1751288449
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Instead, let's check in the callbacks if the page was already destroyed,
which can be checked by looking at zpdesc->zspage (see reset_zpdesc()).

If we detect that the page was destroyed:

(1) Fail isolation, just like the migration core would

(2) Fake migration success just like the migration core would

In the putback case there is nothing to do, as we don't do anything just
like the migration core would do.

In the future, we should look into not letting these pages get destroyed
while they are isolated -- and instead delaying that to the
putback/migration call. Add a TODO for that.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/zsmalloc.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/mm/zsmalloc.c b/mm/zsmalloc.c
index f98747aed4330..72c2b7562c511 100644
--- a/mm/zsmalloc.c
+++ b/mm/zsmalloc.c
@@ -876,7 +876,6 @@ static void reset_zpdesc(struct zpdesc *zpdesc)
 {
 	struct page *page = zpdesc_page(zpdesc);
 
-	__ClearPageMovable(page);
 	ClearPagePrivate(page);
 	zpdesc->zspage = NULL;
 	zpdesc->next = NULL;
@@ -1715,10 +1714,11 @@ static void replace_sub_page(struct size_class *class, struct zspage *zspage,
 static bool zs_page_isolate(struct page *page, isolate_mode_t mode)
 {
 	/*
-	 * Page is locked so zspage couldn't be destroyed. For detail, look at
-	 * lock_zspage in free_zspage.
+	 * Page is locked so zspage can't be destroyed concurrently
+	 * (see free_zspage()). But if the page was already destroyed
+	 * (see reset_zpdesc()), refuse isolation here.
 	 */
-	return true;
+	return page_zpdesc(page)->zspage;
 }
 
 static int zs_page_migrate(struct page *newpage, struct page *page,
@@ -1736,6 +1736,13 @@ static int zs_page_migrate(struct page *newpage, struct page *page,
 	unsigned long old_obj, new_obj;
 	unsigned int obj_idx;
 
+	/*
+	 * TODO: nothing prevents a zspage from getting destroyed while
+	 * isolated: we should disallow that and defer it.
+	 */
+	if (!zpdesc->zspage)
+		return MIGRATEPAGE_SUCCESS;
+
 	/* The page is locked, so this pointer must remain valid */
 	zspage = get_zspage(zpdesc);
 	pool = zspage->pool;
-- 
2.49.0


