Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DF81E253D7B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Aug 2020 08:09:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BcXNz1J8bzDqc6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Aug 2020 16:09:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BcXMM5JHwzDqMn
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Aug 2020 16:07:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=q5xjA01W; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BcXML6TWyz9sRK;
 Thu, 27 Aug 2020 16:07:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1598508462;
 bh=44uY6wuEUM9I0JSFoXE1y1Uy0dwu2ymTti2d/hjXB9Q=;
 h=From:To:Subject:In-Reply-To:References:Date:From;
 b=q5xjA01W3XD/TpFExMucgl8Kri5f+Ef7AP9pCxS/DNeYTKW91Auy3P2tubG3me3K2
 qWyWAZje2GB3pVju7H/Kw6mDMujUnwSZZBkQkW2KMi3k46JzNFdhgPtMs2YDQ4rC3B
 POEZ8aqWMNLIYkhuR+PtLzhoT2oyXZJqPUHNE+QfFqPqB/XS7Bp67VkB79XqEhNB2g
 5CXaXMMh15tJkKGyFc4wi9rYnuwXpJdWcDrtxwq5tqXXgeEzluv18u1FGARDgAAKcE
 K2qA8YVj/U3EchXV21UlLwNP+LdZrmYDX8CWPxD3Bv2yb9JJ4wvKUQWr4AvMLbrYBi
 jyG0oLrUO1qbA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Pratik Sampat <psampat@linux.ibm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, linuxppc-dev@lists.ozlabs.org,
 npiggin@gmail.com, mikey@neuling.org, ego@linux.vnet.ibm.com,
 svaidy@linux.ibm.com, linux-kernel@vger.kernel.org, pratik.r.sampat@gmail.com
Subject: Re: [PATCH] Revert "powerpc/powernv/idle: Replace CPU feature check
 with PVR check"
In-Reply-To: <170e1919-bc45-6b99-dc4d-713418c98be1@linux.ibm.com>
References: <20200826082918.89306-1-psampat@linux.ibm.com>
 <1fb7fcef-a39d-d36e-35d5-021a5c9ea82c@csgroup.eu>
 <170e1919-bc45-6b99-dc4d-713418c98be1@linux.ibm.com>
Date: Thu, 27 Aug 2020 16:07:39 +1000
Message-ID: <87imd439lg.fsf@mpe.ellerman.id.au>
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Pratik Sampat <psampat@linux.ibm.com> writes:
> On 26/08/20 2:07 pm, Christophe Leroy wrote:
>> Le 26/08/2020 =C3=A0 10:29, Pratik Rajesh Sampat a =C3=A9crit=C2=A0:
>>> Cpuidle stop state implementation has minor optimizations for P10
>>> where hardware preserves more SPR registers compared to P9.
>>> The current P9 driver works for P10, although does few extra
>>> save-restores. P9 driver can provide the required power management
>>> features like SMT thread folding and core level power savings
>>> on a P10 platform.
>>>
>>> Until the P10 stop driver is available, revert the commit which
>>> allows for only P9 systems to utilize cpuidle and blocks all
>>> idle stop states for P10.
>>> Cpu idle states are enabled and tested on the P10 platform
>>> with this fix.
>>>
>>> This reverts commit 8747bf36f312356f8a295a0c39ff092d65ce75ae.
>>>
>>> Fixes: 8747bf36f312 ("powerpc/powernv/idle: Replace CPU feature check=20
>>> with PVR check")
>>> Signed-off-by: Pratik Rajesh Sampat <psampat@linux.ibm.com>
>>> ---
>>> =C2=A0 @mpe: This revert would resolve a staging issue wherein the P10 =
stop
>>> =C2=A0 driver is not yet ready while cpuidle stop states need not be bl=
ocked
>>> =C2=A0 on 5.9 for Power10 systems which could cause SMT folding related
>>> =C2=A0 performance issues.
>>>
>>> =C2=A0 The P10 stop driver is in the works here:
>>> https://lists.ozlabs.org/pipermail/linuxppc-dev/2020-August/216773.html
>>>
>>> =C2=A0 arch/powerpc/platforms/powernv/idle.c | 2 +-
>>> =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/arch/powerpc/platforms/powernv/idle.c=20
>>> b/arch/powerpc/platforms/powernv/idle.c
>>> index 77513a80cef9..345ab062b21a 100644
>>> --- a/arch/powerpc/platforms/powernv/idle.c
>>> +++ b/arch/powerpc/platforms/powernv/idle.c
>>> @@ -1223,7 +1223,7 @@ static void __init pnv_probe_idle_states(void)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>> =C2=A0 -=C2=A0=C2=A0=C2=A0 if (pvr_version_is(PVR_POWER9))
>>> +=C2=A0=C2=A0=C2=A0 if (cpu_has_feature(CPU_FTR_ARCH_300))
>>
>> Why not something like:
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0if (pvr_version_is(PVR_POWER9) || pvr_version_is=
(PVR_POWER10))
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pnv_power9_idle_init();=20
>
> In order to use PVR_POWER10 I would need to define it under
> arch/powerpc/include/asm/reg.h, which is not present in 5.9 yet.
>
> However, if it okay with @mpe I could split out Nick's P10 stop driver
> (https://lists.ozlabs.org/pipermail/linuxppc-dev/2020-August/216773.html)
> into two parts:

I'll just take this for now, it's the simplest option.

cheers
