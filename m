Return-Path: <linuxppc-dev+bounces-8196-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 200B3AA50C3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Apr 2025 17:49:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZnhT76ygvz3bn0;
	Thu,  1 May 2025 01:49:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746028187;
	cv=none; b=mgGD6rOVGjkRFa1jcrXqFRLN/5JiMwOxV/fMRa3RYiF8du8162o7P/EBcUada/Hl1vgwWG56AKK0pfMZFVCpAJCpHrBt5rI6QuI+s1o9gOO9RAvHPBji0Aa66ouFYv53OIUjpHXYlqGJBmuw7oCV4BoA9ekLPH8hAUo4jq8FK68q5L/MWLfaVNHI7ZczFdi9LIPzYz5erb+HQ3opQqg9206yJsBQgahLnXKP2xmItrngCXFNVj8IswNdLhqgm3Gkvbb2q44PgTs2Rp7WGCpA5CI+3q3bz4Zz7+nADmOIxmIdUxfnKgVrd7782CwiBa1poCLp5EWIUcIc80bphAEOLw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746028187; c=relaxed/relaxed;
	bh=FgocyTvxZfhULZGwGvCgXkcqLIHnxY9W7xUsWeiydkY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aVOYBZEgYJaI0xqY1JmgOxSKuRqLCAdIvg/rPI1r0RRcvdzLXaRz+yWMb5vOZ7eHdNg4HpfSCMDXtHOA15Yg2sxS74IU9Qt1juDpIpWWAQZGItpklK5ZtnqxEnqb4uohMBy3+j+6ehM4/rn35cONtVQnz5usmI2Pn/uETnv98pShMWpdiqpQBoIN2j/O0Vo6AJOnFrNGMpYH99KCCukFNexZyn6qv1QS6jQnHSmiMijuSKpeM+5N8RJ2U4GzsaZnugzQwwUY3aU0fwqmKpo8TwwnJO2ecD2NCgG4m5/plvCYTonawC3wjyAyb8pyywSyXOX7PibOotJw87T+SYiHSA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ILkRzJmx; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=jarkko@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ILkRzJmx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=jarkko@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZnhT66knhz301G
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 May 2025 01:49:46 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A83126842A;
	Wed, 30 Apr 2025 15:49:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB48DC4CEE7;
	Wed, 30 Apr 2025 15:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746028182;
	bh=jbN75Y77ia3DaPmLil5WAcGzaZgfrTs67v8JYHeLyFY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ILkRzJmxPdFObsI9MPCYwxX97C4pY7WZMUG69FkF2voL4XquCgdJqXarl/qXSmdsT
	 lIE+AMd4Db+DvmeQIlqNoL1xbfIFeUiYZIWEMhbbxTe6T82fBtJQVkcfuwBWzs9vnZ
	 2v1VvzarKWKk6kHsUF7YLUq8XDSco1Hy7lT0Owon3EWnk74hfL0VsyDxC1CugjAZrz
	 0KhAuvpzMf2pXyQG4H3hQtLNkWpqyEAMtY8aiDijMy3p5zSKqi5zD7Nsuw/CecffIl
	 Y+CFLFQ5Ck/om6P0AA0xzbTrnH45tDY2ptwuSj3T2Ag4pWXq1iPlboUxdMmHpjZus1
	 pT5EdHo2bLaXg==
Date: Wed, 30 Apr 2025 18:49:37 +0300
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	Peter Huewe <peterhuewe@gmx.de>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Naveen N Rao <naveen@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	linux-integrity@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Sumit Garg <sumit.garg@kernel.org>, linux-kernel@vger.kernel.org,
	Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH v3 4/4] tpm/tpm_svsm: support TPM_CHIP_FLAG_SYNC
Message-ID: <aBJGkSil1YAzSXsg@kernel.org>
References: <20250414145653.239081-1-sgarzare@redhat.com>
 <20250414145653.239081-5-sgarzare@redhat.com>
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
In-Reply-To: <20250414145653.239081-5-sgarzare@redhat.com>
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Apr 14, 2025 at 04:56:53PM +0200, Stefano Garzarella wrote:
> From: Stefano Garzarella <sgarzare@redhat.com>
> 
> This driver does not support interrupts, and receiving the response is
> synchronous with sending the command.
> 
> So we can set TPM_CHIP_FLAG_SYNC to support synchronous send() and
> return responses in the same buffer used for commands. This way we
> don't need to implement recv() op.
> 
> Keep using the same pre-allocated buffer to avoid having to allocate
> it for each command. We need the buffer to have the header required by
> the SVSM protocol and the command contiguous in memory.
> 
> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>

Similar comments, and a bit redundancy does not matter i.e., they can
have pretty much the same explanation.

> ---
>  drivers/char/tpm/tpm_svsm.c | 27 +++++++++++----------------
>  1 file changed, 11 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/char/tpm/tpm_svsm.c b/drivers/char/tpm/tpm_svsm.c
> index d3ca5615b6f7..db1983072345 100644
> --- a/drivers/char/tpm/tpm_svsm.c
> +++ b/drivers/char/tpm/tpm_svsm.c
> @@ -25,38 +25,32 @@ struct tpm_svsm_priv {
>  	void *buffer;
>  };
>  
> -static int tpm_svsm_send(struct tpm_chip *chip, u8 *buf, size_t len,
> +static int tpm_svsm_send(struct tpm_chip *chip, u8 *buf, size_t cmd_len,
>  			 size_t buf_size)
>  {
>  	struct tpm_svsm_priv *priv = dev_get_drvdata(&chip->dev);
>  	int ret;
>  
> -	ret = svsm_vtpm_cmd_request_fill(priv->buffer, 0, buf, len);
> +	ret = svsm_vtpm_cmd_request_fill(priv->buffer, 0, buf, cmd_len);
>  	if (ret)
>  		return ret;
>  
>  	/*
>  	 * The SVSM call uses the same buffer for the command and for the
> -	 * response, so after this call, the buffer will contain the response
> -	 * that can be used by .recv() op.
> +	 * response, so after this call, the buffer will contain the response.
> +	 *
> +	 * Note: we have to use an internal buffer because the device in SVSM
> +	 * expects the svsm_vtpm header + data to be physically contiguous.
>  	 */
> -	return snp_svsm_vtpm_send_command(priv->buffer);
> -}
> -
> -static int tpm_svsm_recv(struct tpm_chip *chip, u8 *buf, size_t len)
> -{
> -	struct tpm_svsm_priv *priv = dev_get_drvdata(&chip->dev);
> +	ret = snp_svsm_vtpm_send_command(priv->buffer);
> +	if (ret)
> +		return ret;
>  
> -	/*
> -	 * The internal buffer contains the response after we send the command
> -	 * to SVSM.
> -	 */
> -	return svsm_vtpm_cmd_response_parse(priv->buffer, buf, len);
> +	return svsm_vtpm_cmd_response_parse(priv->buffer, buf, buf_size);
>  }
>  
>  static struct tpm_class_ops tpm_chip_ops = {
>  	.flags = TPM_OPS_AUTO_STARTUP,
> -	.recv = tpm_svsm_recv,
>  	.send = tpm_svsm_send,
>  };
>  
> @@ -85,6 +79,7 @@ static int __init tpm_svsm_probe(struct platform_device *pdev)
>  
>  	dev_set_drvdata(&chip->dev, priv);
>  
> +	chip->flags |= TPM_CHIP_FLAG_SYNC;
>  	err = tpm2_probe(chip);
>  	if (err)
>  		return err;
> -- 
> 2.49.0
> 

BR, Jarkko

