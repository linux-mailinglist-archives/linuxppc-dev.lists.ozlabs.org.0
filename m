Return-Path: <linuxppc-dev+bounces-9892-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8D2AEDDE6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Jun 2025 15:02:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bW5r34XmHz30W9;
	Mon, 30 Jun 2025 23:00:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751288451;
	cv=none; b=NxKNFkVurDPz67USDyA7CHMK9aAaj/Pdur7A5v8/3XAM7EDSQGNZ/HKZ4uawq20YupukhUggaO1Z19Cc81CEQ9ENGA4WFmpdptnQmXzR/4+80znOvtOtcWqMQ6DoJnMf3pE2yD0RWU4ozHVcRFjnWBep3VUZbL7hcrDVUu2wzzVEsLDsgjQjsXzEGtC/hW8xu7jQ07yjZBMB5bc0WNjiolGTIRXUd23kkm183kRbcdKPNk+k6Oz5ntvcbs2Cq2IWDkA5rUk30Qgdr+E+EADa8XbLQiTli8/cvSp5BB8BID+dTwqDZxFf5IPeWidSGbFhMi/pvPthB0vQdMd3NY5ffg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751288451; c=relaxed/relaxed;
	bh=AOWsWuhFUlcALOXMJY1BPVzymTvYGz+UAPJ/r3JMpJ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=NTbO55dExwtNVmj5HrlBl6U/zX2jSV7hJkbyqzjahLh0UwulV22Ek+00Ji3JivQi203zll1eVHR5uqT3nFhjNHDytBaJc5f3faMecBEq8QPQyPp1C3Toha2USgEAkiFbcOPGwWcLb098dCQqHJex7CYJp8CeGSQ2bg0s9Uml7knFxq0MxFSwurRrWv9mh/aUtic8uWJpza4NyAbsSP+iRhhPgfUxzXijcK6iDPNlnSq6VwSfA20EMoyeyRjNOwaUOW86OGmmsXXkCVrui+lFyTE3oO6YFPsryaMat5ES7SliRcvDJMv7kztVpfOSYpv9gkgaCIGdoI6R3rb5U9UCsg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bXb/Vsde; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bXb/Vsde; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bXb/Vsde;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bXb/Vsde;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bW5r269TKz30W5
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Jun 2025 23:00:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751288446;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AOWsWuhFUlcALOXMJY1BPVzymTvYGz+UAPJ/r3JMpJ4=;
	b=bXb/VsdeT4K2t7M3zKecQfMS4y1aBXPzvmhr0iruAWdEfymcU7QCj2SW6dPHJm5M1VDUPP
	kZn4yGgqRsbs9ZH2cnfs6uF0VoplPXfvmE3atjsIGfCYL+DISE3E+YlktRMEbmrT0pTG1O
	bHsSf40c/CvB6U/VRejKF/9GyhYX5cE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751288446;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AOWsWuhFUlcALOXMJY1BPVzymTvYGz+UAPJ/r3JMpJ4=;
	b=bXb/VsdeT4K2t7M3zKecQfMS4y1aBXPzvmhr0iruAWdEfymcU7QCj2SW6dPHJm5M1VDUPP
	kZn4yGgqRsbs9ZH2cnfs6uF0VoplPXfvmE3atjsIGfCYL+DISE3E+YlktRMEbmrT0pTG1O
	bHsSf40c/CvB6U/VRejKF/9GyhYX5cE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-662-hjNhvEttP7eNU4AbguhnmA-1; Mon, 30 Jun 2025 09:00:44 -0400
X-MC-Unique: hjNhvEttP7eNU4AbguhnmA-1
X-Mimecast-MFC-AGG-ID: hjNhvEttP7eNU4AbguhnmA_1751288443
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a4e9252ba0so1385283f8f.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Jun 2025 06:00:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751288443; x=1751893243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AOWsWuhFUlcALOXMJY1BPVzymTvYGz+UAPJ/r3JMpJ4=;
        b=SPShIbDxb9C+wVailkxz+VXK0HBXESYz3H8g0Th5zcCdyfs9E3wMLD0gMNXmZ2vp79
         BSf0QbzNoIFAwbl/bHkPxCXnMdiWdEM0hzai5rUhaVxhx2wMKPE3R/eZpcN0wYTtlhRn
         y2jXlzSRJZl5NDeLZzyLhD4ywzB3SXsG8gbMP/VVs6NWmFIo7G2SHar8xxkrc527cDBF
         7RNKQXR5GBDiCDph0TDt96m6oR5IzHeqXKMOvWYnVVwjJGENouRtpjs8xyNc79TgKgEz
         6P0gJicTo6OaVElyCvjkSlMoaBFSS59TBmFzquzKvlVEjMiYVl/cHarxL565/ieD+zAM
         SBMw==
X-Forwarded-Encrypted: i=1; AJvYcCUBS9k90FWfzNX6ZYtdSkwJSSbrFw9S/f6YwrTBceZO7p9krUHnzI5yEwYJy0E4n5QIh4IJm20enDODQpI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yye/M7KPYuZ6eke8qOXfyWaWJJJ8kBcRP5Ofdus/WwUGcaPZSr8
	Dvb5Wm4DqgzCG4sAYM2UtrK2uk1tJgjfo3t1OVAhFhlkU3UQoJbcWNvxhEZpwvpnfjya7xkJZxb
	sk2kic5WsCziDuILfoSKAFQkSe9YyiN31amltU9gcgT4TMRxB+EEE/stfkujkT8rWzcE9J8rC1B
	gLiA==
X-Gm-Gg: ASbGncvZutkhhCx3T0XnYl6xrLcHG8pt84F9SSejVnOjpo6st7Cb2+d+DPNbc07fDop
	ZQYQRmck4uSJ741moOisfKuhFvQEZBtiJsO6IO7P3quzITadyHBDdbvfM6ljGJGdQUYNnySYQrW
	vpmpVeADBEZV5G8u7WlDEzsWsW5wZ48zOS5Kyo2/Uxh+635TdVpH2kQzIfHyzsAZyZlo6BM07zH
	6we3Ch7czNc5RbYaM/WKNXXcNE6eqWRuISsJs3iTquqpbhFSCcMbiWkYuFdUS+m6m2KF4laWJG2
	whb0k4wX6X2cg/E8DfGEejvQlbUeO/6mrGW+60UhgOVP9tNdvgJ6A3oUuXwWOwFsqChoK37mCf9
	VR++hMms=
X-Received: by 2002:a05:6000:2b03:b0:3a4:e6c6:b8bf with SMTP id ffacd0b85a97d-3a8ffeb382fmr7766092f8f.52.1751288443185;
        Mon, 30 Jun 2025 06:00:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGx8UWJltFtDizxyihu6cXjhn3Ci52lQuk8tR1EGhsL0o4Tf/9IaaIN7lF9qzEV9dDz+LNV9w==
X-Received: by 2002:a05:6000:2b03:b0:3a4:e6c6:b8bf with SMTP id ffacd0b85a97d-3a8ffeb382fmr7766023f8f.52.1751288442367;
        Mon, 30 Jun 2025 06:00:42 -0700 (PDT)
Received: from localhost (p200300d82f40b30053f7d260aff47256.dip0.t-ipconnect.de. [2003:d8:2f40:b300:53f7:d260:aff4:7256])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4538a406489sm136745865e9.27.2025.06.30.06.00.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 06:00:41 -0700 (PDT)
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
Subject: [PATCH v1 10/29] mm/migrate: remove folio_test_movable() and folio_movable_ops()
Date: Mon, 30 Jun 2025 14:59:51 +0200
Message-ID: <20250630130011.330477-11-david@redhat.com>
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
X-Mimecast-MFC-PROC-ID: cPY3EKV6SpZTA4EBmICsWXCrKGE4el9VNUuNvqrYzSY_1751288443
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Folios will have nothing to do with movable_ops page migration. These
functions are now unused, so let's remove them.

Reviewed-by: Zi Yan <ziy@nvidia.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/migrate.h | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/include/linux/migrate.h b/include/linux/migrate.h
index c0ec7422837bd..c99a00d4ca27d 100644
--- a/include/linux/migrate.h
+++ b/include/linux/migrate.h
@@ -118,20 +118,6 @@ static inline void __ClearPageMovable(struct page *page)
 }
 #endif
 
-static inline bool folio_test_movable(struct folio *folio)
-{
-	return PageMovable(&folio->page);
-}
-
-static inline
-const struct movable_operations *folio_movable_ops(struct folio *folio)
-{
-	VM_BUG_ON(!__folio_test_movable(folio));
-
-	return (const struct movable_operations *)
-		((unsigned long)folio->mapping - PAGE_MAPPING_MOVABLE);
-}
-
 static inline
 const struct movable_operations *page_movable_ops(struct page *page)
 {
-- 
2.49.0


