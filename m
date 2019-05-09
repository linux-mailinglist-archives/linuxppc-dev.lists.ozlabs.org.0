Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id ED728189F6
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2019 14:44:43 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 450Cj52pDkzDqQF
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2019 22:44:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::543; helo=mail-ed1-x543.google.com;
 envelope-from=richard.weiyang@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="X8+t1ymT"; 
 dkim-atps=neutral
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 450CgJ6G7lzDqCK
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 May 2019 22:43:06 +1000 (AEST)
Received: by mail-ed1-x543.google.com with SMTP id w33so1880855edb.10
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 May 2019 05:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=QsgdOJDYHn/tfXe+apw05fuvXqjWkWLQh0vbJ3o4icQ=;
 b=X8+t1ymTYcyltAjf8v1dQF+XWnX6+Ka0h/n/Sp7NhymDucJNtZxdecMYnob2Injauf
 prmYn1KR0VaeFSnO5nN8SN73MXJZF0qI0mBEWIBZB9pui+fjXk9cWdDD+EyINCqMgx1Q
 PT6yJp94Qz0hthu8VQ2H1YaSFHjZ38HZ42VY4SnfYBSPXK/HDzFbSeoj3OQPuaOLAeFe
 eEJ1P8uvRoUwH9aNBvgmstZw14Q6XOf7bFPU079ouZQh/1QDXXkqf2kPgwMwSU+bFA7e
 LD8hzyVTjeLmlSqIETgbTm+FSLcZYsbhL7kX75dUPEc6gceTAXEWMhIGe/3LdCM831GM
 7kmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=QsgdOJDYHn/tfXe+apw05fuvXqjWkWLQh0vbJ3o4icQ=;
 b=GjwQS0jIHUS5y2sJw5v6ViksVgsHBLFPjmlVhp+4jB7iqpgN1Ho8FIDEewbekNAFU/
 zhTdQDZwVarb7oB48I/+aayDP87b4QI6G4mgNvJ9PSdOLP7VTcdVr4sILMgszSqSJ0dn
 Odct7/Up4J6XuQqSpA8OBCOPESzwmzefHbpcdDdteHdwIPVJb1pZSgMgsMzxXjxDsLSL
 +IW4AbDjm2yf6PHqbpNgsuNvAGuvouIUis/LhhryhpZH+wdd1gIlboNHqE8l1KDkTLgh
 WKg+qQDnkd9YiM7FmNomgXooj81MBN0S1OE9L0IqlU25a6gm90JKedA5T9U8ddm8DlXO
 wsuQ==
X-Gm-Message-State: APjAAAUvz170K7ojZSiIT9BfWAbxtAbJ6h3aeFBuUxpnxie0Vu3mqehv
 oUBxjKRiL08DIzNpGrrAUxU=
X-Google-Smtp-Source: APXvYqwSMvc+IkN0goCuzZGHyfnoTzg7aUzcqfUpVzHNwIsf6cZyZm3yry5tEzCvNGV+FZLlTxCadw==
X-Received: by 2002:a17:906:1984:: with SMTP id
 g4mr3006437ejd.260.1557405783809; 
 Thu, 09 May 2019 05:43:03 -0700 (PDT)
Received: from localhost ([185.92.221.13])
 by smtp.gmail.com with ESMTPSA id e21sm300748ejk.86.2019.05.09.05.43.02
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 09 May 2019 05:43:02 -0700 (PDT)
Date: Thu, 9 May 2019 12:43:02 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v2 4/8] mm/memory_hotplug: Create memory block devices
 after arch_add_memory()
Message-ID: <20190509124302.at7jltfrycj7sxbd@master>
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

After this change, the call flow looks like this:

add_memory_resource
    check_hotplug_memory_range
    hotplug_memory_register

Since in check_hotplug_memory_range() has checked the boundary, do we need to
check here again?

-- 
Wei Yang
Help you, Help me
