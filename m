Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AECCF51E5BA
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 May 2022 10:50:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KwLjq3yDKz3c7s
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 May 2022 18:50:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.126.130; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KwLjL1vzjz3bXg
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 May 2022 18:49:57 +1000 (AEST)
Received: from mail-yb1-f182.google.com ([209.85.219.182]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1Mrh9Y-1o8FPF0yyy-00nj77 for <linuxppc-dev@lists.ozlabs.org>; Sat, 07 May
 2022 10:49:49 +0200
Received: by mail-yb1-f182.google.com with SMTP id g28so16616137ybj.10
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 07 May 2022 01:49:48 -0700 (PDT)
X-Gm-Message-State: AOAM530hoAPeyJyOYAxuJeOWGPCZXoxDjy9OPxIfBA5TVFftBp8Y4ySb
 imtm5H74Lut8l43lpDgk/M9bwSYxre9O68vTW1A=
X-Google-Smtp-Source: ABdhPJzU/kokkyU4Ow0IuLOE+iQhWFkk4ZE0WMAv0gv2/fvi3qr5K21WMxPcMZht90sRTBchezYcKmQ2te8bG3LT0Jg=
X-Received: by 2002:a25:cdc7:0:b0:648:f57d:c0ed with SMTP id
 d190-20020a25cdc7000000b00648f57dc0edmr5436777ybf.480.1651913387633; Sat, 07
 May 2022 01:49:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210825064228.70487-1-deng.changcheng@zte.com.cn>
 <8735hsvzig.fsf@mpe.ellerman.id.au>
 <e2310273-8bc8-deac-9a80-0d1587acecb1@csgroup.eu>
In-Reply-To: <e2310273-8bc8-deac-9a80-0d1587acecb1@csgroup.eu>
From: Arnd Bergmann <arnd@arndb.de>
Date: Sat, 7 May 2022 10:49:31 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3s8GUtUUt-7BvUEajEDDAJMH7yJNCaUF8hdhjfmf_f7Q@mail.gmail.com>
Message-ID: <CAK8P3a3s8GUtUUt-7BvUEajEDDAJMH7yJNCaUF8hdhjfmf_f7Q@mail.gmail.com>
Subject: Re: [PATCH linux-next] power:pkeys: fix bugon.cocci warnings
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:aazqT2DsH0Tq1jGrKD5eJCBcehCFm6PdjvPUym2WHyJfxhyncMX
 y4s7eGOqMONrsTygNDiSlex91An3pz6qmSw/NGWKVbL1NfWnI23imN2lVYXKs81HSuWKc+B
 VAjX2cBrprkpr0oAWKNZY6zqpYMHyYJX/rRSQ0sb3LEeIfXd7tJmbY/EgWjQW+evi8AokoK
 FUCG9Tjrs7wGslmjcXAjw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:bZJK3YYyBv0=:dIfCG62YroAsHAp+uVxIQ9
 bf638jENtBrpqBLh9dDLgaheeLyC285XTPYHX58fb5Ll1hDTlvDm11CMnNp1Xs5jQGNWJeWOY
 iot/nrO146bAEJ45t4GCMiV67/aEBSD23fhkk7D9Q8PT5Ua9eUfc7pIYnz5JYM7LiHLmuNa9G
 dCpzD77giUSLkxPfDiSEf+PqLouzsWGiqRzDdHWtUSK6VymtOzcq62YdqfoQ2tA9uNDMN23wS
 NBjsvxsbDmb0OzYbanB1ZO46AZNdvWJg1I+/7VFj9TSLld6+M2XbcHGuD7drGx1gcGAWUrFjX
 mxC/ElftcewJCrfm7RSInd9WYQ0eN5kx0YmzRtHqRt57r9S7w9pTlVca9mxtdyoK1hbyEqCrH
 jkY+jDgn0x6RH5d2nJgl++Hebqvcdhuu5MLCooOJrIiYPLCofJHIDFA2TEq1UM4xEB129YwXm
 XJwIyYZN1i+on1+a8+Df85nZn/qq995X4XGaRNrVajqFqcmicjkoIDPO+VXxA0Gnm5bM3X3TL
 o461flMJYNuSMBUX778OwIwyeIwFFBBK+N+ygUL7ZKMcjK1g31BxcWls5Jzo7zugEDZY5+5By
 mMwjBFMl3OKq1f//ok1mvHa8Zk6QhTUeMtsCo2+lH+5wnT0Qi3/+cqX7P6GIfV+UJVYym02/M
 tE6BpfNG2xRSKsb9Y0/llh2/p0ftiVLXCZATy21Pj8smApJfFcHKhMNpxXAObPQP+9m3I2+wM
 wCePHBOO073pi/rFlA7tECy64cD2Z2G/2Kqvvih5E5fn6u+S+L3HWDvaKS2g6LgYM0gb3H1nL
 yTEIf0kFwmZzCP7ev618Hdo4+B/qbYq/3zamblHGQPIV0XlcqY=
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
Cc: CGEL <cgel.zte@gmail.com>, Jing Yangyang <jing.yangyang@zte.com.cn>,
 Zeal Robot <zealci@zte.com.cn>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>, Sandipan Das <sandipan@linux.ibm.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, May 7, 2022 at 9:04 AM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
> Le 02/05/2022 =C3=A0 15:24, Michael Ellerman a =C3=A9crit :
> > CGEL <cgel.zte@gmail.com> writes:
> >> From: Jing Yangyang <jing.yangyang@zte.com.cn>
> >>
> >> Use BUG_ON instead of a if condition followed by BUG.
> >>
> >> ./arch/powerpc/include/asm/book3s/64/pkeys.h:21:2-5:WARNING
> >> Use BUG_ON instead of if condition followed by BUG.
> >> ./arch/powerpc/include/asm/book3s/64/pkeys.h:14:2-5:WARNING
> >> Use BUG_ON instead of if condition followed by BUG.
> >>
> >> Generated by: scripts/coccinelle/misc/bugon.cocci
> >>
> >> Reported-by: Zeal Robot <zealci@zte.com.cn>
> >> Signed-off-by: Jing Yangyang <jing.yangyang@zte.com.cn>
> >> ---
> >>   arch/powerpc/include/asm/book3s/64/pkeys.h | 6 ++----
> >>   1 file changed, 2 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/arch/powerpc/include/asm/book3s/64/pkeys.h b/arch/powerpc=
/include/asm/book3s/64/pkeys.h
> >> index 5b17813..5f74f0c 100644
> >> --- a/arch/powerpc/include/asm/book3s/64/pkeys.h
> >> +++ b/arch/powerpc/include/asm/book3s/64/pkeys.h
> >> @@ -10,15 +10,13 @@ static inline u64 vmflag_to_pte_pkey_bits(u64 vm_f=
lags)
> >>      if (!mmu_has_feature(MMU_FTR_PKEY))
> >>              return 0x0UL;
> >>
> >> -    if (radix_enabled())
> >> -            BUG();
> >> +    BUG_ON(radix_enabled());
> >>      return hash__vmflag_to_pte_pkey_bits(vm_flags);
> >>   }
> >>
> >>   static inline u16 pte_to_pkey_bits(u64 pteflags)
> >>   {
> >> -    if (radix_enabled())
> >> -            BUG();
> >> +    BUG_ON(radix_enabled());
> >>      return hash__pte_to_pkey_bits(pteflags);
> >>   }
> >
> > Have you checked how this changes the generated code?
> >
> > radix_enabled() is a jump label, via mmu_feature().
> >
> > Possibly the compiler just works it all out and generates the same code=
,
> > but I'd want some evidence of that before merging this.
>
> Seems like the compiler is not that good, the generated code for test1()
> is much better than the one for test2(), see below.
>
> void test1(void)
> {
>         if (radix_enabled())
>                 BUG();
> }
>
> void test2(void)
> {
>         BUG_ON(radix_enabled());
> }
>
> 0000000000000900 <.test1>:
>   900:  60 00 00 00     nop
>   904:  0f e0 00 00     twui    r0,0
>   908:  60 00 00 00     nop
>   90c:  60 00 00 00     nop
>   910:  4e 80 00 20     blr
>   914:  60 00 00 00     nop
>   918:  60 00 00 00     nop
>   91c:  60 00 00 00     nop
>
> 0000000000000920 <.test2>:
>   920:  60 00 00 00     nop
>   924:  39 20 00 01     li      r9,1
>   928:  0b 09 00 00     tdnei   r9,0
>   92c:  4e 80 00 20     blr
>   930:  39 20 00 00     li      r9,0
>   934:  0b 09 00 00     tdnei   r9,0
>   938:  4e 80 00 20     blr
>
>
> We should keep things as they are and change the coccinelle script.

Maybe just drop the custom ppc64 BUG_ON() then if it creates worse
code? The default BUG_ON() should be equivalent to the open-coded
version.

        Arnd
