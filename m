Return-Path: <linuxppc-dev+bounces-8824-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90755ABF110
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 May 2025 12:12:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b2S0D3P2Xz3c1L;
	Wed, 21 May 2025 20:12:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747822348;
	cv=none; b=bx9YXhckGoYZtty8r58uitaEKGqAUeJc5mrBedXg2RQwpvPOx8eS3oBuuli4BjR94f0IP9WQfM0EXhzRyo5wAZxsAbrPiHThbQ7H0UECw1xiW/q1LYWqYIpH38oIbzU7oJgIe85vG2MclwfMvqzAMZx0MYye8rim+yWgdG61XYmOmxuJmvul/lyp9FKQqMHcDm5qRd1f3WBlyOOpQsiPf7bLzBM4ZAa1HFvoH2eeYwC3z2imj58Q4yClLXxMDPlEzRqJAaw8EomEhoFcJ/SWzqkSlHagCiRv9Gq/UViidH1uEumyaC6QDx6XCOy1jj27jKjsrGEMvdqIYM2WrY+Kkw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747822348; c=relaxed/relaxed;
	bh=HhJHdXYshRD74blT0tjNUs/oT2DyVbyz0TuZi98jhZw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NeBS87jRvsEVEoUruR2/AAKtiVYkn+pHPX0G8tqITB5S0gftPjVIWwpF153d6pre2F91EEuIHtqks+3GWaqUZ5Kd+wI6MaBChxoAXsNSnbM9k5xvjugTz0zfzsl5hj7sDT7rez6claM7VVPc4f+XCG4UBjKHWGD0dpQb30sGJMAsCCCFpnrJuEaZJeDQLM2aMrlKJxgwndYz3sxblm97fyypo9m6G6IF7mR6AM2jXKTxUj2SVe5uIV0qpsG21lTaN17H1WbhR57/pWvxQeYdG/Gnp+MuW4t8m0j7OtS9Zsy1OXczxkKjO9U7VKIHolHN8L1sZ5Ifb4gXQQuqpaljlQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YLXOzE9H; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=jarkko@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YLXOzE9H;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=jarkko@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b2S0C4VsWz3byP
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 May 2025 20:12:27 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A815C629E2;
	Wed, 21 May 2025 10:12:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA7E2C4CEED;
	Wed, 21 May 2025 10:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747822344;
	bh=21cNdzYwUJJBEkAHlt7+sFsml8d7DmKbNlD2kUZGKoQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YLXOzE9HyCy+kC79+nUGLtvp+0cxfR2TUqkZ6h0MDnnvdFk9pskQlEjRl/46ec7W2
	 TH/x2jlNbam+Us8NSZrtDSx/HbFXHChCs8KdGoSNvyu+6GIK/tABEAfZ5EIJ9jmwiU
	 W1JLhNCmMAminpUveLFmvUvUzyFGZbmBJ7QRISsH67ON2Eldjw5CzZuxmWFFKjhaMG
	 5hnpVMxcr0ovTQjUkq13+jJoGGK4Rsio37/Sc3vS01CWAzkYtLStJsFev+cYzyIB6D
	 cA1Q961SLiRbMcoD6c9XC2jiHOXhz5nQrAyKFReCRaKuiywBNVKDMxR59cSAmmioWM
	 B1TrXzju+oOcQ==
Date: Wed, 21 May 2025 13:12:20 +0300
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
Message-ID: <aC2nBCxkvWWz5y5E@kernel.org>
References: <20250514134630.137621-1-sgarzare@redhat.com>
 <20250514134630.137621-5-sgarzare@redhat.com>
 <aCVHQ-LRqHeEVEAW@kernel.org>
 <CAGxU2F5AsNY5mQPd=qajW1seFYHSYpB0Fa1iuR_f2QavtoB6sA@mail.gmail.com>
 <aCzf6aoJAC-IdS_n@kernel.org>
 <CAGxU2F6rfqGV_gJk-JxrCk3f9dWtYn_3o9RODh7cVG0X_oQWaA@mail.gmail.com>
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
In-Reply-To: <CAGxU2F6rfqGV_gJk-JxrCk3f9dWtYn_3o9RODh7cVG0X_oQWaA@mail.gmail.com>
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, May 21, 2025 at 09:13:34AM +0200, Stefano Garzarella wrote:
> On Tue, 20 May 2025 at 22:02, Jarkko Sakkinen <jarkko@kernel.org> wrote:
> > On Tue, May 20, 2025 at 06:06:50PM +0200, Stefano Garzarella wrote:
> > > On Thu, 15 May 2025 at 03:45, Jarkko Sakkinen <jarkko@kernel.org> wrote:
> > > > On Wed, May 14, 2025 at 03:46:30PM +0200, Stefano Garzarella wrote:
> > > > > From: Stefano Garzarella <sgarzare@redhat.com>
> > > > >
> > > > > This driver does not support interrupts, and receiving the response is
> > > > > synchronous with sending the command.
> > > > >
> > > > > Enable synchronous send() with TPM_CHIP_FLAG_SYNC, which implies that
> > > > > ->send() already fills the provided buffer with a response, and ->recv()
> > > > > is not implemented.
> > > > >
> > > > > Keep using the same pre-allocated buffer to avoid having to allocate
> > > > > it for each command. We need the buffer to have the header required by
> > > > > the SVSM protocol and the command contiguous in memory.
> > > > >
> > > > > Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> > > > > ---
> > > > > v5:
> > > > > - changed order and parameter names to match tpm_try_transmit() [Jarkko]
> > > > > v4:
> > > > > - reworked commit description [Jarkko]
> > > > > ---
> > > > >  drivers/char/tpm/tpm_svsm.c | 27 +++++++++++----------------
> > > > >  1 file changed, 11 insertions(+), 16 deletions(-)
> > > > >
> 
> [...]
> 
> > > >
> > > > I can pick this for 6.16.
> > >
> > > Great, thanks!
> >
> > Can you rebase this on top of my next branch and send one more version
> > of the series (fake ancestor crap)?
> 
> I tried, but the last patch (this one) is based on the series merged
> on the tip tree, where I introduced tpm_svsm.
> I can see that series in linux-next merged with commit
> 16a56ee59ab8ee05e67de35bbb5782ef9cfb4f07,
> but I can't see it in your next tree [1].
> 
> How do we proceed in such cases?
> 
> Just to be sure, did I use the right tree?

Thanks for the remark. Lemme check tonight. Hold on doing
anything ;-) We'll get there...

> 
> Thanks,
> Stefano
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git/log/?h=next
> 
> 

BR, Jarkko

