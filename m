Return-Path: <linuxppc-dev+bounces-10098-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CEBA4AF9013
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Jul 2025 12:27:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bYVCb42kqz3bkP;
	Fri,  4 Jul 2025 20:26:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751624763;
	cv=none; b=MWpBM8AR9k0ArHyLLrj03T7LfHoisUmSJDvMgkVse+URep99MhWJqahTag5JlmXyQ4FgslrhNTY8kRsJMaAKdj48u8PXRUgDPXJxYUPLm9dyo8F2LYweBfwXS21gs8ACAH1Y3E8Ajbiar8H72JE+En+7atSjXegMtbQoDBuK6nt0nrf4Vk3oXDF2wOwvTXBm30j98b/2IdazNlqZd2stYrQu/sSo/RpU18PPin4K9VO0zY3pWC8EeBj8EHvLYf0RMTe6kE9FhwJMCEaJSv94ffUTNNDy3lZSQqMiobWw1/pajry5jqF3/SI7mgVhNwpQJuM4ZRwi03S96+YUEoioIA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751624763; c=relaxed/relaxed;
	bh=YZJ0pN+qk8np2TVjDZumvdXYQEUJdQ541mKybIkqdFY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=Bw8sAYO4iylrNfUXsocylXHeKhV02w3Lvzil7uWK10EIVd6eNbob+kO9BAoT5P4qBv5BkgwH7jSNbY7gyFR18QJBk4WhJ5J/Xj3Wq+72FprlAfGwcGZLNjvAviUSfpYbExr7qBGgSR9lvbQe+ADiFrXwEhcODiR4HlX+v6wrT1LlTiBWUlK9nVU7zCia3no3duaUCUgoradw3vEAGCq4aZ11A+74G8ofv+zR4DNuli5Ib7yT6Ab7NJgqWQwdJlPYS/3JneCIp51DM4ZB8f42wq8utmGhfSA3GbER9vwVqtfub2tvgP6hCNNa7rHMRv5o8vfI7rCyLL5u40ptsv2jeg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AuSySbeb; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EvBtKcmJ; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AuSySbeb;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EvBtKcmJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bYVCZ5bMyz30Vq
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Jul 2025 20:26:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751624759;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YZJ0pN+qk8np2TVjDZumvdXYQEUJdQ541mKybIkqdFY=;
	b=AuSySbeb2ar592H3z30N2n4I3gUDyJ6f73qrrLT6jGWxJ4nzF4Mxw/62ia1aWxf21x95MY
	XR7axZFsq9ydASU+JtGkTzfL6tsbArOnE/uets2p2xgE6RFZsW89mL2wM8kYe6JrfN8Sw1
	XqhURKaVXkB1mLDSXB7Q9zRydGe8HLk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751624760;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YZJ0pN+qk8np2TVjDZumvdXYQEUJdQ541mKybIkqdFY=;
	b=EvBtKcmJVxHSkwC/tlruXfz92suOgkYjU0GMf8QBgO4y6x+dPEfqdxAo/zNUK1nRxFEQ2F
	PFJ/9FKu8O4+7++CaRE3A9sNO5KP7klh2hLahkQth5yWPIH26a7VBsKoDJvH9pG8blu8Jr
	PEg9DA2aQbVknZfhwibeP3vwk7AhuIw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-586-im4uIv6dM5m2lDPsa7O8PA-1; Fri, 04 Jul 2025 06:25:59 -0400
X-MC-Unique: im4uIv6dM5m2lDPsa7O8PA-1
X-Mimecast-MFC-AGG-ID: im4uIv6dM5m2lDPsa7O8PA_1751624758
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a4f8192e2cso419298f8f.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 04 Jul 2025 03:25:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751624758; x=1752229558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YZJ0pN+qk8np2TVjDZumvdXYQEUJdQ541mKybIkqdFY=;
        b=VH46puFieW4kFJsYjgcQtFVxP5Wixm/rsCSIu37IGJSd2Stn/i8AldBX+JQaHBs90S
         iOjd7KAl499nZzupAgiRNYSs7T3U3/ukLi69jBGvwLpnxpu/dgoi1D95WtnAT/8QvP/i
         yfNCw1ARduBvJuabnAzx3diZGVXevcPhQMIQMr0AtKlw6yBHXPzxRVjIEYBgpgbZN2wW
         KgaYowzZNGVaAx6jFSrbwa55hta5lUs+qcQjGmhxkqIc7QqvpZzud2m7qz2uYVmyI+5Z
         0pLPQZ3GQtMCMGucB13pDUkZIVVFZKElGPx4Beh8VVjYzY0kDGjW5DW/prH5iP4V6J/O
         B2Nw==
X-Forwarded-Encrypted: i=1; AJvYcCXEUPgEq+zBVxW4WGgY+XG56m8eQHoRy6qKSRXQ05T9M1fYZ7YzuIEo1wCfQWXHhz618SLUF/Z/ekmI7D8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx1H150YR9+bhFmfu2VfDY9ff54fBJCO0YjLnbqyWU2nCNFHn8R
	lQxonOIDDBKGVMxHz86vllHgd5mKAWBurziFIL9xTOBDcQwKtlVeR7jYYDgoYIQx75obzPFQ/jB
	3Ue/4Cgs3chHsXFUQrJp1vJtK3w7J88L9Ew6iDcUYktECMeU6XASGH5Cxbl+BM7DzF5Y=
X-Gm-Gg: ASbGncslykU/OId8WDP/epryG+KElIFDPLYxITE3MOGuYatHG4WBMZloVAgY7llZ+jI
	+FpRjevGxdXP1wqw79wlfSjfdbKHigGPZvpbE8q8yIp1C0+kiM6+Cx29nGRTzcNNwZ32ggvqph1
	S85yiVxLT7Y7MRu17lowvEFIsucRhkPOUKuOChae0SvNNghIUcs/tvqHX61jaOY+69W6NQYRJbb
	th5ZuC+DBKb+Bm517XJT8h2OLjqf9vyB/Gn4b946KuKqYc8Q0aitxNLDIJhL0reBLDZZzITyE6e
	E7dOF2OxvskeIFYtwUHLIpRqr3bo9s+Uvk7QFJQuLaKQMPOLG8FzrC/ttpHRTVUNiqqm+RbLJS+
	h2DTqVg==
X-Received: by 2002:a05:6000:40e0:b0:3a5:26fd:d450 with SMTP id ffacd0b85a97d-3b49702e8bbmr1184022f8f.47.1751624757542;
        Fri, 04 Jul 2025 03:25:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGjTF6Bi5YHLD4LeEN00n0rlH4Rvb7Qu4SkJgVJFS3bHVyzx6sYZQQ7vAELvz5hrZ++LyEv3g==
X-Received: by 2002:a05:6000:40e0:b0:3a5:26fd:d450 with SMTP id ffacd0b85a97d-3b49702e8bbmr1183969f8f.47.1751624757061;
        Fri, 04 Jul 2025 03:25:57 -0700 (PDT)
Received: from localhost (p200300d82f2c5500098823f9faa07232.dip0.t-ipconnect.de. [2003:d8:2f2c:5500:988:23f9:faa0:7232])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b4708d0fdfsm2172535f8f.32.2025.07.04.03.25.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 03:25:56 -0700 (PDT)
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
Subject: [PATCH v2 10/29] mm/migrate: remove folio_test_movable() and folio_movable_ops()
Date: Fri,  4 Jul 2025 12:25:04 +0200
Message-ID: <20250704102524.326966-11-david@redhat.com>
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
X-Mimecast-MFC-PROC-ID: O0Helh-fyIqBmqu2OWonEJ30biEzLNhdRmoxge2j3mM_1751624758
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

Note that __folio_test_movable() and friends will be removed separately
next, after more rework.

Reviewed-by: Zi Yan <ziy@nvidia.com>
Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Reviewed-by: Harry Yoo <harry.yoo@oracle.com>
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


