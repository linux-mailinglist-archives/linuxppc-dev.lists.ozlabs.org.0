Return-Path: <linuxppc-dev+bounces-8594-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC93AB7B1C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 May 2025 03:45:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZyY2L6kdjz2yDM;
	Thu, 15 May 2025 11:45:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747273546;
	cv=none; b=N5VNqBFqBbdHK0FNn1+0N4bgc64OVK30WC91eBJ3CcuCvuj8VB0SNbajPRkSYP7LveFWyxn+fPYGx2GWMQb5VpKb432IElwgBP9ltMfpvbiBz6RM9wNfowzk0yTDtdml80iFH1AFRbr3a+24z+Pty64mQf9AyjakzJd4RJ2Z1KZU+dLRPU35iU9bdBgz3xOhJJ66K9lOaQWfXFLbI9CHek5sILHeKHWtOjx6JF5/G3ndXdWjfy05yBNaMWw5ZK1lGOOWon6CapD3JXwL5D1dNKX0Ufib7EeI7gYXAWdXXnbpkzrM2bk7ZBFmadP7EIf87M8D1Q/j7EeWhHoA06F0rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747273546; c=relaxed/relaxed;
	bh=DsGnrEn9gDYqprrXQ+yC+gSzutDgzHnWlYhqJih3kAI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MzZcI1Hnlms8fWmV2sn63tVhTqMepHkahYeESNRKz098vn4pl6cCelW/tTySwo9P5uoCg0/ZK5rGL+9NdqUbkBfESLkwgZ6pLY3VmyJ2SeLMkesD2ff6+NrcYTn70TuL8RQf9fedv2RlfP9Wc8CAzUK0fTXbMMCkGhgJlE+wGvvGwLekxHY50JQkUuH5bWx+fjm4yXa5cq300eH+yFb87+OJnYexkcn9WL3xBBRhRbuIerfA8pm0qZ1tUnBpQUpY0bwFAO+6aDU1rZY2iGnsr/ordBBp52MW4YYklve3WVAyO1Gl3qClZsFYdJHnbV2e4NA/HyEDeC07eAVfKsQtfw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=aNc4tPUl; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=jarkko@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=aNc4tPUl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=jarkko@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZyY2K58vCz2y8p
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 May 2025 11:45:45 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2DB00629E4;
	Thu, 15 May 2025 01:45:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72AEEC4CEE3;
	Thu, 15 May 2025 01:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747273542;
	bh=pnNBST+c9YzDalNQ25GoKXrq/N4ZaCLn+kBAH2QlzYY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aNc4tPUliPhaLP8MScTBz9lzD/DbFYbrmeQrGDWpJqBK+OQTnINZVdKbioHL6ZlaG
	 7B0bXpM5nFKBFsjTFtIARi8xIxPPdsGvR8QSEjkD0LDsPK7paj3VIDwNhiy8qLmeS2
	 Q4vSfcc1Q/MFQqHCSTZoL1YNd65JA6kq/y1Q4LlKsawjEVMBJatGqzWHgfCc0MW7Zm
	 8aNhLfenXAcGTnLGqlfUzpCqVjZ+e8uT3pusUg7EVriHSdUSomg0SBSri09+p3jmmA
	 eO5c/aiw0dn9R0/3bGlvru/Yo86J8ScWuzWm/R7NXvtQsxml1nU8VoDc2tJu0iKAur
	 xuSFgNziuESLA==
Date: Thu, 15 May 2025 04:45:39 +0300
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
Message-ID: <aCVHQ-LRqHeEVEAW@kernel.org>
References: <20250514134630.137621-1-sgarzare@redhat.com>
 <20250514134630.137621-5-sgarzare@redhat.com>
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
In-Reply-To: <20250514134630.137621-5-sgarzare@redhat.com>
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, May 14, 2025 at 03:46:30PM +0200, Stefano Garzarella wrote:
> From: Stefano Garzarella <sgarzare@redhat.com>
> 
> This driver does not support interrupts, and receiving the response is
> synchronous with sending the command.
> 
> Enable synchronous send() with TPM_CHIP_FLAG_SYNC, which implies that
> ->send() already fills the provided buffer with a response, and ->recv()
> is not implemented.
> 
> Keep using the same pre-allocated buffer to avoid having to allocate
> it for each command. We need the buffer to have the header required by
> the SVSM protocol and the command contiguous in memory.
> 
> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> ---
> v5:
> - changed order and parameter names to match tpm_try_transmit() [Jarkko]
> v4:
> - reworked commit description [Jarkko]
> ---
>  drivers/char/tpm/tpm_svsm.c | 27 +++++++++++----------------
>  1 file changed, 11 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/char/tpm/tpm_svsm.c b/drivers/char/tpm/tpm_svsm.c
> index 0847cbf450b4..f5ba0f64850b 100644
> --- a/drivers/char/tpm/tpm_svsm.c
> +++ b/drivers/char/tpm/tpm_svsm.c
> @@ -26,37 +26,31 @@ struct tpm_svsm_priv {
>  };
>  
>  static int tpm_svsm_send(struct tpm_chip *chip, u8 *buf, size_t bufsiz,
> -			 size_t len)
> +			 size_t cmd_len)
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
> +	return svsm_vtpm_cmd_response_parse(priv->buffer, buf, bufsiz);
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
> 

I can pick this for 6.16.

BR, Jarkko

BR, Jarkko

