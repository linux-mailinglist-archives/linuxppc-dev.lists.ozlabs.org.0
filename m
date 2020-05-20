Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D02731DA6D5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 May 2020 02:58:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49RZB945qYzDqXL
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 May 2020 10:58:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::52b;
 helo=mail-pg1-x52b.google.com; envelope-from=ndesaulniers@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=fmjUwFgw; dkim-atps=neutral
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49RZ8H5BXWzDqSv
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 May 2020 10:56:47 +1000 (AEST)
Received: by mail-pg1-x52b.google.com with SMTP id s10so665029pgm.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 May 2020 17:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=4px3yIRPnf0/cKP5GrJgepyNTj4AtOFyCwz+sEXMDAk=;
 b=fmjUwFgwRJchgZHeCDB+dObJEEJ0ZaSBC4MkZTrDvfVOaBp81OspYmLIlHiio4CIiG
 YIt/f+qRaufSSHVJVJrmH+PdI9lPabsG2AlI4rPIZp5xip5U0NnxBQythch+JgmZsBcH
 CoByT/2vnnJDa96l4GNN43pRWke/DTTFVDIgiNTH0q/NEloelhOAq/ZrOYjaLndhtnll
 3gNPlmbyUpMDFTth9uvn5jxdvysvSggV/h2AxVpaskYXuMP+X8zESUxZAoCQjT1dnrZ8
 QckOVhL5g/FeOyEIE3P4BLRSiEbfgG7DMFTD5zlA9aHT4HaV4vWtFm8J24jglwVDOwG1
 Lz7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=4px3yIRPnf0/cKP5GrJgepyNTj4AtOFyCwz+sEXMDAk=;
 b=U4nwJFaF8uLAqF9dUU/Nl4jzXcQW7xBRIhJ+P7YxV5h9BYvU9tHn8lj6bo9BkW7DG5
 Ea9UIRirN7axT7GZnD3cBw9RoydXYy156f105+gJViYiDb0uIvuLo2GVbLaLqlG9cB4x
 efFT+iAcl4d3iD7Vo0kt/3UQsXNH5LtarDJj+7bjkLuziH4GtiCYQ/ytVfe7Fo1ReDXK
 B/8C6mXz7y5P+n0X8fcvDF2iKrV+mL1FJ8UCLd90gOFx5ENs7QCT75ZdPbWInVIeuayx
 K6fSehfTKvA5xTwoMgIXOHRFMN/XDdKDRy4avTLU8TAe/yXVxGIRnIoeD86acsNeyX+U
 1Wvg==
X-Gm-Message-State: AOAM530MWXzFkLjd88pFrQZjO9eU1AuEeeIea+SoImu83ocAC0ixceki
 ieoeZZG2BcBYo8CdpevxrWbFXaJ32g9u/IjOZYsj4w==
X-Google-Smtp-Source: ABdhPJwGr2qa1S0cflXDtbfsMvMM0/GCLrcMN2prqHe0bXhJMAkAWge+PINf8jjJs+tsUX0SBH+Qn/O3WQ/XV9+Mvfc=
X-Received: by 2002:aa7:8084:: with SMTP id v4mr1725938pff.39.1589936203444;
 Tue, 19 May 2020 17:56:43 -0700 (PDT)
MIME-Version: 1.0
References: <ClangBuiltLinux/continuous-integration+164415390+broken@travis-ci.com>
 <5eb43a0c8d43d_13fb5db924ca0104770@travis-pro-tasks-6cc9887df6-4zmjd.mail>
 <CAKwvOdmendjEgurRBAyi4R0rDZRdwfHjddS_pfOQ6761XiiFMA@mail.gmail.com>
 <87d07fcdee.fsf@mpe.ellerman.id.au>
In-Reply-To: <87d07fcdee.fsf@mpe.ellerman.id.au>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 19 May 2020 17:56:32 -0700
Message-ID: <CAKwvOdn0Spc15v3WUE_rdrb5UvaTXmOvjEJOsD7ahktQOwQk+A@mail.gmail.com>
Subject: Re: Fwd: [CRON] Broken: ClangBuiltLinux/continuous-integration#1432
 (master - 0aceafc)
To: Michael Ellerman <mpe@ellerman.id.au>
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
Cc: clang-built-linux <clang-built-linux@googlegroups.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Looks like our CI is still red from this:

https://travis-ci.com/github/ClangBuiltLinux/continuous-integration/builds/=
166854584

Filing a bug to follow up on:
https://github.com/ClangBuiltLinux/linux/issues/1031

On Thu, May 7, 2020 at 8:29 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> Nick Desaulniers <ndesaulniers@google.com> writes:
> > Looks like ppc64le powernv_defconfig is suddenly failing the locking
> > torture tests, then locks up?
> > https://travis-ci.com/github/ClangBuiltLinux/continuous-integration/job=
s/329211572#L3111-L3167
> > Any recent changes related here in -next?  I believe this is the first
> > failure, so I'll report back if we see this again.
>
> Thanks for the report.
>
> There's nothing newly in next-20200507 that seems related.
>
> Odd that it just showed up.
>
> cheers
>
>
> > ---------- Forwarded message ---------
> > From: Travis CI <builds@travis-ci.com>
> > Date: Thu, May 7, 2020 at 9:40 AM
> > Subject: [CRON] Broken: ClangBuiltLinux/continuous-integration#1432 (ma=
ster
> > - 0aceafc)
> > To: <ndesaulniers@google.com>, <natechancellor@gmail.com>
> >
> >
> > ClangBuiltLinux
> >
> > /
> >
> > continuous-integration
> > <https://travis-ci.com/github/ClangBuiltLinux/continuous-integration?ut=
m_medium=3Dnotification&utm_source=3Demail>
> >
> > [image: branch icon]master
> > <https://github.com/ClangBuiltLinux/continuous-integration/tree/master>
> > [image: build has failed]
> > Build #1432 was broken
> > <https://travis-ci.com/github/ClangBuiltLinux/continuous-integration/bu=
ilds/164415390?utm_medium=3Dnotification&utm_source=3Demail>
> > [image: arrow to build time]
> > [image: clock icon]7 hrs, 0 mins, and 54 secs
> >
> > [image: Nick Desaulniers avatar]Nick Desaulniers
> > 0aceafc CHANGESET =E2=86=92
> > <https://github.com/ClangBuiltLinux/continuous-integration/compare/877d=
002bdcfe6bc5cb0255c3c39192e8175e2c19...0aceafcfcca7c4a095957efae0939a612d75=
5077>
> >
> > Merge pull request #182 from ClangBuiltLinux/i386
> >
> > i386
> >
> > Want to know about upcoming build environment updates?
> >
> > Would you like to stay up-to-date with the upcoming Travis CI build
> > environment updates? We set up a mailing list for you!
> > SIGN UP HERE <http://eepurl.com/9OCsP>
> >
> > [image: book icon]
> >
> > Documentation <https://docs.travis-ci.com/> about Travis CI
> > Have any questions? We're here to help. <support@travis-ci.com>
> > Unsubscribe
> > <https://travis-ci.com/account/preferences/unsubscribe?repository=3D671=
8752&utm_medium=3Dnotification&utm_source=3Demail>
> > from build emails from the ClangBuiltLinux/continuous-integration
> > repository.
> > To unsubscribe from *all* build emails, please update your settings
> > <https://travis-ci.com/account/preferences/unsubscribe?utm_medium=3Dnot=
ification&utm_source=3Demail>.
> >
> > [image: black and white travis ci logo] <https://travis-ci.com>
> >
> > Travis CI GmbH, Rigaer Str. 8, 10427 Berlin, Germany | GF/CEO: Randy Ja=
cops
> > | Contact: contact@travis-ci.com | Amtsgericht Charlottenburg, Berlin, =
HRB
> > 140133 B | Umsatzsteuer-ID gem=C3=A4=C3=9F =C2=A727 a Umsatzsteuergeset=
z: DE282002648
> >
> >
> > --
> > Thanks,
> > ~Nick Desaulniers



--=20
Thanks,
~Nick Desaulniers
