Return-Path: <linuxppc-dev+bounces-14691-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CB36BCADC13
	for <lists+linuxppc-dev@lfdr.de>; Mon, 08 Dec 2025 17:30:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dQ6s56Z0nz2xGF;
	Tue, 09 Dec 2025 03:30:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765211401;
	cv=none; b=F5UD7a0XQF90tUMNX/lOTk0W0Et4BvtzmmqTyypo0A7Tyn/dMMmHi8SaPJ9WuD6aUXU4ovZPNv1sInUKlo80V/M4gvPWO6LrUd+077WyV4HCtuPvgsJgzT+ts7zdpUlK/klvnShCC6XjFPr/BX5tG83i9Mx4nLnPeD1aMwaX6OJ8Xf3NtFN/fINf/xHeIu+rC713wpwpd4PTHKbi8Pm04aK3VrMFJM/y1ahYkPSnDGf2Q+kEL5BJ0nMXmLGRaYDG8DBa+c5Pi6jvtrk9LXsBmdwoEWprJEj8fxNy+fkBoDjLuzZZ3b40pk4MEpnXVaeU8rWv0xbASG0H1spUcikXYg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765211401; c=relaxed/relaxed;
	bh=3FBWiNX5t2ldbzXF8cf7t4lyzD9gioyhQz+48mVIq98=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kBCU1jKl+OHPt2RjpD9ZJ50Kg1E9+gIPzFvTnlMsz3jVAqIYRaDl+Ct+3/6mDdOWc/9UOR1GPYcUbzNzMD7ZxD/pXtgq0Qu96/1jkMcLYUMKDanZUh8XNEQZHvok/9IYvSFuF4mvlyIshE7o7T257hzXOdEJq6uSBK12VL4MdCyqehWHbI29RNi+EdDwEY7ZSHItX37AFrzz98VQ8iXmgndRg9ielNbcdhf9k/TCM6YpaXSz0qZm7N370S7kdkTtc+DfBfNBkyO4L3K3F5JKuefxLyAlG32dMfbknG+pFusR6KfNWeeD5lJsAIS911HFz5RmdqeCmAhd42ABCtv+4w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LNGpnCbf; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LNGpnCbf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dQ6s45GmPz2xDD
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 Dec 2025 03:30:00 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1D39A44277
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Dec 2025 16:29:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3A70C19421
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Dec 2025 16:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765211397;
	bh=GZIu95dg6lXheJlB6RXRgB1q2hSHNOvi0dTvvsErbbY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=LNGpnCbf9DLJs66BfLS/udAOB+EymFpbSdX3lzRFoW3T7fT2oBLwx3vXY6ZbopB+n
	 BdOwNO/xjFC8IZoaspUURnjgcDvdlM2cOcPE7VZUEGEu8eZPqEYdJ2/IrKziUNTeBA
	 9GKk7fSSgkIQQCD/0jS85GSPBW7Q57wsAP/uQ1tA6JV49jWpmt/0nGDOwYeZNIoKZ4
	 ofTDVj5J+BcqLBiEVwv0dAiPpD/DvAiH3wj+Dof65kNe73DvD7VLcAEP9qu9bLiDyI
	 0dgQxeZflfqZt+WRPpjCXwA15zZMzvx/6gUct2t59udNk9af4Yucpzr5yA9WXaYkGA
	 xy+OuEJITJX+A==
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-640860f97b5so6081796a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 Dec 2025 08:29:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUCy7dBl1+F2f29n1/VTInH+L+lax3LY2FqZvBLkLmFsn7ofchtSFpluSXwwFxuZdnu21JV/UwhwK4GYI8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyLuJcq8MuJSEfqZEcXFh8Jgb97cSNd8Hca1WryreW9M3uHje0A
	rxIUwLux4z356NBrPnUiTcYKY/xmOI9Sb85HJSpxPxQVEbdboPTUtbxE4FYYUD5dd77kcm9vS/o
	mONWmU4XUOk8U+CRHxV+MXJvSP3XXjg==
X-Google-Smtp-Source: AGHT+IEu9W9eCUlW/nWIpEYXNihaoQ2Pak4GrAp9PYUXegDYNh/QU1yKQnbWQ5E8ILdZ26N9ZinzTHq87VzihFP+Cjw=
X-Received: by 2002:a05:6402:2551:b0:641:966d:82ba with SMTP id
 4fb4d7f45d1cf-6491a3cd830mr5915613a12.1.1765211395484; Mon, 08 Dec 2025
 08:29:55 -0800 (PST)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
References: <70d76dcf-c7d4-43c5-c169-07054a37195c@yahoo.com>
 <78e43ec2-a60a-9876-9f03-c0ad92b7da1d@yahoo.com> <CAL_JsqJ8amo2ggUVfL=YzRrA9UnqKfKCipn-_yOkahJKZVs5=A@mail.gmail.com>
 <aQHCU1pb7zT167rO@gate> <3a9bb788-d527-af08-894e-8011490fcab5@yahoo.com>
 <a9467bf5-4756-1297-9ef8-c00a326f786b@yahoo.com> <8995fec0-133a-4b8c-9e6e-980772d155d4@gmail.com>
In-Reply-To: <8995fec0-133a-4b8c-9e6e-980772d155d4@gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 8 Dec 2025 10:29:42 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJGsvV27gRejTpXa10B_zNMVxPG3KGuPk92NqzrOW6JAg@mail.gmail.com>
X-Gm-Features: AQt7F2rpyAmfAskXebm95RXuvbQ67u2Y-l0Bwb6S_3NCXXl1OmELAVgdgNxabg4
Message-ID: <CAL_JsqJGsvV27gRejTpXa10B_zNMVxPG3KGuPk92NqzrOW6JAg@mail.gmail.com>
Subject: Re: Excluded List for "#size-cells" warning
To: "Stanley J. Johnson" <stanley.j.johnson.001@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Segher Boessenkool <segher@kernel.crashing.org>, linuxppc-dev@lists.ozlabs.org, 
	Finn Thain <fthain@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Dec 8, 2025 at 10:25=E2=80=AFAM Stanley J. Johnson
<stanley.j.johnson.001@gmail.com> wrote:
>
> Hello,
>
> Please let me know if you have any information regarding this issue.

The fix[1] which I CC-ed you on is waiting on the PPC maintainers to pick u=
p.

Rob

[1] https://lore.kernel.org/all/20251029174047.1620073-1-robh@kernel.org/

>
> thanks
>
> -Stan Johnson
>
> On 10/30/25 4:14 PM, Stan Johnson wrote:
> > Attached are the dtc output files for a PB Lombard and a PB 3400c. If
> > you need any other information, please let me know.
> >
> > Thanks for looking into this.
> >
> > -Stan Johnson
> >
> > -----
> >
> > On 10/29/25 11:00=E2=80=AFAM, Stan Johnson wrote:
> >> On 10/29/25 1:29=E2=80=AFAM, Segher Boessenkool wrote:
> >>> On Tue, Oct 28, 2025 at 08:17:27PM -0500, Rob Herring wrote:
> >>>> On Tue, Oct 28, 2025 at 7:05=E2=80=AFPM Stan Johnson <userm57@yahoo.=
com> wrote:
> >>>>>
> >>>>> -------- Forwarded Message --------
> >>>>> Subject: Excluded List for "#size-cells" warning
> >>>>> Date: Tue, 28 Oct 2025 10:00:25 -0600
> >>>>> From: Stan Johnson <userm57@yahoo.com>
> >>>>> To: debian-powerpc@lists.debian.org
> >>>>> CC: Finn Thain <fthain@linux-m68k.org>, Christophe Leroy
> >>>>> <christophe.leroy@csgroup.eu>
> >>>>>
> >>>>> Hello,
> >>>>>
> >>>>> On a PowerBook G3 Pismo running the latest Debian SID, dmesg
> >>>>> reports the
> >>>>> warning shown below. I've also seen the warning on PowerBook
> >>>>> Lombard and
> >>>>> Wallstreet systems. I haven't checked PowerBook 3400c or Kanga.
> >>>>
> >>>> Can you send me a dump of the device tree on these systems:
> >>>>
> >>>> dtc -O dts /proc/device-tree
> >>
> >> Please see the attached compressed files containing dtc output for a
> >> Wallstreet (dtc_wallstreet.txt) and a Pismo (dtc_pismo.txt).
> >>
> >>>>
> >>>> We've been fixing up these cases such as in commit 7e67ef889c9a
> >>>> ("powerpc/prom_init: Fixup missing #size-cells on PowerBook6,7")
> >>>
> >>> And of course it is perfectly fine for an actual Open Firmware to *no=
t*
> >>> repeat the defaults.  As the documentation (the main IEEE 1275 thing)
> >>> says: "A missing =E2=80=9C#size-cells=E2=80=9D property signifies the=
 default value of
> >>> one."  There are many other places in OF geared towards this default
> >>> btw, take for example the "reg" word, that silently assumes your node=
's
> >>> #size-cells is 1, and does completely the wrong thing if not.
> >>>
> >>> Flattened device trees are a fine thing, but the gratuitous ways it
> >>> differs from OF, are not.
> >>>
> >>>
> >>> Segher
>

