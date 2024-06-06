Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CCE78FE616
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2024 14:09:32 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=gXitfN/C;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vw36K3Zclz3dWw
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2024 22:09:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=gXitfN/C;
	dkim-atps=neutral
Received: from mail.ozlabs.org (unknown [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vw35Z1RZVz3cXl
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jun 2024 22:08:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1717675720;
	bh=jf6I6xPOoFmyPi+Dvj7dyL+auQmhBkfhs3JRM5ezBbA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=gXitfN/C4e3dhal6n8P5VnzgZuvle7giCi3LvyFeLxuJfpTDRTz35noIN9yVgbDES
	 48B4/WeESE4DDuEoUIrRpen03CwtCvBPwfmTFYAJQq+jZATeF7YMMr+DA2IIOr5sh/
	 O1Hws05lhjiKo4w9wlcz0qwuUnEPJA0k7hgZaOHJ5+lz9E0L3y6s/+bPcdTFMZdjPG
	 uTjRg1iD8qkEJYoOMb68QdTXan46rc3gSybL/dYKghoxHFrnKo90g5DTmEw81Q0nlb
	 202ipDiC1fov69efOflXwHU5B1S++26LAkTzl1tLsWy+APhsI6QWZKTzV9vpyFuTNQ
	 XOVsss868Z6yQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Vw35N4Rfbz4wc5;
	Thu,  6 Jun 2024 22:08:40 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Yu Zhao <yuzhao@google.com>, Erhard Furtner <erhard_f@mailbox.org>
Subject: Re: kswapd0: page allocation failure: order:0,
 mode:0x820(GFP_ATOMIC), nodemask=(null),cpuset=/,mems_allowed=0 (Kernel
 v6.5.9, 32bit ppc)
In-Reply-To: <CAOUHufacbbpS3ghEwsQ-pObttnQk__xo0vjpGWXNq1i-bsuiGw@mail.gmail.com>
References: <20240508202111.768b7a4d@yea> <20240515224524.1c8befbe@yea>
 <CAOUHufZ-9NmzOKjLedvZFp0=N0LvRZn77qC6k1WXK+NHtKr=0w@mail.gmail.com>
 <CAOUHufZ36rQc8AfLtRv2QrEareysdvbprAEO5XkcG-FeDOxFLA@mail.gmail.com>
 <45fc081c-ee8d-4774-a597-708d2924f812@redhat.com>
 <87tti6pxxc.fsf@mail.lhotse>
 <CAOUHufacbbpS3ghEwsQ-pObttnQk__xo0vjpGWXNq1i-bsuiGw@mail.gmail.com>
Date: Thu, 06 Jun 2024 22:08:40 +1000
Message-ID: <87r0dap92v.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, David Hildenbrand <david@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Yu Zhao <yuzhao@google.com> writes:
> On Wed, Jun 5, 2024 at 9:12=E2=80=AFPM Michael Ellerman <mpe@ellerman.id.=
au> wrote:
>>
>> David Hildenbrand <david@redhat.com> writes:
>> > On 01.06.24 08:01, Yu Zhao wrote:
>> >> On Wed, May 15, 2024 at 4:06=E2=80=AFPM Yu Zhao <yuzhao@google.com> w=
rote:
>> ...
>> >>
>> >> Your system has 2GB memory and it uses zswap with zsmalloc (which is
>> >> good since it can allocate from the highmem zone) and zstd/lzo (which
>> >> doesn't matter much). Somehow -- I couldn't figure out why -- it
>> >> splits the 2GB into a 0.25GB DMA zone and a 1.75GB highmem zone:
>> >>
>> >> [    0.000000] Zone ranges:
>> >> [    0.000000]   DMA      [mem 0x0000000000000000-0x000000002fffffff]
>> >> [    0.000000]   Normal   empty
>> >> [    0.000000]   HighMem  [mem 0x0000000030000000-0x000000007fffffff]
>> >
>> > That's really odd. But we are messing with "PowerMac3,6", so I don't
>> > really know what's right or wrong ...
>>
>> The DMA zone exists because 9739ab7eda45 ("powerpc: enable a 30-bit
>> ZONE_DMA for 32-bit pmac") selects it.
>>
>> It's 768MB (not 0.25GB) because it's clamped at max_low_pfn:
>
> Right. (I meant 0.75GB.)
>
>> #ifdef CONFIG_ZONE_DMA
>>         max_zone_pfns[ZONE_DMA] =3D min(max_low_pfn,
>>                                       1UL << (zone_dma_bits - PAGE_SHIFT=
));
>> #endif
>>
>> Which comes eventually from CONFIG_LOWMEM_SIZE, which defaults to 768MB.
>
> I see. I grep'ed VMSPLIT which is used on x86 and arm but apparently
> not on powerpc.

Those VMSPLIT configs are nice, on powerpc it's all done manually :}

>> I think it's 768MB because the user:kernel split is 3G:1G, and then the
>> kernel needs some of that 1G virtual space for vmalloc/ioremap/highmem,
>> so it splits it 768M:256M.
>>
>> Then ZONE_NORMAL is empty because it is also limited to max_low_pfn:
>>
>>         max_zone_pfns[ZONE_NORMAL] =3D max_low_pfn;
>>
>> The rest of RAM is highmem.
>>
>> So I think that's all behaving as expected, but I don't know 32-bit /
>> highmem stuff that well so I could be wrong.
>
> Yes, the three zones work as intended.
>
> Erhard,
>
> Since your system only has 2GB memory, I'd try the 2G:2G split, which
> would in theory allow both the kernel and userspace to all memory.
>
> CONFIG_LOWMEM_SIZE_BOOL=3Dy
> CONFIG_LOWMEM_SIZE=3D0x7000000
>
> (Michael, please correct me if the above wouldn't work.)

It's a bit more complicated, in order to increase LOWMEM_SIZE you need
to adjust all the other variables to make space.

To get 2G of user virtual space I think you need:

CONFIG_ADVANCED_OPTIONS=3Dy
CONFIG_LOWMEM_SIZE_BOOL=3Dy
CONFIG_LOWMEM_SIZE=3D0x60000000
CONFIG_PAGE_OFFSET_BOOL=3Dy
CONFIG_PAGE_OFFSET=3D0x90000000
CONFIG_KERNEL_START_BOOL=3Dy
CONFIG_KERNEL_START=3D0x90000000
CONFIG_PHYSICAL_START=3D0x00000000
CONFIG_TASK_SIZE_BOOL=3Dy
CONFIG_TASK_SIZE=3D0x80000000

Which results in 1.5GB of lowmem.

Or if you want to map all 2G of RAM directly in the kernel without
highmem, but limit user virtual space to 1.5G:

CONFIG_ADVANCED_OPTIONS=3Dy
CONFIG_LOWMEM_SIZE_BOOL=3Dy
CONFIG_LOWMEM_SIZE=3D0x80000000
CONFIG_PAGE_OFFSET_BOOL=3Dy
CONFIG_PAGE_OFFSET=3D0x70000000
CONFIG_KERNEL_START_BOOL=3Dy
CONFIG_KERNEL_START=3D0x70000000
CONFIG_PHYSICAL_START=3D0x00000000
CONFIG_TASK_SIZE_BOOL=3Dy
CONFIG_TASK_SIZE=3D0x60000000

You can also reclaim another 256MB of virtual space if you disable
CONFIG_MODULES.

Those configs do boot on qemu. But I don't have easy access to my 32-bit
machine to test if they boot on actual hardware.

cheers
