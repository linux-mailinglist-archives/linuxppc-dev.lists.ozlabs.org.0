Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE1B1726A4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Feb 2020 19:17:04 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48T18r5mGBzDqsp
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Feb 2020 05:17:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2607:f8b0:4864:20::343;
 helo=mail-ot1-x343.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=btVB1/kC; dkim-atps=neutral
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48T0yv4zqHzDqlw
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Feb 2020 05:08:23 +1100 (AEDT)
Received: by mail-ot1-x343.google.com with SMTP id r16so63874otd.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Feb 2020 10:08:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4F3CkEYboenOdYfvgxaEFjzaB88Ias8AvgF6y2bsYJo=;
 b=btVB1/kCSyh3miQnMYs3e17lMek8QSVYBuP0FlHl1SN8jj8AK7ZcsZTrZLYZcDr8L0
 NSJ9MeY7RriOXGf8mxUIHycStwVTMNeNi3yrQla6dMYLj551Rp9KWZnTu9g5AKGKvvYT
 9WlFsCXT0V4ckXbqldT9RpXG/xwR6Da9kdRkEzPi8tdoEUk2abNALGro5ZLdP/rXl0tG
 /sptmzlpcqEIizzSfsWPT6ZSjga8U2PolwmP3cK/7EJmAplRWGpIpx3oVOIujglDOBPB
 U/jmRkYeKgZuoKDQ/uKn2xiCIfawYUF6S/k5E1dLzCZ3Me3N7Bit13cPq5fiueJNzJqi
 dLRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4F3CkEYboenOdYfvgxaEFjzaB88Ias8AvgF6y2bsYJo=;
 b=WWhAfys3OMqg08PnOp7/Par99VAPPuAiTurArLFsgEe0lqBWfelBcLx6oRmNg1SgRD
 yUEqkuEnuP0Z+dVLXIyhcj9QKpFpyWRJtgdG51mspZW7CM/fwykmxexXL0AIc3A2JnQZ
 y6ZfMrtKvcOhXLxSzLNz4GZd184pt55VWmtcAXVyyau+CMBOZMWdlhdKQ1pNeRbblzXs
 /xLPfEd67H2JzihyxDhld3m6v3nsID118RrU6LUUxRp9M4BkScqNPLQs2GxCYrutQ0R9
 etE4LUAiULawFCguyS/YWc/TULuaEZlS3QHvca9lrhYtpNnDOler4qCKhzX76bqd5XBW
 yliA==
X-Gm-Message-State: APjAAAUPjkuH2XPUgJdBxu74ndet4YdyaF6v43pqCywdnLdjjZ4DuTWd
 ZPokq2U8VR477x3wjejDoadRQ+7857vcvAplZ7ZYlg==
X-Google-Smtp-Source: APXvYqzWZDXbIbzo1esKuuymk2opANK/r16XeVx9wwrPYC7dcJfvghbSyviygno+FjUiHqeLzBQ9brN5G7f+Od4lm4g=
X-Received: by 2002:a9d:6c9:: with SMTP id 67mr93279otx.363.1582826900650;
 Thu, 27 Feb 2020 10:08:20 -0800 (PST)
MIME-Version: 1.0
References: <20200221182503.28317-1-logang@deltatee.com>
 <20200227171704.GK31668@ziepe.ca>
 <e8781f85-3fc7-b9ce-c751-606803cbdc77@deltatee.com>
 <20200227174311.GL31668@ziepe.ca>
 <CAPcyv4iek=EmNk9JgXq=-HcZjd9Kz4m2+qXMhnDWMshFKFZPXQ@mail.gmail.com>
 <20200227180346.GM31668@ziepe.ca>
In-Reply-To: <20200227180346.GM31668@ziepe.ca>
From: Dan Williams <dan.j.williams@intel.com>
Date: Thu, 27 Feb 2020 10:08:09 -0800
Message-ID: <CAPcyv4g6OYvD57LdWcqGuWVanckQv4a1uzJrE1OZyMH+z=5KZw@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] Allow setting caching mode in arch_add_memory()
 for P2PDMA
To: Jason Gunthorpe <jgg@ziepe.ca>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linux-ia64@vger.kernel.org, Linux-sh <linux-sh@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, platform-driver-x86@vger.kernel.org,
 Linux MM <linux-mm@kvack.org>, Will Deacon <will@kernel.org>,
 Christoph Hellwig <hch@lst.de>, linux-s390 <linux-s390@vger.kernel.org>,
 David Hildenbrand <david@redhat.com>, Ingo Molnar <mingo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Michal Hocko <mhocko@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Eric Badger <ebadger@gigaio.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Logan Gunthorpe <logang@deltatee.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Feb 27, 2020 at 10:03 AM Jason Gunthorpe <jgg@ziepe.ca> wrote:
>
> On Thu, Feb 27, 2020 at 09:55:04AM -0800, Dan Williams wrote:
> > On Thu, Feb 27, 2020 at 9:43 AM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> > >
> > > On Thu, Feb 27, 2020 at 10:21:50AM -0700, Logan Gunthorpe wrote:
> > > >
> > > >
> > > > On 2020-02-27 10:17 a.m., Jason Gunthorpe wrote:
> > > > >> Instead of this, this series proposes a change to arch_add_memory()
> > > > >> to take the pgprot required by the mapping which allows us to
> > > > >> explicitly set pagetable entries for P2PDMA memory to WC.
> > > > >
> > > > > Is there a particular reason why WC was selected here? I thought for
> > > > > the p2pdma cases there was no kernel user that touched the memory?
> > > >
> > > > Yes, that's correct. I choose WC here because the existing users are
> > > > registering memory blocks without side effects which fit the WC
> > > > semantics well.
> > >
> > > Hm, AFAIK WC memory is not compatible with the spinlocks/mutexs/etc in
> > > Linux, so while it is true the memory has no side effects, there would
> > > be surprising concurrency risks if anything in the kernel tried to
> > > write to it.
> > >
> > > Not compatible means the locks don't contain stores to WC memory the
> > > way you would expect. AFAIK on many CPUs extra barriers are required
> > > to keep WC stores ordered, the same way ARM already has extra barriers
> > > to keep UC stores ordered with locking..
> > >
> > > The spinlocks are defined to contain UC stores though.
> >
> > How are spinlocks and mutexes getting into p2pdma ranges in the first
> > instance? Even with UC, the system has bigger problems if it's trying
> > to send bus locks targeting PCI, see the flurry of activity of trying
> > to trigger faults on split locks [1].
>
> This is not what I was trying to explain.
>
> Consider
>
>  static spinlock lock; // CPU DRAM
>  static idx = 0;
>  u64 *wc_memory = [..];
>
>  spin_lock(&lock);
>  wc_memory[0] = idx++;
>  spin_unlock(&lock);
>
> You'd expect that the PCI device will observe stores where idx is
> strictly increasing, but this is not guarenteed. idx may decrease, idx
> may skip. It just won't duplicate.
>
> Or perhaps
>
>  wc_memory[0] = foo;
>  writel(doorbell)
>
> foo is not guarenteed observable by the device before doorbell reaches
> the device.
>
> All of these are things that do not happen with UC or NC memory, and
> are surprising violations of our programming model.
>
> Generic kernel code should never touch WC memory unless the code is
> specifically designed to handle it.

Ah, yes, agree.
