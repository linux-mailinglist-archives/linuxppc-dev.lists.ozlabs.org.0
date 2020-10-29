Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD2D29E612
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Oct 2020 09:14:15 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CMJBC1PqMzDqLp
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Oct 2020 19:14:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=g8myBvX3; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CMJ8W3c51zDqCD
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Oct 2020 19:12:43 +1100 (AEDT)
Received: from kernel.org (unknown [87.70.96.83])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0A03F2071A;
 Thu, 29 Oct 2020 08:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603959160;
 bh=qbXUodulHRIhZjPrnRC7qfAlGRyh2vibUSxi3f3gDIk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=g8myBvX3F7QMVEVZGRZCadikKouzosKdPwphfxNmTb0706ye5JKArlIlOSA0g+35M
 6me55rfbMzVSIAa7goduVgsYpdWGNMWM5KuAGqTSniJqm2wv1rTdQ/V1NrKahAMSCR
 IVJzOibzZsEV1oFExIFzDScBAXY1r5SLqohLdy6s=
Date: Thu, 29 Oct 2020 10:12:25 +0200
From: Mike Rapoport <rppt@kernel.org>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Subject: Re: [PATCH 0/4] arch, mm: improve robustness of direct map
 manipulation
Message-ID: <20201029081225.GK1428094@kernel.org>
References: <20201025101555.3057-1-rppt@kernel.org>
 <ae82f905a0092adb7e0f0ac206335c1883b3170f.camel@intel.com>
 <20201026090526.GA1154158@kernel.org>
 <a0212b073b3b2f62c3dbf1bf398f03fa402997be.camel@intel.com>
 <20201027083816.GG1154158@kernel.org>
 <20201028112011.GB27927@willie-the-truck>
 <20201028113059.GG1428094@kernel.org>
 <9e77d0a939eda3029d6ae89bd14d7f1465b0559d.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9e77d0a939eda3029d6ae89bd14d7f1465b0559d.camel@intel.com>
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

On Wed, Oct 28, 2020 at 09:03:31PM +0000, Edgecombe, Rick P wrote:

> > On Wed, Oct 28, 2020 at 11:20:12AM +0000, Will Deacon wrote:
> > > On Tue, Oct 27, 2020 at 10:38:16AM +0200, Mike Rapoport wrote:
> > > > 					   	
> > > > This is a theoretical bug, but it is still not nice :) 		
> > > > 					
> > > 
> > > Just to clarify: this patch series fixes this problem, right?
> > 
> > Yes.
> > 
> 
> Well, now I'm confused again.
> 
> As David pointed, __vunmap() should not be executing simultaneously
> with the hibernate operation because hibernate can't snapshot while
> data it needs to save is still updating. If a thread was paused when a
> page was in an "invalid" state, it should be remapped by hibernate
> before the copy.
> 
> To level set, before reading this mail, my takeaways from the
> discussions on potential hibernate/debug page alloc problems were:
> 
> Potential RISC-V issue:
> Doesn't have hibernate support
> 
> Potential ARM issue:
> The logic around when it's cpa determines pages might be unmapped looks
> correct for current callers.
> 
> Potential x86 page break issue:
> Seems to be ok for now, but a new set_memory_np() caller could violate
> assumptions in hibernate.
> 
> Non-obvious thorny logic: 
> General agreement it would be good to separate dependencies.
> 
> Behavior of V1 of this patchset:
> No functional change other than addition of a warn in hibernate.

There is a change that adds explicit use of set_direct_map() to
hibernate. Currently, in case of arm64 with DEBUG_PAGEALLOC=n if a
thread was paused when a page was in an "invalid" state hibernate will
access an unmapped data because __kernel_map_pages() will bail out.
After the change set_direct_map_default_noflush() would be used and the
page will get mapped before copy.

> So "does this fix the problem", "yes" leaves me a bit confused... Not
> saying there couldn't be any problems, especially due to the thorniness
> and cross arch stride, but what is it exactly and how does this series
> fix it?

This series goal was primarily to separate dependincies and make it
clearer what DEBUG_PAGEALLOC and what SET_DIRECT_MAP are. As it turned
out, there is also some lack of consistency between architectures that
implement either of this so I tried to improve this as well.

Honestly, I don't know if a thread can be paused at the time __vunmap()
left invalid pages, but it could, there is an issue on arm64 with
DEBUG_PAGEALLOC=n and this set fixes it.

__vunmap()
    vm_remove_mappings()
        set_direct_map_invalid()
	/* thread is frozen */
 					safe_copy_page()	
 					    __kernel_map_pages()
						if (!debug_pagealloc())
 					    	    return
 					    do_copy_page() -> fault

-- 
Sincerely yours,
Mike.
