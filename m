Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3548E1725C9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Feb 2020 18:58:46 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48T0lj55D4zDr5N
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Feb 2020 04:58:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2607:f8b0:4864:20::341;
 helo=mail-ot1-x341.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=1wq4hmg+; dkim-atps=neutral
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48T0gs3xr7zDr48
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Feb 2020 04:55:18 +1100 (AEDT)
Received: by mail-ot1-x341.google.com with SMTP id x97so1151075ota.6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Feb 2020 09:55:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DMctyA7z97eyN2JvDNB9L3xQr/YlQGTFBf3sd5NKHWU=;
 b=1wq4hmg+uAsjEl/wgmRZB+WY61SnT3Q8t2Ct2r2UbddVJTiMvdR+jHFO1VPZwWNFln
 3rf7Tc5G5oXeyVoTint/38zy/H44ulX2ua0wHcyBIAHpC8mnjJr+rgmv0kKGiGmqyyyr
 L6M2BuMpkX8f0mweKz2Xgkf0GCW6ovX4yeF9bZC9VhjnwB1aov3Vbyo9tNgTGFEZTlpn
 PFau6OyWaDUbHi1RUDFKRo6s3n/qIE7YDXlscTscoKY8uEYiod5jIcG4aTjleM2sHnlx
 XFPnIuU3sek8SyIYqhhO5bL63kPvhVttnFL+49NWXf0cP337y2MPHX0eDfh4FFNryDT5
 9niw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DMctyA7z97eyN2JvDNB9L3xQr/YlQGTFBf3sd5NKHWU=;
 b=lisyuN8cAkA+8GHr3c01m1wr392HMyjKksxzdWnnw1oRqRWiCe6jQE7Aya+izL++AI
 jIrtpsPa9DVpnMs3FSnOcK0Wz+fNX+5SV72+CMTMcex2S97BBwJYmSdt8Ebx3k93wl0s
 PFRoHWzSv/xSM06ZtTcd5JzlgYBtx0D8lD8PcvjA8aLdD63FK/jRhP1UyJFDZTMR9Wue
 LBK1bjL4s0Jinag5hqgTP3yMB0vyPYgy3BR+TX0rmtsqcHKHI6pQ/ND9d2AOXcHi4KRp
 +8p/plGCwlyDWi3V5cJJEogGi6dYcv76LqkdjinrA14YMg1ndf/PrCoeVvsm+kUVuWsZ
 0pPQ==
X-Gm-Message-State: APjAAAWRrV9h/etqTVGF2gL+qULxEN4KJpoBE//rqvjM3QIUn7pA1RFn
 7grF6UbtDphKIJc5NLb1KpBbH5ZnT+zVZKULN4W3gQ==
X-Google-Smtp-Source: APXvYqxdU0nvSDit1sUOCjKYz8qzZqWLce5r/cRVMP78amOH13agUjF/G5uzdRyMv/pxEr2rQ+w8GfXKV+Y/DRwCxOw=
X-Received: by 2002:a9d:6c9:: with SMTP id 67mr43495otx.363.1582826115418;
 Thu, 27 Feb 2020 09:55:15 -0800 (PST)
MIME-Version: 1.0
References: <20200221182503.28317-1-logang@deltatee.com>
 <20200227171704.GK31668@ziepe.ca>
 <e8781f85-3fc7-b9ce-c751-606803cbdc77@deltatee.com>
 <20200227174311.GL31668@ziepe.ca>
In-Reply-To: <20200227174311.GL31668@ziepe.ca>
From: Dan Williams <dan.j.williams@intel.com>
Date: Thu, 27 Feb 2020 09:55:04 -0800
Message-ID: <CAPcyv4iek=EmNk9JgXq=-HcZjd9Kz4m2+qXMhnDWMshFKFZPXQ@mail.gmail.com>
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

On Thu, Feb 27, 2020 at 9:43 AM Jason Gunthorpe <jgg@ziepe.ca> wrote:
>
> On Thu, Feb 27, 2020 at 10:21:50AM -0700, Logan Gunthorpe wrote:
> >
> >
> > On 2020-02-27 10:17 a.m., Jason Gunthorpe wrote:
> > >> Instead of this, this series proposes a change to arch_add_memory()
> > >> to take the pgprot required by the mapping which allows us to
> > >> explicitly set pagetable entries for P2PDMA memory to WC.
> > >
> > > Is there a particular reason why WC was selected here? I thought for
> > > the p2pdma cases there was no kernel user that touched the memory?
> >
> > Yes, that's correct. I choose WC here because the existing users are
> > registering memory blocks without side effects which fit the WC
> > semantics well.
>
> Hm, AFAIK WC memory is not compatible with the spinlocks/mutexs/etc in
> Linux, so while it is true the memory has no side effects, there would
> be surprising concurrency risks if anything in the kernel tried to
> write to it.
>
> Not compatible means the locks don't contain stores to WC memory the
> way you would expect. AFAIK on many CPUs extra barriers are required
> to keep WC stores ordered, the same way ARM already has extra barriers
> to keep UC stores ordered with locking..
>
> The spinlocks are defined to contain UC stores though.

How are spinlocks and mutexes getting into p2pdma ranges in the first
instance? Even with UC, the system has bigger problems if it's trying
to send bus locks targeting PCI, see the flurry of activity of trying
to trigger faults on split locks [1].

This does raise a question about separating the cacheability of the
'struct page' memmap from the BAR range. You get this for free if the
memmap is dynamically allocated from "System RAM", but perhaps
memremap_pages() should explicitly prevent altmap configurations that
try to place the map in PCI space?

> If there is no actual need today for WC I would suggest using UC as
> the default.

That's reasonable, but it still seems to be making a broken
configuration marginally less broken. I'd be more interested in
safeguards that prevent p2pdma mappings from being used for any cpu
atomic cycles.

[1]: https://lwn.net/Articles/784864/
