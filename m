Return-Path: <linuxppc-dev+bounces-10091-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E68AF8FFF
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Jul 2025 12:26:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bYVCC2Qf0z30Vr;
	Fri,  4 Jul 2025 20:25:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751624743;
	cv=none; b=aFXaB7Ih+/1yfzAhgKw897ypwMpJg0zES81Wx2SBC7Wm8HbPqvHhpt+xqYZzSOY4wBrPe9OGM9UsEAnRDzEjK9awZvXEtW/5eru5Do9hb3ozQc745UaebQyFTYsYDABfo8QJGBz3Fw3k6qhNjOd/D+or984DpahehFs2dwJeyZnfFo4tGJ17aHCApR86atFqTud/dJScJlkzmrVPoHAG7Fnqa9aAcWJ5YsUOJEltcle2p+IninWCfTDdy5tplYb566KY08cWckk0sFvVls1W0/0QM/gMTWHHo9JF5TMPTBjQGpGvngzqVqRdGJwovIARdFxcwJZrHsN1D0QzdmhBgg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751624743; c=relaxed/relaxed;
	bh=Km36h+57LoMclmINdAl2JdQwpEFbx1KUS9NaV7ZwoS0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=O4+n0AVxTZzhgaQ6RnGpRiIJOejjpiinYNN5lX1PxiX5AHrrDVaOsp0h3Buss6QrGjEzahRCgkP+XQ3wP9EtS7SEJdaHxWuOY32Z+H0KwDlAmCUwvz+wa5zjoI0b1cp7MCt6owZegv18NMbR8PA7KxcSiuyoa8n3pBPddIyf9LBLFGBT2iJhPuN+1CIPqaptYXQIgT4Ya1bstwyaQsOBlNyQnZO34hua1fmU5LmtnYgW3NUyJo/yd5sEvPHxvRUVaM/HA5b3S7EAWQVjlH3WxApMuaQl9mR4VVozUItz2zJCo9fqw/PO2zzHCiGt+l11GBZu6Js6oTllBhyeJKVWVA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GzAC14Gv; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GzAC14Gv; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GzAC14Gv;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GzAC14Gv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bYVCB4Q4wz30Tm
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Jul 2025 20:25:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751624739;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Km36h+57LoMclmINdAl2JdQwpEFbx1KUS9NaV7ZwoS0=;
	b=GzAC14GvuSB2ksiwZYiP6N2Tk0eg9CEU9NHuFGQK7s2ksXzJsLSaO3PzqPzppefp1HWK3k
	Z+i+nGGCOr54XITwFkgRsdLFtRzewR4TAMAz8JRcQTZL/3HW15l6GVLQhCciDMkJeE7Bjk
	DNtnpl8NbYRsHkcruHVGcJm2KYxEIRs=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751624739;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Km36h+57LoMclmINdAl2JdQwpEFbx1KUS9NaV7ZwoS0=;
	b=GzAC14GvuSB2ksiwZYiP6N2Tk0eg9CEU9NHuFGQK7s2ksXzJsLSaO3PzqPzppefp1HWK3k
	Z+i+nGGCOr54XITwFkgRsdLFtRzewR4TAMAz8JRcQTZL/3HW15l6GVLQhCciDMkJeE7Bjk
	DNtnpl8NbYRsHkcruHVGcJm2KYxEIRs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-48-68mDnfYPNBWNVoSKjXn18w-1; Fri, 04 Jul 2025 06:25:38 -0400
X-MC-Unique: 68mDnfYPNBWNVoSKjXn18w-1
X-Mimecast-MFC-AGG-ID: 68mDnfYPNBWNVoSKjXn18w_1751624737
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4532514dee8so5049475e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 04 Jul 2025 03:25:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751624737; x=1752229537;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Km36h+57LoMclmINdAl2JdQwpEFbx1KUS9NaV7ZwoS0=;
        b=YN9ierP0iDasgp8CxOVeksg3hEPVwS5TKQiRZDBuBZfCOHfGA8AltM8sYO7AaaOArO
         HbSbd8HIloXAA5PsVAPzSvfmWr6adHcBNkX+vizLivqs2+yoNx5TOHLjvV51irA1FOKx
         IjzkFQcnkRV0re7z8wTLH3rW895qgMArQy/2t5J35yA8e9nUJmuEgfjQLO5b3vWwzdTf
         idwGbxFhzNxhiTDsnzb4ekRBaHDgbcfDApVC/Z9eUrMTEZv+MAbVt0LKF+9OaUvUiNua
         AZ0SwnipyUGODVhEyFLKV3V7uyAl93OFy10D9WkJQGp8dAnOGufKInsnBOIe54lMFbgy
         +q/g==
X-Forwarded-Encrypted: i=1; AJvYcCVctKNNk6Y0ULb3vpfxSvd5opFjw3rNSsasKCJUrezdbadlDJIB7hkpPUkNS6KjfLtiQi2J9w++22KuEUk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Ywah7s/ktBchv+RnCh2nFUMmm2IbDnDA4iR3Rrjzr72H71fUFfh
	cX+r/6DgBFODZptojEblh5GWSpT/ZgDO+aE52uWbHDbgzU2w5qJilmPfvo8CDolNGVHkqxpTYtM
	IeNTz4ofJ1uks31p1snm4+bq6vO9e6RLld+tTWE40rBdsVyJEdz9dwiSTxTafeZ8fPfw=
X-Gm-Gg: ASbGncu56ll6hS1WYtgrrtgSQKuu2HtvPaQLRdv2AkbFE3rSKhmUxw3LyCZGsJ8OD8A
	wqtSl/kPY3RrxH0z2u9bmn4kPahTMmcYXvyhn313HwwY7A3+KLr63QWMgZwgEOwOOKUejymLypJ
	vJcGqzjSNutK8nxOfxwhRYCxxn8F0DExKWMuIavykeeQWPokVH1hWjrj1cf0X1vuWSePkVMSh1s
	dS8IMiE9xEGI6B8ANDmtywHUwBfVmpAz9TMkkM99C3AW/FXRAxwiyaunpUb7zvUmlZht3pEi97C
	xuWw8/BqB0VpzpVTRq9aeqNY/L+swsKG0QnER71zm8zmRUS3gjAbYj/w4DrS0HZjko0XkFHowaJ
	uQaLaaw==
X-Received: by 2002:a05:600c:348d:b0:453:608:a18b with SMTP id 5b1f17b1804b1-454b3096211mr21111185e9.9.1751624736389;
        Fri, 04 Jul 2025 03:25:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEYWTkwuG63kWN2pUNG4mMJ/rp0CK4ANHmE+tpQrKYs+JLvfC5kMT/JJWZ4Z30efeBW784Wqg==
X-Received: by 2002:a05:600c:348d:b0:453:608:a18b with SMTP id 5b1f17b1804b1-454b3096211mr21110415e9.9.1751624735911;
        Fri, 04 Jul 2025 03:25:35 -0700 (PDT)
Received: from localhost (p200300d82f2c5500098823f9faa07232.dip0.t-ipconnect.de. [2003:d8:2f2c:5500:988:23f9:faa0:7232])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b4708d080csm2111024f8f.23.2025.07.04.03.25.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 03:25:35 -0700 (PDT)
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
Subject: [PATCH v2 03/29] mm/zsmalloc: drop PageIsolated() related VM_BUG_ONs
Date: Fri,  4 Jul 2025 12:24:57 +0200
Message-ID: <20250704102524.326966-4-david@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250704102524.326966-1-david@redhat.com>
References: <20250704102524.326966-1-david@redhat.com>
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
X-Mimecast-MFC-PROC-ID: ELyypOLce2EzphiOvBhi2g8OZOsjbZ_HDwMzN1XUtJM_1751624737
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

Acked-by: Zi Yan <ziy@nvidia.com>
Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
Acked-by: Harry Yoo <harry.yoo@oracle.com>
Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
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


