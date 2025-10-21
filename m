Return-Path: <linuxppc-dev+bounces-13113-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8006CBF7387
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Oct 2025 17:01:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4crb8Z6Bqyz3cZf;
	Wed, 22 Oct 2025 02:01:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761058862;
	cv=none; b=BR3RvHX1oid2eLU3WOBR/BmsmTrzQH2ra6VdCcMUA2/TU3KSTTk5YIhXjxlsF86YrEUKBPiaFpyXJsHl4/AUp9S71SXGGmGXR4gNlEV9zozwayuEhE9+xgtZzDGheVYzgWhy/4c2BDcPdXJ1I6hK/y7c60ozMTsfYNLusup4QIQ9XLdkLA5zWRDmkr0yldEQaTx7GuGoQ1GlA1Dh+aNYqV2fPRkpTDAlqZ4ZkRDVVzpN9uTf45/4veU9PsdNPcLkSOzqLSzkC9Fr5mHQSd2gGjw9j4xRNMku9MN1QAsm4E0txO3IMiYtWUGu8vqNyQxEjGIlQVrEJLS4nhvSgLUmEg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761058862; c=relaxed/relaxed;
	bh=IxeaoFY2Zid2XlBwuhP3Cbqf0hU6HwUeKjXEu5WpZgc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=CH0xamHCheKp5eYcdHbRjebeY7u0RTXj7ngnatO6IKOGLQDxB62MqjeQyPm1QANEDmq3Syv2YloXSiWzW8Dv5NLo7XyWN8zOHr3xSvMn3gHILKXlq4c8O5LaOkaLe4jHlFazVwCytNwoLFqgcg2PRyj5L16Tk1WTIGVbhbnTkGRyumd+y35B9QuOSpavxYMKibuBA2TdC+k/JqAiTxtkJNMlb9UV6VfZtlvmiJdMBs96cMxomOBp40tg+FE5iKldXOYTqzgc4Us3Z+jhF0Y5ynet8ZCxdu0Kc90Q/06tpn9ZO+iZx2yhKGSSrvrTTJ/0eYf3EFiNPwAvaTPOuR2zdQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TlwTUMfY; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TlwTUMfY; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TlwTUMfY;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TlwTUMfY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4crb8Z0qCjz3cZh
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Oct 2025 02:01:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761058859;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IxeaoFY2Zid2XlBwuhP3Cbqf0hU6HwUeKjXEu5WpZgc=;
	b=TlwTUMfYnRxQR8H6255yauArXJfxGBZR3cEGn4JIZNa/wtZWGWz9Ft48+5qlXXC1vPmYMn
	cox82roNf3aVSAczdkFcvOHvHhxnI0G12rIXHwG4nb+ZQlre+VarT5KBze4HWVnDo7Txr2
	BGSXtDQMmfAkLNqvG9G9Ot5oMjas338=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761058859;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IxeaoFY2Zid2XlBwuhP3Cbqf0hU6HwUeKjXEu5WpZgc=;
	b=TlwTUMfYnRxQR8H6255yauArXJfxGBZR3cEGn4JIZNa/wtZWGWz9Ft48+5qlXXC1vPmYMn
	cox82roNf3aVSAczdkFcvOHvHhxnI0G12rIXHwG4nb+ZQlre+VarT5KBze4HWVnDo7Txr2
	BGSXtDQMmfAkLNqvG9G9Ot5oMjas338=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-584-HGOEEpW-PqaeQBhsoTLJ1g-1; Tue, 21 Oct 2025 11:00:57 -0400
X-MC-Unique: HGOEEpW-PqaeQBhsoTLJ1g-1
X-Mimecast-MFC-AGG-ID: HGOEEpW-PqaeQBhsoTLJ1g_1761058855
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-46e4cb3e4deso21049285e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Oct 2025 08:00:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761058855; x=1761663655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IxeaoFY2Zid2XlBwuhP3Cbqf0hU6HwUeKjXEu5WpZgc=;
        b=sfyrhZnJjbK9alZkIb8sKhLKuriLcXNA983pLwVKHt0JulsQ7y3kdbS/HkrnREVWz3
         Oep3oWwuMrarzmFtMxXHum4ZdDzZFjPpkbYx+UifIGTnWhiBZN5os0creKHbqjHgx5fV
         MzbF4AEtvVYE4EarbyheWz2PBX2OrfvDs+/iNJY4Sw6MsaJoOc1HlcVS5kMK13LudFBS
         D5Eab5i4rs7xTa1ktwoqVGZ5AyshFk38vpaKec68QkbB+bFZvBIIsgXWRVwny2z4mYod
         z79hTNRG0MhbRxSRmsCcxABaxfeBHSoC9VnDIFikwOU1qwBzqNoeSDWGeJOmO5lc5Ah/
         8BAg==
X-Forwarded-Encrypted: i=1; AJvYcCWeU6rRoRrV2ka5qa7L6af+Ms61yagw5xZOlp+9i9XCREzGNXx2RDJjLFS4LfD9gFwer61X0RciRUJOseo=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx+MKqGz1DcDYlSDTeUVPPIdNP39e9sVQo43XChxJjWp3tdRDZf
	uYpVDHwuqIGAlqsHvej+mZFo/ZZJ5vVoztcO5nnGmkfVqo8gIzi2BSTKiCH9WXQGXGREvfM4yST
	XHH+0im7VeusR/gWrHPMN60IwUvGBuAA2+qH8sAOsIiWTgwsFHg9K89InO48nT5SZuYQ=
X-Gm-Gg: ASbGncvcL+sWbHD6ME4u8T6nDHLLa6JLPohI2fD6dKQPQoYXEcsowPfo+qVbWsoLjEx
	M+0/uPytLHYa8DWz6zje5J+3xy7fJ/f7tgigbGOPOo80k1UyWAg6213F/++3+NbrkjEtanhV4O0
	nvneudpVzrJeQ4XxOGAinMIYC6dPBkX/4l5czC3mLjNQsK9ylNJppz1tyDBFYDdBJb1rM6MH6To
	AOpUQacwG41pBtR/lBSQUsv85pCXgFix5pV6f/kLqv0+s2e8NAeTE8z09dZc+NFiHLWdoz5WY3J
	P3hqIlhsCPsnDP7UGsIFcS9xA7hQx/uUeKQ0Qtg5ZTjiYq53Y2jPE6Dnlbs+ZFE8z9llcxtjEbZ
	cnlYh3DzI9BAWpltt2t3oyIoBnBJdn2g+8QftQ8Hyvcn4DAoGvgl/XpZXvgD4
X-Received: by 2002:a05:600c:6d87:b0:46f:cdfe:cd39 with SMTP id 5b1f17b1804b1-475c3ee145emr177105e9.16.1761058855002;
        Tue, 21 Oct 2025 08:00:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGTNQTiGz5xAhZ5fsddDZjV1qS7LKojQZq7D4oRaNBiv/doXb8XOAkbt7nBaFlt+DyqmCX9Sw==
X-Received: by 2002:a05:600c:6d87:b0:46f:cdfe:cd39 with SMTP id 5b1f17b1804b1-475c3ee145emr176645e9.16.1761058854422;
        Tue, 21 Oct 2025 08:00:54 -0700 (PDT)
Received: from localhost (p200300d82f4e3200c99da38b3f3ad4b3.dip0.t-ipconnect.de. [2003:d8:2f4e:3200:c99d:a38b:3f3a:d4b3])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-471144c82b8sm285435185e9.15.2025.10.21.08.00.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 08:00:53 -0700 (PDT)
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
Subject: [PATCH v1 22/23] mm: rename CONFIG_MEMORY_BALLOON -> CONFIG_BALLOON
Date: Tue, 21 Oct 2025 17:00:39 +0200
Message-ID: <20251021150040.498160-6-david@redhat.com>
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
X-Mimecast-MFC-PROC-ID: pOCSQNPV9fbN4fkJ-J8naBxRNT4JAJm6pOP8LM0VceI_1761058855
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Let's make it consistent with the naming of the files but also with the
naming of CONFIG_BALLOON_MIGRATION.

While at it, add a "/* CONFIG_BALLOON */".

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 arch/powerpc/platforms/pseries/Kconfig | 2 +-
 drivers/misc/Kconfig                   | 2 +-
 drivers/virtio/Kconfig                 | 2 +-
 include/linux/vm_event_item.h          | 4 ++--
 mm/Kconfig                             | 4 ++--
 mm/Makefile                            | 2 +-
 mm/vmstat.c                            | 4 ++--
 7 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/Kconfig b/arch/powerpc/platforms/pseries/Kconfig
index 3e042218d6cd8..f7052b131a4c5 100644
--- a/arch/powerpc/platforms/pseries/Kconfig
+++ b/arch/powerpc/platforms/pseries/Kconfig
@@ -120,7 +120,7 @@ config PPC_SMLPAR
 config CMM
 	tristate "Collaborative memory management"
 	depends on PPC_SMLPAR
-	select MEMORY_BALLOON
+	select BALLOON
 	default y
 	help
 	  Select this option, if you want to enable the kernel interface
diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
index b9c11f67315f0..47da8dfcffc2b 100644
--- a/drivers/misc/Kconfig
+++ b/drivers/misc/Kconfig
@@ -411,7 +411,7 @@ config DS1682
 config VMWARE_BALLOON
 	tristate "VMware Balloon Driver"
 	depends on VMWARE_VMCI && X86 && HYPERVISOR_GUEST
-	select MEMORY_BALLOON
+	select BALLOON
 	help
 	  This is VMware physical memory management driver which acts
 	  like a "balloon" that can be inflated to reclaim physical pages
diff --git a/drivers/virtio/Kconfig b/drivers/virtio/Kconfig
index 6db5235a7693d..ce5bc0d9ea287 100644
--- a/drivers/virtio/Kconfig
+++ b/drivers/virtio/Kconfig
@@ -112,7 +112,7 @@ config VIRTIO_PMEM
 config VIRTIO_BALLOON
 	tristate "Virtio balloon driver"
 	depends on VIRTIO
-	select MEMORY_BALLOON
+	select BALLOON
 	select PAGE_REPORTING
 	help
 	 This driver supports increasing and decreasing the amount
diff --git a/include/linux/vm_event_item.h b/include/linux/vm_event_item.h
index fca34d3473b6b..22a139f82d75f 100644
--- a/include/linux/vm_event_item.h
+++ b/include/linux/vm_event_item.h
@@ -122,13 +122,13 @@ enum vm_event_item { PGPGIN, PGPGOUT, PSWPIN, PSWPOUT,
 		THP_SWPOUT,
 		THP_SWPOUT_FALLBACK,
 #endif
-#ifdef CONFIG_MEMORY_BALLOON
+#ifdef CONFIG_BALLOON
 		BALLOON_INFLATE,
 		BALLOON_DEFLATE,
 #ifdef CONFIG_BALLOON_MIGRATION
 		BALLOON_MIGRATE,
 #endif /* CONFIG_BALLOON_MIGRATION */
-#endif
+#endif /* CONFIG_BALLOON */
 #ifdef CONFIG_DEBUG_TLBFLUSH
 		NR_TLB_REMOTE_FLUSH,	/* cpu tried to flush others' tlbs */
 		NR_TLB_REMOTE_FLUSH_RECEIVED,/* cpu received ipi for flush */
diff --git a/mm/Kconfig b/mm/Kconfig
index c058a65080d1e..73e352bb82653 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -593,7 +593,7 @@ config SPLIT_PMD_PTLOCKS
 
 #
 # support for memory balloon
-config MEMORY_BALLOON
+config BALLOON
 	bool
 
 #
@@ -601,7 +601,7 @@ config MEMORY_BALLOON
 config BALLOON_MIGRATION
 	bool "Allow for balloon memory migration"
 	default y
-	depends on MIGRATION && MEMORY_BALLOON
+	depends on MIGRATION && BALLOON
 	help
 	  Allow for migration of pages inflated in a memory balloon such that
 	  they can be allocated from memory areas only available for movable
diff --git a/mm/Makefile b/mm/Makefile
index ab012157b5109..315aec23d78f5 100644
--- a/mm/Makefile
+++ b/mm/Makefile
@@ -121,7 +121,7 @@ obj-$(CONFIG_CMA)	+= cma.o
 obj-$(CONFIG_NUMA) += numa.o
 obj-$(CONFIG_NUMA_MEMBLKS) += numa_memblks.o
 obj-$(CONFIG_NUMA_EMU) += numa_emulation.o
-obj-$(CONFIG_MEMORY_BALLOON) += balloon.o
+obj-$(CONFIG_BALLOON) += balloon.o
 obj-$(CONFIG_PAGE_EXTENSION) += page_ext.o
 obj-$(CONFIG_PAGE_TABLE_CHECK) += page_table_check.o
 obj-$(CONFIG_CMA_DEBUGFS) += cma_debug.o
diff --git a/mm/vmstat.c b/mm/vmstat.c
index 8843a8c4914c4..542378df0bf75 100644
--- a/mm/vmstat.c
+++ b/mm/vmstat.c
@@ -1431,13 +1431,13 @@ const char * const vmstat_text[] = {
 	[I(THP_SWPOUT)]				= "thp_swpout",
 	[I(THP_SWPOUT_FALLBACK)]		= "thp_swpout_fallback",
 #endif
-#ifdef CONFIG_MEMORY_BALLOON
+#ifdef CONFIG_BALLOON
 	[I(BALLOON_INFLATE)]			= "balloon_inflate",
 	[I(BALLOON_DEFLATE)]			= "balloon_deflate",
 #ifdef CONFIG_BALLOON_MIGRATION
 	[I(BALLOON_MIGRATE)]			= "balloon_migrate",
 #endif /* CONFIG_BALLOON_MIGRATION */
-#endif /* CONFIG_MEMORY_BALLOON */
+#endif /* CONFIG_BALLOON */
 #ifdef CONFIG_DEBUG_TLBFLUSH
 	[I(NR_TLB_REMOTE_FLUSH)]		= "nr_tlb_remote_flush",
 	[I(NR_TLB_REMOTE_FLUSH_RECEIVED)]	= "nr_tlb_remote_flush_received",
-- 
2.51.0


