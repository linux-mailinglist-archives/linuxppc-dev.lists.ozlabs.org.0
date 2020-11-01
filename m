Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A6AC32A1FCE
	for <lists+linuxppc-dev@lfdr.de>; Sun,  1 Nov 2020 18:04:10 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CPMpH1ffNzDqbt
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Nov 2020 04:04:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=bxsex5hs; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CPMmT6TXJzDqSR
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Nov 2020 04:02:33 +1100 (AEDT)
Received: from kernel.org (unknown [87.71.17.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 420992074F;
 Sun,  1 Nov 2020 17:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604250150;
 bh=HP+ZQ6Ps8oAsoYLOvWAk4ExSXyhayG0jX2yWoBMUttE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bxsex5hsLdBiTg92b0MNJxCbBPD+lO6NtdRjasPNMfUBXD6k5B0KcdxvFVYiQIEmX
 Bjfz+dfRQJnD6lyaCaBO97eSNhn6o7BX84zyBBhpcPltXScqdjcB1tCqstPvndRKPK
 MacevoYxMeN6oYR+VtqyVfF6MF53cPKygLmGPOBs=
Date: Sun, 1 Nov 2020 19:02:17 +0200
From: Mike Rapoport <rppt@kernel.org>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Subject: Re: [PATCH 2/4] PM: hibernate: improve robustness of mapping pages
 in the direct map
Message-ID: <20201101170217.GD14628@kernel.org>
References: <20201025101555.3057-1-rppt@kernel.org>
 <20201025101555.3057-3-rppt@kernel.org>
 <3b4b2b3559bd3dc68adcddf99415bae57152cb6b.camel@intel.com>
 <20201029075416.GJ1428094@kernel.org>
 <604554805defb03d158c09aba4b5cced3416a7fb.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <604554805defb03d158c09aba4b5cced3416a7fb.camel@intel.com>
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
Cc: "david@redhat.com" <david@redhat.com>,
 "peterz@infradead.org" <peterz@infradead.org>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "paulus@samba.org" <paulus@samba.org>, "pavel@ucw.cz" <pavel@ucw.cz>,
 "hpa@zytor.com" <hpa@zytor.com>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
 "cl@linux.com" <cl@linux.com>, "will@kernel.org" <will@kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "x86@kernel.org" <x86@kernel.org>, "rppt@linux.ibm.com" <rppt@linux.ibm.com>,
 "borntraeger@de.ibm.com" <borntraeger@de.ibm.com>,
 "mingo@redhat.com" <mingo@redhat.com>,
 "rientjes@google.com" <rientjes@google.com>, "Brown,
 Len" <len.brown@intel.com>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
 "gor@linux.ibm.com" <gor@linux.ibm.com>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "hca@linux.ibm.com" <hca@linux.ibm.com>, "bp@alien8.de" <bp@alien8.de>,
 "luto@kernel.org" <luto@kernel.org>,
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
 "kirill@shutemov.name" <kirill@shutemov.name>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "iamjoonsoo.kim@lge.com" <iamjoonsoo.kim@lge.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "rjw@rjwysocki.net" <rjw@rjwysocki.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "penberg@kernel.org" <penberg@kernel.org>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "davem@davemloft.net" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Oct 29, 2020 at 11:19:18PM +0000, Edgecombe, Rick P wrote:
> On Thu, 2020-10-29 at 09:54 +0200, Mike Rapoport wrote:
> > __kernel_map_pages() on arm64 will also bail out if rodata_full is
> > false:
> > void __kernel_map_pages(struct page *page, int numpages, int enable)
> > {
> >         if (!debug_pagealloc_enabled() && !rodata_full)
> >                 return;
> > 
> >         set_memory_valid((unsigned long)page_address(page), numpages,
> > enable);
> > }
> > 
> > So using set_direct_map() to map back pages removed from the direct
> > map
> > with __kernel_map_pages() seems safe to me.
> 
> Heh, one of us must have some simple boolean error in our head. I hope
> its not me! :) I'll try on more time.

Well, then it's me :)
You are right, I misread this and I could not understand why
!rodata_full bothers you.

> __kernel_map_pages() will bail out if rodata_full is false **AND**
> debug page alloc is off. So it will only bail under conditions where
> there could be nothing unmapped on the direct map.
> 
> Equivalent logic would be:
> 	if (!(debug_pagealloc_enabled() || rodata_full))
> 		return;
> 
> Or:
> 	if (debug_pagealloc_enabled() || rodata_full)
> 		set_memory_valid(blah)
> 
> So if either is on, the existing code will try to re-map. But the
> set_direct_map_()'s will only work if rodata_full is on. So switching
> hibernate to set_direct_map() will cause the remap to be missed for the
> debug page alloc case, with !rodata_full.
> 
> It also breaks normal debug page alloc usage with !rodata_full for
> similar reasons after patch 3. The pages would never get unmapped.

I've updated the patches, there should be no regression now.

-- 
Sincerely yours,
Mike.
