Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A588618B11
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2019 15:57:28 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 450FK05MrSzDqQf
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2019 23:57:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::541; helo=mail-ed1-x541.google.com;
 envelope-from=richard.weiyang@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="oQCvYs9j"; 
 dkim-atps=neutral
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 450FH31tBdzDqMG
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 May 2019 23:55:42 +1000 (AEST)
Received: by mail-ed1-x541.google.com with SMTP id w11so2117393edl.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 May 2019 06:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=rj8sR0p1Edqa94H02tBjaXnEUtoaRjwEJVzZPumNj1g=;
 b=oQCvYs9jZqA0mKZRzCMWu05oFj2Zz17/PVNd4bwpPPpxmMr0K+ZQCs7yxqlPtfjuMy
 8OjUA2czA5H6SB9uPKPi/jS92gskpNjvYeYP/Q4yo9+o9Xrd9/e5lEK5NKwBomh3Cy8d
 txu9rR8KNjutQFiKex2oKNITF45PZElb82I9QA/6KUxfMCLsrY1lDcu5LtawuUioBTcj
 C363GL59Zdaxz2o8wF08BTrzO41fdEKqPgs6o4QzXc1PYVqQv9UpbOEWVkNzzqcmKdVj
 852r0xVwgC3ApDh6OJFtIWvfw2X6OVJBAUv3KUKUNUdncpeZkAmD/cq2XxXLjQEZfw5F
 hPxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=rj8sR0p1Edqa94H02tBjaXnEUtoaRjwEJVzZPumNj1g=;
 b=FGEuiJM95QnlWK7LbN2ZX7j7ZinAW75Syq27xTIPudG/Oj9y78SqHqqyXT+uzwA5nH
 /H1Fy6Riwb6+blbSweztGPyJPMjx1PBW5iOMOJs146A/5QPPQzoR2Njf0ysKW4hVXMoC
 vsV7lHlCEq0HLAtU36+ee1uE1FkAY/oGpZJP2jW+8WVXNNqwjaHgMxip/1rvAWRWCy2T
 zqhyvxwydkKdAIXkDRcUHtBxxqZpgPeLcBrRC7Tt54WQqlxmtvv/d4Dk9s2DwETp3JH7
 o6XOhy2rI9VdpAzoUu4c0NgrGKMXG6/+AaoL5YcpEz92GlusOme3D6xGD1c9ye76jGBB
 4npw==
X-Gm-Message-State: APjAAAUkxeMfSOnrXJh97I/jEG2zrb4bgx5zEO8l4CLQ/3pP5hpF0GVg
 W3ZSozNaozM7sNm7KclS0zg=
X-Google-Smtp-Source: APXvYqyqamcbXYaLythnIDnP0cKrQ7Jqxn1LlTAxYUXRdkLE65y8UJdLAseURDgvrzBfIKf7YsPB9w==
X-Received: by 2002:a50:a5b4:: with SMTP id a49mr4299981edc.30.1557410134597; 
 Thu, 09 May 2019 06:55:34 -0700 (PDT)
Received: from localhost ([185.92.221.13])
 by smtp.gmail.com with ESMTPSA id j55sm611135ede.27.2019.05.09.06.55.33
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 09 May 2019 06:55:33 -0700 (PDT)
Date: Thu, 9 May 2019 13:55:33 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v2 4/8] mm/memory_hotplug: Create memory block devices
 after arch_add_memory()
Message-ID: <20190509135533.6xok3v7rxxaohc77@master>
References: <20190507183804.5512-1-david@redhat.com>
 <20190507183804.5512-5-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190507183804.5512-5-david@redhat.com>
User-Agent: NeoMutt/20170113 (1.7.2)
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
Reply-To: Wei Yang <richard.weiyang@gmail.com>
Cc: linux-s390@vger.kernel.org, Michal Hocko <mhocko@suse.com>,
 linux-ia64@vger.kernel.org, Pavel Tatashin <pasha.tatashin@soleen.com>,
 linux-sh@vger.kernel.org, "mike.travis@hpe.com" <mike.travis@hpe.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Mathieu Malaterre <malat@debian.org>,
 linux-kernel@vger.kernel.org, Ingo Molnar <mingo@kernel.org>,
 linux-mm@kvack.org, Andrew Banman <andrew.banman@hpe.com>,
 Qian Cai <cai@lca.pw>, Arun KS <arunks@codeaurora.org>,
 akpm@linux-foundation.org, Wei Yang <richard.weiyang@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, Dan Williams <dan.j.williams@intel.com>,
 Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 07, 2019 at 08:38:00PM +0200, David Hildenbrand wrote:
>Only memory to be added to the buddy and to be onlined/offlined by
>user space using memory block devices needs (and should have!) memory
>block devices.
>
>Factor out creation of memory block devices Create all devices after
>arch_add_memory() succeeded. We can later drop the want_memblock parameter,
>because it is now effectively stale.
>
>Only after memory block devices have been added, memory can be onlined
>by user space. This implies, that memory is not visible to user space at
>all before arch_add_memory() succeeded.
>
>Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>Cc: "Rafael J. Wysocki" <rafael@kernel.org>
>Cc: David Hildenbrand <david@redhat.com>
>Cc: "mike.travis@hpe.com" <mike.travis@hpe.com>
>Cc: Andrew Morton <akpm@linux-foundation.org>
>Cc: Ingo Molnar <mingo@kernel.org>
>Cc: Andrew Banman <andrew.banman@hpe.com>
>Cc: Oscar Salvador <osalvador@suse.de>
>Cc: Michal Hocko <mhocko@suse.com>
>Cc: Pavel Tatashin <pasha.tatashin@soleen.com>
>Cc: Qian Cai <cai@lca.pw>
>Cc: Wei Yang <richard.weiyang@gmail.com>
>Cc: Arun KS <arunks@codeaurora.org>
>Cc: Mathieu Malaterre <malat@debian.org>
>Signed-off-by: David Hildenbrand <david@redhat.com>
>---
> drivers/base/memory.c  | 70 ++++++++++++++++++++++++++----------------
> include/linux/memory.h |  2 +-
> mm/memory_hotplug.c    | 15 ++++-----
> 3 files changed, 53 insertions(+), 34 deletions(-)
>
>diff --git a/drivers/base/memory.c b/drivers/base/memory.c
>index 6e0cb4fda179..862c202a18ca 100644
>--- a/drivers/base/memory.c
>+++ b/drivers/base/memory.c
>@@ -701,44 +701,62 @@ static int add_memory_block(int base_section_nr)
> 	return 0;
> }
> 
>+static void unregister_memory(struct memory_block *memory)
>+{
>+	BUG_ON(memory->dev.bus != &memory_subsys);
>+
>+	/* drop the ref. we got via find_memory_block() */
>+	put_device(&memory->dev);
>+	device_unregister(&memory->dev);
>+}
>+
> /*
>- * need an interface for the VM to add new memory regions,
>- * but without onlining it.
>+ * Create memory block devices for the given memory area. Start and size
>+ * have to be aligned to memory block granularity. Memory block devices
>+ * will be initialized as offline.
>  */
>-int hotplug_memory_register(int nid, struct mem_section *section)
>+int hotplug_memory_register(unsigned long start, unsigned long size)
> {
>-	int ret = 0;
>+	unsigned long block_nr_pages = memory_block_size_bytes() >> PAGE_SHIFT;
>+	unsigned long start_pfn = PFN_DOWN(start);
>+	unsigned long end_pfn = start_pfn + (size >> PAGE_SHIFT);
>+	unsigned long pfn;
> 	struct memory_block *mem;
>+	int ret = 0;
> 
>-	mutex_lock(&mem_sysfs_mutex);
>+	BUG_ON(!IS_ALIGNED(start, memory_block_size_bytes()));
>+	BUG_ON(!IS_ALIGNED(size, memory_block_size_bytes()));
> 
>-	mem = find_memory_block(section);
>-	if (mem) {
>-		mem->section_count++;
>-		put_device(&mem->dev);
>-	} else {
>-		ret = init_memory_block(&mem, section, MEM_OFFLINE);
>+	mutex_lock(&mem_sysfs_mutex);
>+	for (pfn = start_pfn; pfn != end_pfn; pfn += block_nr_pages) {
>+		mem = find_memory_block(__pfn_to_section(pfn));
>+		if (mem) {
>+			WARN_ON_ONCE(false);

One question here, the purpose of WARN_ON_ONCE(false) is? Would we trigger
this?

>+			put_device(&mem->dev);
>+			continue;
>+		}
>+		ret = init_memory_block(&mem, __pfn_to_section(pfn),
>+					MEM_OFFLINE);
> 		if (ret)
>-			goto out;
>-		mem->section_count++;
>+			break;
>+		mem->section_count = memory_block_size_bytes() /
>+				     MIN_MEMORY_BLOCK_SIZE;

Maybe we can leverage sections_per_block variable.

                mem->section_count = sections_per_block;

>+	}
>+	if (ret) {
>+		end_pfn = pfn;
>+		for (pfn = start_pfn; pfn != end_pfn; pfn += block_nr_pages) {
>+			mem = find_memory_block(__pfn_to_section(pfn));
>+			if (!mem)
>+				continue;
>+			mem->section_count = 0;
>+			unregister_memory(mem);
>+		}
> 	}

-- 
Wei Yang
Help you, Help me
