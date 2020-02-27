Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4B51725EF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Feb 2020 19:05:57 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48T0w30TkczDqxQ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Feb 2020 05:05:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ziepe.ca (client-ip=2607:f8b0:4864:20::743;
 helo=mail-qk1-x743.google.com; envelope-from=jgg@ziepe.ca; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256
 header.s=google header.b=RAltTZst; dkim-atps=neutral
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48T0sf48THzDqqW
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Feb 2020 05:03:49 +1100 (AEDT)
Received: by mail-qk1-x743.google.com with SMTP id f3so259459qkh.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Feb 2020 10:03:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=YVEntATD8Di4X+bfE0q+dQjUPZodyWiwMumJsgAjImQ=;
 b=RAltTZstLeabLiJ0d66x7j4b8d0dFG+sPOHfpbO/cFKDi0l5MP5SaBmzQZcj23Dj9O
 F/bYYNBZZSSfyS9/dujI6RC7S6GQGiGhjfoRC4Je5Ph5T17ppPj/nNg6eK7g8v4ebWzu
 Qxmk3XbPh4QJMBWSZz4NrK//VIcI+eMAy0MaVJAPx5AhdQtsNg6OJfWlFI3uTppHsXSP
 NLDKJ/17oMjJmVhx6/pQNGEX+CmviRc1utdWSmUNrTHklbQUwh86mk+awHvAFbaKoddd
 0oAlTI+2vm+ko8Vd1wYitYFGuU7IYpDc+5ksP1iJZ4Sf+eRw2yMQhLqeo1YoqRFOoTVh
 Z2sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=YVEntATD8Di4X+bfE0q+dQjUPZodyWiwMumJsgAjImQ=;
 b=H2LWPDaCYm7gzPkjN77F5lxKHxzFiNORoA8n2ZIDhvruOPHxPAJXXXkI9IwoDE0hwg
 fhP+sNK0unlsvuKN1yRWqq9ApifVhV9EzDQ2JduIzHzSZ709GEdzn4hCrjAle1iv1VkE
 10eijdBtiNaVwZBamLASGXd2FP8R0KrulLK2f550ZvYJAjSGJLvcwyBJH1/hZmSoZ5nH
 I89d4FgS95tIf9ebuj6WmaPb4ENhGltGK9g08QukjJnrdml7LWsTaLCrdceiPltXH1lQ
 rD51tU6a1joporbdAYLd5wb5m5tDkRhAeRPds0O6lV8iFq5SARqmvUkUxUPlpqD6CzUT
 kgpQ==
X-Gm-Message-State: APjAAAXOkyXcfos6pzbFssxC5HAn8LmmHSN/Oa4Mm4spjVLJdwdNXjF2
 8R0/qLRLsF2vCz8DyJt2kjfgUg==
X-Google-Smtp-Source: APXvYqy6UDThfoJk2c6gSaNxuGupf3hgdusGohKCaZ7APtBt0Z8E4pxTDMcVw55YbgzfmGfI1mrhOg==
X-Received: by 2002:a37:4e53:: with SMTP id c80mr533140qkb.58.1582826627303;
 Thu, 27 Feb 2020 10:03:47 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.57.212])
 by smtp.gmail.com with ESMTPSA id e64sm3551886qtd.45.2020.02.27.10.03.46
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 27 Feb 2020 10:03:46 -0800 (PST)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1j7NVi-0008Pb-Fb; Thu, 27 Feb 2020 14:03:46 -0400
Date: Thu, 27 Feb 2020 14:03:46 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Dan Williams <dan.j.williams@intel.com>
Subject: Re: [PATCH v3 0/7] Allow setting caching mode in arch_add_memory()
 for P2PDMA
Message-ID: <20200227180346.GM31668@ziepe.ca>
References: <20200221182503.28317-1-logang@deltatee.com>
 <20200227171704.GK31668@ziepe.ca>
 <e8781f85-3fc7-b9ce-c751-606803cbdc77@deltatee.com>
 <20200227174311.GL31668@ziepe.ca>
 <CAPcyv4iek=EmNk9JgXq=-HcZjd9Kz4m2+qXMhnDWMshFKFZPXQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPcyv4iek=EmNk9JgXq=-HcZjd9Kz4m2+qXMhnDWMshFKFZPXQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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

On Thu, Feb 27, 2020 at 09:55:04AM -0800, Dan Williams wrote:
> On Thu, Feb 27, 2020 at 9:43 AM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> >
> > On Thu, Feb 27, 2020 at 10:21:50AM -0700, Logan Gunthorpe wrote:
> > >
> > >
> > > On 2020-02-27 10:17 a.m., Jason Gunthorpe wrote:
> > > >> Instead of this, this series proposes a change to arch_add_memory()
> > > >> to take the pgprot required by the mapping which allows us to
> > > >> explicitly set pagetable entries for P2PDMA memory to WC.
> > > >
> > > > Is there a particular reason why WC was selected here? I thought for
> > > > the p2pdma cases there was no kernel user that touched the memory?
> > >
> > > Yes, that's correct. I choose WC here because the existing users are
> > > registering memory blocks without side effects which fit the WC
> > > semantics well.
> >
> > Hm, AFAIK WC memory is not compatible with the spinlocks/mutexs/etc in
> > Linux, so while it is true the memory has no side effects, there would
> > be surprising concurrency risks if anything in the kernel tried to
> > write to it.
> >
> > Not compatible means the locks don't contain stores to WC memory the
> > way you would expect. AFAIK on many CPUs extra barriers are required
> > to keep WC stores ordered, the same way ARM already has extra barriers
> > to keep UC stores ordered with locking..
> >
> > The spinlocks are defined to contain UC stores though.
> 
> How are spinlocks and mutexes getting into p2pdma ranges in the first
> instance? Even with UC, the system has bigger problems if it's trying
> to send bus locks targeting PCI, see the flurry of activity of trying
> to trigger faults on split locks [1].

This is not what I was trying to explain.

Consider

 static spinlock lock; // CPU DRAM
 static idx = 0;
 u64 *wc_memory = [..];

 spin_lock(&lock);
 wc_memory[0] = idx++;
 spin_unlock(&lock);

You'd expect that the PCI device will observe stores where idx is
strictly increasing, but this is not guarenteed. idx may decrease, idx
may skip. It just won't duplicate.

Or perhaps

 wc_memory[0] = foo;
 writel(doorbell)

foo is not guarenteed observable by the device before doorbell reaches
the device.

All of these are things that do not happen with UC or NC memory, and
are surprising violations of our programming model.

Generic kernel code should never touch WC memory unless the code is
specifically designed to handle it.

Jason
