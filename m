Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6184D227FEE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jul 2020 14:28:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B9yYp34dszDqfd
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jul 2020 22:28:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B9yVx613jzDqJB
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jul 2020 22:26:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=I/aBEgan; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4B9yVx28rLz9sQt;
 Tue, 21 Jul 2020 22:26:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1595334361;
 bh=jJi4TkEHInATCzCIyAwnZ7zy/RuaLjzMF2OoRvDmjj4=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=I/aBEganzkrqRj5xoMus47bu3g7UUNHY7Q3ws05GBVuN+msYrkkpdmWpUINXwZHL0
 kzKqkOaIHBTSpiyg2dwCR2LxGC3LDY8mHG5+GKX8dMtIu0kQv96fPoWHvGoWMzEHs2
 7mTj763EjCrF+YebCWQ0GGVFp4bTeg7Hkv0rl1nRmxC5LXhiHN05Bvol4fXYUcaArc
 dE7FFotKNNy19BrLJwp9rIcchfhsSYzJi3ze5fruJ3gNWwCxDd0OjYOG6hOOUFmARf
 bCJsspploc3+HjnQ6h84b1aVQrYN0yZGsoTaa31nU1EpaFVj5rw3xuwSyCbDGIh1xQ
 /S3hONMD6EwZw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: bharata@linux.ibm.com
Subject: Re: [PATCH v3 0/4] powerpc/mm/radix: Memory unplug fixes
In-Reply-To: <20200721032959.GN7902@in.ibm.com>
References: <20200709131925.922266-1-aneesh.kumar@linux.ibm.com>
 <87r1tb1rw2.fsf@linux.ibm.com> <87tuy1sksv.fsf@mpe.ellerman.id.au>
 <20200721032959.GN7902@in.ibm.com>
Date: Tue, 21 Jul 2020 22:25:58 +1000
Message-ID: <87ft9lrr55.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Bharata B Rao <bharata@linux.ibm.com> writes:
> On Tue, Jul 21, 2020 at 11:45:20AM +1000, Michael Ellerman wrote:
>> Nathan Lynch <nathanl@linux.ibm.com> writes:
>> > "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:
>> >> This is the next version of the fixes for memory unplug on radix.
>> >> The issues and the fix are described in the actual patches.
>> >
>> > I guess this isn't actually causing problems at runtime right now, but I
>> > notice calls to resize_hpt_for_hotplug() from arch_add_memory() and
>> > arch_remove_memory(), which ought to be mmu-agnostic:
>> >
>> > int __ref arch_add_memory(int nid, u64 start, u64 size,
>> > 			  struct mhp_params *params)
>> > {
>> > 	unsigned long start_pfn = start >> PAGE_SHIFT;
>> > 	unsigned long nr_pages = size >> PAGE_SHIFT;
>> > 	int rc;
>> >
>> > 	resize_hpt_for_hotplug(memblock_phys_mem_size());
>> >
>> > 	start = (unsigned long)__va(start);
>> > 	rc = create_section_mapping(start, start + size, nid,
>> > 				    params->pgprot);
>> > ...
>> 
>> Hmm well spotted.
>> 
>> That does return early if the ops are not setup:
>> 
>> int resize_hpt_for_hotplug(unsigned long new_mem_size)
>> {
>> 	unsigned target_hpt_shift;
>> 
>> 	if (!mmu_hash_ops.resize_hpt)
>> 		return 0;
>> 
>> 
>> And:
>> 
>> void __init hpte_init_pseries(void)
>> {
>> 	...
>> 	if (firmware_has_feature(FW_FEATURE_HPT_RESIZE))
>> 		mmu_hash_ops.resize_hpt = pseries_lpar_resize_hpt;
>> 
>> And that comes in via ibm,hypertas-functions:
>> 
>> 	{FW_FEATURE_HPT_RESIZE,		"hcall-hpt-resize"},
>> 
>> 
>> But firmware is not necessarily going to add/remove that call based on
>> whether we're using hash/radix.
>
> Correct but hpte_init_pseries() will not be called for radix guests.

Yeah, duh. You'd think the function name would have been a sufficient
clue for me :)

>> So I think a follow-up patch is needed to make this more robust.
>> 
>> Aneesh/Bharata what platform did you test this series on? I'm curious
>> how this didn't break.
>
> I have tested memory hotplug/unplug for radix guest on zz platform and
> sanity-tested this for hash guest on P8.
>
> As noted above, mmu_hash_ops.resize_hpt will not be set for radix
> guest and hence we won't see any breakage.

OK.

That's probably fine as it is then. Or maybe just a comment in
resize_hpt_for_hotplug() pointing out that resize_hpt will be NULL if
we're using radix.

cheers
