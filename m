Return-Path: <linuxppc-dev+bounces-13111-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D6EBF7381
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Oct 2025 17:01:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4crb8W4qgkz300M;
	Wed, 22 Oct 2025 02:00:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761058859;
	cv=none; b=bNuwbzZkki+JcfA7aZxFvEIPMb1yB2g0eYaYXVys/WNaAmrkNkrUqMDxo2LuMYCvrje+0QuKkYj2GP/shQH9xbosz6hnobCVxZDsLgy7JyK/il8Y6JGrRqQK+3YlNeE4RxZnM5fAvZl3melLz6tiq27vQgtTc+PORn/eL5s2ntvJktEc/0W3o9DGJUSFPldOrkafzD8mIMgkramr8G7JOFD1qXnKySIVGKS/bFh5aoZ7r2KAJl6+G/VCSOUQKY3ZwKwSJDgDdHBMUGrJkJO4NYOgScPDzLIlVJ1Qwiutb2Qh5CP7FpYltD8mIMVwBTi5tT+NzyhMmwLN0fpyNj8BSw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761058859; c=relaxed/relaxed;
	bh=XDLrgg+nqjJKw4aq9VppMtv44pG2L3C4aYFxjxK1b9A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=jTpVSUoHA42R9csa8EqNN2s6gjFEcNOEkYz9WfS7rdFWh1m8MgSfQazCoXys7+iJ5fZEoHAYnXqUNLQwiEjpFMe+WeDdixUnxgl/3j1aSOVMU32gmM+Zf2/dFPniSHFilld2JQNoSNcH4yIYZg4axJg426IiL07Zo+o7Fx9ZBBE2+h/uFjhTOZNh7GMi7Kfn0LeifCs/TP71nciKkUNsBGBnd1/trv4gtxV4x3Hn2CCI/nadex9pTStfDLJJESIaiFZWVlyERFNXvryPiMmOQ8K+VdaN/sMznzbMAdGNfCCvEOnGduYQoTLBuEpH2YGSL5LeuUXrl4HLxPlVTMWbKA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NSw11wbV; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NSw11wbV; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NSw11wbV;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NSw11wbV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4crb8V5N8Wz3bfY
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Oct 2025 02:00:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761058855;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XDLrgg+nqjJKw4aq9VppMtv44pG2L3C4aYFxjxK1b9A=;
	b=NSw11wbVVm2I/rgq84hdjGDofJXWHpzwpbiYMrc93wQMkf74kCKo56ANCyaXIkBNJr/DIU
	PB1L+yJXfVKO5363bwTp5HAK9KHGHcqrdfwUJw5uYS+0nkLk4mHT/3nv3tYuanG3UuK2nn
	DQRXgtLIZs+nFCDdPoxtaoSTnfjH5BM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761058855;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XDLrgg+nqjJKw4aq9VppMtv44pG2L3C4aYFxjxK1b9A=;
	b=NSw11wbVVm2I/rgq84hdjGDofJXWHpzwpbiYMrc93wQMkf74kCKo56ANCyaXIkBNJr/DIU
	PB1L+yJXfVKO5363bwTp5HAK9KHGHcqrdfwUJw5uYS+0nkLk4mHT/3nv3tYuanG3UuK2nn
	DQRXgtLIZs+nFCDdPoxtaoSTnfjH5BM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-644-CkK9SMKAMISj33i3PAelnw-1; Tue, 21 Oct 2025 11:00:51 -0400
X-MC-Unique: CkK9SMKAMISj33i3PAelnw-1
X-Mimecast-MFC-AGG-ID: CkK9SMKAMISj33i3PAelnw_1761058850
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-47108163eeaso27709055e9.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Oct 2025 08:00:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761058850; x=1761663650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XDLrgg+nqjJKw4aq9VppMtv44pG2L3C4aYFxjxK1b9A=;
        b=oXgwifLgxQbe2QQVOW5kMk5kfTVX2SPkJwfjEqGMYJ9ZNukIvnWnDjulON67BTUZkI
         IL84/JIJXD97ZPC+O4YN5DViVpcP/5eg4DK6KOscrXScErguGTOn4PCHz2ZtsNW8tFxc
         uHqMcO5zAf6IBGqpVKIMtyXY5BQHj7Xi549g5JKFwwRy686unOU4I1GmUp2Q83TLRXhc
         A3x0z4UvG1j5bjui2WP49u89DsyF/9MVN56yvzjvShQ5KgORUUXmkXQHbazQ5ocwUGH1
         ioAjzesUmz1tPs96W9WTX7y0WMGtIR4pkCQGoRmluNHglI7yjSLgS09Sb2/BdeDOE0cH
         lf7g==
X-Forwarded-Encrypted: i=1; AJvYcCWknamoOIciUc6gbRZdSjEry2m6+ft+fHr9iqVFNlR1eYxaR3P49R5857g5wMG6/HDQ0TIouxfDpHNCnRk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx7qkDZtl60o45WGUloxYT6ll16xPa7yh3oqCFND5FAglq0Imrn
	ugUBla7tiK7yrEoFcrPYWa/CbqAItxascSMyd+B2InMnYpwzqGQ+nZqCfx5Brha2ZupCEm3aJli
	pxkUv8bI8nd4i8cm8h6sKgNDwrbnAgw9hHduXXOBU2yzdBkOdEZmUQXO6JQGeB+PYT3M=
X-Gm-Gg: ASbGncsmMtMFkcrSSmJInxEYF21Cy5QJRbs78UNBa/6mB/+iqk+GqSLBolTvAZkaVVr
	ccb5Ti/C25qGHso4OKUxrsmeRSg6UuyyZ5YI1UnfXsT+soSOjP6vqm8VNQr5iZTMNJPVJLepsGG
	5e9N5bpsLkz9SeEzGY/cvsX99f7jSWgvfH2a1x7afEgJ/9SbkU4ndnt92HB/clitasBJYLUpWs8
	rh2WBUkKch/emuJasjc8S1gZnJ2PS0VS6q24tYqhzyApp/+4JJn5OyRuRcCkXbahWNu5d7mygNS
	vwU7zPWfl9fyXczJUfawfwA4psXRNafqYT5f+NuloGGHLRsRysuhmp4LuXRM+zawSYznlrIcDHv
	FnJni75I7vHk3Ap8QRf1RbkdIv0GNVa8DuBYr92WxfWvfy+j2HcaHCgSQ0gtO
X-Received: by 2002:a05:600c:3f10:b0:46e:59f8:8546 with SMTP id 5b1f17b1804b1-471178afb7amr120259985e9.17.1761058850148;
        Tue, 21 Oct 2025 08:00:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEDk/chsWh4lmzSq81oi5QgoA5chh2GWI8u8p0fIiNZPQgGrNl16RwScdXvWvZ/Onc3FnooFg==
X-Received: by 2002:a05:600c:3f10:b0:46e:59f8:8546 with SMTP id 5b1f17b1804b1-471178afb7amr120259635e9.17.1761058849707;
        Tue, 21 Oct 2025 08:00:49 -0700 (PDT)
Received: from localhost (p200300d82f4e3200c99da38b3f3ad4b3.dip0.t-ipconnect.de. [2003:d8:2f4e:3200:c99d:a38b:3f3a:d4b3])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-471553f8a3asm233676345e9.16.2025.10.21.08.00.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 08:00:49 -0700 (PDT)
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
Subject: [PATCH v1 20/23] mm/kconfig: make BALLOON_COMPACTION depend on MIGRATION
Date: Tue, 21 Oct 2025 17:00:37 +0200
Message-ID: <20251021150040.498160-4-david@redhat.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251021150040.498160-1-david@redhat.com>
References: <20251021125929.377194-1-david@redhat.com>
 <20251021150040.498160-1-david@redhat.com>
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
X-Mimecast-MFC-PROC-ID: Nxm-g5QuNF6HgNcWgME590aksE2mE9ZOVn2GNm6qEGU_1761058850
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Migration support for balloon memory depends on MIGRATION not
COMPACTION. Compaction is simply another user of page migration.

The last dependency on compaction.c was effectively removed with
commit 3d388584d599 ("mm: convert "movable" flag in page->mapping to a
page flag"). Ever since, everything for handling movable_ops page
migration resides in core migration code.

So let's change the dependency and adjust the description +
help text.

We'll rename BALLOON_COMPACTION separately next.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/Kconfig | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/mm/Kconfig b/mm/Kconfig
index e47321051d765..3aff4d05a2d8c 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -599,17 +599,14 @@ config MEMORY_BALLOON
 #
 # support for memory balloon compaction
 config BALLOON_COMPACTION
-	bool "Allow for balloon memory compaction/migration"
+	bool "Allow for balloon memory migration"
 	default y
-	depends on COMPACTION && MEMORY_BALLOON
-	help
-	  Memory fragmentation introduced by ballooning might reduce
-	  significantly the number of 2MB contiguous memory blocks that can be
-	  used within a guest, thus imposing performance penalties associated
-	  with the reduced number of transparent huge pages that could be used
-	  by the guest workload. Allowing the compaction & migration for memory
-	  pages enlisted as being part of memory balloon devices avoids the
-	  scenario aforementioned and helps improving memory defragmentation.
+	depends on MIGRATION && MEMORY_BALLOON
+	help
+	  Allow for migration of pages inflated in a memory balloon such that
+	  they can be allocated from memory areas only available for movable
+	  allocations (e.g., ZONE_MOVABLE, CMA) and such that they can get
+	  migrated for memory defragmentation purposes by memory compaction.
 
 #
 # support for memory compaction
-- 
2.51.0


