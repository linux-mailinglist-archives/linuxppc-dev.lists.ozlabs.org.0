Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE5010570C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Nov 2019 17:27:35 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47JlMm1hqczDq75
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Nov 2019 03:27:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47JlKT5457zDqxh
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Nov 2019 03:25:32 +1100 (AEDT)
Received: from localhost (mailhub1-ext [192.168.12.233])
 by localhost (Postfix) with ESMTP id 47JlKK4v2fz9tyYX;
 Thu, 21 Nov 2019 17:25:25 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id ZzcxYupBwo2Z; Thu, 21 Nov 2019 17:25:25 +0100 (CET)
Received: from vm-hermes.si.c-s.fr (vm-hermes.si.c-s.fr [192.168.25.253])
 by pegase1.c-s.fr (Postfix) with ESMTP id 47JlKK3y07z9tyYW;
 Thu, 21 Nov 2019 17:25:25 +0100 (CET)
Received: by vm-hermes.si.c-s.fr (Postfix, from userid 33)
 id 38943C08; Thu, 21 Nov 2019 17:25:29 +0100 (CET)
Received: from 37-167-57-154.coucou-networks.fr
 (37-167-57-154.coucou-networks.fr [37.167.57.154]) by messagerie.si.c-s.fr
 (Horde Framework) with HTTP; Thu, 21 Nov 2019 17:25:29 +0100
Date: Thu, 21 Nov 2019 17:25:29 +0100
Message-ID: <20191121172529.Horde.0uDMS4xQ-xexjp4a2mIoXQ5@messagerie.si.c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [Y2038] [PATCH 07/23] y2038: vdso: powerpc: avoid timespec
 references
References: <20191108210236.1296047-1-arnd@arndb.de>
 <20191108210824.1534248-7-arnd@arndb.de>
 <4faa78cd0a86cf5d0aea9bb16d03145c5745450b.camel@codethink.co.uk>
 <CAK8P3a1nRq98ngfKnR2Du+7_vOxSRFD9AyjHyUCsAtk_gLR_Uw@mail.gmail.com>
In-Reply-To: <CAK8P3a1nRq98ngfKnR2Du+7_vOxSRFD9AyjHyUCsAtk_gLR_Uw@mail.gmail.com>
User-Agent: Internet Messaging Program (IMP) H5 (6.2.3)
Content-Type: text/plain; charset=UTF-8; format=flowed; DelSp=Yes
MIME-Version: 1.0
Content-Disposition: inline
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
Cc: Ben Hutchings <ben.hutchings@codethink.co.uk>,
 y2038 Mailman List <y2038@lists.linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, Paul Mackerras <paulus@samba.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Allison Randal <allison@lohutok.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Arnd Bergmann <arnd@arndb.de> a =C3=A9crit=C2=A0:

> On Wed, Nov 20, 2019 at 11:43 PM Ben Hutchings
> <ben.hutchings@codethink.co.uk> wrote:
>>
>> On Fri, 2019-11-08 at 22:07 +0100, Arnd Bergmann wrote:
>> [...]
>> > --- a/arch/powerpc/kernel/vdso32/gettimeofday.S
>> > +++ b/arch/powerpc/kernel/vdso32/gettimeofday.S
>> > @@ -15,10 +15,8 @@
>> >  /* Offset for the low 32-bit part of a field of long type */
>> >  #if defined(CONFIG_PPC64) && defined(CONFIG_CPU_BIG_ENDIAN)
>> >  #define LOPART       4
>> > -#define TSPEC_TV_SEC TSPC64_TV_SEC+LOPART
>> >  #else
>> >  #define LOPART       0
>> > -#define TSPEC_TV_SEC TSPC32_TV_SEC
>> >  #endif
>> >
>> >       .text
>> > @@ -192,7 +190,7 @@ V_FUNCTION_BEGIN(__kernel_time)
>> >       bl      __get_datapage@local
>> >       mr      r9, r3                  /* datapage ptr in r9 */
>> >
>> > -     lwz     r3,STAMP_XTIME+TSPEC_TV_SEC(r9)
>> > +     lwz     r3,STAMP_XTIME_SEC+LOWPART(r9)
>>
>> "LOWPART" should be "LOPART".
>>
>
> Thanks, fixed both instances in a patch on top now. I considered folding
> it into the original patch, but as it's close to the merge window I'd
> rather not rebase it, and this way I also give you credit for=20=20
>=20finding the bug.

Take care, might conflict with=20=20
https://github.com/linuxppc/linux/commit/5e381d727fe8834ca5a126f510194a7a4a=
c6dd3a

Christophe

>
>=20I'm surprised that the 0-day bot did not report this already.
>
> Thanks fro the careful review!
>
>         Arnd
>
> commit 1c11ca7a0584ddede5b8c93057b40d31e8a96d3d (HEAD)
> Author: Arnd Bergmann <arnd@arndb.de>
> Date:   Thu Nov 21 15:19:49 2019 +0100
>
>     y2038: fix typo in powerpc vdso "LOPART"
>
>     The earlier patch introduced a typo, change LOWPART back to
>     LOPART.
>
>     Fixes: 176ed98c8a76 ("y2038: vdso: powerpc: avoid timespec references=
")
>     Reported-by: Ben Hutchings <ben.hutchings@codethink.co.uk>
>     Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>
> diff --git a/arch/powerpc/kernel/vdso32/gettimeofday.S
> b/arch/powerpc/kernel/vdso32/gettimeofday.S
> index a7180b0f4aa1..c8e6902cb01b 100644
> --- a/arch/powerpc/kernel/vdso32/gettimeofday.S
> +++ b/arch/powerpc/kernel/vdso32/gettimeofday.S
> @@ -190,7 +190,7 @@ V_FUNCTION_BEGIN(__kernel_time)
>         bl      __get_datapage@local
>         mr      r9, r3                  /* datapage ptr in r9 */
>
> -       lwz     r3,STAMP_XTIME_SEC+LOWPART(r9)
> +       lwz     r3,STAMP_XTIME_SEC+LOPART(r9)
>
>         cmplwi  r11,0                   /* check if t is NULL */
>         beq     2f
> @@ -266,7 +266,7 @@ __do_get_tspec:
>          * as a 32.32 fixed-point number in r3 and r4.
>          * Load & add the xtime stamp.
>          */
> -       lwz     r5,STAMP_XTIME_SEC+LOWPART(r9)
> +       lwz     r5,STAMP_XTIME_SEC+LOPART(r9)
>
>         lwz     r6,STAMP_SEC_FRAC(r9)
>         addc    r4,r4,r6
>         adde    r3,r3,r5


