Return-Path: <linuxppc-dev+bounces-9485-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AB6D4ADF478
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jun 2025 19:43:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bMrdc5tLTz3byt;
	Thu, 19 Jun 2025 03:41:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750268500;
	cv=none; b=WdMFo+XTP1cF1FGBMrpFw5YAEXzr1WHTrhrbFdqqi5nSaHqX3GwdvSWN6hlj3i0V1h4JWRl8OnEIsAWKmubFpIQquhWia1HLGMs+XgQwTWknpYuZTTo2Bp7+ik+ox5a3Wha+I9omkPjrOEgbsNdkJr7aOm4fhjJiqlW0ivWGHNA2J2le9rfJ/vSUhn3j8wWhSCxYTx2y2gqvZAMrlpInnWf1jKY3bBGZg9shhmYH5yVv9LuKCkc1ix4yFbF7Lx36zsOl9dKGfLYh41x3nlah1Pf4lNC+8Fb8lRaocEjJ4cI6MokLFMUncSEfLX4XpanyQOoC18QzEWJAJQ0HIHg+7w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750268500; c=relaxed/relaxed;
	bh=EpLhIwgxSmOTAUjcHZTQRVGXB1xFFa6Mgym/mVDU2pw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=kADwBvfgPp9LP3SOGcrQ7LiJ4iBz7UXLOm1Jgel6CFv+dSjI7Tu3/QLfpqvooCwFiBE6fr0/bQHJRHCsoCpZTHHr+xTRdHEASyGCVNIf9IDGnIbkTbE2D6bwXgF3kJGR+Ot1DgTgLhO+XHvqdwpd4Z1Oxm440BWeLPunIYR9FlbDS2nz6ue6+v+b08UUza18pcEjgqyrsRNSHA5R+KqeDFCYJHQ3qC3upwH4+twQOVk4nA0E7M7HiLwwKuhLsV97Yqj+p0HIedHzJIonTw9qAn1r9W/YlDcxm7Z8+ZMkQvCzD/UqdnHpQ/mQXQr+hDXQEBleL+rk6iMJ83ihIduGmw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cPvePKsI; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eR6DpzXv; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cPvePKsI;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eR6DpzXv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bMrdc07Xqz3bwp
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Jun 2025 03:41:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750268497;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EpLhIwgxSmOTAUjcHZTQRVGXB1xFFa6Mgym/mVDU2pw=;
	b=cPvePKsImC/l+QxVtqd9U3LAKQJdKo+8l3GyXEMPuR32LL2VP04qJXfJ75YedUBX3IuQHr
	rAkLZW2SgX1zPd13opku5zoNnlgLjJshKtN2D/hG+du9vx8EPrlg+g9si3yaBAOpg74Yqc
	kIrb+pXC02IRDKA8qLPgt82H7ZklJlw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750268498;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EpLhIwgxSmOTAUjcHZTQRVGXB1xFFa6Mgym/mVDU2pw=;
	b=eR6DpzXv8TIzk478iQ42sb1vvmFVCCVSutDohdknevHIVSk5dJAirPqzPhIr/R4zKFEQgw
	prjZQu69KsBLUzONyYnI18t2+yl27N5lHZfEaJv3NDMPjs0SMNz1/IWc4nwKJTbwMksWSb
	D4J/+5bdI+qy5RNcjjlpP8aXl7JFH1Q=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-635-JRZciMs2NpGCfTqaCWZS3g-1; Wed, 18 Jun 2025 13:41:34 -0400
X-MC-Unique: JRZciMs2NpGCfTqaCWZS3g-1
X-Mimecast-MFC-AGG-ID: JRZciMs2NpGCfTqaCWZS3g_1750268493
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a4f7ebfd00so3268664f8f.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jun 2025 10:41:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750268493; x=1750873293;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EpLhIwgxSmOTAUjcHZTQRVGXB1xFFa6Mgym/mVDU2pw=;
        b=FgNtJbz1OihPPdWptHC3UGF7Q2QfGjyB984+r2l+YWfm/2nR1ZApNjCFM7pGL9JEOk
         MsECZ5IR9s7rEIXljbHQCUk2GnoC+qpWtAEaW0dvqlL9rRnP13+LfQnM6UddJV/EnI0G
         bOfDqHql2JbT6m2+xNPoCoDGL7boyU4S4jbfrRNE3pG9UztFeg/hV/Jhq1CU0JmwpSPC
         CmDLQLh/CtMfKd1CIy7gCFlo7Z68H5/44NGu3/uqgCtODb53YqBnqB1ihLIGRIUZioen
         7TblRJa3/kHaTBsoRunbldGMWdBE2ULSx2cOAELOEHrIWOwOjVibxNwfLC7LqSQdKbA3
         mROw==
X-Forwarded-Encrypted: i=1; AJvYcCXB7MwXmlRCivxV0WECy6Z+OkU2ill5yLOo+YgBQ6wKkJfro546n77yayMu9xFNpz7V8Sf9HIXJj07eBT4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxFdyaXFTzqFvc/hKRXv81x2cELGmvTMfFNUuoW8s5JRZoGvQIt
	JVJTFjfNOnZBcqCx9e01okwDzUTas843tHDEFy4uyCsfK4bIUON6xCyX72ZEtSw+yoKslEUaWvM
	HLNWPVO1YBsdDqNFEq2175uNyuUCJE8eT573o5z1hmQRRB2l/lQXHGEFAVBeSLXy1ChQ=
X-Gm-Gg: ASbGncsO2+QLrOEMNbFaPPKRbaLXN50ZF0lCcygbddlz/iWmPBE+/c/DYz2BApmo/Sd
	vv6Ja73UfY9Uf6Zequhj4GkjEH8qopmWwj1JkpvAa/uHb3ijh6Nv9FNqu0uNZvTQbbIvOE0ikrs
	lqnAX/NhnXax4hQmMZNGeOCFkEB7eRWv7EvK0Z77/hJQ3X3UKdundkRKzSfskDfMUBcIJyHsIOa
	k8ZTDH8LsaGbf9GDveEfKPp/aY0g70d4mwyUqw39XTFxEqjbzIkS/WZtQ3BReaw55alRRJel9DS
	EzJ9N4eNlZ6z4kZ+b0XL9rsfpZqInqYlOJ1o59dY7oM7HD923o6yOhRTQDWrZf93cZfMI44p46n
	0EtPsGg==
X-Received: by 2002:a05:6000:708:b0:3a5:5278:e635 with SMTP id ffacd0b85a97d-3a572367577mr14018452f8f.3.1750268493468;
        Wed, 18 Jun 2025 10:41:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGIdYJ4byKGNqSckw7stdQWmP9a+mk+8zzlUOQQiezgX3FefY2T8iN/DegCcyfhV4fwKQhI6A==
X-Received: by 2002:a05:6000:708:b0:3a5:5278:e635 with SMTP id ffacd0b85a97d-3a572367577mr14018429f8f.3.1750268493058;
        Wed, 18 Jun 2025 10:41:33 -0700 (PDT)
Received: from localhost (p200300d82f2d2400405203b5fff94ed0.dip0.t-ipconnect.de. [2003:d8:2f2d:2400:4052:3b5:fff9:4ed0])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a568b5bfefsm17100889f8f.88.2025.06.18.10.41.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 10:41:32 -0700 (PDT)
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
Subject: [PATCH RFC 28/29] mm/balloon_compaction: "movable_ops" doc updates
Date: Wed, 18 Jun 2025 19:40:11 +0200
Message-ID: <20250618174014.1168640-29-david@redhat.com>
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
X-Mimecast-MFC-PROC-ID: wMafbZ-VWR_8w0-e6utDS2QlQurlOUGGQwVTPFExPZw_1750268493
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Let's bring the docs up-to-date. Setting PG_movable_ops + page->private
very likely still requires to be performed under documented locks:
it's complicated.

We will rework this in the future, as we will try avoiding using the
page lock.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/balloon_compaction.h | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/include/linux/balloon_compaction.h b/include/linux/balloon_compaction.h
index b222b0737c466..2fecfead91d26 100644
--- a/include/linux/balloon_compaction.h
+++ b/include/linux/balloon_compaction.h
@@ -4,12 +4,13 @@
  *
  * Common interface definitions for making balloon pages movable by compaction.
  *
- * Balloon page migration makes use of the general non-lru movable page
+ * Balloon page migration makes use of the general "movable_ops page migration"
  * feature.
  *
  * page->private is used to reference the responsible balloon device.
- * page->mapping is used in context of non-lru page migration to reference
- * the address space operations for page isolation/migration/compaction.
+ * That these pages have movable_ops, and which movable_ops apply,
+ * is derived from the page type (PageOffline()) combined with the
+ * PG_movable_ops flag (PageMovableOps()).
  *
  * As the page isolation scanning step a compaction thread does is a lockless
  * procedure (from a page standpoint), it might bring some racy situations while
@@ -17,12 +18,10 @@
  * and safely perform balloon's page compaction and migration we must, always,
  * ensure following these simple rules:
  *
- *   i. when updating a balloon's page ->mapping element, strictly do it under
- *      the following lock order, independently of the far superior
- *      locking scheme (lru_lock, balloon_lock):
+ *   i. Setting the PG_movable_ops flag and page->private with the following
+ *	lock order
  *	    +-page_lock(page);
  *	      +--spin_lock_irq(&b_dev_info->pages_lock);
- *	            ... page->mapping updates here ...
  *
  *  ii. isolation or dequeueing procedure must remove the page from balloon
  *      device page list under b_dev_info->pages_lock.
-- 
2.49.0


