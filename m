Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E321B8B8A
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Apr 2020 05:03:05 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 498t521m2jzDqb0
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Apr 2020 13:03:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux-foundation.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=akpm@linux-foundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=UVpTWp7E; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 498t3G1NK9zDqQN
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Apr 2020 13:01:29 +1000 (AEST)
Received: from localhost.localdomain (c-73-231-172-41.hsd1.ca.comcast.net
 [73.231.172.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6969B206D4;
 Sun, 26 Apr 2020 03:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587870086;
 bh=tCSwWc8iRTvfzhr9Bpi0vaaHrDRBHLwWGG3vKGlFHqg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=UVpTWp7EJhgRsQXBhfo6AT4VrUdy1nNy8nOq/LfihYfu1NC4LJc05Iz8GAX1ZT5f3
 axlF830cN9T/YdFik2zo+N3qO2F4mins96Mu5bgI3K/fB5ghL5mkLmCLUuWklYIKG9
 HZl62/U2hyOlgj8km6aRA/b/nX2GmC3gaq8w7s7A=
Date: Sat, 25 Apr 2020 20:01:24 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH 3/3] mm/hugetlb: Introduce HAVE_ARCH_CLEAR_HUGEPAGE_FLAGS
Message-Id: <20200425200124.20d0c75fcaef05d062d3667c@linux-foundation.org>
In-Reply-To: <87d37591-caa2-b82b-392a-3a29b2c7e9a6@arm.com>
References: <1586864670-21799-1-git-send-email-anshuman.khandual@arm.com>
 <1586864670-21799-4-git-send-email-anshuman.khandual@arm.com>
 <20200425175511.7a68efb5e2f4436fe0328c1d@linux-foundation.org>
 <87d37591-caa2-b82b-392a-3a29b2c7e9a6@arm.com>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, linux-kernel@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Helge Deller <deller@gmx.de>,
 x86@kernel.org, Russell King <linux@armlinux.org.uk>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Fenghua Yu <fenghua.yu@intel.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Borislav Petkov <bp@alien8.de>, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Tony Luck <tony.luck@intel.com>, linux-parisc@vger.kernel.org,
 linux-mips@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, 26 Apr 2020 08:13:17 +0530 Anshuman Khandual <anshuman.khandual@arm.com> wrote:

> 
> 
> On 04/26/2020 06:25 AM, Andrew Morton wrote:
> > On Tue, 14 Apr 2020 17:14:30 +0530 Anshuman Khandual <anshuman.khandual@arm.com> wrote:
> > 
> >> There are multiple similar definitions for arch_clear_hugepage_flags() on
> >> various platforms. This introduces HAVE_ARCH_CLEAR_HUGEPAGE_FLAGS for those
> >> platforms that need to define their own arch_clear_hugepage_flags() while
> >> also providing a generic fallback definition for others to use. This help
> >> reduce code duplication.
> >>
> >> ...
> >>
> >> --- a/include/linux/hugetlb.h
> >> +++ b/include/linux/hugetlb.h
> >> @@ -544,6 +544,10 @@ static inline int is_hugepage_only_range(struct mm_struct *mm,
> >>  }
> >>  #endif
> >>  
> >> +#ifndef HAVE_ARCH_CLEAR_HUGEPAGE_FLAGS
> >> +static inline void arch_clear_hugepage_flags(struct page *page) { }
> >> +#endif
> >> +
> >>  #ifndef arch_make_huge_pte
> >>  static inline pte_t arch_make_huge_pte(pte_t entry, struct vm_area_struct *vma,
> >>  				       struct page *page, int writable)
> > 
> > This is the rather old-school way of doing it.  The Linus-suggested way is
> > 
> > #ifndef arch_clear_hugepage_flags
> > static inline void arch_clear_hugepage_flags(struct page *page)
> > {
> > }
> > #define arch_clear_hugepage_flags arch_clear_hugepage_flags
> 
> Do we need that above line here ? Is not that implicit.

It depends if other header files want to test whether
arch_clear_hugepage_flags is already defined.  If the header heorarchy
is well-defined and working properly, they shouldn't need to, because
we're reliably indluding the relevant arch header before (or early
within) include/linux/hugetlb.h.

It would be nice if

#define arch_clear_hugepage_flags arch_clear_hugepage_flags
#define arch_clear_hugepage_flags arch_clear_hugepage_flags

were to generate an compiler error but it doesn't.  If it did we could
detect these incorrect inclusion orders.

> > #endif
> > 
> > And the various arch headers do
> > 
> > static inline void arch_clear_hugepage_flags(struct page *page)
> > {
> > 	<some implementation>
> > }
> > #define arch_clear_hugepage_flags arch_clear_hugepage_flags
> > 
> > It's a small difference - mainly to avoid adding two variables to the
> > overall namespace where one would do.
> 
> Understood, will change and resend.

That's OK - I've queued up that fix.
