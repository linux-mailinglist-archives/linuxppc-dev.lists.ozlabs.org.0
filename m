Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E3F366BF
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jun 2019 23:22:30 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45K1w34578zDqcy
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2019 07:22:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::541; helo=mail-ed1-x541.google.com;
 envelope-from=richard.weiyang@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="uI2GOFin"; 
 dkim-atps=neutral
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45K1td1JY3zDqYL
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jun 2019 07:21:12 +1000 (AEST)
Received: by mail-ed1-x541.google.com with SMTP id r18so7747085edo.7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 05 Jun 2019 14:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=DbESKGjaSdEzS+8K4ZZpYJHwCVMJbIIgpVyCBcGmoDA=;
 b=uI2GOFinAV8sZvL+69rPUYkiOvfq/P6RaIvMP/TCLE7Eigu+OsAMxrlQ7M56dpfeaB
 KXnPuGlaLKfjVW4OK022oY9x2O84uuKCnTuTJ2Hy/rU4g60rDzrdLH9+Tx5dD+CSiY7P
 MZd6Gt4WuEMmALvkc+6OxkvqFlyqE8pj0B+RKWqsERmaO6rCiyUFNdAQJaK+bn+j6ZDo
 3+Ozb7/fHxX66bj8rSxIxrArPzuRzb+SpAu32sfxsWnMui2GD+nbp3sZ5ByAMfIb0inB
 TyCDQNWvPlw0yG17KhNWZpYS35pRM3rqQaLlQ7Rzw4ggssD4+ZfqKxNNHceKsI3nMqCT
 +Ubw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=DbESKGjaSdEzS+8K4ZZpYJHwCVMJbIIgpVyCBcGmoDA=;
 b=gd2YBpONziAlP57Fw/g7Yq22WiOuJ6JVAl9QOMexnttw5P2Bes8PwiZB91Qro92L7N
 WwqDKXsarWWrR4A83U7a/xB6Zl0wbKBnETC82WOpbNja5ubjWf0qTMtQuHsUpBtWZdmY
 0kJDpWeswrp8v1IDmPVXCCG1YH4aQ1RrFEweN7u7VaNx0PFoVFCAaDk4m2tuOFXTgffK
 wnZ3W+1kRpbSNoCY1sDrOCQUaCmy3BW8jHdAbVIYU8TvmUu8OvD/yFLrPB+uOS+dVgNo
 lwSdM9gqjx1xU2Nj2Suz4zDJqbo5vDivN7BnFOb5HPhslVdv9I0l9wiqx/E5IRSpfl/m
 LnGw==
X-Gm-Message-State: APjAAAV74EuTfHRKPGYWwSP24IGxWM0HvuScmiVGe43hFbZey/8Wxwgs
 tXB2VEsGpsgBl40mpVod6tg=
X-Google-Smtp-Source: APXvYqyuNRjvHNzTb2gEE1mIj1supSxm4qc3GPA7ju0Tg73FF069vkjl4Ke6VX7sPJnRrK6BAE1EDw==
X-Received: by 2002:a50:b523:: with SMTP id y32mr38680719edd.209.1559769668613; 
 Wed, 05 Jun 2019 14:21:08 -0700 (PDT)
Received: from localhost ([185.92.221.13])
 by smtp.gmail.com with ESMTPSA id x19sm3180078edq.9.2019.06.05.14.21.07
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 05 Jun 2019 14:21:07 -0700 (PDT)
Date: Wed, 5 Jun 2019 21:21:06 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v3 10/11] mm/memory_hotplug: Make
 unregister_memory_block_under_nodes() never fail
Message-ID: <20190605212106.6folqx2zawbvzzmm@master>
References: <20190527111152.16324-1-david@redhat.com>
 <20190527111152.16324-11-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190527111152.16324-11-david@redhat.com>
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
Cc: linux-s390@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mark Brown <broonie@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 linux-kernel@vger.kernel.org, Wei Yang <richard.weiyang@gmail.com>,
 linux-mm@kvack.org, "David S. Miller" <davem@davemloft.net>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Alex Deucher <alexander.deucher@amd.com>, Igor Mammedov <imammedo@redhat.com>,
 akpm@linux-foundation.org, Chris Wilson <chris@chris-wilson.co.uk>,
 linuxppc-dev@lists.ozlabs.org, Dan Williams <dan.j.williams@intel.com>,
 linux-arm-kernel@lists.infradead.org, Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, May 27, 2019 at 01:11:51PM +0200, David Hildenbrand wrote:
>We really don't want anything during memory hotunplug to fail.
>We always pass a valid memory block device, that check can go. Avoid
>allocating memory and eventually failing. As we are always called under
>lock, we can use a static piece of memory. This avoids having to put
>the structure onto the stack, having to guess about the stack size
>of callers.
>
>Patch inspired by a patch from Oscar Salvador.
>
>In the future, there might be no need to iterate over nodes at all.
>mem->nid should tell us exactly what to remove. Memory block devices
>with mixed nodes (added during boot) should properly fenced off and never
>removed.
>
>Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>Cc: "Rafael J. Wysocki" <rafael@kernel.org>
>Cc: Alex Deucher <alexander.deucher@amd.com>
>Cc: "David S. Miller" <davem@davemloft.net>
>Cc: Mark Brown <broonie@kernel.org>
>Cc: Chris Wilson <chris@chris-wilson.co.uk>
>Cc: David Hildenbrand <david@redhat.com>
>Cc: Oscar Salvador <osalvador@suse.de>
>Cc: Andrew Morton <akpm@linux-foundation.org>
>Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>
>Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Wei Yang <richardw.yang@linux.intel.com>

>---
> drivers/base/node.c  | 18 +++++-------------
> include/linux/node.h |  5 ++---
> 2 files changed, 7 insertions(+), 16 deletions(-)
>
>diff --git a/drivers/base/node.c b/drivers/base/node.c
>index 04fdfa99b8bc..9be88fd05147 100644
>--- a/drivers/base/node.c
>+++ b/drivers/base/node.c
>@@ -803,20 +803,14 @@ int register_mem_sect_under_node(struct memory_block *mem_blk, void *arg)
> 
> /*
>  * Unregister memory block device under all nodes that it spans.
>+ * Has to be called with mem_sysfs_mutex held (due to unlinked_nodes).
>  */
>-int unregister_memory_block_under_nodes(struct memory_block *mem_blk)
>+void unregister_memory_block_under_nodes(struct memory_block *mem_blk)
> {
>-	NODEMASK_ALLOC(nodemask_t, unlinked_nodes, GFP_KERNEL);
> 	unsigned long pfn, sect_start_pfn, sect_end_pfn;
>+	static nodemask_t unlinked_nodes;
> 
>-	if (!mem_blk) {
>-		NODEMASK_FREE(unlinked_nodes);
>-		return -EFAULT;
>-	}
>-	if (!unlinked_nodes)
>-		return -ENOMEM;
>-	nodes_clear(*unlinked_nodes);
>-
>+	nodes_clear(unlinked_nodes);
> 	sect_start_pfn = section_nr_to_pfn(mem_blk->start_section_nr);
> 	sect_end_pfn = section_nr_to_pfn(mem_blk->end_section_nr);
> 	for (pfn = sect_start_pfn; pfn <= sect_end_pfn; pfn++) {
>@@ -827,15 +821,13 @@ int unregister_memory_block_under_nodes(struct memory_block *mem_blk)
> 			continue;
> 		if (!node_online(nid))
> 			continue;
>-		if (node_test_and_set(nid, *unlinked_nodes))
>+		if (node_test_and_set(nid, unlinked_nodes))
> 			continue;
> 		sysfs_remove_link(&node_devices[nid]->dev.kobj,
> 			 kobject_name(&mem_blk->dev.kobj));
> 		sysfs_remove_link(&mem_blk->dev.kobj,
> 			 kobject_name(&node_devices[nid]->dev.kobj));
> 	}
>-	NODEMASK_FREE(unlinked_nodes);
>-	return 0;
> }
> 
> int link_mem_sections(int nid, unsigned long start_pfn, unsigned long end_pfn)
>diff --git a/include/linux/node.h b/include/linux/node.h
>index 02a29e71b175..548c226966a2 100644
>--- a/include/linux/node.h
>+++ b/include/linux/node.h
>@@ -139,7 +139,7 @@ extern int register_cpu_under_node(unsigned int cpu, unsigned int nid);
> extern int unregister_cpu_under_node(unsigned int cpu, unsigned int nid);
> extern int register_mem_sect_under_node(struct memory_block *mem_blk,
> 						void *arg);
>-extern int unregister_memory_block_under_nodes(struct memory_block *mem_blk);
>+extern void unregister_memory_block_under_nodes(struct memory_block *mem_blk);
> 
> extern int register_memory_node_under_compute_node(unsigned int mem_nid,
> 						   unsigned int cpu_nid,
>@@ -175,9 +175,8 @@ static inline int register_mem_sect_under_node(struct memory_block *mem_blk,
> {
> 	return 0;
> }
>-static inline int unregister_memory_block_under_nodes(struct memory_block *mem_blk)
>+static inline void unregister_memory_block_under_nodes(struct memory_block *mem_blk)
> {
>-	return 0;
> }
> 
> static inline void register_hugetlbfs_with_node(node_registration_func_t reg,
>-- 
>2.20.1

-- 
Wei Yang
Help you, Help me
