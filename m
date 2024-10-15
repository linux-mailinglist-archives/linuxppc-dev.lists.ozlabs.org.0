Return-Path: <linuxppc-dev+bounces-2298-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2E099FB4B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Oct 2024 00:22:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XSpW72xPjz30Ns;
	Wed, 16 Oct 2024 09:22:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729030947;
	cv=none; b=TbtQDv3VE5G9fUszKxC/lt4KSf4n3bGnJxjcMsUPbpFOTX6z5MLoXo4VNjAMVLS8sCkR49edPRJNr10IWYAfxXY6EprgmikccqVRu9KlG7QenMC6hr1fwFlqUg0E2NRVfWc+ki1kAyxZXG40KXQ8TnxxjmUklci8pxMi6dzez31BBJ8xkOSmSDU3xg3pCiHyHa1UWnShcg5Q4c+GBaGvaJEO9sGFMZEXbLstXCTNuiDgrOPJ6J7OpkUFmPZlMivXx6XRbnSrZWsxs2lnzkzLiBeLOY740RkuBhrjCB1hVazCkq/cSWY85hatKk+mFGMSc6bZPpxjsqdhQeWjvJ2+cw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729030947; c=relaxed/relaxed;
	bh=6ugHXW9yFQCZN53eQJhBLjBjx1Ppe9ONpfCh1iJ7pro=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=TpYt3sSui5zq1fVfFIRQh9BRqjIYzwrX9zbfjcZO87xteuHxLD32qBt7nGDRECO09V3mtjYTGx6VqVOgkE70uvF9Sd3jP/H/a+jJUdE3yUKBaN/bzs9a3VycmjjaDRQeB1v45nyYeZGBTUO6R5w01lTIlxudH2kf3pbcHza5thA26j2gQEYR5iVzcYEg/JGFniBR9nnrF8OBvlUPmdKIr5y+oVCnlTgpRXEhz8ckYMkb12jC/KSmXTXSFLplfgDDFbAJ1g7CxYXR4vuo/rez9ZmASEYeBD0RqWKuTHkkYOjYPqsd6Glg0iX0SySpxl/m/F/e7wQ+7YIHutkNwKtxoA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BrrekJPW; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=jarkko@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BrrekJPW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=jarkko@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XSpW574wKz2y1W
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Oct 2024 09:22:25 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 41EDBA435E7;
	Tue, 15 Oct 2024 22:22:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74879C4CEC6;
	Tue, 15 Oct 2024 22:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729030942;
	bh=MqROk6YiTzTKr8OCAw+4XexydexhAVUg7ZMIG1b65C0=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=BrrekJPW1u5fZxEozOw7RtkxN67hwQ9ET/sf+sss57ND6gSnsEip1T4DXrCOg0Rne
	 GFFahu7ocXCaKv1csTuoMrjIfbmfUPf7gU0aJxd5QRkz51dtokK9UjQsHWlrmhHwk/
	 zKBsE9fwY0LGXqWdiPSLB/CHhiQZ/ReY47CCA8fOYnovRLyEFnggFr7TC1TYpIDAGK
	 im4OYOYRQLcvwLFh83zUWvVUL6zjtK9fHLDj6tAnCEZGuOQi60aYIVTqdRE9HnMrEh
	 upoqwnwRq1PnPFT+jT4JQTF/yxL9Nr3WlcoLL1sWFaO0braD2xStwUcDdQ5hZuxGzD
	 fGTVkKGkQMeuQ==
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 16 Oct 2024 01:22:18 +0300
Message-Id: <D4WQBBTDU1Z4.3GRA9MGONWI1P@kernel.org>
Subject: Re: [PATCH] tpm: ibmvtpm: Set TPM_OPS_AUTO_STARTUP flag on driver
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Jarkko Sakkinen" <jarkko@kernel.org>, "Stefan Berger"
 <stefanb@linux.ibm.com>, <linux-integrity@vger.kernel.org>,
 <linuxppc-dev@lists.ozlabs.org>
Cc: <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.18.2
References: <20241014141643.3101129-1-stefanb@linux.ibm.com>
 <D4WOWALWYOES.Q12TQS9P30TH@kernel.org>
In-Reply-To: <D4WOWALWYOES.Q12TQS9P30TH@kernel.org>
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed Oct 16, 2024 at 12:15 AM EEST, Jarkko Sakkinen wrote:
> On Mon Oct 14, 2024 at 5:16 PM EEST, Stefan Berger wrote:
> > Set the TPM_OPS_AUTO_STARTUP on the driver so that the ibmvtpm driver n=
ow
> > uses tpm2_auto_startup and tpm1_auto_startup like many other drivers do=
.
> > Remove tpm_get_timeouts, tpm2_get_cc_attrs_tbl, and tpm2_sessions_init
> > calls from it since these will all be called in tpm2_auto_startup and
> > tpm1_auto_startup.
> >
> > The exporting of the tpm2_session_init symbol was only necessary while =
the
> > ibmvtpm driver was calling this function. Since this is not the case
> > anymore, remove this symbol from being exported.
> >
> > What is new for the ibmvtpm driver is that now tpm2_do_selftest and
> > tpm1_do_selftest will be called that send commands to the TPM to perfor=
m
> > or continue its selftest. However, the firmware should already have sen=
t
> > these commands so that the TPM will not do much work at this time.
> >
> > Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
> > ---
> >  drivers/char/tpm/tpm2-sessions.c |  1 -
> >  drivers/char/tpm/tpm_ibmvtpm.c   | 15 +--------------
> >  2 files changed, 1 insertion(+), 15 deletions(-)
> >
> > diff --git a/drivers/char/tpm/tpm2-sessions.c b/drivers/char/tpm/tpm2-s=
essions.c
> > index 511c67061728..b1a0a37f14d7 100644
> > --- a/drivers/char/tpm/tpm2-sessions.c
> > +++ b/drivers/char/tpm/tpm2-sessions.c
> > @@ -1362,5 +1362,4 @@ int tpm2_sessions_init(struct tpm_chip *chip)
> > =20
> >  	return rc;
> >  }
> > -EXPORT_SYMBOL(tpm2_sessions_init);
> >  #endif /* CONFIG_TCG_TPM2_HMAC */
> > diff --git a/drivers/char/tpm/tpm_ibmvtpm.c b/drivers/char/tpm/tpm_ibmv=
tpm.c
> > index 1e5b107d1f3b..76d048f63d55 100644
> > --- a/drivers/char/tpm/tpm_ibmvtpm.c
> > +++ b/drivers/char/tpm/tpm_ibmvtpm.c
> > @@ -450,6 +450,7 @@ static bool tpm_ibmvtpm_req_canceled(struct tpm_chi=
p *chip, u8 status)
> >  }
> > =20
> >  static const struct tpm_class_ops tpm_ibmvtpm =3D {
> > +	.flags =3D TPM_OPS_AUTO_STARTUP,
> >  	.recv =3D tpm_ibmvtpm_recv,
> >  	.send =3D tpm_ibmvtpm_send,
> >  	.cancel =3D tpm_ibmvtpm_cancel,
> > @@ -690,20 +691,6 @@ static int tpm_ibmvtpm_probe(struct vio_dev *vio_d=
ev,
> >  	if (!strcmp(id->compat, "IBM,vtpm20"))
> >  		chip->flags |=3D TPM_CHIP_FLAG_TPM2;
> > =20
> > -	rc =3D tpm_get_timeouts(chip);
> > -	if (rc)
> > -		goto init_irq_cleanup;
> > -
> > -	if (chip->flags & TPM_CHIP_FLAG_TPM2) {
> > -		rc =3D tpm2_get_cc_attrs_tbl(chip);
> > -		if (rc)
> > -			goto init_irq_cleanup;
> > -
> > -		rc =3D tpm2_sessions_init(chip);
> > -		if (rc)
> > -			goto init_irq_cleanup;
> > -	}
> > -
> >  	return tpm_chip_register(chip);
> >  init_irq_cleanup:
> >  	do {
>
> Not much to say about this ;-)
>
> Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>

Also applied to master. I think that it is better to gather all TPM
bus protection fixes there and send a single pull request for v6.12 with
all the content. So this would include my fixes for AMD issue, this
patch and Mimi's patch.

And also perhaps a few more would squeeze in before that time. E.g.
tpm2_get_random() would be one such place, which could be heavily
optimized by pooling the implementation with couple of thresholds
(lo and hi), and then filling the pool with fixed size requests
from the TPM, i.e.

1: Going below lo: start filling the pool
2. Going above hi: stop filling the pool

perhaps using workqueue. Hwrng would never trigger any TPM command
but instead would be served from the pool what's left there. That
pool could be even something like struct tpm_random_pool with pool
and the tresholds, thus allowing different callers to have their
own.

Sorry, just using this space to document the design to lore :-)

BR, Jarkko

