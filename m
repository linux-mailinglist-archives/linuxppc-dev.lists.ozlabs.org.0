Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A2CC843DD6E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Oct 2021 11:09:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hg09y4R0Hz3c4w
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Oct 2021 20:09:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail header.b=d4y5XmoJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=protonmail.com (client-ip=185.70.40.133;
 helo=mail-40133.protonmail.ch; envelope-from=jacques.delaval@protonmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256
 header.s=protonmail header.b=d4y5XmoJ; 
 dkim-atps=neutral
Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch
 [185.70.40.133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hg09J03tsz2xDf
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Oct 2021 20:08:51 +1100 (AEDT)
Date: Thu, 28 Oct 2021 09:08:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail; t=1635412118;
 bh=X6j1u0BPYukzlaXGfkSueu1ZaT9snTLB09s/BBK5s3w=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=d4y5XmoJKhQkGXGhEs5Ij2nQOMPj+2mJJ8GF+tIGz7KP7QuE/pCaBNlyQ7+HgaX57
 7/Z6saO46sbKvfo5ugAClUqh+xJYLYf1zn2CZLmJWPAoqqS6xHt/5jT9zVbJTl7r7g
 lvW7s0tHWvtQzC42LFlNCoqKksKB2FP30cjFhbXY=
To: Nicholas Piggin <npiggin@gmail.com>
From: Jacques de Laval <jacques.delaval@protonmail.com>
Subject: Re: instruction storage exception handling
Message-ID: <VFoVC_F_r-pD62fs3PMz16KfdtzX-4Sa6QajxxabOAnilDnV_olPSFbVVmYsWUeH4BUxcI7YaJ4RnKKhdqhqOLEopCeFZrqEcjJLyJlyX_I=@protonmail.com>
In-Reply-To: <1635389034.knz9p2g41k.astroid@bobo.none>
References: <uqZVxyE3l9oalZp_hyXFJvdH-ADNTvpOuQeoNGyqrUcoNgh9afea1-FzfZKMgiaF5WxY4kdMQlJYzmjvdQ2E2joF86-mEcaxdifht9z8NA0=@protonmail.com>
 <1635306738.0z8wt7619v.astroid@bobo.none>
 <1f5c24de-6bba-d6c0-5b8e-3522f25158f6@csgroup.eu>
 <1635312278.p87nvl11rv.astroid@bobo.none>
 <4ee635f5-7a67-bac5-2ad2-616c1aaa95b6@csgroup.eu>
 <1635318932.od1ierwsis.astroid@bobo.none>
 <f5824237-4fd4-ca87-afe7-620a23d84824@csgroup.eu>
 <V0kJsLgxvO-1SWRhS-9Nbx1E6oXO6IAJDAYBUA_kieAbf5J8MOnrRzdAiCSl2KoRjztnI3LitFLsJstAOVnWZ-4PBzWmrpTiqIYnU7TRXyo=@protonmail.com>
 <1635389034.knz9p2g41k.astroid@bobo.none>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Jacques de Laval <jacques.delaval@protonmail.com>
Cc: Scott Wood <oss@buserror.net>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thursday, October 28th, 2021 at 5:01 AM, Nicholas Piggin <npiggin@gmail.=
com> wrote:
> Excerpts from Jacques de Laval's message of October 27, 2021 10:03 pm:
>
> > On Wednesday, October 27th, 2021 at 9:52 AM, Christophe Leroy christoph=
e.leroy@csgroup.eu wrote:
> >
> > > Le 27/10/2021 =C3=A0 09:47, Nicholas Piggin a =C3=A9crit :
> > >
> > > > You're right. In that case it shouldn't change anything unless ther=
e
> > > >
> > > > was a BO fault. I'm not sure what the problem is then. Guessing bas=
ed
> > > >
> > > > on the NIP and instructions, it looks like it's probably got the co=
rrect
> > > >
> > > > user address that it's storing into vmf on the stack, so it has got=
 past
> > > >
> > > > the access checks so my theory would be wrong anyway.
> > > >
> > > > Must be something simple but I can't see it yet.
> > >
> > > Anyway, I think it is still worth doing the check with setting 0 in
> > >
> > > _ESR(r11), maybe the Reference Manual is wrong.
> > >
> > > So Jacques, please do the test anyway if you can.
> > >
> > > Thanks
> > >
> > > Christophe
> >
> > I tested with the last patch from Nicholas, and with that I can not
> >
> > reproduce the issue, so it seems like that solves it for my case and se=
tup
> >
> > at least.
> >
> > Big thanks Christophe and Nicholas for looking in to this!
>
> Thanks for reporting and testing. We can certainly send this patch
>
> upstream to fix the regression, but I'm still not exactly sure what is
>
> going on. If it is an errata or part of specification we missed that
>
> could explain it but it would be good to understand and comment it.
>
> If you have time to test again with only the following patch applied,
>
> it might give a better clue. This patch should keep running but it
>
> would print some dmesg output.
>
> Thanks,
>
> Nick
>
> diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
>
> index a8d0ce85d39a..cf56f23ff90a 100644
>
> --- a/arch/powerpc/mm/fault.c
>
> +++ b/arch/powerpc/mm/fault.c
>
> @@ -548,6 +548,12 @@ static __always_inline void __do_page_fault(struct p=
t_regs *regs)
>
> DEFINE_INTERRUPT_HANDLER(do_page_fault)
>
> {
>
> -   if (TRAP(regs) =3D=3D INTERRUPT_INST_STORAGE) {
>
> -         if (regs->dsisr !=3D 0) {
>
>
> -         =09printk("ISI pc:%lx msr:%lx dsisr:%lx ESR:%lx\\n", regs->nip,=
 regs->msr, regs->dsisr, mfspr(SPRN_ESR));
>
>
> -         =09regs->dsisr =3D 0; // fix?
>
>
> -         }
>
>
> -   }
>
>     __do_page_fault(regs);
>
>     }
>

As expected it keeps running. The output, and number of prints is naturally
a bit different from time to time, but dsisr/ESR is always 0x800000.

Here's a representative output from one run:

=09ISI pc:b789e6c0 msr:2d002 dsisr:800000 ESR:800000
=09ISI pc:b7884220 msr:2d002 dsisr:800000 ESR:800000
=09ISI pc:b78c18a4 msr:2d002 dsisr:800000 ESR:800000
=09ISI pc:55a238 msr:2f902 dsisr:800000 ESR:800000
=09ISI pc:412380 msr:2f902 dsisr:800000 ESR:800000
=09ISI pc:3aabe0 msr:2f902 dsisr:800000 ESR:800000
=09ISI pc:47a0e0 msr:2f902 dsisr:800000 ESR:800000
=09ISI pc:443290 msr:2f902 dsisr:800000 ESR:800000
=09ISI pc:43b350 msr:2d002 dsisr:800000 ESR:800000

Thanks,
Jacques
