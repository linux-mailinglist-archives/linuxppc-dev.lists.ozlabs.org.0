Return-Path: <linuxppc-dev+bounces-9910-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20DEDAEDE13
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Jun 2025 15:04:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bW5sD0Rm3z3bsM;
	Mon, 30 Jun 2025 23:01:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751288511;
	cv=none; b=hFokQE90oSyO1b1DXQri7scSk6iD6KmY7Z1EBZ88hig8BFh09HuT5mS1FkX+r+bB3cp4F2TOnFzgawLLpd+3mZHy5GjY5jQfBLUe6Qp+SN/rRFUsK1NreB+k2cl7kz98oDGWszBrJf3HozUjExZx4RmAzNjERZQAzilG49OhmkuxQ+HUTLu6uSPgh0ousf+A59etAkivcbxkUUVaLi85OQlMD8Z4fn6fHe9Dgw+vkDgu8CtqpARWuDM/P8Ye4oxYPv6o9viBUtI7o1AZXMbfkUXczTSOAH6HF37l39e8G7b3U3RoDRHS2lkbMXkcJgb9ujGneJ9PmA8yotH+Vrwd1A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751288511; c=relaxed/relaxed;
	bh=Zjoj4LwixqS2sGyUbKyFkbKZVx00WcQgc8KQk63N+Nk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=iedoC+pFYNCNG9Z4qPhsR5HMcJhvF4T6C+AzJy8bjPr6rVPPVhMRI46CJorg9VHNDacAlkfbIs2HSe2dGSc5Me6tb4HbI0Uc0mlLfUFPJJqaEweBTTCeuVxsZh82vxz5h5Mzqf5woTOJi92MrhcR6+MKofueo6lVw+LI/kCEr8qx5cVA+5Iu73+7aah5GiykGsIITnxjEXvp3hnBnoombbHZrO/xsYi0ItgAXs23pWX3qLbAviGds1D8Hsw32bEMPC+eyMyxh9WB6qdWFFUkmlbJTPA04J/GS+ze6Gq3EM+rddwzjbUxzgEttjJKakULDLt1W6ia2xr0c9cZQtw2zg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dAAiiwhv; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dAAiiwhv; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dAAiiwhv;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dAAiiwhv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bW5sC15H6z3bsL
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Jun 2025 23:01:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751288507;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Zjoj4LwixqS2sGyUbKyFkbKZVx00WcQgc8KQk63N+Nk=;
	b=dAAiiwhv/FYXu+CuPxImHfDUWzciPWEUAzvdp5V6kTw+ML966enuw2oJ8aOIhO0cks/p5y
	9ikKFmT86y4mW9F4LbvGy2N0ZsVJLUgwewFJvjm2hQL6k+hhl9IPHfuk+iizTjeSUz5Gj5
	xGFge7XPCeEDoMZAH69jMxN/1s8zweg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751288507;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Zjoj4LwixqS2sGyUbKyFkbKZVx00WcQgc8KQk63N+Nk=;
	b=dAAiiwhv/FYXu+CuPxImHfDUWzciPWEUAzvdp5V6kTw+ML966enuw2oJ8aOIhO0cks/p5y
	9ikKFmT86y4mW9F4LbvGy2N0ZsVJLUgwewFJvjm2hQL6k+hhl9IPHfuk+iizTjeSUz5Gj5
	xGFge7XPCeEDoMZAH69jMxN/1s8zweg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-361-4TxgtIuMNhSUds_5QsBX9A-1; Mon, 30 Jun 2025 09:01:38 -0400
X-MC-Unique: 4TxgtIuMNhSUds_5QsBX9A-1
X-Mimecast-MFC-AGG-ID: 4TxgtIuMNhSUds_5QsBX9A_1751288497
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a50816ccc6so1397378f8f.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Jun 2025 06:01:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751288497; x=1751893297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zjoj4LwixqS2sGyUbKyFkbKZVx00WcQgc8KQk63N+Nk=;
        b=jR5TxRkdHOxmsTbMW3VlJRJz/UGZEd7YiX6JVdvDomf4+zq5C9ecJD4aPFMG4G9Pc1
         8VZffhevXTG8bZhYqfssRqdlycwwD84HvuCHqu6Ui1i9J2jHhAOheNxkwPfTsjgIGYjb
         hIMsXKh3C92DupQr4uopw4INc20ZZoj/SfLR95VEjP5zFkxw4JOFys8equSep6G8zRyM
         TFrFMZy/625mls9GXGTdwmB5UtBJbEQ8z5pdfr4crpv/KNub6xg16coPdMTzWCQEX4gP
         5wX+eYOeTTy2FRwFdSelaKJWC+vZXYbHJgFuz6IapC35d+0bb8r0I0qe11Jmro4wURA3
         il3A==
X-Forwarded-Encrypted: i=1; AJvYcCWUeFKWHbeBdYSKRWNVekgWcWNjyasANqlUeeamcmLOMCW+f+V/hOijVTfilro8hmt75Op60PwXhG2SnAg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwyDlSFfV6UhhjiVvGWn779n6+Rb6MkZRz2aUGwI/Xd5H4lyx2h
	gtOikcyADelmcQJa51SIWcPNVp2sYxGCokq8eXbQU9mUtm3WbB3f9z4iWncYfG6FjUtB/OrgeHj
	9NIxy22jjvEE8iLIFPuacSx+CgThBtEDBEUTPorw7SZIg+flJbEYkViu+WkcJ1TVDv+4=
X-Gm-Gg: ASbGncu3eL0Gihz0dC47fzWnd+UNerWu/X3kqRyDERZbV6o/ZtqFMOLBgyqXbtshj1L
	TqRgZtkI/c8aLJuIkV4vGA2DzU3WWHmFPLstIAr8ggkm1UOzpfN2e9aO6cb/H56IJg5jbpC0g7u
	lLB1rahWRYd/SbgAl+UkCvXiSfKYv3z+NUj/EXADENE35fQpzkvnRuoZ0Qmzst6by0WTeacYVsw
	l6A0KNjh+yl//l4JH15r/t+kFImJZoY1jCN6LIDw6Oar2iA6MHs90zxH3N31hVKHWV5/rri6PZv
	HrSToAWqPXF2+gLetWBO7tQXMFrluBK3l6GaHQt1UeNbkfnyahlYBKzLQ/FdqMWKwmUrjgQMDL1
	lawYpnsw=
X-Received: by 2002:a05:6000:41f2:b0:3a4:efc0:c90b with SMTP id ffacd0b85a97d-3a8f482bd78mr11299184f8f.15.1751288496457;
        Mon, 30 Jun 2025 06:01:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFUx6MnmvL38m+UjxsSHRmCnwJ9csff/jtPLhL/sKkb+ObakA6KxkyBM5ParmF0iwuWxCWprQ==
X-Received: by 2002:a05:6000:41f2:b0:3a4:efc0:c90b with SMTP id ffacd0b85a97d-3a8f482bd78mr11299087f8f.15.1751288495708;
        Mon, 30 Jun 2025 06:01:35 -0700 (PDT)
Received: from localhost (p200300d82f40b30053f7d260aff47256.dip0.t-ipconnect.de. [2003:d8:2f40:b300:53f7:d260:aff4:7256])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3ac6ee0d0b9sm4643102f8f.18.2025.06.30.06.01.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 06:01:35 -0700 (PDT)
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
Subject: [PATCH v1 27/29] docs/mm: convert from "Non-LRU page migration" to "movable_ops page migration"
Date: Mon, 30 Jun 2025 15:00:08 +0200
Message-ID: <20250630130011.330477-28-david@redhat.com>
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
X-Mimecast-MFC-PROC-ID: PlN3W-PWXbiSD5qe0gPZ64BnAfKp9k48gJIvfkmycvg_1751288497
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Let's bring the docs up-to-date.

Reviewed-by: Zi Yan <ziy@nvidia.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 Documentation/mm/page_migration.rst | 39 ++++++++++++++++++++---------
 1 file changed, 27 insertions(+), 12 deletions(-)

diff --git a/Documentation/mm/page_migration.rst b/Documentation/mm/page_migration.rst
index 519b35a4caf5b..d611bc21920d7 100644
--- a/Documentation/mm/page_migration.rst
+++ b/Documentation/mm/page_migration.rst
@@ -146,18 +146,33 @@ Steps:
 18. The new page is moved to the LRU and can be scanned by the swapper,
     etc. again.
 
-Non-LRU page migration
-======================
-
-Although migration originally aimed for reducing the latency of memory
-accesses for NUMA, compaction also uses migration to create high-order
-pages.  For compaction purposes, it is also useful to be able to move
-non-LRU pages, such as zsmalloc and virtio-balloon pages.
-
-If a driver wants to make its pages movable, it should define a struct
-movable_operations.  It then needs to call __SetPageMovable() on each
-page that it may be able to move.  This uses the ``page->mapping`` field,
-so this field is not available for the driver to use for other purposes.
+movable_ops page migration
+==========================
+
+Selected typed, non-folio pages (e.g., pages inflated in a memory balloon,
+zsmalloc pages) can be migrated using the movable_ops migration framework.
+
+The "struct movable_operations" provide callbacks specific to a page type
+for isolating, migrating and un-isolating (putback) these pages.
+
+Once a page is indicated as having movable_ops, that condition must not
+change until the page was freed back to the buddy. This includes not
+changing/clearing the page type and not changing/clearing the
+PG_movable_ops page flag.
+
+Arbitrary drivers cannot currently make use of this framework, as it
+requires:
+
+(a) a page type
+(b) indicating them as possibly having movable_ops in page_has_movable_ops()
+    based on the page type
+(c) returning the movable_ops from page_has_movable_ops() based on the page
+    type
+(d) not reusing the PG_movable_ops and PG_movable_ops_isolated page flags
+    for other purposes
+
+For example, balloon drivers can make use of this framework through the
+balloon-compaction infrastructure residing in the core kernel.
 
 Monitoring Migration
 =====================
-- 
2.49.0


