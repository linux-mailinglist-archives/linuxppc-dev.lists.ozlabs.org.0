Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B05116F84BD
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 May 2023 16:20:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QCXrs3jXYz3fKP
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 May 2023 00:20:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rrWotNDg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rrWotNDg;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QCXqz5pGhz3cf6
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 May 2023 00:19:27 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CF35C63E69
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 May 2023 14:19:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41908C433EF
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 May 2023 14:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683296364;
	bh=KpIe59zRdayzAPsW23Rvp3nC0jltzxuo5pdJnPjUNCk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=rrWotNDgyWCYd4yuhJG+0lw7DRViLgzX6DkUdYut+4nem75woOJDSReoq453V+Len
	 Uw6ygTJZGmMC0xQ96NlFr+m+8iMRLDKYT2VBNIEsWM6fL3SW1d/Hh2gvNiKmaLaV0u
	 2LumZoaKLW9U/+qE77kfUH5mjT9ipRGDxXIjoigPXYQJwnMz30/g7a1B7h2zNBZsJR
	 8qeYF7yuc42HEq6JviodCo1lbczV8uGwFf0V87DwJpuxVFP7f4aBl9zJmKqOnOGEkH
	 3ZZz8qUGkk0h5tMaJGS2byYiRmPBRCZURE8t0wSQ5kSAHJyfjIiEyf5WbFyo5/u3l3
	 XqZ1JhQ6I3JAA==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-4f122ff663eso2077388e87.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 May 2023 07:19:24 -0700 (PDT)
X-Gm-Message-State: AC+VfDxqg2meHl3hHfPkOJsWw1JR1DrwmMnAD0rwOPZP7TBW0enSxkRA
	vN9fIjE6FBDw/J5eBlHWoPp962EKoRu8gHcleQ==
X-Google-Smtp-Source: ACHHUZ6xjPrTfUk8yFDsZmYtovvCeO8T4kHF3SSwfg5aGyNZTdjYDghAXtH5dZh91MEtHVXZyYtmcMY7S+vyRYVm82s=
X-Received: by 2002:a05:6512:38af:b0:4ea:fa26:2378 with SMTP id
 o15-20020a05651238af00b004eafa262378mr549544lft.23.1683296362294; Fri, 05 May
 2023 07:19:22 -0700 (PDT)
MIME-Version: 1.0
References: <CAL_JsqLZhWZqS7mcyvAEu=m_TmkoZ5V4h54Jh25+Ms0J1_z9Fw@mail.gmail.com>
 <77078121-46E6-48D6-9D73-0C6D586FE410@xenosoft.de> <CAL_JsqL0553MTttABaPkL3WFjp-XG_4RtVab1QMsxUiMQC3Ysw@mail.gmail.com>
 <cc227ae6-262c-dea5-f181-db5d6828cc90@xenosoft.de>
In-Reply-To: <cc227ae6-262c-dea5-f181-db5d6828cc90@xenosoft.de>
From: Rob Herring <robh@kernel.org>
Date: Fri, 5 May 2023 09:19:09 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKR39RcUtKoK7cVNKz9+8z=7pqd9=gzZUtOvsmsg8kHzA@mail.gmail.com>
Message-ID: <CAL_JsqKR39RcUtKoK7cVNKz9+8z=7pqd9=gzZUtOvsmsg8kHzA@mail.gmail.com>
Subject: Re: [PASEMI NEMO] Boot issue with the PowerPC updates 6.4-1
To: Christian Zigotzky <chzigotzky@xenosoft.de>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Darren Stevens <darren@stevens-zone.net>, "R.T.Dickinson" <rtd2@xtra.co.nz>, Olof Johansson <olof@lixom.net>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, May 4, 2023 at 11:52=E2=80=AFPM Christian Zigotzky
<chzigotzky@xenosoft.de> wrote:
>
> On 03 May 2023 at 08:15 pm, Rob Herring wrote:
> > On Wed, May 3, 2023 at 12:40=E2=80=AFPM Christian Zigotzky
> > <chzigotzky@xenosoft.de> wrote:
> >>
> >>
> >>> On 3. May 2023, at 18:51, Rob Herring <robh@kernel.org> wrote:
> >>>
> >>> =EF=BB=BFOn Wed, May 3, 2023 at 11:27=E2=80=AFAM Christophe Leroy
> >>> <christophe.leroy@csgroup.eu> wrote:
> >>>> +Rob as he's the commit's Author.
> >>>>
> >>>>> Le 03/05/2023 =C3=A0 17:46, Christian Zigotzky a =C3=A9crit :
> >>>>> On 02 May 2023 at 11:28 am, Michael Ellerman wrote:
> >>>>>> Christian Zigotzky <chzigotzky@xenosoft.de> writes:
> >>>>>>> Hello,
> >>>>>>>
> >>>>>>> Our PASEMI Nemo board [1] doesn't boot with the PowerPC updates 6=
.4-1
> >>>>>>> [2].
> >>>>>>>
> >>>>>>> The kernel hangs right after the booting Linux via __start() @
> >>>>>>> 0x0000000000000000 ...
> >>>>>>>
> >>>>>>> I was able to revert the PowerPC updates 6.4-1 [2] with the follo=
wing
> >>>>>>> command: git revert 70cc1b5307e8ee3076fdf2ecbeb89eb973aa0ff7 -m 1
> >>>>>>>
> >>>>>>> After a re-compiling, the kernel boots without any problems witho=
ut the
> >>>>>>> PowerPC updates 6.4-1 [2].
> >>>>>>>
> >>>>>>> Could you please explain me, what you have done in the boot area?
> >>>>>> There's a few possibilities, but nothing obvious.
> >>>>>>
> >>>>>> To begin with can you please test the following commits?
> >>>>>>
> >>>>>> 77e69ee7ce07
> >>>>>> e4ab08be5b49
> >>>>>> eeac8ede1755
> >>>>>>
> >>>>>> cheers
> >>>>> git revert e4ab08be5b4902e5b350b0e1e1a3c25eb21d76d4
> >>>>>
> >>>>> [master 0086e2cbbec0] Revert "powerpc/isa-bridge: Remove open coded
> >>>>> "ranges" parsing"
> >>>>>   1 file changed, 129 insertions(+), 37 deletions(-)
> >>>>>
> >>>>> After a recompiling it boots without any problems.
> >>>>>
> >>>>> e4ab08be5b49 -- powerpc/isa-bridge: Remove open coded "ranges" pars=
ing
> >>>>> is the bad commit.
> >>> Could I get a DT file for this board?
> >>>
> >>> In the meantime, just revert this commit. I don't think I'll be able
> >>> to fix it before I'm out on sabbatical.
> >>>
> >>> Rob
> >> FYI:
> >>
> >> Darren Stevens wrote:
> >>
> >> The dtb passed by the CFE firmware has a number of issues, which up ti=
ll
> >> now have been fixed by use of patches applied to the mainline kernel.
> >> This occasionally causes problems with changes made to mainline.
> > Changing the firmware is not the only way to modify the DT. Perhaps a
> > DT overlay would work better than carrying patches if the patches
> > aren't upstreamable. It kind of depends on how early you'd need to
> > apply the overlay and whether you'd need external phandles (aka
> > __symbols__ node, which the base DTB wouldn't support).
> >
> > Looking at the DT, I think this change might fix it. Can you test this =
change:
> >
> > diff --git a/drivers/of/address.c b/drivers/of/address.c
> > index e692809ff822..475b74413fdd 100644
> > --- a/drivers/of/address.c
> > +++ b/drivers/of/address.c
> > @@ -284,7 +284,7 @@ EXPORT_SYMBOL(of_range_to_resource);
> >
> >   static int of_bus_isa_match(struct device_node *np)
> >   {
> > -       return of_node_name_eq(np, "isa");
> > +       return of_node_is_type(np, "isa") || of_node_name_eq(np, "isa")=
;
> >   }
> >
> >   static void of_bus_isa_count_cells(struct device_node *child,
> I tested this patch today but unfortunately the Nemo board doesn't boot.

Do you have a dmesg log with debug enabled for a successful boot? I
searched archives and forum, but couldn't find one. isa-bridge.c has
debug enabled so you should get a few messages.

From looking at the DT, the isa node has no ranges, so the difference
in parsing code shouldn't even matter. You should be seeing this
message:

        printk(KERN_ERR "no ISA IO ranges or unexpected isa range, "
               "mapping 64k\n");

Rob
