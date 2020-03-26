Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 84636194B57
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Mar 2020 23:14:38 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48pK631bNwzDqgx
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Mar 2020 09:14:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::341;
 helo=mail-wm1-x341.google.com; envelope-from=richard.weiyang@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=VZKU2EoS; dkim-atps=neutral
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48pK3z2ZV2zDqTN
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Mar 2020 09:12:45 +1100 (AEDT)
Received: by mail-wm1-x341.google.com with SMTP id a9so9817532wmj.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Mar 2020 15:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=XV8ONxrhzLm1XRXAjklwNAD/3fXBeH2tcYtEjG9QsSY=;
 b=VZKU2EoSY8ifMMoVJmBY3z5r8LkOjG1oNvQZZUNdXTAjo6+/rbR+N3AhkJwd8B+m4e
 9sleYSqmzyPDtmd1MeTgwKf3VE8rN2qLPUpc5+SiaWOfPhjifQ2stsCJ8p4Qb3lQ7JQj
 aACSd1WRQTwVEcwb8etKAq1hCr/+NohylSJoSGQukTfP5R770VjV4bBlHYcjUgEqwamX
 j9q483MQjuIg4kYAmLz36XSg7EIWchn66kA0R9c7O3XWO7E+NQBKsm2blO0aB3H/mqOi
 z6YKwPOHp/urIF3lcl+MaT768OZDjCIPbOUwtGvPa7DiQ38WnNyia80ysHOmYbPxdLPo
 ZIbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=XV8ONxrhzLm1XRXAjklwNAD/3fXBeH2tcYtEjG9QsSY=;
 b=VHt8QPrshOpQ3P7gE/SnbSJFlirtPQvne1Ya8pEMtwtDvdyDYNiL3VAVJPqpleZnM0
 lYuGzBvwmZSuUBrQdia0Hh/5rOaTgJmMbQKQT3Sp1qvGBO1jxt3mprq5ppzS2JXS/we1
 0qDEKoddGMK4Qk4S9BxHbznA8AKeYIPfCl15lgRBszcviJjjrkHMTtXRTrLiEntyhYCr
 bmifz/ZWEKaR5Vs5wsTGf6igOPCMTQqoHjbIRgoUH7t2mvOSk3GskzrSwnwVjjhTYTF4
 o+w/EEFr4QCMlcQFMnlRbXBNR+Y1I295T1j6hb6/7SlDEOrxNxOecCQpJl8gyNnWuwbT
 lnGg==
X-Gm-Message-State: ANhLgQ2SGKtS6dou0g1FQE+zblQik2xX+Z4dxMZhi9cHpAKeZKWtnNFy
 7Bv+kFFKVUh8MTecSkEBtWk=
X-Google-Smtp-Source: ADFU+vt6ZLuyioBcFjmo9C2azZJw71RH9CqKsiPptR5/A2XORNRp5r6KHCHmmVX7iu5aUcM/sO7bzA==
X-Received: by 2002:a1c:b105:: with SMTP id a5mr2007926wmf.57.1585260759713;
 Thu, 26 Mar 2020 15:12:39 -0700 (PDT)
Received: from localhost ([185.92.221.13])
 by smtp.gmail.com with ESMTPSA id 195sm5500455wmb.8.2020.03.26.15.12.38
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 26 Mar 2020 15:12:38 -0700 (PDT)
Date: Thu, 26 Mar 2020 22:12:37 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH v2] mm/sparse: Fix kernel crash with pfn_section_valid
 check
Message-ID: <20200326221237.fttur7yyfl7nrdsj@master>
References: <20200326133235.343616-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200326133235.343616-1-aneesh.kumar@linux.ibm.com>
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
Cc: Sachin Sant <sachinp@linux.vnet.ibm.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>, Michal Hocko <mhocko@suse.com>,
 Baoquan He <bhe@redhat.com>, David Hildenbrand <david@redhat.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Mike Rapoport <rppt@linux.ibm.com>, linux-mm@kvack.org,
 Wei Yang <richardw.yang@linux.intel.com>, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org, Dan Williams <dan.j.williams@intel.com>,
 Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Mar 26, 2020 at 07:02:35PM +0530, Aneesh Kumar K.V wrote:
>Fixes the below crash
>
>BUG: Kernel NULL pointer dereference on read at 0x00000000
>Faulting instruction address: 0xc000000000c3447c
>Oops: Kernel access of bad area, sig: 11 [#1]
>LE PAGE_SIZE=64K MMU=Hash SMP NR_CPUS=2048 NUMA pSeries
>CPU: 11 PID: 7519 Comm: lt-ndctl Not tainted 5.6.0-rc7-autotest #1
>...
>NIP [c000000000c3447c] vmemmap_populated+0x98/0xc0
>LR [c000000000088354] vmemmap_free+0x144/0x320
>Call Trace:
> section_deactivate+0x220/0x240
> __remove_pages+0x118/0x170
> arch_remove_memory+0x3c/0x150
> memunmap_pages+0x1cc/0x2f0
> devm_action_release+0x30/0x50
> release_nodes+0x2f8/0x3e0
> device_release_driver_internal+0x168/0x270
> unbind_store+0x130/0x170
> drv_attr_store+0x44/0x60
> sysfs_kf_write+0x68/0x80
> kernfs_fop_write+0x100/0x290
> __vfs_write+0x3c/0x70
> vfs_write+0xcc/0x240
> ksys_write+0x7c/0x140
> system_call+0x5c/0x68
>
>The crash is due to NULL dereference at
>
>test_bit(idx, ms->usage->subsection_map); due to ms->usage = NULL; in pfn_section_valid()
>
>With commit: d41e2f3bd546 ("mm/hotplug: fix hot remove failure in SPARSEMEM|!VMEMMAP case")
>section_mem_map is set to NULL after depopulate_section_mem(). This
>was done so that pfn_page() can work correctly with kernel config that disables
>SPARSEMEM_VMEMMAP. With that config pfn_to_page does
>
>	__section_mem_map_addr(__sec) + __pfn;
>where
>
>static inline struct page *__section_mem_map_addr(struct mem_section *section)
>{
>	unsigned long map = section->section_mem_map;
>	map &= SECTION_MAP_MASK;
>	return (struct page *)map;
>}
>
>Now with SPASEMEM_VMEMAP enabled, mem_section->usage->subsection_map is used to
>check the pfn validity (pfn_valid()). Since section_deactivate release
>mem_section->usage if a section is fully deactivated, pfn_valid() check after
>a subsection_deactivate cause a kernel crash.
>
>static inline int pfn_valid(unsigned long pfn)
>{
>...
>	return early_section(ms) || pfn_section_valid(ms, pfn);
>}
>
>where
>
>static inline int pfn_section_valid(struct mem_section *ms, unsigned long pfn)
>{
>	int idx = subsection_map_index(pfn);
>
>	return test_bit(idx, ms->usage->subsection_map);
>}
>
>Avoid this by clearing SECTION_HAS_MEM_MAP when mem_section->usage is freed.
>For architectures like ppc64 where large pages are used for vmmemap mapping (16MB),
>a specific vmemmap mapping can cover multiple sections. Hence before a vmemmap
>mapping page can be freed, the kernel needs to make sure there are no valid sections
>within that mapping. Clearing the section valid bit before
>depopulate_section_memap enables this.
>
>Fixes: d41e2f3bd546 ("mm/hotplug: fix hot remove failure in SPARSEMEM|!VMEMMAP case")
>Reported-by: Sachin Sant <sachinp@linux.vnet.ibm.com>
>Tested-by: Sachin Sant <sachinp@linux.vnet.ibm.com>
>Cc: Baoquan He <bhe@redhat.com>
>Cc: Michael Ellerman <mpe@ellerman.id.au>
>Cc: Dan Williams <dan.j.williams@intel.com>
>Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
>Cc: David Hildenbrand <david@redhat.com>
>Cc: Michal Hocko <mhocko@suse.com>
>Cc: Wei Yang <richardw.yang@linux.intel.com>
>Cc: Oscar Salvador <osalvador@suse.de>
>Cc: Mike Rapoport <rppt@linux.ibm.com>
>Cc: <stable@vger.kernel.org>
>Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>

Reviewed-by: Wei Yang <richard.weiyang@gmail.com>

-- 
Wei Yang
Help you, Help me
