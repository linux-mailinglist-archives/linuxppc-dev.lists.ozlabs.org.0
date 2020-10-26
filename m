Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 38306298970
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Oct 2020 10:33:08 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CKV4d4d59zDqQC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Oct 2020 20:33:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=Gay4USUB; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CKV2t2SsnzDqKb
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Oct 2020 20:31:34 +1100 (AEDT)
Received: from kernel.org (unknown [87.70.96.83])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 04E07223EA;
 Mon, 26 Oct 2020 09:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603704688;
 bh=UPPnXviZXmutWijYpQ9tn9fnLcQibcRuGcgbK3gvCBw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Gay4USUBBIxHqVxLVBTGdS6UR/Xrw069y1WeVP2Fs7F0gpT/fVrp1lv3pe8IbHpLe
 RoEp88v8LxwsuyzDFoKwK7DyX3p6WzNTV//0uHT1Jgfz1rDyGmOBg1EeMCMd5+X4tM
 uKwPfXMr4FM1bIOQXZSKgycAvE2mT9oKkX0LymH4=
Date: Mon, 26 Oct 2020 11:31:10 +0200
From: Mike Rapoport <rppt@kernel.org>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Subject: Re: [PATCH 4/4] arch, mm: make kernel_page_present() always available
Message-ID: <20201026093110.GC1154158@kernel.org>
References: <20201025101555.3057-1-rppt@kernel.org>
 <20201025101555.3057-5-rppt@kernel.org>
 <979889bf987fdc7268a973fe7398198bfad1644f.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <979889bf987fdc7268a973fe7398198bfad1644f.camel@intel.com>
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
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "rjw@rjwysocki.net" <rjw@rjwysocki.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "penberg@kernel.org" <penberg@kernel.org>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "iamjoonsoo.kim@lge.com" <iamjoonsoo.kim@lge.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "davem@davemloft.net" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Oct 26, 2020 at 12:54:01AM +0000, Edgecombe, Rick P wrote:
> On Sun, 2020-10-25 at 12:15 +0200, Mike Rapoport wrote:
> > index 7f248fc45317..16f878c26667 100644
> > --- a/arch/x86/mm/pat/set_memory.c
> > +++ b/arch/x86/mm/pat/set_memory.c
> > @@ -2228,7 +2228,6 @@ void __kernel_map_pages(struct page *page, int
> > numpages, int enable)
> >  }
> >  #endif /* CONFIG_DEBUG_PAGEALLOC */
> >  
> > -#ifdef CONFIG_HIBERNATION
> >  bool kernel_page_present(struct page *page)
> >  {
> >         unsigned int level;
> > @@ -2240,7 +2239,6 @@ bool kernel_page_present(struct page *page)
> >         pte = lookup_address((unsigned long)page_address(page),
> > &level);
> >         return (pte_val(*pte) & _PAGE_PRESENT);
> >  }
> > -#endif /* CONFIG_HIBERNATION */
> 
> This is only used by hibernate today right? Makes sense that it should
> return a correct answer if someone starts to use it without looking too
> closely at the header. But could we just remove the default static
> inline return true implementation and let the linker fail if someone
> starts to use it outside hibernate? Then we could leave it compiled out
> until then.

Hmm, I'm not sure I follow you here.
We'd need some stub for architectures that have
ARCH_HIBERNATION_POSSIBLE and do not have
CONFIG_ARCH_HAS_SET_DIRECT_MAP.

I don't see how the kernel would compile for ppc or sparc with
hibernation enabled if I remove the default implementation.

> Also it looks like riscv does not have ARCH_HIBERNATION_POSSIBLE so the
> new function added here couldn't be used yet. You could also just let
> the linker catch it if riscv ever enables hibernate?

-- 
Sincerely yours,
Mike.
