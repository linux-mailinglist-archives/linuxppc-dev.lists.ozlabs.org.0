Return-Path: <linuxppc-dev+bounces-13098-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D26EBF69B0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Oct 2025 15:01:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4crXSv0gnDz3dVq;
	Tue, 21 Oct 2025 23:59:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761051599;
	cv=none; b=gh2JCDDG22DaJlJR9UGCfvuY3D12oRkVFCF/dff5D76CSv6N/RIVnS/IetALjkSZSGmegiA5M2xFWqjPbIOqkvZk43SZCNu8yzbIoEC7JV3KLOo1YvnNiQpBXD3jc9OWYQpR9yF2frhrHEpAQApfohJ8uucuOoxO4bIPZugUpqUIcuXkPA+TsDAK1bt9+60/1dUN+V92m6RqAvbv+QsgZBPAQS7BdtgwREqRiz/IJ7sMTo9Q9XGFThcWtY1/GhJlAaVnX2gLw9uFk74YLncWhcijOpwfmqHRTsJ4EB3529uFJbMjXcCrqUWY3xa0snaA8NN46l9A43seAyGAOEdorQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761051599; c=relaxed/relaxed;
	bh=Pex3TSD4VopdNGhgViIupu2qOIUkRM48nNF7NdH4ZpQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=aKUksGfFXICmPqVw7wVvuhKPKsr6xlGNQC527XzwlYCKfLkZbCBTcNKOXfKlVaNlX0naKIxr+A8SUDZdUYE6D/BlFWEzrj10u0vzR3LE5aj7/fle6PJaZte6sni3DrH22dxruL31xeVAvyGbobjcQnCL2/VzGCBigE0YT7wwN100XA8cj8znoLeoXCqKzMQb2zlq82tWkcer6IOGTI4eX2TQQWOcLbquOZVB43Y8dFAGQ67dkxzIOjdQM6bUmG14H6In6g0ikL2Uie+0hg3mtZsCDBNp9aL0xXwaUih5LxaR+zfwvq5kVBcgbjb8kmPKFO76J+8uBw4q2pS1/tBZGg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CUSdMlwb; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=W6g48i1/; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CUSdMlwb;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=W6g48i1/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4crXSt1pcNz3dVB
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Oct 2025 23:59:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761051595;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Pex3TSD4VopdNGhgViIupu2qOIUkRM48nNF7NdH4ZpQ=;
	b=CUSdMlwbA1fkANl7LncePrQAv7niXgA2I7RVJxLLTbDWGzTb8LJO6p232QqEaO+b1foqQ1
	PK0ptEuKsfyz8Dnx3xg0qJj2IHIX7YsEWjX5jKDWYm0wP3qqyNgQUJa5y3Y32kR43blWo5
	C+gfGlqZ+iGBm8K/pQdIx+w9u6jotlM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761051596;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Pex3TSD4VopdNGhgViIupu2qOIUkRM48nNF7NdH4ZpQ=;
	b=W6g48i1/V5MsHvR31h3QVpX8lRNDsWLwVQAqfeXEYbQyrRjTWWzXSUbg5p1ZVZ7g/BY+9l
	2cS5HIheeYI5Iw5iIpnDR49iiyvLDNc/f2qh/HPjtDYiBuHQkpkb/gEr3AlB0RxLoKa5oW
	fQsdRWCrs3M7Ady+lo9bWr7bCFdXbJo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-61-v_6LVMUAO6ue3DqTugqHPw-1; Tue, 21 Oct 2025 08:59:54 -0400
X-MC-Unique: v_6LVMUAO6ue3DqTugqHPw-1
X-Mimecast-MFC-AGG-ID: v_6LVMUAO6ue3DqTugqHPw_1761051593
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-471193dacffso37642415e9.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Oct 2025 05:59:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761051593; x=1761656393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pex3TSD4VopdNGhgViIupu2qOIUkRM48nNF7NdH4ZpQ=;
        b=GFJfUf/1xcODNFusOK7/eI770I9ksEzpQOiDYRE1orjzKPewtDtf1TqI/+NJu+qmPB
         YyMPf9zMD2mUWm7gJJ+cXR1llxT3FnzfNPWALpYcuy5dwFewF+lHp98iMH82NpzKT6wi
         DLkEpjWGZdAerBhxErug6z1z3VD+uQtZnaNFLkVq3SSUzQim50tacjzp3llLu8h6pxz8
         93NXduz71s+6nM+8QheC4lTDOtGwneg1X5TLQFfISGJKkMLYwVh8WoLHKx14JM8kNaV8
         DQNlqSFQmQDYr3lEPoZ9hgGpvvhmo35hqEaLVG+vTrARMdXk3DjDJZCAlK5Bn2aUXrk6
         cIfA==
X-Forwarded-Encrypted: i=1; AJvYcCVJlvDje9jQeha0MDDydDw4J0FJILWXu4Ir/CPfR6ah6xz4IadKMEM5hQtRWXQf4Qr5xunouchmjC2jGQw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yzz+4S2ffZkkKoBczJLspRFJ/HgyD5aFw9GBN9yeoSk9W/qgh9M
	5LnLRcfpB/hxbOaEr0C9pG5yTa5MjBMXMDfhzuQfpQdPTDaGPKucZbPyrH0ejtYPt5qMp/WZRwE
	DhRxx3Z5rlQsIcAR/tNsNWA/E0C3gjVU61eDpyPW71gTYed0J7VALR1rDiBNKEDkCvAU=
X-Gm-Gg: ASbGncuT6hoi0vMnJZG73PmSow+pKQPtJOPONUmSxSF6Mz/OOdyRVN3fMllWk1NxVCC
	MnoykJoyy4AIR+ODhhJ4OZfZWBISqvXGcErbZdwqGtogl/JiEUrftmW/qDeNcdsptv7faUW1L+6
	8Yq0PcazcX6uVOLezA3RU6RYLO4XcOgi7gT8tapEQnAbQmF/oV0G516QbxQ1pEl/OQKFjWqWJZj
	nhZwIohUFRPg0qdJhB2A64WQVYzYyEaz7v1VzRsxmV2S1ciuJeDDmOJ6FEpS0kdgr3KcEhu+rRl
	y+EFJMBh3nRZdm2LOSjnqeiYqxfhhni3zjJ/IUCkg8H0y1gnZU+ElRXQPGX4oHXJu3dBXmBJJib
	WY24kxobqkWHF4witQf5y0pWqBZvyks8zprW8eUv0av79+jDp00A0vmRQblo7
X-Received: by 2002:a05:600c:3581:b0:45d:d5df:ab2d with SMTP id 5b1f17b1804b1-4711790bf23mr118755855e9.26.1761051592817;
        Tue, 21 Oct 2025 05:59:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEA4wZ2YHHfGwBY+P4joTOmyMCpMPrDXxQSxjIfhLQThHNmEp/4Y/9hLtnfofL7CHt5koNYrw==
X-Received: by 2002:a05:600c:3581:b0:45d:d5df:ab2d with SMTP id 5b1f17b1804b1-4711790bf23mr118755415e9.26.1761051592292;
        Tue, 21 Oct 2025 05:59:52 -0700 (PDT)
Received: from localhost (p200300d82f4e3200c99da38b3f3ad4b3.dip0.t-ipconnect.de. [2003:d8:2f4e:3200:c99d:a38b:3f3a:d4b3])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-427f00ce178sm20202274f8f.46.2025.10.21.05.59.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 05:59:51 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-doc@vger.kernel.org,
	virtualization@lists.linux.dev,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Oscar Salvador <osalvador@suse.de>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
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
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	Zi Yan <ziy@nvidia.com>
Subject: [PATCH v1 09/23] mm/balloon_compaction: make balloon_mops static
Date: Tue, 21 Oct 2025 14:59:14 +0200
Message-ID: <20251021125929.377194-10-david@redhat.com>
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
X-Mimecast-MFC-PROC-ID: m55RS3_gLTOCFiQfiJfcsNImouiZizQHvWrXwiPxUUQ_1761051593
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

There is no need to expose this anymore, so let's just make it static.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/balloon_compaction.h | 1 -
 mm/balloon_compaction.c            | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/include/linux/balloon_compaction.h b/include/linux/balloon_compaction.h
index ad594af6ed100..7db66c2c86cdc 100644
--- a/include/linux/balloon_compaction.h
+++ b/include/linux/balloon_compaction.h
@@ -78,7 +78,6 @@ static inline void balloon_devinfo_init(struct balloon_dev_info *balloon)
 }
 
 #ifdef CONFIG_BALLOON_COMPACTION
-extern const struct movable_operations balloon_mops;
 /*
  * balloon_page_device - get the b_dev_info descriptor for the balloon device
  *			 that enqueues the given page.
diff --git a/mm/balloon_compaction.c b/mm/balloon_compaction.c
index 28ef0cb6b3bbc..c44e0b62203cc 100644
--- a/mm/balloon_compaction.c
+++ b/mm/balloon_compaction.c
@@ -286,7 +286,7 @@ static int balloon_page_migrate(struct page *newpage, struct page *page,
 	return 0;
 }
 
-const struct movable_operations balloon_mops = {
+static const struct movable_operations balloon_mops = {
 	.migrate_page = balloon_page_migrate,
 	.isolate_page = balloon_page_isolate,
 	.putback_page = balloon_page_putback,
-- 
2.51.0


