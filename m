Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8EB1EDD1A
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jun 2020 08:19:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49cwcC6P8JzDql2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jun 2020 16:19:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=IXkqPQoO; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49cwZT5nj2zDqjj
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Jun 2020 16:18:25 +1000 (AEST)
Received: from kernel.org (unknown [87.71.78.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3E3962072E;
 Thu,  4 Jun 2020 06:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591251502;
 bh=b58Vy5SwtTbyRgwDB1JjnKDC7odtYPgt+t7MvV6fCOU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IXkqPQoOU3wscqIXXMWt/Y5TkOrwtwnMx8e1GDO3arwp37wF3YS5TWw1he9VyaSeS
 89Vf2ok0AEsO6njQmNORJH1sdCn3SOZLBx7rtKo7/9alOdMNqSdhDlvkldurNoZnBT
 iW2UzmfH4Spawe1NKyJhKCr9TIFG31X5xIMnk6Lw=
Date: Thu, 4 Jun 2020 09:18:05 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] arch/{mips,sparc,microblaze,powerpc}: Don't enable
 pagefault/preempt twice
Message-ID: <20200604061805.GA202650@kernel.org>
References: <20200518184843.3029640-1-ira.weiny@intel.com>
 <20200519165422.GA5838@roeck-us.net>
 <20200519184031.GB3356843@iweiny-DESK2.sc.intel.com>
 <20200519194215.GA71941@roeck-us.net>
 <20200520051315.GA3660833@iweiny-DESK2.sc.intel.com>
 <d86dba19-4f4b-061e-a2c7-4f037e9e2de2@roeck-us.net>
 <20200521174250.GB176262@iweiny-DESK2.sc.intel.com>
 <20200603135736.e7b5ded0082a81ae6d9067a0@linux-foundation.org>
 <20200603211416.GA1740285@iweiny-DESK2.sc.intel.com>
 <3538c8ad-674e-d310-d870-4ef6888092ed@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3538c8ad-674e-d310-d870-4ef6888092ed@roeck-us.net>
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
 Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, Dan Williams <dan.j.williams@intel.com>,
 Helge Deller <deller@gmx.de>, x86@kernel.org, linux-csky@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, Ingo Molnar <mingo@redhat.com>,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 Borislav Petkov <bp@alien8.de>, Al Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Christian Koenig <christian.koenig@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jun 03, 2020 at 04:44:17PM -0700, Guenter Roeck wrote:
> On 6/3/20 2:14 PM, Ira Weiny wrote:
> > On Wed, Jun 03, 2020 at 01:57:36PM -0700, Andrew Morton wrote:
> >> On Thu, 21 May 2020 10:42:50 -0700 Ira Weiny <ira.weiny@intel.com> wrote:
> >>
> >>>>>
> >>>>> Actually it occurs to me that the patch consolidating kmap_prot is odd for
> >>>>> sparc 32 bit...
> >>>>>
> >>>>> Its a long shot but could you try reverting this patch?
> >>>>>
> >>>>> 4ea7d2419e3f kmap: consolidate kmap_prot definitions
> >>>>>
> >>>>
> >>>> That is not easy to revert, unfortunately, due to several follow-up patches.
> >>>
> >>> I have gotten your sparc tests to run and they all pass...
> >>>
> >>> 08:10:34 > ../linux-build-test/rootfs/sparc/run-qemu-sparc.sh 
> >>> Build reference: v5.7-rc4-17-g852b6f2edc0f
> >>>
> >>> Building sparc32:SPARCClassic:nosmp:scsi:hd ... running ......... passed
> >>> Building sparc32:SPARCbook:nosmp:scsi:cd ... running ......... passed
> >>> Building sparc32:LX:nosmp:noapc:scsi:hd ... running ......... passed
> >>> Building sparc32:SS-4:nosmp:initrd ... running ......... passed
> >>> Building sparc32:SS-5:nosmp:scsi:hd ... running ......... passed
> >>> Building sparc32:SS-10:nosmp:scsi:cd ... running ......... passed
> >>> Building sparc32:SS-20:nosmp:scsi:hd ... running ......... passed
> >>> Building sparc32:SS-600MP:nosmp:scsi:hd ... running ......... passed
> >>> Building sparc32:Voyager:nosmp:noapc:scsi:hd ... running ......... passed
> >>> Building sparc32:SS-4:smp:scsi:hd ... running ......... passed
> >>> Building sparc32:SS-5:smp:scsi:cd ... running ......... passed
> >>> Building sparc32:SS-10:smp:scsi:hd ... running ......... passed
> >>> Building sparc32:SS-20:smp:scsi:hd ... running ......... passed
> >>> Building sparc32:SS-600MP:smp:scsi:hd ... running ......... passed
> >>> Building sparc32:Voyager:smp:noapc:scsi:hd ... running ......... passed
> >>>
> >>> Is there another test I need to run?
> >>
> >> This all petered out, but as I understand it, this patchset still might
> >> have issues on various architectures.
> >>
> >> Can folks please provide an update on the testing status?
> > 
> > I believe the tests were failing for Guenter due to another patch set...[1]
> > 
> > My tests with just this series are working.
> > 
> >>From my understanding the other failures were unrelated.[2]
> > 
> > 	<quote Mike Rapoport>
> > 	I've checked the patch above on top of the mmots which already has
> > 	Ira's patches and it booted fine. I've used sparc32_defconfig to build
> > 	the kernel and qemu-system-sparc with default machine and CPU.
> > 	</quote>
> > 
> > Mike, am I wrong?  Do you think the kmap() patches are still causing issues?

sparc32 UP and microblaze work for me with next-20200603, but I didn't
test other architectures. 
 
> For my part, all I can say is that -next is in pretty bad shape right now.
> The summary of my tests says:
> 
> Build results:
> 	total: 151 pass: 130 fail: 21
> Qemu test results:
> 	total: 430 pass: 375 fail: 55
> 
> sparc32 smp images in next-20200603 still crash for me with a spinlock
> recursion.

I think this is because Will's fixes [1] are not yet in -next.

> s390 images hang early in boot. Several others (alpha, arm64,
> various ppc) don't even compile. I can run some more bisects over time,
> but this is becoming a full-time job :-(.
> 
> Guenter

[1] https://lore.kernel.org/lkml/20200526173302.377-1-will@kernel.org
-- 
Sincerely yours,
Mike.
