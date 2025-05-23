Return-Path: <linuxppc-dev+bounces-8919-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3307AC270F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 May 2025 18:02:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b3qfq3KBBz301N;
	Sat, 24 May 2025 02:02:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748016131;
	cv=none; b=d3AGCpQ/dhZ7DzbXIPZf2fWu7GHUzbecWLkMGwyqGxswrtxXP8iqNi9VJFmHXMme1uwREK3kl22yI65DMEK0FzwaDnRhCsAIzkCR7r/K/I2hEiHSST66boYar9a1FvhmvOPCTfJo48HTCP48tUqUwM4WiNfqWayzVOgTvlOT4D2NIUbMagM/QGwGLg03WpOfeuxCUJ2+x+04KDbKyxoE131N7W4Nv4vy9z5j/Ll4VQyZ2KIosnv/Y9XE9R7n2Ms87c8y5hNGqa2rZovvZmAh+aSOxBLncVcnjct24jJR+mHwTDjYzLDCTFMw3v7iXzvfz53nJSYlfYfolMdpTa1Djw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748016131; c=relaxed/relaxed;
	bh=uV/pjlPBiCsCwTtFEFEknHpW0wdS4DsNlsekE5grkJQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B4V/XhL3CfoUJju4YmSsrINVtFKjHeKjUm1NzuKTFhvGaTV/s5KI0v2GGSHuz+Ez+yFfJuAyqio3+PRbzmlWlsqYeuwKQN8Kn4DWQEZApGBgdw0UolJ0Mo5n2b7SyBXG/w0KSVM+/8BpGVqFDc+/wMErPoYatX80JiDEVGws47N3lcOcWyfG1ZKGU62SY7y8AuLIqYKZC3QKpgwW1/pZ4T7roYvInYEjetl3e4fTkcBVsPRacGv1kh/btpephoqU+pi20CLAL68SKoo805ig9ZW5WMMOx8ynCmXFr66DZ0dDUvlsFrj74C+3oS4nlPaZQ7RxWWxVtnrpxiaNcs4LnA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=B1cJjoD2; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=jarkko@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=B1cJjoD2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=jarkko@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b3qfp4x6Cz2yrp
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 May 2025 02:02:10 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A93155C5A8F;
	Fri, 23 May 2025 15:59:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBDF2C4CEE9;
	Fri, 23 May 2025 16:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748016128;
	bh=qgYSTT9XcSyqI+DBeYRkhP8s0z5sSZV+A60zwa1m+G0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B1cJjoD22VVrq7n3ZjtSjCKVoJHel3VRZawP05ZnRpXIj+3lQiQJUxTt1+DGwjiXj
	 qiD93PYBeFeRoR4Y3uogSidZFUVxB7MStQE+euuIHup4TCaudxawDUawpio9ybD3fV
	 AhaIZCgcDC/8VysRupdDwrUkEyvyKG0zpXtpASfDrEGSCKnxvivqTg5i0KP3P9b+FB
	 mmLwMGNrE7wvYDNWfWFIHneeun9Yry7a5r75iW1d1T3oepXmg2ZnV6I2Usv1sfwjVf
	 xTzDLnpyvW96MaSXDzQ9odJXIZZEAHIUziVTI2IlbG+IwS5CJij5MfbH4ZTOpxNbdp
	 qxaXWEl1wc40g==
Date: Fri, 23 May 2025 19:02:03 +0300
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: linuxppc-dev@lists.ozlabs.org, Peter Huewe <peterhuewe@gmx.de>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	linux-integrity@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-arm-kernel@lists.infradead.org,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Sumit Garg <sumit.garg@kernel.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, linux-kernel@vger.kernel.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v5 4/4] tpm/tpm_svsm: support TPM_CHIP_FLAG_SYNC
Message-ID: <aDCb-wkHGoLQ-IGg@kernel.org>
References: <20250514134630.137621-1-sgarzare@redhat.com>
 <20250514134630.137621-5-sgarzare@redhat.com>
 <aCVHQ-LRqHeEVEAW@kernel.org>
 <CAGxU2F5AsNY5mQPd=qajW1seFYHSYpB0Fa1iuR_f2QavtoB6sA@mail.gmail.com>
 <aCzf6aoJAC-IdS_n@kernel.org>
 <CAGxU2F6rfqGV_gJk-JxrCk3f9dWtYn_3o9RODh7cVG0X_oQWaA@mail.gmail.com>
 <aC2nBCxkvWWz5y5E@kernel.org>
 <aC4CVUXpThAyKQdf@kernel.org>
 <CAGxU2F5zQJR4GvZ9ovtQBqMFGs-wBMoCRks=JYQ1JF6qMKK-6g@mail.gmail.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGxU2F5zQJR4GvZ9ovtQBqMFGs-wBMoCRks=JYQ1JF6qMKK-6g@mail.gmail.com>
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, May 22, 2025 at 10:26:34AM +0200, Stefano Garzarella wrote:
> On Wed, 21 May 2025 at 18:42, Jarkko Sakkinen <jarkko@kernel.org> wrote:
> >
> > On Wed, May 21, 2025 at 01:12:20PM +0300, Jarkko Sakkinen wrote:
> > > > I tried, but the last patch (this one) is based on the series merged
> > > > on the tip tree, where I introduced tpm_svsm.
> > > > I can see that series in linux-next merged with commit
> > > > 16a56ee59ab8ee05e67de35bbb5782ef9cfb4f07,
> > > > but I can't see it in your next tree [1].
> > > >
> > > > How do we proceed in such cases?
> > > >
> > > > Just to be sure, did I use the right tree?
> > >
> > > Thanks for the remark. Lemme check tonight. Hold on doing
> > > anything ;-) We'll get there...
> >
> > I just rebased my branches on top of latest from Linus. That is what I
> > need base PR also on, and:
> >
> > $ git show 16a56ee59ab8ee05e67de35bbb5782ef9cfb4f07
> > fatal: bad object 16a56ee59ab8ee05e67de35bbb5782ef9cfb4f07
> >
> > I'd use git cherry-pick on a range to take them from linux-next to a
> > mainline tip...
> 
> I see, let me know if I can help in some way.
> 
> We can also wait the next cycle if it simplifies your work, definitely
> no rush on my side.

Let's do it. At least it will then get a full round of testing before
ending up to a release.

Thank you!

> 
> Thanks,
> Stefano

BR, Jarkko

