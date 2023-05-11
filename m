Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D624E6FEA15
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 May 2023 05:17:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QGxsM5dzXz3fNh
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 May 2023 13:17:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=JDYjlZO6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::1133; helo=mail-yw1-x1133.google.com; envelope-from=hughd@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=JDYjlZO6;
	dkim-atps=neutral
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QGxrV49F2z3bhx
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 May 2023 13:16:41 +1000 (AEST)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-559f1819c5dso121473057b3.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 May 2023 20:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1683774999; x=1686366999;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=hRBzifhysJxaavDAsJ+Sa+/VyNhQzLXJPjsoUGcNRd4=;
        b=JDYjlZO6u5Rd6QYeBUTXCp/kgqPCJk7kIYj5131tW+Oftjr3CeY+3TrtF265PwQLsY
         CzyhzuHdTlVexa4Irr81wJWJONYV4WJYb+Qmn3xCOOTrZII3mN3FIl3WlUa9ZzRwMyft
         TbG+lOOAm/FlIwiaNhNLr42JUk/Xp0bH2c5++eORJ8zXY8TzfBVIgW201ldf27i4oXvO
         WYco0w5tL3fNC1aMrOMXgic+X453i3JN5jojWOgIXdVajjoFoae+wDli+04h87K4PSDU
         PrZHQkqAQy9rNdfpBcTkPkLhTcEgcEAEnkRKNVLkHXWaXGdspdGha99g/0X8mBFfM1nS
         C7lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683774999; x=1686366999;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hRBzifhysJxaavDAsJ+Sa+/VyNhQzLXJPjsoUGcNRd4=;
        b=HtFVZ22WaJD51iJM6iFJuQZlMOcNYuVVcEb08PLs2EK5a3Uy7lB5PBiFIahLmfidAs
         C+oxk4A6RsrQJA2PqAeIiBu4Yo/DlSLCMTCrxhYMEaXoi5BNoDRmzm+nWqKOVuRGmplI
         tQyci3/iyp1H/6zoeGEq4zynSrou5AiXf/iK5E9ZxCJphwv3paXmiggpXZeLW/35813E
         6TRmY3uJopsw+/g+4D9lyIpVHjDbjHiX6dhkt/R8Kpw6llOEq7JnJWIy22Vm2cH1iOfp
         /YXbzqqyW4IFradGk7IeETJUKibzic93rWNytA/gj91F5e3gdpt/W3Rd2n4wMfahtLzd
         VWlg==
X-Gm-Message-State: AC+VfDwrKuJn50lDmgZJ3T8geZS/ULXiMi9v699BqtWMMHIxqJRvcQ92
	upI6szneAjwg41lvmkIqFLhVRw==
X-Google-Smtp-Source: ACHHUZ7/wlg4bppDf9uBVNG9J9Qk7aL+NA0hCKaxoiuDXlSicnUNf7o6tqD4YBoUi/tdOZkorZkwaA==
X-Received: by 2002:a25:4087:0:b0:b9e:5006:42af with SMTP id n129-20020a254087000000b00b9e500642afmr19049386yba.58.1683774998976;
        Wed, 10 May 2023 20:16:38 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id j128-20020a255586000000b00b923b2935d9sm4144529ybb.20.2023.05.10.20.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 May 2023 20:16:38 -0700 (PDT)
Date: Wed, 10 May 2023 20:16:34 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH 21/23] x86: Allow get_locked_pte() to fail
In-Reply-To: <20230510081848.GD83892@hirez.programming.kicks-ass.net>
Message-ID: <e5554cd1-417a-aa6a-5e5e-f4f5f773dda@google.com>
References: <77a5d8c-406b-7068-4f17-23b7ac53bc83@google.com> <eba2b72f-2180-498b-c8bd-ce8f717fc78a@google.com> <20230510081848.GD83892@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: linux-ia64@vger.kernel.org, David Hildenbrand <david@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, Qi Zheng <zhengqi.arch@bytedance.com>, linux-kernel@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>, Greg Ungerer <gerg@linux-m68k.org>, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, Helge Deller <deller@gmx.de>, x86@kernel.org, Hugh Dickins <hughd@google.com>, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Christian Borntraeger <borntraeger@linux.ibm.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, Heiko Carstens <hca@linux.ibm.com>, linux-m68k@lists.linux-m68k.org, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, John David Anglin <dave.anglin@bell.net>, Suren Baghdasaryan <surenb@google.com>, linux-arm-kernel@lists.infradead.org, Chris Zankel <chri
 s@zankel.net>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-mm@kvack.org, linux-mips@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 10 May 2023, Peter Zijlstra wrote:

> On Tue, May 09, 2023 at 10:08:37PM -0700, Hugh Dickins wrote:
> > In rare transient cases, not yet made possible, pte_offset_map() and
> > pte_offset_map_lock() may not find a page table: handle appropriately.
> > 
> > Signed-off-by: Hugh Dickins <hughd@google.com>
> > ---
> >  arch/x86/kernel/ldt.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/x86/kernel/ldt.c b/arch/x86/kernel/ldt.c
> > index 525876e7b9f4..eb844549cd83 100644
> > --- a/arch/x86/kernel/ldt.c
> > +++ b/arch/x86/kernel/ldt.c
> > @@ -367,8 +367,10 @@ static void unmap_ldt_struct(struct mm_struct *mm, struct ldt_struct *ldt)
> >  
> >  		va = (unsigned long)ldt_slot_va(ldt->slot) + offset;
> >  		ptep = get_locked_pte(mm, va, &ptl);
> > -		pte_clear(mm, va, ptep);
> > -		pte_unmap_unlock(ptep, ptl);
> > +		if (ptep) {
> > +			pte_clear(mm, va, ptep);
> > +			pte_unmap_unlock(ptep, ptl);
> > +		}
> >  	}
> 
> Ow geez, now I have to go remember how the whole PTI/LDT crud worked :/

I apologize for sending you back there!

> 
> At first glance this seems wrong; we can't just not unmap the LDT if we
> can't find it in a hurry. Also, IIRC this isn't in fact a regular user
> mapping, so it should not be subject to THP induced seizures.
> 
> ... memory bubbles back ... for PTI kernels we need to map this in the
> user and kernel page-tables because obviously userspace needs to be able
> to have access to the LDT. But it is not directly acessible by
> userspace. It lives in the cpu_entry_area as a virtual map of the real
> kernel allocation, and this virtual address is used for LLDT.
> Modification is done through sys_modify_ldt().

And there must be a user-style page table backing that cpu_entry_area,
because the use of get_locked_pte() and pte_unmap_unlock() implies
that there's a user page table (struct page containing spinlock if
config says so) rather than just a kernel page table mapping it.

> 
> I think I would feel much better if this were something like:
> 
> 	if (!WARN_ON_ONCE(!ptep))
> 
> This really shouldn't fail and if it does, simply skipping it isn't the
> right thing either.

Sure, I'll gladly make that change when I respin - not immediately, let's
get more feedback on this arch series first, but maybe in a week's time.

Thanks for looking so quickly, Peter: I didn't Cc you on this particular
series, but shall certainly be doing so on the ones that follow, because
a few of those patches go into interesting pmdp_get_lockless() territory.

Hugh
