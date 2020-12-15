Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B3872DAAC3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Dec 2020 11:23:01 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CwDq53vsLzDqLD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Dec 2020 21:22:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CwDmm15j4zDqJB
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Dec 2020 21:20:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=XuUNGud1; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 4CwDml2lwBz9sSC; Tue, 15 Dec 2020 21:20:55 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4CwDml1JC0z9s1l;
 Tue, 15 Dec 2020 21:20:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1608027655;
 bh=aDY6UDQd3VX3/H30f3vYtd6WG7C5F1CGvqI1Ldh8h+Q=;
 h=From:To:Subject:In-Reply-To:References:Date:From;
 b=XuUNGud1+bJamSuAVRFD/7Y/EoDYEI6y56Qd/PNu/ikoRk806doxT0KJs+Y+eYNEs
 DWHqarUD1f1UMD4sswhO0GMItI0nWuLoV8y7qaLIbvBPnWoImvUsvcbIg7uRWptWdM
 19DFX05c1H4b5vkyo+s96Ezt+Fux29uBfviRkTVTXDaauCqDdyssUo6c3mcDesmjoC
 s3tBfRtKgHByB9ZP5LQLlbSzsnCHeQgNWpruwW6T7D8y7GmgeYkSO56GbRFxA6YHux
 yeNnQu+yAhRJresm3lYpoAp+wAk2wxBq7GOWYPwm8qJCpfr1m//1xfdopyRvHcaR/I
 gtKxHkq0L0yAA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, linuxppc-dev@ozlabs.org
Subject: Re: [PATCH] powerpc: Inline setup_kup()
In-Reply-To: <1ff11fdc-3274-5be3-6968-14084874e212@csgroup.eu>
References: <20201214123011.311024-1-mpe@ellerman.id.au>
 <09e673ec-6d4e-2e8d-b843-018ce94142a4@csgroup.eu>
 <87czzbzvyg.fsf@mpe.ellerman.id.au>
 <1ff11fdc-3274-5be3-6968-14084874e212@csgroup.eu>
Date: Tue, 15 Dec 2020 21:20:53 +1100
Message-ID: <878s9zz7y2.fsf@mpe.ellerman.id.au>
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

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Le 15/12/2020 =C3=A0 02:42, Michael Ellerman a =C3=A9crit=C2=A0:
>> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
>>> Le 14/12/2020 =C3=A0 13:30, Michael Ellerman a =C3=A9crit=C2=A0:
>>>> setup_kup() is used by both 64-bit and 32-bit code. However on 64-bit
>>>> it must not be __init, because it's used for CPU hotplug, whereas on
>>>> 32-bit it should be __init because it calls setup_kuap/kuep() which
>>>> are __init.
>>>>
>>>> We worked around that problem in the past by marking it __ref, see
>>>> commit 67d53f30e23e ("powerpc/mm: fix section mismatch for
>>>> setup_kup()").
>>>>
>>>> Marking it __ref basically just omits it from section mismatch
>>>> checking, which can lead to bugs, and in fact it did, see commit
>>>> 44b4c4450f8d ("powerpc/64s: Mark the kuap/kuep functions non __init")
>>>>
>>>> We can avoid all these problems by just making it static inline.
>>>> Because all it does is call other functions, making it inline actually
>>>> shrinks the 32-bit vmlinux by ~76 bytes.
>>>>
>>>> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
>>>> ---
>>>>    arch/powerpc/include/asm/kup.h | 8 ++++++--
>>>>    arch/powerpc/mm/init-common.c  | 6 ------
>>>>    2 files changed, 6 insertions(+), 8 deletions(-)
>>>>
>>>> diff --git a/arch/powerpc/include/asm/kup.h b/arch/powerpc/include/asm=
/kup.h
>>>> index 5a9820c54da9..46b12c6dc728 100644
>>>> --- a/arch/powerpc/include/asm/kup.h
>>>> +++ b/arch/powerpc/include/asm/kup.h
>>>> @@ -49,8 +49,6 @@ extern bool disable_kuap;
>>>>=20=20=20=20
>>>>    #include <linux/pgtable.h>
>>>>=20=20=20=20
>>>> -void setup_kup(void);
>>>> -
>>>>    #ifdef CONFIG_PPC_KUEP
>>>>    void setup_kuep(bool disabled);
>>>>    #else
>>>> @@ -85,6 +83,12 @@ static inline void restore_user_access(unsigned lon=
g flags) { }
>>>>    #endif /* CONFIG_PPC_BOOK3S_64 */
>>>>    #endif /* CONFIG_PPC_KUAP */
>>>>=20=20=20=20
>>>> +static inline void setup_kup(void)
>>>
>>> Should it be __always_inline ?
>>=20
>> Yes I guess so, will fix. Thanks for reviewing.
>>=20
>
> While we are talking about __always_inline, do you plan to take the follo=
wing patch this cycle ?
>
> https://patchwork.ozlabs.org/project/linuxppc-dev/patch/a1d31f84ddb092681=
3b17fcd5cc7f3fa7b4deac2.1602759123.git.christophe.leroy@csgroup.eu/

I intended to, will grab it now.

cheers
