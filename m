Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E5443E120
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Oct 2021 14:43:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hg4wp5WZXz3c74
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Oct 2021 23:43:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=EC2UF6U3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::429;
 helo=mail-pf1-x429.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=EC2UF6U3; dkim-atps=neutral
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hg4w51Rqwz2xYD
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Oct 2021 23:42:45 +1100 (AEDT)
Received: by mail-pf1-x429.google.com with SMTP id p40so1010520pfh.8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Oct 2021 05:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=6PQW6JWfPIbBP7t63aTZtmVRFnuuhsz/GQNcoYw32N8=;
 b=EC2UF6U3fkt4UEJqrqOJ1nUJ9djgfmmtGIq0i9owv1f3QBn32OxbgQvb+7w1JqBpUC
 MlkWt3RmjuByiUyJ8dlsN+DhiIASfBz3xNBc4hAyeHZRNSlH5MJGHYwZCLCqWYfD4nn0
 Or2Cp26q2oYYm0ZqCDTSlqiCIP/M1APTvqwMErR6Sb1OOSJB02h18JlS+2qYsOzRlw91
 obvu2fPkdtfz13dcKgdnAer0tZIPE3R+1+9KDZskvnN4v3tfmCIoje6Yp6EluBHodrH+
 1OGhXRpe5VxZvfxBDFhnchZurlBDStazC21VTowm/6muZcMIxLR74bJ0TiFuaxdb6dk9
 clmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=6PQW6JWfPIbBP7t63aTZtmVRFnuuhsz/GQNcoYw32N8=;
 b=ZF3TQFgbxfPol8BOBVbYP2CvQY0mizKHUjcidt2IEBS1i+iCYv6WZIlTiEu90mS/3m
 5As3JeS/CDb8floT+u/A2kT8c2BZ+v+Oo7cy7iSBrpLzRW2rBTiMigs8LWBHdGDsrwAe
 eEEaMc9g05xwn4/t7oaMqzlG02RLgxUBXdBOSNf7HJYU4ux59aY9nT/dpxZu+w9xo2DW
 f/y4IGKzci7dttzUNRdmxStrMzbzZAEYuTRf4G6s664Etp9dCl6W0k/HNk4AxvT+V7KA
 dp2gUam6fsHHmq5abLsGoAxM8eQhNjKl3kTT3RO9x+T3EyXPynzR91mXnHSlJcqe/fjb
 8AKg==
X-Gm-Message-State: AOAM532+pKFAb/D8ClZ0hGLAavIY47/9vWDxTgBQ+E6FvKYRkSdhK/wO
 Pds9M+bUSUtJfB/QkakyfA8=
X-Google-Smtp-Source: ABdhPJwUcbNbEfODglMisuwSzHSt0l9qk8xpDd1tOj2SPz1hxqRsuLOQ4/AEWbRBdv+ctyc9WM+gnQ==
X-Received: by 2002:a05:6a00:1995:b0:47c:1f59:a27a with SMTP id
 d21-20020a056a00199500b0047c1f59a27amr4011588pfl.36.1635424961684; 
 Thu, 28 Oct 2021 05:42:41 -0700 (PDT)
Received: from localhost ([118.208.159.180])
 by smtp.gmail.com with ESMTPSA id t14sm2716101pga.62.2021.10.28.05.42.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 05:42:41 -0700 (PDT)
Date: Thu, 28 Oct 2021 22:42:36 +1000
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
 <1635413197.83rhc4s3fc.astroid@bobo.none>
In-Reply-To: <1635413197.83rhc4s3fc.astroid@bobo.none>
MIME-Version: 1.0
Message-Id: <1635423479.x693enqtx2.astroid@bobo.none>
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

Excerpts from Nicholas Piggin's message of October 28, 2021 7:35 pm:
> Excerpts from Jacques de Laval's message of October 28, 2021 7:08 pm:
>> On Thursday, October 28th, 2021 at 5:01 AM, Nicholas Piggin <npiggin@gma=
il.com> wrote:
>>> Excerpts from Jacques de Laval's message of October 27, 2021 10:03 pm:
>>>
>>> > On Wednesday, October 27th, 2021 at 9:52 AM, Christophe Leroy christo=
phe.leroy@csgroup.eu wrote:
>>> >
>>> > > Le 27/10/2021 =C3=A0 09:47, Nicholas Piggin a =C3=A9crit :
>>> > >
>>> > > > You're right. In that case it shouldn't change anything unless th=
ere
>>> > > >
>>> > > > was a BO fault. I'm not sure what the problem is then. Guessing b=
ased
>>> > > >
>>> > > > on the NIP and instructions, it looks like it's probably got the =
correct
>>> > > >
>>> > > > user address that it's storing into vmf on the stack, so it has g=
ot past
>>> > > >
>>> > > > the access checks so my theory would be wrong anyway.
>>> > > >
>>> > > > Must be something simple but I can't see it yet.
>>> > >
>>> > > Anyway, I think it is still worth doing the check with setting 0 in
>>> > >
>>> > > _ESR(r11), maybe the Reference Manual is wrong.
>>> > >
>>> > > So Jacques, please do the test anyway if you can.
>>> > >
>>> > > Thanks
>>> > >
>>> > > Christophe
>>> >
>>> > I tested with the last patch from Nicholas, and with that I can not
>>> >
>>> > reproduce the issue, so it seems like that solves it for my case and =
setup
>>> >
>>> > at least.
>>> >
>>> > Big thanks Christophe and Nicholas for looking in to this!
>>>
>>> Thanks for reporting and testing. We can certainly send this patch
>>>
>>> upstream to fix the regression, but I'm still not exactly sure what is
>>>
>>> going on. If it is an errata or part of specification we missed that
>>>
>>> could explain it but it would be good to understand and comment it.
>>>
>>> If you have time to test again with only the following patch applied,
>>>
>>> it might give a better clue. This patch should keep running but it
>>>
>>> would print some dmesg output.
>>>
>>> Thanks,
>>>
>>> Nick
>>>
>>> diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
>>>
>>> index a8d0ce85d39a..cf56f23ff90a 100644
>>>
>>> --- a/arch/powerpc/mm/fault.c
>>>
>>> +++ b/arch/powerpc/mm/fault.c
>>>
>>> @@ -548,6 +548,12 @@ static __always_inline void __do_page_fault(struct=
 pt_regs *regs)
>>>
>>> DEFINE_INTERRUPT_HANDLER(do_page_fault)
>>>
>>> {
>>>
>>> -   if (TRAP(regs) =3D=3D INTERRUPT_INST_STORAGE) {
>>>
>>> -         if (regs->dsisr !=3D 0) {
>>>
>>>
>>> -         	printk("ISI pc:%lx msr:%lx dsisr:%lx ESR:%lx\\n", regs->nip,=
 regs->msr, regs->dsisr, mfspr(SPRN_ESR));
>>>
>>>
>>> -         	regs->dsisr =3D 0; // fix?
>>>
>>>
>>> -         }
>>>
>>>
>>> -   }
>>>
>>>     __do_page_fault(regs);
>>>
>>>     }
>>>
>>=20
>> As expected it keeps running. The output, and number of prints is natura=
lly
>> a bit different from time to time, but dsisr/ESR is always 0x800000.
>>=20
>> Here's a representative output from one run:
>>=20
>> 	ISI pc:b789e6c0 msr:2d002 dsisr:800000 ESR:800000
>> 	ISI pc:b7884220 msr:2d002 dsisr:800000 ESR:800000
>> 	ISI pc:b78c18a4 msr:2d002 dsisr:800000 ESR:800000
>> 	ISI pc:55a238 msr:2f902 dsisr:800000 ESR:800000
>> 	ISI pc:412380 msr:2f902 dsisr:800000 ESR:800000
>> 	ISI pc:3aabe0 msr:2f902 dsisr:800000 ESR:800000
>> 	ISI pc:47a0e0 msr:2f902 dsisr:800000 ESR:800000
>> 	ISI pc:443290 msr:2f902 dsisr:800000 ESR:800000
>> 	ISI pc:43b350 msr:2d002 dsisr:800000 ESR:800000
>=20
> Great, thanks for testing that is interesting.
>=20
> Looking a bit more,
>=20
> https://www.nxp.com/files-static/32bit/doc/ref_manual/EREF_RM.pdf
>=20
> This is the manual for e500 family including e5500.
>=20
> Table 8-4. Interrupt Summary by IVOR shows ISI interrupt as affecting=20
> ESR register with [PT], this means the PT bit may be set. There is no
> BO bit specified here.
>=20
> The architecture (and this manual) says that if an interrupt type=20
> affects one of the ESR bits then all others are cleared. However if
> we look at the 4.8.7 Exception Syndrome Register (ESR) definition,
> the PT bit is specified with <E.PT>. This means it is implemented if
> the processor supports the E.PT extension.
>=20
> According to this table, the e5500 does not support E.PT.
> https://www.linux-kvm.org/page/E500_virtual_CPU_specification
>=20
> So it seems possible that a processor which does not support E.PT and=20
> therefore ISI will never set any bits in ESR, will not zero the ESR
> when it takes an ISI intrrupt, without violating the specification.
>=20
> It looks like that is what is happening here, ESR is being left from
> a previous store DSI.

Actually it could be another explanation, it takes a instruction=20
TLB error interrupt first which always sets no ESR bits, and then
it jumps to the ISI handler without clearing ESR.

I have not actually worked out why it is causing an infinite loop,
it doesn't seem to be the main fault handler, maybe it is some
low level TLB or PTE code, I can't get a kernel to boot under
quemu due to some bug, but a 64-bit kernel does not cause the problem if=20
you manually add ESR_DST into dsisr on instruction faults. Don't really
need to know that exactly though, it's clearly a bug.

Thanks,
Nick
