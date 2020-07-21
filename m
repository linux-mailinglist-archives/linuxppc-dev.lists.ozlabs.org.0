Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA44228C94
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 01:15:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BBDwj2Z9wzDqhN
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 09:15:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Unknown mechanism
 found: ip:192.40.192.88/32) smtp.mailfrom=kernel.crashing.org
 (client-ip=76.164.61.194; helo=kernel.crashing.org;
 envelope-from=benh@kernel.crashing.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from kernel.crashing.org (kernel.crashing.org [76.164.61.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BBDt72DwnzDqkR
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jul 2020 09:13:35 +1000 (AEST)
Received: from localhost (gate.crashing.org [63.228.1.57])
 (authenticated bits=0)
 by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 06LNCxrb017185
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 21 Jul 2020 18:13:05 -0500
Message-ID: <6fbea8347bdb8434d91cf3ec2b95b134bd66cfe3.camel@kernel.crashing.org>
Subject: Re: [PATCH v5 1/4] riscv: Move kernel mapping to vmalloc zone
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Palmer Dabbelt <palmer@dabbelt.com>, alex@ghiti.fr
Date: Wed, 22 Jul 2020 09:12:58 +1000
In-Reply-To: <mhng-08bff01a-ca15-4bbc-8454-2ca3e823fef8@palmerdabbelt-glaptop1>
References: <mhng-08bff01a-ca15-4bbc-8454-2ca3e823fef8@palmerdabbelt-glaptop1>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
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
Cc: aou@eecs.berkeley.edu, linux-mm@kvack.org, Anup Patel <Anup.Patel@wdc.com>,
 linux-kernel@vger.kernel.org, Atish Patra <Atish.Patra@wdc.com>,
 paulus@samba.org, zong.li@sifive.com, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2020-07-21 at 12:05 -0700, Palmer Dabbelt wrote:
> 
> * We waste vmalloc space on 32-bit systems, where there isn't a lot of it.
> * On 64-bit systems the VA space around the kernel is precious because it's the
>   only place we can place text (modules, BPF, whatever). 

Why ? Branch distance limits ? You can't use trampolines ?

>  If we start putting
>   the kernel in the vmalloc space then we either have to pre-allocate a bunch
>   of space around it (essentially making it a fixed mapping anyway) or it
>   becomes likely that we won't be able to find space for modules as they're
>   loaded into running systems.

I dislike the kernel being in the vmalloc space (see my other email)
but I don't understand the specific issue with modules.

> * Relying on a relocatable kernel for sv48 support introduces a fairly large
>   performance hit.

Out of curiosity why would relocatable kernels introduce a significant
hit ? Where about do you see the overhead coming from ?

> Roughly, my proposal would be to:
> 
> * Leave the 32-bit memory map alone.  On 32-bit systems we can load modules
>   anywhere and we only have one VA width, so we're not really solving any
>   problems with these changes.
> * Staticly allocate a 2GiB portion of the VA space for all our text, as its own
>   region.  We'd link/relocate the kernel here instead of around PAGE_OFFSET,
>   which would decouple the kernel from the physical memory layout of the system.
>   This would have the side effect of sorting out a bunch of bootloader headaches
>   that we currently have.
> * Sort out how to maintain a linear map as the canonical hole moves around
>   between the VA widths without adding a bunch of overhead to the virt2phys and
>   friends.  This is probably going to be the trickiest part, but I think if we
>   just change the page table code to essentially lie about VAs when an sv39
>   system runs an sv48+sv39 kernel we could make it work -- there'd be some
>   logical complexity involved, but it would remain fast.
> 
> This doesn't solve the problem of virtually relocatable kernels, but it does
> let us decouple that from the sv48 stuff.  It also lets us stop relying on a
> fixed physical address the kernel is loaded into, which is another thing I
> don't like.
> 
> I know this may be a more complicated approach, but there aren't any sv48
> systems around right now so I just don't see the rush to support them,
> particularly when there's a cost to what already exists (for those who haven't
> been watching, so far all the sv48 patch sets have imposed a significant
> performance penalty on all systems).

