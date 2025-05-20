Return-Path: <linuxppc-dev+bounces-8768-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E62ABE44E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 May 2025 22:02:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b25801R7mz30BW;
	Wed, 21 May 2025 06:02:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747771376;
	cv=none; b=Lt9zScXsNxZU0PkdwpVZGFNMwu1moPVoR3jZRTwe2sBMB4rPo4kQsboEhLf5onrOX+5qlheRv8Zm5ZDMkAsET6FKVJLUxUpNUPxyJpFizMIFlNWqfGoonAWkEq7uVlv38jyJCuX0OEHAY+bdw0NsWdfmnwx8kw9fmpHVu+59UrtrCAOdRd2XZH2qAVe/+4bw2O0+ffEzT9N+1KNt1esp6PJERoau0EIpodPsVGBm9UMAyqvV6bPGNt7VjihzpUvd22bNGnp0ke4QGZBQbCuZI+Ag2BWesZSHCD980edgVAyz0aylxEE+ZlAh6IWZA3jc10J5XAYk4jN0yHFmfCGsyg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747771376; c=relaxed/relaxed;
	bh=+Kq4vyvCOzwMXjMugvDzDXWKbOHVjshLZaUXVLhkgyg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T0eT52B85brY2qXNPiYV5OVE4mrhasB5vTNe8pq5+HHPxOrax8SgoTzGZR3aisq1xb1YDr+/JwJE7/wgJ0Du9M7HZvSlcUYm41auiu3ln539LOZrbW2eFWg0IszPSQfUxCBFBZIDikzQLQy0NmHkx1riK5ntCrWFBil1xVVxAULE+ymskl6d6wCvcvRBsg4ZlwS6jkPn7YCe/1+bxJ5tQt5J1Js3F/95yUxrHF4nBIKLu7CcmGB0L05/j8JNqY5isHwJSjQJIg5gjSyvqPCflhoffkZMIv4w3Xk7jmF9hUo63l+yWo55WBZKUvXqrNMyuguL5BKVk6ShKEcG8epmDw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dLhb1sSF; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=jarkko@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dLhb1sSF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=jarkko@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b257z2VXhz305P
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 May 2025 06:02:55 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1AE6B44275;
	Tue, 20 May 2025 20:02:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C612C4CEE9;
	Tue, 20 May 2025 20:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747771373;
	bh=ipb1eCljeIm2r5OkPhtSsa9n7gXb96lo1YYOTFP6ZPU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dLhb1sSFzls6z4ybonOCIe75fqv5xXE/hup5qinNdeuHoGd8MuPuOzlXXBO9wl/8f
	 Hh/5LQiTqGwYS7l+HT2NlPKflmOHvkwjZ0E0l5Od8hav8x2u5jTo3wpcu7ms4/xc8Y
	 rrirDQSHOhDouqRY0ThHP5RPBaQ99RqtIViakrmmw02J0NkyR08Sqgl9x/m34+E38W
	 ZtLIDsqOJnIEBm9GODFUfpIF0vIBoM6iZNmT7UjcN56ul0EMvOWaMJMq97TVUMWCgO
	 0AQBNZE275z5UeHLQoyyLzjlXlZvZnkzB+CbngW8H3F5wxFd4Ym1OcUtaqnMUqD9nA
	 ZQO3bRsWqj1Uw==
Date: Tue, 20 May 2025 23:02:49 +0300
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
Message-ID: <aCzf6aoJAC-IdS_n@kernel.org>
References: <20250514134630.137621-1-sgarzare@redhat.com>
 <20250514134630.137621-5-sgarzare@redhat.com>
 <aCVHQ-LRqHeEVEAW@kernel.org>
 <CAGxU2F5AsNY5mQPd=qajW1seFYHSYpB0Fa1iuR_f2QavtoB6sA@mail.gmail.com>
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
In-Reply-To: <CAGxU2F5AsNY5mQPd=qajW1seFYHSYpB0Fa1iuR_f2QavtoB6sA@mail.gmail.com>
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, May 20, 2025 at 06:06:50PM +0200, Stefano Garzarella wrote:
> On Thu, 15 May 2025 at 03:45, Jarkko Sakkinen <jarkko@kernel.org> wrote:
> >
> > On Wed, May 14, 2025 at 03:46:30PM +0200, Stefano Garzarella wrote:
> > > From: Stefano Garzarella <sgarzare@redhat.com>
> > >
> > > This driver does not support interrupts, and receiving the response is
> > > synchronous with sending the command.
> > >
> > > Enable synchronous send() with TPM_CHIP_FLAG_SYNC, which implies that
> > > ->send() already fills the provided buffer with a response, and ->recv()
> > > is not implemented.
> > >
> > > Keep using the same pre-allocated buffer to avoid having to allocate
> > > it for each command. We need the buffer to have the header required by
> > > the SVSM protocol and the command contiguous in memory.
> > >
> > > Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> > > ---
> > > v5:
> > > - changed order and parameter names to match tpm_try_transmit() [Jarkko]
> > > v4:
> > > - reworked commit description [Jarkko]
> > > ---
> > >  drivers/char/tpm/tpm_svsm.c | 27 +++++++++++----------------
> > >  1 file changed, 11 insertions(+), 16 deletions(-)
> > >
> > > diff --git a/drivers/char/tpm/tpm_svsm.c b/drivers/char/tpm/tpm_svsm.c
> > > index 0847cbf450b4..f5ba0f64850b 100644
> > > --- a/drivers/char/tpm/tpm_svsm.c
> > > +++ b/drivers/char/tpm/tpm_svsm.c
> > > @@ -26,37 +26,31 @@ struct tpm_svsm_priv {
> > >  };
> > >
> > >  static int tpm_svsm_send(struct tpm_chip *chip, u8 *buf, size_t bufsiz,
> > > -                      size_t len)
> > > +                      size_t cmd_len)
> > >  {
> > >       struct tpm_svsm_priv *priv = dev_get_drvdata(&chip->dev);
> > >       int ret;
> > >
> > > -     ret = svsm_vtpm_cmd_request_fill(priv->buffer, 0, buf, len);
> > > +     ret = svsm_vtpm_cmd_request_fill(priv->buffer, 0, buf, cmd_len);
> > >       if (ret)
> > >               return ret;
> > >
> > >       /*
> > >        * The SVSM call uses the same buffer for the command and for the
> > > -      * response, so after this call, the buffer will contain the response
> > > -      * that can be used by .recv() op.
> > > +      * response, so after this call, the buffer will contain the response.
> > > +      *
> > > +      * Note: we have to use an internal buffer because the device in SVSM
> > > +      * expects the svsm_vtpm header + data to be physically contiguous.
> > >        */
> > > -     return snp_svsm_vtpm_send_command(priv->buffer);
> > > -}
> > > -
> > > -static int tpm_svsm_recv(struct tpm_chip *chip, u8 *buf, size_t len)
> > > -{
> > > -     struct tpm_svsm_priv *priv = dev_get_drvdata(&chip->dev);
> > > +     ret = snp_svsm_vtpm_send_command(priv->buffer);
> > > +     if (ret)
> > > +             return ret;
> > >
> > > -     /*
> > > -      * The internal buffer contains the response after we send the command
> > > -      * to SVSM.
> > > -      */
> > > -     return svsm_vtpm_cmd_response_parse(priv->buffer, buf, len);
> > > +     return svsm_vtpm_cmd_response_parse(priv->buffer, buf, bufsiz);
> > >  }
> > >
> > >  static struct tpm_class_ops tpm_chip_ops = {
> > >       .flags = TPM_OPS_AUTO_STARTUP,
> > > -     .recv = tpm_svsm_recv,
> > >       .send = tpm_svsm_send,
> > >  };
> > >
> > > @@ -85,6 +79,7 @@ static int __init tpm_svsm_probe(struct platform_device *pdev)
> > >
> > >       dev_set_drvdata(&chip->dev, priv);
> > >
> > > +     chip->flags |= TPM_CHIP_FLAG_SYNC;
> > >       err = tpm2_probe(chip);
> > >       if (err)
> > >               return err;
> > > --
> > > 2.49.0
> > >
> > >
> >
> > I can pick this for 6.16.
> 
> Great, thanks!

Can you rebase this on top of my next branch and send one more version
of the series (fake ancestor crap)?

> 
> Stefano
> 

BR, Jarkko

