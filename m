Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0902A2E01
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Nov 2020 16:20:41 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CPxSP0KSRzDqRp
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Nov 2020 02:20:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=tYvaG/9d; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CPxLh6TW6zDqRG
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Nov 2020 02:15:40 +1100 (AEDT)
Received: from kernel.org (unknown [87.71.17.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 30D5B21556;
 Mon,  2 Nov 2020 15:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604330137;
 bh=HUTlle6eGdFGRRBi2JxylJ6R01dvNLPTF9EEu8JnDzk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tYvaG/9dInW01K1TdO7aN/JE/ddj5YkjOdNNg69Vx3IMO/KyPHo+L3t750XHeB7cy
 9nHtZ/YgWXPmU7Jf3+rHocYXndpyDvstMLn2JsE5CdJ3oN4Ef/dmiDi3mtetYWFv3p
 XYQkck9tVbbZ/n1Alyl03sGboOgOce0/AdowI7CE=
Date: Mon, 2 Nov 2020 17:15:24 +0200
From: Mike Rapoport <rppt@kernel.org>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v3 3/4] arch, mm: restore dependency of
 __kernel_map_pages() of DEBUG_PAGEALLOC
Message-ID: <20201102151524.GB4879@kernel.org>
References: <20201101170815.9795-1-rppt@kernel.org>
 <20201101170815.9795-4-rppt@kernel.org>
 <8eac2aa4-114e-f981-c8f8-ad8523175cf8@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8eac2aa4-114e-f981-c8f8-ad8523175cf8@redhat.com>
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, Pavel Machek <pavel@ucw.cz>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 Christoph Lameter <cl@linux.com>, Will Deacon <will@kernel.org>,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, x86@kernel.org,
 Mike Rapoport <rppt@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Len Brown <len.brown@intel.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>,
 linux-pm@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>,
 David Rientjes <rientjes@google.com>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Thomas Gleixner <tglx@linutronix.de>, Joonsoo Kim <iamjoonsoo.kim@lge.com>,
 linux-arm-kernel@lists.infradead.org, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 linux-kernel@vger.kernel.org, Pekka Enberg <penberg@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>,
 "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Nov 02, 2020 at 10:23:20AM +0100, David Hildenbrand wrote:
> 
> >   int __init kernel_map_pages_in_pgd(pgd_t *pgd, u64 pfn, unsigned long address,
> >   				   unsigned numpages, unsigned long page_flags)
> > diff --git a/include/linux/mm.h b/include/linux/mm.h
> > index 14e397f3752c..ab0ef6bd351d 100644
> > --- a/include/linux/mm.h
> > +++ b/include/linux/mm.h
> > @@ -2924,7 +2924,11 @@ static inline bool debug_pagealloc_enabled_static(void)
> >   	return static_branch_unlikely(&_debug_pagealloc_enabled);
> >   }
> > -#if defined(CONFIG_DEBUG_PAGEALLOC) || defined(CONFIG_ARCH_HAS_SET_DIRECT_MAP)
> > +#ifdef CONFIG_DEBUG_PAGEALLOC
> > +/*
> > + * To support DEBUG_PAGEALLOC architecture must ensure that
> > + * __kernel_map_pages() never fails
> 
> Maybe add here, that this implies mapping everything via PTEs during boot.

This is more of an implementation detail, while assumption that
__kernel_map_pages() does not fail is somewhat a requirement :)

> Acked-by: David Hildenbrand <david@redhat.com>

Thanks!

> -- 
> Thanks,
> 
> David / dhildenb
> 

-- 
Sincerely yours,
Mike.
