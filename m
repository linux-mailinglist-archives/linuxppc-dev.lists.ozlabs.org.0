Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF7C1724DA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Feb 2020 18:18:59 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Szsq0tYbzDqw8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Feb 2020 04:18:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ziepe.ca (client-ip=2607:f8b0:4864:20::f44;
 helo=mail-qv1-xf44.google.com; envelope-from=jgg@ziepe.ca; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256
 header.s=google header.b=dth2WWWZ; dkim-atps=neutral
Received: from mail-qv1-xf44.google.com (mail-qv1-xf44.google.com
 [IPv6:2607:f8b0:4864:20::f44])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Szqs2Kh8zDqsW
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Feb 2020 04:17:09 +1100 (AEDT)
Received: by mail-qv1-xf44.google.com with SMTP id dc14so1892218qvb.9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Feb 2020 09:17:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ARo9Rla66Kxeu/Z2V78mx/ehDWu077QNPWdzDFxfOJY=;
 b=dth2WWWZKp9HGsnWrcnEGnyDwu2blK8iDXb8vLMtoeR2VaMJ3fz37+cGHyNAha/rWV
 dK1sGTg22oiYuz24KPwTF2AS2YzOdqQyu6b+TiUBCYZk9V0zbua+mDMo3YTMUSvN9nIT
 EMJKHUaXkpfsveCsIHveNriBa6Vtjb0vFsMy7lGIqEqrtAiZ99Xs/sQZQxUbkx1mzgHf
 AVJsII2Jxg233IpQwYAVVL3i04SYIDZ8pS2nl8aTFh1Sh2y4snmhOeu+kOn7LsejaKvN
 5rYQfvFElRSnuNIftRZI411+PoKrYCAMkJ59tu4Fy8L8tWs1KfJP0Uu0uqOwYZUWVb/k
 btJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ARo9Rla66Kxeu/Z2V78mx/ehDWu077QNPWdzDFxfOJY=;
 b=eTYCXhHEMEk2mtdH1f1zc1rPKIfECmI/ylOUiMqtinhyi34gYe44mdz++RKdk7+3UV
 rMsknaszk6xbF+EiYDDh6z5+74yNYB1OlO2f0Ne2gMvcS1YMLQ3bBlDcQEXystsbOVSU
 fT7+c1JwXQYv6ohq9JIvF3fQR44h+8lFouS8PQom4Se++QFyK3GCYBbi/rJHJsPaItrI
 MbEOmfA6M82HKAtKMWW6tf+2Nn5WpiuFCxO+LxdNbRKRrSFBxFOMMT+1Hx8DiKmgS3Hl
 RFKyxe6btRDOO5Tq30GdsI7vxgUO1n3QBxEC+v+lt2PBneA+df0Y1ldL7JWXojGBeoXq
 9xrA==
X-Gm-Message-State: APjAAAXZC1gYQksEH1VtTGnowwYMbT8/nF4hZmix7AJYjF4HUbaBs4x+
 77chCvcY8Uf4Jyw01nt45zF56A==
X-Google-Smtp-Source: APXvYqzIGS93ngPFOoj3vliIAB10vgE4M/ehyQsI06gG80887mNylpBqlEfVijkpuc5v919Oz9PGMQ==
X-Received: by 2002:ad4:5429:: with SMTP id g9mr757799qvt.134.1582823826213;
 Thu, 27 Feb 2020 09:17:06 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.57.212])
 by smtp.gmail.com with ESMTPSA id x14sm3375572qkf.99.2020.02.27.09.17.05
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 27 Feb 2020 09:17:05 -0800 (PST)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1j7MmW-0003YD-SC; Thu, 27 Feb 2020 13:17:04 -0400
Date: Thu, 27 Feb 2020 13:17:04 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Logan Gunthorpe <logang@deltatee.com>
Subject: Re: [PATCH v3 0/7] Allow setting caching mode in arch_add_memory()
 for P2PDMA
Message-ID: <20200227171704.GK31668@ziepe.ca>
References: <20200221182503.28317-1-logang@deltatee.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200221182503.28317-1-logang@deltatee.com>
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

On Fri, Feb 21, 2020 at 11:24:56AM -0700, Logan Gunthorpe wrote:
> Hi,
> 
> This is v3 of the patchset which cleans up a number of minor issues
> from the feedback of v2 and rebases onto v5.6-rc2. Additional feedback
> is welcome.
> 
> Thanks,
> 
> Logan
> 
> --
> 
> Changes in v3:
>  * Rebased onto v5.6-rc2
>  * Rename mhp_modifiers to mhp_params per David with an updated kernel
>    doc per Dan
>  * Drop support for s390 per David seeing it does not support
>    ZONE_DEVICE yet and there was a potential problem with huge pages.
>  * Added WARN_ON_ONCE in cases where arches recieve non PAGE_KERNEL
>    parameters
>  * Collected David and Micheal's Reviewed-By and Acked-by Tags
> 
> Changes in v2:
>  * Rebased onto v5.5-rc5
>  * Renamed mhp_restrictions to mhp_modifiers and added the pgprot field
>    to that structure instead of using an argument for
>    arch_add_memory().
>  * Add patch to drop the unused flags field in mhp_restrictions
> 
> A git branch is available here:
> 
> https://github.com/sbates130272/linux-p2pmem remap_pages_cache_v3
> 
> --
> 
> Currently, the page tables created using memremap_pages() are always
> created with the PAGE_KERNEL cacheing mode. However, the P2PDMA code
> is creating pages for PCI BAR memory which should never be accessed
> through the cache and instead use either WC or UC. This still works in
> most cases, on x86, because the MTRR registers typically override the
> caching settings in the page tables for all of the IO memory to be
> UC-. However, this tends not to work so well on other arches or
> some rare x86 machines that have firmware which does not setup the
> MTRR registers in this way.
> 
> Instead of this, this series proposes a change to arch_add_memory()
> to take the pgprot required by the mapping which allows us to
> explicitly set pagetable entries for P2PDMA memory to WC.

Is there a particular reason why WC was selected here? I thought for
the p2pdma cases there was no kernel user that touched the memory?

I definitely forsee devices where we want UC instead.

Even so, the whole idea looks like the right direction to me.

Jason
