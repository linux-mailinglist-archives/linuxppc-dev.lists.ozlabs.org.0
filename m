Return-Path: <linuxppc-dev+bounces-9479-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11313ADF468
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jun 2025 19:43:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bMrdH3J6wz3bsZ;
	Thu, 19 Jun 2025 03:41:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750268483;
	cv=none; b=ceGCX+pFq/1j/17AN5bJpyBzCeNpJbfqQ28Rb2tNtNYJ4doJDBPQbLsEDtmBEcktjRahihjlMgn/3FsUTAcyYIjFaxogExO7PTYy0uPY89ELAxQnXHt+1i38jdEoBIYaitrHuwMZ92dFxule0AhzyG0056QyVINdMrN7ED/wxjmW7f2o7RLsgCeprDdUO55j/9Q82SkDDsodGFkx3xs9xeTJ43GKedPwtgm6ke84zqjjHMwla2kcBZHtt3cRYsZ90NHpPvLNapMleRsOq5Cjec9g2iySoduiwtCephb+9K2lUk4duK3aTc37frpD0dojQkkGjMKD3LzqpOXrrl6/JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750268483; c=relaxed/relaxed;
	bh=HKAYn5W/PSf7oEyDpSl452LRf2zvea6hrq0MdbpucUo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=bmrHY115y1coVf3V0IaKZQuxZFHrD9gZTINzkbQTDQ4NKl2XUbvLRZel+Q3t/1boMUXRZua0ab9+7UM5mOI8NFUGEl248elIdsSOE2on1fnuJIAa58D9Ey2RsNh7ikbqfxOG5brBRZDPxGlxSTQqcrNqTwTMWmW5Q6+ExDCyQrt23k73RmKqY3F6WVfs5p7OY+VsdIL5fu2EAOBD+1w8I8eK1z8aJdr2y5wBzVYAE9hd7QWe3yBL44AmRVI6TqW8bkgRp/POYayr18zvoB7gTyGtmNZ6CWOE4bNQyavdx/645iD10ilLWEzEVFJgiOj7+4S4xDAZ2XB/NTI9XLNBgw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eF5O9bf9; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eF5O9bf9; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eF5O9bf9;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eF5O9bf9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bMrdG4Bgjz30DP
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Jun 2025 03:41:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750268479;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HKAYn5W/PSf7oEyDpSl452LRf2zvea6hrq0MdbpucUo=;
	b=eF5O9bf97oMdEz6oad2soFM587eQVLjsrSTw0hc0TxWKIW8f6Qte7OnP1YMP45RpS+hxQs
	nEdKLKpT6Z7tFuEIRBlEwWABr2GaM3B5LXdbDD5c7dvrzYZIEReHWzQzVc9pA0OB5TW++J
	ImWG7NKHvo8AFom1JsbST+Sxxb9BVKE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750268479;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HKAYn5W/PSf7oEyDpSl452LRf2zvea6hrq0MdbpucUo=;
	b=eF5O9bf97oMdEz6oad2soFM587eQVLjsrSTw0hc0TxWKIW8f6Qte7OnP1YMP45RpS+hxQs
	nEdKLKpT6Z7tFuEIRBlEwWABr2GaM3B5LXdbDD5c7dvrzYZIEReHWzQzVc9pA0OB5TW++J
	ImWG7NKHvo8AFom1JsbST+Sxxb9BVKE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-558-67kVayhoM3u9_2YgSyhpUw-1; Wed, 18 Jun 2025 13:41:18 -0400
X-MC-Unique: 67kVayhoM3u9_2YgSyhpUw-1
X-Mimecast-MFC-AGG-ID: 67kVayhoM3u9_2YgSyhpUw_1750268477
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-451d3f03b74so45256655e9.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jun 2025 10:41:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750268477; x=1750873277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HKAYn5W/PSf7oEyDpSl452LRf2zvea6hrq0MdbpucUo=;
        b=DfDqvnAAJnpuK8Q843hhjQ2Mj2d6QZKwnKbkGtmj1gW6QLvSgzLYDjkOWAEgkbScG5
         He4V+XlraBFhZKnIS9yJEHU2RbxITN9QIiHuGsmen+Lz+xijoU8XEuMP33e3BwkQzwuo
         8tK+HGXFMocfT8aBzfDg3ag7ZRFVI04n/UNsBrwyYX/9osbWltH5bRi1FtHJm9Nbgun9
         q2bpmuCPjljeyAL9q9OMP1UX1CwiTZvvINYb4LhJOOGTlJs7qfV+Wasu5TeRTT2l5TPP
         Mrygo09v/PbpNsDtYqyCo7GA/58M9FF+lRlSL0/2L2e7p1o1ES7ZfkBT+dBtYuioFAsd
         HKig==
X-Forwarded-Encrypted: i=1; AJvYcCU3Ea9QgvMRYYALh46ircKBI0w8dYAJOKq8EJTy5SyE9hWaP0WexAJC0Hce0bDB/cgpFoilPVqghNZAkkU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwbjDeCBEh/17gz/J9hzkFKlDPF/gyMcLBaZ5PrKFYqnGYBI/Pv
	x/xoIYFYP/kmYCDaXM8bX/89XepWCtYAsoTEqQH0w2RRcNi9FK5IdyrF8yPlHerAUl+fpLzS9ky
	wiVCPlVs9gIPIiSPz5RYv1oJ7lucfgVpIU7u8F7ufg1Qb7OKqhQNcPTu7Z/BTsjuQxiI=
X-Gm-Gg: ASbGnctropQcNI4l64kkPabj5UHfQXYaDQOiLHdulOw6m7GT4yl5KEZmVgAtmYmcjNc
	J4WEJN/UphHwXkKpYyMVTp3RhhT9EeWRoJEB0OBblC3Q29P70LZSu0l/YJSwCsxyRVFlniN3f1r
	zDR3mMuvb5EADEZD6EvVgODD3nlNlz43S7Kn8r1sa1DDbUs87Inmj3tD4Y4XcK4/7i02mykZLK+
	7gSdOrgc+VcmwwGxSTiK6KFncUmxPXs2S2kPQJoH2Ijvhpm37za85G+r+r/BeR+ByltAGKmSuTa
	Y/epF8FvC/lH/hIO6ClmJclO2hL1LfFyKM+HTYi+Z4Gg98EOhVHTLqXmhuG9JCk3C69LROAi3v2
	qCu2J2g==
X-Received: by 2002:a05:600c:1c14:b0:43c:fceb:91a with SMTP id 5b1f17b1804b1-453430ececamr157094355e9.11.1750268477153;
        Wed, 18 Jun 2025 10:41:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IENrfq9JZf2w4nH2VRe3EOokVKel4Rw1khN0dggc1dWhdYjdSzsol44AwGmQNvJE5b04zR6vw==
X-Received: by 2002:a05:600c:1c14:b0:43c:fceb:91a with SMTP id 5b1f17b1804b1-453430ececamr157093925e9.11.1750268476711;
        Wed, 18 Jun 2025 10:41:16 -0700 (PDT)
Received: from localhost (p200300d82f2d2400405203b5fff94ed0.dip0.t-ipconnect.de. [2003:d8:2f2d:2400:4052:3b5:fff9:4ed0])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a568b087a9sm17793395f8f.55.2025.06.18.10.41.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 10:41:16 -0700 (PDT)
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
Subject: [PATCH RFC 22/29] mm/page-flags: rename PAGE_MAPPING_MOVABLE to PAGE_MAPPING_ANON_KSM
Date: Wed, 18 Jun 2025 19:40:05 +0200
Message-ID: <20250618174014.1168640-23-david@redhat.com>
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
X-Mimecast-MFC-PROC-ID: Fikdm9qcObVe2Y_cqGp15Nn8HqqyNF8ql8sO87WGQXE_1750268477
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

KSM is the only remaining user, let's rename the flag. While at it,
adjust to remaining page -> folio in the doc.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/page-flags.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index aa48b05536bca..abed972e902e1 100644
--- a/include/linux/page-flags.h
+++ b/include/linux/page-flags.h
@@ -697,10 +697,10 @@ PAGEFLAG_FALSE(VmemmapSelfHosted, vmemmap_self_hosted)
  * folio->mapping points to its anon_vma, not to a struct address_space;
  * with the PAGE_MAPPING_ANON bit set to distinguish it.  See rmap.h.
  *
- * On an anonymous page in a VM_MERGEABLE area, if CONFIG_KSM is enabled,
- * the PAGE_MAPPING_MOVABLE bit may be set along with the PAGE_MAPPING_ANON
+ * On an anonymous folio in a VM_MERGEABLE area, if CONFIG_KSM is enabled,
+ * the PAGE_MAPPING_ANON_KSM bit may be set along with the PAGE_MAPPING_ANON
  * bit; and then folio->mapping points, not to an anon_vma, but to a private
- * structure which KSM associates with that merged page.  See ksm.h.
+ * structure which KSM associates with that merged folio.  See ksm.h.
  *
  * Please note that, confusingly, "folio_mapping" refers to the inode
  * address_space which maps the folio from disk; whereas "folio_mapped"
@@ -714,9 +714,9 @@ PAGEFLAG_FALSE(VmemmapSelfHosted, vmemmap_self_hosted)
  * See mm/slab.h.
  */
 #define PAGE_MAPPING_ANON	0x1
-#define PAGE_MAPPING_MOVABLE	0x2
-#define PAGE_MAPPING_KSM	(PAGE_MAPPING_ANON | PAGE_MAPPING_MOVABLE)
-#define PAGE_MAPPING_FLAGS	(PAGE_MAPPING_ANON | PAGE_MAPPING_MOVABLE)
+#define PAGE_MAPPING_ANON_KSM	0x2
+#define PAGE_MAPPING_KSM	(PAGE_MAPPING_ANON | PAGE_MAPPING_ANON_KSM)
+#define PAGE_MAPPING_FLAGS	(PAGE_MAPPING_ANON | PAGE_MAPPING_ANON_KSM)
 
 static __always_inline bool folio_mapping_flags(const struct folio *folio)
 {
-- 
2.49.0


