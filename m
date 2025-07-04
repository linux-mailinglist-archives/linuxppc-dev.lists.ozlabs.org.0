Return-Path: <linuxppc-dev+bounces-10112-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B826AF903E
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Jul 2025 12:28:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bYVDQ6Qvsz30VF;
	Fri,  4 Jul 2025 20:26:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751624806;
	cv=none; b=IrFktRF8lo2W3SGiyCoCr+IzJktxL1+g+Jh055J/S+xahgj2DbJnjEd00l/5aR+UXGG89G6DyesAOzMqz3cfBurNm4FBNmuLzl6860B8sj63K7wumqi+at69lNVJHBjEkYU0JUM2QhbnGKM0iXe8Uu52vhoVspdEYw7/k6l/fXhKPT1cuFa5AJrr7XEyjgP4idX/dblRIjupTPMgKHR62fXHSU2Rs2IKf/yHAnhwNa5IW21Ye3VryjrP3cYojl4kz8KzkJzRLghaPycYT65dt3VSdQG6hNMOAsudCMtmaqk9p+IEPxRfOusu3qYFCkq6hUGKLl4h0+FI6uDOU4Lfug==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751624806; c=relaxed/relaxed;
	bh=PJaNSOUY9l76maSUsyNVNOCD+/VPGSxzGfUbWAq4maw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=BHQBKpjtn1s1Sgyjmb2oLFA8J1RQhmkghU0Ma8LTGhyQBzVakmtPUh2Bve7TDDR+3WCvZYuZ2WuBoupcKw10ycERxso5J3lh5orZZUodULeoM7Khl/pRfBHRILpAvKVe4C6tMlCfRjY26U97eJfvzc10nvg5w6T9ajVakEbOgWEbS4XY+G1vIWcOi57n0QLmuPVqzwZlisRUL6nQG0LYieeADHeb4l32UGl3Wf5W84CcJfpPNNkqGOHn5giQh3j890cAZ89Y0QXsAsO5W75PSc1L4dRcnti5aSpVCusWgmcMjYYYVV7evl+XTglEEgSLuFrsBN6pUKeHW8FeVflOOg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=StQkeTRE; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=StQkeTRE; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=StQkeTRE;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=StQkeTRE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bYVDQ0lx1z30T8
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Jul 2025 20:26:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751624803;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PJaNSOUY9l76maSUsyNVNOCD+/VPGSxzGfUbWAq4maw=;
	b=StQkeTRE3N4LEvla1d0EF/LCFIozRFvzVDmd8LBPrt6SXfOMLevRuRwFdWoXjTw04ergQE
	tglXSUiS3/O8Rv1fymZei3txDBsaYPvDSN2a0mu1+4HJmCfdMvAggzw/CTDxl3K31pIuZE
	Gu1lWbByDEkDxG+srwV6vzBW4J/WEds=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751624803;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PJaNSOUY9l76maSUsyNVNOCD+/VPGSxzGfUbWAq4maw=;
	b=StQkeTRE3N4LEvla1d0EF/LCFIozRFvzVDmd8LBPrt6SXfOMLevRuRwFdWoXjTw04ergQE
	tglXSUiS3/O8Rv1fymZei3txDBsaYPvDSN2a0mu1+4HJmCfdMvAggzw/CTDxl3K31pIuZE
	Gu1lWbByDEkDxG+srwV6vzBW4J/WEds=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-608-R3r9s5V6PUCUknm5JeYKkg-1; Fri, 04 Jul 2025 06:26:41 -0400
X-MC-Unique: R3r9s5V6PUCUknm5JeYKkg-1
X-Mimecast-MFC-AGG-ID: R3r9s5V6PUCUknm5JeYKkg_1751624800
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a50049f8eeso366528f8f.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 04 Jul 2025 03:26:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751624800; x=1752229600;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PJaNSOUY9l76maSUsyNVNOCD+/VPGSxzGfUbWAq4maw=;
        b=BXslY67LKS4V8Dl1rfiDG8WNCT/oTdwtHQwHhMCCrBWyIYadTJMTR0x//uEAb7+tsO
         NypiPBkev8RMZwGX+A/06vJc7vCVNm3722kniotPfAiL5uxSZodugFgvV562fnY2eGUB
         tVp4vKDkTnFXnyOlAGZPttzHZnJGlPXSh9a6DspbW7JWFwgPb2J65DhWIr+bueIi4plZ
         IhSf4xuWJkOuUFLH52GKIAuH0QSnoYzfMgdBvF+ou6fIwKonfz3+HIq7X5wo7lBS6J2e
         cbODFtE+bpu+ky3w+/+Jgoq2UnRXGohWKgg0Z8vfWfOpXxhVwG6CIQxh5z5/zHyblAQ9
         OWZw==
X-Forwarded-Encrypted: i=1; AJvYcCVUNkU195Pyenef/Hj+eZBJ3EbTs4MOMBzqbwOsEwOuOFo2QZ0KGvpxaec3Emhw2MDpExfqBn8shEp/HwY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyBNjlSNCZjpbFlmuSyBA7D9dSHThFxIE4wKTjdr4QnkdZo8rWr
	rh3fPwx53hE/xPMG/IFZlZb3QX2uaXvWqfyBfkVmJ17S/YuRk+ryBjX2iKY4AYceacMpAdCGrrP
	hZ8mpJxPDEEvWpVHhxpXKpijQWpkOTTauB+z6cl1TgKH9xc6LNXEfRaKXNK8UgUjSrWo=
X-Gm-Gg: ASbGnctEDxDg1dhFjNjeSvJFBt4j1Nnf3FkWX7w2Ju/UqbAVLAqEmcn4DNHA6ItHKj7
	pakINbpR4rvRGEcIiG5uiM/lCB1jGXbCsPCB2d3HChP0onEhERX5CLlcYc0MZFLiMJJzI2tGNXp
	uj04rq9lfy6bpUx0biDIdTIP+s+4zlb5iwMswdH8n1hMpAgFjhOCFKHdPp8PrHYTTHXhyKtOvZA
	30Qd490417kVPhnZ2D1U7Fj/YsGYi1ym4RdV+Z5r9Zgfm5W/oHv2LWebN7Mjee+sLyYi7G3+GoT
	Czcjuc0iDuiL02poLUf4SQ6eWv5hnJN2HNO8vJuZO5HFRTz0C1YVvCgH1ozHmwhC2PyFsC6JEnr
	Dmok7og==
X-Received: by 2002:a05:6000:24c1:b0:3a1:f564:cd9d with SMTP id ffacd0b85a97d-3b4964dbbcemr1548396f8f.36.1751624799714;
        Fri, 04 Jul 2025 03:26:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG//N9DaWJpqR05PkmLCvqepmh6sjEbIjzOMJ6H89vpgrAi3DitTSNnZ5FWKxlekTJwwx1oMQ==
X-Received: by 2002:a05:6000:24c1:b0:3a1:f564:cd9d with SMTP id ffacd0b85a97d-3b4964dbbcemr1548348f8f.36.1751624799228;
        Fri, 04 Jul 2025 03:26:39 -0700 (PDT)
Received: from localhost (p200300d82f2c5500098823f9faa07232.dip0.t-ipconnect.de. [2003:d8:2f2c:5500:988:23f9:faa0:7232])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-454b1628d6csm23008015e9.10.2025.07.04.03.26.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 03:26:38 -0700 (PDT)
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
Subject: [PATCH v2 25/29] mm: simplify folio_expected_ref_count()
Date: Fri,  4 Jul 2025 12:25:19 +0200
Message-ID: <20250704102524.326966-26-david@redhat.com>
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
X-Mimecast-MFC-PROC-ID: FDWSjRFcFWXHZkbX5n1G39D32N3shP8ZdAIQUYpYVUQ_1751624800
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
Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Reviewed-by: Harry Yoo <harry.yoo@oracle.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/mm.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index ef40f68c1183d..805108d7bbc31 100644
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


