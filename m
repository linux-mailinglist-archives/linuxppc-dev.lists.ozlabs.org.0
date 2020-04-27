Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A14AD1B94E1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Apr 2020 03:18:39 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 499Rk40zQtzDqVT
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Apr 2020 11:18:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=ira.weiny@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 499RhB2bNpzDqTZ
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Apr 2020 11:16:51 +1000 (AEST)
IronPort-SDR: wbs3Ey4Fw+UuHFGC+LA2XNhpQeH35RMVlRH9j3lQKVzbO0mZvfuA/usNMA52gcHWPBiIiGC8jA
 7uydy6LGw5sA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2020 18:16:46 -0700
IronPort-SDR: ZrrKsQ6Zur3/bE2CO6sc6Wdv34dqrhqrjSlpkUGUwoboNwAHWFqd68hpZ33zjqX/g7EQHldNW4
 L627f0bj0fUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,321,1583222400"; d="scan'208";a="336090274"
Received: from iweiny-desk2.sc.intel.com ([10.3.52.147])
 by orsmga001.jf.intel.com with ESMTP; 26 Apr 2020 18:16:31 -0700
Date: Sun, 26 Apr 2020 18:16:30 -0700
From: Ira Weiny <ira.weiny@intel.com>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH 4/5] arch/kmap_atomic: Consolidate duplicate code
Message-ID: <20200427011630.GC135929@iweiny-DESK2.sc.intel.com>
References: <20200426055406.134198-1-ira.weiny@intel.com>
 <20200426055406.134198-5-ira.weiny@intel.com>
 <20200426072642.GB22024@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200426072642.GB22024@infradead.org>
User-Agent: Mutt/1.11.1 (2018-12-01)
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
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mips@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 Dan Williams <dan.j.williams@intel.com>, Helge Deller <deller@gmx.de>,
 x86@kernel.org, linux-csky@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Chris Zankel <chris@zankel.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Apr 26, 2020 at 12:26:42AM -0700, Christoph Hellwig wrote:
> > diff --git a/arch/arc/mm/highmem.c b/arch/arc/mm/highmem.c
> > index 4db13a6b9f3b..1cae4b911a33 100644
> > --- a/arch/arc/mm/highmem.c
> > +++ b/arch/arc/mm/highmem.c
> > @@ -53,11 +53,10 @@ void *kmap_atomic(struct page *page)
> >  {
> >  	int idx, cpu_idx;
> >  	unsigned long vaddr;
> > +	void *addr = kmap_atomic_fast(page);
> >  
> > -	preempt_disable();
> > -	pagefault_disable();
> > -	if (!PageHighMem(page))
> > -		return page_address(page);
> > +	if (addr)
> > +		return addr;
> 
> Wouldn't it make sense to just move kmap_atomic itelf to common code,
> and call out to a kmap_atomic_high for the highmem case, following the
> scheme in kmap?
>

Sure I do like that symmetry between the calls.

>
> Same for the unmap side.

FWIW that would simply be renaming  __kunmap_atomic() to kunmap_atomic_high()

>
> That might require to support
> kmap_atomic_prot everywhere first, which sounds like a really good
> idea anyway, and would avoid the need for strange workaround in drm.

Having a kmap_atomic_prot() seems like a good idea.  But I'm not exactly sure
why CONFIG_x86 is being called out specifically in the DRM code?

Ira

