Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 49BBC18BE0
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2019 16:34:22 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 450G7b5tsbzDqRp
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 May 2019 00:34:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::543; helo=mail-ed1-x543.google.com;
 envelope-from=richard.weiyang@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="qOlNtK75"; 
 dkim-atps=neutral
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 450G4v0zVNzDqPy
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 May 2019 00:31:58 +1000 (AEST)
Received: by mail-ed1-x543.google.com with SMTP id a8so2241592edx.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 May 2019 07:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=28M3/Gt0muyIKgyfcpD9ysscEUSK1ZnFipvrQH7okoo=;
 b=qOlNtK752XXn4kkfsFMWyY7kRPfrZUsTtqBPdR/hrsY1mJM2tbu2nhsutSmVVSM1WW
 nXRASbDxRAmYKoGMORG1Srq+QfFSesIFDMzjzchm3j4kE/sLGsIywSyqVlu3Yz91d/8r
 FlEQUB4qvWSHM4vKfCBekEvL6H1BeRT6mMgSjN/ZfvQ7xjppTiRrhRzhd0DiONdD3rHG
 8+F+D+pkIWAxOZxeIGT+39UvOnSIMPWvX3z65R9GJNUd8yqfL58nMe8pY6Q7GvVCzYIM
 6GCvJUep1xdo/Z8mF1dvC94zMfD6T5hlTY7VkMhVkudMpY654rvkzmeZxmnK6kPTSOvF
 yY0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=28M3/Gt0muyIKgyfcpD9ysscEUSK1ZnFipvrQH7okoo=;
 b=sdBhghvB2jkmhSBaP0/K1Rcr8bpIy8fuGgkZHYZ1yV/RJ0sRw5KABflbTkI3sWHZuJ
 ubx0OAACP06Efz2XgVIWh+xC7nuAhKn1Xn14kR89T0P4wedq25fTl6oqtmaQX2ge/n2I
 PLL+6+ESqMFfwpZXU4AokgHRnH5znNuZttuCccCEQLnYOQ/lW73Zxaxlv7VBC+CzBrDT
 pB7//TaWCdmC4mxYhlkb8L/MNx2jOUpbCPAOzlQCknHsdzpEIQFu/+GgoON8JXDCKHIF
 yqze9USPLe373WKZjedTWF+DpT/NY6mcHvpjJQRLMH2yqk2zx2hKOD0bnj5tNNDmmOxu
 0yxw==
X-Gm-Message-State: APjAAAWb4Kz08stCtUQPxgU7I0eWiL3gb8apfPjg4dhLbtXGDrrtFfbt
 t5p8M2k/WKprm9YXDbHlkbo=
X-Google-Smtp-Source: APXvYqzkJhS5L8NnWGrt01x6w71u7E8s0GHuJykWEj8KfZGhfTtKpBAzu9nFzSqSe/2NArkKjIgUMw==
X-Received: by 2002:a50:be48:: with SMTP id b8mr4401819edi.284.1557412313899; 
 Thu, 09 May 2019 07:31:53 -0700 (PDT)
Received: from localhost ([185.92.221.13])
 by smtp.gmail.com with ESMTPSA id d11sm623679eda.45.2019.05.09.07.31.52
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 09 May 2019 07:31:52 -0700 (PDT)
Date: Thu, 9 May 2019 14:31:51 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v2 4/8] mm/memory_hotplug: Create memory block devices
 after arch_add_memory()
Message-ID: <20190509143151.zexjmwu3ikkmye7i@master>
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

One trivial suggestion about the function name.

For memory_block device, sometimes we use the full name

    find_memory_block
    init_memory_block
    add_memory_block

But sometimes we use *nick* name

    hotplug_memory_register
    register_memory
    unregister_memory

This is a little bit confusion.

Can we use one name convention here? 

[...]

> /*
>@@ -1106,6 +1100,13 @@ int __ref add_memory_resource(int nid, struct resource *res)
> 	if (ret < 0)
> 		goto error;
> 
>+	/* create memory block devices after memory was added */
>+	ret = hotplug_memory_register(start, size);
>+	if (ret) {
>+		arch_remove_memory(nid, start, size, NULL);

Functionally, it works I think.

But arch_remove_memory() would remove pages from zone. At this point, we just
allocate section/mmap for pages, the zones are empty and pages are not
connected to zone.

Function  zone = page_zone(page); always gets zone #0, since pages->flags is 0
at  this point. This is not exact.

Would we add some comment to mention this? Or we need to clean up
arch_remove_memory() to take out __remove_zone()?


>+		goto error;
>+	}
>+
> 	if (new_node) {
> 		/* If sysfs file of new node can't be created, cpu on the node
> 		 * can't be hot-added. There is no rollback way now.
>-- 
>2.20.1

-- 
Wei Yang
Help you, Help me
