Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A02410FDD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Sep 2021 09:13:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HCbQB0vP2z2yNv
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Sep 2021 17:13:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Nz3GNH30;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=Nz3GNH30; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HCbPX2xYbz2yJT
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Sep 2021 17:13:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1632121998;
 bh=Z0a6Ux5S8SJDen5AZotExHUl8BMbr+irGyQpewndDOw=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=Nz3GNH30hrEWsvPs2DGhjcHiWOm0L8pswZGwCy4Rj6JGxI5iqfdxge+bgkBcrPv+i
 yhWsvk+s7PAL2Np8jKKD/2zkWB9HiyPSXI3Tr8LKk8cmD4p48IGjdXycEOx7KxRcie
 B0MYLYkGJbVSePRZ0temz2SR2CahAeL2VjZR+ORq05x8F6/KpnKG6GzNwHEGa6At96
 /LBpCvmVmfiwxT0AKNsbUSQbCW4CFUYfp+KrIG2P+dqbD9jqdZbcDGnY82siS7UvFp
 xCAMj7UpGT6qVL0LHz6XFmGJe1tgqo/mZ5YOxtvtl1tHq5sSQWiwsUhB5VqqAxx+Td
 Vx9mGLPxAQIPA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HCbPV6cWhz9sSs;
 Mon, 20 Sep 2021 17:13:18 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH 1/2] powerpc/perf: Expose instruction and data address
 registers as part of extended regs
In-Reply-To: <38CCAAE2-A157-4689-B774-43FC48883699@linux.vnet.ibm.com>
References: <1624200360-1429-1-git-send-email-atrajeev@linux.vnet.ibm.com>
 <1624200360-1429-2-git-send-email-atrajeev@linux.vnet.ibm.com>
 <87pmtjmysk.fsf@mpe.ellerman.id.au>
 <38CCAAE2-A157-4689-B774-43FC48883699@linux.vnet.ibm.com>
Date: Mon, 20 Sep 2021 17:13:17 +1000
Message-ID: <87ilyviusy.fsf@mpe.ellerman.id.au>
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
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, rnsastry@linux.ibm.com,
 kajoljain <kjain@linux.ibm.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Jiri Olsa <jolsa@kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Athira Rajeev <atrajeev@linux.vnet.ibm.com> writes:
>> On 08-Sep-2021, at 10:47 AM, Michael Ellerman <mpe@ellerman.id.au> wrote:
>>=20
>> Athira Rajeev <atrajeev@linux.vnet.ibm.com> writes:
>>> Patch adds support to include Sampled Instruction Address Register
>>> (SIAR) and Sampled Data Address Register (SDAR) SPRs as part of extended
>>> registers. Update the definition of PERF_REG_PMU_MASK_300/31 and
>>> PERF_REG_EXTENDED_MAX to include these SPR's.
>>>=20
>>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>>> ---
>>> arch/powerpc/include/uapi/asm/perf_regs.h | 12 +++++++-----
>>> arch/powerpc/perf/perf_regs.c             |  4 ++++
>>> 2 files changed, 11 insertions(+), 5 deletions(-)
>>>=20
>> ...
>>> diff --git a/arch/powerpc/perf/perf_regs.c b/arch/powerpc/perf/perf_reg=
s.c
>>> index b931eed..51d31b6 100644
>>> --- a/arch/powerpc/perf/perf_regs.c
>>> +++ b/arch/powerpc/perf/perf_regs.c
>>> @@ -90,7 +90,11 @@ static u64 get_ext_regs_value(int idx)
>>> 		return mfspr(SPRN_SIER2);
>>> 	case PERF_REG_POWERPC_SIER3:
>>> 		return mfspr(SPRN_SIER3);
>>> +	case PERF_REG_POWERPC_SDAR:
>>> +		return mfspr(SPRN_SDAR);
>>> #endif
>>> +	case PERF_REG_POWERPC_SIAR:
>>> +		return mfspr(SPRN_SIAR);
>>> 	default: return 0;
>>> 	}
>>=20
>> This file is built for all powerpc configs that have PERF_EVENTS. Which
>> includes CPUs that don't have SDAR or SIAR.
>>=20
>> Don't we need checks in perf_reg_value() like we do for SIER?
>
> Hi Michael,
>
> Thanks for the review.
>
> SIER is part of PERF_REG_PMU_MASK and hence check is needed to see if pla=
tform supports SIER.
> Incase of extended regs, they are part of PERF_REG_EXTENDED_MASK and this=
 mask is
> filled with supported registers while registering the PMU ( ie during ini=
t_power9/10_pmu ). So these registers will be added
> only for supported platforms. The validity of extended mask is also done =
in PMU common code=20
> ( In kernel/events/core.c with PERF_REG_EXTENDED_MASK check ). So an unsu=
pported platform requesting for extended
> registers won=E2=80=99t get it.

Right, I'd forgotten how that works.

But I think part of the reason I didn't remember is that
PERF_REG_PMU_MASK_31 doesn't mention those regs by name, it's just a hex
constant, ie:

-#define PERF_REG_PMU_MASK_31   (0xfffULL << PERF_REG_POWERPC_MMCR0)
+#define PERF_REG_PMU_MASK_31   (0x3fffULL << PERF_REG_POWERPC_MMCR0)

Presumably you tested that the added 0x3 there sets the right bits for
SDAR and SIAR, but it's 1) not obvious and 2) fragile.

So I'd like it better if we constructed the PERF_REG_PMU_MASK_31, and
other similar masks, by or'ing together the actual register value
constants.

eg. something like:

#define PERF_REG_PMU_MASK_31	\
	((1ul << PERF_REG_POWERPC_MMCR0) | (1ul << PERF_REG_POWERPC_MMCR1) | \
	(1ul << PERF_REG_POWERPC_MMCR2) | (1ul << PERF_REG_POWERPC_MMCR3) | \
	(1ul << PERF_REG_POWERPC_SIER2) | (1ul << PERF_REG_POWERPC_SIER3) | \
	(1ul << PERF_REG_POWERPC_PMC1) | (1ul << PERF_REG_POWERPC_PMC2) | \
	(1ul << PERF_REG_POWERPC_PMC3) | (1ul << PERF_REG_POWERPC_PMC4) | \
	(1ul << PERF_REG_POWERPC_PMC5) | (1ul << PERF_REG_POWERPC_PMC6))


Also PERF_REG_EXTENDED_MAX should be part of the enum, just like
PERF_REG_POWERPC_MAX.

cheers
