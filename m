Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 592DF35211
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2019 23:43:57 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45JQRG4JqlzDqVv
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jun 2019 07:43:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::543; helo=mail-ed1-x543.google.com;
 envelope-from=richard.weiyang@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="MvGpvha5"; 
 dkim-atps=neutral
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45JQPt2mpgzDqVB
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Jun 2019 07:42:39 +1000 (AEST)
Received: by mail-ed1-x543.google.com with SMTP id w33so2550152edb.10
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 Jun 2019 14:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=kGgg2cwccQhQ87BOLNQ19P0eOVj/IxJHAOcVaT8qQRo=;
 b=MvGpvha5uoaqY64DB9m3OiEBHBCB0j/M3ygCmk9qYPQh0e62kI5YP56dl+XWkyPnPj
 EG/cWmaZtCuz9hrmKDhu4vozWbJ9HCkn7M8Ttp4ZeNIEWR+kY0Xs1oHmqWMFnzgffAmo
 aey94bU9w8nbfa6XiE5SwjNNvKvkfk8p0vKyNskG+C2prnMXAnSjjP70FTRoflsXkKBc
 d4IfMDucbN7yQaPg6KW7aP3MSRkOfE5IhyOPp/ZbfuiWxjztb8ng2R3gwnFogtiBFUd5
 uMSDMlELCgRY0FjQycMIniwNmizvH+zAX04W5t/NFF3kWUW3eih44Ay8/4cnCTikeQeY
 whig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=kGgg2cwccQhQ87BOLNQ19P0eOVj/IxJHAOcVaT8qQRo=;
 b=m6DidS5PqbfNQ9i1RJlNEEusnPZzX+CSBke3DumjisqjZxpAa07L4SdlD3So+7HkOX
 kVkTdxmjTInH9ZreN1HOO5WUNkh1KTs28Acmy92BhQnImvOnQAFTyQmxalwsUbeDBDN3
 clUAKTdghEBsQZzJ3KJErX8VHk0wjNQgX2lNPpV9h2m91C8+hCuOXk3Hfeu+WyhVrxDS
 HFUr0+/qO183auO9fZM6EvkDe5i9CP2Ai1cTVJrDSfzuVmdIsipwwng7EeHfj4PBHKxr
 GwpWZDHPjehn9SRfjmAlaywXI5g0MDKztdONHx0M20zZ+aDfktDp00keYbfoPI0fC2+a
 82iw==
X-Gm-Message-State: APjAAAVxOI3ttuOdHXOC6Sw3ses1fZfz1g1VWebyJ7JI8D/xsQU0lp09
 +3aVdTZWq2xKp/ionDpKqd0=
X-Google-Smtp-Source: APXvYqxAJB613MXS5SsQSAVAhyXKrrpfkgYY86Logu8BWUaW7EUGho3leJeBoyNfYrNBhWO+qVCbjg==
X-Received: by 2002:a17:906:1303:: with SMTP id
 w3mr32002043ejb.196.1559684555972; 
 Tue, 04 Jun 2019 14:42:35 -0700 (PDT)
Received: from localhost ([185.92.221.13])
 by smtp.gmail.com with ESMTPSA id r14sm3337551eja.77.2019.06.04.14.42.34
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 04 Jun 2019 14:42:34 -0700 (PDT)
Date: Tue, 4 Jun 2019 21:42:34 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v3 07/11] mm/memory_hotplug: Create memory block devices
 after arch_add_memory()
Message-ID: <20190604214234.ltwtkcdoju2gxisx@master>
References: <20190527111152.16324-1-david@redhat.com>
 <20190527111152.16324-8-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190527111152.16324-8-david@redhat.com>
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
 Pavel Tatashin <pasha.tatashin@soleen.com>,
 "mike.travis@hpe.com" <mike.travis@hpe.com>, Qian Cai <cai@lca.pw>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 Oscar Salvador <osalvador@suse.de>, Andrew Banman <andrew.banman@hpe.com>,
 Mathieu Malaterre <malat@debian.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Igor Mammedov <imammedo@redhat.com>, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, May 27, 2019 at 01:11:48PM +0200, David Hildenbrand wrote:
>Only memory to be added to the buddy and to be onlined/offlined by
>user space using /sys/devices/system/memory/... needs (and should have!)
>memory block devices.
>
>Factor out creation of memory block devices. Create all devices after
>arch_add_memory() succeeded. We can later drop the want_memblock parameter,
>because it is now effectively stale.
>
>Only after memory block devices have been added, memory can be onlined
>by user space. This implies, that memory is not visible to user space at
>all before arch_add_memory() succeeded.
>
>While at it
>- use WARN_ON_ONCE instead of BUG_ON in moved unregister_memory()
>- introduce find_memory_block_by_id() to search via block id
>- Use find_memory_block_by_id() in init_memory_block() to catch
>  duplicates

Generally looks good to me besides two tiny comments.

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
> drivers/base/memory.c  | 82 +++++++++++++++++++++++++++---------------
> include/linux/memory.h |  2 +-
> mm/memory_hotplug.c    | 15 ++++----
> 3 files changed, 63 insertions(+), 36 deletions(-)
>
>diff --git a/drivers/base/memory.c b/drivers/base/memory.c
>index ac17c95a5f28..5a0370f0c506 100644
>--- a/drivers/base/memory.c
>+++ b/drivers/base/memory.c
>@@ -39,6 +39,11 @@ static inline int base_memory_block_id(int section_nr)
> 	return section_nr / sections_per_block;
> }
> 
>+static inline int pfn_to_block_id(unsigned long pfn)
>+{
>+	return base_memory_block_id(pfn_to_section_nr(pfn));
>+}
>+
> static int memory_subsys_online(struct device *dev);
> static int memory_subsys_offline(struct device *dev);
> 
>@@ -582,10 +587,9 @@ int __weak arch_get_memory_phys_device(unsigned long start_pfn)
>  * A reference for the returned object is held and the reference for the
>  * hinted object is released.
>  */
>-struct memory_block *find_memory_block_hinted(struct mem_section *section,
>-					      struct memory_block *hint)
>+static struct memory_block *find_memory_block_by_id(int block_id,
>+						    struct memory_block *hint)
> {
>-	int block_id = base_memory_block_id(__section_nr(section));
> 	struct device *hintdev = hint ? &hint->dev : NULL;
> 	struct device *dev;
> 
>@@ -597,6 +601,14 @@ struct memory_block *find_memory_block_hinted(struct mem_section *section,
> 	return to_memory_block(dev);
> }
> 
>+struct memory_block *find_memory_block_hinted(struct mem_section *section,
>+					      struct memory_block *hint)
>+{
>+	int block_id = base_memory_block_id(__section_nr(section));
>+
>+	return find_memory_block_by_id(block_id, hint);
>+}
>+
> /*
>  * For now, we have a linear search to go find the appropriate
>  * memory_block corresponding to a particular phys_index. If
>@@ -658,6 +670,11 @@ static int init_memory_block(struct memory_block **memory, int block_id,
> 	unsigned long start_pfn;
> 	int ret = 0;
> 
>+	mem = find_memory_block_by_id(block_id, NULL);
>+	if (mem) {
>+		put_device(&mem->dev);
>+		return -EEXIST;
>+	}

find_memory_block_by_id() is not that close to the main idea in this patch.
Would it be better to split this part?

> 	mem = kzalloc(sizeof(*mem), GFP_KERNEL);
> 	if (!mem)
> 		return -ENOMEM;
>@@ -699,44 +716,53 @@ static int add_memory_block(int base_section_nr)
> 	return 0;
> }
> 
>+static void unregister_memory(struct memory_block *memory)
>+{
>+	if (WARN_ON_ONCE(memory->dev.bus != &memory_subsys))
>+		return;
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
>+int create_memory_block_devices(unsigned long start, unsigned long size)
> {
>-	int block_id = base_memory_block_id(__section_nr(section));
>-	int ret = 0;
>+	const int start_block_id = pfn_to_block_id(PFN_DOWN(start));
>+	int end_block_id = pfn_to_block_id(PFN_DOWN(start + size));
> 	struct memory_block *mem;
>+	unsigned long block_id;
>+	int ret = 0;
> 
>-	mutex_lock(&mem_sysfs_mutex);
>+	if (WARN_ON_ONCE(!IS_ALIGNED(start, memory_block_size_bytes()) ||
>+			 !IS_ALIGNED(size, memory_block_size_bytes())))
>+		return -EINVAL;
> 
>-	mem = find_memory_block(section);
>-	if (mem) {
>-		mem->section_count++;
>-		put_device(&mem->dev);
>-	} else {
>+	mutex_lock(&mem_sysfs_mutex);
>+	for (block_id = start_block_id; block_id != end_block_id; block_id++) {
> 		ret = init_memory_block(&mem, block_id, MEM_OFFLINE);
> 		if (ret)
>-			goto out;
>-		mem->section_count++;
>+			break;
>+		mem->section_count = sections_per_block;
>+	}
>+	if (ret) {
>+		end_block_id = block_id;
>+		for (block_id = start_block_id; block_id != end_block_id;
>+		     block_id++) {
>+			mem = find_memory_block_by_id(block_id, NULL);
>+			mem->section_count = 0;
>+			unregister_memory(mem);
>+		}
> 	}

Would it be better to do this in reverse order?

And unregister_memory() would free mem, so it is still necessary to set
section_count to 0?

>-
>-out:
> 	mutex_unlock(&mem_sysfs_mutex);
> 	return ret;
> }
> 
>-static void
>-unregister_memory(struct memory_block *memory)
>-{
>-	BUG_ON(memory->dev.bus != &memory_subsys);
>-
>-	/* drop the ref. we got via find_memory_block() */
>-	put_device(&memory->dev);
>-	device_unregister(&memory->dev);
>-}
>-
> void unregister_memory_section(struct mem_section *section)
> {
> 	struct memory_block *mem;
>diff --git a/include/linux/memory.h b/include/linux/memory.h
>index 474c7c60c8f2..db3e8567f900 100644
>--- a/include/linux/memory.h
>+++ b/include/linux/memory.h
>@@ -111,7 +111,7 @@ extern int register_memory_notifier(struct notifier_block *nb);
> extern void unregister_memory_notifier(struct notifier_block *nb);
> extern int register_memory_isolate_notifier(struct notifier_block *nb);
> extern void unregister_memory_isolate_notifier(struct notifier_block *nb);
>-int hotplug_memory_register(int nid, struct mem_section *section);
>+int create_memory_block_devices(unsigned long start, unsigned long size);
> extern void unregister_memory_section(struct mem_section *);
> extern int memory_dev_init(void);
> extern int memory_notify(unsigned long val, void *v);
>diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
>index 4b9d2974f86c..b1fde90bbf19 100644
>--- a/mm/memory_hotplug.c
>+++ b/mm/memory_hotplug.c
>@@ -259,13 +259,7 @@ static int __meminit __add_section(int nid, unsigned long phys_start_pfn,
> 		return -EEXIST;
> 
> 	ret = sparse_add_one_section(nid, phys_start_pfn, altmap);
>-	if (ret < 0)
>-		return ret;
>-
>-	if (!want_memblock)
>-		return 0;
>-
>-	return hotplug_memory_register(nid, __pfn_to_section(phys_start_pfn));
>+	return ret < 0 ? ret : 0;
> }
> 
> /*
>@@ -1107,6 +1101,13 @@ int __ref add_memory_resource(int nid, struct resource *res)
> 	if (ret < 0)
> 		goto error;
> 
>+	/* create memory block devices after memory was added */
>+	ret = create_memory_block_devices(start, size);
>+	if (ret) {
>+		arch_remove_memory(nid, start, size, NULL);
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
