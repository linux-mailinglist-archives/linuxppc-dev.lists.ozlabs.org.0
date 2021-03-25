Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E06134933F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Mar 2021 14:46:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F5mbd4V9yz3bwK
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Mar 2021 00:46:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=R92Bx0fq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=robh@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=R92Bx0fq; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F5mbC1WsWz301Y
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Mar 2021 00:45:59 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id AC38261A1E
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Mar 2021 13:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616679957;
 bh=Wa6/rM9ja442iXJV64DujnU8oEP6I6Jf3CVDtM9/i+g=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=R92Bx0fqbzYkm8Er3iQNKVrTeQmKU6F6bj3hicyw3raObpYhvb1Q36/30NF+6Jls1
 r2qRxcrX5cZWBw41nb5fpAEdOsRCRz7lwltRpAxL5hDLahItz+E7A5oZSUsStWWjSO
 mUbAUu5h7IycV2aQau/SEyRKXAJWNEFHCDaDt2d/E6F9b2jPTxSwwi620R/eXr28xK
 ofxuAmNzm1wcohZoxMiPKZXvTahzlWDYLFVraXZzUnmUiEerLpmtUz/brzNbaB9Muk
 Jl41LObyMgGMcUR25NAEnSFk46QOmcoBLUKsR0CmoLYqNHF3wbsmd2pm7NrIxshYNz
 GDtyTXqXof6hg==
Received: by mail-ej1-f45.google.com with SMTP id w3so3015385ejc.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Mar 2021 06:45:56 -0700 (PDT)
X-Gm-Message-State: AOAM533MzGGSvU0TvsRTBgx73Tu9ac72OcUhOzWvU94RxnkbyGZlO9yO
 kI/vt6v/AH++anXADJmY31FC0jk9u2uzn+INNQ==
X-Google-Smtp-Source: ABdhPJzrbmmUIm7f4YUAYsUZkVYauIE7ktUpFHMRo4/PQoiQ4okxsC+M9Sv9SxDungP1jD6RUs8DIYlDznCvrylYJ5Q=
X-Received: by 2002:a17:906:7f84:: with SMTP id
 f4mr9338699ejr.525.1616679955249; 
 Thu, 25 Mar 2021 06:45:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210309000247.2989531-4-danielwa@cisco.com>
 <5f865584-09c9-d21f-ffb7-23cf07cf058e@csgroup.eu>
 <20210309212944.GR109100@zorba>
 <e4899874-1684-fa1b-443e-f4e478e05e31@csgroup.eu>
 <CAL_JsqKm76jRQYDcu3rGyUWKPLspoO=EZW_WFy=zAK+m_JYCTg@mail.gmail.com>
 <20fd7d44-8c39-48bc-25c3-990be9d9d911@csgroup.eu>
In-Reply-To: <20fd7d44-8c39-48bc-25c3-990be9d9d911@csgroup.eu>
From: Rob Herring <robh@kernel.org>
Date: Thu, 25 Mar 2021 07:45:41 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKmUF_obwojLF1ia9+w7ba3yva2Vax=nth-BqKnirt99A@mail.gmail.com>
Message-ID: <CAL_JsqKmUF_obwojLF1ia9+w7ba3yva2Vax=nth-BqKnirt99A@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] powerpc: convert config files to generic cmdline
To: Christophe Leroy <christophe.leroy@csgroup.eu>
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
Cc: Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, X86 ML <x86@kernel.org>,
 "open list:MIPS" <linux-mips@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>, xe-linux-external@cisco.com,
 Andrew Morton <akpm@linux-foundation.org>, Will Deacon <will@kernel.org>,
 Daniel Walker <danielwa@cisco.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Mar 25, 2021 at 6:06 AM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
>
>
> Le 24/03/2021 =C3=A0 18:32, Rob Herring a =C3=A9crit :
> > On Wed, Mar 24, 2021 at 11:01 AM Christophe Leroy
> > <christophe.leroy@csgroup.eu> wrote:
> >>
> >>
> >>
> >> Le 09/03/2021 =C3=A0 22:29, Daniel Walker a =C3=A9crit :
> >>> On Tue, Mar 09, 2021 at 08:47:09AM +0100, Christophe Leroy wrote:
> >>>>
> >>>>
> >>>> Le 09/03/2021 =C3=A0 01:02, Daniel Walker a =C3=A9crit :
> >>>>> This is a scripted mass convert of the config files to use
> >>>>> the new generic cmdline. There is a bit of a trim effect here.
> >>>>> It would seems that some of the config haven't been trimmed in
> >>>>> a while.
> >>>>
> >>>> If you do that in a separate patch, you loose bisectability.
> >>>>
> >>>> I think it would have been better to do things in a different way, m=
ore or less like I did in my series:
> >>>> 1/ Provide GENERIC cmdline at the same functionnality level as what =
is
> >>>> spread in the different architectures
> >>>> 2/ Convert architectures to the generic with least churn.
> >>>> 3/ Add new features to the generic
> >>>
> >>> You have to have the churn eventually, no matter how you do it. The o=
nly way you
> >>> don't have churn is if you never upgrade the feature set.
> >>>
> >>>
> >>>>>
> >>>>> The bash script used to convert is as follows,
> >>>>>
> >>>>> if [[ -z "$1" || -z "$2" ]]; then
> >>>>>            echo "Two arguments are needed."
> >>>>>            exit 1
> >>>>> fi
> >>>>> mkdir $1
> >>>>> cp $2 $1/.config
> >>>>> sed -i 's/CONFIG_CMDLINE=3D/CONFIG_CMDLINE_BOOL=3Dy\nCONFIG_CMDLINE=
_PREPEND=3D/g' $1/.config
> >>>>
> >>>> This is not correct.
> >>>>
> >>>> By default, on powerpc the provided command line is used only if the=
 bootloader doesn't provide one.
> >>>>
> >>>> Otherwise:
> >>>> - the builtin command line is appended to the one provided by the bo=
otloader
> >>>> if CONFIG_CMDLINE_EXTEND is selected
> >>>> - the builtin command line replaces to the one provided by the bootl=
oader if
> >>>> CONFIG_CMDLINE_FORCE is selected
> >>>
> >>> I think my changes maintain most of this due to the override of
> >>> CONFIG_CMDLINE_PREPEND. This is an upgrade and the inflexibility in p=
owerpc is
> >>> an example of why these changes were created in the first place.
> >>
> >> "inflexibility in powerpc" : Can you elaborate ?
> >>
> >>>
> >>> For example , say the default command line is "root=3D/dev/issblk0" f=
rom iss476
> >>> platform. And the bootloader adds "root=3D/dev/sda1"
> >>>
> >>> The result is <prepend><bootloader><append>.
> >>
> >>
> >> I'm still having hard time understanding the benefit of having both <p=
repend> and <append>.
> >> Could you please provide a complete exemple from real life, ie what ex=
actly the problem is and what
> >> it solves ?
> >
> > It doesn't matter. We already have both cases and 'extend' has meant ei=
ther one.
> >
> > What someone wants is policy and the kernel shouldn't be defining the p=
olicy.
> >
>
> Ok, so you agree we don't need to provide two CMDLINE, one to be appended=
 and one to be prepended.

Well, I wasn't thinking about that part of it, but yes as long as no
arch currently needs that.

> Let's only provide once CMDLINE as of today, and ask the user to select w=
hether he wants it appended
> or prepended or replacee. Then no need to change all existing config to r=
ename CONFIG_CMDLINE into
> either of the new ones.
>
> That's the main difference between my series and Daniel's series. So I'll=
 finish taking Will's
> comment into account and we'll send out a v3 soon.

Great.

Rob
