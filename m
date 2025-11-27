Return-Path: <linuxppc-dev+bounces-14526-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F4BC8E572
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Nov 2025 13:52:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dHGXl6ts9z2xQq;
	Thu, 27 Nov 2025 23:52:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764247927;
	cv=none; b=lvwx8rhpqDVYpIFso5RLfmFLWWGhVRA8II7mAA8XIDGD6Fx3ks57pWy77M7X7lyXJ1qBkieXj2Vn1ev8/xuvLuOyacAKZeZ/Lez4SQ0IxFO3P6TYCsSNkkKROrlZKS1++fQ1zjiY0vjXrHP5hPa93KH8r65tgC6RhGe4RBfgHzq5K1ybxC5mOfWoTSk6moXoNwllpZe5c1cQrzq7dh+fFen8TOE9nLjqVrcivB9P9t2B8PS9jQrf0BqCxQNg6ATMjAsuchl6wHrTBp+M9m40gzLyZe/ASpWTdfg+KR5X3QC7EDDL6XKQtugrw8WAx/24F/92kwgixMPgcTX5dp8Nog==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764247927; c=relaxed/relaxed;
	bh=OnXiK4xPyrj9SOGocbyfm0eUVKezxTRubSca1lzWeZ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f2vYZArYtYh+5od7AOpRZCH/xdMJ/1ad8QfP5K8tq0ybkUig6h4RQXbzyC4GbqyVo7ZwoSlnjBGNHD4g2/3dggLXsEso48E8tLQQ00KBWu0a8KTDlCD8NiWlKknSsioDpI2IKJoBvoA/dEKFkCnmYiy7o5F8z5Debot8vQRYXT/sHQQGyPVPXF3erflfvQZ+imXRgfTbr4nyMrK4emQAMPWWrhcjBgZqBV+8B+6P7lBnpywQjfktjzJzdIGaH0JXZSfpoD7BHuf+mX6rKHAJyEcrtKN31t+/KT8uTvia2/OA0uvoyaWTfm5XzFHSwvplpMOA51h5XChS+9PY4Hn08Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DGADcATq; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=rafael@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DGADcATq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=rafael@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dHGXk6Yylz2xP8
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Nov 2025 23:52:06 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3E13F601F1
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Nov 2025 12:52:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2242C4AF0B
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Nov 2025 12:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764247923;
	bh=RqG39jWJboJ3J2PHqXsCUlZnk7m8OLGCs0ly8p4o4OM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=DGADcATqOvlRALiYh1igVxDQkXNAkV97iGCuv9HAb9hUd8cw++BPxfNXUcjnKU7hQ
	 fjCru0OCKqy6zA1t7+XXZ+T5F32lSKsDNXaAaWj7gQIUydTkDxc22zwFG5Z3FB07xx
	 Pp0CdP4QC5P6H964IApfhurP6i6uGFwQsz5fS3/Lx6bBRuQrJ7mpGSdhDz75b+ErUK
	 +EyJHeCx+P8HOyc5JSYbjWerUnmSk+AKTjUxmmbrjbcZ/1FwVv4TbJnU7KxZFQP01H
	 RfDL2P20FPXFdMOss+eXJRuGmP6vSb30q1fF1e1ElkBOcWQIeZD0Gsq5+FkZTRvHLJ
	 QUFfnCO4zpb0Q==
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-6574ace76dbso305394eaf.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Nov 2025 04:52:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWUlLPLo3WpgW1W5Opsw6oi5SGG7U93ERxpmq5i0ugjly4RRXIwWzkTXP1Q+kGSOMvuDDn5cV3Q1GZR1gg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yyopv6nQPvywbih140o10FffnPJpOUcdZAW5RQI3zzryY/Qu1Ot
	CLYEAN3eez/veX3NMupnSjB+mdvFeXb2jTiPKm30rzcbpM1aMb0tpp6FVmqIkxZnghOK9wQKeZP
	kl2KDNNYJHtpphu6PAICsrI/5+ZyEIl0=
X-Google-Smtp-Source: AGHT+IF6/lZT+nTgbNvZTUiXIDmW9q54rZMUqwpRjYNk8wrYCqvyIwoku1OnSoBAAGpVXY/jQlB82nISjHSkqQX97+w=
X-Received: by 2002:a05:6820:2017:b0:657:5cc3:f38 with SMTP id
 006d021491bc7-657908538bcmr8095666eaf.0.1764247923143; Thu, 27 Nov 2025
 04:52:03 -0800 (PST)
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
References: <aSb3Qt6n55Fsl7IF@wunner.de> <20251126234603.GA2832326@bhelgaas> <aSgEnt12QQLXCfWr@wunner.de>
In-Reply-To: <aSgEnt12QQLXCfWr@wunner.de>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 27 Nov 2025 13:51:52 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0iusQ0_d26tuQS7fSdQNwFKWuZn7185MrAj=kJ-2=4byg@mail.gmail.com>
X-Gm-Features: AWmQ_bmj9EZZXbEixlhBnrAkhfgIC-kpDvLYVESJrO_qON4uVsjhWj5sjc2KpM0
Message-ID: <CAJZ5v0iusQ0_d26tuQS7fSdQNwFKWuZn7185MrAj=kJ-2=4byg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] PCI/PM: Reinstate clearing state_saved in legacy
 and !pm codepaths
To: Lukas Wunner <lukas@wunner.de>
Cc: Bjorn Helgaas <helgaas@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Riana Tauro <riana.tauro@intel.com>, "Sean C. Dardis" <sean.c.dardis@intel.com>, 
	Farhan Ali <alifm@linux.ibm.com>, Benjamin Block <bblock@linux.ibm.com>, 
	Niklas Schnelle <schnelle@linux.ibm.com>, Alek Du <alek.du@intel.com>, 
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Oliver OHalloran <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org, 
	linux-pci@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Nov 27, 2025 at 8:58=E2=80=AFAM Lukas Wunner <lukas@wunner.de> wrot=
e:
>
> On Wed, Nov 26, 2025 at 05:46:03PM -0600, Bjorn Helgaas wrote:
> > On Wed, Nov 26, 2025 at 01:49:06PM +0100, Lukas Wunner wrote:
> > > In the patch, I made the "pci_dev->state_saved =3D false" assignment
> > > conditional on !pm_runtime_suspended() in the "freeze" codepath.
> > > I didn't do the same in the legacy codepath because none of the
> > > drivers using legacy PM callbacks seem to be using runtime PM.
> >
> > Maybe it's moot because we hope there will be no new users of PCI
> > legacy PM with runtime PM, but I don't think there's anything to
> > *prevent* that or to protect against out-of-tree drivers.
> >
> > The implicit assumption that there are no such drivers makes it look
> > like there's something magic involving state_saved, legacy PM, and
> > runtime PM.  It might be worth doing the same in the legacy PM path
> > just for readability.
>
> Drivers having both legacy callbacks and modern callbacks (including
> runtime PM callbacks) cause emission of a WARN splat in
> pci_has_legacy_pm_support().
>
> Drivers need to activate runtime PM by dropping a runtime PM reference
> on probe (see the code comment in local_pci_probe()).  In theory a
> driver could have legacy callbacks but no modern callbacks and still
> use runtime PM by calling pm_runtime_put_noidle() on probe.  So I
> compiled a list of drivers implementing legacy callbacks (included
> at the end of this e-mail for reference), grep'ed through them
> for any "pm_runtime" occurrences and found none.
>
> Hence it seems very unlikely that drivers using legacy callbacks and
> runtime PM exist.  We probably shouldn't accommodate for such use cases
> but should rather try to incentivize conversion to modern callbacks.

Agreed.

What about adding a WARN_ON(pm_runtime_enabled(dev)) to the "legacy"
suspend/hibernation callback paths?

> When compiling the list I sadly noticed that new drivers do exist
> which use legacy callbacks.  A case in point is:
>
> drivers/net/ethernet/google/gve/gve_main.c
>
> ... which started using legacy callbacks in 2021 with commit 974365e51861
> ("gve: Implement suspend/resume/shutdown").
>
> I guess there is no real incentive to convert to modern PM callbacks and
> finding someone who has the hardware and can test patches is hard
> (most drivers are for ATA, some for really old 1990s hardware).
> Plus, a lot of detailed knowledge about PCI PM is necessary to avoid
> breakage, making this a task that can't easily be delegated to new
> contributors.  And everyone with the knowledge is overworked already.
> So we keep dragging this tech debt along which complicates codepaths. :(

While I agree that this is the case, I'm not sure what can be done to
address this problem, realistically.

