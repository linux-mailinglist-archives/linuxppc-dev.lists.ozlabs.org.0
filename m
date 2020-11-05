Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4772A7C36
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Nov 2020 11:51:29 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CRgLQ2D0YzDqtr
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Nov 2020 21:51:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CRgGL3P8vzDqlV
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Nov 2020 21:47:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=J41fFyqX; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4CRgGH3bNSz9sRR;
 Thu,  5 Nov 2020 21:47:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1604573274;
 bh=zpJCZvrEaUbnneNHx3sKOMKjl5v1s/eLap0pW63i+3c=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=J41fFyqXct+0/UM/ZecYYTgh8hoXr/zc8MW9LP1Ovh3Bhqevo0n0kbqAexfHJj8be
 aSHbNMGZpo1y4s/ayhIKlkW73nsGjzxx36UnIOYxCuWAqaGwMIqK0iAJPZCYRkxosF
 ZWV2AYbKTYT0m8TKLTyG2sTTlzgrxlxm1fRTXWsQiMVnk9fJJLYc4oDFBO6guA3en0
 4EPA6wn6qyvXXzoTl1ZjF0EwkkSO0nvE/YEurS8OV29n5u+eLx6UC5UXzZDUT++CSN
 6pJr5NDKBU4lnSXblB+ctKL8UM7LRA4d67zsmicRf3vKIwsdhjW6QJ/+5/2TrghpPF
 N7YiXRCOYW6RQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1 4/4] powernv/memtrace: don't abuse memory hot(un)plug
 infrastructure for memory allocations
In-Reply-To: <1D39DC0E-C07A-4B9E-B811-67684A4A0FE9@redhat.com>
References: <87o8kcttjp.fsf@mpe.ellerman.id.au>
 <1D39DC0E-C07A-4B9E-B811-67684A4A0FE9@redhat.com>
Date: Thu, 05 Nov 2020 21:47:50 +1100
Message-ID: <87imakt6zt.fsf@mpe.ellerman.id.au>
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
Cc: Michal Hocko <mhocko@suse.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>,
 David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
 Michal Hocko <mhocko@kernel.org>, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, Rashmica Gupta <rashmica.g@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, Andrew Morton <akpm@linux-foundation.org>,
 Mike Rapoport <rppt@kernel.org>, Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

David Hildenbrand <david@redhat.com> writes:
>> Am 05.11.2020 um 03:53 schrieb Michael Ellerman <mpe@ellerman.id.au>:
>>=20
>> =EF=BB=BFDavid Hildenbrand <david@redhat.com> writes:
>>> Let's use alloc_contig_pages() for allocating memory and remove the
>>> linear mapping manually via arch_remove_linear_mapping(). Mark all pages
>>> PG_offline, such that they will definitely not get touched - e.g.,
>>> when hibernating. When freeing memory, try to revert what we did.
>>> The original idea was discussed in:
>>> https://lkml.kernel.org/r/48340e96-7e6b-736f-9e23-d3111b915b6e@redhat.c=
om
>>> This is similar to CONFIG_DEBUG_PAGEALLOC handling on other
>>> architectures, whereby only single pages are unmapped from the linear
>>> mapping. Let's mimic what memory hot(un)plug would do with the linear
>>> mapping.
>>> We now need MEMORY_HOTPLUG and CONTIG_ALLOC as dependencies.
>>> Simple test under QEMU TCG (10GB RAM, single NUMA node):
>>> sh-5.0# mount -t debugfs none /sys/kernel/debug/
>>> sh-5.0# cat /sys/devices/system/memory/block_size_bytes
>>> 40000000
>>> sh-5.0# echo 0x40000000 > /sys/kernel/debug/powerpc/memtrace/enable
>>> [   71.052836][  T356] memtrace: Allocated trace memory on node 0 at 0x=
0000000080000000
>>> sh-5.0# echo 0x80000000 > /sys/kernel/debug/powerpc/memtrace/enable
>>> [   75.424302][  T356] radix-mmu: Mapped 0x0000000080000000-0x00000000c=
0000000 with 64.0 KiB pages
>>> [   75.430549][  T356] memtrace: Freed trace memory back on node 0
>>> [   75.604520][  T356] memtrace: Allocated trace memory on node 0 at 0x=
0000000080000000
>>> sh-5.0# echo 0x100000000 > /sys/kernel/debug/powerpc/memtrace/enable
>>> [   80.418835][  T356] radix-mmu: Mapped 0x0000000080000000-0x000000010=
0000000 with 64.0 KiB pages
>>> [   80.430493][  T356] memtrace: Freed trace memory back on node 0
>>> [   80.433882][  T356] memtrace: Failed to allocate trace memory on nod=
e 0
>>> sh-5.0# echo 0x40000000 > /sys/kernel/debug/powerpc/memtrace/enable
>>> [   91.920158][  T356] memtrace: Allocated trace memory on node 0 at 0x=
0000000080000000
>>=20
>> I gave this a quick spin on a real machine, seems to work OK.
>>=20
>> I don't have the actual memtrace tools setup to do an actual trace, will
>> try and get someone to test that also.
>>=20
>> One observation is that previously the memory was zeroed when enabling
>> the memtrace, whereas now it's not.
>>=20
>> eg, before:
>>=20
>> # hexdump -C /sys/kernel/debug/powerpc/memtrace/00000000/trace=20
>> 00000000  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |...........=
.....|
>> *
>> 10000000
>>=20
>> whereas after:
>>=20
>> # hexdump -C /sys/kernel/debug/powerpc/memtrace/00000000/trace
>> 00000000  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |...........=
.....|
>> *
>> 00000080  e0 fd 43 00 00 00 00 00  e0 fd 43 00 00 00 00 00  |..C.......C=
.....|
>> 00000090  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |...........=
.....|
>> *
>> 00000830  98 bf 39 00 00 00 00 00  98 bf 39 00 00 00 00 00  |..9.......9=
.....|
>> 00000840  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |...........=
.....|
>> *
>> 000008a0  b0 c8 47 00 00 00 00 00  b0 c8 47 00 00 00 00 00  |..G.......G=
.....|
>> 000008b0  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |...........=
.....|
>> ...
>> 0fffff70  78 53 49 7d 00 00 29 2e  88 00 92 41 01 00 49 39  |xSI}..)....=
A..I9|
>> 0fffff80  b4 07 4a 7d 28 f8 00 7d  00 48 08 7c 0c 00 c2 40  |..J}(..}.H.=
|...@|
>> 0fffff90  2d f9 40 7d f0 ff c2 40  b4 07 0a 7d 00 48 8a 7f  |-.@}...@...=
}.H..|
>> 0fffffa0  70 fe 9e 41 cc ff ff 4b  00 00 00 60 00 00 00 60  |p..A...K...=
`...`|
>> 0fffffb0  01 00 00 48 00 00 00 60  00 00 a3 2f 0c fd 9e 40  |...H...`...=
/...@|
>> 0fffffc0  00 00 a2 3c 00 00 a5 e8  00 00 62 3c 00 00 63 e8  |...<......b=
<..c.|
>> 0fffffd0  01 00 20 39 83 02 80 38  00 00 3c 99 01 00 00 48  |.. 9...8..<=
....H|
>> 0fffffe0  00 00 00 60 e4 fc ff 4b  00 00 80 38 78 fb e3 7f  |...`...K...=
8x...|
>> 0ffffff0  01 00 00 48 00 00 00 60  2c fe ff 4b 00 00 00 60  |...H...`,..=
K...`|
>> 10000000
>>=20
>>=20
>> That's a nice way for root to read kernel memory, so we should probably
>> add a __GFP_ZERO or memset in there somewhere.
>
> Thanks for catching that! Will have a look on Monday if
> alloc_contig_pages() already properly handled __GFP_ZERO so we can use
> it, otherwise I=E2=80=98ll fix that.

I had a quick look and didn't see it, but maybe it is in there somewhere.

> I don=E2=80=98t recall that memory hotunplug does any zeroing - that=E2=
=80=98s why I
> didn=E2=80=98t add any explicit zeroing. Could be you were just lucky in =
your
> experiment - I assume we=E2=80=98ll leak kernel memory already.

Hmm yeah good point. I did try it multiple times, and I never get
anything non-zero with the existing code.

I guess it's just that the new method is more likely to give us memory
that's already been used for something.

So I guess that's not actually a problem with your patch, it's just
exposing an existing issue.

cheers
