Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E8D4894C81
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Apr 2024 09:18:09 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=FCQ96Mvi;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V7zk72FGTz3dDn
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Apr 2024 18:18:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=FCQ96Mvi;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V7zjP48G5z2xPW
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Apr 2024 18:17:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1712042248;
	bh=WF57//6GAU79VOoAgbbUdhQ7ZMZXKTYjHubSipyOrsI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=FCQ96Mvi/1dPUDRpwub0GM+x1iWmWSCXLRbTLMTnzpf1S2us251hw/CtN48k95K+f
	 8zy0ADMt02Z4gFejpCmJrCBC/eDucd2RNYKvsZTCYDkG5Ynhw1Dn/K2gldxgWVelSY
	 53EaSwiAOfsPLm3tP+E0p9dCWADz0blySV91g1ItTXvV1oGm2HCX5YZbrolSZ1+uQP
	 BUnyszQ/3KBJcs3PfIzNyWhWEuYHgANPWKa6Jemb7H741adEB72faPXDcrQKqx/3Vn
	 9OM1NjO74KWFZCRu6wRtxSo8n50O2NRzt4oxkaTmW3XL2ZREvWjUTk7cDOFWwXMkhJ
	 Ydf45B1WMkLmw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4V7zjN3vT2z4wcn;
	Tue,  2 Apr 2024 18:17:26 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, paulmck
 <paulmck@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Christophe
 Leroy <christophe.leroy@csgroup.eu>, "Aneesh Kumar K.V"
 <aneesh.kumar@kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
Subject: Re: Appropriate liburcu cache line size for Power
In-Reply-To: <f16552ba-f8f8-4023-a8ab-1c746a254f3c@efficios.com>
References: <19c3ea76-9e05-4552-8b93-6c42df105747@efficios.com>
 <87ttktiho5.fsf@mail.lhotse>
 <f16552ba-f8f8-4023-a8ab-1c746a254f3c@efficios.com>
Date: Tue, 02 Apr 2024 18:17:25 +1100
Message-ID: <87a5mc8c8q.fsf@mail.lhotse>
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Mathieu Desnoyers <mathieu.desnoyers@efficios.com> writes:
> On 2024-03-26 03:19, Michael Ellerman wrote:
>> Mathieu Desnoyers <mathieu.desnoyers@efficios.com> writes:
>>> In the powerpc architecture support within the liburcu project [1]
>>> we have a cache line size defined as 256 bytes with the following
>>> comment:
>>>
>>> /* Include size of POWER5+ L3 cache lines: 256 bytes */
>>> #define CAA_CACHE_LINE_SIZE     256
>>>
>>> I recently received a pull request on github [2] asking to
>>> change this to 128 bytes. All the material provided supports
>>> that the cache line sizes on powerpc are 128 bytes or less (even
>>> L3 on POWER7, POWER8, and POWER9) [3].
>>>
>>> I wonder where the 256 bytes L3 cache line size for POWER5+
>>> we have in liburcu comes from, and I wonder if it's the right choice
>>> for a cache line size on all powerpc, considering that the Linux
>>> kernel cache line size appear to use 128 bytes on recent Power
>>> architectures. I recall some benchmark experiments Paul and I did
>>> on a 64-core 1.9GHz POWER5+ machine that benefited from a 256 bytes
>>> cache line size, and I suppose this is why we came up with this
>>> value, but I don't have the detailed specs of that machine.
>>>
>>> Any feedback on this matter would be appreciated.
>> 
>> The ISA doesn't specify the cache line size, other than it is smaller
>> than a page.
>> 
>> In practice all the 64-bit IBM server CPUs I'm aware of have used 128
>> bytes. There are some 64-bit CPUs that use 64 bytes, eg. pasemi PA6T and
>> Freescale e6500.
>> 
>> It is possible to discover at runtime via AUXV headers. But that's no
>> use if you want a compile-time constant.
>
> Indeed, and this CAA_CACHE_LINE_SIZE is part of the liburcu powerpc ABI,
> so changing this would require a soname bump, which I don't want to do
> without really good reasons.
>
>> 
>> I'm happy to run some benchmarks if you can point me at what to run. I
>> had a poke around the repository and found short_bench, but it seemed to
>> run for a very long time.
>
> I've created a dedicated test program for this, see:
>
> https://github.com/compudj/userspace-rcu-dev/tree/false-sharing

Perfect :)

> The test programs runs 4 threads by default, which can be overridden
> with "-t N". This may be needed if you want this to use all cores from
> a larger machine. See "-h" for options.
>
> On a POWER9 (architected), altivec supported:
>
> for a in 8 16 32 64 128 256 512; do tests/unit/test_false_sharing -s $a; done
> ok 1 - Stride 8 bytes, increments per ms per thread: 12264
> 1..1
> ok 1 - Stride 16 bytes, increments per ms per thread: 12276
> 1..1
> ok 1 - Stride 32 bytes, increments per ms per thread: 25638
> 1..1
> ok 1 - Stride 64 bytes, increments per ms per thread: 39934
> 1..1
> ok 1 - Stride 128 bytes, increments per ms per thread: 53971
> 1..1
> ok 1 - Stride 256 bytes, increments per ms per thread: 53599
> 1..1
> ok 1 - Stride 512 bytes, increments per ms per thread: 53962
> 1..1
>
> This points at false-sharing below 128 bytes stride.
>
> On a e6500, altivec supported, Model 2.0 (pvr 8040 0120)
>
> for a in 8 16 32 64 128 256 512; do tests/unit/test_false_sharing -s $a; done
> ok 1 - Stride 8 bytes, increments per ms per thread: 9049
> 1..1
> ok 1 - Stride 16 bytes, increments per ms per thread: 9054
> 1..1
> ok 1 - Stride 32 bytes, increments per ms per thread: 18643
> 1..1
> ok 1 - Stride 64 bytes, increments per ms per thread: 37417
> 1..1
> ok 1 - Stride 128 bytes, increments per ms per thread: 37906
> 1..1
> ok 1 - Stride 256 bytes, increments per ms per thread: 37870
> 1..1
> ok 1 - Stride 512 bytes, increments per ms per thread: 37899
> 1..1
>
> Which points at false-sharing below 64 bytes.
>
> I prefer to be cautious about this cache line size value and aim for
> a value which takes into account the largest known cache line size
> for an architecture rather than use a too small due to the large
> overhead caused by false-sharing.
>
> Feedback is welcome.

My results are largely similar to yours.

Power9 bare metal (pvr 004e 1202), with 96 threads on 2 nodes:

  NUMA:
    NUMA node(s):           2
    NUMA node0 CPU(s):      0-47
    NUMA node8 CPU(s):      48-95
  
  for a in 8 16 32 64 128 256 512; do tests/unit/test_false_sharing -t 96 -s $a; done
  ok 1 - Stride 8 bytes, increments per ms per thread: 2569
  ok 1 - Stride 16 bytes, increments per ms per thread: 4036
  ok 1 - Stride 32 bytes, increments per ms per thread: 7226
  ok 1 - Stride 64 bytes, increments per ms per thread: 15385
  ok 1 - Stride 128 bytes, increments per ms per thread: 38025          <---
  ok 1 - Stride 256 bytes, increments per ms per thread: 37454
  ok 1 - Stride 512 bytes, increments per ms per thread: 37310

On the same machine if I offline all but one core, so running across 4
threads of a single core:

  for a in 8 16 32 64 128 256 512; do tests/unit/test_false_sharing -t 4 -s $a; done
  ok 1 - Stride 8 bytes, increments per ms per thread: 14542
  ok 1 - Stride 16 bytes, increments per ms per thread: 12984
  ok 1 - Stride 32 bytes, increments per ms per thread: 22147
  ok 1 - Stride 64 bytes, increments per ms per thread: 31378
  ok 1 - Stride 128 bytes, increments per ms per thread: 42358          <---
  ok 1 - Stride 256 bytes, increments per ms per thread: 41906
  ok 1 - Stride 512 bytes, increments per ms per thread: 42060

On a Power10 (pvr 0080 0200), 8 threads (1 big core):

  for a in 8 16 32 64 128 256 512; do tests/unit/test_false_sharing -t 8 -s $a; done
  ok 1 - Stride 8 bytes, increments per ms per thread: 9235
  ok 1 - Stride 16 bytes, increments per ms per thread: 18748
  ok 1 - Stride 32 bytes, increments per ms per thread: 28870
  ok 1 - Stride 64 bytes, increments per ms per thread: 46794
  ok 1 - Stride 128 bytes, increments per ms per thread: 67571          <---
  ok 1 - Stride 256 bytes, increments per ms per thread: 67571
  ok 1 - Stride 512 bytes, increments per ms per thread: 67570

I tried various other combinations, but in all cases the increments
plateau at 128 bytes and above.

cheers
