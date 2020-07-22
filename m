Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CFAA229669
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 12:40:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BBX732kyFzDr4M
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 20:40:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BBX5351WMzDqwf
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jul 2020 20:39:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=fW7DOEJL; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BBX5307cTz9sRN;
 Wed, 22 Jul 2020 20:39:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1595414343;
 bh=jtBj3K1Yjgzf7uVcLOWUMyl0qabi63I82NgtnW9MR2s=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=fW7DOEJLjm0fCgoqd5G1p9Ml9LTgOwWlJQH8xIUKYlAAXUO+AfP52S3THPvkp/pF1
 cn/rg24bel821tQB5LsXvVeR5X0tl7aiQhK+8a/OAJpbIrr0i0lfOknmc3SBPEHMOZ
 myhA4Z6Z2DX2PiBaHLayV649vNeKBk1zHYshz3dO1WMmn6stFTX66kEA5O0/YDqLNa
 2EKNUUdk0BvhYpehO+ZGGFP0S/L2d2YldC3j+66milwlUuHWbGkjqAJGP8XIbYdJkH
 G0Gz/Q2nke6qoFhUVZchjdXLT0zAZNyFtOus7xzA2V53+GY3bQj3fAwNmKndgWzVbF
 7pPijz409EnUg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>,
 Jordan Niethe <jniethe5@gmail.com>
Subject: Re: [v3 07/15] powerpc/perf: Add power10_feat to dt_cpu_ftrs
In-Reply-To: <9A4E06A2-5686-4C85-B2F7-0904F195B58A@linux.vnet.ibm.com>
References: <1594996707-3727-1-git-send-email-atrajeev@linux.vnet.ibm.com>
 <1594996707-3727-8-git-send-email-atrajeev@linux.vnet.ibm.com>
 <CACzsE9oBw1ZrJLqOAg1QqPrQgSoVbEdPh_ax7mU_kcWNyfyAcg@mail.gmail.com>
 <9A4E06A2-5686-4C85-B2F7-0904F195B58A@linux.vnet.ibm.com>
Date: Wed, 22 Jul 2020 20:39:00 +1000
Message-ID: <87ft9jrfzv.fsf@mpe.ellerman.id.au>
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
Cc: Gautham R Shenoy <ego@linux.vnet.ibm.com>,
 Michael Neuling <mikey@neuling.org>, maddy@linux.vnet.ibm.com,
 kvm@vger.kernel.org, kvm-ppc@vger.kernel.org, svaidyan@in.ibm.com,
 acme@kernel.org, jolsa@kernel.org,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Athira Rajeev <atrajeev@linux.vnet.ibm.com> writes:
>> On 22-Jul-2020, at 10:11 AM, Jordan Niethe <jniethe5@gmail.com> wrote:
>>=20
>> On Sat, Jul 18, 2020 at 1:13 AM Athira Rajeev
>> <atrajeev@linux.vnet.ibm.com <mailto:atrajeev@linux.vnet.ibm.com>> wrote:
>>>=20
>>> From: Madhavan Srinivasan <maddy@linux.ibm.com>
>>>=20
>>> Add power10 feature function to dt_cpu_ftrs.c along
>>> with a power10 specific init() to initialize pmu sprs,
>>> sets the oprofile_cpu_type and cpu_features. This will
>>> enable performance monitoring unit(PMU) for Power10
>>> in CPU features with "performance-monitor-power10".
>>>=20
>>> For PowerISA v3.1, BHRB disable is controlled via Monitor Mode
>>> Control Register A (MMCRA) bit, namely "BHRB Recording Disable
>>> (BHRBRD)". This patch initializes MMCRA BHRBRD to disable BHRB
>>> feature at boot for power10.
>>>=20
>>> Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
>>> ---
>>> arch/powerpc/include/asm/reg.h        |  3 +++
>>> arch/powerpc/kernel/cpu_setup_power.S |  8 ++++++++
>>> arch/powerpc/kernel/dt_cpu_ftrs.c     | 26 ++++++++++++++++++++++++++
>>> 3 files changed, 37 insertions(+)
>>>=20
>>> diff --git a/arch/powerpc/include/asm/reg.h b/arch/powerpc/include/asm/=
reg.h
>>> index 21a1b2d..900ada1 100644
>>> --- a/arch/powerpc/include/asm/reg.h
>>> +++ b/arch/powerpc/include/asm/reg.h
>>> @@ -1068,6 +1068,9 @@
>>> #define MMCR0_PMC2_LOADMISSTIME        0x5
>>> #endif
>>>=20
>>> +/* BHRB disable bit for PowerISA v3.10 */
>>> +#define MMCRA_BHRB_DISABLE     0x0000002000000000
>> Shouldn't this go under SPRN_MMCRA with the other MMCRA_*.
>
>
> Hi Jordan
>
> Ok, the definition of MMCRA is under #ifdef for 64 bit .  if I move defin=
ition of MMCRA_BHRB_DISABLE along with other SPR's, I also
> need to define this for 32-bit to satisfy core-book3s to compile as below:
>
> diff --git a/arch/powerpc/include/asm/reg.h b/arch/powerpc/include/asm/re=
g.h
> index 900ada10762c..7e271657b412 100644
> --- a/arch/powerpc/include/asm/reg.h
> +++ b/arch/powerpc/include/asm/reg.h
> @@ -888,6 +888,8 @@
>  #define   MMCRA_SLOT   0x07000000UL /* SLOT bits (37-39) */
>  #define   MMCRA_SLOT_SHIFT     24
>  #define   MMCRA_SAMPLE_ENABLE 0x00000001UL /* enable sampling */
> +/* BHRB disable bit for PowerISA v3.10 */
> +#define   MMCRA_BHRB_DISABLE  0x0000002000000000

I changed it to:

#define   MMCRA_BHRB_DISABLE  0x2000000000UL // BHRB disable bit for ISA v3=
.1

>>> diff --git a/arch/powerpc/kernel/cpu_setup_power.S b/arch/powerpc/kerne=
l/cpu_setup_power.S
>>> index efdcfa7..b8e0d1e 100644
>>> --- a/arch/powerpc/kernel/cpu_setup_power.S
>>> +++ b/arch/powerpc/kernel/cpu_setup_power.S
>>> @@ -94,6 +94,7 @@ _GLOBAL(__restore_cpu_power8)
>>> _GLOBAL(__setup_cpu_power10)
>>>        mflr    r11
>>>        bl      __init_FSCR_power10
>>> +       bl      __init_PMU_ISA31
>> So we set MMCRA here but then aren't we still going to call __init_PMU
>> which will overwrite that?
>> Would this setting MMCRA also need to be handled in __restore_cpu_power1=
0?
>
> Thanks for this nice catch !  When I rebased code initial phase, we didn=
=E2=80=99t had power10 part filled in.
> It was a miss from my side in adding PMu init functions and thanks for po=
inting this out.=20
> Below patch will call __init_PMU functions in setup and restore. Please c=
heck if this looks good

Actually those changes should be in a separate patch.

This one is wiring up DT CPU features, the cpu setup routines are not
used by DT CPU features.

So please send a new patch I can insert into the series that adds the
cpu_setup_power.S changes.

cheers

> --
> diff --git a/arch/powerpc/kernel/cpu_setup_power.S b/arch/powerpc/kernel/=
cpu_setup_power.S
> index efdcfa714106..e672a6c5fd7c 100644
> --- a/arch/powerpc/kernel/cpu_setup_power.S
> +++ b/arch/powerpc/kernel/cpu_setup_power.S
> @@ -94,6 +94,9 @@ _GLOBAL(__restore_cpu_power8)
>  _GLOBAL(__setup_cpu_power10)
>  	mflr	r11
>  	bl	__init_FSCR_power10
> +	bl	__init_PMU
> +	bl	__init_PMU_ISA31
> +	bl	__init_PMU_HV
>  	b	1f
>=20=20
>  _GLOBAL(__setup_cpu_power9)
> @@ -124,6 +127,9 @@ _GLOBAL(__setup_cpu_power9)
>  _GLOBAL(__restore_cpu_power10)
>  	mflr	r11
>  	bl	__init_FSCR_power10
> +	bl	__init_PMU
> +	bl	__init_PMU_ISA31
> +	bl	__init_PMU_HV
>  	b	1f
>=20=20
>  _GLOBAL(__restore_cpu_power9)
> @@ -233,3 +239,10 @@ __init_PMU_ISA207:
>  	li	r5,0
>  	mtspr	SPRN_MMCRS,r5
>  	blr
> +
> +__init_PMU_ISA31:
> +	li	r5,0
> +	mtspr	SPRN_MMCR3,r5
> +	LOAD_REG_IMMEDIATE(r5, MMCRA_BHRB_DISABLE)
> +	mtspr	SPRN_MMCRA,r5
> +	blr
>
