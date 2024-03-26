Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F47688C54D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Mar 2024 15:38:31 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=smtpout1 header.b=RFyqN80Z;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V3sqT2Gdbz3vYR
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Mar 2024 01:38:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=smtpout1 header.b=RFyqN80Z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=efficios.com (client-ip=2607:5300:203:b2ee::31e5; helo=smtpout.efficios.com; envelope-from=mathieu.desnoyers@efficios.com; receiver=lists.ozlabs.org)
Received: from smtpout.efficios.com (smtpout.efficios.com [IPv6:2607:5300:203:b2ee::31e5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V3spf3T9Pz3dgN
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Mar 2024 01:37:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=efficios.com;
	s=smtpout1; t=1711463851;
	bh=sVJb/govXzFyXeoV9uKcwKDOk67Bi/863D3Vm+eL/Mc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RFyqN80ZfY5LXml6JNKucqKjcvpjJPj4RfM35tJ5wnACUXbgVsl5w4VtkUG6He5iQ
	 A8CArM6sDdO1o/eRYe3GIshg62getkjiggXkLBBkfV5GFbYwyKsOxH3Z/9HAGO+Rch
	 aequROW0VT8xS5ibKkq9xb9gCLOSnMsryQOFYy4U4FWIS5eEnNLHavbFvNbim7I8z9
	 1gETP5kQmUH4+XXdW3IQHb/hMKNg3U1WjrXMuXiDzd4NIaF8MfSmHRUBF9EvoTDPao
	 2fWdYVvfYVaUiZLIChIrTmE1ARHx9Sffsufvel5+s9y5gH9d6tYrq52xMfh5M6hYqY
	 FiHiG8wCN2uQw==
Received: from [172.16.0.134] (192-222-143-198.qc.cable.ebox.net [192.222.143.198])
	by smtpout.efficios.com (Postfix) with ESMTPSA id 4V3spM51dFznQK;
	Tue, 26 Mar 2024 10:37:31 -0400 (EDT)
Message-ID: <f16552ba-f8f8-4023-a8ab-1c746a254f3c@efficios.com>
Date: Tue, 26 Mar 2024 10:37:57 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Appropriate liburcu cache line size for Power
Content-Language: en-US
To: Michael Ellerman <mpe@ellerman.id.au>, paulmck <paulmck@kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
References: <19c3ea76-9e05-4552-8b93-6c42df105747@efficios.com>
 <87ttktiho5.fsf@mail.lhotse>
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
In-Reply-To: <87ttktiho5.fsf@mail.lhotse>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2024-03-26 03:19, Michael Ellerman wrote:
> Mathieu Desnoyers <mathieu.desnoyers@efficios.com> writes:
>> Hi,
> 
> Hi Mathieu,
> 
>> In the powerpc architecture support within the liburcu project [1]
>> we have a cache line size defined as 256 bytes with the following
>> comment:
>>
>> /* Include size of POWER5+ L3 cache lines: 256 bytes */
>> #define CAA_CACHE_LINE_SIZE     256
>>
>> I recently received a pull request on github [2] asking to
>> change this to 128 bytes. All the material provided supports
>> that the cache line sizes on powerpc are 128 bytes or less (even
>> L3 on POWER7, POWER8, and POWER9) [3].
>>
>> I wonder where the 256 bytes L3 cache line size for POWER5+
>> we have in liburcu comes from, and I wonder if it's the right choice
>> for a cache line size on all powerpc, considering that the Linux
>> kernel cache line size appear to use 128 bytes on recent Power
>> architectures. I recall some benchmark experiments Paul and I did
>> on a 64-core 1.9GHz POWER5+ machine that benefited from a 256 bytes
>> cache line size, and I suppose this is why we came up with this
>> value, but I don't have the detailed specs of that machine.
>>
>> Any feedback on this matter would be appreciated.
> 
> The ISA doesn't specify the cache line size, other than it is smaller
> than a page.
> 
> In practice all the 64-bit IBM server CPUs I'm aware of have used 128
> bytes. There are some 64-bit CPUs that use 64 bytes, eg. pasemi PA6T and
> Freescale e6500.
> 
> It is possible to discover at runtime via AUXV headers. But that's no
> use if you want a compile-time constant.

Indeed, and this CAA_CACHE_LINE_SIZE is part of the liburcu powerpc ABI,
so changing this would require a soname bump, which I don't want to do
without really good reasons.

> 
> I'm happy to run some benchmarks if you can point me at what to run. I
> had a poke around the repository and found short_bench, but it seemed to
> run for a very long time.

I've created a dedicated test program for this, see:

https://github.com/compudj/userspace-rcu-dev/tree/false-sharing

example use:

On a AMD Ryzen 7 PRO 6850U with Radeon Graphics:

for a in 8 16 32 64 128 256 512; do tests/unit/test_false_sharing -s $a; done
ok 1 - Stride 8 bytes, increments per ms per thread: 21320
1..1
ok 1 - Stride 16 bytes, increments per ms per thread: 22657
1..1
ok 1 - Stride 32 bytes, increments per ms per thread: 47599
1..1
ok 1 - Stride 64 bytes, increments per ms per thread: 531364
1..1
ok 1 - Stride 128 bytes, increments per ms per thread: 523634
1..1
ok 1 - Stride 256 bytes, increments per ms per thread: 519402
1..1
ok 1 - Stride 512 bytes, increments per ms per thread: 520651
1..1

Would point to false-sharing starting with cache lines smaller than
64 bytes. I get similar results (false-sharing under 64 bytes) with a
AMD EPYC 9654 96-Core Processor.

The test programs runs 4 threads by default, which can be overridden
with "-t N". This may be needed if you want this to use all cores from
a larger machine. See "-h" for options.

On a POWER9 (architected), altivec supported:

for a in 8 16 32 64 128 256 512; do tests/unit/test_false_sharing -s $a; done
ok 1 - Stride 8 bytes, increments per ms per thread: 12264
1..1
ok 1 - Stride 16 bytes, increments per ms per thread: 12276
1..1
ok 1 - Stride 32 bytes, increments per ms per thread: 25638
1..1
ok 1 - Stride 64 bytes, increments per ms per thread: 39934
1..1
ok 1 - Stride 128 bytes, increments per ms per thread: 53971
1..1
ok 1 - Stride 256 bytes, increments per ms per thread: 53599
1..1
ok 1 - Stride 512 bytes, increments per ms per thread: 53962
1..1

This points at false-sharing below 128 bytes stride.

On a e6500, altivec supported, Model 2.0 (pvr 8040 0120)

for a in 8 16 32 64 128 256 512; do tests/unit/test_false_sharing -s $a; done
ok 1 - Stride 8 bytes, increments per ms per thread: 9049
1..1
ok 1 - Stride 16 bytes, increments per ms per thread: 9054
1..1
ok 1 - Stride 32 bytes, increments per ms per thread: 18643
1..1
ok 1 - Stride 64 bytes, increments per ms per thread: 37417
1..1
ok 1 - Stride 128 bytes, increments per ms per thread: 37906
1..1
ok 1 - Stride 256 bytes, increments per ms per thread: 37870
1..1
ok 1 - Stride 512 bytes, increments per ms per thread: 37899
1..1

Which points at false-sharing below 64 bytes.

I prefer to be cautious about this cache line size value and aim for
a value which takes into account the largest known cache line size
for an architecture rather than use a too small due to the large
overhead caused by false-sharing.

Feedback is welcome.

Thanks,

Mathieu

-- 
Mathieu Desnoyers
EfficiOS Inc.
https://www.efficios.com

