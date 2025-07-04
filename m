Return-Path: <linuxppc-dev+bounces-10089-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4833AF8FF6
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Jul 2025 12:25:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bYVC72D42z30Pn;
	Fri,  4 Jul 2025 20:25:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751624739;
	cv=none; b=NVMqSXG3JR6WhScFx78bKQYzghBoBvrfBy6RXPFhSzCgzhs3vjS6IbK62dSalj2ORUxY8VRdLRfobEHeszmfHN1zRJD1Ov/8et6J0yAsPIVQ2EPHMf3COGKEX/hCpHzTGAgEm6a6qmEH+JM1ZLD+PrtZckfJ1ktR3AULQfpwOh3klUeK/YkxiUPD1n8BzijTWPTZLleXmN1f1k8A8PGo8W3X8Qm9gxXdKn87Yylv+1AymeBOCj6Sb4O6y/r8pkNjuSi3vugsHhr0Xon9UeyDsP6eDPTyt5DfJCzbJocelH8ksLVDzW0mwgJ91QBki/T2f1AVP4ube2QW3mlOBJd1eA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751624739; c=relaxed/relaxed;
	bh=cQQqBmPuJGjYXvvpwjiHFMj2XowEg2vBjzCyliDZdkg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=GAEfqZYrpeDcY9ty3CBLgiKxMyBeuaQKebPDh6fMpi/CGjyFEmW5EZnKfgasex8VGECq1qMCvNeszi4AglSdl4lZ+AnMy2mo3FkNQqHEPkchnjKYyMaYcMVuHAvuOPY+u55aM/plJPSzr96p6++VDULNkH6KaWfpJQqLewYztEjuGpz1NcKVY0KVUqum4sWcb0piqQ0urAPzPiTgTZsIWA/NOMgxK4sGvWfSnLS9i/K5QILzCXMg9vGPa4HtjJOckNWlEa5mCP3wbpv+0UJvZ/fq5OVZD4E0onQWSge3CHFqWUm7tf9cyjMQiv1Oo+bo/tgKH0XQKNY043VXwoDANA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UloUa5YN; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=It8W/lKh; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UloUa5YN;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=It8W/lKh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bYVC61lsmz2xlL
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Jul 2025 20:25:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751624735;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cQQqBmPuJGjYXvvpwjiHFMj2XowEg2vBjzCyliDZdkg=;
	b=UloUa5YNw6mxL+cp01MVaT1buAkpKDdXyU+YguhUCsHVpSjPsQyZggMwQI/4tSYKil5lRZ
	sUO3hQO1vHKFXinS5cxY427CaHppBMSN/i0wpGRFteg0j4VKz1lqv2Owc9tOvRMTPiosnK
	WH1p7CL05lOdaHeYIapJ4iMzlENvA4w=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751624736;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cQQqBmPuJGjYXvvpwjiHFMj2XowEg2vBjzCyliDZdkg=;
	b=It8W/lKhJ9HAzNQ12swRICwoUHd15kEgQBha1U/2qnITZELNDvH4xsaoMfVgA34me61t8S
	95OXtMcqIOpFHLf5sbUXJCHbXPiN3r3rgEr2/nKHmkVahfCJ72dgfqOqi8/Awm7AI6Dgis
	PqgcW01GLNQ2AAnISnoUPLC3e8ni3iQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-30-KhHzBbNOM0CCn-oAslmZBQ-1; Fri, 04 Jul 2025 06:25:32 -0400
X-MC-Unique: KhHzBbNOM0CCn-oAslmZBQ-1
X-Mimecast-MFC-AGG-ID: KhHzBbNOM0CCn-oAslmZBQ_1751624731
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-451d2037f1eso4652905e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 04 Jul 2025 03:25:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751624731; x=1752229531;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cQQqBmPuJGjYXvvpwjiHFMj2XowEg2vBjzCyliDZdkg=;
        b=qQrZOwgHGHGHH04Dt1bLkYxEqigqs5VqNQ8DzC4Osn6RW4O9vtB75OemgqHF/GxOTw
         bKyfRcLE8QEDTUiUNcYNqdzSXOXFYg3VkC5skwviOaR50WoisGviPxkNX/mxhboxR977
         sLMifBrDe+GP7Lv2D8PSwAaz7Z8wCNWH7OrJ6DSABYwHiyJSSt3eLPZSJZNak12Tdilv
         eLQrMoc+qpdqBTgQTX2mIgZnsjCYYb4sPCbHmyp8v6XtUzI/PWXgX4n5qqTS/9FNPdls
         BKT/udqdStEhnHu5yzaKlZv33j8CldzHwltrAUj3geQYb5h0nQcIfIKJsczSXtgBdQTm
         akQA==
X-Forwarded-Encrypted: i=1; AJvYcCWzfAbA9DG9hblltN5/I4/uNYwDAZL3T9hcA7Xzpb3u6CfHq+iZVJ97LaEx1vhXNeYm48WeCh3jYJD/w3w=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxtxYNlIHSYjfAlFdNmiWaJMQRGIPWJzrNZjFWqJEfl9EwUgTia
	K56ELEpG+zPDIckHvhFZ969zIByU8Rh2RKO5DJ6Mx3dnYvequ6jk700nkXMXs/VEKxPRhhHXJPJ
	1hdm0vzNGJePwa51IFor0Qa24mS8lQym0qA0XFFJYFDWucEDeE82Tx4V+LB76XrLXUqw=
X-Gm-Gg: ASbGncuUds4Mny4ty7YWvOrcJVflwZOqmYIimi2fWSNzLH++fMgELd/nRrZ9b9hmOiX
	UU9VR8JmOaEAcg+Vhiz4Ik5380kiEukrn0sEAuN87v+JuprO3+wHGf1iXXtOCoVp7Pw8cAjzCj+
	U13fkGpJ9QFs5vBUQ35dZgTjeiMnhZEDN6WgVoOpAxacEa+HMUr3hezCzvMvb0oiWaJpWOyUnik
	y53auzjGmA93oAACbCE5wBkQJ9vqkw5W7ASlEAWP9+ljKGYjHBUtRVGtP1vKngyw6x6mGtPVf+j
	DYOjNjMFK/yhKauevzjbSUMOgbdjW2Gh+O5LrqtlyQeHwarbcu0Mbf2dJRRt7UH8cKQDdzbnBrJ
	YWHB7Xw==
X-Received: by 2002:a05:600c:1c19:b0:43c:f8fc:f697 with SMTP id 5b1f17b1804b1-454b4e74ba9mr16507475e9.9.1751624730930;
        Fri, 04 Jul 2025 03:25:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG2JCKcFSESlucn/AkzEEQU5f9yWEwz5OrnoWVnvSvIPUgrXnOXbfSZDcsxaTgozbAMtqKAdQ==
X-Received: by 2002:a05:600c:1c19:b0:43c:f8fc:f697 with SMTP id 5b1f17b1804b1-454b4e74ba9mr16507075e9.9.1751624730349;
        Fri, 04 Jul 2025 03:25:30 -0700 (PDT)
Received: from localhost (p200300d82f2c5500098823f9faa07232.dip0.t-ipconnect.de. [2003:d8:2f2c:5500:988:23f9:faa0:7232])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-454a9989fcesm51185055e9.16.2025.07.04.03.25.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 03:25:29 -0700 (PDT)
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
Subject: [PATCH v2 01/29] mm/balloon_compaction: we cannot have isolated pages in the balloon list
Date: Fri,  4 Jul 2025 12:24:55 +0200
Message-ID: <20250704102524.326966-2-david@redhat.com>
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
X-Mimecast-MFC-PROC-ID: 2GOWe-gkrotu8hWrTxbUwuynYWxcLyCQPrEm_8vtrz0_1751624731
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The core will set PG_isolated only after mops->isolate_page() was
called. In case of the balloon, that is where we will remove it from
the balloon list. So we cannot have isolated pages in the balloon list.

Let's drop this unnecessary check.

Acked-by: Zi Yan <ziy@nvidia.com>
Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/balloon_compaction.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/mm/balloon_compaction.c b/mm/balloon_compaction.c
index d3e00731e2628..fcb60233aa35d 100644
--- a/mm/balloon_compaction.c
+++ b/mm/balloon_compaction.c
@@ -94,12 +94,6 @@ size_t balloon_page_list_dequeue(struct balloon_dev_info *b_dev_info,
 		if (!trylock_page(page))
 			continue;
 
-		if (IS_ENABLED(CONFIG_BALLOON_COMPACTION) &&
-		    PageIsolated(page)) {
-			/* raced with isolation */
-			unlock_page(page);
-			continue;
-		}
 		balloon_page_delete(page);
 		__count_vm_event(BALLOON_DEFLATE);
 		list_add(&page->lru, pages);
-- 
2.49.0


