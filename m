Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CF88529A6EF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Oct 2020 09:51:13 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CL55q0p6dzDqQP
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Oct 2020 19:51:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=cob/039d; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CL53h5C1zzDqJf
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Oct 2020 19:49:20 +1100 (AEDT)
Received: from kernel.org (unknown [87.70.96.83])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 817B6207DE;
 Tue, 27 Oct 2020 08:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603788557;
 bh=vqvHVfwUem4JOBq/WXsfNE79L5Iz5nEhnMlkJj2ElFU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cob/039dcWnn8OjH5If0m1K0e5hz+wi7uaTqafHhMC0w6AKDJ7mof/L9QVAWjAi5m
 AzwVpAcX/G3bIeFGz/QZ6LDXFrWjC3A32wjsC/UaCx/T35y4jeNZtg1G5OqKcQamFp
 mFhuBk5Uhn3ItuoN/wmMtQFg0IPWtBPQaAK5nUZY=
Date: Tue, 27 Oct 2020 10:49:02 +0200
From: Mike Rapoport <rppt@kernel.org>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Subject: Re: [PATCH 2/4] PM: hibernate: improve robustness of mapping pages
 in the direct map
Message-ID: <20201027084902.GH1154158@kernel.org>
References: <20201025101555.3057-1-rppt@kernel.org>
 <20201025101555.3057-3-rppt@kernel.org>
 <f20900a403bea9eb3f0814128e5ea46f6580f5a5.camel@intel.com>
 <20201026091554.GB1154158@kernel.org>
 <a28d8248057e7dc01716764da9edfd666722ff62.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a28d8248057e7dc01716764da9edfd666722ff62.camel@intel.com>
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

On Mon, Oct 26, 2020 at 06:57:32PM +0000, Edgecombe, Rick P wrote:
> On Mon, 2020-10-26 at 11:15 +0200, Mike Rapoport wrote:
> > On Mon, Oct 26, 2020 at 12:38:32AM +0000, Edgecombe, Rick P wrote:
> > > On Sun, 2020-10-25 at 12:15 +0200, Mike Rapoport wrote:
> > > > From: Mike Rapoport <rppt@linux.ibm.com>
> > > > 
> > > > When DEBUG_PAGEALLOC or ARCH_HAS_SET_DIRECT_MAP is enabled a page
> > > > may
> > > > be
> > > > not present in the direct map and has to be explicitly mapped
> > > > before
> > > > it
> > > > could be copied.
> > > > 
> > > > On arm64 it is possible that a page would be removed from the
> > > > direct
> > > > map
> > > > using set_direct_map_invalid_noflush() but __kernel_map_pages()
> > > > will
> > > > refuse
> > > > to map this page back if DEBUG_PAGEALLOC is disabled.
> > > 
> > > It looks to me that arm64 __kernel_map_pages() will still attempt
> > > to
> > > map it if rodata_full is true, how does this happen?
> > 
> > Unless I misread the code, arm64 requires both rodata_full and
> > debug_pagealloc_enabled() to be true for __kernel_map_pages() to do
> > anything.
> > But rodata_full condition applies to set_direct_map_*_noflush() as
> > well,
> > so with !rodata_full the linear map won't be ever changed.
> 
> Hmm, looks to me that __kernel_map_pages() will only skip it if both
> debug pagealloc and rodata_full are false.
> 
> But now I'm wondering if maybe we could simplify things by just moving
> the hibernate unmapped page logic off of the direct map. On x86,
> text_poke() used to use this reserved fixmap pte thing that it could
> rely on to remap memory with. If hibernate had some separate pte for
> remapping like that, then we could not have any direct map restrictions
> caused by it/kernel_map_pages(), and it wouldn't have to worry about
> relying on anything else.

Well, there is map_kernel_range() that can be used by hibernation as
there is no requirement for particular virtual address, but that would
be quite costly if done for every page.

Maybe we can do somthing like

	if (kernel_page_present(s_page)) {
		do_copy_page(dst, page_address(s_page));
	} else {
		map_kernel_range_noflush(page_address(page), PAGE_SIZE,
					 PROT_READ, &page);
		do_copy_page(dst, page_address(s_page));
		unmap_kernel_range_noflush(page_address(page), PAGE_SIZE);
	}

But it seems that a prerequisite for changing the way a page is mapped
in safe_copy_page() would be to teach hibernation that a mapping here
may fail.

-- 
Sincerely yours,
Mike.
