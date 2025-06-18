Return-Path: <linuxppc-dev+bounces-9471-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 748C7ADF452
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jun 2025 19:42:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bMrcr5VCYz3bp7;
	Thu, 19 Jun 2025 03:41:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750268460;
	cv=none; b=b/hzhaETiSE0DySouBnqtvpaLBrCn7jwaxDnjf9KTC6+0HMi/NQb85oKVW8GNyxcIrr6KrivdBG4btCxpD6zwGwQ+SI40APMFIZabu7NimZo0t7b/cOMoEaZRjBZV+TpA0N3eTZ4mCf6w+02ZnJ4owjo7TnXWEnl4pwuapWmfTSXPgFoiqpDacpT98Injg7v/058i1O4NwusUmais9RL+rjXHAzrt9R3aOvdJt3IEKiEF0DizKdd62sqR6AkXuUSmHHwoMQya+MqvY9qqKmgNT53n/0jItjC4SYErEzZWZcO4BpZAuTFTjFywrkfrzlToCiu8CUwBdn3lppK5GrGyw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750268460; c=relaxed/relaxed;
	bh=R518sUXauciWuWBIWO47EfDSUo24r+YyG2S8Z5J8Wko=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=Hn4Ue/r/6H6T8d5MIWqbJyqNDcMoXROj6u2gObribWIKI2bm6YV6/lYqxqytx+FoXi3WsjZRHl8EkrAp2qarVIsjuSkyQ6h4JnjkXIErprau1V+Er7FOzsAwG6qULR9HJglKP+gJpBB8U90ouZJFq1jZFmrZw2MZ4s4hVw1QnAnne3Qp8sWUUoNJ8sA5hpTsjOruxltiPfLeKk5864MDMdB499x+Ev+w01D/7UqjMcjkZ9yBPGXlKB3MxbtDGDc4b7o3sfXvERltEmxz7bvjxZ/dwRCInzz8YN6Q/LvoACd1S+PaYjRYGsiVCON+KG+wS7Q+gdTnFs5vU0PRlAwHVA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Obgfr3wl; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Obgfr3wl; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Obgfr3wl;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Obgfr3wl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bMrcr0MCKz30Vb
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Jun 2025 03:40:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750268457;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R518sUXauciWuWBIWO47EfDSUo24r+YyG2S8Z5J8Wko=;
	b=Obgfr3wl5oiixzNk6OzF54750iRHRGxDmmxv8hd+bwrVtfCozYg164HmCk+2Dz284kWgv/
	154Wv9HMhB7FItq6oWiM5fsKQpDAz96BnrM0LQCz6dln7wkXPoxIq6BSHLgA7Yks+Io4s2
	71OwkppfvZmN3aZi8yX/MmSDnq2D1r4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750268457;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R518sUXauciWuWBIWO47EfDSUo24r+YyG2S8Z5J8Wko=;
	b=Obgfr3wl5oiixzNk6OzF54750iRHRGxDmmxv8hd+bwrVtfCozYg164HmCk+2Dz284kWgv/
	154Wv9HMhB7FItq6oWiM5fsKQpDAz96BnrM0LQCz6dln7wkXPoxIq6BSHLgA7Yks+Io4s2
	71OwkppfvZmN3aZi8yX/MmSDnq2D1r4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-652-Hw74XmBnMb6wGYIov5bdnA-1; Wed, 18 Jun 2025 13:40:56 -0400
X-MC-Unique: Hw74XmBnMb6wGYIov5bdnA-1
X-Mimecast-MFC-AGG-ID: Hw74XmBnMb6wGYIov5bdnA_1750268455
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-451d2037f1eso43919575e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jun 2025 10:40:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750268455; x=1750873255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R518sUXauciWuWBIWO47EfDSUo24r+YyG2S8Z5J8Wko=;
        b=gDpSjlrep1f4AhELWaECT5R2nhQ65e37B4IrGTDTezHzoEBlF7Yi6w/VeBWFW+/kOH
         eJ5SNFhJLzDVuIhht2j1cRTbbp4PGGPB//hB7xq3Ozsg9VITgcQ2M7sfKchRdfjP8fNj
         ih7gx3NRszRPQ6HRtjKOeoB0VyB2gCVS2wR2CiSHTpwUHws4eWuWgJxttfYYZMgfpMmK
         +95u3/Yd99CG/zxUOP6T9WjXeT42utn+DZdkq6B++5e25qNNN9qq6oSKgGcSFUbb3o+C
         K2uCWCh4w//ykzAD8AE+ZiWl7l5oC7dyuSCMPEEB4g7QJI5SYxr2WE26ryes60hTuPMY
         Xf5Q==
X-Forwarded-Encrypted: i=1; AJvYcCU0RwTgD0YHNGX/cSw1p3uDuIfCPJbRbf5kUHehk38axKtTfaFELgJG9hjVci8QsVuaj3hfTU6/gzz810U=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz89EWq1yHfxq2YQWih22O6AHCDyGAAQ9LyRZPBVQL8XDIZMu6r
	XAKqxJIHWWTEYDnbrS2fQU/gYzQQFpjPXG1xQGpawDMLyPKZabxRFtqB6l0AT+ZtG97R8L7PQlT
	QlNEmirW+6fVgQmdUZd9ZasXq2OauGJA1cQR8edtNJqZvUEtkEuMY1+GZIJTUD/dB6E8=
X-Gm-Gg: ASbGnctZqnN6yLnlD7HjMdA03spxDnlzpL21+ZecKaWNPxkAKNJAJ4NkbIljEjWeymJ
	wZoR95BdHUCAX2VZxaBjvCwxUAoZ1AOUnsyRXLziB8YvKRg0DoCFhhtMCfFih7f2GQWU0oKbRzm
	Vfe7YC71SUbBZHAnc6xwka1W7Pzkwdkll4NmnTixeJgf3CI64X/f91ce5oIyLSC6o8jheqv7qPL
	hOo7J5AXSF0mPi/I6k24xSdVDE39XL2P9714uivDLNEMEmySiFDXqdI2LJMTXZ1SGuKx+7v0Ihc
	14lOntSG2OeyKDYoSlWcvOQ/KWEIHvyl04ZWq8otggHHixBqyzVHjRMPxAKcK7ju0BPWRoUvZz3
	rK1VJ8g==
X-Received: by 2002:a05:600c:8509:b0:450:cf46:5510 with SMTP id 5b1f17b1804b1-4533cb53b27mr169412555e9.29.1750268454840;
        Wed, 18 Jun 2025 10:40:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IECPQIWD9z7ds8IhVmKE9L3mk+qhph5JCu6Oi2OcOPUlhg6wunpBLWb7MobaQ8CxMoDDmzTIg==
X-Received: by 2002:a05:600c:8509:b0:450:cf46:5510 with SMTP id 5b1f17b1804b1-4533cb53b27mr169412335e9.29.1750268454440;
        Wed, 18 Jun 2025 10:40:54 -0700 (PDT)
Received: from localhost (p200300d82f2d2400405203b5fff94ed0.dip0.t-ipconnect.de. [2003:d8:2f2d:2400:4052:3b5:fff9:4ed0])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4535e983b14sm3703725e9.13.2025.06.18.10.40.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 10:40:53 -0700 (PDT)
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
Subject: [PATCH RFC 14/29] mm/migrate: remove __ClearPageMovable()
Date: Wed, 18 Jun 2025 19:39:57 +0200
Message-ID: <20250618174014.1168640-15-david@redhat.com>
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
X-Mimecast-MFC-PROC-ID: Ys3pg0jX7kU1c6Aa8MPQMcciz5GyhyuI99sVW6pm2lc_1750268455
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Unused, let's remove it.

The Chinese docs in Documentation/translations/zh_CN/mm/page_migration.rst
still mention it, but that whole docs is destined to get outdated and
updated by somebody that actually speaks that language.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/migrate.h |  4 ----
 mm/compaction.c         | 11 -----------
 2 files changed, 15 deletions(-)

diff --git a/include/linux/migrate.h b/include/linux/migrate.h
index c99a00d4ca27d..fb6e9612e9f0b 100644
--- a/include/linux/migrate.h
+++ b/include/linux/migrate.h
@@ -106,16 +106,12 @@ static inline int migrate_huge_page_move_mapping(struct address_space *mapping,
 #ifdef CONFIG_COMPACTION
 bool PageMovable(struct page *page);
 void __SetPageMovable(struct page *page, const struct movable_operations *ops);
-void __ClearPageMovable(struct page *page);
 #else
 static inline bool PageMovable(struct page *page) { return false; }
 static inline void __SetPageMovable(struct page *page,
 		const struct movable_operations *ops)
 {
 }
-static inline void __ClearPageMovable(struct page *page)
-{
-}
 #endif
 
 static inline
diff --git a/mm/compaction.c b/mm/compaction.c
index 17455c5a4be05..889ec696ba96a 100644
--- a/mm/compaction.c
+++ b/mm/compaction.c
@@ -137,17 +137,6 @@ void __SetPageMovable(struct page *page, const struct movable_operations *mops)
 }
 EXPORT_SYMBOL(__SetPageMovable);
 
-void __ClearPageMovable(struct page *page)
-{
-	VM_BUG_ON_PAGE(!PageMovable(page), page);
-	/*
-	 * This page still has the type of a movable page, but it's
-	 * actually not movable any more.
-	 */
-	page->mapping = (void *)PAGE_MAPPING_MOVABLE;
-}
-EXPORT_SYMBOL(__ClearPageMovable);
-
 /* Do not skip compaction more than 64 times */
 #define COMPACT_MAX_DEFER_SHIFT 6
 
-- 
2.49.0


