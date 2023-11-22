Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C63EA7F3D1A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Nov 2023 06:06:29 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Ea4FzsOX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SZq374rY8z3dRb
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Nov 2023 16:06:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Ea4FzsOX;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (unknown [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SZq2K0LYjz2yD4
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Nov 2023 16:05:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1700629534;
	bh=jDSBfZj7B7+VITpr7wIswGw2H7lq86/8qc+86Sye4y4=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=Ea4FzsOXiO6i0vps/kg9uohUtjigkwuMg/NuUSZEeXKHAm8ASV6z5qTRuw4sU+K5p
	 TA8Ug7q06EqtvdSx4xTXkExNYmStDGWrH57uE0BAnkVOjKJ7xaqQ9HGcxW2dnIxJLe
	 9wxyFBQ3W/h3cj0nrgGvy4YF9IuYvHdQ4xMnQGvxNKcbkQnymt+brjSD06OTcipeKF
	 Yh1GCklyOfXeGHIfakngYa3+18iPLN9rX3ncGht3Xj+CYQ+x7V4/GtPB1waLqGai/+
	 /E7K7ywD5uSjyKVNA1ggWvTbVxQ21I1+tVZIajyDiRm/meUmZMJIXvR9nJ4LGzMuuO
	 4AmvXREzLfw0g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SZq266FrHz4xDB;
	Wed, 22 Nov 2023 16:05:34 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Vishal Chourasia <vishalc@linux.ibm.com>, Aneesh Kumar K V
 <aneesh.kumar@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc: Restrict ARCH_HIBERNATION_POSSIBLE to
 supported configurations
In-Reply-To: <9aaee6eb-a9a7-4945-8678-192868430b84@linux.ibm.com>
References: <20231114082046.6018-1-vishalc@linux.ibm.com>
 <87sf57zbcd.fsf@linux.ibm.com>
 <ecc9d34a-4960-4540-802e-d35ee4f5259b@linux.ibm.com>
 <c3594f58-c7a4-4265-a38e-c97b08169b61@linux.ibm.com>
 <b7600012-0e7e-4b25-8d8c-1bffcc9c1461@linux.ibm.com>
 <87jzqh706q.fsf@mail.lhotse>
 <9aaee6eb-a9a7-4945-8678-192868430b84@linux.ibm.com>
Date: Wed, 22 Nov 2023 16:05:34 +1100
Message-ID: <87il5ujs2p.fsf@mail.lhotse>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Vishal Chourasia <vishalc@linux.ibm.com> writes:
> On 17/11/23 4:52 am, Michael Ellerman wrote:
>> Vishal Chourasia <vishalc@linux.ibm.com> writes:
>>> On 15/11/23 5:46 pm, Aneesh Kumar K V wrote:
>>>> On 11/15/23 5:23 PM, Vishal Chourasia wrote:
>>>>> On 15/11/23 1:39 pm, Aneesh Kumar K.V wrote:
>>>>>> Vishal Chourasia <vishalc@linux.ibm.com> writes:
>>>>>>
>>>>>>> This patch modifies the ARCH_HIBERNATION_POSSIBLE option to ensure =
that it
>>>>>>> correctly depends on these PowerPC configurations being enabled. As=
 a result,
>>>>>>> it prevents the HOTPLUG_CPU from being selected when the required d=
ependencies
>>>>>>> are not satisfied.
>>>>>>>
>>>>>>> This change aligns the dependency tree with the expected hardware s=
upport for
>>>>>>> CPU hot-plugging under PowerPC architectures, ensuring that the ker=
nel
>>>>>>> configuration steps do not lead to inconsistent states.
>>>>>>>
>>>>>>> Signed-off-by: Vishal Chourasia <vishalc@linux.ibm.com>
>>>>>>> ---
>>>>>>> During the configuration process with 'make randconfig' followed by
>>>>>>> 'make olddefconfig', we observed a warning indicating an unmet dire=
ct
>>>>>>> dependency for the HOTPLUG_CPU option. The dependency in question r=
elates to
>>>>>>> various PowerPC configurations (PPC_PSERIES, PPC_PMAC, PPC_POWERNV,
>>>>>>> FSL_SOC_BOOKE) which were not enabled, yet the HOTPLUG_CPU was bein=
gDuring the configuration process with 'make randconfig' followed by
>>>>>>> 'make olddefconfig', we observed a warning indicating an unmet dire=
ct
>>>>>>> dependency for the HOTPLUG_CPU option. The dependency in question r=
elates to
>>>>>>> various PowerPC configurations (PPC_PSERIES, PPC_PMAC, PPC_POWERNV,
>>>>>>> FSL_SOC_BOOKE) which were not enabled, yet the HOTPLUG_CPU was being
>>>>>>> erroneously selected due to an implicit assumption by the PM_SLEEP_=
SMP option.
>>>>>>> This misalignment in dependencies could potentially lead to inconsi=
stent kernel
>>>>>>> configuration states, especially when considering the necessary har=
dware
>>>>>>> support for CPU hot-plugging on PowerPC platforms. The patch aims t=
o correct
>>>>>>> this by ensuring that ARCH_HIBERNATION_POSSIBLE is contingent upon =
the
>>>>>>> appropriate PowerPC configurations being active.
>>>>>>>
>>>>>>> steps to reproduce (before applying the patch):
>>>>>>>
>>>>>>> Run 'make pseries_le_defconfig'
>>>>>>> Run 'make menuconfig'
>>>>>>> Enable hibernation [ Kernel options -> Hibernation (aka 'suspend to=
 disk') ]=20
>>>>>>> Disable [ Platform support -> IBM PowerNV (Non-Virtualized) platfor=
m support ]
>>>>>>> Disable [ Platform support -> IBM pSeries & new (POWER5-based) iSer=
ies ]
>>>>>>> Enable SMP [ Processor support -> Symmetric multi-processing suppor=
t ]
>>>>>>> Save the config
>>>>>>> Run 'make olddefconfig'
>>>>>>> erroneously selected due to an implicit assumption by the PM_SLEEP_=
SMP option.
>>>>>>> This misalignment in dependencies could potentially lead to inconsi=
stent kernel
>>>>>>> configuration states, especially when considering the necessary har=
dware
>>>>>>> support for CPU hot-plugging on PowerPC platforms. The patch aims t=
o correct
>>>>>>> this by ensuring that ARCH_HIBERNATION_POSSIBLE is contingent upon =
the
>>>>>>> appropriate PowerPC configurations being active.
>>>>>>>
>>>>>>> steps to reproduce (before applying the patch):
>>>>>>>
>>>>>>> Run 'make pseries_le_defconfig'
>>>>>>> Run 'make menuconfig'
>>>>>>> Enable hibernation [ Kernel options -> Hibernation (aka 'suspend to=
 disk') ]=20
>>>>>>> Disable [ Platform support -> IBM PowerNV (Non-Virtualized) platfor=
m support ]
>>>>>>> Disable [ Platform support -> IBM pSeries & new (POWER5-based) iSer=
ies ]
>>>>>>> Enable SMP [ Processor support -> Symmetric multi-processing suppor=
t ]
>>>>>>> Save the config
>>>>>>> Run 'make olddefconfig'
>>>>>>>
>>>>>>>  arch/powerpc/Kconfig | 5 +++--
>>>>>>>  1 file changed, 3 insertions(+), 2 deletions(-)
>>>>>>>
>>>>>>> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
>>>>>>> index 6f105ee4f3cf..bf99ff9869f6 100644
>>>>>>> --- a/arch/powerpc/Kconfig
>>>>>>> +++ b/arch/powerpc/Kconfig
>>>>>>> @@ -380,8 +380,9 @@ config DEFAULT_UIMAGE
>>>>>>>  	  Used to allow a board to specify it wants a uImage built by def=
ault
>>>>>>>=20=20
>>>>>>>  config ARCH_HIBERNATION_POSSIBLE
>>>>>>> -	bool
>>>>>>> -	default y
>>>>>>> +	def_bool y
>>>>>>> +	depends on PPC_PSERIES || \
>>>>>>> +		PPC_PMAC || PPC_POWERNV || FSL_SOC_BOOKE
>>>>>>>=20=20
>>>>>>>  config ARCH_SUSPEND_POSSIBLE
>>>>>>>  	def_bool y
>>>>>>>
>>>>>> I am wondering whether it should be switched to using select from
>>>>>> config PPC?=20
>>>>>>
>>>>>> selecting ARCH_HIBERNATION_POSSIBLE based on value of config PPC
>>>>>> will not guarantee config PPC_PSERIES being set
>>>>>>
>>>>>> PPC_PSERIES can be set to N, even when config PPC is set.
>>> I understand what you meant before. Having ARCH_HIBERNATION_POSSIBLE un=
der config PPC makes more sense.
>>>>>> grep -A 5 -i "config ppc_pseries" arch/powerpc/platforms/pseries/Kco=
nfig
>>>>>> config PPC_PSERIES
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 depends on PPC64 && PPC_B=
OOK3S
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool "IBM pSeries & new (=
POWER5-based) iSeries"
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 select HAVE_PCSPKR_PLATFO=
RM
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 select MPIC
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 select OF_DYNAMIC
>>>>>>
>>>> modified   arch/powerpc/Kconfig
>>>> @@ -156,6 +156,7 @@ config PPC
>>>>  	select ARCH_HAS_UACCESS_FLUSHCACHE
>>>>  	select ARCH_HAS_UBSAN_SANITIZE_ALL
>>>>  	select ARCH_HAVE_NMI_SAFE_CMPXCHG
>>>> +	select ARCH_HIBERNATION_POSSIBLE	if (PPC_PSERIES || PPC_PMAC || PPC_=
POWERNV || FSL_SOC_BOOKE)
>>>>  	select ARCH_KEEP_MEMBLOCK
>>>>  	select ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE	if PPC_RADIX_MMU
>>>>  	select ARCH_MIGHT_HAVE_PC_PARPORT
>>> Though, even with these changes I was able to reproduce same warnings. =
(using steps from above)
>>> It's because one can enable HIBERNATION manually.
>> But how? You shouldn't be able to enable it manually, it depends on
>> ARCH_HIBERNATION_POSSIBLE which shouldn't be enabled.
>>
>> For the above to work you also need to make it default n, eg:
>>
>> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
>> index 6f105ee4f3cf..dd2a9b938188 100644
>> --- a/arch/powerpc/Kconfig
>> +++ b/arch/powerpc/Kconfig
>> @@ -380,8 +380,7 @@ config DEFAULT_UIMAGE
>>           Used to allow a board to specify it wants a uImage built by de=
fault
>>
>>  config ARCH_HIBERNATION_POSSIBLE
>> -       bool
>> -       default y
>> +       def_bool n
>>
>>  config ARCH_SUSPEND_POSSIBLE
>>         def_bool y
>
> Ran make randconfig bunch of times.
>
> # make KCONFIG_SEED=3D0x97C94A3C randconfig
> make[1]: Entering directory ''
> =C2=A0 GEN=C2=A0=C2=A0=C2=A0=C2=A0 Makefile
> KCONFIG_SEED=3D0x97C94A3C
>
> WARNING: unmet direct dependencies detected for HOTPLUG_CPU
> =C2=A0 Depends on [n]: SMP [=3Dy] && (PPC_PSERIES [=3Dn] || PPC_PMAC [=3D=
n] ||
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 PPC_POWERNV [=3Dn] || FSL_SOC_BOOKE [=3Dn])
> =C2=A0 Selected by [y]:
> =C2=A0 - PM_SLEEP_SMP [=3Dy] && SMP [=3Dy] && (ARCH_SUSPEND_POSSIBLE [=3D=
y]
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 || ARCH_HIB=
ERNATION_POSSIBLE [=3Dn]) && PM_SLEEP [=3Dy]
> #
> # configuration written to .config
> #
> make[1]: Leaving directory ''
>
> As per my understanding,
>
> "Depends on" clause of the config HOTPLUG_CPU as CPU hotplugging is only
> available for SMP systems and is only available for following power platf=
orms
> (PPC_PSERIES || PPC_PMAC || PPC_POWERNV=C2=A0 || FSL_SOC_BOOKE)
>
> Also, config HOTPLUG_CPU=C2=A0 is being selected by config PM_SLEEP_SMP
> config PM_SLEEP_SMP
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 def_bool y
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 depends on SMP
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 depends on ARCH_SUSPEND_POSSIB=
LE || ARCH_HIBERNATION_POSSIBLE
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 depends on PM_SLEEP
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 select HOTPLUG_CPU <----- Here
>
> Power management functionality depends and vary upon arch (and in powerpc=
 case, platforms)
> supporting suspend/hibernation
>
> There are some platforms which support suspend and hence ARCH_SUSPEND_POS=
SIBLE
> is set, leading to PM_SLEEP_SMP being set, and ultimately, config HOTPLUG=
_CPU gets set.
> But, CPU hotplug is not supported for such platform and hence the conflic=
t.

Yeah. We need to restrict ARCH_SUSPEND_POSSIBLE in a similar way to
ARCH_HIBERNATION_POSSIBLE.

cheers
