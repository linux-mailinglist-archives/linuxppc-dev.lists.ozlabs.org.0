Return-Path: <linuxppc-dev+bounces-9481-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D43F8ADF46E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jun 2025 19:43:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bMrdS4nTXz3btt;
	Thu, 19 Jun 2025 03:41:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750268490;
	cv=none; b=NSu0zbcEktNaHRFD8NwSlL4naCrXwFk+oLNmKDAOkVyk4ywKdVL7fdNeBe+Fuf7lqCvS4LwnfzsIzvWaOZgqmndBWrK9MSn6SzdlaloyJwFJuPWfnQd80RT6f9A83tuslLYc3nnRGC69eQ2bpKypqnxYFtBkbbiKVmic05m6aCEVwVZdDIMNHXeKGEtazAq2puqFgxwuwUocb03rcOu8vNa2TT5uPYxjmS6DeIu2ufOE2iJIVat1Buhj5tks8QliEfIJqBoiYl5a7JjqdJUOWdaxCzwzjHRNPmQkeWySPhLxL6yZESMOz5rcJnJp5BTEv7FHaEZIzAXI0G5QpWI6xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750268490; c=relaxed/relaxed;
	bh=CdeAYiIbvuQl6YyCSbJM0KZ+PwGvgoJ4GiSuuebq9Wc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=fOea4hmQ19x+VZe+vPavSyjQmR4J6qlVXP6WN6h+uDh9omseZBL/w87sy224+8jkhzR9nfPXpCNd/CuV9WzcVExrnE+Q9x96m3IN/GHd/FiXLJ6avY7bVAzo+aXHRRqp4pBSO4GpwB4rKAiR8p8k9wfKWVJ0mnWp3kTeyJhCBHEhwTLuG01pmJo0CIm1vcvdK15jjqgP66XUL160vHlERG6OHTzHExZyyQxUH3+P/gSDNyk0aHD1MXtqH2PZHpH9bTOAyXIdzDz/7YWeN+YQ1UBDweKypzGR8f8Grp8peTkxUYTnui/+ZBrcuDF/pWCM+OFbDRIPKZOVbrb30Vo66w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fSJ5iCY8; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fSJ5iCY8; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fSJ5iCY8;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fSJ5iCY8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bMrdP5qnBz3btl
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Jun 2025 03:41:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750268487;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CdeAYiIbvuQl6YyCSbJM0KZ+PwGvgoJ4GiSuuebq9Wc=;
	b=fSJ5iCY8SFNDNUux3BDgXCS9GdSx3eNhMl15qSspLca/fMxVJAiD2wv26QOBAY7G7phCkN
	OhDsftsvXYuMnf1d4a309JbTjkArM8nXwxFknDmy5arHOxx099qe92V9U0vyY3KN6Hg/M2
	BQeg7IL8pvVUu/7RGqV7bZprpNeed+0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750268487;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CdeAYiIbvuQl6YyCSbJM0KZ+PwGvgoJ4GiSuuebq9Wc=;
	b=fSJ5iCY8SFNDNUux3BDgXCS9GdSx3eNhMl15qSspLca/fMxVJAiD2wv26QOBAY7G7phCkN
	OhDsftsvXYuMnf1d4a309JbTjkArM8nXwxFknDmy5arHOxx099qe92V9U0vyY3KN6Hg/M2
	BQeg7IL8pvVUu/7RGqV7bZprpNeed+0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-388-4KSu4oXOO66zVYx3Mp0wCA-1; Wed, 18 Jun 2025 13:41:23 -0400
X-MC-Unique: 4KSu4oXOO66zVYx3Mp0wCA-1
X-Mimecast-MFC-AGG-ID: 4KSu4oXOO66zVYx3Mp0wCA_1750268482
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4530c186394so32133535e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jun 2025 10:41:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750268482; x=1750873282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CdeAYiIbvuQl6YyCSbJM0KZ+PwGvgoJ4GiSuuebq9Wc=;
        b=f5G9PRFE1n7ZSydYZzjXzimbJZphE32U2CeBBGKWOsqSdLAoIi2d6zqfDzoED5zYUn
         yPNjUpSFURTOJBADNyaJUJTFIiYwQp1qQ3L0GoFyfFBF2mOw7RUAYUOgGCcg8VAoxTst
         NR1OVARocFK830uyvfrvG0ylrtrvTeCYZBGj1R76/wrCBtt4dHvOkYwLtJ4FAE82iMbq
         Kp3BFWdjGim3gRfoyrGd1ORD32oxAj+VZO7ps2nueyIzOlhCNJgrlU7eUqcs+Kl7O29b
         rTT2j78XitQmu9wEEzwQ8RQ7OzAH8v6ftZAD9UpEiJ9sbE5sEhrheVmUfqigcRgSbwGm
         8BDA==
X-Forwarded-Encrypted: i=1; AJvYcCW1CuB60sQTp55we55+fZ4kxAyp1njSYxA6rZOKCTST2BC0sErG4nsctW8yLDVMvwwRGxRBGrl7hu4jQZs=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzFWv+kgyX+IGih46wLWOLwtFwvJCot8gQsdYc2yzncdiQ6e8EL
	y671K6NrO1vVryb5Fon4Iaw58mMArCa9XmhHmwDtp1z5gX/NFrqjVXkYwKngkOJPNbm1A68ZiO3
	pBOgZgSSdNgfK7mwmxh8ztkwKzPE1vv8NkrtKpqj9aM295zJa1M4mEusQrqBx4YtBRxk=
X-Gm-Gg: ASbGncu3oGYlUZod49AiUt1vn4vUkMODkX37Yo9YA/w7SxfWVQyCqs5TAbbQKS4nz/g
	nG7hRYtAeTIrDnhePczvJmcAhH32P6P/IjINIQLF1IhubFW0AmrhclUGnKenNm/CcylltcITazy
	JtCc4HMbu3YS30ystLylgm4L5lTrQkLQCOq5IaJrBLvClEjV0sTyXVt0GSY69h8/LRDPtN98JTe
	iD5c5TTkfwAEaa3CebxjEqFOAmhEIYm+Ic0Lk9yojem3oCfoxDQgfh4nUzMaRHzFYi2P+w+ipJA
	a+5y7eaClVXk0ytwsXxkOceLr5m2/Ddfhjgrdc7eXBVUg8THmqR53euyYHzrzZ87dokRVziaHwf
	2mghWGQ==
X-Received: by 2002:a05:600c:3489:b0:453:78f:faa8 with SMTP id 5b1f17b1804b1-4533cacf0b2mr167447945e9.6.1750268482477;
        Wed, 18 Jun 2025 10:41:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGrKZ8zfCrGufAh/HvE/XIf55Hjs+1HFJqQV1cfkKzvu6o7QRQJ1IpAcZ7M33DksKCqTfpzKA==
X-Received: by 2002:a05:600c:3489:b0:453:78f:faa8 with SMTP id 5b1f17b1804b1-4533cacf0b2mr167447475e9.6.1750268482090;
        Wed, 18 Jun 2025 10:41:22 -0700 (PDT)
Received: from localhost (p200300d82f2d2400405203b5fff94ed0.dip0.t-ipconnect.de. [2003:d8:2f2d:2400:4052:3b5:fff9:4ed0])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4535ebcee09sm3315485e9.38.2025.06.18.10.41.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 10:41:21 -0700 (PDT)
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
Subject: [PATCH RFC 24/29] mm/page-flags: remove folio_mapping_flags()
Date: Wed, 18 Jun 2025 19:40:07 +0200
Message-ID: <20250618174014.1168640-25-david@redhat.com>
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
X-Mimecast-MFC-PROC-ID: ulT6lN7aVpIXl3D16gGzYtoApSpeWoHI1_Bt0sPoo7A_1750268482
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

It's unused and the page counterpart is gone, so let's remove it.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/page-flags.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index f539bd5e14200..b42986a578b71 100644
--- a/include/linux/page-flags.h
+++ b/include/linux/page-flags.h
@@ -718,11 +718,6 @@ PAGEFLAG_FALSE(VmemmapSelfHosted, vmemmap_self_hosted)
 #define PAGE_MAPPING_KSM	(PAGE_MAPPING_ANON | PAGE_MAPPING_ANON_KSM)
 #define PAGE_MAPPING_FLAGS	(PAGE_MAPPING_ANON | PAGE_MAPPING_ANON_KSM)
 
-static __always_inline bool folio_mapping_flags(const struct folio *folio)
-{
-	return ((unsigned long)folio->mapping & PAGE_MAPPING_FLAGS) != 0;
-}
-
 static __always_inline bool folio_test_anon(const struct folio *folio)
 {
 	return ((unsigned long)folio->mapping & PAGE_MAPPING_ANON) != 0;
-- 
2.49.0


