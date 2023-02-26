Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 050516A3477
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Feb 2023 23:13:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PPyZQ6kCcz3cBy
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Feb 2023 09:13:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=UiT+0xxu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux-foundation.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=UiT+0xxu;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PPyYT4766z3c5D
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Feb 2023 09:12:44 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 52FA360C17;
	Sun, 26 Feb 2023 22:12:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 478B3C433EF;
	Sun, 26 Feb 2023 22:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1677449559;
	bh=58rHNWziKG5F+1xvClRR26TGR/kzgtphh1+ss0F3o1k=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=UiT+0xxuBn3xEDjfKMhE+S6nA/FuZ+LuP5xkiXmr+Z26p7zBTGouYiQnhVvpMNQe4
	 72VgieV739lydXF/yzCq6+namJMMvgD8JJR9Z49ozGh6Bsy6ZoXgzNAL7cPtbQkAKe
	 Yw2Hdqhy91RjOwm5mv0YwB7I/7qyguOod5YPTNVs=
Date: Sun, 26 Feb 2023 14:12:38 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v7 5/5] powerpc/64s: enable MMU_LAZY_TLB_SHOOTDOWN
Message-Id: <20230226141238.6ec5fdf7d75dcf2cd4c58ba0@linux-foundation.org>
In-Reply-To: <20230203071837.1136453-6-npiggin@gmail.com>
References: <20230203071837.1136453-1-npiggin@gmail.com>
	<20230203071837.1136453-6-npiggin@gmail.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: linux-arch@vger.kernel.org, Rik van Riel <riel@redhat.com>, Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Linus Torvalds <torvalds@linux-foundation.org>, Dave Hansen <dave.hansen@linux.intel.com>, linuxppc-dev@lists.ozlabs.org, linux-mm@kvack.org, Andy Lutomirski <luto@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Nadav Amit <nadav.amit@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri,  3 Feb 2023 17:18:37 +1000 Nicholas Piggin <npiggin@gmail.com> wrote:

> On a 16-socket 192-core POWER8 system, the context_switch1_threads
> benchmark from will-it-scale (see earlier changelog), upstream can
> achieve a rate of about 1 million context switches per second, due to
> contention on the mm refcount.
> 
> 64s meets the prerequisites for CONFIG_MMU_LAZY_TLB_SHOOTDOWN, so enable
> the option. This increases the above benchmark to 118 million context
> switches per second.

Is that the best you can do ;)

> This generates 314 additional IPI interrupts on a 144 CPU system doing
> a kernel compile, which is in the noise in terms of kernel cycles.
> 
> ...
>
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -265,6 +265,7 @@ config PPC
>  	select MMU_GATHER_PAGE_SIZE
>  	select MMU_GATHER_RCU_TABLE_FREE
>  	select MMU_GATHER_MERGE_VMAS
> +	select MMU_LAZY_TLB_SHOOTDOWN		if PPC_BOOK3S_64
>  	select MODULES_USE_ELF_RELA
>  	select NEED_DMA_MAP_STATE		if PPC64 || NOT_COHERENT_CACHE
>  	select NEED_PER_CPU_EMBED_FIRST_CHUNK	if PPC64

Can we please have a summary of which other architectures might benefit
from this, and what must they do?

As this is powerpc-only, I expect it won't get a lot of testing in
mm.git or in linux-next.  The powerpc maintainers might choose to merge
in the mm-stable branch at
git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm if this is a
concern.
