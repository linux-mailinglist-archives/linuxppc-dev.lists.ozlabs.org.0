Return-Path: <linuxppc-dev+bounces-10110-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE20AF9037
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Jul 2025 12:28:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bYVDJ3XHXz30V7;
	Fri,  4 Jul 2025 20:26:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751624800;
	cv=none; b=cZP/lmrbu0eeYoz/0z361tea2l1YjWDFAq5ormmZKlI0iIjeCze/nyqqLX9jHERJx/ihquhUqKoPqm4LVzFeSQ0rPWFTpjmZYV+wD8J0SsPgI5Eu903AyNvKulIPVYOzqO/kONwwp9jEp4Saoso6jrOsaRV+EF+1MsLPr3VoQTFTGwPqCzOsK4RsvzmC9wphkUNPPW8vOKa/oTG7MhxU1+JSSHnob2mHBdMXfDR6N/rqzW+63MnXQAz5qSpKyH3PbHzfOPEaOyufjiRWTfjEN2bCeodULDYBiNXKSd6gu1v/4qbz2jrmcUwTjk+cvIOElQOnNd5OdjB6AsJEorUdhA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751624800; c=relaxed/relaxed;
	bh=fs/e8+Swpq2YGTbmX8ig9Uwxi9FIgSmYum8BwX+79CI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=XIhskwjVFVSy4QGoUp4NEJWx8VF+vmSU27hKyP7gq3KOa1TpIXyAUmhl0+ebGz2/G5EB43lojG6ie84ljXnMMYIllqbTFVc3YXAgY3xYyXdaRgXs+YXNE9V1a+W6gcEm7qrJFYbF35dPojfcWXnZqjqG8gUa9hmMZqET0M3OBGb/rDj5PG0ff/XpPSIDkWLec0wR8q6do52E0cRCD7lKQqIidHx6EmoHzjkWQlONT0dPDyCSLvMgaEK83157xq4LkzDeCPP7u2zGIIfxB747dvLfqdtXKbAjnO2Yme0J1UwBwepPu8R94kGmD6YG/XI7NfsfiFix5pAOhQ17/psqjA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KIrrLsaf; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KIrrLsaf; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KIrrLsaf;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KIrrLsaf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bYVDH4k8Xz30T8
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Jul 2025 20:26:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751624796;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fs/e8+Swpq2YGTbmX8ig9Uwxi9FIgSmYum8BwX+79CI=;
	b=KIrrLsafLWEwinb8QBfjpPgA+xsBw/D9IFq/oi+AwHs+dvAY3T4vibKWeoXXMFLpRm01As
	N7qy+9iPfk7RIoxP0W16eo1345RKrbxMBb95/ZsayCTuyEwEucrp35DDRTELlketcL71Ri
	MgU4MPOcUQ5P6Qj9bRsMlCVY8R4PUyc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751624796;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fs/e8+Swpq2YGTbmX8ig9Uwxi9FIgSmYum8BwX+79CI=;
	b=KIrrLsafLWEwinb8QBfjpPgA+xsBw/D9IFq/oi+AwHs+dvAY3T4vibKWeoXXMFLpRm01As
	N7qy+9iPfk7RIoxP0W16eo1345RKrbxMBb95/ZsayCTuyEwEucrp35DDRTELlketcL71Ri
	MgU4MPOcUQ5P6Qj9bRsMlCVY8R4PUyc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-510-baNih4vsM7arI4mHkY1Nlw-1; Fri, 04 Jul 2025 06:26:35 -0400
X-MC-Unique: baNih4vsM7arI4mHkY1Nlw-1
X-Mimecast-MFC-AGG-ID: baNih4vsM7arI4mHkY1Nlw_1751624794
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a4f858bc5eso538308f8f.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 04 Jul 2025 03:26:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751624794; x=1752229594;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fs/e8+Swpq2YGTbmX8ig9Uwxi9FIgSmYum8BwX+79CI=;
        b=uI/on39XezrAFKUYV0c9clOlNEBvlBA2zratyQ7Ua9bBsZ9xE8CwN07kGLMRpzcY8k
         C3rd6xQQTtQUUo0MrxmgifyPSVdhWCtLTsF2CcwIjG1Ya9kHid+zEXt/u3fkObwM3g7M
         qLhBJItEbuwRZJbkBxwd/torZLMK7tQW5r99nV3etH8+C1WFUMddrdLtKV7YC3+JY6Ik
         2JOD9mZyGs2in3rOQJ46BQ/ltN/qw/6iSlkjaJxnuapwBBgLc01NQkvEQdXfksf1nS4t
         LJtmbCR+dt+n071idMQyb4rCpWi5uCqsmTjl2dJ2eKRtViZJHexrEcti+YFYBndRBbBQ
         J5IA==
X-Forwarded-Encrypted: i=1; AJvYcCXA2vhsZgXQI6rmOVdXXCxwgYqWw5csRSb8dUgLq+x/X3afSfv6edQY6PSwgDJNJLS1gUyfwiDG6ibxYuM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyH4ddDZScSfZKTIoT+Mvpb6DPNEpuJh91VGKfcd2S2fRSFwyo9
	eq1o5TyfEeL+f3Bwb2agQ/R9aJ9S3KyResnZeRAjif2v+FrQqIMde1ZstZRL6l9NpBP5C8wICa1
	/zpaMYvexWSlC+8WEpdGKh63RVsvCsC176Nk0TtEX31kpeb02U9iErhgCFCyrc9j+zTg=
X-Gm-Gg: ASbGncsIFL99d6K9fkvd7gHKxqHiC5q3teWf/yen5I/Ia7dKttNXbDQa5IX1fhBTu64
	uy3Yohp2K5HjttTWOFGtnD6vMiezK2azqhxb8IRWeZDn1iwdUX44XJA4xoyR8pZH74hKByCDWU6
	dJgSIVtUPU/bD1hOmYmjdjoaFXjXg/7LtH//Rr4xinKmRzMvIBxqgHayQrQ5BEtP3WB0oB4v7Vg
	YaGP+p/bs4VYTcsZOfHiO2QamsnT0xtGZbpRKMeV18c+oGrHjWrNVeNScSFKxZZRp4WKyywLo3R
	WJUKDfzDXGR5DblUBFfWMYP+TTQSgckEmki0xnUAzZrSM/lDc4aQqRPoJBC0OTbLpb4t/yhw5Uf
	yysXPJQ==
X-Received: by 2002:a05:6000:24c9:b0:3a4:e667:922e with SMTP id ffacd0b85a97d-3b49700c540mr1015642f8f.4.1751624794050;
        Fri, 04 Jul 2025 03:26:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFv4//fTRSt2GT11U1TkRjsS9jXLC3kcU+xe7g60I+SsSxP4GVJGQoWX7WuUGQypypw/2H7pw==
X-Received: by 2002:a05:6000:24c9:b0:3a4:e667:922e with SMTP id ffacd0b85a97d-3b49700c540mr1015567f8f.4.1751624793449;
        Fri, 04 Jul 2025 03:26:33 -0700 (PDT)
Received: from localhost (p200300d82f2c5500098823f9faa07232.dip0.t-ipconnect.de. [2003:d8:2f2c:5500:988:23f9:faa0:7232])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b47285c6c9sm2093397f8f.89.2025.07.04.03.26.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 03:26:32 -0700 (PDT)
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
Subject: [PATCH v2 23/29] mm/page-alloc: remove PageMappingFlags()
Date: Fri,  4 Jul 2025 12:25:17 +0200
Message-ID: <20250704102524.326966-24-david@redhat.com>
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
X-Mimecast-MFC-PROC-ID: JUjViFlSliKoGEGgKUMIh5TPgujCf1b_UwghfqWZ9So_1751624794
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

As PageMappingFlags() now only indicates anon (incl. KSM) folios, we can
now simply check for PageAnon() and remove PageMappingFlags().

... and while at it, use the folio instead and operate on
folio->mapping.

Reviewed-by: Zi Yan <ziy@nvidia.com>
Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Reviewed-by: Harry Yoo <harry.yoo@oracle.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/page-flags.h | 5 -----
 mm/page_alloc.c            | 7 +++----
 2 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index 094c8605a879e..fc159fa945351 100644
--- a/include/linux/page-flags.h
+++ b/include/linux/page-flags.h
@@ -723,11 +723,6 @@ static __always_inline bool folio_mapping_flags(const struct folio *folio)
 	return ((unsigned long)folio->mapping & PAGE_MAPPING_FLAGS) != 0;
 }
 
-static __always_inline bool PageMappingFlags(const struct page *page)
-{
-	return ((unsigned long)page->mapping & PAGE_MAPPING_FLAGS) != 0;
-}
-
 static __always_inline bool folio_test_anon(const struct folio *folio)
 {
 	return ((unsigned long)folio->mapping & PAGE_MAPPING_ANON) != 0;
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 4aefeb2ae927f..78ddf1d43c6c1 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -1375,10 +1375,9 @@ __always_inline bool free_pages_prepare(struct page *page,
 			(page + i)->flags &= ~PAGE_FLAGS_CHECK_AT_PREP;
 		}
 	}
-	if (PageMappingFlags(page)) {
-		if (PageAnon(page))
-			mod_mthp_stat(order, MTHP_STAT_NR_ANON, -1);
-		page->mapping = NULL;
+	if (folio_test_anon(folio)) {
+		mod_mthp_stat(order, MTHP_STAT_NR_ANON, -1);
+		folio->mapping = NULL;
 	}
 	if (unlikely(page_has_type(page)))
 		/* Reset the page_type (which overlays _mapcount) */
-- 
2.49.0


