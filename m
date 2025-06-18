Return-Path: <linuxppc-dev+bounces-9460-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E9FCCADF431
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jun 2025 19:40:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bMrcH2kzRz2ym2;
	Thu, 19 Jun 2025 03:40:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750268431;
	cv=none; b=kP6EfCyNTiQ0lBNqrvcOeFHaP6r0Q55ZKI9nRDOjksH1ph3siczbIZyUmzLJw3m7lPZtPkRggV0vlezYY6Y+F40wZZCmU6+AkVsqstcJfeLxjVLfpYwn8zqloepsNWuV0gWWsLM3aGCCzLmnzZGzW6r3y0P9iZDJwRY08M5PRMtxgVpP1yhQ/FmU5LxBqM9Ur94sQURtKOVXKeaRRsMJMKEVCVp94/+X1r3nSl1EHz8U++EE2VMyC62SUxnNfYDb1yp4P3TtanwDo+6OJJrA3qXvPY62ciqpFqTExWZ/Xn1tPNvyLUBxqtBk9xwbOVBCjUjkdVrM5rPvx5QHxqvH4A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750268431; c=relaxed/relaxed;
	bh=S7FgUVlGmmQh/Fden7VOoWF093l0D6F2nUhdFZr7YaQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=nMkJtpARVDZi4lIXj5ymf52SW5gsM7bLxa2A0ie1hzcewjtZW9QXgS88ZNYw504Ex9ChvnRo7qGWGPxqvNPO7vy646FhU2ndPZH1lD2xv8qxL0sEOzkUved3zCbOtsbXHKzrpR9DzMCgbKCfoKPwreSNuxXx2f9YV6PbeeqHU0J+ovB0X89oe/i4NsheS8CeKChHRtmMnVK9Q2Ph8S1rjnRo7T9MoG8RLqD4WBJ13k2fdiNTAMEvJnff3krJLlQ25uSm3cU4jor1B002yvlKPAJ/7qpzC6/KBpD7/prJSr9nJcTWxsY2e0Jz+SNae4A5utC3pskt6b+FDAxw9118aQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NJpSklCS; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NJpSklCS; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NJpSklCS;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NJpSklCS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bMrcG4nrPz30Vs
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Jun 2025 03:40:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750268428;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S7FgUVlGmmQh/Fden7VOoWF093l0D6F2nUhdFZr7YaQ=;
	b=NJpSklCS+qC/2H+g3tk9QoeR1ANJ4xCxJJXTeQ+CczF02Rb5n4RokZGMEpEhQU9gI2mMkn
	L8s5hsQtWL5USkfkkzeDBMXKNR6RA+ABhFLDws0EhA1IqOTbxeA/8CMW9A6ILP82L/HoRw
	bqVg+MmJRspEU0luPZ2v3PFJrZ1yzfE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750268428;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S7FgUVlGmmQh/Fden7VOoWF093l0D6F2nUhdFZr7YaQ=;
	b=NJpSklCS+qC/2H+g3tk9QoeR1ANJ4xCxJJXTeQ+CczF02Rb5n4RokZGMEpEhQU9gI2mMkn
	L8s5hsQtWL5USkfkkzeDBMXKNR6RA+ABhFLDws0EhA1IqOTbxeA/8CMW9A6ILP82L/HoRw
	bqVg+MmJRspEU0luPZ2v3PFJrZ1yzfE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-131-QBxv9J3hOwyXt3MpzUhohw-1; Wed, 18 Jun 2025 13:40:26 -0400
X-MC-Unique: QBxv9J3hOwyXt3MpzUhohw-1
X-Mimecast-MFC-AGG-ID: QBxv9J3hOwyXt3MpzUhohw_1750268425
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a4eb6fcd88so4232556f8f.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jun 2025 10:40:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750268425; x=1750873225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S7FgUVlGmmQh/Fden7VOoWF093l0D6F2nUhdFZr7YaQ=;
        b=t72eewi5XGmKC3vtSg78fLcmtd2ve45r4W0MWClWTpIW2fsQXO+YuwiMJaLUKVtFM0
         Wlht1TQaOiGFymARmS7mlhTdkBM8WPgZRtWg2EhmyCu5KS8XMQCkk3huv3FiSnFTjheH
         Q1DCe3YWGYByCea+6jSKrSK6XeyGcj/FU/ScyjC9a87ppslEFivmh9dRbamUO1dVlDQi
         zYsVfJd6UaPgcbM1OM4nXusWZeiHyAmuGPvBQz/MOUGPAapeBJ85JNB+GSy8W8xQQ7ZG
         +n9RPL84Cb8K/5Sj3kj3y6gQr4Y8a3fmcfHh2EGIiQeUBXb/qhdyqlhJ3WXgGlBgjQ0w
         yrKg==
X-Forwarded-Encrypted: i=1; AJvYcCUXBp5aahHC++Hg9aPiqOQnBbqLGS2wY34k2/qjmydGaU3xlHd9+U9Sm27XfV1hTe0dHD6Jj3S91WE6sug=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxEpTR/VblPtvSb5IFMBa7a8fKAKsexB6uey63fWNgj6d5m4ptM
	bw7LkhOHEtLkv8CEZDVCUa1rk/P6OIgVqVEgT19N8m2dhqv+SnCUcmdLnwc0ZQJVlVPWy2i5gdn
	9opYfyAXKe/bwyZXLYD75hhq8RXiGz15a08PiNQWXk3I2LWB6EnoqMm0qUsOR/1YvwHw=
X-Gm-Gg: ASbGncshaWihJx6WmSSxR/9yeZVZa4BpmDpDAs2yx5Kjm2DZiSCQtKtcQ+Wu0+5iAcF
	p2TT8fUZXWLQmb16UEHou8is9SHJUGclx+2Ejui5S/ZWd0MntYGv98NdazHICi6dQN49i5FzNHT
	SQAo/5kGqulMvd1EqRa0nYB+vRTB5qtHp9FgtnfBTwdvWNKY98tNpP4Fsn0vl754sdriwV4tDv2
	qV5D1K8I3S6xNhVKbyqtW3Uk4JC2Y/5Dz/QU0U66FoCTkbUZuFnN+n4rJ29Bfl2Y/HWDDLm2N4y
	UmbB6zhTebsN63j9Ecu/iNE+WU7fdVXYcZZ5JM8D40o0WtDhk34khVbSZTOPgCJgpWUwvk1uDjS
	pM8uIdA==
X-Received: by 2002:a05:6000:2c0f:b0:3a4:ed2f:e80c with SMTP id ffacd0b85a97d-3a5723a3f92mr15706256f8f.31.1750268425273;
        Wed, 18 Jun 2025 10:40:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEayKPP2LeH5F/Ng3XTSzlfhGIAIvFkyNEolXxAmF4Ok7MzyUOG21uTMpu2qvZTdT619UlY2Q==
X-Received: by 2002:a05:6000:2c0f:b0:3a4:ed2f:e80c with SMTP id ffacd0b85a97d-3a5723a3f92mr15706239f8f.31.1750268424824;
        Wed, 18 Jun 2025 10:40:24 -0700 (PDT)
Received: from localhost (p200300d82f2d2400405203b5fff94ed0.dip0.t-ipconnect.de. [2003:d8:2f2d:2400:4052:3b5:fff9:4ed0])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a568a547ecsm17734777f8f.17.2025.06.18.10.40.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 10:40:24 -0700 (PDT)
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
Subject: [PATCH RFC 03/29] mm/zsmalloc: drop PageIsolated() related VM_BUG_ONs
Date: Wed, 18 Jun 2025 19:39:46 +0200
Message-ID: <20250618174014.1168640-4-david@redhat.com>
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
X-Mimecast-MFC-PROC-ID: SCUzyflfI0qm2X4xzjBlvFNsFHlFgRZTIDPtGBOCtm8_1750268425
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Let's drop these checks; these are conditions the core migration code
must make sure will hold either way, no need to double check.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/zpdesc.h   | 5 -----
 mm/zsmalloc.c | 5 -----
 2 files changed, 10 deletions(-)

diff --git a/mm/zpdesc.h b/mm/zpdesc.h
index d3df316e5bb7b..5cb7e3de43952 100644
--- a/mm/zpdesc.h
+++ b/mm/zpdesc.h
@@ -168,11 +168,6 @@ static inline void __zpdesc_clear_zsmalloc(struct zpdesc *zpdesc)
 	__ClearPageZsmalloc(zpdesc_page(zpdesc));
 }
 
-static inline bool zpdesc_is_isolated(struct zpdesc *zpdesc)
-{
-	return PageIsolated(zpdesc_page(zpdesc));
-}
-
 static inline struct zone *zpdesc_zone(struct zpdesc *zpdesc)
 {
 	return page_zone(zpdesc_page(zpdesc));
diff --git a/mm/zsmalloc.c b/mm/zsmalloc.c
index 999b513c7fdff..7f1431f2be98f 100644
--- a/mm/zsmalloc.c
+++ b/mm/zsmalloc.c
@@ -1719,8 +1719,6 @@ static bool zs_page_isolate(struct page *page, isolate_mode_t mode)
 	 * Page is locked so zspage couldn't be destroyed. For detail, look at
 	 * lock_zspage in free_zspage.
 	 */
-	VM_BUG_ON_PAGE(PageIsolated(page), page);
-
 	return true;
 }
 
@@ -1739,8 +1737,6 @@ static int zs_page_migrate(struct page *newpage, struct page *page,
 	unsigned long old_obj, new_obj;
 	unsigned int obj_idx;
 
-	VM_BUG_ON_PAGE(!zpdesc_is_isolated(zpdesc), zpdesc_page(zpdesc));
-
 	/* The page is locked, so this pointer must remain valid */
 	zspage = get_zspage(zpdesc);
 	pool = zspage->pool;
@@ -1811,7 +1807,6 @@ static int zs_page_migrate(struct page *newpage, struct page *page,
 
 static void zs_page_putback(struct page *page)
 {
-	VM_BUG_ON_PAGE(!PageIsolated(page), page);
 }
 
 static const struct movable_operations zsmalloc_mops = {
-- 
2.49.0


