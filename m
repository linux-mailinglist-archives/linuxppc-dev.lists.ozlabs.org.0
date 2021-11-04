Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9530444E8D
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Nov 2021 06:55:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HlCYD3Vh1z2ywf
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Nov 2021 16:55:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=V423I4Gi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HlCXZ5srtz2xt5
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Nov 2021 16:55:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=V423I4Gi; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HlCXZ0pSZz4xd4;
 Thu,  4 Nov 2021 16:55:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1636005310;
 bh=wMqJrgnonfWvo7biaNiSDQLOEo+k1KW9ztBsmOM5h4Q=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=V423I4GiTYJ/27XLpVXCiPAvzZODDiRXTaQWnkE6bnjpBCqgYNyl7rDvQCYl83bq7
 FFFg9JwEqIbB7L6Jqdm4OEX84AK0jaaGrNBKlLuC+5gP9hE2bL08SGUocwsMNE+wjl
 3TKyExziekhl1bhLt9VlgGyxPLgI4pV+j62/e8NG4ToCO8VMPXHBytdo8TCP22Cb5f
 BUqH7gUciQAvliV4Qs6Z1wK858MMlgKi8Bc9X6WApSBj+5LsnHvWAzaUKkaUYGFzxK
 pQXJpI2zL/iaJuicf6GVRVfr6MhW3WeYDeK72UXSYWbdGtyqfWCBip7CtZUYqu2SNJ
 TgfV7kLvehMCQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nathan Lynch <nathanl@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [V3] powerpc/perf: Enable PMU counters post partition migration
 if PMU is active
In-Reply-To: <8735odx7us.fsf@linux.ibm.com>
References: <20211029030510.58797-1-atrajeev@linux.vnet.ibm.com>
 <1635487923.hwdpof7s4v.astroid@bobo.none>
 <87sfwk7z0m.fsf@mpe.ellerman.id.au>
 <1635852231.aebe6lt6u4.astroid@bobo.none> <8735odx7us.fsf@linux.ibm.com>
Date: Thu, 04 Nov 2021 16:55:07 +1100
Message-ID: <877ddo8nyc.fsf@mpe.ellerman.id.au>
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
Cc: kjain@linux.ibm.com, Athira Rajeev <atrajeev@linux.vnet.ibm.com>,
 maddy@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org,
 rnsastry@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nathan Lynch <nathanl@linux.ibm.com> writes:
> Nicholas Piggin <npiggin@gmail.com> writes:
>> Excerpts from Michael Ellerman's message of October 29, 2021 11:15 pm:
>>> Nicholas Piggin <npiggin@gmail.com> writes:
>>>> Excerpts from Athira Rajeev's message of October 29, 2021 1:05 pm:
>>>>> @@ -631,12 +632,18 @@ static int pseries_migrate_partition(u64 handle)
>>>>>  	if (ret)
>>>>>  		return ret;
>>>>>  
>>>>> +	/* Disable PMU before suspend */
>>>>> +	on_each_cpu(&mobility_pmu_disable, NULL, 0);
>>>>
>>>> Why was this moved out of stop machine and to an IPI?
>>>>
>>>> My concern would be, what are the other CPUs doing at this time? Is it 
>>>> possible they could take interrupts and schedule? Could that mess up the
>>>> perf state here?
>>> 
>>> pseries_migrate_partition() is called directly from migration_store(),
>>> which is the sysfs store function, which can be called concurrently by
>>> different CPUs.
>>> 
>>> It's also potentially called from rtas_syscall_dispatch_ibm_suspend_me(),
>>> from sys_rtas(), again with no locking.
>>> 
>>> So we could have two CPUs calling into here at the same time, which
>>> might not crash, but is unlikely to work well.
>>> 
>>> I think the lack of locking might have been OK in the past because only
>>> one CPU will successfully get the other CPUs to call do_join() in
>>> pseries_suspend(). But I could be wrong.
>>> 
>>> Anyway, now that we're mutating the PMU state before suspending we need
>>> to be more careful. So I think we need a lock around the whole
>>> sequence.
>
> Regardless of the outcome here, generally agreed that some serialization
> should be imposed in this path. The way the platform works (and some
> extra measures by the drmgr utility) make it so that this code isn't
> entered concurrently in usual operation, but it's possible to make it
> happen if you are root.

Yeah I agree it's unlikely to be a problem in practice.

> A file-static mutex should be OK.

Ack.

>> My concern is still that we wouldn't necessarily have the other CPUs 
>> under control at that point even if we serialize the migrate path.
>> They could take interrupts, possibly call into perf subsystem after
>> the mobility_pmu_disable (e.g., via syscall or context switch) which 
>> might mess things up.
>>
>> I think the stop machine is a reasonable place for the code in this 
>> case. It's a low level disabling of hardware facility and saving off 
>> registers.
>
> That makes sense, but I can't help feeling concerned still. For this to
> be safe, power_pmu_enable() and power_pmu_disable() must never sleep or
> re-enable interrupts or send IPIs. I don't see anything obviously unsafe
> right now, but is that already part of their contract? Is there much
> risk they could change in the future to violate those constraints?
>
> That aside, the proposed change seems like we would be hacking around a
> more generic perf/pmu limitation in a powerpc-specific way. I see the
> same behavior on x86 across suspend/resume.
>
> # perf stat -a -e cache-misses -I 1000 & sleep 2 ; systemctl suspend ; sleep 20 ; kill $(jobs -p)
> [1] 189806
> #           time             counts unit events
>      1.000501710          9,983,649      cache-misses
>      2.002620321         14,131,072      cache-misses
>      3.004579071         23,010,971      cache-misses
>      9.971854783 140,737,491,680,853      cache-misses
>     10.982669250                  0      cache-misses
>     11.984660498                  0      cache-misses
>     12.986648392                  0      cache-misses
>     13.988561766                  0      cache-misses
>     14.992670615                  0      cache-misses
>     15.994938111                  0      cache-misses
>     16.996703952                  0      cache-misses
>     17.999092812                  0      cache-misses
>     19.000602677                  0      cache-misses
>     20.003272216                  0      cache-misses
>     21.004770295                  0      cache-misses
> # uname -r
> 5.13.19-100.fc33.x86_64

That is interesting.

Athira, I guess we should bring that to the perf maintainers and see if
there's any interest in solving the issue in a generic fashion.

cheers
