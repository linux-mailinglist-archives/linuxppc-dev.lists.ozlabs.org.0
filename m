Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B774172559
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Feb 2020 18:46:11 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48T0TC4cSmzDr42
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Feb 2020 04:46:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ziepe.ca (client-ip=2607:f8b0:4864:20::743;
 helo=mail-qk1-x743.google.com; envelope-from=jgg@ziepe.ca; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256
 header.s=google header.b=h0ccKzey; dkim-atps=neutral
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48T0Pv6YzBzDr2N
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Feb 2020 04:43:15 +1100 (AEDT)
Received: by mail-qk1-x743.google.com with SMTP id e16so160825qkl.6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Feb 2020 09:43:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=oCjJQPxZpDAddCTP2fyq9zy2cQ1xSVL89kL40WfyDFw=;
 b=h0ccKzeyP3flPLgjKffvX6NEZ8a/uwNV100LizRKN14n3zedm2cahPgJEhxnAi/Eux
 SoJyZIMb4T7nlpMiSIVzl4rMs2X4TuO582QZ1v3uBlvSIJKL/2eHq1X0Q3RguRMqGiyD
 jIHlP2hMNaMnlwbC+BJKvF6YRP2s83wQLQnu6HWuvl9gBkHIXEKgRfF2bx2kqxfLtaoi
 NHPp/iB678wthxbg1SayDlPMTRa2+OyRd0c8slMZFoj0NWbnumSUHITUyCw6JAjfKy0s
 /ZPnh7hQIi+kffDRK1XYwUv4XEf8RRXfY3Aofqotene7stHVy6OiSQWIReq879CDmrtM
 2sgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=oCjJQPxZpDAddCTP2fyq9zy2cQ1xSVL89kL40WfyDFw=;
 b=GTwX3mKNKjwUmfPEHSlz8wUohf4XIvqDsLAFSEELIJ8ySNFL+DJ5zw16joOrARUGue
 MZvWbhq6yN19J6aj00Eh2WkKiTCK/3EZFtMR/ynZo9J2J+y2RD1CfbT1phcCg15B/ZpC
 uBseoKPCqcOHsM55KYNjq6fdmxIVqxcUcEvBXt+2IG9etFU2IVDjjHliTpisof52zdiF
 HhOSGoM+euVT5VTDWywP4CoC4qbMU7VvYzXgzLJgCz98xmvh7qCcvUkaDbpiCKXKFZ5H
 nFOp/iXsgJeNfKnJ6imhaiVWwIztTzK8NO82/Y8NFA5C3iFZwY30J/OOJw/idCXz+/eE
 kAFQ==
X-Gm-Message-State: APjAAAUOkZeQcWrvW9izihVH+5ONcrhjd7ezd6Q/2pT7qC8wjfy24Ubm
 zDQgpGfbfl+AgP7tj0a7ONzH0g==
X-Google-Smtp-Source: APXvYqz1bAJmZgA8/8aWp40ku++Grc84lutv6gcjfJ4VE4iLl6cxS/fnpq6F9eLVrs8dckDJaWVR0g==
X-Received: by 2002:a05:620a:2185:: with SMTP id g5mr445502qka.4.1582825391979; 
 Thu, 27 Feb 2020 09:43:11 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.57.212])
 by smtp.gmail.com with ESMTPSA id k23sm3317124qtq.89.2020.02.27.09.43.11
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 27 Feb 2020 09:43:11 -0800 (PST)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1j7NBn-0003iZ-2v; Thu, 27 Feb 2020 13:43:11 -0400
Date: Thu, 27 Feb 2020 13:43:11 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Logan Gunthorpe <logang@deltatee.com>
Subject: Re: [PATCH v3 0/7] Allow setting caching mode in arch_add_memory()
 for P2PDMA
Message-ID: <20200227174311.GL31668@ziepe.ca>
References: <20200221182503.28317-1-logang@deltatee.com>
 <20200227171704.GK31668@ziepe.ca>
 <e8781f85-3fc7-b9ce-c751-606803cbdc77@deltatee.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e8781f85-3fc7-b9ce-c751-606803cbdc77@deltatee.com>
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, platform-driver-x86@vger.kernel.org,
 linux-mm@kvack.org, Will Deacon <will@kernel.org>,
 Christoph Hellwig <hch@lst.de>, linux-s390@vger.kernel.org,
 David Hildenbrand <david@redhat.com>, Ingo Molnar <mingo@redhat.com>,
 Dan Williams <dan.j.williams@intel.com>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Michal Hocko <mhocko@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Eric Badger <ebadger@gigaio.com>, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Feb 27, 2020 at 10:21:50AM -0700, Logan Gunthorpe wrote:
> 
> 
> On 2020-02-27 10:17 a.m., Jason Gunthorpe wrote:
> >> Instead of this, this series proposes a change to arch_add_memory()
> >> to take the pgprot required by the mapping which allows us to
> >> explicitly set pagetable entries for P2PDMA memory to WC.
> > 
> > Is there a particular reason why WC was selected here? I thought for
> > the p2pdma cases there was no kernel user that touched the memory?
> 
> Yes, that's correct. I choose WC here because the existing users are
> registering memory blocks without side effects which fit the WC
> semantics well.

Hm, AFAIK WC memory is not compatible with the spinlocks/mutexs/etc in
Linux, so while it is true the memory has no side effects, there would
be surprising concurrency risks if anything in the kernel tried to
write to it.

Not compatible means the locks don't contain stores to WC memory the
way you would expect. AFAIK on many CPUs extra barriers are required
to keep WC stores ordered, the same way ARM already has extra barriers
to keep UC stores ordered with locking..

The spinlocks are defined to contain UC stores though.

If there is no actual need today for WC I would suggest using UC as
the default.

Jason
