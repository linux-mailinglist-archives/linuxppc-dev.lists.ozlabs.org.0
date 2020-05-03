Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6321C297D
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 May 2020 05:13:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49F9zQ1xp5zDr2w
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 May 2020 13:13:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=ira.weiny@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49F9xr1sMwzDqSK
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  3 May 2020 13:11:34 +1000 (AEST)
IronPort-SDR: hck381wWxTkykNgaSD89Cy18VtL5/4gdmvCqOsOB9PlZ7ioR9DU9VkPRhltBR2pjCmO851pWaL
 ossbipDgkPiA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2020 20:11:29 -0700
IronPort-SDR: BDCSOhfLrIbfj7Y5Tw0emibzPffaFEcH6uyQOaSnsa+CYyRQvgFcoRzXLtMv2aSaIMshzi3s7v
 wmHP1NS0G8+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,346,1583222400"; d="scan'208";a="262468221"
Received: from iweiny-desk2.sc.intel.com ([10.3.52.147])
 by orsmga006.jf.intel.com with ESMTP; 02 May 2020 20:11:28 -0700
Date: Sat, 2 May 2020 20:11:28 -0700
From: Ira Weiny <ira.weiny@intel.com>
To: Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [PATCH V1 09/10] arch/kmap: Define kmap_atomic_prot() for all
 arch's
Message-ID: <20200503031127.GA685597@iweiny-DESK2.sc.intel.com>
References: <20200430203845.582900-1-ira.weiny@intel.com>
 <20200430203845.582900-10-ira.weiny@intel.com>
 <20200501023734.GF23230@ZenIV.linux.org.uk>
 <20200501032020.GG23230@ZenIV.linux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200501032020.GG23230@ZenIV.linux.org.uk>
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
 Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Huang Rui <ray.huang@amd.com>,
 Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>,
 sparclinux@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>,
 Helge Deller <deller@gmx.de>, x86@kernel.org, linux-csky@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>, linux-snps-arc@lists.infradead.org,
 linux-xtensa@linux-xtensa.org, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Christian Koenig <christian.koenig@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, May 01, 2020 at 04:20:20AM +0100, Al Viro wrote:
> On Fri, May 01, 2020 at 03:37:34AM +0100, Al Viro wrote:
> > On Thu, Apr 30, 2020 at 01:38:44PM -0700, ira.weiny@intel.com wrote:
> > 
> > > -static inline void *kmap_atomic(struct page *page)
> > > +static inline void *kmap_atomic_prot(struct page *page, pgprot_t prot)
> > >  {
> > >  	preempt_disable();
> > >  	pagefault_disable();
> > >  	if (!PageHighMem(page))
> > >  		return page_address(page);
> > > -	return kmap_atomic_high(page);
> > > +	return kmap_atomic_high_prot(page, prot);
> > >  }
> > > +#define kmap_atomic(page)	kmap_atomic_prot(page, kmap_prot)
> > 
> > OK, so it *was* just a bisect hazard - you return to original semantics
> > wrt preempt_disable()...
> 
> FWIW, how about doing the following: just before #5/10 have a patch
> that would touch only microblaze, ppc and x86 splitting their
> kmap_atomic_prot() into an inline helper + kmap_atomic_high_prot().
> Then your #5 would leave their kmap_atomic_prot() as-is (it would
> use kmap_atomic_prot_high() instead).  The rest of the series plays
> out pretty much the same way it does now, and wrappers on those
> 3 architectures would go away when an identical generic one is
> introduced in this commit (#9/10).
> 
> AFAICS, that would avoid the bisect hazard and might even end
> up with less noise in the patches...

This works.  V2 coming out shortly.

Thanks for catching this,
Ira

