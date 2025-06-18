Return-Path: <linuxppc-dev+bounces-9458-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 45CF7ADF429
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jun 2025 19:40:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bMrcD4NZBz30VM;
	Thu, 19 Jun 2025 03:40:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750268428;
	cv=none; b=aOI5B3ChMr33fqqENlvr2zmGPN43XJJ13+PBbyv4phKY/w3+VGXh9EehNbUozKLSQWOwOea7/mF2gPdZ6n9fJzHaQkI7P7Bk28CuYjXlxxDIZXZ0DpSuhVKMpNPJRi8nSYEqAJ7YMy/nu/a5n+luBenf/KAeUZnJeeOdz4P5XNyr9E2zbYKY0ZqLfr2gG9MbdRLzwTolJfow0VFFgMxkwUtT/AdgbDnN9JkXxjjFjUQ5nbybEohrAF4a0o0H51AcpKiUpSUv2Gl9eeCZJRpeaZDuZ4AgkEfCSkGpSGS0+YEy43ZTdFKhB2xUiKT6YbBUkYN+JS6H75ETmRMnKxuyzg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750268428; c=relaxed/relaxed;
	bh=ztkVXhL49uhBZn35+Dz91j/1BkEFGTeWr88qG2zBn1I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=i6g5Vk+8xb72b1NjvD9Z7/CFM3Ym+D6TieNWh0Fu89CUiQme36ZTBQ5Wv9NJEv7LKKrvgbySBV05THOnKveB6qox/19XIpeqR7qzwJ0toU2Xf4LMzV4OCJPGsV5Dv3XtBt/rJFWxYKQkI09hEbH0JJnnh8tRd9VgvrfSVeAcD7RPAiTC/N5h12huAaa2FdQ1jCznctifYbXDeN5jN7CYF4vIZ543mxkU2pwjc64S4omxFytgLqkRzlF+bqyzJphbTdFGQM+M2kI97IMDtKHPJ0aZhrDeICQdmIEEjVse4WBmHZOcgM8tBoiWFzQOE3AtzHhVI+2912vuLY6wWwiGZg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OkLRqaVf; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cIOf8sgz; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OkLRqaVf;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cIOf8sgz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bMrcC3kVRz2ym2
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Jun 2025 03:40:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750268424;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ztkVXhL49uhBZn35+Dz91j/1BkEFGTeWr88qG2zBn1I=;
	b=OkLRqaVfuaH/gnB18Us8Mn6Vv/AzwuMqD1CGlGpdtkVgO5OQd/dl/wFGOnAvt9NmrmScKO
	faoQndW4LfUCe8G93g1qzZ8gMLS4fYuKZ4NkRq7+u3u78J8A2Zm52/+1Ze+0lhxstarlaB
	Ac4uUyv/+Yh0o+VYHZXonlD8w2nacEA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750268425;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ztkVXhL49uhBZn35+Dz91j/1BkEFGTeWr88qG2zBn1I=;
	b=cIOf8sgz9EyilP7MoMyuvlwpw4eXWrE53RzIOkHjjdZeF8048DVPW2t/D8U6SfkkZYiSd3
	sJ7w3zVvlaoyYFlIAU3fM7F+hQsrUhcBzOc1z7dyXLzF7ERsL2upPRQVADgLsv3dX1Biaq
	hriZ3ZdRvPIclu4kjlH66jvaxu3zNXI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-635-5IbPbgUQP86EAfG0WGDxLg-1; Wed, 18 Jun 2025 13:40:21 -0400
X-MC-Unique: 5IbPbgUQP86EAfG0WGDxLg-1
X-Mimecast-MFC-AGG-ID: 5IbPbgUQP86EAfG0WGDxLg_1750268420
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a5780e8137so530661f8f.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jun 2025 10:40:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750268420; x=1750873220;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ztkVXhL49uhBZn35+Dz91j/1BkEFGTeWr88qG2zBn1I=;
        b=ZFcgV2DBTwYMk+wZi9Rf7cHW7X/6AVE9igtmdeH9ox02g9WOaqxzRJ9fvr1Y1H99wC
         rDw9UHzPZalAJ6iNB8TXn9LUnvs/O05fAeObkXmfWqkilRYuKXu7FtjW5AN78jlSuZZh
         FX88+5YCnAV/V2ck0hIsitDXj7K8oUFaugmMzE0oE7lS5O0/6onxbYI8O/qmY4VVq+ln
         ORFyamLZu0JGjRPhGzexGs63wRoX4K5HW+LzURgPjGdF9/G7okcQq+Isg7WwJji5do2T
         W9yIoHjtVIK9NauSsdN5GOj2DIEA0IYbB3roNDymK9Q1y6ZXxbR5ywXbTSHEsTCnRaMv
         z/LA==
X-Forwarded-Encrypted: i=1; AJvYcCV6iB+mmp1tDi/GjZXJzVJCYeO1hXeLtx2BITlKdBphOWHL4HXaaRSihCboNlTSMpdme97NnY0PsYk/vq0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzA2Esc6NFxYq3NeeSm7LyFYFKfPIjogvHqGwXwPI1yp/00kPaS
	YWTj0d8xC2WY/e/tBhzeKPAG6BnoFr9xJjQfvepkLDueJ4OorUS6NUenXqhTH8FV3MBrJsdwuJ1
	ZyoF0PLcuFDJPG7vtn8xm8svSXYnyCRkVJujVp6uwBBwpGRqsmOyQqVMb3G9kzndGdMw=
X-Gm-Gg: ASbGncsyyg+H09yumaX1KVfne/2RF4OhJDmXsSE5+MO8S//DkrfIEhOtiaBQ5ykNKNr
	XEXi+lyS7IBha2vbm+HD+ybs9ktSaD0OTP9cpO1hw5u3GtE+vi+C2wT6Fo2Yr7w3nOnej4SZR/b
	te8LsOtZjTdNaihC4qXuB9+BG639ssDpb2DlIzLQEZbUjVhuDo9rkH/fMLh4MrNvW0XX1n7mMcL
	b2tSNr981KqWKMNXZE/gLBawswTI9ia/Bbgvxwq+FnTJeDjxPfFJMrxTD0siISqLcBsMs9DBAbr
	NhyfEfpkcwKD7hgfRseqTPsmT2gN7PSdYquZ4TX590sa+oxYymziBfKQkfw2kbKPeWCBEhV/qR7
	hbP9zcQ==
X-Received: by 2002:a05:6000:22c1:b0:3a4:f7dd:6fad with SMTP id ffacd0b85a97d-3a6c96bde70mr478045f8f.14.1750268420149;
        Wed, 18 Jun 2025 10:40:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGdKc/sogX7P8eUPuNrS35oj8SOpb+inlndXsECh3VUw/sMAlaRsKTNBWIAReSnT0M7eOt7jg==
X-Received: by 2002:a05:6000:22c1:b0:3a4:f7dd:6fad with SMTP id ffacd0b85a97d-3a6c96bde70mr477976f8f.14.1750268419626;
        Wed, 18 Jun 2025 10:40:19 -0700 (PDT)
Received: from localhost (p200300d82f2d2400405203b5fff94ed0.dip0.t-ipconnect.de. [2003:d8:2f2d:2400:4052:3b5:fff9:4ed0])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a568b0898fsm17901600f8f.54.2025.06.18.10.40.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 10:40:19 -0700 (PDT)
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
Subject: [PATCH RFC 01/29] mm/balloon_compaction: we cannot have isolated pages in the balloon list
Date: Wed, 18 Jun 2025 19:39:44 +0200
Message-ID: <20250618174014.1168640-2-david@redhat.com>
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
X-Mimecast-MFC-PROC-ID: zFQ2Iu_nDPAoiXzzyQ2-5KEQ6ZhJNhueKSjE4-rJ7yI_1750268420
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


