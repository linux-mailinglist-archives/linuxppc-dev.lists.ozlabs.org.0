Return-Path: <linuxppc-dev+bounces-10093-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB6AAF9005
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Jul 2025 12:26:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bYVCK2MHrz30Vb;
	Fri,  4 Jul 2025 20:25:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751624749;
	cv=none; b=UAonw156ToZza9pHqgGdMxBN5cxQtupV6+kIGj1QNvTe/T1JGkAOZ6KV+auPRLB4ElyRXS6J3bpXDhMdspKPwEmi8WdwM0myiUQC3M8spXwlpV5iKtd28YeaaHABz4CIKdatzAHVnU4KBK2CmqVUJ3nQLYvUNbWL41GmFTqlPBdUQkXbLEHpcwV367/oNyBUsUBK61axnd6rbU2a2aKPVIJw28+T7FPP1ea/6QeEkH2JCZqiRUbITiHieaa61jUq3xOsJLV8lKCJ3JgcoeHxqAhs/kxyFXiBiiX03z/ydsSDtetoVNSJ4W89zJMBa5dK8guEZLJOv8OUoNb2Jp61GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751624749; c=relaxed/relaxed;
	bh=+4vricv2e71NWYYMzs8BIQr/CRgQSzBMTqlFovEI9fk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=RBAD45rmLcwsub4SpQS9jgtkjJVop1vg6mXq/ND59+NvVBmeJxouVPOXXHXiU4brcLiV7CxL3lfbHWoTVmpcd08lCzHtjJbB3X+YXSlmIvReIbTpRPExvM8QvU28IIB86/ozuI1DMP1CuuPxGSZr3FZzfO3Hy162MGlMgJ4B6xXdCIB+UzeR7CLhrgwSyzG7VS6JYlL6FRlydXErVZu4J+a9e3/mAGos2Gg0ceUZGHc/HIvXQvA63KpuCyOdv9Nz1zQcwhGRIvXjmHU6JMmbhoo88R1bM6SYxT/htY4yj7+WzJ1FKSIZ9tchRNDB14iB5Ippv1ImUA+11PQDSgJMPA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=a11tLrq9; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=a11tLrq9; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=a11tLrq9;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=a11tLrq9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bYVCJ4Pkxz30Wg
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Jul 2025 20:25:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751624746;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+4vricv2e71NWYYMzs8BIQr/CRgQSzBMTqlFovEI9fk=;
	b=a11tLrq9SQfZXfxzEMnb9UoI1ViOgh2MsqFnUKIMshemVFVAeCSd6D67tprG5B415ysYDD
	D7Zq3n02gwjLTbaWMP/9mHww08F4Cw82EbLt2fWJKsvo8Tcsr+Ul561wjY5yEwXrgqPKN7
	0qYmqTSwvE9uDkM6ZO53aVIviu2lsjw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751624746;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+4vricv2e71NWYYMzs8BIQr/CRgQSzBMTqlFovEI9fk=;
	b=a11tLrq9SQfZXfxzEMnb9UoI1ViOgh2MsqFnUKIMshemVFVAeCSd6D67tprG5B415ysYDD
	D7Zq3n02gwjLTbaWMP/9mHww08F4Cw82EbLt2fWJKsvo8Tcsr+Ul561wjY5yEwXrgqPKN7
	0qYmqTSwvE9uDkM6ZO53aVIviu2lsjw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-314-eBNB4oDoPSepS4MdWw4CKg-1; Fri, 04 Jul 2025 06:25:44 -0400
X-MC-Unique: eBNB4oDoPSepS4MdWw4CKg-1
X-Mimecast-MFC-AGG-ID: eBNB4oDoPSepS4MdWw4CKg_1751624744
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a58939191eso293917f8f.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 04 Jul 2025 03:25:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751624743; x=1752229543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+4vricv2e71NWYYMzs8BIQr/CRgQSzBMTqlFovEI9fk=;
        b=cfePKunXovnyXK9Sp3rmW4IfN5NWmaSW2hv70/+xfN4voaOIGjCKSHEWwqyUMYPfMX
         8gbr325jeXq91ipUw7ODwNjxIYt/ELUQ6X2CLV+1lAlupF4IgUmxjOgitDnwn80B8f7X
         ktedhAZWYGr1VAp5w7THUaiy4umj6BT/Sny8ekDMie3SbjaxomK2FNTGJO77/+ZrS0yI
         YDwYKrbdI08s2DlVqwo5OBG34sE6nnGyPX4eBarWQG3eQ1qgQInUyfyIH33yV7QrnSNv
         TYDsDCLq/iYHyrmO/iaaYCx1hoTgSv31JtzaL/G1AC9NCnxcDgA2u8ioFQkPMH6CEQe4
         78PA==
X-Forwarded-Encrypted: i=1; AJvYcCW8ERLZVIjnSwWxUvGZiZHVVr5gLE3wWWaozOdLtsk97906QogxtmwMFwXmaxEIIAHtSDv4e5L//erld8E=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwBOovXrj08zLZjO5ObMABwTDdrm/NpWUFZW59VTXgFR1bzF+Em
	NOuLAs8gCn1Cbu44N16Gbm+nifU/FLfBa3HQlOuJ26EQwe6PyfFOhX6zYHkHop+8mcZBjg8Bnu8
	WE8jFZrvrcc9YXOG0o9AtsMOE2n1K/Q7IY6013tRAhiGDX4GbpYG4xFcEPM4pNql9RX8=
X-Gm-Gg: ASbGnctTC1rE9zDe3DyIlQ8FEoS2YQKCc1LdyhLXIXsZ9MywvHn28DtMwG9Qdcy+rr4
	a7tjLNIABdgDsg1OjBAUdJcGztoUI5491zw12rTeIeFXzq04MEC4RL6JoMV6AugDQhrx7qHJ2UL
	55x0JFua+CciRFqsk73umWuIzi29f0y4KpKrzpY3v75ZlvpIMQRbZ+R7i9xEk3qedPCnjna4aqv
	QylHj2I7KN+1TBzkcyvt79wKV5JvaXDulqMl9JOFlVrdk9PxKeFNGdElbfkfpBUf6thAZZmKuZo
	svXSSxHwTSL6kesLGPdgF0GYF42fB9N8ORM0SgO9OTfmk7Yot2zQf/GIoaMA8CR85cLEWDnkfQL
	ef10d2A==
X-Received: by 2002:a05:6000:25e7:b0:3a5:2d42:aa17 with SMTP id ffacd0b85a97d-3b4964ded13mr1424145f8f.31.1751624743501;
        Fri, 04 Jul 2025 03:25:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHFw2GicaPInsB28PjQGll7qbBWs9+u0wQOGd0rdAKVxiB08VA9zODFfDmMz6Eob0+nsp252Q==
X-Received: by 2002:a05:6000:25e7:b0:3a5:2d42:aa17 with SMTP id ffacd0b85a97d-3b4964ded13mr1424048f8f.31.1751624741867;
        Fri, 04 Jul 2025 03:25:41 -0700 (PDT)
Received: from localhost (p200300d82f2c5500098823f9faa07232.dip0.t-ipconnect.de. [2003:d8:2f2c:5500:988:23f9:faa0:7232])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b47225a2dcsm2114225f8f.71.2025.07.04.03.25.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 03:25:40 -0700 (PDT)
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
Subject: [PATCH v2 05/29] mm/balloon_compaction: make PageOffline sticky until the page is freed
Date: Fri,  4 Jul 2025 12:24:59 +0200
Message-ID: <20250704102524.326966-6-david@redhat.com>
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
X-Mimecast-MFC-PROC-ID: zzI1hpInkGPuM2piNCkB_oqH-m9a5welzRz3U0NTnYo_1751624744
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Let the page freeing code handle clearing the page type. Being able to
identify balloon pages until actually freed is a requirement for
upcoming movable_ops migration changes.

Acked-by: Zi Yan <ziy@nvidia.com>
Acked-by: Harry Yoo <harry.yoo@oracle.com>
Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/balloon_compaction.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/balloon_compaction.h b/include/linux/balloon_compaction.h
index b9f19da37b089..bfc6e50bd004b 100644
--- a/include/linux/balloon_compaction.h
+++ b/include/linux/balloon_compaction.h
@@ -140,7 +140,7 @@ static inline void balloon_page_finalize(struct page *page)
 		__ClearPageMovable(page);
 		set_page_private(page, 0);
 	}
-	__ClearPageOffline(page);
+	/* PageOffline is sticky until the page is freed to the buddy. */
 }
 
 /*
-- 
2.49.0


