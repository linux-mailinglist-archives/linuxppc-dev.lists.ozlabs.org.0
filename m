Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB4176AC4C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Aug 2023 11:08:01 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=FP91dO9c;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RFTlz3qjVz3cQ4
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Aug 2023 19:07:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=FP91dO9c;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=195.135.220.29; helo=smtp-out2.suse.de; envelope-from=mhocko@suse.com; receiver=lists.ozlabs.org)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RFTl666Vhz2yWB
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Aug 2023 19:07:14 +1000 (AEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 5E3C01F8A4;
	Tue,  1 Aug 2023 09:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1690880830; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NOIQpsYorsEErSCKvrBUT+6FC1vs4HhE6rpSdG0vcy4=;
	b=FP91dO9cgibLCZDlgsJ4DyBjauNOAQBKM3RwdkBYwUh4hUy7eRUZB4CvgSvULorwq5IBMU
	kWyhma9WsPrqDfJ13ACJmvRzRYXI9UDmQdAalWD5tVZ7I47VF8L7rCOuBddztpmZQ5S7yW
	PC5sthVDcDoQiC+9OFXwfcrcWDmZlaI=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4F1EC13919;
	Tue,  1 Aug 2023 09:07:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id qWl8Ej7LyGS7OAAAMHmgww
	(envelope-from <mhocko@suse.com>); Tue, 01 Aug 2023 09:07:10 +0000
Date: Tue, 1 Aug 2023 11:07:09 +0200
From: Michal Hocko <mhocko@suse.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH v7 0/7] Add support for memmap on memory feature on ppc64
Message-ID: <ZMjLPQd+jdLkNVe2@dhcp22.suse.cz>
References: <20230801044116.10674-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230801044116.10674-1-aneesh.kumar@linux.ibm.com>
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
Cc: David Hildenbrand <david@redhat.com>, linux-mm@kvack.org, npiggin@gmail.com, Vishal Verma <vishal.l.verma@intel.com>, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

I cannot really judge the ppc specific part but other patches seem
reasonable. Patch 4 could print a more useful information about the
wastage but this is nothing really earth shattering. I am not sure about
the last patch which makes the on-memory property dynamic. This needs
much more justification and use case description IMHO.

That being said for patches 1 - 4 and 6 feel free to add
Acked-by: Michal Hocko <mhocko@suse.com>

On Tue 01-08-23 10:11:09, Aneesh Kumar K.V wrote:
> This patch series update memmap on memory feature to fall back to
> memmap allocation outside the memory block if the alignment rules are
> not met. This makes the feature more useful on architectures like
> ppc64 where alignment rules are different with 64K page size.
> 
> This patch series is dependent on dax vmemmap optimization series
> posted here
> https://lore.kernel.org/linux-mm/20230718022934.90447-1-aneesh.kumar@linux.ibm.com/
> 
> Changes from v6:
> * Update comments in the code
> * Update commit message for patch 7
> 
> Changes from v5:
> * Update commit message
> * Move memory alloc/free to the callers in patch 6
> * Address review feedback w.r.t patch 4
> 
> Changes from v4:
> * Use altmap.free instead of altmap.reserve
> * Address review feedback
> 
> Changes from v3:
> * Extend the module parameter memmap_on_memory to force allocation even
>   though we can waste hotplug memory.
> 
> Changes from v2:
> * Rebase to latest linus tree
> * Redo the series based on review feedback. Multiple changes to the patchset.
> 
> Changes from v1:
> * update the memblock to store vmemmap_altmap details. This is required
> so that when we remove the memory we can find the altmap details which
> is needed on some architectures.
> * rebase to latest linus tree
> 
> 
> 
> Aneesh Kumar K.V (7):
>   mm/memory_hotplug: Simplify ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE kconfig
>   mm/memory_hotplug: Allow memmap on memory hotplug request to fallback
>   mm/memory_hotplug: Allow architecture to override memmap on memory
>     support check
>   mm/memory_hotplug: Support memmap_on_memory when memmap is not aligned
>     to pageblocks
>   powerpc/book3s64/memhotplug: Enable memmap on memory for radix
>   mm/memory_hotplug: Embed vmem_altmap details in memory block
>   mm/memory_hotplug: Enable runtime update of memmap_on_memory parameter
> 
>  .../admin-guide/mm/memory-hotplug.rst         |  12 +
>  arch/arm64/Kconfig                            |   4 +-
>  arch/powerpc/Kconfig                          |   1 +
>  arch/powerpc/include/asm/pgtable.h            |  21 ++
>  .../platforms/pseries/hotplug-memory.c        |   2 +-
>  arch/x86/Kconfig                              |   4 +-
>  drivers/acpi/acpi_memhotplug.c                |   3 +-
>  drivers/base/memory.c                         |  27 ++-
>  include/linux/memory.h                        |   8 +-
>  include/linux/memory_hotplug.h                |   3 +-
>  mm/Kconfig                                    |   3 +
>  mm/memory_hotplug.c                           | 205 ++++++++++++++----
>  12 files changed, 220 insertions(+), 73 deletions(-)
> 
> -- 
> 2.41.0

-- 
Michal Hocko
SUSE Labs
