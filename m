Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1398077C87A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Aug 2023 09:22:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=LqS0tqn+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RQ2m56J9Wz3cQM
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Aug 2023 17:22:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=LqS0tqn+;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RQ2lC1jskz2xgv
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Aug 2023 17:21:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1692084115;
	bh=nlRHHnGWBzVd6GeZmokr/74l2q1c/4LBGos+SbEmjB4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=LqS0tqn+HRGFfPMiDlOoCJxPsAfF/HswPSb8oUcBrVZo3e8Y2WTqFvmhey/yUyQWl
	 IBU6eD2sn1GbFqsflszN5EqvcVkAnaqJ5qSbLANS3udEXK0D2i5kfXFTpJ79Y0slVx
	 hD/pa/5A/zlHBTK0wk8sz/tBP1Un/w6esVnGn/VSs96HwK3npbgy3GRQnO4LC+gDBB
	 twPnFPeDoc8r83ga/oM2pzVaKXqlu5BU2Y04aF9RPnYNlfyI34Dl831ci/5+OEVdEY
	 0vSwxLy9iicVgG0mgPNAAIOoQ1Ttnn/5uwVr01Gy/t4n1ZW7pzLtXmMntBG+3+3JEz
	 4HP5KXYgj6vBQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RQ2l74vLqz4wbP;
	Tue, 15 Aug 2023 17:21:55 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Linus Walleij
 <linus.walleij@linaro.org>, Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc: Make virt_to_pfn() a static inline
In-Reply-To: <2e1fcfe4-169f-a52b-8da1-1819962f5783@csgroup.eu>
References: <20230809-virt-to-phys-powerpc-v1-1-12e912a7d439@linaro.org>
 <87a5uter64.fsf@mail.lhotse>
 <2e1fcfe4-169f-a52b-8da1-1819962f5783@csgroup.eu>
Date: Tue, 15 Aug 2023 17:21:52 +1000
Message-ID: <871qg4epnz.fsf@mail.lhotse>
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Le 14/08/2023 =C3=A0 14:37, Michael Ellerman a =C3=A9crit=C2=A0:
>> Linus Walleij <linus.walleij@linaro.org> writes:
>>> Making virt_to_pfn() a static inline taking a strongly typed
>>> (const void *) makes the contract of a passing a pointer of that
>>> type to the function explicit and exposes any misuse of the
>>> macro virt_to_pfn() acting polymorphic and accepting many types
>>> such as (void *), (unitptr_t) or (unsigned long) as arguments
>>> without warnings.
>> ...
>>> diff --git a/arch/powerpc/include/asm/page.h b/arch/powerpc/include/asm=
/page.h
>>> index f2b6bf5687d0..9ee4b6d4a82a 100644
>>> --- a/arch/powerpc/include/asm/page.h
>>> +++ b/arch/powerpc/include/asm/page.h
>>> @@ -233,6 +224,25 @@ extern long long virt_phys_offset;
>>>   #endif
>>>   #endif
>>>=20=20=20
>>> +#ifndef __ASSEMBLY__
>>> +static inline unsigned long virt_to_pfn(const void *kaddr)
>>> +{
>>> +	return __pa(kaddr) >> PAGE_SHIFT;
>>> +}
>>> +
>>> +static inline const void *pfn_to_kaddr(unsigned long pfn)
>>> +{
>>> +	return (const void *)(((unsigned long)__va(pfn)) << PAGE_SHIFT);
>>=20
>> Any reason to do it this way rather than:
>>=20
>> +       return __va(pfn << PAGE_SHIFT);
>
> Even cleaner:
>
> 	return __va(PFN_PHYS(pfn));

PFN_PHYS() includes a cast to phys_addr_t before shifting, so it's not
entirely equivalent.

But if phys_addr_t is larger than unsinged long then that cast is
important. Which makes me wonder how/if pfn_to_kaddr() has been working
until now for CONFIG_PHYS_ADDR_T_64BIT=3Dy.

cheers
