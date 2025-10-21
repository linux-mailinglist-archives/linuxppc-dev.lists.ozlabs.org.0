Return-Path: <linuxppc-dev+bounces-13108-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F655BF7372
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Oct 2025 17:00:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4crb8S3hLNz30D3;
	Wed, 22 Oct 2025 02:00:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761058856;
	cv=none; b=iBJ6rFMoJu3P9WpGhuN3DcsjYTGKNWB0o1EGNqj7+o6LtcfDmgrdPPu8UVoX/LqB+EJmXBjTO+5p6kxudeL6GwA3J5zGhl74niBylHNAn+mIPx+a6PNal8fUgMP4ywVCNVVnV3n1NKV8dwEExeGUS4mJ3sw3NLb8Dt/vZvaIpLCQw51T+HTD01J67EecZH0R6lkhbBhm2AFCzdV0B8ZkV7XdUW2MLtwImQn3+AMaXBOZi9BRzuFqmUehKXNTS78On+hGiaub84qyqYLZke0xxK8ze4y93H31EPQxaAus9h59z2zICeLl5EJshsQhyl3VeYObt5qEzUFZgMLjEr3qtw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761058856; c=relaxed/relaxed;
	bh=0WXJD5DBTOSdH4OFa5cGG6Bl5vxCoyITjfVMpwdlj+A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=JkOY1Mcsc8arKwkC283hxWvEwyAynHxhAbyWLibKplTVjcFnxvhF5HD+lB90GBWfItWsAgIodwj1TNpbJy+jQSrz/O1dMxmXF0aMeVrWfPX4TqbOpo5lbCPYfbvDTq21CyYeAbG6xKaZMBmWbMIsUSi3610W/hs874kC4DTbuRnoiuuakz9NuqLq2LFKtAoLAVKormzM5Jlbe71Y3CP3qCtiJKGAufcVrF91SZTy1dJCGT6axtdBWn6oMHFky4Ba9dafO38RowM8CwFcc5GG6vmfgfRzQ/rk1GJGG7hOpULq2zB9+YGHXChweGaucy2VCgvkGM4siufO3mx267rrDg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WZQkBItp; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WZQkBItp; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WZQkBItp;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WZQkBItp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4crb8R1fwKz300M
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Oct 2025 02:00:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761058851;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0WXJD5DBTOSdH4OFa5cGG6Bl5vxCoyITjfVMpwdlj+A=;
	b=WZQkBItp/tYM0eTzKePzZALwW10sAf9xw0wHnhVaULE+WiUuWgL+jhm9aaLUrZGoVpZUM3
	ZQ0p3m9hA++lYj7LlLArhQ4vxskz+B0hiLKKHt6W161S0XQOuQ+8x2246nV5ndlFDnTiFt
	Ebgt2Do/6H8DHFZOgE8HQIXniIUuAeo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761058851;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0WXJD5DBTOSdH4OFa5cGG6Bl5vxCoyITjfVMpwdlj+A=;
	b=WZQkBItp/tYM0eTzKePzZALwW10sAf9xw0wHnhVaULE+WiUuWgL+jhm9aaLUrZGoVpZUM3
	ZQ0p3m9hA++lYj7LlLArhQ4vxskz+B0hiLKKHt6W161S0XQOuQ+8x2246nV5ndlFDnTiFt
	Ebgt2Do/6H8DHFZOgE8HQIXniIUuAeo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-173-4Hj5xANJPL-bOrWW1gf7Ow-1; Tue, 21 Oct 2025 11:00:49 -0400
X-MC-Unique: 4Hj5xANJPL-bOrWW1gf7Ow-1
X-Mimecast-MFC-AGG-ID: 4Hj5xANJPL-bOrWW1gf7Ow_1761058848
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-47113dfdd20so18205945e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Oct 2025 08:00:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761058848; x=1761663648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0WXJD5DBTOSdH4OFa5cGG6Bl5vxCoyITjfVMpwdlj+A=;
        b=OQ7w6G49hXX/rfIu40BmZeJqb/MjBIqSu5YntCwopx/28ggm1eNcwNJKjUbIiW6930
         IOcQnwTxQCfNPyvTE0U0ZRcEkBBZYUdTyWBvkchG7MvD8kl+EvK8hKKshRUQmRDI6srq
         vtMSFwBnQjWcdtdeGC577ptNEkaN/TSOH1CaMy5uA+mhBShtOKBc96V1dAWP9LlR4RH9
         dgP86qjR1/Snjgz/aFbE5gCT8FArYf86yXN7e8Yya3Y24Vxu7PbkcXPpFIHJa1w/utHs
         Iyr5V626kG1+8Z/2jHP6/YhkBCwJPjPDRN694YZL3tpCk9r1tjuNW+HOo8nhy+bMMcMs
         QH5w==
X-Forwarded-Encrypted: i=1; AJvYcCVs4W1lgleofDpmsQQUKpJecuPIVJZk0xPLnHLatSbvuBI8QWmS0u3sb97GF4dqzlQ1mXS/GpP+4nW0c0w=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzapvAF7UT5K3iT8Cg9RHXiI3h7elt/4yU8YbVHh9ZNsMw+ZCtu
	KHzMFlKLiXpGpMIGd7/HtNc5s4GeVHYZ51vuZ2yvU6Iu3jvhgS09+2WxVSR2S4eghKw0/e8bw6/
	IMh7+dYqWQbid5C6GvnTgexW1ab3V1ZaMKbqd7aAjCoUTI68pW91jkgpZbXuB2yUcGDU=
X-Gm-Gg: ASbGncv8UPak7zI/9nL9DNEHdfuzAuCL8KRLHGHDw5nN0j+aNXJ+uGYZ53u4PajZflM
	oMmZ6xIsdRgKNBsPAjSzCO3fjGnXe7Xa4ooag5bPKxUTh01u4pC2mfgGg4FrJF+FD99mpXaKAI6
	ClogSeB8soqQrxzORudevaJnz4qkIfLw2n0nVIfZeXtbYkYagFyFTQtS7sEjXk3Y8s/ps/2+Uto
	KkRrEw0htJEugiSFQji44Mm/Crmau6KSwaSAn6G13Jc7k0NlvF2sj5h+rLDILOq1CzoyUJpqOsf
	McN51DkAfCTnEeviTfsVjw3ae+8zfwoPkSk0QR4Ylnag72RZlbhmIwOlch2GhWNnZ4E7Oi+p/zy
	CO2MR9aat55bcrNaZTF+wz7iQXaC30WqDAxcgY5R1F11XvKPmJdlfJjUizc++
X-Received: by 2002:a05:600c:4e89:b0:46f:b42e:e392 with SMTP id 5b1f17b1804b1-47117931c1dmr117960495e9.39.1761058848052;
        Tue, 21 Oct 2025 08:00:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGDebz8te/SdK4RMl9FXThAzS3UlvHbYsiUZ1AXYYoG1U9LkInArDMPFE9fh7553nINZVhlvg==
X-Received: by 2002:a05:600c:4e89:b0:46f:b42e:e392 with SMTP id 5b1f17b1804b1-47117931c1dmr117959965e9.39.1761058847485;
        Tue, 21 Oct 2025 08:00:47 -0700 (PDT)
Received: from localhost (p200300d82f4e3200c99da38b3f3ad4b3.dip0.t-ipconnect.de. [2003:d8:2f4e:3200:c99d:a38b:3f3a:d4b3])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-471144b5c91sm283508025e9.11.2025.10.21.08.00.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 08:00:47 -0700 (PDT)
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
Subject: [PATCH v1 19/23] mm: rename balloon_compaction.(c|h) to balloon.(c|h)
Date: Tue, 21 Oct 2025 17:00:36 +0200
Message-ID: <20251021150040.498160-3-david@redhat.com>
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
X-Mimecast-MFC-PROC-ID: PsI9R1rTaAFAtbPvbATiKuPaFUsjFWjtp9ItcXjt2bc_1761058848
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Even without CONFIG_BALLOON_COMPACTION this infrastructure implements
basic list and page management for a memory balloon.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 Documentation/core-api/mm-api.rst                 |  2 +-
 MAINTAINERS                                       |  4 ++--
 arch/powerpc/platforms/pseries/cmm.c              |  2 +-
 drivers/misc/vmw_balloon.c                        |  2 +-
 drivers/virtio/virtio_balloon.c                   |  2 +-
 include/linux/{balloon_compaction.h => balloon.h} | 11 +++++------
 mm/Makefile                                       |  2 +-
 mm/{balloon_compaction.c => balloon.c}            |  7 +++----
 8 files changed, 15 insertions(+), 17 deletions(-)
 rename include/linux/{balloon_compaction.h => balloon.h} (92%)
 rename mm/{balloon_compaction.c => balloon.c} (98%)

diff --git a/Documentation/core-api/mm-api.rst b/Documentation/core-api/mm-api.rst
index 68193a4cfcf52..aabdd3cba58e8 100644
--- a/Documentation/core-api/mm-api.rst
+++ b/Documentation/core-api/mm-api.rst
@@ -130,5 +130,5 @@ More Memory Management Functions
 .. kernel-doc:: mm/vmscan.c
 .. kernel-doc:: mm/memory_hotplug.c
 .. kernel-doc:: mm/mmu_notifier.c
-.. kernel-doc:: mm/balloon_compaction.c
+.. kernel-doc:: mm/balloon.c
 .. kernel-doc:: mm/huge_memory.c
diff --git a/MAINTAINERS b/MAINTAINERS
index 46126ce2f968e..878e53d0f65ed 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -27062,9 +27062,9 @@ M:	David Hildenbrand <david@redhat.com>
 L:	virtualization@lists.linux.dev
 S:	Maintained
 F:	drivers/virtio/virtio_balloon.c
-F:	include/linux/balloon_compaction.h
+F:	include/linux/balloon.h
 F:	include/uapi/linux/virtio_balloon.h
-F:	mm/balloon_compaction.c
+F:	mm/balloon.c
 
 VIRTIO BLOCK AND SCSI DRIVERS
 M:	"Michael S. Tsirkin" <mst@redhat.com>
diff --git a/arch/powerpc/platforms/pseries/cmm.c b/arch/powerpc/platforms/pseries/cmm.c
index 9ed71683ae402..c5aee15e192ea 100644
--- a/arch/powerpc/platforms/pseries/cmm.c
+++ b/arch/powerpc/platforms/pseries/cmm.c
@@ -19,7 +19,7 @@
 #include <linux/stringify.h>
 #include <linux/swap.h>
 #include <linux/device.h>
-#include <linux/balloon_compaction.h>
+#include <linux/balloon.h>
 #include <asm/firmware.h>
 #include <asm/hvcall.h>
 #include <asm/mmu.h>
diff --git a/drivers/misc/vmw_balloon.c b/drivers/misc/vmw_balloon.c
index 53e9335b6718c..7fd3f709108c2 100644
--- a/drivers/misc/vmw_balloon.c
+++ b/drivers/misc/vmw_balloon.c
@@ -29,7 +29,7 @@
 #include <linux/rwsem.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
-#include <linux/balloon_compaction.h>
+#include <linux/balloon.h>
 #include <linux/vmw_vmci_defs.h>
 #include <linux/vmw_vmci_api.h>
 #include <asm/hypervisor.h>
diff --git a/drivers/virtio/virtio_balloon.c b/drivers/virtio/virtio_balloon.c
index 4b22de6a5f845..5434a7739d588 100644
--- a/drivers/virtio/virtio_balloon.c
+++ b/drivers/virtio/virtio_balloon.c
@@ -13,7 +13,7 @@
 #include <linux/delay.h>
 #include <linux/slab.h>
 #include <linux/module.h>
-#include <linux/balloon_compaction.h>
+#include <linux/balloon.h>
 #include <linux/oom.h>
 #include <linux/wait.h>
 #include <linux/mm.h>
diff --git a/include/linux/balloon_compaction.h b/include/linux/balloon.h
similarity index 92%
rename from include/linux/balloon_compaction.h
rename to include/linux/balloon.h
index 7757e0e314fdb..82585542300d6 100644
--- a/include/linux/balloon_compaction.h
+++ b/include/linux/balloon.h
@@ -1,8 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /*
- * include/linux/balloon_compaction.h
- *
- * Common interface definitions for making balloon pages movable by compaction.
+ * Common interface for implementing a memory balloon, including support
+ * for migration of pages inflated in a memory balloon.
  *
  * Balloon page migration makes use of the general "movable_ops page migration"
  * feature.
@@ -35,8 +34,8 @@
  *
  * Copyright (C) 2012, Red Hat, Inc.  Rafael Aquini <aquini@redhat.com>
  */
-#ifndef _LINUX_BALLOON_COMPACTION_H
-#define _LINUX_BALLOON_COMPACTION_H
+#ifndef _LINUX_BALLOON_H
+#define _LINUX_BALLOON_H
 #include <linux/pagemap.h>
 #include <linux/page-flags.h>
 #include <linux/migrate.h>
@@ -75,4 +74,4 @@ static inline void balloon_devinfo_init(struct balloon_dev_info *balloon)
 	balloon->migratepage = NULL;
 	balloon->adjust_managed_page_count = false;
 }
-#endif /* _LINUX_BALLOON_COMPACTION_H */
+#endif /* _LINUX_BALLOON_H */
diff --git a/mm/Makefile b/mm/Makefile
index 21abb33535501..ab012157b5109 100644
--- a/mm/Makefile
+++ b/mm/Makefile
@@ -121,7 +121,7 @@ obj-$(CONFIG_CMA)	+= cma.o
 obj-$(CONFIG_NUMA) += numa.o
 obj-$(CONFIG_NUMA_MEMBLKS) += numa_memblks.o
 obj-$(CONFIG_NUMA_EMU) += numa_emulation.o
-obj-$(CONFIG_MEMORY_BALLOON) += balloon_compaction.o
+obj-$(CONFIG_MEMORY_BALLOON) += balloon.o
 obj-$(CONFIG_PAGE_EXTENSION) += page_ext.o
 obj-$(CONFIG_PAGE_TABLE_CHECK) += page_table_check.o
 obj-$(CONFIG_CMA_DEBUGFS) += cma_debug.o
diff --git a/mm/balloon_compaction.c b/mm/balloon.c
similarity index 98%
rename from mm/balloon_compaction.c
rename to mm/balloon.c
index f41e4a179a431..5734dae81e318 100644
--- a/mm/balloon_compaction.c
+++ b/mm/balloon.c
@@ -1,15 +1,14 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * mm/balloon_compaction.c
- *
- * Common interface for making balloon pages movable by compaction.
+ * Common interface for implementing a memory balloon, including support
+ * for migration of pages inflated in a memory balloon.
  *
  * Copyright (C) 2012, Red Hat, Inc.  Rafael Aquini <aquini@redhat.com>
  */
 #include <linux/mm.h>
 #include <linux/slab.h>
 #include <linux/export.h>
-#include <linux/balloon_compaction.h>
+#include <linux/balloon.h>
 
 /*
  * Lock protecting the balloon_dev_info of all devices. We don't really
-- 
2.51.0


