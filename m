Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9214343DDD9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Oct 2021 11:36:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hg0mq3Pvvz307x
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Oct 2021 20:36:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=RvS2PO3H;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::430;
 helo=mail-pf1-x430.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=RvS2PO3H; dkim-atps=neutral
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hg0m65cfNz2yK6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Oct 2021 20:35:32 +1100 (AEDT)
Received: by mail-pf1-x430.google.com with SMTP id l203so5434794pfd.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Oct 2021 02:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=HSLbNniqF+HOC3K7infnccdoUVGMoHgQbqjevIDidFY=;
 b=RvS2PO3HFL2g5MhTDR6KLbPjhK9vjjMHJP7HA6LrOR/uxdsghqJqusOxWiMnsRyUvN
 jW9HtG7VstE0M45pN6gc0CJg9/y0AhP9BecmfFTkWVLeYqlgThXKuW7dVXlrAXXEnL64
 vKE2igPHnOFjkCvjRTRuXavJtbptrXv5rFdDcvNinzCZxwIoV6FxKJpeRO8bh/q4RLde
 chHH905rQtmm7xbx4q/UFa/ytm1iu1+o5o3oXKsXGSh7ojQzwRAMaMix9BuKjPVVdx/7
 hXtIFcgFaNMQU3V/afoTXkibaTfVdaisz9dYyvrVurlRdKuL2ppngF01PI0CT/7tYF3W
 9AAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=HSLbNniqF+HOC3K7infnccdoUVGMoHgQbqjevIDidFY=;
 b=2NK9vMrImDyC41xF80v5ZNNWUy6NGsglkmCpZOv0sqgiaSLIsOKh/8pyCcX7DdMICq
 WeeSP8ttIyLUXEaWaTD0yOVcITKw+0Yy4Olt9SNGJ/4cuNXKq4IdJT/clsha5BrY2guG
 aXd8TyIbKtK4MfcoSyZ0suGFLMsZ/iosx+mILe2hZgDd0JP1QBQ+5/5cb4bXs5avk4gA
 D49vVMjl0rrm3nPDas8DLwvkbXRMfv75j7/8o+O0Zb6i6ezUdEsolG1IH9WJmdfw8ZZa
 Kd3whML13wMsPWBaYkPgBcwPVQLH+tk/ebFhd+JBF69gfuSwmP3BpNgIWSwM90cytv/U
 ErDg==
X-Gm-Message-State: AOAM533UQ7JLXt2133S9vBbpqxVv4rfyHiU3QUHvoaU+G2721HwhaEBq
 uKIew57U4XRR/WBTHN7Eb/I=
X-Google-Smtp-Source: ABdhPJyV2/61Fyc9rIr5DV7yKIYHyRmnz8v18BXry13Y83ydkk6X1NIest4Q6tiL/RFzAVJn537I3A==
X-Received: by 2002:a63:d80c:: with SMTP id b12mr2362462pgh.331.1635413727964; 
 Thu, 28 Oct 2021 02:35:27 -0700 (PDT)
Received: from localhost ([118.208.159.180])
 by smtp.gmail.com with ESMTPSA id w1sm9248625pjd.1.2021.10.28.02.35.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 02:35:27 -0700 (PDT)
Date: Thu, 28 Oct 2021 19:35:22 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: instruction storage exception handling
To: Jacques de Laval <jacques.delaval@protonmail.com>
References: <uqZVxyE3l9oalZp_hyXFJvdH-ADNTvpOuQeoNGyqrUcoNgh9afea1-FzfZKMgiaF5WxY4kdMQlJYzmjvdQ2E2joF86-mEcaxdifht9z8NA0=@protonmail.com>
 <1635306738.0z8wt7619v.astroid@bobo.none>
 <1f5c24de-6bba-d6c0-5b8e-3522f25158f6@csgroup.eu>
 <1635312278.p87nvl11rv.astroid@bobo.none>
 <4ee635f5-7a67-bac5-2ad2-616c1aaa95b6@csgroup.eu>
 <1635318932.od1ierwsis.astroid@bobo.none>
 <f5824237-4fd4-ca87-afe7-620a23d84824@csgroup.eu>
 <V0kJsLgxvO-1SWRhS-9Nbx1E6oXO6IAJDAYBUA_kieAbf5J8MOnrRzdAiCSl2KoRjztnI3LitFLsJstAOVnWZ-4PBzWmrpTiqIYnU7TRXyo=@protonmail.com>
 <1635389034.knz9p2g41k.astroid@bobo.none>
 <VFoVC_F_r-pD62fs3PMz16KfdtzX-4Sa6QajxxabOAnilDnV_olPSFbVVmYsWUeH4BUxcI7YaJ4RnKKhdqhqOLEopCeFZrqEcjJLyJlyX_I=@protonmail.com>
In-Reply-To: <VFoVC_F_r-pD62fs3PMz16KfdtzX-4Sa6QajxxabOAnilDnV_olPSFbVVmYsWUeH4BUxcI7YaJ4RnKKhdqhqOLEopCeFZrqEcjJLyJlyX_I=@protonmail.com>
MIME-Version: 1.0
Message-Id: <1635413197.83rhc4s3fc.astroid@bobo.none>
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
Cc: Scott Wood <oss@buserror.net>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Jacques de Laval's message of October 28, 2021 7:08 pm:
> On Thursday, October 28th, 2021 at 5:01 AM, Nicholas Piggin <npiggin@gmai=
l.com> wrote:
>> Excerpts from Jacques de Laval's message of October 27, 2021 10:03 pm:
>>
>> > On Wednesday, October 27th, 2021 at 9:52 AM, Christophe Leroy christop=
he.leroy@csgroup.eu wrote:
>> >
>> > > Le 27/10/2021 =C3=A0 09:47, Nicholas Piggin a =C3=A9crit :
>> > >
>> > > > You're right. In that case it shouldn't change anything unless the=
re
>> > > >
>> > > > was a BO fault. I'm not sure what the problem is then. Guessing ba=
sed
>> > > >
>> > > > on the NIP and instructions, it looks like it's probably got the c=
orrect
>> > > >
>> > > > user address that it's storing into vmf on the stack, so it has go=
t past
>> > > >
>> > > > the access checks so my theory would be wrong anyway.
>> > > >
>> > > > Must be something simple but I can't see it yet.
>> > >
>> > > Anyway, I think it is still worth doing the check with setting 0 in
>> > >
>> > > _ESR(r11), maybe the Reference Manual is wrong.
>> > >
>> > > So Jacques, please do the test anyway if you can.
>> > >
>> > > Thanks
>> > >
>> > > Christophe
>> >
>> > I tested with the last patch from Nicholas, and with that I can not
>> >
>> > reproduce the issue, so it seems like that solves it for my case and s=
etup
>> >
>> > at least.
>> >
>> > Big thanks Christophe and Nicholas for looking in to this!
>>
>> Thanks for reporting and testing. We can certainly send this patch
>>
>> upstream to fix the regression, but I'm still not exactly sure what is
>>
>> going on. If it is an errata or part of specification we missed that
>>
>> could explain it but it would be good to understand and comment it.
>>
>> If you have time to test again with only the following patch applied,
>>
>> it might give a better clue. This patch should keep running but it
>>
>> would print some dmesg output.
>>
>> Thanks,
>>
>> Nick
>>
>> diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
>>
>> index a8d0ce85d39a..cf56f23ff90a 100644
>>
>> --- a/arch/powerpc/mm/fault.c
>>
>> +++ b/arch/powerpc/mm/fault.c
>>
>> @@ -548,6 +548,12 @@ static __always_inline void __do_page_fault(struct =
pt_regs *regs)
>>
>> DEFINE_INTERRUPT_HANDLER(do_page_fault)
>>
>> {
>>
>> -   if (TRAP(regs) =3D=3D INTERRUPT_INST_STORAGE) {
>>
>> -         if (regs->dsisr !=3D 0) {
>>
>>
>> -         	printk("ISI pc:%lx msr:%lx dsisr:%lx ESR:%lx\\n", regs->nip, =
regs->msr, regs->dsisr, mfspr(SPRN_ESR));
>>
>>
>> -         	regs->dsisr =3D 0; // fix?
>>
>>
>> -         }
>>
>>
>> -   }
>>
>>     __do_page_fault(regs);
>>
>>     }
>>
>=20
> As expected it keeps running. The output, and number of prints is natural=
ly
> a bit different from time to time, but dsisr/ESR is always 0x800000.
>=20
> Here's a representative output from one run:
>=20
> 	ISI pc:b789e6c0 msr:2d002 dsisr:800000 ESR:800000
> 	ISI pc:b7884220 msr:2d002 dsisr:800000 ESR:800000
> 	ISI pc:b78c18a4 msr:2d002 dsisr:800000 ESR:800000
> 	ISI pc:55a238 msr:2f902 dsisr:800000 ESR:800000
> 	ISI pc:412380 msr:2f902 dsisr:800000 ESR:800000
> 	ISI pc:3aabe0 msr:2f902 dsisr:800000 ESR:800000
> 	ISI pc:47a0e0 msr:2f902 dsisr:800000 ESR:800000
> 	ISI pc:443290 msr:2f902 dsisr:800000 ESR:800000
> 	ISI pc:43b350 msr:2d002 dsisr:800000 ESR:800000

Great, thanks for testing that is interesting.

Looking a bit more,

https://www.nxp.com/files-static/32bit/doc/ref_manual/EREF_RM.pdf

This is the manual for e500 family including e5500.

Table 8-4. Interrupt Summary by IVOR shows ISI interrupt as affecting=20
ESR register with [PT], this means the PT bit may be set. There is no
BO bit specified here.

The architecture (and this manual) says that if an interrupt type=20
affects one of the ESR bits then all others are cleared. However if
we look at the 4.8.7 Exception Syndrome Register (ESR) definition,
the PT bit is specified with <E.PT>. This means it is implemented if
the processor supports the E.PT extension.

According to this table, the e5500 does not support E.PT.
https://www.linux-kvm.org/page/E500_virtual_CPU_specification

So it seems possible that a processor which does not support E.PT and=20
therefore ISI will never set any bits in ESR, will not zero the ESR
when it takes an ISI intrrupt, without violating the specification.

It looks like that is what is happening here, ESR is being left from
a previous store DSI.

Thanks,
Nick
