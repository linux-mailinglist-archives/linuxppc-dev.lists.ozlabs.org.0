Return-Path: <linuxppc-dev+bounces-14156-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C071CC59B42
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Nov 2025 20:18:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d6qmy2sN6z2yvX;
	Fri, 14 Nov 2025 06:18:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763061506;
	cv=none; b=naWdQ193TgdrAc2a6pAkk6YCp7mLVyhNL358GOTz8nM78XHFlvc+3KzZxZmrKwunC9h0OyJmFI0dfPq8zfTXuApfQd1sT2CGRBwd4eIiyOXENo+wzrk78Xfsic0idX/ObrDrbiEX7nN88PnDaiTmLQBbfu5XxR3krTsw308Qp9dKFm7M+jdGHCuNyYmyjEV5LHxUsZZ/agwxnIV/RnsOWqY+bBKf3WBHzKNcSm+yq9M99ARsvMc8uE7ebs0QLG8PdbAmWFEsAwrSBx2EEfTZCrl7YOg9cZ8tXJfQozyHkNHKXm4Q8mXP1vEyh7hM5mkd3VcaqmB9dlnF59E+K74fTw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763061506; c=relaxed/relaxed;
	bh=W24rXr9XTIjoWbBrgVjF1WMdWafKto7r84bSibgNW+k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ePjrvHaJ7hf3UFVl10kqfdlVMuIdzSbkSpr/vJiQ9qdiDSjV9qUHSz1Bc9INC/Xpzn/zlFZOeVZxdi7FprFl2Os1rr4mHFdwm2k2nLcXPDbyubDpB6v2hXBJyDsnc4nmvFPKhJGS+ZHT4BsGBY1GH2WlqEEyjIWsAM9vfOOnRd+WeT2qB66If9o0N+RaWAT0BLYETRm3UpIIhxAf4WbzH7H3xC/hKPBTdX1aay1YpfJsRPHWhfqThRdk62CVYIkx/UUnuWc+B8Ii2OGHm1mI8CiSzQGPgmcsPE3IZtqbcB6kuSOhrzDDfZ5QG2XTiwSh+3i2dPek87Cl72ylpUVcKg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=W0X7qiri; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=rafael@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=W0X7qiri;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=rafael@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d6qmx1dcSz2ynC
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Nov 2025 06:18:25 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8C3FB6144A
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Nov 2025 19:18:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 258EDC2BCB1
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Nov 2025 19:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763061502;
	bh=6UprQ8VPFTOJEJnrAk3c1+70Nbd/u85upyCo1jyU1qk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=W0X7qiriJx8qwv9BbYquHPo7dcdlB2adgQNwN+FfcpIdmW/AITZJ5Zpqm03CC/Dxr
	 6GnRSXQmfJ+W2vthEpzKITubGF74mnCc6WUcvin3uowyc8BT86f+//ZfLYv29g+BBF
	 lF+wiMxVq3NM9L1tiAzuG5XwvTH/cQqPOIPuH8Swojls+LSeWQiKJpBdWwsNkrHfoc
	 ViJlr54gGxXeICJKCHSvemTDsL0eAAUa1Kuky49BxecjyBAtJpJBy74zC1sU1paLFh
	 iEnE0JiwwGU2Q+ypXPimklXXrXm0/+3QIl6jESwwRiu7KL4wKdlkBy+NprPJA+WbMw
	 +qgnAYGxQ0H4g==
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-3e29f583e8bso1303436fac.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Nov 2025 11:18:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWSQzKVf5iMUyBPTuQJ6VaTpcUZncM0JP87uQ7wetCPQheFDIgkM27RkVDZdWy3JIFlfTmatZgrxY0Yoew=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwovblOvrqIR9+EeP8pGgFqulaYZBI4us93h9M56EpSoG/DG2fI
	RkjmNzj0kQ+BW58mITHcLIUN39ZTdh3iKNVvmCO7v9QhMj3S5+vY0LitZRuZCBMAp0VIXncXZSn
	mSG3OFRrTEqI4mRDKyJcCM9Rc1H8H+Bc=
X-Google-Smtp-Source: AGHT+IEEkDRYf3o6eWh7An4Eb7oaPpWELLivUE1adLZQeit4rdCPvsjZcC3pPuLNVua35azYMW1z4kNGcBFvSY5y77M=
X-Received: by 2002:a05:6871:e324:b0:3d4:b889:7d65 with SMTP id
 586e51a60fabf-3e8674043b0mr485629fac.19.1763061501288; Thu, 13 Nov 2025
 11:18:21 -0800 (PST)
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
References: <20251029163336.2785270-1-thierry.reding@gmail.com>
 <20251029163336.2785270-2-thierry.reding@gmail.com> <CAJZ5v0igMJ12KoYCmrWauvOfdxaNP5-XVKoSxUroaKFN7S-rTQ@mail.gmail.com>
 <3dzha4qyqdrbutxby3n5nkvihnxrhniqr6w726eumhzgln2w5l@fbu72mzmjz4m> <2tx3o5es77oa37zqvikcoo6n2ryxvepa54ezsaawcjdbf3g3wp@o2dbcbskjksk>
In-Reply-To: <2tx3o5es77oa37zqvikcoo6n2ryxvepa54ezsaawcjdbf3g3wp@o2dbcbskjksk>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 13 Nov 2025 20:18:10 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0gupHEg8ip+2R1wYAQ=BQn4Mk5EMMu==StRxwvXA0WwsA@mail.gmail.com>
X-Gm-Features: AWmQ_bka8IUODzeQR5ggeX8uZbZXXCIST1G0sD3k8DJ8TOKe2Mgor6ApCD0oVpM
Message-ID: <CAJZ5v0gupHEg8ip+2R1wYAQ=BQn4Mk5EMMu==StRxwvXA0WwsA@mail.gmail.com>
Subject: Re: [PATCH v3 1/7] syscore: Pass context data to callbacks
To: Thierry Reding <thierry.reding@gmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, x86@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-mips@vger.kernel.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Nov 13, 2025 at 7:32=E2=80=AFPM Thierry Reding <thierry.reding@gmai=
l.com> wrote:
>
> On Wed, Nov 05, 2025 at 05:52:01PM +0100, Thierry Reding wrote:
> > On Mon, Nov 03, 2025 at 05:18:08PM +0100, Rafael J. Wysocki wrote:
> > > On Wed, Oct 29, 2025 at 5:33=E2=80=AFPM Thierry Reding <thierry.redin=
g@gmail.com> wrote:
> > > >
> > > > From: Thierry Reding <treding@nvidia.com>
> > > >
> > > > Several drivers can benefit from registering per-instance data alon=
g
> > > > with the syscore operations. To achieve this, move the modifiable f=
ields
> > > > out of the syscore_ops structure and into a separate struct syscore=
 that
> > > > can be registered with the framework. Add a void * driver data fiel=
d for
> > > > drivers to store contextual data that will be passed to the syscore=
 ops.
> > > >
> > > > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > >
> > > This change is fine with me, so I can apply it unless somebody has an=
y
> > > specific heartburn related to it (Greg?), but in case you want to
> > > route it differently
> > >
> > > Acked-by: Rafael J. Wysocki (Intel) <rafael@kernel.org>
> >
> > I have a few follow-up patches for the Tegra PMC driver that depend on
> > this. 6.19 is what I was targetting, so if we could put this into a
> > stable branch that'd be the best solution. I can set that up via the
> > Tegra tree if you and Greg are okay with it.
> >
> > If that's all too complicated, I can probably wait until the next cycle
> > to merge the PMC changes.
>
> I've added this single patch to a branch based off of v6.18-rc1 that I
> plan to feed into linux-next so it can get some broader exposure.
>
> I can keep that branch stable so it can go through multiple trees if
> needed. If anyone's interested, the branch is here:
>
>         https://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git/l=
og/?h=3Dfor-6.19/syscore

You beat me to this, sorry about the delay.

