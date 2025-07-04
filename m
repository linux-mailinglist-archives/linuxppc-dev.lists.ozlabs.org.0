Return-Path: <linuxppc-dev+bounces-10115-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 658B1AF9046
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Jul 2025 12:29:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bYVDY35nNz3bwJ;
	Fri,  4 Jul 2025 20:26:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751624813;
	cv=none; b=nJ8TTpgoRPWWj4wLNm56SdJRt4Lli4ZdrLxRvhlNtMDcK3jP5rOJYQkO+KeHaf7xGZ/rmG90uSnKoN2O3whXcWba0YRMhFZzsAMTQfPGIQu4m53DyISIzYTNHt4JbQLmK7JUtHSOATOdsyrF7LDkJhJ9OHxVOvXPPfdLNpXivjDB9M7Xnug6Poto83nnbEZXZR8NhSg7M3j3jdavDzCLadfs/kCqPtu+dk2HJti+a/3l7xn+COidAj3NrAXo04FSLRnmb2E+n/EPmoU+CmALOzGgE6sMbIsvcyGWzwgWyqs7uz9oYKfS6c59vTttvIyGTxyNSSotUdUHyGXhT9ewEA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751624813; c=relaxed/relaxed;
	bh=mQ0XfChfbxm2lnvJaf8puphZG2XMtd7Fe0eRXg0ZpMo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=Z1G+gCtkI03PYh3mRUgmb04N0r+HFBtJR2NferIB2eq+3QNC6r5mJ1iIyVbG9I3Pb1qA3rcl0mNpYTAYtpqkBfxo5TcSKQT59OICdZfuBkMrhW/bQeNNLaY8HrUAJJuFagUizFpSlzJ7yEvaND4cZ1RS15OBHq3KLOn81LxyYWgY2HYYCdJA+CSBs7dEB9m/UKhkVzrIvpzML2BRcebNOoLvW6bteZyLF8C5YXMHtwsVzLMR22LFoPU6VP5mGCf63LqyFP+s+KVusHjbujsXP6vZM3QssAW4EJ2E8E/l9f+i90NiJTnErg7cNy6AnLIHXOkhyxJIXlR1jO3uniGdQA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AQ6Mt4Pd; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AQ6Mt4Pd; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AQ6Mt4Pd;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AQ6Mt4Pd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bYVDX4ZVtz3btP
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Jul 2025 20:26:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751624810;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mQ0XfChfbxm2lnvJaf8puphZG2XMtd7Fe0eRXg0ZpMo=;
	b=AQ6Mt4PdSJtr34h6S6JlcSvtrmGic6j05S/wIE+uh45l52Y3mEalZaDXBSRzg97GWiGUxf
	ze5rxRWYDeyzHr60v2l0BrHXQivOp904PBldzzDR+zL6RyVKYyWoeHFjHs6SxV+AKj39Vs
	KulX8STcfvfX7qQfoe7oCTd18l0Iv10=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751624810;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mQ0XfChfbxm2lnvJaf8puphZG2XMtd7Fe0eRXg0ZpMo=;
	b=AQ6Mt4PdSJtr34h6S6JlcSvtrmGic6j05S/wIE+uh45l52Y3mEalZaDXBSRzg97GWiGUxf
	ze5rxRWYDeyzHr60v2l0BrHXQivOp904PBldzzDR+zL6RyVKYyWoeHFjHs6SxV+AKj39Vs
	KulX8STcfvfX7qQfoe7oCTd18l0Iv10=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-498-ClChhjdKP6KMNXYnu5mS9Q-1; Fri, 04 Jul 2025 06:26:49 -0400
X-MC-Unique: ClChhjdKP6KMNXYnu5mS9Q-1
X-Mimecast-MFC-AGG-ID: ClChhjdKP6KMNXYnu5mS9Q_1751624808
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-45320bfc18dso3890495e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 04 Jul 2025 03:26:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751624808; x=1752229608;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mQ0XfChfbxm2lnvJaf8puphZG2XMtd7Fe0eRXg0ZpMo=;
        b=kKiAakNmCCb46CfzzB05STK+/s/7GTB7Pg+g3ub0Dv6wS3qZKpa7O3g5Q97yla1duZ
         KenlzlGBw6Y3gYimpQuQ9qM43NDS1pw9ABFgU0D3851Uk5NVUhQpFqajuWpuiW1NiTer
         JXDMItUnOa1ftcFNCw53txhzVgrmDZciyzsY4DT80zpDPE0tGHDAIDGxFPBiAIqdlmTM
         Iu0ZbntNgKNyYxPvEF/0+/kaO+l/7Az8ph5hFrOzvMhhv0f5qf/iPXtSjn0Kh3LMBC1/
         p8LC5QOtWB4cwj3BvRrbnOD3mR3qv9RAt7rU4BcWx6pSsHr8F61XbNcc/aMvcVRB3Lyb
         voYA==
X-Forwarded-Encrypted: i=1; AJvYcCVLz5y501ZDrN+/OV3KCkOBJpTPQ7xocBuJlLfyxrH/X7OzGCoUr5jbDI+0iwNJjfMvQDkoaKjK06lb/XU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx2ne6G9FubG02vNX8d5CbOTatpqfB5bWtru7iRcyUcLbyTZUAA
	wDDb8Ua16xMarUGKoPllygKq1Q3OEueyEsGuiH3Yl8zb+qKq05deOUNq6HXsQSGAmTxYNfhfeNQ
	vHlB1H1l9YBnIteDmMT/grl/KsPiiiVBWeRLtiytpHGkdvsWPnLv5VCzwFMO1P0GueTQ=
X-Gm-Gg: ASbGncvzRXFqXm4hkm46pdcYR41eX7ka4hMtYA8+Kdtxwwu6pLtoSZx8f+TBMH7I+gD
	R1X8c/UsDGLoplHjZG8GPRw42e0zxuxqTwfZstxfKXlBqkxEYpQ0kM1ncbKP5lmj+Jgp+Agg68C
	eyXfv2jbQUonrARUjrsfBLpzZLGe+zUBmBlRVgqcZQKe8pZ7zZ9q3OKG9sn76Ah8NNgoAvYcSNA
	bR0WohRJWEnTZQ76TPlnXlVHOf13owt+ePVYeLN3BaOcQP4zGkHmIAbOUEzkslHm9spK+xSr2Ez
	jRALD9uSQXRWQQ0p5jVKZjXBhC4aM0kDOxLsaMqLve0qq/xgK15GVcEHmeOp5lzyzUVY7HwE7dt
	FgylPqQ==
X-Received: by 2002:a05:600c:8219:b0:442:f4a3:a2c0 with SMTP id 5b1f17b1804b1-454b30c46ecmr22269695e9.13.1751624807872;
        Fri, 04 Jul 2025 03:26:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFDbvyyEAOAh2zTRSLUq2RLyWuJqmjCfdM4cRksQAqvl8abasokMK1aTRkGvgAfFTh32vAJjQ==
X-Received: by 2002:a05:600c:8219:b0:442:f4a3:a2c0 with SMTP id 5b1f17b1804b1-454b30c46ecmr22269355e9.13.1751624807380;
        Fri, 04 Jul 2025 03:26:47 -0700 (PDT)
Received: from localhost (p200300d82f2c5500098823f9faa07232.dip0.t-ipconnect.de. [2003:d8:2f2c:5500:988:23f9:faa0:7232])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b471b9671asm2135708f8f.53.2025.07.04.03.26.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 03:26:46 -0700 (PDT)
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
Subject: [PATCH v2 28/29] mm/balloon_compaction: "movable_ops" doc updates
Date: Fri,  4 Jul 2025 12:25:22 +0200
Message-ID: <20250704102524.326966-29-david@redhat.com>
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
X-Mimecast-MFC-PROC-ID: ljq5KN_zLPO3DltTG7Q0z9K3RRKVZ18SCaMitdfR6ek_1751624808
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

Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
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


