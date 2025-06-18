Return-Path: <linuxppc-dev+bounces-9469-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 380FDADF44C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jun 2025 19:42:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bMrcl35nHz3bn8;
	Thu, 19 Jun 2025 03:40:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750268455;
	cv=none; b=gz2+m9MCfNJ2N+1zdB8MniRE+JMtrDcnEdvgfXvKSVdAMkdgRg6IsiIOm32MGosjxlb39UyahVc6r/A2MMmgbuFgTO0k+ulvLJOo1wPbXJAA3zVonnsPD987t9IR0JhKJUIAs9Bs0n3lw+noX9rcQbZSNLCXyHnvNqiQdfpjJO/kbCipNh+I2Aly+eeWSSfZ4i9SuDvvxXfK0ccNzGF5LLuri6teUcqBrqYr9uHXz+XqYAeeqCyQ2aZ/pT2b4aNxdp88rIfcvzNaNCkHjUKhEumWn1PbDI8prGkGK9YcwqUpeRqt0EIKfXp7CbgEJmCbDQvMyUesQmHcj7TGIDVoQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750268455; c=relaxed/relaxed;
	bh=HE4ZFr/3yO/kcvQGBFxRWJWFhigh7sWDavgkH8Q96v8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=dxJX7ju6FM02T5mgG6XelAJ/wjyGbYzj9LtsOIpha0sRnV9hTM+aryu8VcFFG9J1ewAQPu6dkYLT7qImNSWLp4y3fP44qN1H89so5Gz12Ch/ySmZUJbNaoUwABrc9JPlQQ5dbyIsx+gzVXot6Epebw3xgYVawLvCQ/BP0zmZSUZbBzhceMTDE/EeTbTlXXaHjC+dhKPQOox76YMTACRsYyob+n/qUZy8r5eF9smo4SlEfRbLu+tI82Ra1hWZoth9x8lraGBk/aXtvHJYFBHImStJpubtAx7Xygvc/v3W+j4PKkgnwe9Nu7j+HoUDXxlh7EzR3YsG3Ab2mDOpItsFaQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=K/YFpcQ3; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=K/YFpcQ3; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=K/YFpcQ3;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=K/YFpcQ3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bMrck4ZLMz30Vb
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Jun 2025 03:40:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750268452;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HE4ZFr/3yO/kcvQGBFxRWJWFhigh7sWDavgkH8Q96v8=;
	b=K/YFpcQ3G+12GwD4fz3kXUm+VDiN2cCOWCbL3/1TROiyh4MhBLAyE4iwpR20QBGUTGyOTl
	bkVP6BRaRtrpPVdFoqoG3pdGE92piCv6MO5EUSokeLH0do8SU/GvxY94vrGX1cK6cZadQR
	L6XOgnSAqIL3LqXK8Fn0cvcsgq7aIHc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750268452;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HE4ZFr/3yO/kcvQGBFxRWJWFhigh7sWDavgkH8Q96v8=;
	b=K/YFpcQ3G+12GwD4fz3kXUm+VDiN2cCOWCbL3/1TROiyh4MhBLAyE4iwpR20QBGUTGyOTl
	bkVP6BRaRtrpPVdFoqoG3pdGE92piCv6MO5EUSokeLH0do8SU/GvxY94vrGX1cK6cZadQR
	L6XOgnSAqIL3LqXK8Fn0cvcsgq7aIHc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-28-pJgnA1p_PQ-Kh_YhDpJchA-1; Wed, 18 Jun 2025 13:40:51 -0400
X-MC-Unique: pJgnA1p_PQ-Kh_YhDpJchA-1
X-Mimecast-MFC-AGG-ID: pJgnA1p_PQ-Kh_YhDpJchA_1750268450
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-45311704cdbso37818115e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jun 2025 10:40:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750268450; x=1750873250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HE4ZFr/3yO/kcvQGBFxRWJWFhigh7sWDavgkH8Q96v8=;
        b=kPPV56bpI9OGozLDMYwVWFUV5MQRCdm7X1UjPmPNqj+EvyIvYQ9i0x3ejU2WXrGhSG
         BowO/9WOGucu2LOK6tDcCtIvBrTHiNW5Een00IICv6Rjq16tdQJfNJW+fiyrAaP8Rn4F
         CQCTPZ8jwCwtJ1/TzkSPE76VVwnlPlotO5k4lE4WcJltlXMJ4Bo+sJssEEhnBosNjOli
         nTnPCMF6m2GszJ6+V3ZHJfutH04tbsdauG8HXBd+CMYqnr4y6HL5GnOXS/a9+s7ruU5Z
         7G0ODogHKKWjVVQEgtr/DKEbMPp0tp8W8r2FtbIo6oMDpdJLtp5sjIrK8NXbx8uTQItb
         9QQA==
X-Forwarded-Encrypted: i=1; AJvYcCWBPN9R8Ne7Nx1CITr2ruYOBmiA3VreFhAvxY9eC3gRfDkb85YjuWFS3PeuJ6tcTY53fylQtb1CerDZKVU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxgoVw4sSSoJdlJinVUMj47Gezv7YJwt77uJ703CnbA3xXCtFkO
	r5d+35dV3p4/tT4Gl4oL0u8H9D3GqzJR9RbBUCyVPD53LvUY0YIzf+6E7Nyuye6TJs5BGAIj6lF
	CnCv+SqGs7WSiM9iZCMwpyHbyahe80NZqEz9aMvT3yYpJ9W+cW6tXnavueAaJZ/zXE2A=
X-Gm-Gg: ASbGncvPqmBzYevzaeRRouDsZdAv58Y5IsIwhpZ39dJ73hNOr5BdjYOh7CJIeCcb84Z
	KT4l6LGxSLUscAq8rQh0fQLs4cgtPhjkxw1PrL4LGSmEMQYKS5abie9TIgCBOuUYLn1hoq69d18
	lRC7UTdQpwFaFNnd4g6AEBOwsRZF4abt9ouw7mHSNTCV8qJPiy7LLpVOxJ54BU86CcfY5CVLk8z
	jJXupM9u5cEqt3qKxOcAcW6g9aoM01XYGAFpSaA3wxWAchzxwTNeEx0YfORZaw0EM5Szv8kdtHz
	94b7JRoPbKmRHaFqc2V/1h41/gJ2GVohnskLRkJ5yolxQaKaIWvMFVOgLRKc+VFrLu+TsEqDNqP
	WszaF4A==
X-Received: by 2002:a05:600c:1d8c:b0:43c:e70d:44f0 with SMTP id 5b1f17b1804b1-4533caad0aemr171064575e9.19.1750268449525;
        Wed, 18 Jun 2025 10:40:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGznKIGl3nAorQ6sfOY/mgzfowzauuqoYlpxs90ugUrSAZIVXpSWN8Es+fpzvWy+uQJD/IOZw==
X-Received: by 2002:a05:600c:1d8c:b0:43c:e70d:44f0 with SMTP id 5b1f17b1804b1-4533caad0aemr171064285e9.19.1750268449019;
        Wed, 18 Jun 2025 10:40:49 -0700 (PDT)
Received: from localhost (p200300d82f2d2400405203b5fff94ed0.dip0.t-ipconnect.de. [2003:d8:2f2d:2400:4052:3b5:fff9:4ed0])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4535e983c76sm3664265e9.10.2025.06.18.10.40.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 10:40:48 -0700 (PDT)
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
Subject: [PATCH RFC 12/29] mm/zsmalloc: stop using __ClearPageMovable()
Date: Wed, 18 Jun 2025 19:39:55 +0200
Message-ID: <20250618174014.1168640-13-david@redhat.com>
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
X-Mimecast-MFC-PROC-ID: t43rN3waOv2U3Z-P76x6Dxs9i9zSie72E6j39llkEuI_1750268450
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


