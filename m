Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E6E36F5DB8
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 May 2023 20:16:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QBQ9z1rPQz3ch2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 May 2023 04:16:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mer6bfy+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mer6bfy+;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QBQ963d0xz3cB1
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 May 2023 04:15:22 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 971D162F3D
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 May 2023 18:15:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0471CC433EF
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 May 2023 18:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683137718;
	bh=8snOKEd5b1mc7VHMShQuz4jLg16mkFXVZvJfb3jfcqU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=mer6bfy+TTGh31KgI3StsBQDICv2P+Sye2EpV6jvyVHBxyRB27CdiQClLtL80L1wz
	 d5gBLGBYTXV8IZg6mDCAGBMZTqou8HtB5IzgxQ4UPj53Xn33pCVOdkq7YDmgXsGA1E
	 hua6ntS6oAs/SzX8eYVSj1OfigF1JixhkTUnNYgID8ndRyh7Sj1Ylfi9afAZGmleXO
	 YR8cDZ+4xPNfsi0imX2we3HaAiyNULEnB4W8OBK79g0vWWulTUq3JWpzoM9qdXDiM/
	 m1DUeRIi0I9GR/b4iljIAjugSDVCSAWM1YDEMulsvdECztFU7xJ52yHxsoBAx9FKNd
	 mNzt5OVl62/Qg==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2ac70c975fcso13638931fa.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 May 2023 11:15:17 -0700 (PDT)
X-Gm-Message-State: AC+VfDzhDygC+abrqGaNCiY/9+cmdPrXAVXlG+8OjM0aP8y0nL+ue7XL
	BacfhRRU99L6gCjiwr3LNM508GgqCdak4hO/4Q==
X-Google-Smtp-Source: ACHHUZ6Njclb5swNtHRW34r+7MwGNHGGJwCQMv7bn/RgnXsYhdPGPbiE/frIg2fdb5FZdG2HfYOxb/hR65j8+hgQCyQ=
X-Received: by 2002:a2e:9bca:0:b0:2a8:bc4e:594f with SMTP id
 w10-20020a2e9bca000000b002a8bc4e594fmr244458ljj.20.1683137716053; Wed, 03 May
 2023 11:15:16 -0700 (PDT)
MIME-Version: 1.0
References: <CAL_JsqLZhWZqS7mcyvAEu=m_TmkoZ5V4h54Jh25+Ms0J1_z9Fw@mail.gmail.com>
 <77078121-46E6-48D6-9D73-0C6D586FE410@xenosoft.de>
In-Reply-To: <77078121-46E6-48D6-9D73-0C6D586FE410@xenosoft.de>
From: Rob Herring <robh@kernel.org>
Date: Wed, 3 May 2023 13:15:03 -0500
X-Gmail-Original-Message-ID: <CAL_JsqL0553MTttABaPkL3WFjp-XG_4RtVab1QMsxUiMQC3Ysw@mail.gmail.com>
Message-ID: <CAL_JsqL0553MTttABaPkL3WFjp-XG_4RtVab1QMsxUiMQC3Ysw@mail.gmail.com>
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

On Wed, May 3, 2023 at 12:40=E2=80=AFPM Christian Zigotzky
<chzigotzky@xenosoft.de> wrote:
>
>
>
> > On 3. May 2023, at 18:51, Rob Herring <robh@kernel.org> wrote:
> >
> > =EF=BB=BFOn Wed, May 3, 2023 at 11:27=E2=80=AFAM Christophe Leroy
> > <christophe.leroy@csgroup.eu> wrote:
> >>
> >> +Rob as he's the commit's Author.
> >>
> >>> Le 03/05/2023 =C3=A0 17:46, Christian Zigotzky a =C3=A9crit :
> >>> On 02 May 2023 at 11:28 am, Michael Ellerman wrote:
> >>>> Christian Zigotzky <chzigotzky@xenosoft.de> writes:
> >>>>> Hello,
> >>>>>
> >>>>> Our PASEMI Nemo board [1] doesn't boot with the PowerPC updates 6.4=
-1
> >>>>> [2].
> >>>>>
> >>>>> The kernel hangs right after the booting Linux via __start() @
> >>>>> 0x0000000000000000 ...
> >>>>>
> >>>>> I was able to revert the PowerPC updates 6.4-1 [2] with the followi=
ng
> >>>>> command: git revert 70cc1b5307e8ee3076fdf2ecbeb89eb973aa0ff7 -m 1
> >>>>>
> >>>>> After a re-compiling, the kernel boots without any problems without=
 the
> >>>>> PowerPC updates 6.4-1 [2].
> >>>>>
> >>>>> Could you please explain me, what you have done in the boot area?
> >>>> There's a few possibilities, but nothing obvious.
> >>>>
> >>>> To begin with can you please test the following commits?
> >>>>
> >>>> 77e69ee7ce07
> >>>> e4ab08be5b49
> >>>> eeac8ede1755
> >>>>
> >>>> cheers
> >>> git revert e4ab08be5b4902e5b350b0e1e1a3c25eb21d76d4
> >>>
> >>> [master 0086e2cbbec0] Revert "powerpc/isa-bridge: Remove open coded
> >>> "ranges" parsing"
> >>>  1 file changed, 129 insertions(+), 37 deletions(-)
> >>>
> >>> After a recompiling it boots without any problems.
> >>>
> >>> e4ab08be5b49 -- powerpc/isa-bridge: Remove open coded "ranges" parsin=
g
> >>> is the bad commit.
> >
> > Could I get a DT file for this board?
> >
> > In the meantime, just revert this commit. I don't think I'll be able
> > to fix it before I'm out on sabbatical.
> >
> > Rob
>
> FYI:
>
> Darren Stevens wrote:
>
> The dtb passed by the CFE firmware has a number of issues, which up till
> now have been fixed by use of patches applied to the mainline kernel.
> This occasionally causes problems with changes made to mainline.

Changing the firmware is not the only way to modify the DT. Perhaps a
DT overlay would work better than carrying patches if the patches
aren't upstreamable. It kind of depends on how early you'd need to
apply the overlay and whether you'd need external phandles (aka
__symbols__ node, which the base DTB wouldn't support).

Looking at the DT, I think this change might fix it. Can you test this chan=
ge:

diff --git a/drivers/of/address.c b/drivers/of/address.c
index e692809ff822..475b74413fdd 100644
--- a/drivers/of/address.c
+++ b/drivers/of/address.c
@@ -284,7 +284,7 @@ EXPORT_SYMBOL(of_range_to_resource);

 static int of_bus_isa_match(struct device_node *np)
 {
-       return of_node_name_eq(np, "isa");
+       return of_node_is_type(np, "isa") || of_node_name_eq(np, "isa");
 }

 static void of_bus_isa_count_cells(struct device_node *child,
