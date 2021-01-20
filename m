Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1C12FCF4B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jan 2021 13:12:29 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DLPXn2s8YzDqLY
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jan 2021 23:12:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DLPQS1MJRzDqw6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Jan 2021 23:06:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=jQFo/gj6; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4DLPQQ0n70z9sSs;
 Wed, 20 Jan 2021 23:06:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1611144414;
 bh=M3WNiiwxpLFtpFpfYTA7Ofyzxi6gDaK7oY76vbYaarU=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=jQFo/gj6RxQIgtCYoBHzADhLKAT2E0Y0zH2+tZVmGDXCZ1iP9LU6nul9O/WuLc5e/
 aVXnJEh/crRfDHvyVrlz51VQhG5dvNwoGjIGema6Uaf2g5OTOB3N3pQu8rsSEBDUgt
 nyVFwVFuXwpNeWJmaxLTdrhu0x/Bn4DTl4fC/RTwYyynyMk/d2A9m1/Esqri3wgqLh
 Rw3+qIJb2eI+S49IStP7tM5ZXfTWp3kUxLW9TtC0tiLogCIijtwGCXafO/9cPIcr0P
 Ptda0tp2VY26CcUbwbq4Dbr7fxslMJV2si3SBwuyjTiraxgBo0p6eXlVd5L+c4kb8Z
 rhFd1uPCZzlFw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nathan Lynch <nathanl@linux.ibm.com>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 6/6] powerpc/rtas: constrain user region allocation to RMA
In-Reply-To: <871regxwzh.fsf@linux.ibm.com>
References: <20210114220004.1138993-1-nathanl@linux.ibm.com>
 <20210114220004.1138993-7-nathanl@linux.ibm.com>
 <5276937f-b72a-89ba-d0d8-19e4be55ae35@ozlabs.ru>
 <87czy6xlap.fsf@linux.ibm.com>
 <3c5141d5-ee78-3771-3410-37635d423945@ozlabs.ru>
 <871regxwzh.fsf@linux.ibm.com>
Date: Wed, 20 Jan 2021 23:06:49 +1100
Message-ID: <87ft2vrew6.fsf@mpe.ellerman.id.au>
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
Cc: tyreld@linux.ibm.com, brking@linux.ibm.com, ajd@linux.ibm.com,
 aneesh.kumar@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nathan Lynch <nathanl@linux.ibm.com> writes:
> Alexey Kardashevskiy <aik@ozlabs.ru> writes:
>> On 16/01/2021 02:38, Nathan Lynch wrote:
>>> Alexey Kardashevskiy <aik@ozlabs.ru> writes:
>>>> On 15/01/2021 09:00, Nathan Lynch wrote:
>>>>> Memory locations passed as arguments from the OS to RTAS usually need
>>>>> to be addressable in 32-bit mode and must reside in the Real Mode
>>>>> Area. On PAPR guests, the RMA starts at logical address 0 and is the
>>>>> first logical memory block reported in the LPAR=E2=80=99s device tree.
>>>>>
>>>>> On powerpc targets with RTAS, Linux makes available to user space a
>>>>> region of memory suitable for arguments to be passed to RTAS via
>>>>> sys_rtas(). This region (rtas_rmo_buf) is allocated via the memblock
>>>>> API during boot in order to ensure that it satisfies the requirements
>>>>> described above.
>>>>>
>>>>> With radix MMU, the upper limit supplied to the memblock allocation
>>>>> can exceed the bounds of the first logical memory block, since
>>>>> ppc64_rma_size is ULONG_MAX and RTAS_INSTANTIATE_MAX is 1GB. (512MB is
>>>>> a common size of the first memory block according to a small sample of
>>>>> LPARs I have checked.) This leads to failures when user space invokes
>>>>> an RTAS function that uses a work area, such as
>>>>> ibm,configure-connector.
>>>>>
>>>>> Alter the determination of the upper limit for rtas_rmo_buf's
>>>>> allocation to consult the device tree directly, ensuring placement
>>>>> within the RMA regardless of the MMU in use.
>>>>
>>>> Can we tie this with RTAS (which also needs to be in RMA) and simply a=
dd
>>>> extra 64K in prom_instantiate_rtas() and advertise this address
>>>> (ALIGH_UP(rtas-base + rtas-size, PAGE_SIZE)) to the user space? We do
>>>> not need this RMO area before that point.
>>>=20
>>> Can you explain more about what advantage that would bring? I'm not
>>> seeing it. It's a more significant change than what I've written
>>> here.
>>
>>
>> We already allocate space for RTAS and (like RMO) it needs to be in RMA,=
=20
>> and RMO is useless without RTAS. We can reuse RTAS allocation code for=20
>> RMO like this:
>
> When you say RMO I assume you are referring to rtas_rmo_buf? (I don't
> think it is well-named.)
...

RMO (Real mode offset) is the old term we used to use to refer to what
is now called the RMA (Real mode area). There are still many references
to RMO in Linux, but they almost certainly all refer to what we now call
the RMA.

>> May be store in the FDT as "linux,rmo-base" next to "linux,rtas-base",=20
>> for clarity, as sharing symbols between prom and main kernel is a bit=20
>> tricky.
>>
>> The benefit is that we do not do the same thing   (=3D=3D find 64K in RM=
A)=20
>> in 2 different ways and if the RMO allocated my way is broken - we'll=20
>> know it much sooner as RTAS itself will break too.
>
> Implementation details aside... I'll grant that combining the
> allocations into one in prom_init reduces some duplication in the sense
> that both are subject to the same constraints (mostly - the RTAS data
> area must not cross a 256MB boundary, while the user region may). But
> they really are distinct concerns. The RTAS private data area is
> specified in the platform architecture, the OS is obligated to allocate
> it and pass it to instantiate-rtas, etc etc. However the user region
> (rtas_rmo_buf) is purely a Linux construct which is there to support
> sys_rtas.
>
> Now, there are multiple sites in the kernel proper that must allocate
> memory suitable for passing to RTAS. Obviously there is value in
> consolidating the logic for that purpose in one place, so I'll work on
> adding that in v2. OK?

I don't think we want to move any allocations into prom_init.c unless we
have to.

It's best thought of as a trampoline, that runs before the kernel
proper, to transition from live OF to a flat DT environment. One thing
that must be done as part of that is instantiating RTAS, because it's
basically a runtime copy of the live OF. But any other allocs are for
Linux to handle later, IMHO.

cheers
