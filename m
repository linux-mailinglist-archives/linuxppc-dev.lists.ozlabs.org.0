Return-Path: <linuxppc-dev+bounces-3673-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06ABE9E04A9
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Dec 2024 15:18:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y25Vk5h7bz2yhP;
	Tue,  3 Dec 2024 01:18:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733149118;
	cv=none; b=ksCx/9yxpGzCSIikB40bVs6lNhVDNwbdvQ9/viCSyOTTgIx7K4ym4tWV13u+DTOppzZCe8GLIbHT9Et1fl+EAS5js3Lf9AG39drydr594R/K/egiU+ZOoch/fLyibdv6jrX94GRUuYMh8R4X/NgWt5qxKHTdCwDVlIAfw3woQFuT4o948qDttf33sffuNxxt+8SOcPQK+dVErKdnSLMoAzF9u7f/13TWRodnnhGiahCGv9fcUKwHxgzrUTr9Z75p0SReIbmlgQoCVtR/46X6ZGZIIRT7bIq6LQcmDq6dVkZz9H2wca9wCiA+bCqvDMJTdeyNeHwYpNlP43Cj7h9O3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733149118; c=relaxed/relaxed;
	bh=HN3EYU0R7OF8G9X0CAvNtlUH4o8Cf9TZuB2/05sFIPA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=irwX324UxK2vAbumgYO96mQZrZpzL/skYKWgzNQqcvZZrX0LCacAgG6Ul93iJM+N/tVpUVmjZJKqd7rJuQgzH8PqqQQbSucusHF8pA1B8wjYMfwE+i84pjFQZIteFvFWT0CyKOKy0i+PYE4WlLW3Vsc/a8fVG9mKe47vvO0jVLdWCevC64lrqJip4hhoecPYC9sXpHnoRMXHZTaPN+MTk2dxmapQr2+M0dPJlM9+8ntftuzEBdn2lPgErhz3XfByzNaoe1FInPFUvCyXLpvhAkWKuAIZcMPTTxrVF7kbWID/9+DKrpJ06ZAnNwX9ftkx7VRyAQPUrAZihr8JW6Ez9w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=b/69w67s; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=b/69w67s;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y25Vj29KWz2yh2
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Dec 2024 01:18:37 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id F04E7A40DD7
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Dec 2024 14:16:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AE14C4CEDA
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Dec 2024 14:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733149114;
	bh=0us+gBlX39zhRsFXi17z48PewGbGA42YA6AgkVkWDUc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=b/69w67sxxIFP0Cgljr6UtXL2oFZg+H0Wx5j9HUlvc4NjUYmstMhEuSBn5FhyCSjc
	 pX/UQwi66WRt0b1hJnJibvWd/7j8sr9YdVUnTWuY8TphSY4jrkPhbdJcVsukXMHxqv
	 uylSVeco87mylYuhEQwcES9IuBrfP6yZMjyQ+kmlOgbN4BoMW07uwG00y2NJx6T+tK
	 dNbyVDRZfxZ9m17qqOAtppmfqdkB9MA9oxSYZQuD9Okq8FiD80Kfz9ck7CDLu/451L
	 aWVniBFRlCeXzeGB0cdTHl0GAjJqj5XQ+o3PPVxJk9z5lf00M15kb8KnWbe0li7mK8
	 pRGTACOK2Sx2w==
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e398484b60bso2718681276.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Dec 2024 06:18:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXNkYkXnQlEF5fjTXvRrz6D8G94/h8cgswDWD8SvWK0JmPZF/+2lLdZERIdBQPP1hynB/tCY45LxOFp69k=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyTi9n5K/SBvzBIKfYyJMdpAeUvtVNX1aMRyudsId2YFsfAO/fs
	tgw5RL58e3uKBAuLfYHOwNEiMGd297D+woieAfwNObAkG/xbN62LcutpcxR6M4ROnrfOoVq7UXd
	hu4G3YDaTPe+k+PPdxKyU4D2JiA==
X-Google-Smtp-Source: AGHT+IEhlb7MKU5lFFZroCSWTiCTT/MZ9My6mW0Op1qXva0iBbegNgizd/mgraVhnPlb+GYAYPu5wgFmxjfTHHaZhu4=
X-Received: by 2002:a05:6902:1247:b0:e39:998b:48cb with SMTP id
 3f1490d57ef6-e39998b5610mr7207837276.1.1733149113254; Mon, 02 Dec 2024
 06:18:33 -0800 (PST)
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
MIME-Version: 1.0
References: <20241106171028.3830266-1-robh@kernel.org> <87jzdfcm3l.fsf@mpe.ellerman.id.au>
 <87plmi7jjz.fsf@mpe.ellerman.id.au> <20241127214232.GQ29862@gate.crashing.org>
In-Reply-To: <20241127214232.GQ29862@gate.crashing.org>
From: Rob Herring <robh@kernel.org>
Date: Mon, 2 Dec 2024 08:18:22 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKhp8bW66koP8JPSkXmrCjA+oQh6NZte_uphiLTC_=7Rw@mail.gmail.com>
Message-ID: <CAL_JsqKhp8bW66koP8JPSkXmrCjA+oQh6NZte_uphiLTC_=7Rw@mail.gmail.com>
Subject: Re: [PATCH v2] of: WARN on deprecated #address-cells/#size-cells handling
To: Segher Boessenkool <segher@kernel.crashing.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Saravana Kannan <saravanak@google.com>, 
	linuxppc-dev@lists.ozlabs.org, Conor Dooley <conor@kernel.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Nov 27, 2024 at 3:47=E2=80=AFPM Segher Boessenkool
<segher@kernel.crashing.org> wrote:
>
> On Tue, Nov 26, 2024 at 02:36:32PM +1100, Michael Ellerman wrote:
> > Michael Ellerman <mpe@ellerman.id.au> writes:
> > > "Rob Herring (Arm)" <robh@kernel.org> writes:
> > >> While OpenFirmware originally allowed walking parent nodes and defau=
lt
> > >> root values for #address-cells and #size-cells, FDT has long require=
d
> > >> explicit values. It's been a warning in dtc for the root node since =
the
> > >> beginning (2005) and for any parent node since 2007. Of course, not =
all
> > >> FDT uses dtc, but that should be the majority by far. The various
> > >> extracted OF devicetrees I have dating back to the 1990s (various
> > >> PowerMac, OLPC, PASemi Nemo) all have explicit root node properties.
> > >
> > > I have various old device trees that have been given to me over the
> > > years, and as far as I can tell they all have these properties (some =
of
> > > them are partial trees so it's hard to be 100% sure).
> > >
> > > So LGTM.
> >
> > Turns out I was wrong.
> >
> > The warning about #size-cells hits on some powermacs, possible fixup
> > patch here:
> >
> >   https://lore.kernel.org/linuxppc-dev/20241126025710.591683-1-mpe@elle=
rman.id.au/
>
> The Open Firmware specification is extremely clear that a "missing"
> "#size-cells" property means this bus has the default value of 1.

And the default for #address-cells is 2, but yet every architecture
except Sparc has that wrong.

If I have a node without #size-cells, is the default of 1 used or do
we check parent nodes? My read of the spec would be the former, but
the kernel does the latter.

> https://www.openfirmware.info/data/docs/of1275.pdf (page 186).
>
> DTC or FDT might want to do things differently, but expecting decades
> older stuff to conform to its ill-conceived unnecessarily super wordy
> stuff is, well, not a plan that is likely to work very well :-)

That is not the intention. The intention is to identify what doesn't
conform and exclude those systems from this check (or apply a fixup if
that works).

Rob

