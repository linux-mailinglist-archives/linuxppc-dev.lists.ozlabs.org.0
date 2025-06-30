Return-Path: <linuxppc-dev+bounces-9909-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E1EAEDE11
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Jun 2025 15:04:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bW5s84980z3brc;
	Mon, 30 Jun 2025 23:01:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751288508;
	cv=none; b=D5Z4QMJaOIyfGJpM065/QAknbWVLxIDtjOYsYByUlXb3OsaoXvM1QasDEZQWO9rI19k3wb+Ul9hWEsur3lwwMPw1IdykVFPK59JI0/opCjDIZ6HOMfK3RRoTlM24QwmtN5YSYw9qgmIBBEeU77d5d3b/nRO0A+Cr2Muai6MA38JB5R0thpZarfPpZT8X6oVXtsPzt7FRjE9iuKkHaxuw04EKRQXN7JEf1OiCrCsbnPPLla1lIrclKRyPMIW3oegHXnXscxaE1UVGZuEiCOYPgzgXrTySdBWU5uZEWGDQcbCxBI18Bo8kRe1ze6dhgAVxWgn3ZojQu+/45WX/8vcvRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751288508; c=relaxed/relaxed;
	bh=EpLhIwgxSmOTAUjcHZTQRVGXB1xFFa6Mgym/mVDU2pw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=enxF8PaSNEITpVooZN7oNXEoiaQdFMVrIIpwhBAN3mart0JgOVoPyorhSmWHz5p/gnSkgDf8IB2rIKwihHPetJ2JBx4tmChaqEE8JjNETYXdqsVKNRlRu2XmlmTDBo0rjV3F5tZkHe9/wKGm1P6utVu6GKM6UVy7p7WmLnxn9HStnltU1mzhlnvw69/ZJHlCkPpfAHhqviQ9pUJNN+LDOTNemsxVuDu8qsfIW2Dn38E0Vif/0KZBw5dsoK/cLA1wnFjDURsBy3MERSovCSeoBrtnhaXGlj2K2PQ3XNic2VxTWeCBPQpgiZ/GML8ZnMewIFUUedkIucjM+Hfl0ZSZEQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=e88sIv9S; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CL+ZVTgV; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=e88sIv9S;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CL+ZVTgV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bW5s72hM6z2ydj
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Jun 2025 23:01:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751288503;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EpLhIwgxSmOTAUjcHZTQRVGXB1xFFa6Mgym/mVDU2pw=;
	b=e88sIv9SjU7Fg6X1JTgtbL5Ot11qdQP/K7Ox7eqTZOdFyoIohn4rR8TR/MZ+Cy2MHEOsKB
	VAeEaKBd/KfmxvY4B129iYyv3JXYA1dlHL1IiIIQigFnW/XSShxzq88Mu8etgHGL6kxIdL
	jZdztg5ZE6PshmtIyOtRUDYDd/RG80Q=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751288504;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EpLhIwgxSmOTAUjcHZTQRVGXB1xFFa6Mgym/mVDU2pw=;
	b=CL+ZVTgVyHR/Uz2PMqx/6uWi4Q2dNfqM3R1LsoGIkx5+3laKN7/m1hZ6BHZlT0SHRp684t
	UN6QImHAi5sGs+zu/4oIFJBAZO7owMF+7ykD2dXM1By3F1KfwC2v93O5g/0QYU9G21jsX5
	+UXlQLLeAiXA9wpJvkPPGQgtpOyOtLw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-126-8u5BpYYxNGukxosh_TNMvw-1; Mon, 30 Jun 2025 09:01:40 -0400
X-MC-Unique: 8u5BpYYxNGukxosh_TNMvw-1
X-Mimecast-MFC-AGG-ID: 8u5BpYYxNGukxosh_TNMvw_1751288500
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a4f858bc5eso1530456f8f.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Jun 2025 06:01:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751288499; x=1751893299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EpLhIwgxSmOTAUjcHZTQRVGXB1xFFa6Mgym/mVDU2pw=;
        b=nmqTgZQdEmQQtEJr6jczx7TSl3NuTr2s9F7FbxHt3EHTMkGMk3jdgbrPb1NuZNKrg2
         XOwxc621vJsk8UpwT1XGrWNBbBMIgpOocCLGZOpmeddZQqRba6ZzWhN04yA79J82DB2Z
         nqWwq9V6nEUw67Hm8OupEfUhlmEnMKdgEGWdUEi69g+k1zbaN5U/RTAApuG/1sLfjLRl
         vs5nlofosxK2JauW5hk6myDTbV+Yu4d/s9ZvBMm7X4x9WIWtnvU0eoVMgJ3o9Y2MSHxk
         lSll+keanZr3DMmP4UlKpS/FkZQ6Ey8jexvU0R76E9gYcuCCOIiMls+MF1VkMd19us95
         m5gw==
X-Forwarded-Encrypted: i=1; AJvYcCV7+zqthNp/qHsjKjhoGtpLV6JEVcoB0foHFtiJMIkZtyTjsOD4KfxbkFeAP+JidlCJTYB8ezuPSl35L+Y=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Ywd3u4FesZIsTmsqew+pWPTEttriQoZcz8pcfHmoNuC5DZ505zn
	1tZwamX3bqjMfazKM/UbBQtOyUqp2vioVw8+R9+Pa83ni8fq4Uyi2zP75lGWDVPFyugXXsXQMGv
	myI3C2P3dYBaItmNcELOyu4YV7hPTLybhUsETPH5cPKujrBFuMkQRYUWFHw3oC3OJu7Y=
X-Gm-Gg: ASbGncupvVHRHEAu98KwW7Cj1uPSFgLK9dQ+ovs/DogtGpHqoAC8oZnCtyvA+eFex8r
	ntLGY9pzdxQOFYiibZ/BpYsDWQFYozpZIiBz9ledhaSWCyzlxv6vuK+QN/c69GI4tgWR7nG1Ovj
	oYwngj/TY7dP7X4opOja/Wi4Pu4y2nmFFQOUsVIw7LKYb6gzC0e3PQ46KFEv1hw1BjT2x1fXvHl
	q5qVA/ostv1fK+zrMsxiALRNZmgCatBNtd6csTJ93nz32tniH6qP4bKKHNAhpnTK+s/TIT5b2U5
	fSfYy3QfAq+nB7QJxyM3QFB8fDfrevPrl3PB9wZaZUMfaI5DM9qi1zc0dTXeaD6pMkI++W7H0Cb
	rerX3z5k=
X-Received: by 2002:a5d:5849:0:b0:3a5:8934:4940 with SMTP id ffacd0b85a97d-3a8feb70269mr11468337f8f.50.1751288499083;
        Mon, 30 Jun 2025 06:01:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFU/EidvqQvGX4HPGBQwVJZ7hXZfY7F5Qe2rCBAm3bwMmXiBwrV5rV1e++rVLkevEN+RDkRKg==
X-Received: by 2002:a5d:5849:0:b0:3a5:8934:4940 with SMTP id ffacd0b85a97d-3a8feb70269mr11468280f8f.50.1751288498410;
        Mon, 30 Jun 2025 06:01:38 -0700 (PDT)
Received: from localhost (p200300d82f40b30053f7d260aff47256.dip0.t-ipconnect.de. [2003:d8:2f40:b300:53f7:d260:aff4:7256])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a892e5f92esm10485904f8f.90.2025.06.30.06.01.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 06:01:37 -0700 (PDT)
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
Subject: [PATCH v1 28/29] mm/balloon_compaction: "movable_ops" doc updates
Date: Mon, 30 Jun 2025 15:00:09 +0200
Message-ID: <20250630130011.330477-29-david@redhat.com>
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
X-Mimecast-MFC-PROC-ID: ubbmGbSo2eMA8jE83E3ifITMlDeOYJMSKEPqkc4kulo_1751288500
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


