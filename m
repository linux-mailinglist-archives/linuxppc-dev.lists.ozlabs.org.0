Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1FC29CFB7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Oct 2020 12:33:00 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CLmf16h4RzDqTx
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Oct 2020 22:32:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=cUnXipj6; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CLmc53RvrzDqSN
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Oct 2020 22:31:17 +1100 (AEDT)
Received: from kernel.org (unknown [87.70.96.83])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E6741246C3;
 Wed, 28 Oct 2020 11:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603884674;
 bh=gjv0U3NBKOnTNW44zMRkwPjIj1Z7l37xu//HQaF8TcY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cUnXipj6SCyD+eplDp9tJgGGwn2XxiBxnaCPOYRKRcF6AcrwUEHeSRRr9vZ0ie5Ek
 O9QqqyW5F35vu7he5aXY8rhMDZYP4dyGxJF4jP4TGOEc1CbbkAGYzd/w5djNh6qS70
 Sw2BJFOdgVYfPE9KAiE15TI5bQsRgWsjOYlHfBMk=
Date: Wed, 28 Oct 2020 13:30:59 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Will Deacon <will@kernel.org>
Subject: Re: [PATCH 0/4] arch, mm: improve robustness of direct map
 manipulation
Message-ID: <20201028113059.GG1428094@kernel.org>
References: <20201025101555.3057-1-rppt@kernel.org>
 <ae82f905a0092adb7e0f0ac206335c1883b3170f.camel@intel.com>
 <20201026090526.GA1154158@kernel.org>
 <a0212b073b3b2f62c3dbf1bf398f03fa402997be.camel@intel.com>
 <20201027083816.GG1154158@kernel.org>
 <20201028112011.GB27927@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201028112011.GB27927@willie-the-truck>
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
 "cl@linux.com" <cl@linux.com>,
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
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "Edgecombe,
 Rick P" <rick.p.edgecombe@intel.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "davem@davemloft.net" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Oct 28, 2020 at 11:20:12AM +0000, Will Deacon wrote:
> On Tue, Oct 27, 2020 at 10:38:16AM +0200, Mike Rapoport wrote:
> > On Mon, Oct 26, 2020 at 06:05:30PM +0000, Edgecombe, Rick P wrote:
> > > On Mon, 2020-10-26 at 11:05 +0200, Mike Rapoport wrote:
> > > > On Mon, Oct 26, 2020 at 01:13:52AM +0000, Edgecombe, Rick P wrote:
> > > > > On Sun, 2020-10-25 at 12:15 +0200, Mike Rapoport wrote:
> > > > > > Indeed, for architectures that define
> > > > > > CONFIG_ARCH_HAS_SET_DIRECT_MAP
> > > > > > it is
> > > > > > possible that __kernel_map_pages() would fail, but since this
> > > > > > function is
> > > > > > void, the failure will go unnoticed.
> > > > > 
> > > > > Could you elaborate on how this could happen? Do you mean during
> > > > > runtime today or if something new was introduced?
> > > > 
> > > > A failure in__kernel_map_pages() may happen today. For instance, on
> > > > x86
> > > > if the kernel is built with DEBUG_PAGEALLOC.
> > > > 
> > > >         __kernel_map_pages(page, 1, 0);
> > > > 
> > > > will need to split, say, 2M page and during the split an allocation
> > > > of
> > > > page table could fail.
> > > 
> > > On x86 at least, DEBUG_PAGEALLOC expects to never have to break a page
> > > on the direct map and even disables locking in cpa because it assumes
> > > this. If this is happening somehow anyway then we should probably fix
> > > that. Even if it's a debug feature, it will not be as useful if it is
> > > causing its own crashes.
> > > 
> > > I'm still wondering if there is something I'm missing here. It seems
> > > like you are saying there is a bug in some arch's, so let's add a WARN
> > > in cross-arch code to log it as it crashes. A warn and making things
> > > clearer seem like good ideas, but if there is a bug we should fix it.
> > > The code around the callers still functionally assume re-mapping can't
> > > fail.
> > 
> > Oh, I've meant x86 kernel *without* DEBUG_PAGEALLOC, and indeed the call
> > that unmaps pages back in safe_copy_page will just reset a 4K page to
> > NP because whatever made it NP at the first place already did the split.
> > 
> > Still, on arm64 with DEBUG_PAGEALLOC=n there is a possibility of a race
> > between map/unmap dance in __vunmap() and safe_copy_page() that may
> > cause access to unmapped memory:
> > 
> > __vunmap()
> >     vm_remove_mappings()
> >         set_direct_map_invalid()
> > 					safe_copy_page()	
> > 					    __kernel_map_pages()
> > 					    	return
> > 					    do_copy_page() -> fault
> > 					   	
> > This is a theoretical bug, but it is still not nice :) 							
> 
> Just to clarify: this patch series fixes this problem, right?

Yes.

> Will

-- 
Sincerely yours,
Mike.
