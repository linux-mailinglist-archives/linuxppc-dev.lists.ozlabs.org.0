Return-Path: <linuxppc-dev+bounces-2930-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AEA89BF548
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2024 19:32:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XkDMb4b4Sz2xpm;
	Thu,  7 Nov 2024 05:32:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730917947;
	cv=none; b=h4lkmbPHBOCJI6Fb5zCsbdfPTpwp1q9kEseoVYJwmvO12MMtRdyUE0JaNLnJ627IuwRGL5YByDVhj4s+5BbKgi9narJzmstSGxXPKh7mby4Ik8Zo8fkfmvTD31ODjgGfC/wIkRMSR20VAxcT9SWMJQwaDzRNTBw/Wl8fZbjED+WTw1pnCA22WXpgRFmZB1IGXGQswDmsGyk1boe2gz67MH0ykCpHQULUIzduV7oUD1Mthlt6dMYLuqv2QsKlrhvU0EkDRq28I7iL3EnocV3JV5H/gH7GfLihP2JyGoMxdfFoF9INDmCQv/cvlJ4c7uD0TCdl/mIGQkQrjRlqZTFGNA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730917947; c=relaxed/relaxed;
	bh=VZAJqAIJ1C/Lh9DLgBZKS+KRl8i2ROrpVpzHBnbbhE4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jIcUBkoyDdtNFp0Hp7/0jEjRNt7X6rx8CWSdxOQJU5rRW5tlXBBDfMBvAXrLBNP+kb0aKmQXJfLsrv6zDfzdlhYryWQD6+Av+LV7mV7ZdR219kBSxE91oKX7eb/ivF/kQuM3hostr68XkZdJh7EFNpKB3SkTtsRBzkNmSLglp8E2BpCuydL1nbJ27EedbYSAQhy5dedfJlGYvpZafhpAPh53YRytjWIPzMui8ITtXMWYrCWjRGwqQ/o7x90csXdiCaNEQnjm0/yPbq9uEgoz3Pz+3iDXlg2Pbe3FRYatnylsrgZZIsutJg+a/XZ3uoawshfwYUYP1OzgRi1MqIoFCQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PkDRv6xT; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PkDRv6xT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XkDMZ5DGnz2x9g
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Nov 2024 05:32:26 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6E7D55C4114
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Nov 2024 18:31:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3E00C4CED5
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Nov 2024 18:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730917943;
	bh=VZAJqAIJ1C/Lh9DLgBZKS+KRl8i2ROrpVpzHBnbbhE4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=PkDRv6xTRctPUKBiyFgsQSDikbJfwz/A9CYVYQYxhpt4w7Qk9NdT54U9iSLGdv2pb
	 htOJOQD7/rVh/bJBP+dYYZzuG7tkFQ5874OrJWODy/7UAHJu2ZqewmrWhgTPINxHgm
	 SXrggaF2eXjxrc24zsr8cM43in25irJdCQ+P6LfhoRP1shEYTm+QBhZwNN35BmwJ7a
	 Zw8iFmfKfz/JPzuCHlegm3JYdZv9HCOm30CphxdKWrErE9QDI6KjHk5v6yIpdes003
	 DQflz7jGg06FANTss3tbT0q0NKZCEgownWTxkSyIBLDp4xnB3oSpi+If4BDAoyUsd0
	 prTT3GKnN/XIg==
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e30cef4ac5dso105295276.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 06 Nov 2024 10:32:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUCWQh2ODtu8dRopunY7oRaCagJQTX2KM25qaXel+LNRSRorqj/FRzehDGDLrfy7fBAvsuOna1f+gXE2K8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwjYtFUV49+WPhrYT+48B4gWv7bdGtkgGpHr8HgWmM24SjjXCRh
	StDwPdU7LTsDJsxWp97ThYT4w6yAwGT29JeVOtLc38L4E/YyzwcXfip3YquaDCecGDCn1niDmWn
	QOMPpl9gdMjwn0zAJPGLdEUpIcg==
X-Google-Smtp-Source: AGHT+IHF7huaas71JDmvvH8NbieYOfzeri2Ws8mw0BHdC5V9CTrAnY0eW9Crx/tJlxy/Vp+n09K9FKAFs2dJs+U2oy4=
X-Received: by 2002:a05:690c:62c6:b0:6e5:9bc2:53a0 with SMTP id
 00721157ae682-6ea3b9831c7mr307446817b3.41.1730917943104; Wed, 06 Nov 2024
 10:32:23 -0800 (PST)
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
References: <20240702161052.3563599-1-robh@kernel.org> <D2RSWMPFF8KK.X5HZZMHANQMO@iki.fi>
 <D2RT0J8KXY1H.3MEV7KGQXTWHW@iki.fi> <CAL_JsqJDX+uOSoPh6pTNEP0vBLwcP3bKmAW1wCr_0cVr5fsPcg@mail.gmail.com>
 <D2SSH5HSDHQS.2YJSB22W3MHQK@iki.fi> <CAL_JsqLF+gs9e1TL1yi-xAZJRx4Kz7fOk=2wcF8kCqU3vyMWZA@mail.gmail.com>
 <D5FAVRTM32ZJ.1HFCHF3L9I68C@kernel.org> <D5FAXEKQ71ZJ.1U9AE15UVWRT9@kernel.org>
In-Reply-To: <D5FAXEKQ71ZJ.1U9AE15UVWRT9@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Wed, 6 Nov 2024 12:32:12 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJdabUmgOEe29y4o5muOnh83V7rS=YwfXMtZ+Fugcgzdw@mail.gmail.com>
Message-ID: <CAL_JsqJdabUmgOEe29y4o5muOnh83V7rS=YwfXMtZ+Fugcgzdw@mail.gmail.com>
Subject: Re: [PATCH] tpm: atmel: Drop PPC64 specific MMIO setup
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Jarkko Sakkinen <jarkko.sakkinen@iki.fi>, Peter Huewe <peterhuewe@gmx.de>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, 
	linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Nov 6, 2024 at 12:19=E2=80=AFPM Jarkko Sakkinen <jarkko@kernel.org>=
 wrote:
>
> On Wed Nov 6, 2024 at 8:17 PM EET, Jarkko Sakkinen wrote:
> > > Whatever happened to this? Can you please apply my patch if you don't
> > > have the time for further rework.
> >
> > Sorry unintentional.
> >
> > I applied with
> >
> > -static void __iomem * atmel_get_base_addr(unsigned long *base, int *re=
gion_size)
> > +static void __iomem *atmel_get_base_addr(unsigned long *base, int *reg=
ion_size)
> >
> > as this gives checkpatch error.
>
> See:
> https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git/co=
mmit/?id=3Db18ffd5e0faaa02bffda61e19a013573451008d4
>
> If that looks good to you, I can mirror it to -next.

Looks good. Thanks.

Rob

