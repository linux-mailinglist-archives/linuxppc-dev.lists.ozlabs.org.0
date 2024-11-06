Return-Path: <linuxppc-dev+bounces-2931-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6371E9BF575
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2024 19:39:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XkDWC1Cf3z30gn;
	Thu,  7 Nov 2024 05:39:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730918343;
	cv=none; b=G/sr6w7JcQx+ogLiezCMjSpAG9OPpxr7q3FDyqX+VslZC1F27xfdrm1vgTJIL/Fwhu1YrBxWQ/nXCBkmUnuqnUL1GwmCWNtOR8OhNbh6m/JUYjtnmqtrRZtlcByoRGaBo5pLCkRnhitj1P8QKu2hCjg1HfaEbTGjcEsUx5cvyawWXsRcg4vhMvxB+sJz5Xb243goDphzux3tlx6yXm36+Y1BtuKe/pNl0/703GGcM5NDrnkMyepvXWhzmlEB0269dBK+2pVONdA7M/2xzlQHzbhnXdavA00WxdKy5Ml1KgiWHhh5dGeu061aSh/drnWx2xINs+LeVIs6E8k11i9mqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730918343; c=relaxed/relaxed;
	bh=hfsiubwE8UnbZ9AU3TXwnnJyFZUi7Z6WW66CkyjmgSE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=agVOsuXA+0NDimW/dLeDj4z3KMvhnOnl+EzGE8EJCNEE4YTCNyxrkX0vgGE/w2eRLuQOnW5TRQz7xeue9b4xOnkhYi+KCZoE5qkTl1adE5WWwrEytRAvweY9IEtCFKsfWhfZjkuRRBpr8ASj8qvipAcwzZlZRp+DYqmhO0B50dohSdRpY9ZVEBmro+QF0gr3czuxnHBciU4FzjTKKgkwY6rMzLjXHV4BJIKwmic6v8o5AsXCFpAs0RR/uLzuKS75hW60G3fZM4ZyP7+63BYtYQj890vAoDUtpPfyzwl0hbAIyk+1ZZiln/qRguf2E2BFrsGBcbW7iAfJ9G6M0E+JHA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cJEc1tlE; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=jarkko@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cJEc1tlE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=jarkko@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XkDWB1r9Qz30MR
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Nov 2024 05:39:02 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 956595C464B;
	Wed,  6 Nov 2024 18:38:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7ADBDC4CEC6;
	Wed,  6 Nov 2024 18:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730918340;
	bh=hfsiubwE8UnbZ9AU3TXwnnJyFZUi7Z6WW66CkyjmgSE=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=cJEc1tlEb/Iu7ty9QYtsbqpxeHIIhAwd1B/o7ga/3lskmWclVengzMkovJo2ZtxTX
	 rXPJy4VPdj3fhuyRzDu44FrX6PyDvOulc2Q7PyNNQZ8d08vF+2DksB799Ufgf2Lst7
	 Cglb2olRUwAhBBwbvEVuAb/G9s6nUromugArEMcmNsssYzujvH28hGhHfi/ZqUBGZe
	 K+gMUYk2nLcK9NfBCd1EE6V7L3ipZPTk+tINVMPWhEEHPI+UFXHjilNlzYRs6HdSry
	 kTjBT9QLOZ2T2gJEgnhJNP45YDOpQxdcJmUr2EaLcjbrg/MqcHFYeDbTQfk6xXahsU
	 JBdlrFEZyms5Q==
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
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 06 Nov 2024 20:38:55 +0200
Message-Id: <D5FBC9UCGZXJ.6QNQGC6T3361@kernel.org>
Cc: "Jarkko Sakkinen" <jarkko.sakkinen@iki.fi>, "Peter Huewe"
 <peterhuewe@gmx.de>, "Jason Gunthorpe" <jgg@ziepe.ca>, "Michael Ellerman"
 <mpe@ellerman.id.au>, "Nicholas Piggin" <npiggin@gmail.com>, "Christophe
 Leroy" <christophe.leroy@csgroup.eu>, "Naveen N. Rao"
 <naveen.n.rao@linux.ibm.com>, <linux-kernel@vger.kernel.org>,
 <linux-integrity@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH] tpm: atmel: Drop PPC64 specific MMIO setup
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Rob Herring" <robh@kernel.org>
X-Mailer: aerc 0.18.2
References: <20240702161052.3563599-1-robh@kernel.org>
 <D2RSWMPFF8KK.X5HZZMHANQMO@iki.fi> <D2RT0J8KXY1H.3MEV7KGQXTWHW@iki.fi>
 <CAL_JsqJDX+uOSoPh6pTNEP0vBLwcP3bKmAW1wCr_0cVr5fsPcg@mail.gmail.com>
 <D2SSH5HSDHQS.2YJSB22W3MHQK@iki.fi>
 <CAL_JsqLF+gs9e1TL1yi-xAZJRx4Kz7fOk=2wcF8kCqU3vyMWZA@mail.gmail.com>
 <D5FAVRTM32ZJ.1HFCHF3L9I68C@kernel.org>
 <D5FAXEKQ71ZJ.1U9AE15UVWRT9@kernel.org>
 <CAL_JsqJdabUmgOEe29y4o5muOnh83V7rS=YwfXMtZ+Fugcgzdw@mail.gmail.com>
In-Reply-To: <CAL_JsqJdabUmgOEe29y4o5muOnh83V7rS=YwfXMtZ+Fugcgzdw@mail.gmail.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed Nov 6, 2024 at 8:32 PM EET, Rob Herring wrote:
> On Wed, Nov 6, 2024 at 12:19=E2=80=AFPM Jarkko Sakkinen <jarkko@kernel.or=
g> wrote:
> >
> > On Wed Nov 6, 2024 at 8:17 PM EET, Jarkko Sakkinen wrote:
> > > > Whatever happened to this? Can you please apply my patch if you don=
't
> > > > have the time for further rework.
> > >
> > > Sorry unintentional.
> > >
> > > I applied with
> > >
> > > -static void __iomem * atmel_get_base_addr(unsigned long *base, int *=
region_size)
> > > +static void __iomem *atmel_get_base_addr(unsigned long *base, int *r=
egion_size)
> > >
> > > as this gives checkpatch error.
> >
> > See:
> > https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git/=
commit/?id=3Db18ffd5e0faaa02bffda61e19a013573451008d4
> >
> > If that looks good to you, I can mirror it to -next.
>
> Looks good. Thanks.

Ya, an my sincere apologies!

>
> Rob


BR, Jarkko

