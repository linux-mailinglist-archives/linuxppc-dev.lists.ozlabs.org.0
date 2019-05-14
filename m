Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE051C12F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2019 06:16:40 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4534BY6v5RzDqM7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2019 14:16:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=2607:f8b0:4864:20::342; helo=mail-ot1-x342.google.com;
 envelope-from=dan.j.williams@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="UjeQp29e"; 
 dkim-atps=neutral
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45349G4KbXzDq7n
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 May 2019 14:15:28 +1000 (AEST)
Received: by mail-ot1-x342.google.com with SMTP id s19so13934373otq.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 May 2019 21:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QpRQ5RKoCjF8LRntvBnA0N48k6E1wZWnQrRBNWvrbJk=;
 b=UjeQp29e977K98sPeUHL7M2b26uz7ODCB1tPABTq8ycEneyS4c1UAuTfIjvJlmhKzW
 rgT+CLkzVz6Tj12F2GaNYO9z4bvlQqIiNlC0lA9pUjUBtExWciRMAcdda9tmeKRhjiif
 U5p6czdMWpPq57Q5YbCtPICTa2/bR8qnSDzyOdMYm/jpTVMS5P8yg+ynABoxRYVy/xMj
 Ns8pcVkcANjUsy88CGOTiuzbT6+MMd1jobBa2rDPPNHEOEXy/dQb90zw/UeZwuo46jDs
 3FHRbEo2GIwX+trJ5hV48Rrik7r2xZXpO8rC0CU4Xl2+3RJfOxDHNojG2wDfiY+ZDqd8
 rBxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QpRQ5RKoCjF8LRntvBnA0N48k6E1wZWnQrRBNWvrbJk=;
 b=eOXNshvaUW+XyKNvm/zpMLwM1MsBajzEUYZo0w7N8KAm6N2KfgC9kuhiTyDpotQXe8
 +hVJENAGu9L0STTMx0yCncn15GvevfxvpyIr4UQaY97+U/ktqPak+mJ1v/dusj9YqZ9H
 LhbZkvLFhs+5dpmE6i/wO1IOr42zsd9LHnzvazBnovrbjpN5q7kVCgr3VpBpWTPqmOYx
 7WoNWIWZmXnjwzvHq6oIgxiYgUtzv1iZQTK4VyCQgyLI6wMHQeNIn3JpR+0RzUTbseJm
 bzAnnIK6hkhf9+3wDWJoRoewgLTPV5QjWAaAXcGTzTvWnhaR65Jtqwq6el5GKDzAKr2Q
 Lvzw==
X-Gm-Message-State: APjAAAX6tlERPiC85/Us6EYclH/s/crimWSTcfYT3WRaqrG5u3ShyO4G
 pMk9tUMki65iIQAG7gtt8/ch+HwcQmEKJ/8MGyHGfg==
X-Google-Smtp-Source: APXvYqxGVd1tqyXunJ456PV9dYVPRSqpzeYT2Q8gKJip9CosURLuJUd04BkNcpneRISWSBXU9PkRJuzBrm9HzMBwpUc=
X-Received: by 2002:a9d:12f2:: with SMTP id g105mr3369334otg.116.1557807325778; 
 Mon, 13 May 2019 21:15:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190514025354.9108-1-aneesh.kumar@linux.ibm.com>
In-Reply-To: <20190514025354.9108-1-aneesh.kumar@linux.ibm.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Mon, 13 May 2019 21:15:15 -0700
Message-ID: <CAPcyv4hsTvyRnLGr3y4JB6zPzdxb7WGQgaWs=5vRqf=L1DYynQ@mail.gmail.com>
Subject: Re: [RFC PATCH] mm/nvdimm: Fix kernel crash on
 devm_mremap_pages_release
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Keith Busch <keith.busch@intel.com>, Linux MM <linux-mm@kvack.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-nvdimm <linux-nvdimm@lists.01.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

[ add Keith who was looking at something similar ]

On Mon, May 13, 2019 at 7:54 PM Aneesh Kumar K.V
<aneesh.kumar@linux.ibm.com> wrote:
>
> When we initialize the namespace, if we support altmap, we don't initialize all the
> backing struct page where as while releasing the namespace we look at some of
> these uninitilized struct page. This results in a kernel crash as below.
>
> kernel BUG at include/linux/mm.h:1034!
> cpu 0x2: Vector: 700 (Program Check) at [c00000024146b870]
>     pc: c0000000003788f8: devm_memremap_pages_release+0x258/0x3a0
>     lr: c0000000003788f4: devm_memremap_pages_release+0x254/0x3a0
>     sp: c00000024146bb00
>    msr: 800000000282b033
>   current = 0xc000000241382f00
>   paca    = 0xc00000003fffd680   irqmask: 0x03   irq_happened: 0x01
>     pid   = 4114, comm = ndctl
>  c0000000009bf8c0 devm_action_release+0x30/0x50
>  c0000000009c0938 release_nodes+0x268/0x2d0
>  c0000000009b95b4 device_release_driver_internal+0x164/0x230
>  c0000000009b638c unbind_store+0x13c/0x190
>  c0000000009b4f44 drv_attr_store+0x44/0x60
>  c00000000058ccc0 sysfs_kf_write+0x70/0xa0
>  c00000000058b52c kernfs_fop_write+0x1ac/0x290
>  c0000000004a415c __vfs_write+0x3c/0x70
>  c0000000004a85ac vfs_write+0xec/0x200
>  c0000000004a8920 ksys_write+0x80/0x130
>  c00000000000bee4 system_call+0x5c/0x70
>
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  mm/page_alloc.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index 59661106da16..892eabe1ec13 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -5740,8 +5740,7 @@ void __meminit memmap_init_zone(unsigned long size, int nid, unsigned long zone,
>
>  #ifdef CONFIG_ZONE_DEVICE
>         /*
> -        * Honor reservation requested by the driver for this ZONE_DEVICE
> -        * memory. We limit the total number of pages to initialize to just
> +        * We limit the total number of pages to initialize to just
>          * those that might contain the memory mapping. We will defer the
>          * ZONE_DEVICE page initialization until after we have released
>          * the hotplug lock.
> @@ -5750,8 +5749,6 @@ void __meminit memmap_init_zone(unsigned long size, int nid, unsigned long zone,
>                 if (!altmap)
>                         return;
>
> -               if (start_pfn == altmap->base_pfn)
> -                       start_pfn += altmap->reserve;

If it's reserved then we should not be accessing, even if the above
works in practice. Isn't the fix something more like this to fix up
the assumptions at release time?

diff --git a/kernel/memremap.c b/kernel/memremap.c
index a856cb5ff192..9074ba14572c 100644
--- a/kernel/memremap.c
+++ b/kernel/memremap.c
@@ -90,6 +90,7 @@ static void devm_memremap_pages_release(void *data)
  struct device *dev = pgmap->dev;
  struct resource *res = &pgmap->res;
  resource_size_t align_start, align_size;
+ struct vmem_altmap *altmap = pgmap->altmap_valid ? &pgmap->altmap : NULL;
  unsigned long pfn;
  int nid;

@@ -102,7 +103,10 @@ static void devm_memremap_pages_release(void *data)
  align_size = ALIGN(res->start + resource_size(res), SECTION_SIZE)
  - align_start;

- nid = page_to_nid(pfn_to_page(align_start >> PAGE_SHIFT));
+ pfn = align_start >> PAGE_SHIFT;
+ if (altmap)
+ pfn += vmem_altmap_offset(altmap);
+ nid = page_to_nid(pfn_to_page(pfn));

  mem_hotplug_begin();
  if (pgmap->type == MEMORY_DEVICE_PRIVATE) {
@@ -110,8 +114,7 @@ static void devm_memremap_pages_release(void *data)
  __remove_pages(page_zone(pfn_to_page(pfn)), pfn,
  align_size >> PAGE_SHIFT, NULL);
  } else {
- arch_remove_memory(nid, align_start, align_size,
- pgmap->altmap_valid ? &pgmap->altmap : NULL);
+ arch_remove_memory(nid, align_start, align_size, altmap);
  kasan_remove_zero_shadow(__va(align_start), align_size);
  }
  mem_hotplug_done();
