Return-Path: <linuxppc-dev+bounces-9461-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F707ADF432
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jun 2025 19:41:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bMrcP3Xz4z30hF;
	Thu, 19 Jun 2025 03:40:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750268437;
	cv=none; b=J5StIJG6e7OOH48K6htnHMtaV3rTSTDoe+97/XnXgcIwggjuCw9QYE96j7EnZcQfzcDl+5FGSR9gWxhZLicxR2ZWxhJn9A8z0QakZ7KDZChoOJvLopqcsYt4dCRAXI/xIw44f6vT4DqBx9S8FQMp+P2MJrmNnVK6q8qlI5Z2VJPwSp7IVnEeDjFynT0Iulacxn7IUJzj8HwNYtcdr49shPUl3hfKPMQTwGJi4h2Bi9H9hCcZ6mt8fIEi6ETH/t9A6fdxDyEi14xRJ2rivXXhu7OG77UCYnFBeEDmiX83TuJ1GRpP11GpOMvrefymzznqLpK1DdLNhniNhso386eQrw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750268437; c=relaxed/relaxed;
	bh=nTkPO9qqkPL3+EL3rvp7Awl5YkqXAjOFp3B2ZpZgv4c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=Q7SFKhhazCu63lptrU+z5HgOOr+EVr0I0YTc2KDXloLzc8gWCNg8wWDE0u4UImvq/vlfB9SXOtb6nQgBH/0zL+9LkqBnzywfI+nBgrayFG3hG+QCF4LZ8OhJ7OdgBiUUOZZ6h6QL7nTMHa0aFJizGegs7CbfnkQpRyk8v3I94xenLITkNZwLjnSIpkmdov8pB/LkMmxQ3v9QyBmV0qy1vMpGp+Zfp4XufTtBZBOQq6cuHG9Ey2EcyFPFN/M936/rXjU9sVDEDccTNXjD9pZGYynpdrOEbec4FWqOhUYhLblRQ7smvajvzU3tpdYOXcP9R5o+qefaaNkIv6v3gZEDzg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=R6fG7dGe; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=R6fG7dGe; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=R6fG7dGe;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=R6fG7dGe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bMrcN4r6Pz30Vs
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Jun 2025 03:40:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750268432;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nTkPO9qqkPL3+EL3rvp7Awl5YkqXAjOFp3B2ZpZgv4c=;
	b=R6fG7dGewrXJbjZC/ChJogYwtB2OG/KG+pMPUljSPKFcm1eCGe8zwQSSeGm7T2/7EjrCxj
	z4mO91p8dquwOn1lnusrHETAH2M5sTpUhEhEsDIKsYkdadFuv4yDjkHSD9MmV2M7jOqhYJ
	fjfkA57ZWCfF8QZKshg/q0Dvbl5d5Fo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750268432;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nTkPO9qqkPL3+EL3rvp7Awl5YkqXAjOFp3B2ZpZgv4c=;
	b=R6fG7dGewrXJbjZC/ChJogYwtB2OG/KG+pMPUljSPKFcm1eCGe8zwQSSeGm7T2/7EjrCxj
	z4mO91p8dquwOn1lnusrHETAH2M5sTpUhEhEsDIKsYkdadFuv4yDjkHSD9MmV2M7jOqhYJ
	fjfkA57ZWCfF8QZKshg/q0Dvbl5d5Fo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-553-GKJSZy1aPVqlKQVPBs92Rg-1; Wed, 18 Jun 2025 13:40:29 -0400
X-MC-Unique: GKJSZy1aPVqlKQVPBs92Rg-1
X-Mimecast-MFC-AGG-ID: GKJSZy1aPVqlKQVPBs92Rg_1750268428
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43e9b0fd00cso5758125e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jun 2025 10:40:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750268428; x=1750873228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nTkPO9qqkPL3+EL3rvp7Awl5YkqXAjOFp3B2ZpZgv4c=;
        b=vfbJC3d6+SMRIRkVsjaH6Kmnncla6mUjQWvKXYNJ4LC41ufLFxf8niGnNc1ccRMhir
         cZtjMpl9TxA2fRy/rKnCiby1+RhCx0zWUySs028gDac2uAPbBfvyWRpVcPZxwbc0S1b+
         IHO8+YmsNQtAVDx6a2Qc1zZcQWCWKPiC2RaxfLuVBNzlQ9f7pXuzfkYTx2+78RIUdtXU
         iUf79aPonTpYCR4560OtwrsXFc7yvHR2BPsZRQXZYuPiuIrGLMOjavgI1g5EVgfaYO4X
         DTBQFG9uX0XfuAC/6oyGJZkSETx/ucjr3y/oyLdyn4XHO5SSM2hORUjEkWREbJalkxTV
         aFvg==
X-Forwarded-Encrypted: i=1; AJvYcCUvREUX5LV4O6u5V3Q3lAwsaoVsvIguOnMDwdE2u/BFIVBigPo0V7kSk9Qm7yFlrwTmWc2KPS3cl1MnI70=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx5ZjbDBUN3zX+pumarZ3CW0IeesLZdBoxmMuHzSsevOkRuvpCF
	meVheiAFOrf4FRrW1orZeTrtNUWfR9ehOpsJJA/QH0gKUwFUEg0isg5UqLgsk02Eig44v3BWXfm
	4BUyGL54hJb9pebxHKisSMMKFY7kEa/xMcDVBTguY41jVZlaK1Rnm1fEm6abIaQlOFMc=
X-Gm-Gg: ASbGncvDrJWPUge+t322n5aEPhm4BCki7/+F4dufNofWwzw1vI1ZDO2KRLXjje5QrG2
	Ky9kJTrSYxIDXKDznRxZmbQc/sRlxRGi1UTqXjcBYqWeDR1ga6l3Bm513NZ0kpcEKf203Pcsh90
	tvA/cuABw1UkAJrqmCrO/H062iJxUyfY4d91iv5gRIBsTZHhaMDSteMZ2eKwd1W8YplLGj13qoE
	iX2l5rh+jgIjBbdHSEhZbDImyM/14g3qEC4KtKCWjtX8S3jGS4K0zqJPQJ2l89HJ6Yh36AsubvN
	2lj1m52HyxXb6v9kgBDJ4h0qc1saWHNRX4VbZRJeW/34dx4Q8Y2Vqy7EMBfYv7Ef2vo8lDR8StD
	4wVaPMw==
X-Received: by 2002:a05:600c:4b16:b0:453:92e:a459 with SMTP id 5b1f17b1804b1-4535ec85c23mr3139825e9.16.1750268427777;
        Wed, 18 Jun 2025 10:40:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFkzVO1ODwNAxaNuTK2n5Qmy81cmyi9pmESLWNLzISSPT37JEqPUHdRyxt0ThuYLp1iDunnjA==
X-Received: by 2002:a05:600c:4b16:b0:453:92e:a459 with SMTP id 5b1f17b1804b1-4535ec85c23mr3139385e9.16.1750268427286;
        Wed, 18 Jun 2025 10:40:27 -0700 (PDT)
Received: from localhost (p200300d82f2d2400405203b5fff94ed0.dip0.t-ipconnect.de. [2003:d8:2f2d:2400:4052:3b5:fff9:4ed0])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a568a5407csm17710458f8f.12.2025.06.18.10.40.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 10:40:26 -0700 (PDT)
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
Subject: [PATCH RFC 04/29] mm/page_alloc: allow for making page types sticky until freed
Date: Wed, 18 Jun 2025 19:39:47 +0200
Message-ID: <20250618174014.1168640-5-david@redhat.com>
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
X-Mimecast-MFC-PROC-ID: mreAb6flFOLGQyQbQYaEQPlZqRp5IWWo1rDzADnurVw_1750268428
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Let's allow for not clearing a page type before freeing a page to the
buddy.

We'll focus on having a type set on the first page of a larger
allocation only.

With this change, we can reliably identify typed folios even though
they might be in the process of getting freed, which will come in handy
in migration code (at least in the transition phase).

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/page_alloc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 858bc17653af9..44e56d31cfeb1 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -1380,6 +1380,9 @@ __always_inline bool free_pages_prepare(struct page *page,
 			mod_mthp_stat(order, MTHP_STAT_NR_ANON, -1);
 		page->mapping = NULL;
 	}
+	if (unlikely(page_has_type(page)))
+		page->page_type = UINT_MAX;
+
 	if (is_check_pages_enabled()) {
 		if (free_page_is_bad(page))
 			bad++;
-- 
2.49.0


