Return-Path: <linuxppc-dev+bounces-9484-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E27AADF475
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jun 2025 19:43:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bMrdX5jpmz3by2;
	Thu, 19 Jun 2025 03:41:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750268496;
	cv=none; b=oTYy50fYdSiFO7PZl3i+mStJhtU59IwZPxroG/CswpQQ1uOHNgKxgNrMsYj7GLm4+4rYEiQJcKm2VAYC/pOmqdBeB2tf9SD7jbPUKJWAHLeSXP6v8+oUE9ZnpJmE+74rIxnxJNrxUOiwk3EP14HBzFG0P/1MzwbXerXGm8xFHjD2rSttP5tNo2rUqoFwIu7KbhL5ND6yg8Pvo7zp24o86BKwuggBORJlLg/ObnVeaI+OKUdZeOuABZ4JU/KvYa7cHGBkeYe8FsRWsTaXf1pngkHMbZw+X1eCGSeVgqrR7Y1iPxGKcaEvxv5TKqtM2Jt4RY4WsD2Gq8ajlNW3A+8qCw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750268496; c=relaxed/relaxed;
	bh=OmfdwaP0f5XUY3WcVBI8N3swmSiQtYBlwUFmuX0ZYxw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=BpNx/rZyfJ97HaLckQ2jpK+J3qjzGXmk0GHTmYgKYB38RoC9TOgxijelbvU4RCqGrtnN2ZX6kRyrLgpkiPq+TsmSi17NZzc2FtYppzC/ivi1A1ihFhnIJfvRD+CVIk6e6MFtgNyKM/RE6q4KvGneJDDDgAqcRI0VEDvEX72IHkZDbHbUL7oZYFRhJke5FqSEBN13A3wDuowG454AM3SmgW+hypjYu/IIpTXuT3fAKIYwsWDhfvLKP4tjqD4GD2+rmnKt8TvIgNko/vVBRckJViaoPvuVuW2AyCYBDLJX3pCd9BjSR83JDHNNsIZxuGG+x/MRd0mnzj06x9C8cpNYnw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=blULzw/Y; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=blULzw/Y; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=blULzw/Y;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=blULzw/Y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bMrdW58nCz3bwp
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Jun 2025 03:41:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750268493;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OmfdwaP0f5XUY3WcVBI8N3swmSiQtYBlwUFmuX0ZYxw=;
	b=blULzw/YuzhtMaq/MzAOwHI00YuPbBMeXOUAO/2a0f/5vp8pl1Q6TleaTPJ9/clGwv+R7Q
	pFqwGFPrA+jlzbpDao+tFbtH/xg7RQKiZvwxNIi1knbbAdCCiWmd4WXyfm6ww56aWJiEqd
	SmGzMHmXebCRT3R8Dhaf6dG6oC9Lkeg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750268493;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OmfdwaP0f5XUY3WcVBI8N3swmSiQtYBlwUFmuX0ZYxw=;
	b=blULzw/YuzhtMaq/MzAOwHI00YuPbBMeXOUAO/2a0f/5vp8pl1Q6TleaTPJ9/clGwv+R7Q
	pFqwGFPrA+jlzbpDao+tFbtH/xg7RQKiZvwxNIi1knbbAdCCiWmd4WXyfm6ww56aWJiEqd
	SmGzMHmXebCRT3R8Dhaf6dG6oC9Lkeg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-518-KNOimY7TNwScTLOtj5Bq4A-1; Wed, 18 Jun 2025 13:41:32 -0400
X-MC-Unique: KNOimY7TNwScTLOtj5Bq4A-1
X-Mimecast-MFC-AGG-ID: KNOimY7TNwScTLOtj5Bq4A_1750268491
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a4f7f1b932so4391470f8f.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jun 2025 10:41:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750268491; x=1750873291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OmfdwaP0f5XUY3WcVBI8N3swmSiQtYBlwUFmuX0ZYxw=;
        b=LxvG4SnURpp3UNzs+1vaEPADoJKSrK2OO5D1wMl6CSNgcx68qhTgCNiQUW8RFSc1py
         6mJQa9/Or/3Dxvam8zR0wKbVEi+tAghNTYP4EAKlKl+p3V3aKfY5rlP37lJou+j3NMGc
         3koq1ZmC6RJWrbTKKIz8TlPKUR6MREjRSyYq6UJIpl+D9m4wYwf5SoU5Ykop0ZpHTk59
         VYRm6NJU3LZzED+Yx4lV6injxTfY3pr3WHQ34wTq5Uk93Lx5lsVuARm3smBqBRKxtQT4
         TJiOSuckziAOkmb11/IoeW5MGDlNaNYPOzrePNLwVADhQFZFDmUb7VjnJm8LmWjYYp7Q
         BQ7w==
X-Forwarded-Encrypted: i=1; AJvYcCVEbV+NQ7ulTt5H9ojpir3BP6//yiqQNxJGdrRNWedAYA6Uzsx15lwnoaAp5fTKitoD5vr7947ovYXcXdQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxNZ64KIqx0IrQHyKv6F5ZJw+CfkdWSNFzDxCr/P76msO+g61F4
	E/r7zT5wvbsAfd0+7c8KQoAROj/Hgk4aQCsPM3xfNGgYmpCPzDNqOrDtPch3kV0lKWo1VGOpRhI
	X6fsYcHuo3Rf3lkWbOEpjK8W0CTxdhYnl/ktWNOiEwXhHF7EjAOjvNgJaozd4P9hXI70=
X-Gm-Gg: ASbGnct69J12ZWAJzbFpt14jh07RnaCMi4Mv3K3ZxsTjgx36lRY5mEP4t1gqARRD4OH
	qEgiqx48aOLyLUIO7A2d5LTZfz8UrQ/ST0lxJfKX5BXM4MXHK2uG70Mkm666I0mTVJdFPvF7gDn
	IfKt9qblPN98sVk/1r9oB0nPscW5BFh67ZxwCsURqiujF2sbTeurrAwg/hzEwjU+OfWHjuWBXRS
	oasMLzk+xlMCx9Jp11CL44bO1/U4RP7RhPSiX34dGZ0TAs2GgobxANIvazoC2sdVPwr9X4uwOFd
	SrzWzLlSWLjyOBR/4farOetMCJkhsstD7D2rxigndl+aYLFjb3stE54/U8Y4ZqqEEE1Fu6KSuDW
	4xZ6dWw==
X-Received: by 2002:a05:6000:178b:b0:3a5:21c8:af31 with SMTP id ffacd0b85a97d-3a5723721bdmr15240214f8f.16.1750268490810;
        Wed, 18 Jun 2025 10:41:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHAZhpZh4slqbXf6Y+7KOO1SPenqI87LsZpqVnArN4AUioCPUgU259IOTbkkNjhv6BPhqHLFQ==
X-Received: by 2002:a05:6000:178b:b0:3a5:21c8:af31 with SMTP id ffacd0b85a97d-3a5723721bdmr15240182f8f.16.1750268490320;
        Wed, 18 Jun 2025 10:41:30 -0700 (PDT)
Received: from localhost (p200300d82f2d2400405203b5fff94ed0.dip0.t-ipconnect.de. [2003:d8:2f2d:2400:4052:3b5:fff9:4ed0])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a568b2f80asm17518051f8f.78.2025.06.18.10.41.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 10:41:29 -0700 (PDT)
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
Subject: [PATCH RFC 27/29] docs/mm: convert from "Non-LRU page migration" to "movable_ops page migration"
Date: Wed, 18 Jun 2025 19:40:10 +0200
Message-ID: <20250618174014.1168640-28-david@redhat.com>
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
X-Mimecast-MFC-PROC-ID: l23cBcgxKV3fe4zCWHdDSBophLlc-pn4KkUuJcIi-Pg_1750268491
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Let's bring the docs up-to-date.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 Documentation/mm/page_migration.rst | 39 ++++++++++++++++++++---------
 1 file changed, 27 insertions(+), 12 deletions(-)

diff --git a/Documentation/mm/page_migration.rst b/Documentation/mm/page_migration.rst
index 519b35a4caf5b..a448e95e0a98e 100644
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
+balloon-compaction framework residing in the core kernel.
 
 Monitoring Migration
 =====================
-- 
2.49.0


