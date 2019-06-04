Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7218A3528B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jun 2019 00:08:34 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45JQzh09wYzDqWp
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jun 2019 08:08:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::542; helo=mail-ed1-x542.google.com;
 envelope-from=richard.weiyang@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="r8eh4ERe"; 
 dkim-atps=neutral
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45JQyK70GDzDqKw
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Jun 2019 08:07:19 +1000 (AEST)
Received: by mail-ed1-x542.google.com with SMTP id f20so2619256edt.12
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 Jun 2019 15:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=PpKRuZzE7T8mOmzox/3fZWCQGJE/CKE/yKMFRhJ3Gf8=;
 b=r8eh4EReBOdbIPu4A1NNDGdXjFzs0/kcbitZHKKZAYaKNhXocwZblb/UDa/qHzpM4n
 H2elaGGk/e0gnNHPNwXKeHcAQnQ8whjG7luxPB1MehVQyRYd3L+0WhuLTmYgNONF0vQW
 /gT+d74vRjcqjUKUEja8QETsFhVds03K5SF2Vi+Gp28hsN/co8yAmDLlQo3XBDCsBx2t
 f10hoB3oefeCwKc/mwr3FNtMVXdQwW6jVfZhmt0IMWacdGBiHQOhNJfFHpgBzQfAMbQK
 Rzmp33l1qbOkzsE3obd4pS9v0hxJDLo8arS3ayyMB+ypJKFinJf8JyWlCou/md606BC2
 cf8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=PpKRuZzE7T8mOmzox/3fZWCQGJE/CKE/yKMFRhJ3Gf8=;
 b=l0WcLmPbxBgylgZebpDgvX/PnngmPK0DDRP2GnwxpK1jbnBFF48kTjnu92TB4iuMUL
 mx0JgLqMdyaGH+pCEBim7Tb7hoVRNLmdrRzOZz+mqQXcyZ/r6rWYaYzaG6YDOZt75OkD
 fU3F7xNZzWFBSOZVRiyNB/oyaMt1R3tjicBFGG/VTfQzl0C8UoSf7X5YlmWl+n/G+RX8
 TdWGcWP4xsyycznhfbNjGdnk8/36165KcavR1oDz0uWlBzZuprzSPrLiwlZOd6q+WWct
 QZDD4F1oFAjlKydNkV1rgCIu30kDDg1CoS13DCw8amNshDvQKZFSymjKAiZVAy1xIU2G
 Yvjg==
X-Gm-Message-State: APjAAAUSLcCoSU1Hiv+TmJN9Z8+RMa0eG0uj6RjXjh7GxJZ1pJLf7R+n
 n2dDDQG/rgxvh2tv3uo5FxQ=
X-Google-Smtp-Source: APXvYqylJIv8N/2T6SjJp9NjY4VYtrcjtyg9w7oKoH7rUr1NCX7/8z5VGMCfO72kUy5fqWBqTC3/4A==
X-Received: by 2002:aa7:c3c9:: with SMTP id l9mr30726945edr.23.1559686037033; 
 Tue, 04 Jun 2019 15:07:17 -0700 (PDT)
Received: from localhost ([185.92.221.13])
 by smtp.gmail.com with ESMTPSA id g18sm5036344edh.13.2019.06.04.15.07.16
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 04 Jun 2019 15:07:16 -0700 (PDT)
Date: Tue, 4 Jun 2019 22:07:15 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v3 09/11] mm/memory_hotplug: Remove memory block devices
 before arch_remove_memory()
Message-ID: <20190604220715.d4d2ctwjk25vd5sq@master>
References: <20190527111152.16324-1-david@redhat.com>
 <20190527111152.16324-10-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190527111152.16324-10-david@redhat.com>
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
Cc: Michal Hocko <mhocko@suse.com>, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, Wei Yang <richard.weiyang@gmail.com>,
 linux-mm@kvack.org, Arun KS <arunks@codeaurora.org>,
 Ingo Molnar <mingo@kernel.org>, linux-s390@vger.kernel.org,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Pavel Tatashin <pavel.tatashin@microsoft.com>,
 "mike.travis@hpe.com" <mike.travis@hpe.com>, Mark Brown <broonie@kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>, linux-arm-kernel@lists.infradead.org,
 Oscar Salvador <osalvador@suse.de>, Andrew Banman <andrew.banman@hpe.com>,
 Mathieu Malaterre <malat@debian.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>, Igor Mammedov <imammedo@redhat.com>,
 akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, May 27, 2019 at 01:11:50PM +0200, David Hildenbrand wrote:
>Let's factor out removing of memory block devices, which is only
>necessary for memory added via add_memory() and friends that created
>memory block devices. Remove the devices before calling
>arch_remove_memory().
>
>This finishes factoring out memory block device handling from
>arch_add_memory() and arch_remove_memory().
>
>Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>Cc: "Rafael J. Wysocki" <rafael@kernel.org>
>Cc: David Hildenbrand <david@redhat.com>
>Cc: "mike.travis@hpe.com" <mike.travis@hpe.com>
>Cc: Andrew Morton <akpm@linux-foundation.org>
>Cc: Andrew Banman <andrew.banman@hpe.com>
>Cc: Ingo Molnar <mingo@kernel.org>
>Cc: Alex Deucher <alexander.deucher@amd.com>
>Cc: "David S. Miller" <davem@davemloft.net>
>Cc: Mark Brown <broonie@kernel.org>
>Cc: Chris Wilson <chris@chris-wilson.co.uk>
>Cc: Oscar Salvador <osalvador@suse.de>
>Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>
>Cc: Michal Hocko <mhocko@suse.com>
>Cc: Pavel Tatashin <pavel.tatashin@microsoft.com>
>Cc: Arun KS <arunks@codeaurora.org>
>Cc: Mathieu Malaterre <malat@debian.org>
>Reviewed-by: Dan Williams <dan.j.williams@intel.com>
>Signed-off-by: David Hildenbrand <david@redhat.com>
>---
> drivers/base/memory.c  | 37 ++++++++++++++++++-------------------
> drivers/base/node.c    | 11 ++++++-----
> include/linux/memory.h |  2 +-
> include/linux/node.h   |  6 ++----
> mm/memory_hotplug.c    |  5 +++--
> 5 files changed, 30 insertions(+), 31 deletions(-)
>
>diff --git a/drivers/base/memory.c b/drivers/base/memory.c
>index 5a0370f0c506..f28efb0bf5c7 100644
>--- a/drivers/base/memory.c
>+++ b/drivers/base/memory.c
>@@ -763,32 +763,31 @@ int create_memory_block_devices(unsigned long start, unsigned long size)
> 	return ret;
> }
> 
>-void unregister_memory_section(struct mem_section *section)
>+/*
>+ * Remove memory block devices for the given memory area. Start and size
>+ * have to be aligned to memory block granularity. Memory block devices
>+ * have to be offline.
>+ */
>+void remove_memory_block_devices(unsigned long start, unsigned long size)
> {
>+	const int start_block_id = pfn_to_block_id(PFN_DOWN(start));
>+	const int end_block_id = pfn_to_block_id(PFN_DOWN(start + size));
> 	struct memory_block *mem;
>+	int block_id;
> 
>-	if (WARN_ON_ONCE(!present_section(section)))
>+	if (WARN_ON_ONCE(!IS_ALIGNED(start, memory_block_size_bytes()) ||
>+			 !IS_ALIGNED(size, memory_block_size_bytes())))
> 		return;
> 
> 	mutex_lock(&mem_sysfs_mutex);
>-
>-	/*
>-	 * Some users of the memory hotplug do not want/need memblock to
>-	 * track all sections. Skip over those.
>-	 */
>-	mem = find_memory_block(section);
>-	if (!mem)
>-		goto out_unlock;
>-
>-	unregister_mem_sect_under_nodes(mem, __section_nr(section));
>-
>-	mem->section_count--;
>-	if (mem->section_count == 0)
>+	for (block_id = start_block_id; block_id != end_block_id; block_id++) {
>+		mem = find_memory_block_by_id(block_id, NULL);
>+		if (WARN_ON_ONCE(!mem))
>+			continue;
>+		mem->section_count = 0;

Is this step necessary?

>+		unregister_memory_block_under_nodes(mem);
> 		unregister_memory(mem);
>-	else
>-		put_device(&mem->dev);
>-
>-out_unlock:
>+	}
> 	mutex_unlock(&mem_sysfs_mutex);
> }
> 
>diff --git a/drivers/base/node.c b/drivers/base/node.c
>index 8598fcbd2a17..04fdfa99b8bc 100644
>--- a/drivers/base/node.c
>+++ b/drivers/base/node.c
>@@ -801,9 +801,10 @@ int register_mem_sect_under_node(struct memory_block *mem_blk, void *arg)
> 	return 0;
> }
> 
>-/* unregister memory section under all nodes that it spans */
>-int unregister_mem_sect_under_nodes(struct memory_block *mem_blk,
>-				    unsigned long phys_index)
>+/*
>+ * Unregister memory block device under all nodes that it spans.
>+ */
>+int unregister_memory_block_under_nodes(struct memory_block *mem_blk)
> {
> 	NODEMASK_ALLOC(nodemask_t, unlinked_nodes, GFP_KERNEL);
> 	unsigned long pfn, sect_start_pfn, sect_end_pfn;
>@@ -816,8 +817,8 @@ int unregister_mem_sect_under_nodes(struct memory_block *mem_blk,
> 		return -ENOMEM;
> 	nodes_clear(*unlinked_nodes);
> 
>-	sect_start_pfn = section_nr_to_pfn(phys_index);
>-	sect_end_pfn = sect_start_pfn + PAGES_PER_SECTION - 1;
>+	sect_start_pfn = section_nr_to_pfn(mem_blk->start_section_nr);
>+	sect_end_pfn = section_nr_to_pfn(mem_blk->end_section_nr);
> 	for (pfn = sect_start_pfn; pfn <= sect_end_pfn; pfn++) {
> 		int nid;
> 
>diff --git a/include/linux/memory.h b/include/linux/memory.h
>index db3e8567f900..f26a5417ec5d 100644
>--- a/include/linux/memory.h
>+++ b/include/linux/memory.h
>@@ -112,7 +112,7 @@ extern void unregister_memory_notifier(struct notifier_block *nb);
> extern int register_memory_isolate_notifier(struct notifier_block *nb);
> extern void unregister_memory_isolate_notifier(struct notifier_block *nb);
> int create_memory_block_devices(unsigned long start, unsigned long size);
>-extern void unregister_memory_section(struct mem_section *);
>+void remove_memory_block_devices(unsigned long start, unsigned long size);
> extern int memory_dev_init(void);
> extern int memory_notify(unsigned long val, void *v);
> extern int memory_isolate_notify(unsigned long val, void *v);
>diff --git a/include/linux/node.h b/include/linux/node.h
>index 1a557c589ecb..02a29e71b175 100644
>--- a/include/linux/node.h
>+++ b/include/linux/node.h
>@@ -139,8 +139,7 @@ extern int register_cpu_under_node(unsigned int cpu, unsigned int nid);
> extern int unregister_cpu_under_node(unsigned int cpu, unsigned int nid);
> extern int register_mem_sect_under_node(struct memory_block *mem_blk,
> 						void *arg);
>-extern int unregister_mem_sect_under_nodes(struct memory_block *mem_blk,
>-					   unsigned long phys_index);
>+extern int unregister_memory_block_under_nodes(struct memory_block *mem_blk);
> 
> extern int register_memory_node_under_compute_node(unsigned int mem_nid,
> 						   unsigned int cpu_nid,
>@@ -176,8 +175,7 @@ static inline int register_mem_sect_under_node(struct memory_block *mem_blk,
> {
> 	return 0;
> }
>-static inline int unregister_mem_sect_under_nodes(struct memory_block *mem_blk,
>-						  unsigned long phys_index)
>+static inline int unregister_memory_block_under_nodes(struct memory_block *mem_blk)
> {
> 	return 0;
> }
>diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
>index 9a92549ef23b..82136c5b4c5f 100644
>--- a/mm/memory_hotplug.c
>+++ b/mm/memory_hotplug.c
>@@ -520,8 +520,6 @@ static void __remove_section(struct zone *zone, struct mem_section *ms,
> 	if (WARN_ON_ONCE(!valid_section(ms)))
> 		return;
> 
>-	unregister_memory_section(ms);
>-
> 	scn_nr = __section_nr(ms);
> 	start_pfn = section_nr_to_pfn((unsigned long)scn_nr);
> 	__remove_zone(zone, start_pfn);
>@@ -1845,6 +1843,9 @@ void __ref __remove_memory(int nid, u64 start, u64 size)
> 	memblock_free(start, size);
> 	memblock_remove(start, size);
> 
>+	/* remove memory block devices before removing memory */
>+	remove_memory_block_devices(start, size);
>+
> 	arch_remove_memory(nid, start, size, NULL);
> 	__release_memory_resource(start, size);
> 
>-- 
>2.20.1

-- 
Wei Yang
Help you, Help me
