Return-Path: <linuxppc-dev+bounces-10104-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BED81AF9024
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Jul 2025 12:27:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bYVCz6LKCz3bp7;
	Fri,  4 Jul 2025 20:26:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751624783;
	cv=none; b=OLj8DbYApl6xrUOcPD5Lf9Z0WdIKG9a+k2QX67WE+v7VQlRAZDOJoQqTRFRNfJpJHuWV+aDDmv1aUoQnOtzZ4Q0utVO2dK+yp7iFAdUJCm2Ds+dkXyFLmgXDWkFd22k5psYmn6twoo3S81+LDDQKtPQ+w58c/7GA7mi3d0FMGSeOdKKyKUd92rGDem+hbCPuoXOVC5wXpcA4lwOFexj+avrcAsF0WFWtR7AUH3KSZzI25cUT9m6hxUR8pqMNd7Q21sP9bqKUbnLCTSjfLw2SXz6IBFPcKcF9h6mpkqWs6ucEPB6m+FyS7IbUhiD2PctJvZAeTPyNrcEAhPKzkiSaKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751624783; c=relaxed/relaxed;
	bh=cJheLoKLsD44QkJTGnHlicWVVgB1MKf4t1jgEN3k6qA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=M6c0NUniyxbv5vGX3Gtsz+c9RMcFarcuP50Atd2Uw5de2QvDzyphq+uZ5sFnxaWhxseEjnj8FRH56avwy9EWHAUbNiV6/LnnUMVm/CCHXfV3GLaarty2GYsU6jDloGC4E21XeirEMNAWwWirZDNo2txl8vvnwdy572wV/hKxcMwYf723q8LvMH0dygUV5trAEtVOtN9abUoVoy85Oyv8855MpAV/p1H71pshBjNLbwR6ou0kimRhWO1pAG5RNGju6aAei9IhR4dADius/KKX2hr2xay9PjNid9S5EANB+oiCbB5/iV3fz7Va/ujywZZfzDkg9x6TlEarppNdKkZIZA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=U0CECM+x; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=U0CECM+x; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=U0CECM+x;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=U0CECM+x;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bYVCz0VkBz30Vq
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Jul 2025 20:26:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751624780;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cJheLoKLsD44QkJTGnHlicWVVgB1MKf4t1jgEN3k6qA=;
	b=U0CECM+xQ1ctnVdC2OEErdoLeu7dP7/ZhWqDPJ7FNxqYWcFy/Ga+hfkhEhPITp7845AhEH
	t5nsD5YbQY6mchppdWP1ysHIswYNGjpoHZVEi0DSJ2wWL9NMEjEoArkG95f6zXbJB1lnsE
	tJDbKlBi0pD+Z374/9BJ7y+/IJr0C5A=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751624780;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cJheLoKLsD44QkJTGnHlicWVVgB1MKf4t1jgEN3k6qA=;
	b=U0CECM+xQ1ctnVdC2OEErdoLeu7dP7/ZhWqDPJ7FNxqYWcFy/Ga+hfkhEhPITp7845AhEH
	t5nsD5YbQY6mchppdWP1ysHIswYNGjpoHZVEi0DSJ2wWL9NMEjEoArkG95f6zXbJB1lnsE
	tJDbKlBi0pD+Z374/9BJ7y+/IJr0C5A=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-380-iI1yEmL-Pm6JNOld3T8T2A-1; Fri, 04 Jul 2025 06:26:19 -0400
X-MC-Unique: iI1yEmL-Pm6JNOld3T8T2A-1
X-Mimecast-MFC-AGG-ID: iI1yEmL-Pm6JNOld3T8T2A_1751624778
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a4f858bc5eso538132f8f.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 04 Jul 2025 03:26:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751624778; x=1752229578;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cJheLoKLsD44QkJTGnHlicWVVgB1MKf4t1jgEN3k6qA=;
        b=dxrUHOv6GQuV3HCRJPyuVGd29oksngZt1HnyixHT2naONsyvOOEkUSwnMJR5RFbcfa
         RXeg4xnW3pyqG3SUcYaB1ijpZJsXgOgg2beLQWFehPGJQAu7JFCBlKiuzu4BCpRqZoG2
         sXijIEcT3hYQbYm3CI271PVuhh8qrjVtggfqb5RFW5CbnaRTjCH26ClVabFsu0Mq05P8
         ihy8AuNDuBaq50qPECn1xJveXE5kwoMoahEqa6f+6xjNjTiZ6EEODa540d1T6cKj99m3
         A4/ZiWmEuYl2/DhH6jg17eOyaX2zWF5xeeeXsJmCMgX7MCS8mTbOK5DU27yhUZ2bMXLf
         sP9A==
X-Forwarded-Encrypted: i=1; AJvYcCXxkUMh5QaF1aPmhqsLvIxFRHSza5VgSFUmu4SoquUEjpRP806SQ1/AFtyijCed9Kxfm8PSROZKoPmXJyg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw1GMs14SsXrxaJdzmNuWJPAq70VKWc6IWcjTWNOStQ3+y+Mi+7
	KGJZrQ6q1HaGqBXvy+q6yPSkgd58bch0q+8FggoMn4t0+J76rPtIPGs9YLPmILg3KCHT80xHIdk
	kCNrVS9GZFidLe1rwz4toI3BFD8ZarD9hjcVYH7HD10cAFSEho48+B2Hd4Z3ePWciI7P+gdV/Ef
	U=
X-Gm-Gg: ASbGncs4bqIn8W0Ian8SkEcvFZaV8+EeZdRJ3PlxdNvR6K74MDjFrVvS8FGUN5Cdp7+
	dyXy9Whj4VP40y2K8ySz1NiTULnWLwB38B5kEcAHI6p+OQE438ZqTjuKmWKirozkLaOdyOwyk9y
	O25Y5YcgTuORhK8RbAaP048ES8k9fjWbie05x/76bgwEo0/Is50a7LvYQWJ0U3ZChQURI3mSTi8
	FxWGxd/ghrxh+X8xE1/63HUbXG3a29HnErQuDgWHfXBcf+Oi58y9EC600xGWGxpUf1NbvUIsh8/
	4GEtxRaaj5yxd6e3hXQ4y8Ei1/Pu4YLlT2cUuVzVPSAOkL5xS/Knarf23PRN0Jhb6KD/MOWP/VI
	Cpceweg==
X-Received: by 2002:a05:6000:2f85:b0:3a5:57b7:cd7b with SMTP id ffacd0b85a97d-3b497019684mr1247064f8f.22.1751624777970;
        Fri, 04 Jul 2025 03:26:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFsIhm+puni7M70O9UOfmv7nAn160MUBp8IUwHGoHgLCi+2FqWLpmioUQXF2wdRtw6a1cigug==
X-Received: by 2002:a05:6000:2f85:b0:3a5:57b7:cd7b with SMTP id ffacd0b85a97d-3b497019684mr1247037f8f.22.1751624777474;
        Fri, 04 Jul 2025 03:26:17 -0700 (PDT)
Received: from localhost (p200300d82f2c5500098823f9faa07232.dip0.t-ipconnect.de. [2003:d8:2f2c:5500:988:23f9:faa0:7232])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-454a9969a8bsm51842365e9.2.2025.07.04.03.26.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 03:26:16 -0700 (PDT)
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
Subject: [PATCH v2 17/29] mm/page_isolation: drop __folio_test_movable() check for large folios
Date: Fri,  4 Jul 2025 12:25:11 +0200
Message-ID: <20250704102524.326966-18-david@redhat.com>
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
X-Mimecast-MFC-PROC-ID: slWX9gn9vUFIf1f3rgR2AeMZEPCPd4V9Nb92aVuI4bc_1751624778
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Currently, we only support migration of individual movable_ops pages, so
we can not run into that.

Reviewed-by: Zi Yan <ziy@nvidia.com>
Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Reviewed-by: Harry Yoo <harry.yoo@oracle.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/page_isolation.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/page_isolation.c b/mm/page_isolation.c
index b97b965b3ed01..f72b6cd38b958 100644
--- a/mm/page_isolation.c
+++ b/mm/page_isolation.c
@@ -92,7 +92,7 @@ static struct page *has_unmovable_pages(unsigned long start_pfn, unsigned long e
 				h = size_to_hstate(folio_size(folio));
 				if (h && !hugepage_migration_supported(h))
 					return page;
-			} else if (!folio_test_lru(folio) && !__folio_test_movable(folio)) {
+			} else if (!folio_test_lru(folio)) {
 				return page;
 			}
 
-- 
2.49.0


