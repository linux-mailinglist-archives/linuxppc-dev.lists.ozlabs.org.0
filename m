Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 057D08FC14B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jun 2024 03:30:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BGnOnSbd;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vv8zm1MVyz3fm6
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jun 2024 11:30:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BGnOnSbd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=vbabka@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vv2pS5Rwbz3cYh
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Jun 2024 06:52:16 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7209F614F1;
	Tue,  4 Jun 2024 20:52:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4A9DC2BBFC;
	Tue,  4 Jun 2024 20:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717534334;
	bh=y+8CKHrB4O4j80cxj7GlaoyAv7eWMbh8YsZykcrvLj4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BGnOnSbd85K0EPEFf3nTeVbhYOtDqa45A97NwY2zZBnWV4ojBrqYs0IcfHwTfsIOJ
	 joJnGI1VJ/EwD0prkDWc/P43JZKVMOCCMVLTUuAdlqMVgxZbboaYnOcnFNoiZoW3J0
	 2xmB1ByBVgutfJsC8iD37OAus1bzrPOMab0j1ap61vCefTDHP7nfNGJa+WDPtO0Bgg
	 AGYlYht2Ca5HdLUXLA8YXiNCGXU/9QjkE3K9dAwERt9nF4HyW+X7VPeV0kEsqsjnDW
	 Bc2Ie90vXwIDb+F5KdGiR0IJezHMoHknk827GbopURf5wTW9VT0DvygiDOzzCdx1+S
	 thIUZ5OAxOruw==
Message-ID: <5c69cee6-f101-4c86-b38a-7c5c8679ea9b@kernel.org>
Date: Tue, 4 Jun 2024 22:52:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: kswapd0: page allocation failure: order:0,
 mode:0x820(GFP_ATOMIC), nodemask=(null),cpuset=/,mems_allowed=0 (Kernel
 v6.5.9, 32bit ppc)
To: Yosry Ahmed <yosryahmed@google.com>, Erhard Furtner <erhard_f@mailbox.org>
References: <20240508202111.768b7a4d@yea> <20240515224524.1c8befbe@yea>
 <CAOUHufZ-9NmzOKjLedvZFp0=N0LvRZn77qC6k1WXK+NHtKr=0w@mail.gmail.com>
 <CAOUHufZ36rQc8AfLtRv2QrEareysdvbprAEO5XkcG-FeDOxFLA@mail.gmail.com>
 <20240602200332.3e531ff1@yea> <20240604001304.5420284f@yea>
 <CAJD7tkbCRLdy0vD2Pd17fNrxHgkzW1VucN4qMkohLFLBLaaeCQ@mail.gmail.com>
Content-Language: en-US
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
In-Reply-To: <CAJD7tkbCRLdy0vD2Pd17fNrxHgkzW1VucN4qMkohLFLBLaaeCQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 05 Jun 2024 11:28:46 +1000
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
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, Yu Zhao <yuzhao@google.com>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 6/4/24 1:24 AM, Yosry Ahmed wrote:
> On Mon, Jun 3, 2024 at 3:13 PM Erhard Furtner <erhard_f@mailbox.org> wrote:
>>
>> On Sun, 2 Jun 2024 20:03:32 +0200
>> Erhard Furtner <erhard_f@mailbox.org> wrote:
>>
>> > On Sat, 1 Jun 2024 00:01:48 -0600
>> > Yu Zhao <yuzhao@google.com> wrote:
>> >
>> > > The OOM kills on both kernel versions seem to be reasonable to me.
>> > >
>> > > Your system has 2GB memory and it uses zswap with zsmalloc (which is
>> > > good since it can allocate from the highmem zone) and zstd/lzo (which
>> > > doesn't matter much). Somehow -- I couldn't figure out why -- it
>> > > splits the 2GB into a 0.25GB DMA zone and a 1.75GB highmem zone:
>> > >
>> > > [    0.000000] Zone ranges:
>> > > [    0.000000]   DMA      [mem 0x0000000000000000-0x000000002fffffff]
>> > > [    0.000000]   Normal   empty
>> > > [    0.000000]   HighMem  [mem 0x0000000030000000-0x000000007fffffff]
>> > >
>> > > The kernel can't allocate from the highmem zone -- only userspace and
>> > > zsmalloc can. OOM kills were due to the low memory conditions in the
>> > > DMA zone where the kernel itself failed to allocate from.
>> > >
>> > > Do you know a kernel version that doesn't have OOM kills while running
>> > > the same workload? If so, could you send that .config to me? If not,
>> > > could you try disabling CONFIG_HIGHMEM? (It might not help but I'm out
>> > > of ideas at the moment.)
>>
>> Ok, the bisect I did actually revealed something meaningful:
>>
>>  # git bisect good
>> b8cf32dc6e8c75b712cbf638e0fd210101c22f17 is the first bad commit
>> commit b8cf32dc6e8c75b712cbf638e0fd210101c22f17
>> Author: Yosry Ahmed <yosryahmed@google.com>
>> Date:   Tue Jun 20 19:46:44 2023 +0000
>>
>>     mm: zswap: multiple zpools support
> 
> Thanks for bisecting. Taking a look at the thread, it seems like you
> have a very limited area of memory to allocate kernel memory from. One
> possible reason why that commit can cause an issue is because we will
> have multiple instances of the zsmalloc slab caches 'zspage' and
> 'zs_handle', which may contribute to fragmentation in slab memory.
> 
> Do you have /proc/slabinfo from a good and a bad run by any chance?
> 
> Also, could you check if the attached patch helps? It makes sure that
> even when we use multiple zsmalloc zpools, we will use a single slab
> cache of each type.

As for reducing slab fragmentation/footprint, I would also recommend these
changes to .config:

CONFIG_SLAB_MERGE_DEFAULT=y - this will unify the separate zpool caches as
well (but the patch still makes sense), but also many others
CONFIG_RANDOM_KMALLOC_CACHES=n - no 16 separate copies of kmalloc caches

although the slabinfo output doesn't seem to show
CONFIG_RANDOM_KMALLOC_CACHES in action, weirdly. It was enabled in the
config attached to the first mail.

Both these changes mean giving up some mitigation against potentai
lvulnerabilities. But it's not perfect anyway and the memory seems really
tight here.
