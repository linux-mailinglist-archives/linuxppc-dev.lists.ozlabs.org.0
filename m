Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D433436E6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Mar 2021 03:56:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F3fKX2fYRz304C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Mar 2021 13:56:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=CIMofV50;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::629;
 helo=mail-pl1-x629.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=CIMofV50; dkim-atps=neutral
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F3fK60ZCGz2xg6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Mar 2021 13:56:24 +1100 (AEDT)
Received: by mail-pl1-x629.google.com with SMTP id l1so5783560plg.12
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 21 Mar 2021 19:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=dByteuEb7W2qYd9EJauFlXwJwUYQshLLvYtfbu0gmA4=;
 b=CIMofV50nFoi2Kji4LhDJjgWnPdz6yxm/amf5kcBPK5qD04D36Ogm/5+LwvPKz7siT
 vEepKyfc0XpUdvl3QJUljRUCzA3w5RPQ2E5sPo7LlJ6vRt4iISsXPByjpuYqigrjFaBH
 i9fQs1etlDNxGZkijz8AXHV9d231SNaIyW+umBBFYeeAa8KsAU1A/PVLnm7HqdX901Ga
 pqS9qgAkPSdDmLlRaIHXMEIR4GOGYBJKtvyvVpmDIbS5uuFeLz7NApS/pgifMbp+7HoM
 lGyU3LCkWnUXZm2OPcWW7mkcKj3iyiNrPsSBQH4Yd5LP3Sy5Ni9XIqEeHqPGaFZmUrPJ
 Drew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=dByteuEb7W2qYd9EJauFlXwJwUYQshLLvYtfbu0gmA4=;
 b=SPemvv1Jv74VvWe5HTtRTRAXac4EmJwAd1KUElA8DxQvkaNgGRmegQF/Mh/Kd4CHbT
 mZ0QodlamoLu86wKCz6BNuK4andrgMZ5u4JxS9Gka+HR/bMYztC3PeDTSi+IYt7+KN6R
 sn2DLw8sGCf2nbtplicLuX2dp4P/E3edVZNgL/wUgm3hDFs9PfsP+rHzCdm8BLeUX/fP
 uU1Kq79yEXjfNjQqnN+hu/6nmgA0SwpYy227KoojVFOMgB9OYURNrFmZCZ73zjpL8BMr
 shLj9LpC2lptYtbEqS0M01kK/ZnKUvPNtzapE9NaBdfO4MfmjjFKBZv7b8lQX/xpPO0v
 l5IQ==
X-Gm-Message-State: AOAM531qRAy9ZksQdhqH/bWu+e0hsEFerdfVbqbgInyDZKPs33/o57zv
 MJicKPb/PtOXg5zeHaLW3bq2bJDEPz8=
X-Google-Smtp-Source: ABdhPJyJRvYKj9xpacMBLpwAgaEi25AassVQ+31HARJMaHcitZGVc1qnU8VtNbb/fHeNw+9ux+nE4Q==
X-Received: by 2002:a17:902:8217:b029:e6:2875:b1d9 with SMTP id
 x23-20020a1709028217b02900e62875b1d9mr24533941pln.70.1616381780674; 
 Sun, 21 Mar 2021 19:56:20 -0700 (PDT)
Received: from localhost ([58.84.78.96])
 by smtp.gmail.com with ESMTPSA id f11sm11061850pga.34.2021.03.21.19.56.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Mar 2021 19:56:20 -0700 (PDT)
Date: Mon, 22 Mar 2021 12:56:14 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 5/6] powerpc/mm/64s/hash: Add real-mode
 change_memory_range() for hash LPAR
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
References: <20210211135130.3474832-1-mpe@ellerman.id.au>
 <20210211135130.3474832-5-mpe@ellerman.id.au>
 <1613084139.rsms9jxmax.astroid@bobo.none>
 <878s6iht88.fsf@mpe.ellerman.id.au>
In-Reply-To: <878s6iht88.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Message-Id: <1616381600.958ox5tnxz.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
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
Cc: aneesh.kumar@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Michael Ellerman's message of March 20, 2021 11:04 pm:
> Nicholas Piggin <npiggin@gmail.com> writes:
>> Excerpts from Michael Ellerman's message of February 11, 2021 11:51 pm:
> ...
>>> diff --git a/arch/powerpc/mm/book3s64/hash_pgtable.c b/arch/powerpc/mm/=
book3s64/hash_pgtable.c
>>> index 3663d3cdffac..01de985df2c4 100644
>>> --- a/arch/powerpc/mm/book3s64/hash_pgtable.c
>>> +++ b/arch/powerpc/mm/book3s64/hash_pgtable.c
>>> @@ -414,6 +428,73 @@ static void change_memory_range(unsigned long star=
t, unsigned long end,
>>>  							mmu_kernel_ssize);
>>>  }
>>> =20
>>> +static int notrace chmem_secondary_loop(struct change_memory_parms *pa=
rms)
>>> +{
>>> +	unsigned long msr, tmp, flags;
>>> +	int *p;
>>> +
>>> +	p =3D &parms->cpu_counter.counter;
>>> +
>>> +	local_irq_save(flags);
>>> +	__hard_EE_RI_disable();
>>> +
>>> +	asm volatile (
>>> +	// Switch to real mode and leave interrupts off
>>> +	"mfmsr	%[msr]			;"
>>> +	"li	%[tmp], %[MSR_IR_DR]	;"
>>> +	"andc	%[tmp], %[msr], %[tmp]	;"
>>> +	"mtmsrd %[tmp]			;"
>>> +
>>> +	// Tell the master we are in real mode
>>> +	"1:				"
>>> +	"lwarx	%[tmp], 0, %[p]		;"
>>> +	"addic	%[tmp], %[tmp], -1	;"
>>> +	"stwcx.	%[tmp], 0, %[p]		;"
>>> +	"bne-	1b			;"
>>> +
>>> +	// Spin until the counter goes to zero
>>> +	"2:				;"
>>> +	"lwz	%[tmp], 0(%[p])		;"
>>> +	"cmpwi	%[tmp], 0		;"
>>> +	"bne-	2b			;"
>>> +
>>> +	// Switch back to virtual mode
>>> +	"mtmsrd %[msr]			;"
>>> +
>>> +	: // outputs
>>> +	  [msr] "=3D&r" (msr), [tmp] "=3D&b" (tmp), "+m" (*p)
>>> +	: // inputs
>>> +	  [p] "b" (p), [MSR_IR_DR] "i" (MSR_IR | MSR_DR)
>>> +	: // clobbers
>>> +	  "cc", "xer"
>>> +	);
>>> +
>>> +	local_irq_restore(flags);
>>
>> Hmm. __hard_EE_RI_disable won't get restored by this because it doesn't
>> set the HARD_DIS flag. Also we don't want RI disabled here because=20
>> tracing will get called first (which might take SLB or HPTE fault).
>=20
> Thanks for noticing. I originally wrote hard_irq_disable() but then
> thought disabling RI also would be good.
>=20
>> But it's also slightly rude to ever enable EE under an irq soft mask,
>> because you don't know if it had been disabled by the masked interrupt=20
>> handler. It's not strictly a problem AFAIK because the interrupt would
>> just get masked again, but if we try to maintain a good pattern would
>> be good. Hmm that means we should add a check for irqs soft masked in
>> __hard_irq_enable(), I'm not sure if all existing users would follow
>> this rule.
>>
>> Might be better to call hard_irq_disable(); after the local_irq_save();
>> and then clear and reset RI inside that region (could just do it at the
>> same time as disabling MMU).
>=20
> Thinking about it more, there's no real reason to disable RI.
>=20
> We should be able to return from an interrupt in there, it's just that
> if we do take one we'll probably die before we get a chance to return
> because the mapping of text will be missing.

Yeah it probably will because the pseries hash machine check handler has=20
some hacks in it that require turning the MMU on. We might never fix=20
that if we're moving to radix, but if we did then in theory we'd be able=20
to take a MCE here and recover.

> So disabling RI doesn't really gain us anything I don't think.

Yeah I probably agree. So local_irq_save(flags); hard_irq_disable();=20
should do the trick.

Thanks,
Nick
