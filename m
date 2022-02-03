Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 953174A82EB
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Feb 2022 12:07:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JqG9S2KJzz3bY0
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Feb 2022 22:07:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=HQkEu0Di;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2404:9400:2221:ea00::3;
 helo=gandalf.ozlabs.org; envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=HQkEu0Di; 
 dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JqG8n16Tcz3089
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Feb 2022 22:07:20 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
 id 4JqG8h3XCWz4xmk; Thu,  3 Feb 2022 22:07:16 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4JqG8g5zw3z4xmj;
 Thu,  3 Feb 2022 22:07:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1643886436;
 bh=f6BJkMBAob59C9yelDm4y2O00BOKGmB9Rn4J9Z0tVl8=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=HQkEu0DiS6li5Bux2F5Pdd7nJiPfthVWvru/fU8KAd1I7k4v/BtZIJzGyGfaQcNM4
 YvEzmi2wMbOWDd7s7zvZNrpaUqanjwHr4HscET5Aw42NliAkPM/UG9QfMJBSCaaoYD
 LnsYFe8Sk0aVYieD7bUOtgaFbrkrdt/0c0e9rUE8s+MCqRMy/1isE/xbEuV84OSZrq
 NeOsWP81cMe8BlFQPa4AOMCK+MGeniOL5Zieit9KIp0DDKW8vqQeQF6SGG9sCH9qoo
 TNg9y+LTuml3mJ8F2CBcbXM99hlLOFybCWBdrnNsR70M0MgWrvddbUSV4y/FjVUXtH
 zd6yAlkp9eFjQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Sourabh Jain <sourabhjain@linux.ibm.com>, linuxppc-dev@ozlabs.org
Subject: Re: powerpc: Set crashkernel offset to mid of RMA region
In-Reply-To: <1c61a544-7ec9-5e5a-4b76-4725675cde7a@linux.ibm.com>
References: <20220128100445.251233-1-sourabhjain@linux.ibm.com>
 <87r18mn74r.fsf@mpe.ellerman.id.au>
 <1c61a544-7ec9-5e5a-4b76-4725675cde7a@linux.ibm.com>
Date: Thu, 03 Feb 2022 22:07:11 +1100
Message-ID: <87czk4mco0.fsf@mpe.ellerman.id.au>
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
Cc: mahesh@linux.vnet.ibm.com, hbathini@linux.ibm.com,
 Abdul haleem <abdhalee@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Sourabh Jain <sourabhjain@linux.ibm.com> writes:
> On 01/02/22 17:14, Michael Ellerman wrote:
>> Sourabh Jain <sourabhjain@linux.ibm.com> writes:
>>> On large config LPARs (having 192 and more cores), Linux fails to boot
>>> due to insufficient memory in the first memblock. It is due to the
>>> memory reservation for the crash kernel which starts at 128MB offset of
>>> the first memblock. This memory reservation for the crash kernel doesn't
>>> leave enough space in the first memblock to accommodate other essential
>>> system resources.
>>>
>>> The crash kernel start address was set to 128MB offset by default to
>>> ensure that the crash kernel get some memory below the RMA region which
>>> is used to be of size 256MB. But given that the RMA region size can be
>>> 512MB or more, setting the crash kernel offset to mid of RMA size will
>>> leave enough space for kernel to allocate memory for other system
>>> resources.
>>>
>>> Since the above crash kernel offset change is only applicable to the LP=
AR
>>> platform, the LPAR feature detection is pushed before the crash kernel
>>> reservation. The rest of LPAR specific initialization will still
>>> be done during pseries_probe_fw_features as usual.
>>>
>>> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
>>> Reported-and-tested-by: Abdul haleem <abdhalee@linux.vnet.ibm.com>
>>>
>>> ---
>>>   arch/powerpc/kernel/rtas.c |  4 ++++
>>>   arch/powerpc/kexec/core.c  | 15 +++++++++++----
>>>   2 files changed, 15 insertions(+), 4 deletions(-)
>>>
>>>   ---
>>>   Change in v3:
>>> 	Dropped 1st and 2nd patch from v2. 1st and 2nd patch from v2 patch
>>> 	series [1] try to discover 1T segment MMU feature support
>>> 	BEFORE boot CPU paca allocation ([1] describes why it is needed).
>>> 	MPE has posted a patch [2] that archives a similar objective by moving
>>> 	boot CPU paca allocation after mmu_early_init_devtree().
>>>
>>> NOTE: This patch is dependent on the patch [2].
>>>
>>> [1] https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20211018084=
434.217772-3-sourabhjain@linux.ibm.com/
>>> [2] https://lists.ozlabs.org/pipermail/linuxppc-dev/2022-January/239175=
.html
>>>   ---
>>>
>>> diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
>>> index 733e6ef36758..06df7464fb57 100644
>>> --- a/arch/powerpc/kernel/rtas.c
>>> +++ b/arch/powerpc/kernel/rtas.c
>>> @@ -1313,6 +1313,10 @@ int __init early_init_dt_scan_rtas(unsigned long=
 node,
>>>   	entryp =3D of_get_flat_dt_prop(node, "linux,rtas-entry", NULL);
>>>   	sizep  =3D of_get_flat_dt_prop(node, "rtas-size", NULL);
>>>=20=20=20
>>> +	/* need this feature to decide the crashkernel offset */
>>> +	if (of_get_flat_dt_prop(node, "ibm,hypertas-functions", NULL))
>>> +		powerpc_firmware_features |=3D FW_FEATURE_LPAR;
>>> +
>> As you'd have seen this breaks the 32-bit build. It will need an #ifdef
>> CONFIG_PPC64 around it.
>>
>>>   	if (basep && entryp && sizep) {
>>>   		rtas.base =3D *basep;
>>>   		rtas.entry =3D *entryp;
>>> diff --git a/arch/powerpc/kexec/core.c b/arch/powerpc/kexec/core.c
>>> index 8b68d9f91a03..abf5897ae88c 100644
>>> --- a/arch/powerpc/kexec/core.c
>>> +++ b/arch/powerpc/kexec/core.c
>>> @@ -134,11 +134,18 @@ void __init reserve_crashkernel(void)
>>>   	if (!crashk_res.start) {
>>>   #ifdef CONFIG_PPC64
>>>   		/*
>>> -		 * On 64bit we split the RMO in half but cap it at half of
>>> -		 * a small SLB (128MB) since the crash kernel needs to place
>>> -		 * itself and some stacks to be in the first segment.
>>> +		 * On the LPAR platform place the crash kernel to mid of
>>> +		 * RMA size (512MB or more) to ensure the crash kernel
>>> +		 * gets enough space to place itself and some stack to be
>>> +		 * in the first segment. At the same time normal kernel
>>> +		 * also get enough space to allocate memory for essential
>>> +		 * system resource in the first segment. Keep the crash
>>> +		 * kernel starts at 128MB offset on other platforms.
>>>   		 */
>>> -		crashk_res.start =3D min(0x8000000ULL, (ppc64_rma_size / 2));
>>> +		if (firmware_has_feature(FW_FEATURE_LPAR))
>>> +			crashk_res.start =3D ppc64_rma_size / 2;
>>> +		else
>>> +			crashk_res.start =3D min(0x8000000ULL, (ppc64_rma_size / 2));
>> I think this will break on machines using Radix won't it? At this point
>> in boot ppc64_rma_size will be =3D=3D 0. Because we won't call into
>> hash__setup_initial_memory_limit().
>>
>> That's not changed by your patch, but seems like this code needs to be
>> more careful/clever.
>
> Interesting, but in my testing, I found that ppc64_rma_size
> did get initialized before reserve_crashkernel() using radix on LPAR.
>
> I am not sure why but hash__setup_initial_memory_limit() function is=20
> gets called
> regardless of radix or hash. Not sure whether it is by design but here=20
> is the flow:

It sort of is by design. See:

  103a8542cb35 ("powerpc/book3s64/radix: Fix boot failure with large amount=
 of guest memory")

Basically the hash restrictions are more strict, so we apply them until
we know we will use radix.

But ...

> setup_initial_memory_limit()
>
>  =C2=A0=C2=A0=C2=A0=C2=A0 static inline void setup_initial_memory_limit()=
=20
> (arch/powerpc/include/asm/book3s/64/mmu.h)
>
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!=
early_radix_enabled())=C2=A0 // FALSE regardless of radix is enabled or not

You mean early_radix_enabled() is False regardless. But that's not true
in all cases.

We can now build the kernel without hash MMU support at all, see:

  387e220a2e5e ("powerpc/64s: Move hash MMU support code under CONFIG_PPC_6=
4S_HASH_MMU")

In which case early_radix_enabled() will be true here, because it's hard
coded to be true at build time.

>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 =C2=
=A0=C2=A0 hash__setup_initial_memory_limit() // initialize ppc64_rma_size
>
>  =C2=A0=C2=A0=C2=A0=C2=A0 reserve_crashkernel()=C2=A0 // initialize crash=
kernel offset to mid of RMA size.
>
>
> For the sack of understanding even if we restrict crashkernel offset=20
> setting to mid RMA (i.e. ppc64_rma_size/2) for
> only hash it may not save radix because even today we are assigning=20
> crashkernel offset using
> ppc64_rma_size variable.

Yes. There's already a bug there, your patch doesn't make it better or wors=
e.

> Is the current flow of initializing ppc64_rma_size variable before=20
> reserve_crashkernel() for radix expected?
>
> Please provide your input.

I wonder if we're better off moving the crash kernel reservation later,
once we've discovered what MMU we're using.

I can't immediately see why that would be a problem, as long as we do
the reservation before we do any (many?) allocations. I'll have to think
about it a bit more though, these boot ordering things are always
subtle.

For now I think this patch is OK if you send a v2 to fix the compile
error.

cheers
