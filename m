Return-Path: <linuxppc-dev+bounces-15989-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 37AAAD3A9B6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jan 2026 14:00:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dvrDM5QMHz3bfZ;
	Tue, 20 Jan 2026 00:00:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768827651;
	cv=none; b=czi3cFmLGmfkfeRA8xVceoM68SuSOFzmYwFtsgnrn/aNZM1ZY4YH6KdBzIZPfkAjGrMrFex7eVxRyTawkD58Y053XhXdETbT6JQix7ij200G0lsc1hU1JihqyEzH6r7OanhNTcc0pUS/RCMlGxNusg/+xn5M7vCWKay0/z9dSFKY01mhxl/68gTgyEyOrIDG4HrMSTgDVcSOI4q2tCXj+7DOJPWTFJzh71Fg4NGIuF9jlO3sdZ/g4RlnKtyBm3fyXvo3yLdOvbNLnKOk9YPSQ8QFnU1GqkUzZKkmpV1NAzP/1UbpV1CCWtQc13FOqcpaC3w9GJz1kbpBpowYeo5HcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768827651; c=relaxed/relaxed;
	bh=UmKKLGh10RPN1svLNZxmqR0nL1F2Drx46Fu4EdQWxE0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LkNEPs2dnNrzAlCaGrTUQjBPjuxFHFmptYJpg/DMF5S7z13pHhgg9VhOUNW0Wrfb1xu1eI72ghKfwAZTCLOalodhNUn2an31dgTTj67g3sgAJoSZ8xvtws1mo9OjzVVmqz5Vv/j71Qk9SUFMbCiZlZHEsMH1vj0+K0NavzfmnVewyRMXKgu/q+EEFJmxk3Ee5XYa5rnkNBXDMpZNLpt/kh+kB4ep37NSYdrwKT7Lao+QJcyAchvuOIpVgqytp4NBoc6cn0dbq4Mf9yNE5Z43FGRXGczkJ1CPNLsMq6waEC79syX0kr3RFwIb77B5OmITRzgPEj7F+sn2il06JqglNA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ER3296Lk; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=brgl@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ER3296Lk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=brgl@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dvrDL4rJhz3bf3
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jan 2026 00:00:50 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 98DF86016D
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jan 2026 13:00:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46063C2BC86
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jan 2026 13:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768827648;
	bh=UmKKLGh10RPN1svLNZxmqR0nL1F2Drx46Fu4EdQWxE0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ER3296Lkgw70Klu/exJKetBSAMzlIu7GK5CegbTBj8yMhUjvfA9liQoG6N3JAd132
	 NAP4sFSthxsKI0+tD0diPdB5I5XZ6+vWkFEiwYGSZSQtZDwz2GrJTVKD7mCFsXNXFI
	 3Fj3qluS3lbszDkpsq824ntuR12GhyE1iddCAo4pn+SBZPrg9O8Yy47IWQNoH4tB8H
	 2VqeCfbOaiy/QVQERg/wBM8fa01g98AXLFKs5p9nIgtWqm9xO28ErxctHloHOUm9B6
	 Gqrb2objZmqM9gJNwgtTohvImLYmqryQc+LU+GZKeUMLu1TqeU/4akyvMNbQDvQAm6
	 6x9IcCpaUyY6Q==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-59b6f52eea8so3638800e87.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jan 2026 05:00:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX8+5NqbXMQOYrmIBgsSJVxKSy02c38t3w2zIlJ9ZEX3FiKaBJEs+W9AyK5SbmV0ba3alNcWs7MZMcM4NQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy+BxojM4TLFaUxAp8o16o+WOlkN/COfIb9RfKbFYHI6XVDuJOI
	9IzdMSfvRknwV/e/b8metiuPX8/Zss/ZD3q0V04X27jjV/ZzYq7RVwUv97D3YhgbMaxHIf63tsf
	cOUfegdbmshZah3+E8MaaTZWQLD7QFFP6YDqP5qendA==
X-Received: by 2002:a05:6512:ba0:b0:598:faf0:66e7 with SMTP id
 2adb3069b0e04-59baffc59d5mr3615354e87.26.1768827646961; Mon, 19 Jan 2026
 05:00:46 -0800 (PST)
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
References: <20260119-soc-of-root-v1-0-32a0fa9a78b4@oss.qualcomm.com>
 <20260119-soc-of-root-v1-1-32a0fa9a78b4@oss.qualcomm.com> <DFSJ2AD562CP.1ZX1JO1F0Y1UU@kernel.org>
In-Reply-To: <DFSJ2AD562CP.1ZX1JO1F0Y1UU@kernel.org>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Mon, 19 Jan 2026 14:00:34 +0100
X-Gmail-Original-Message-ID: <CAMRc=McTaTGPM6fMWb3b+S0+Gq_V-Vi7DF9JxDeOEfPAavgXaQ@mail.gmail.com>
X-Gm-Features: AZwV_QhN8PNZUNgPe6qogeVHpUfMZNp33VjYbo53S4KjyCuojwPBvWZd3s1oEdA
Message-ID: <CAMRc=McTaTGPM6fMWb3b+S0+Gq_V-Vi7DF9JxDeOEfPAavgXaQ@mail.gmail.com>
Subject: Re: [PATCH 1/8] of: provide of_machine_get_compatible()
To: Danilo Krummrich <dakr@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Jan 19, 2026 at 12:26=E2=80=AFPM Danilo Krummrich <dakr@kernel.org>=
 wrote:
>
> On Mon Jan 19, 2026 at 11:40 AM CET, Bartosz Golaszewski wrote:
> > +/**
> > + * of_machine_get_compatible - Get the compatible string of this machi=
ne
> > + * @compatible: address at which the compatible string will be stored
> > + *
> > + * Returns:
> > + * 0 on success, negative error number on failure.
> > + */
> > +int of_machine_get_compatible(const char **compatible)
>
> I think the name of this function is not ideal. 'get' usually indicates t=
hat a
> reference count will be taken, but this is not the case here.
>
> I'm also not sure about the machine prefix. If we really want this helper=
 I'd
> suggest something along the lines of e.g. of_root_read_compatible().
>

Makes sense for the "read" part but I'm not sure about the "root" bit.
We already have a whole set of "of_machine_" interfaces, like
of_machine_is_compatible().

How about of_machine_read_compatible()?

Bartosz

