Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE42347F61
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Mar 2021 18:33:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F5Fgm5D3yz3bv2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Mar 2021 04:33:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=T66PHbzA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=robh@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=T66PHbzA; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F5FgL1Slcz301y
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Mar 2021 04:32:46 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3B08761A19
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Mar 2021 17:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616607163;
 bh=vwFmLhIbpBit7slP5Tgq8iugG6lF7uxqcxCcj5anb1s=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=T66PHbzA4HZLyDpwGOkX+dflulPJCr9OD+q4niugzUsfMiI9RRAGz5n7CWXc2WtXR
 XbuhrFmqKLpIwxKmUJDvEVxs0mhwEIxcXsqNURnI1d7/3eFvgOm8abHDCM49/H3Bcf
 qvL2xptThHPDmYcaGptEqEHOkGjiA6p0x7zd8Yv9Vcd68HCUOSUZFJDQAGNgtHdf8Q
 rRu34o4uRbPglSg1LqlwqUB3wXov+O83CJ50wVik8yYYAo0m4PxVbBJR5qtZ7tTQ46
 E7J01J6cM1sxGhyKXm6t2MC4vKiuIMFxUa4kcLH4QmvCSF/wB32I2fLk7RvUSZZCGe
 Poh8Mv+K1J1hw==
Received: by mail-ed1-f43.google.com with SMTP id bx7so28559363edb.12
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Mar 2021 10:32:43 -0700 (PDT)
X-Gm-Message-State: AOAM532mQoR8aIhbjfI8Edk1PFJiDhrD3RENC1hVxSzklBFwyRr4PLmG
 JrzRwwNyo0lXOQjs3ncpfYPzxtX9lR/0+3ORKA==
X-Google-Smtp-Source: ABdhPJy7YCVuRWwXQo13DaEdS0eUAv22DscISVepsqz2isMzM1EIDsAzWe5iU1QCiAYfFd5rzpKJR8h0mAzTPfMAUrg=
X-Received: by 2002:aa7:d3d8:: with SMTP id o24mr4667708edr.165.1616607161795; 
 Wed, 24 Mar 2021 10:32:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210309000247.2989531-4-danielwa@cisco.com>
 <5f865584-09c9-d21f-ffb7-23cf07cf058e@csgroup.eu>
 <20210309212944.GR109100@zorba>
 <e4899874-1684-fa1b-443e-f4e478e05e31@csgroup.eu>
In-Reply-To: <e4899874-1684-fa1b-443e-f4e478e05e31@csgroup.eu>
From: Rob Herring <robh@kernel.org>
Date: Wed, 24 Mar 2021 11:32:30 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKm76jRQYDcu3rGyUWKPLspoO=EZW_WFy=zAK+m_JYCTg@mail.gmail.com>
Message-ID: <CAL_JsqKm76jRQYDcu3rGyUWKPLspoO=EZW_WFy=zAK+m_JYCTg@mail.gmail.com>
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

On Wed, Mar 24, 2021 at 11:01 AM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
>
>
> Le 09/03/2021 =C3=A0 22:29, Daniel Walker a =C3=A9crit :
> > On Tue, Mar 09, 2021 at 08:47:09AM +0100, Christophe Leroy wrote:
> >>
> >>
> >> Le 09/03/2021 =C3=A0 01:02, Daniel Walker a =C3=A9crit :
> >>> This is a scripted mass convert of the config files to use
> >>> the new generic cmdline. There is a bit of a trim effect here.
> >>> It would seems that some of the config haven't been trimmed in
> >>> a while.
> >>
> >> If you do that in a separate patch, you loose bisectability.
> >>
> >> I think it would have been better to do things in a different way, mor=
e or less like I did in my series:
> >> 1/ Provide GENERIC cmdline at the same functionnality level as what is
> >> spread in the different architectures
> >> 2/ Convert architectures to the generic with least churn.
> >> 3/ Add new features to the generic
> >
> > You have to have the churn eventually, no matter how you do it. The onl=
y way you
> > don't have churn is if you never upgrade the feature set.
> >
> >
> >>>
> >>> The bash script used to convert is as follows,
> >>>
> >>> if [[ -z "$1" || -z "$2" ]]; then
> >>>           echo "Two arguments are needed."
> >>>           exit 1
> >>> fi
> >>> mkdir $1
> >>> cp $2 $1/.config
> >>> sed -i 's/CONFIG_CMDLINE=3D/CONFIG_CMDLINE_BOOL=3Dy\nCONFIG_CMDLINE_P=
REPEND=3D/g' $1/.config
> >>
> >> This is not correct.
> >>
> >> By default, on powerpc the provided command line is used only if the b=
ootloader doesn't provide one.
> >>
> >> Otherwise:
> >> - the builtin command line is appended to the one provided by the boot=
loader
> >> if CONFIG_CMDLINE_EXTEND is selected
> >> - the builtin command line replaces to the one provided by the bootloa=
der if
> >> CONFIG_CMDLINE_FORCE is selected
> >
> > I think my changes maintain most of this due to the override of
> > CONFIG_CMDLINE_PREPEND. This is an upgrade and the inflexibility in pow=
erpc is
> > an example of why these changes were created in the first place.
>
> "inflexibility in powerpc" : Can you elaborate ?
>
> >
> > For example , say the default command line is "root=3D/dev/issblk0" fro=
m iss476
> > platform. And the bootloader adds "root=3D/dev/sda1"
> >
> > The result is <prepend><bootloader><append>.
>
>
> I'm still having hard time understanding the benefit of having both <prep=
end> and <append>.
> Could you please provide a complete exemple from real life, ie what exact=
ly the problem is and what
> it solves ?

It doesn't matter. We already have both cases and 'extend' has meant either=
 one.

What someone wants is policy and the kernel shouldn't be defining the polic=
y.

Rob
