Return-Path: <linuxppc-dev+bounces-9762-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6357BAE8778
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jun 2025 17:08:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bS4vM3ZJhz30MY;
	Thu, 26 Jun 2025 01:08:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750864095;
	cv=none; b=IqDUka3tqD6A8yGeXl8idoB/PLhaU3qeOT1BhRiqQDmjD06p1NuLvEcJi0t2QJ3d/QFqCqAt1liy28ReQU0AMqQhZinFc2xjjK2BJYoCgjPOnsYgxk8qGAN3RTmjzNZtxxohSeN5XMBuzIdbit4y5kHJjHWdOZtPhd+R+Z/rBGBtDW+fF+SuFRdh803kSzwL3GKwCs+cpLKy+3RSgoGbkKMhhV3a9PoEMqIpCqG7Dt569yQULU29U+ibozj8dOc7Ote9USDI36q0g+XwoR8mlgccDEW6F/jNJkTdaotQRsyqeUm4c2zYUQkzqYp8D4a3OBxkvCTHDAlnaRnRtoZORg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750864095; c=relaxed/relaxed;
	bh=9xGXQ19jz5gBhAI7zA5nQj//6n0DPmJeqF13kJfmQqo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cjg8Ng4yl7KwVYbd3b5y9/aimfxYtPHOkmanecrWLHyDTbSDz0C2rB7s13R2N2To98pcP+rHoNkvReqXsi2Fzu6pdC1LZmZz5QUiwYHCxd4HaV/Qc7s8/2mA6NCNiBaFrAiksE4JZabwSn9mJBRfv4GnGt1MIlndfmaKKyFOsk472att+1T6xduLuXPjNYTvBouEcpWO7/dUHvS+Xfx77BnfpU3BEEmflZsXD86srq2swFe+ombgXvFNyRGqEpQfRsM7AaGxVb0nOIgBwfjCDBP+SUKrYvvyMxmun5rUb0cq00T4rzW7C3uTlra2WRkPrYZTuipjeaP/BfHf/QFz2g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=J1rWhMDm; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=jarkko@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=J1rWhMDm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=jarkko@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bS4vL1l7kz30Lt
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jun 2025 01:08:14 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7CAC9A52B62;
	Wed, 25 Jun 2025 15:08:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4D85C4CEEA;
	Wed, 25 Jun 2025 15:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750864091;
	bh=2gBptdzqxqqhgORGmH4ar6orPA4C1xLI0BROKOAbAXw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J1rWhMDmtU7pLN+ccNfJuhEK6e5nNYS1fqurneQ5iWjVcl7LJp8AhWo1AbsSBYP/Z
	 alaPl520BQs1yqudvJdaANJeTJlJEoA8VhUE9OLs0irB1mhcbkxDt8O53vJNrVUa6t
	 3VRVyIKCiQyrovz7ApexspI1f3uLTFGYF6fd/p0GaQE/F3Tjm31tzma3OA0uAk0iG1
	 09TOSfa7jDn1DhSt/CrIPICqXqiP02PXTRjanePiTxpMiV2Br7FYAyBRpLJxIfOHaz
	 qAViaEpgY8YGy+I5iQjFyrONfOw7qeZVWzGC8if1BwUyvEAGcR587AC9/7jrDgolhV
	 pHe+0hwHNuz3Q==
Date: Wed, 25 Jun 2025 18:08:07 +0300
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: linux-kernel@vger.kernel.org,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Naveen N Rao <naveen@kernel.org>,
	Sumit Garg <sumit.garg@kernel.org>, linux-integrity@vger.kernel.org,
	Peter Huewe <peterhuewe@gmx.de>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Nicholas Piggin <npiggin@gmail.com>, Jason Gunthorpe <jgg@ziepe.ca>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: Re: [PATCH v6 4/4] tpm/tpm_svsm: support TPM_CHIP_FLAG_SYNC
Message-ID: <aFwQ129i_HYzG3aY@kernel.org>
References: <20250620130810.99069-1-sgarzare@redhat.com>
 <20250620130810.99069-5-sgarzare@redhat.com>
 <aFvlaY0BNjaGxU1D@kernel.org>
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
In-Reply-To: <aFvlaY0BNjaGxU1D@kernel.org>
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Jun 25, 2025 at 03:02:54PM +0300, Jarkko Sakkinen wrote:
> On Fri, Jun 20, 2025 at 03:08:10PM +0200, Stefano Garzarella wrote:
> > From: Stefano Garzarella <sgarzare@redhat.com>
> > 
> > This driver does not support interrupts, and receiving the response is
> > synchronous with sending the command.
> > 
> > Enable synchronous send() with TPM_CHIP_FLAG_SYNC, which implies that
> > ->send() already fills the provided buffer with a response, and ->recv()
> > is not implemented.
> > 
> > Keep using the same pre-allocated buffer to avoid having to allocate
> > it for each command. We need the buffer to have the header required by
> > the SVSM protocol and the command contiguous in memory.
> > 
> > Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> > ---
> > v5:
> > - changed order and parameter names to match tpm_try_transmit() [Jarkko]
> > v4:
> > - reworked commit description [Jarkko]
> > ---
> >  drivers/char/tpm/tpm_svsm.c | 27 +++++++++++----------------
> >  1 file changed, 11 insertions(+), 16 deletions(-)
> > 
> > diff --git a/drivers/char/tpm/tpm_svsm.c b/drivers/char/tpm/tpm_svsm.c
> > index 0847cbf450b4..f5ba0f64850b 100644
> > --- a/drivers/char/tpm/tpm_svsm.c
> > +++ b/drivers/char/tpm/tpm_svsm.c
> > @@ -26,37 +26,31 @@ struct tpm_svsm_priv {
> >  };
> >  
> >  static int tpm_svsm_send(struct tpm_chip *chip, u8 *buf, size_t bufsiz,
> > -			 size_t len)
> > +			 size_t cmd_len)
> >  {
> >  	struct tpm_svsm_priv *priv = dev_get_drvdata(&chip->dev);
> >  	int ret;
> >  
> > -	ret = svsm_vtpm_cmd_request_fill(priv->buffer, 0, buf, len);
> > +	ret = svsm_vtpm_cmd_request_fill(priv->buffer, 0, buf, cmd_len);
> >  	if (ret)
> >  		return ret;
> >  
> >  	/*
> >  	 * The SVSM call uses the same buffer for the command and for the
> > -	 * response, so after this call, the buffer will contain the response
> > -	 * that can be used by .recv() op.
> > +	 * response, so after this call, the buffer will contain the response.
> > +	 *
> > +	 * Note: we have to use an internal buffer because the device in SVSM
> > +	 * expects the svsm_vtpm header + data to be physically contiguous.
> >  	 */
> > -	return snp_svsm_vtpm_send_command(priv->buffer);
> > -}
> > -
> > -static int tpm_svsm_recv(struct tpm_chip *chip, u8 *buf, size_t len)
> > -{
> > -	struct tpm_svsm_priv *priv = dev_get_drvdata(&chip->dev);
> > +	ret = snp_svsm_vtpm_send_command(priv->buffer);
> > +	if (ret)
> > +		return ret;
> >  
> > -	/*
> > -	 * The internal buffer contains the response after we send the command
> > -	 * to SVSM.
> > -	 */
> > -	return svsm_vtpm_cmd_response_parse(priv->buffer, buf, len);
> > +	return svsm_vtpm_cmd_response_parse(priv->buffer, buf, bufsiz);
> >  }
> >  
> >  static struct tpm_class_ops tpm_chip_ops = {
> >  	.flags = TPM_OPS_AUTO_STARTUP,
> > -	.recv = tpm_svsm_recv,
> >  	.send = tpm_svsm_send,
> >  };
> >  
> > @@ -85,6 +79,7 @@ static int __init tpm_svsm_probe(struct platform_device *pdev)
> >  
> >  	dev_set_drvdata(&chip->dev, priv);
> >  
> > +	chip->flags |= TPM_CHIP_FLAG_SYNC;
> >  	err = tpm2_probe(chip);
> >  	if (err)
> >  		return err;
> > -- 
> > 2.49.0
> > 
> 
> Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>

Applied.

BR, Jarkko

