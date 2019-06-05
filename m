Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BF011366C8
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jun 2019 23:24:03 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45K1xs1TdmzDqW0
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2019 07:24:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::544; helo=mail-ed1-x544.google.com;
 envelope-from=richard.weiyang@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="HtLdXNwl"; 
 dkim-atps=neutral
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45K1ty6BqrzDqZn
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jun 2019 07:21:30 +1000 (AEST)
Received: by mail-ed1-x544.google.com with SMTP id c26so33677edt.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 05 Jun 2019 14:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=jmqIL302FliKztrku23iEbel/vN8Om9KZr4KoJVUQBs=;
 b=HtLdXNwlPpU1RFxmpHZq/rH78NiFyUbMRNR4XLHGl5DFaciTYXzczF+YOEaOthAltb
 LzfrkniAfXeG9XfS8k8l9WWdWJTCb5t0Qydwrx9HDSWfQxVverG9o6eBxNShll611+Xk
 D8MDiZNeQ9S8YaEkKYI92ohNxvxiKGjBgdANYmGfcUxcUcAmDq0kOuCUWCUGDd+d7T8p
 u6tdGt0M3uFblUt67ApuYvpm2psLcK1H66EYwESimtXZEx5o8tKBJ+DBxrVlRNPstQNp
 2xk+bEsv5+yigah3/6Lj+npsGt7LKO/9d2Bkh2IRQhSgPxae7KCEIl0WkMOEkno6k2FP
 1Lng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=jmqIL302FliKztrku23iEbel/vN8Om9KZr4KoJVUQBs=;
 b=tnn7SGCgjMMdc1YNbaUDsJPpGEfNkuwKdd/vjkWmGpJrjGO4Zc/s+5FjsMTAWYYWQv
 M6qcRXZj8hoNtC/BGaSnjpXLtVit1LXgwGQkcIsOEkpD7Z6K+vZEsj1T1x9T0xtawmQ0
 y3GniMwGGPtznSx5PwkMTEAo0S0NKHBpwHMAYFAfiaGURdIS1iqLrYI9dQRrwKljvNxy
 J8+7KsQsxVY1ISI8sYQCh+2jxUICdkyhZRep8pvGDe2vznejurA9shCHnpRklK4iwsuZ
 RQhgLAVSh84rmMdwG2/FgvUcq9BUFC9QZvGcGhss4r+veHoYRsVpf+0Bw8VrilQoAfxa
 mnrA==
X-Gm-Message-State: APjAAAU+VWwPX8DxU3BbxYihZWuHOIVfxlgBayRRXaT3HH+LkQti/x2V
 tjDAepc8IsM2z0n1cQBcCgQ=
X-Google-Smtp-Source: APXvYqxldygk3PkHMpihOlAqhwTjzhXRQF4Z9tCxVu286QjlehnozfaHCkEEtI5NYMQPFpu5SuYeWg==
X-Received: by 2002:a50:ca48:: with SMTP id e8mr45737760edi.101.1559769687081; 
 Wed, 05 Jun 2019 14:21:27 -0700 (PDT)
Received: from localhost ([185.92.221.13])
 by smtp.gmail.com with ESMTPSA id e19sm3550413edy.36.2019.06.05.14.21.26
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 05 Jun 2019 14:21:26 -0700 (PDT)
Date: Wed, 5 Jun 2019 21:21:25 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v3 11/11] mm/memory_hotplug: Remove "zone" parameter from
 sparse_remove_one_section
Message-ID: <20190605212125.gwmvjjicylhp3wcz@master>
References: <20190527111152.16324-1-david@redhat.com>
 <20190527111152.16324-12-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190527111152.16324-12-david@redhat.com>
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
 linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org,
 Wei Yang <richard.weiyang@gmail.com>, linux-mm@kvack.org,
 Igor Mammedov <imammedo@redhat.com>, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org, Dan Williams <dan.j.williams@intel.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, May 27, 2019 at 01:11:52PM +0200, David Hildenbrand wrote:
>The parameter is unused, so let's drop it. Memory removal paths should
>never care about zones. This is the job of memory offlining and will
>require more refactorings.
>
>Reviewed-by: Dan Williams <dan.j.williams@intel.com>
>Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Wei Yang <richardw.yang@linux.intel.com>

>---
> include/linux/memory_hotplug.h | 2 +-
> mm/memory_hotplug.c            | 2 +-
> mm/sparse.c                    | 4 ++--
> 3 files changed, 4 insertions(+), 4 deletions(-)
>
>diff --git a/include/linux/memory_hotplug.h b/include/linux/memory_hotplug.h
>index 2f1f87e13baa..1a4257c5f74c 100644
>--- a/include/linux/memory_hotplug.h
>+++ b/include/linux/memory_hotplug.h
>@@ -346,7 +346,7 @@ extern void move_pfn_range_to_zone(struct zone *zone, unsigned long start_pfn,
> extern bool is_memblock_offlined(struct memory_block *mem);
> extern int sparse_add_one_section(int nid, unsigned long start_pfn,
> 				  struct vmem_altmap *altmap);
>-extern void sparse_remove_one_section(struct zone *zone, struct mem_section *ms,
>+extern void sparse_remove_one_section(struct mem_section *ms,
> 		unsigned long map_offset, struct vmem_altmap *altmap);
> extern struct page *sparse_decode_mem_map(unsigned long coded_mem_map,
> 					  unsigned long pnum);
>diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
>index 82136c5b4c5f..e48ec7b9dee2 100644
>--- a/mm/memory_hotplug.c
>+++ b/mm/memory_hotplug.c
>@@ -524,7 +524,7 @@ static void __remove_section(struct zone *zone, struct mem_section *ms,
> 	start_pfn = section_nr_to_pfn((unsigned long)scn_nr);
> 	__remove_zone(zone, start_pfn);
> 
>-	sparse_remove_one_section(zone, ms, map_offset, altmap);
>+	sparse_remove_one_section(ms, map_offset, altmap);
> }
> 
> /**
>diff --git a/mm/sparse.c b/mm/sparse.c
>index d1d5e05f5b8d..1552c855d62a 100644
>--- a/mm/sparse.c
>+++ b/mm/sparse.c
>@@ -800,8 +800,8 @@ static void free_section_usemap(struct page *memmap, unsigned long *usemap,
> 		free_map_bootmem(memmap);
> }
> 
>-void sparse_remove_one_section(struct zone *zone, struct mem_section *ms,
>-		unsigned long map_offset, struct vmem_altmap *altmap)
>+void sparse_remove_one_section(struct mem_section *ms, unsigned long map_offset,
>+			       struct vmem_altmap *altmap)
> {
> 	struct page *memmap = NULL;
> 	unsigned long *usemap = NULL;
>-- 
>2.20.1

-- 
Wei Yang
Help you, Help me
