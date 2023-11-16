Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7B07EE9F5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Nov 2023 00:23:43 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=OIZTJb22;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SWbgx43qtz3cnK
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Nov 2023 10:23:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=OIZTJb22;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SWbg41xQZz3cHP
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Nov 2023 10:22:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1700176976;
	bh=qCXGzKe5hz9TCx7qJ3emEY1OqsOOjksft6kw4VbwO0k=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=OIZTJb224dYLQqOuUrT5RIIczqDB2G64LIJjIFux6d4m2M/IaiirletCwdsof5oTC
	 HM+G9JC2WCq2PmZEhsIDxYkol+/KkTNLMRkioHRh5muXPy78Y6dHZ1JpN1+vJUFDvH
	 ei8IRk2J6mO/62oA0CsK7WgSzBUTdsHk5Ncy9jVQkCTqmcMq3647kXREiPHVmuDMpK
	 6/8+6Z0LEb7rVOaHDNtM0Z38qZiCZj86ShvM0bpOK8cv/BBPWSRomHIFxoC3eOE44R
	 0omdkyOBOV9dSQK1dCEGvasxLEwfW3bCdwXaGdD7b7ICW9OHgRIDDuFgkccU03bt7S
	 sJLjVl32dZuOQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SWbg40xWRz4x5M;
	Fri, 17 Nov 2023 10:22:56 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Vishal Chourasia <vishalc@linux.ibm.com>, Aneesh Kumar K V
 <aneesh.kumar@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc: Restrict ARCH_HIBERNATION_POSSIBLE to
 supported configurations
In-Reply-To: <b7600012-0e7e-4b25-8d8c-1bffcc9c1461@linux.ibm.com>
References: <20231114082046.6018-1-vishalc@linux.ibm.com>
 <87sf57zbcd.fsf@linux.ibm.com>
 <ecc9d34a-4960-4540-802e-d35ee4f5259b@linux.ibm.com>
 <c3594f58-c7a4-4265-a38e-c97b08169b61@linux.ibm.com>
 <b7600012-0e7e-4b25-8d8c-1bffcc9c1461@linux.ibm.com>
Date: Fri, 17 Nov 2023 10:22:53 +1100
Message-ID: <87jzqh706q.fsf@mail.lhotse>
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
> On 15/11/23 5:46 pm, Aneesh Kumar K V wrote:
>> On 11/15/23 5:23 PM, Vishal Chourasia wrote:
>>> On 15/11/23 1:39 pm, Aneesh Kumar K.V wrote:
>>>> Vishal Chourasia <vishalc@linux.ibm.com> writes:
>>>>
>>>>> This patch modifies the ARCH_HIBERNATION_POSSIBLE option to ensure th=
at it
>>>>> correctly depends on these PowerPC configurations being enabled. As a=
 result,
>>>>> it prevents the HOTPLUG_CPU from being selected when the required dep=
endencies
>>>>> are not satisfied.
>>>>>
>>>>> This change aligns the dependency tree with the expected hardware sup=
port for
>>>>> CPU hot-plugging under PowerPC architectures, ensuring that the kernel
>>>>> configuration steps do not lead to inconsistent states.
>>>>>
>>>>> Signed-off-by: Vishal Chourasia <vishalc@linux.ibm.com>
>>>>> ---
>>>>> During the configuration process with 'make randconfig' followed by
>>>>> 'make olddefconfig', we observed a warning indicating an unmet direct
>>>>> dependency for the HOTPLUG_CPU option. The dependency in question rel=
ates to
>>>>> various PowerPC configurations (PPC_PSERIES, PPC_PMAC, PPC_POWERNV,
>>>>> FSL_SOC_BOOKE) which were not enabled, yet the HOTPLUG_CPU was being
>>>>> erroneously selected due to an implicit assumption by the PM_SLEEP_SM=
P option.
>>>>> This misalignment in dependencies could potentially lead to inconsist=
ent kernel
>>>>> configuration states, especially when considering the necessary hardw=
are
>>>>> support for CPU hot-plugging on PowerPC platforms. The patch aims to =
correct
>>>>> this by ensuring that ARCH_HIBERNATION_POSSIBLE is contingent upon the
>>>>> appropriate PowerPC configurations being active.
>>>>>
>>>>> steps to reproduce (before applying the patch):
>>>>>
>>>>> Run 'make pseries_le_defconfig'
>>>>> Run 'make menuconfig'
>>>>> Enable hibernation [ Kernel options -> Hibernation (aka 'suspend to d=
isk') ]=20
>>>>> Disable [ Platform support -> IBM PowerNV (Non-Virtualized) platform =
support ]
>>>>> Disable [ Platform support -> IBM pSeries & new (POWER5-based) iSerie=
s ]
>>>>> Enable SMP [ Processor support -> Symmetric multi-processing support ]
>>>>> Save the config
>>>>> Run 'make olddefconfig'
>>>>>
>>>>>  arch/powerpc/Kconfig | 5 +++--
>>>>>  1 file changed, 3 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
>>>>> index 6f105ee4f3cf..bf99ff9869f6 100644
>>>>> --- a/arch/powerpc/Kconfig
>>>>> +++ b/arch/powerpc/Kconfig
>>>>> @@ -380,8 +380,9 @@ config DEFAULT_UIMAGE
>>>>>  	  Used to allow a board to specify it wants a uImage built by defau=
lt
>>>>>=20=20
>>>>>  config ARCH_HIBERNATION_POSSIBLE
>>>>> -	bool
>>>>> -	default y
>>>>> +	def_bool y
>>>>> +	depends on PPC_PSERIES || \
>>>>> +		PPC_PMAC || PPC_POWERNV || FSL_SOC_BOOKE
>>>>>=20=20
>>>>>  config ARCH_SUSPEND_POSSIBLE
>>>>>  	def_bool y
>>>>>
>>>> I am wondering whether it should be switched to using select from
>>>> config PPC?=20
>>>>
>>>> selecting ARCH_HIBERNATION_POSSIBLE based on value of config PPC
>>>> will not guarantee config PPC_PSERIES being set
>>>>
>>>> PPC_PSERIES can be set to N, even when config PPC is set.
> I understand what you meant before. Having ARCH_HIBERNATION_POSSIBLE unde=
r config PPC makes more sense.
>>>> grep -A 5 -i "config ppc_pseries" arch/powerpc/platforms/pseries/Kconf=
ig
>>>> config PPC_PSERIES
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 depends on PPC64 && PPC_BOO=
K3S
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool "IBM pSeries & new (PO=
WER5-based) iSeries"
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 select HAVE_PCSPKR_PLATFORM
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 select MPIC
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 select OF_DYNAMIC
>>>>
>> modified   arch/powerpc/Kconfig
>> @@ -156,6 +156,7 @@ config PPC
>>  	select ARCH_HAS_UACCESS_FLUSHCACHE
>>  	select ARCH_HAS_UBSAN_SANITIZE_ALL
>>  	select ARCH_HAVE_NMI_SAFE_CMPXCHG
>> +	select ARCH_HIBERNATION_POSSIBLE	if (PPC_PSERIES || PPC_PMAC || PPC_PO=
WERNV || FSL_SOC_BOOKE)
>>  	select ARCH_KEEP_MEMBLOCK
>>  	select ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE	if PPC_RADIX_MMU
>>  	select ARCH_MIGHT_HAVE_PC_PARPORT
>
> Though, even with these changes I was able to reproduce same warnings. (u=
sing steps from above)
> It's because one can enable HIBERNATION manually.

But how? You shouldn't be able to enable it manually, it depends on
ARCH_HIBERNATION_POSSIBLE which shouldn't be enabled.

For the above to work you also need to make it default n, eg:

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 6f105ee4f3cf..dd2a9b938188 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -380,8 +380,7 @@ config DEFAULT_UIMAGE
          Used to allow a board to specify it wants a uImage built by defau=
lt

 config ARCH_HIBERNATION_POSSIBLE
-       bool
-       default y
+       def_bool n

 config ARCH_SUSPEND_POSSIBLE
        def_bool y


cheers
