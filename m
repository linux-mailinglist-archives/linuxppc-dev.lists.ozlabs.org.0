Return-Path: <linuxppc-dev+bounces-3594-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E26089DB212
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Nov 2024 05:15:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XzNJH5wd7z2xdq;
	Thu, 28 Nov 2024 15:15:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732767311;
	cv=none; b=edhOjt4fwPzClAseP6BjMB267Vs2nGDAYRgvMxMNRj7tGjbZdk8BsxHNn8kCSJouILggVD+8vh43/ScOw2cRhAB32VrQsbqJC/yZiVyL/rWFhmT97cJ6zSperk3yfCkIZVH6IcVq7qRtuNlLqDdJK3K9KRHlhLPnwBcr+r7dPWvHVGHVBYuRJIfWMR0e1VGyseRS4CmGdaTvl5+A/qdi3ARXmAWFdQte03cASUsFltCj5T8kLCnWYkl/ZEOfVXKjPegzW9lmJAT506xFHjexV67G2nNSn+sFyPQg8l4rVIQUMmS98FgqsICksZ57SKBu9SGqA3GtfxfyHR9QM/VHtg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732767311; c=relaxed/relaxed;
	bh=7b6Glp5SLr2N7UsM03np/8ULjbfU4Ri7NW0RKWdI/Z4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=dUv3uXBCe1OnVcN159Sk+zFSt6xvki7E5RcvOEussyxVW22U4GMk/51EGWi6WfxR/BYxZfofEOyaSvbNCMM/3mQ8ixn6ZR7vxPoLB+DTR5OLsF73NCYEKgEnhTLYwrx9zSrbquF0lHiheVvuiO3/RTXYdHyRM7Uw9DHgldRFjBoUN4vPu6KPKDHG/2PCHpRcAfmUSnHk4W9CBSmpXVpPNZ6z0hldZK1s40daMbOAM1sqS1YRS9paiZhf+FgXaTAsBIMEloP/0CGZigq2dCx9zsWGNVvZC3KSs1Bpud96xUPfJQLekfBM3CADDMMYOKn7iUt9HYgc5CC9E0TvoqyufA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=g+JpXJrX; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=g+JpXJrX;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XzNJF720Wz2xYs
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Nov 2024 15:15:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1732767306;
	bh=7b6Glp5SLr2N7UsM03np/8ULjbfU4Ri7NW0RKWdI/Z4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=g+JpXJrXNqlmjqYVNDJ3R/P2uxDj59PhRmtxqpO6WVujyJefvb8wwxsiscR3svFjw
	 6eecPF9jaF3p+fizPt4Fde/26O+i/2GoaKtRXx6jscMT0CMD1i8jMqGOPoXk/otTJE
	 Qga4yWfmpjhNrN9x3FmkaUuapVhcgNcbQEI7qNJW1RlV1dk8GX3MkrBwfLvEAQR6At
	 eUNm3mPuvVy+lXdDVSn6VqtkLfCq/XYurVFKJ/9gJqOAIE4y2x7aOh/0dhiezwuOds
	 QYSBwdb4Hxy3UeAnw3hTa4wqiYIl2FteruSDYAxRxIAQ6SUkFWNFnrPo44p0mq5mTh
	 f5Vxo9KaedIPg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XzNJB2BHcz4x0G;
	Thu, 28 Nov 2024 15:15:06 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Rob Herring <robh@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, saravanak@google.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] powerpc/prom_init: Fixup missing powermac #size-cells
In-Reply-To: <CAL_JsqKJzAoxFQ30rJbH7D7zmGtZ+jNpw2BL45dqjOUe2fFbwA@mail.gmail.com>
References: <20241126025710.591683-1-mpe@ellerman.id.au>
 <CAL_JsqKJzAoxFQ30rJbH7D7zmGtZ+jNpw2BL45dqjOUe2fFbwA@mail.gmail.com>
Date: Thu, 28 Nov 2024 15:15:06 +1100
Message-ID: <87iks86lkl.fsf@mpe.ellerman.id.au>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Rob Herring <robh@kernel.org> writes:
> On Mon, Nov 25, 2024 at 8:57=E2=80=AFPM Michael Ellerman <mpe@ellerman.id=
.au> wrote:
>>
>> On some powermacs `escc` nodes are missing `#size-cells` properties,
>> which is deprecated and now triggers a warning at boot since commit
>> 045b14ca5c36 ("of: WARN on deprecated #address-cells/#size-cells
>> handling").
>>
>> For example:
>>
>>   Missing '#size-cells' in /pci@f2000000/mac-io@c/escc@13000
>>   WARNING: CPU: 0 PID: 0 at drivers/of/base.c:133 of_bus_n_size_cells+0x=
98/0x108
>>   Hardware name: PowerMac3,1 7400 0xc0209 PowerMac
>>   ...
>>   Call Trace:
>>     of_bus_n_size_cells+0x98/0x108 (unreliable)
>>     of_bus_default_count_cells+0x40/0x60
>>     __of_get_address+0xc8/0x21c
>>     __of_address_to_resource+0x5c/0x228
>>     pmz_init_port+0x5c/0x2ec
>>     pmz_probe.isra.0+0x144/0x1e4
>>     pmz_console_init+0x10/0x48
>>     console_init+0xcc/0x138
>>     start_kernel+0x5c4/0x694
>>
>> As powermacs boot via prom_init it's possible to add the missing
>> properties to the device tree during boot, avoiding the warning. Note
>> that `escc-legacy` nodes are also missing `#size-cells` properties, but
>> they are skipped by the macio driver, so leave them alone.
>>
>> Depends-on: 045b14ca5c36 ("of: WARN on deprecated #address-cells/#size-c=
ells handling")
>> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
>> ---
>>  arch/powerpc/kernel/prom_init.c | 29 +++++++++++++++++++++++++++--
>>  1 file changed, 27 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/powerpc/kernel/prom_init.c b/arch/powerpc/kernel/prom_=
init.c
>> index 73210e5bcfa7..8e776ba39497 100644
>> --- a/arch/powerpc/kernel/prom_init.c
>> +++ b/arch/powerpc/kernel/prom_init.c
>> @@ -2848,7 +2848,7 @@ static void __init fixup_device_tree_chrp(void)
>>  #endif
>>
>>  #if defined(CONFIG_PPC64) && defined(CONFIG_PPC_PMAC)
>> -static void __init fixup_device_tree_pmac(void)
>> +static void __init fixup_device_tree_pmac64(void)
>>  {
>>         phandle u3, i2c, mpic;
>>         u32 u3_rev;
>> @@ -2888,7 +2888,31 @@ static void __init fixup_device_tree_pmac(void)
>>                      &parent, sizeof(parent));
>>  }
>>  #else
>> -#define fixup_device_tree_pmac()
>> +#define fixup_device_tree_pmac64()
>> +#endif
>> +
>> +#ifdef CONFIG_PPC_PMAC
>> +static void __init fixup_device_tree_pmac(void)
>> +{
>> +       __be32 val =3D 1;
>> +       char type[8];
>> +       phandle node;
>
> I suppose you are keeping the existing style, but you could use
> IS_ENABLED() here instead of #ifdef.

Yeah true. I'll do that as a follow-up and convert them all.

> Either way,
>
> Reviewed-by: Rob Herring <robh@kernel.org>

Thanks.

cheers

