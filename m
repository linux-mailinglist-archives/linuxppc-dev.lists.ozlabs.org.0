Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED9A2A75AF
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Nov 2020 03:42:25 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CRSV611ZjzDqhD
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Nov 2020 13:42:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CRSSJ1YBpzDqbw
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Nov 2020 13:40:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=FzcpkpEE; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4CRSSG1F3Bz9sVD;
 Thu,  5 Nov 2020 13:40:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1604544047;
 bh=EuK0sl4T3tPowm1Cy2Bfyz1SCDU4xn4xzHLDHUIdoSU=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=FzcpkpEE3FqIeHXdCOuL3z+LP68gsbNcehy6n+MRtlIPecEEZANdX90NMgYhJ4KM1
 HYaY3LPPopwiQeNMJsFSBMHRtqaKYkBQby82SzA0+/UXw/vGcw8Q6SIjrWBrOaAuRW
 6g7PUiphjZNHgqogX53gz7CKoUZTU/Uxk+EPqdAHsczOyzsjrq+4HhYCyASjZcYHtk
 PkZExxJ2hs/XdUuYFa+FsU4LxYHOaW54X3AoF0fFNCmH9W5cVAhXwT6ATN++6J4FuY
 8kRN2MN+tH77lwTplUxcP/zsUY+XBz6fDjxpcHHJ1h17ilHP6UwG5EA8CH7KVuhtdL
 Pb0orflbx/g3g==
From: Michael Ellerman <mpe@ellerman.id.au>
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 4/4] powernv/memtrace: don't abuse memory hot(un)plug
 infrastructure for memory allocations
In-Reply-To: <20201029162718.29910-5-david@redhat.com>
References: <20201029162718.29910-1-david@redhat.com>
 <20201029162718.29910-5-david@redhat.com>
Date: Thu, 05 Nov 2020 13:40:42 +1100
Message-ID: <87o8kcttjp.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
 David Hildenbrand <david@redhat.com>, Michal Hocko <mhocko@kernel.org>,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 Rashmica Gupta <rashmica.g@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
 Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

David Hildenbrand <david@redhat.com> writes:
> Let's use alloc_contig_pages() for allocating memory and remove the
> linear mapping manually via arch_remove_linear_mapping(). Mark all pages
> PG_offline, such that they will definitely not get touched - e.g.,
> when hibernating. When freeing memory, try to revert what we did.
>
> The original idea was discussed in:
>  https://lkml.kernel.org/r/48340e96-7e6b-736f-9e23-d3111b915b6e@redhat.com
>
> This is similar to CONFIG_DEBUG_PAGEALLOC handling on other
> architectures, whereby only single pages are unmapped from the linear
> mapping. Let's mimic what memory hot(un)plug would do with the linear
> mapping.
>
> We now need MEMORY_HOTPLUG and CONTIG_ALLOC as dependencies.
>
> Simple test under QEMU TCG (10GB RAM, single NUMA node):
>
> sh-5.0# mount -t debugfs none /sys/kernel/debug/
> sh-5.0# cat /sys/devices/system/memory/block_size_bytes
> 40000000
> sh-5.0# echo 0x40000000 > /sys/kernel/debug/powerpc/memtrace/enable
> [   71.052836][  T356] memtrace: Allocated trace memory on node 0 at 0x0000000080000000
> sh-5.0# echo 0x80000000 > /sys/kernel/debug/powerpc/memtrace/enable
> [   75.424302][  T356] radix-mmu: Mapped 0x0000000080000000-0x00000000c0000000 with 64.0 KiB pages
> [   75.430549][  T356] memtrace: Freed trace memory back on node 0
> [   75.604520][  T356] memtrace: Allocated trace memory on node 0 at 0x0000000080000000
> sh-5.0# echo 0x100000000 > /sys/kernel/debug/powerpc/memtrace/enable
> [   80.418835][  T356] radix-mmu: Mapped 0x0000000080000000-0x0000000100000000 with 64.0 KiB pages
> [   80.430493][  T356] memtrace: Freed trace memory back on node 0
> [   80.433882][  T356] memtrace: Failed to allocate trace memory on node 0
> sh-5.0# echo 0x40000000 > /sys/kernel/debug/powerpc/memtrace/enable
> [   91.920158][  T356] memtrace: Allocated trace memory on node 0 at 0x0000000080000000

I gave this a quick spin on a real machine, seems to work OK.

I don't have the actual memtrace tools setup to do an actual trace, will
try and get someone to test that also.

One observation is that previously the memory was zeroed when enabling
the memtrace, whereas now it's not.

eg, before:

  # hexdump -C /sys/kernel/debug/powerpc/memtrace/00000000/trace 
  00000000  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
  *
  10000000

whereas after:

  # hexdump -C /sys/kernel/debug/powerpc/memtrace/00000000/trace
  00000000  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
  *
  00000080  e0 fd 43 00 00 00 00 00  e0 fd 43 00 00 00 00 00  |..C.......C.....|
  00000090  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
  *
  00000830  98 bf 39 00 00 00 00 00  98 bf 39 00 00 00 00 00  |..9.......9.....|
  00000840  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
  *
  000008a0  b0 c8 47 00 00 00 00 00  b0 c8 47 00 00 00 00 00  |..G.......G.....|
  000008b0  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
  ...
  0fffff70  78 53 49 7d 00 00 29 2e  88 00 92 41 01 00 49 39  |xSI}..)....A..I9|
  0fffff80  b4 07 4a 7d 28 f8 00 7d  00 48 08 7c 0c 00 c2 40  |..J}(..}.H.|...@|
  0fffff90  2d f9 40 7d f0 ff c2 40  b4 07 0a 7d 00 48 8a 7f  |-.@}...@...}.H..|
  0fffffa0  70 fe 9e 41 cc ff ff 4b  00 00 00 60 00 00 00 60  |p..A...K...`...`|
  0fffffb0  01 00 00 48 00 00 00 60  00 00 a3 2f 0c fd 9e 40  |...H...`.../...@|
  0fffffc0  00 00 a2 3c 00 00 a5 e8  00 00 62 3c 00 00 63 e8  |...<......b<..c.|
  0fffffd0  01 00 20 39 83 02 80 38  00 00 3c 99 01 00 00 48  |.. 9...8..<....H|
  0fffffe0  00 00 00 60 e4 fc ff 4b  00 00 80 38 78 fb e3 7f  |...`...K...8x...|
  0ffffff0  01 00 00 48 00 00 00 60  2c fe ff 4b 00 00 00 60  |...H...`,..K...`|
  10000000


That's a nice way for root to read kernel memory, so we should probably
add a __GFP_ZERO or memset in there somewhere.

cheers
