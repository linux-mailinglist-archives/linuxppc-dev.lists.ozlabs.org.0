Return-Path: <linuxppc-dev+bounces-10113-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DE757AF9040
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Jul 2025 12:28:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bYVDV6tRvz3btR;
	Fri,  4 Jul 2025 20:26:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751624810;
	cv=none; b=YVf1kN5FRlkR9mt4giOzHrkYuS8rVEqJJryXXKbaXFyv94fmRRkT48MFIqMGB060L7fXmK6acFS4sVQL6Fd03CfBn+LltoHp7V/iIS4Cq0j1RV7biHqrD74lnuNcLlSERG3+SvzjRGCmrz55qMampVkN6KLQLsb92i+SwDLIsBQmcUhOvDL2xe3lJovPmjD4TnllcTC7dfQVo3p+MSjphf6FQ5nw5xVtBQfWkP5szEyHZ42sl9S0dBXHNztMRqwjtNDD1x1Wn+G92PKWwpQshqxYgtQZo9xvpLs+niCE9DgYmz3Dm9RRJNvUSP7Zt5NbM6SElRv48gn1q3yL7jdEnw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751624810; c=relaxed/relaxed;
	bh=egdaFmDJBU0TtndNYiZ6nPcRML2Mxu7RUt3KjMyWE24=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=gLLieetA0tRE44PIpyV21TzkInI8IjzhO9J67DMEAdw3M5R2/FoSDoEwbh58qrNqyudp5JVSZ97S0wP8o8mNfGH85U+6+/YGHKHLooA9XlFJmDtV4js154e4t0+1YxgiypN4zpD/11HjxI8E1XceIS03iakLwz7ryhML+T05Oe5961alu5v0+GNUNZFDcoHlSYoJ1IfJoHHw+p5FlQxyTawrPxmTZX120qXgrRS3qMjiQZjxYYnsu/SEDBFM0Ip/vdIpopAJ8NzO9/vfcMiu5xNa447HfMEd/I8WmF0MjwcbwyJ0VOi1LoszCO/RiiY7avg65tp5H+3CimaayjmqtA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DyFY+FBR; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DyFY+FBR; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DyFY+FBR;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DyFY+FBR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bYVDV0rVtz30Wg
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Jul 2025 20:26:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751624807;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=egdaFmDJBU0TtndNYiZ6nPcRML2Mxu7RUt3KjMyWE24=;
	b=DyFY+FBRt7LaVRd5nCvNOGjvndB/R2SKeF3PuRagNlRwyVPSDnK0p5O+ai1MDryvaJgDGT
	IAzX6D3qJQCyF4t9xTGzD4InC9lVs44yLiVotOWytKxCdFiLUYRXDids+oAFcrvGp4HW2Y
	aCQHWQ2LduVVQQ/oy136YA6TwqmtjgQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751624807;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=egdaFmDJBU0TtndNYiZ6nPcRML2Mxu7RUt3KjMyWE24=;
	b=DyFY+FBRt7LaVRd5nCvNOGjvndB/R2SKeF3PuRagNlRwyVPSDnK0p5O+ai1MDryvaJgDGT
	IAzX6D3qJQCyF4t9xTGzD4InC9lVs44yLiVotOWytKxCdFiLUYRXDids+oAFcrvGp4HW2Y
	aCQHWQ2LduVVQQ/oy136YA6TwqmtjgQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-374-PPKMepmNMhGdjRRbNeZeCw-1; Fri, 04 Jul 2025 06:26:46 -0400
X-MC-Unique: PPKMepmNMhGdjRRbNeZeCw-1
X-Mimecast-MFC-AGG-ID: PPKMepmNMhGdjRRbNeZeCw_1751624805
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a52bfda108so375425f8f.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 04 Jul 2025 03:26:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751624805; x=1752229605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=egdaFmDJBU0TtndNYiZ6nPcRML2Mxu7RUt3KjMyWE24=;
        b=EkWH/cekRLoZEUHzVAsrd+OKZmKeXtwGuVkAUq7p/qOSXE1FVTa7ltkAuXtA9lDO2O
         dLgebL4f/6phMi/Z4iVilbffvhqSuDUG/riuwQafqXx6CSr2+RuTPXZhyDZ0KClnr2lK
         LfORTVVph8oDGNDy7XPUQOFvcSMJ1rD9sZsoQz2KlBRs6/b7Kp652b4uH6OnMyBeC91X
         Op9E3ktLw+wtO9aVAnnDchUISc0GR9OopBynVHY4MKE94vJQPodFk8uhg5gZlM78ZpM1
         EU5mdneaWKZbJgLAmm9zhRJ9AzIG0wu56U44q+m7APLG3HJC/0EbooYBsMIOo+r54zN5
         iA+A==
X-Forwarded-Encrypted: i=1; AJvYcCU0blCW3YA+iX4PikP2rRDl//2F6+Q1RGrrtmBSxbrsIpgDh1HHQhBye9O9bRPwPoT0aYvrAYKWfQN9rWw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzR5o8Sow6wGQXgSyd0DXJcX8BUUTmEmviu6ImeLMEiumVUhcZx
	GeEXbGfnrceqT8+1U8R1V43ctBtQ7f+C2Ub+G1PB6ez0rcr8GsWt8/iaROZjOkc0SUABP1BKbT7
	vlvQHTtM8biWcZmw9tQKe4bfl4LQy8nBXVPC6tSjhELhN5XOKhDIhfFqzzKeh+FiMGjw=
X-Gm-Gg: ASbGncuMJ1Ac/2brrwoUqVNl+vHHJq4GfcQG+XfImgf2jUVzeSJZJT+9lJCdfoawGw0
	G0zJ9qbeBAyRbdDcVdBdmWvCdfe2K9ml8dxpt/cv4FC+8+l0O2898jgdXW5/w4IkeCT6BKEkDZm
	rMATas2x5M5LVytv77z1m+P10+PIHqeblkmeIsorKd1etBqrwwuUe2vHqZTQmSINOy1DcQA8DYw
	m8U0KCXsjVWGfx4VFNZyfYO7SVNJMxFWnCG8OjurB6wqSM/4qv/7GYsqGGypwz+q4+j4/cG0JLC
	nRy6IK2mfuCMtbNBcx6EQhBmV7SVow7M9Povo4OFO0Klhn9W4ApzGX4wRLv0jtEzfEYlnoik+sa
	E/tflfg==
X-Received: by 2002:a05:6000:41eb:b0:3b3:a6c2:1a10 with SMTP id ffacd0b85a97d-3b4964eb8c5mr1818986f8f.12.1751624805282;
        Fri, 04 Jul 2025 03:26:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEReO138rar0bBMYwWljLx+rr/cG2x6KKHBHNt6saeQjtIgYNeV27GRLz6HCnNXsrL9yURvTg==
X-Received: by 2002:a05:6000:41eb:b0:3b3:a6c2:1a10 with SMTP id ffacd0b85a97d-3b4964eb8c5mr1818905f8f.12.1751624804727;
        Fri, 04 Jul 2025 03:26:44 -0700 (PDT)
Received: from localhost (p200300d82f2c5500098823f9faa07232.dip0.t-ipconnect.de. [2003:d8:2f2c:5500:988:23f9:faa0:7232])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b47285c90esm2152102f8f.91.2025.07.04.03.26.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 03:26:44 -0700 (PDT)
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
Subject: [PATCH v2 27/29] docs/mm: convert from "Non-LRU page migration" to "movable_ops page migration"
Date: Fri,  4 Jul 2025 12:25:21 +0200
Message-ID: <20250704102524.326966-28-david@redhat.com>
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
X-Mimecast-MFC-PROC-ID: sGrCpjTrAbbu8TU_ngiHhN8CyIKkqm5Qlt13snIZo-U_1751624805
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
Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Reviewed-by: Harry Yoo <harry.yoo@oracle.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 Documentation/mm/page_migration.rst | 39 ++++++++++++++++++++---------
 1 file changed, 27 insertions(+), 12 deletions(-)

diff --git a/Documentation/mm/page_migration.rst b/Documentation/mm/page_migration.rst
index 519b35a4caf5b..34602b254aa63 100644
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
+(c) returning the movable_ops from page_movable_ops() based on the page
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


