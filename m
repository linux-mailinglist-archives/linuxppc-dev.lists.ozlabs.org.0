Return-Path: <linuxppc-dev+bounces-13109-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 317B8BF7373
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Oct 2025 17:00:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4crb8S3rkbz30Ff;
	Wed, 22 Oct 2025 02:00:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761058856;
	cv=none; b=Nxgti4GeVaTlEO5PiouKak1cU2wKjIQFHnr1cIv5e4EZ24U6Ps48yN2aMxA6e/0da57gGS8SNQxglRMbcXtftshgzQCeoExfiLi8opL4m/0bOSx4FHzXeRUQHhr+k3k19Pie3Ey97yXY8cwMg/Wt+SJfuxzEuB13c5O+ORgPM+xV0t0B/cF7ErklD+m+RchYAIIX36MfvSienkLXzQrw6di+KhhplFLRGM2oXtIRmpMyzczWT2r0S38UEhexoOzPMA5jjsEq0qfn89NOdEWH96EgDJy2TzxgQxhzRMvPVzq/tiishlBRhbxwEbNHaadxDwIeUNa41HFdMop131Vprw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761058856; c=relaxed/relaxed;
	bh=36pQ3u8jy0FN5dn5JcBHYlI7xvHgf6+mb8fY5UQyalU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=bsxhYX6bJ9pzK5gnQk7fbkWXA+joIZeocPmOGH7QKx4HzAo4EwG894vHEGNnST4ijutbxGCREH3x9t3B7YVGJBWhTi//F6XcXyUtSzghweDlPLR1L+rruVJ3PLL252G3cXTY7c+tlGMqWoizERx2sRJzl3n4FDyPfmbmdVjMTlR6bLF4/5toPJJcJe2vpFDuGVe+AOJTVHLvtuWMAbQFwrGDOI+MnJxISJ16E0eEeKzuS0EueeX7fcgpJ4R62TxU7/ud0ukZmIdniN5PFk+M2NzUdBcuK0AVc90r5Z5Af2xqVjwHq9o6YhoMOUhu7kmKud+pKSa4JUkjJNALuLqJWQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AkQr7fUz; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ADV8ZcTo; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AkQr7fUz;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ADV8ZcTo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4crb8R1gSQz304H
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Oct 2025 02:00:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761058849;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=36pQ3u8jy0FN5dn5JcBHYlI7xvHgf6+mb8fY5UQyalU=;
	b=AkQr7fUzgZLq5nqprWFVbShIZwO7Z63bLgWgiS19en4ZB6NmbUZnBcwRsnEdLUHsCF+CD2
	57qd0V6lbPWe446EBXYTiLz02GSm3AEQbQv0e39ffSBX0xOY1KXXmwO6BFc6eW4q3/WGRZ
	PU+kO05Vzv3SgCNk9VTfbNUWH/u6mZ8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761058850;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=36pQ3u8jy0FN5dn5JcBHYlI7xvHgf6+mb8fY5UQyalU=;
	b=ADV8ZcToNOjtBUIY3dxNzIfEhMfEQAGVOg18eitbpt/pgTQUiBst/V/Zb6+AmZH4tDnkD+
	yZC+i+2qaEVNY3K7mqd6jDj6gQWpOj8A0HX4sRmlkaSsEnWwLCsiPiTLyOdwASoYBq4g2U
	9khWbKbaUb7LvTOrlVepshmVCcgGln0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-639-neiZr8EUNg6jpCzvgr7V4w-1; Tue, 21 Oct 2025 11:00:44 -0400
X-MC-Unique: neiZr8EUNg6jpCzvgr7V4w-1
X-Mimecast-MFC-AGG-ID: neiZr8EUNg6jpCzvgr7V4w_1761058843
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-46e4cb3e4deso21048295e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Oct 2025 08:00:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761058843; x=1761663643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=36pQ3u8jy0FN5dn5JcBHYlI7xvHgf6+mb8fY5UQyalU=;
        b=Mz6QL5FGnOjATKxdWF3hCU9NxSa2C7bPaL5PJQPBZlkqtv4RI04rNO9XPlRQfcHRe6
         3P9wtJ6sGQF2HBddiiwsG/FqzSEVsY/lB+1OFaxXku/Nzw07P1VLudCF0AI6yyoKEEu9
         t30laFac8BQ7I8oWG6dBvklQOVleZUq1diEbko91YmnSKUSZeB4X494arELRL/P7I2ff
         2pFYWbmAUBO+opE41pE0HFxDFztSMlx89fWpfJbimHy/sSIJHjmoFqtjyVCFKV66mdNg
         LA/tQikVNF9IuN9wu/3VBYE1gBmpytfeUTaRCR4VvisTsZ+fxMqSlWspHT6d1dsv6qSQ
         yC3g==
X-Forwarded-Encrypted: i=1; AJvYcCX43qZ026XJWAt7Y0w8tDt3xO1b6Co6LqMAbmHvPgAy0d9O3rkZnmCApR7jP+ch240PZIUGihlDvi0Ql2U=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yzzq7ZOxhUjZ/r+5xubyIpYHWRy5Ec8ovssDKzmVQB7onP4B1kN
	pBVDj7Amq6zhTJb9IIUUJ/+SSrKBsoIMEcycG9NkEVHr1WG4fIbaHr2kDN1fQEXQqaw/YYofcNK
	crrgD7LoduQEdIN5hnQlYca+25K3GpXc90dBrPjxbHYnS+5AeHGiwYkPnQlpjZYSi/AM=
X-Gm-Gg: ASbGncupUwBE6tiX4Gu6xjmzPod0qWjuSZ2c6YUbah7ivzoUIJ4YEWfxRvUWZu9zOo4
	2uhqusugxxiwyTH6wM61aYnHUK1IhXexW78MCnudmYDr480CR3XMCdLbkS9HjKPN4fH52eFQYSz
	lKoWjq9IhxdSNgTZ7EvZUzTyxRCD3JA2O4615s6PGFVcaDiKBz5Si3APF/Y9YfeGsHdByYjBNRj
	1ENvEaL61fHqIckvVSedtf8/iRwHs5NG2R7T1F9LOpFnzIMAONsmq1SAaiesn5KsV3JTexWlbzY
	29SY9iT8SmPZ0hUmwL6skDECYnhseck1xRlYIgbbTiCDX+hznV5Kk1+qCbmMbfhG2g95tbNS6jq
	fanYgA6yYOlm1o+l7PAcmbaNI/BWPnpx5Q6cuWTSEoPVvLMTyBz4jVJjy1Z5V
X-Received: by 2002:a05:6000:2312:b0:3e7:6424:1b47 with SMTP id ffacd0b85a97d-4285324c1ecmr15545f8f.6.1761058843365;
        Tue, 21 Oct 2025 08:00:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZSHalSV1qtXRSgl0VFWeqe9iy+sxBgka0ewlzc4+wG6jRvgfqUYrrl7qKB5xy+AtSOmms8A==
X-Received: by 2002:a05:6000:2312:b0:3e7:6424:1b47 with SMTP id ffacd0b85a97d-4285324c1ecmr15477f8f.6.1761058842857;
        Tue, 21 Oct 2025 08:00:42 -0700 (PDT)
Received: from localhost (p200300d82f4e3200c99da38b3f3ad4b3.dip0.t-ipconnect.de. [2003:d8:2f4e:3200:c99d:a38b:3f3a:d4b3])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-427ea5b3f5esm20480663f8f.20.2025.10.21.08.00.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 08:00:42 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-doc@vger.kernel.org,
	virtualization@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Oscar Salvador <osalvador@suse.de>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jerrin Shaji George <jerrin.shaji-george@broadcom.com>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	Zi Yan <ziy@nvidia.com>,
	David Hildenbrand <david@redhat.com>
Subject: [PATCH v1 17/23] mm/balloon_compaction: remove "extern" from functions
Date: Tue, 21 Oct 2025 17:00:34 +0200
Message-ID: <20251021150040.498160-1-david@redhat.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251021125929.377194-1-david@redhat.com>
References: <20251021125929.377194-1-david@redhat.com>
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
X-Mimecast-MFC-PROC-ID: Non63TrJVtSuMUgoVVNXuIIhRDDbmuW35QX7J5w9cMQ_1761058843
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Adding "extern" to functions is frowned-upon. Let's just get rid of it
for all functions here.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/balloon_compaction.h | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/include/linux/balloon_compaction.h b/include/linux/balloon_compaction.h
index eec8994056a44..7757e0e314fdb 100644
--- a/include/linux/balloon_compaction.h
+++ b/include/linux/balloon_compaction.h
@@ -59,14 +59,14 @@ struct balloon_dev_info {
 	bool adjust_managed_page_count;
 };
 
-extern struct page *balloon_page_alloc(void);
-extern void balloon_page_enqueue(struct balloon_dev_info *b_dev_info,
-				 struct page *page);
-extern struct page *balloon_page_dequeue(struct balloon_dev_info *b_dev_info);
-extern size_t balloon_page_list_enqueue(struct balloon_dev_info *b_dev_info,
-				      struct list_head *pages);
-extern size_t balloon_page_list_dequeue(struct balloon_dev_info *b_dev_info,
-				     struct list_head *pages, size_t n_req_pages);
+struct page *balloon_page_alloc(void);
+void balloon_page_enqueue(struct balloon_dev_info *b_dev_info,
+		struct page *page);
+struct page *balloon_page_dequeue(struct balloon_dev_info *b_dev_info);
+size_t balloon_page_list_enqueue(struct balloon_dev_info *b_dev_info,
+		struct list_head *pages);
+size_t balloon_page_list_dequeue(struct balloon_dev_info *b_dev_info,
+		struct list_head *pages, size_t n_req_pages);
 
 static inline void balloon_devinfo_init(struct balloon_dev_info *balloon)
 {
-- 
2.51.0


