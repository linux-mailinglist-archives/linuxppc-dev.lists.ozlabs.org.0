Return-Path: <linuxppc-dev+bounces-8195-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A692CAA50B0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Apr 2025 17:48:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZnhR31b4Yz3bmC;
	Thu,  1 May 2025 01:47:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746028079;
	cv=none; b=mFsOYBvNoVpkwZeoc0aoRCOBA9czM5DInvP5MpLSEs4xuxQ+4KtSR5nee+zwG8ELwyeu7rjNxj6HQUyYUznnw7X6lPcln4LiEgwhsds33EH89JDYP007/1bKLT1LEQmyELQqG3tEKUOO1cMgW7QoqCLJWKv7gPzsO9j4sPlKlBgY50Grdq4q4UuErEgRDaGvi9jJM//F8oxz+8OgR3kDknnbvAQDtskDF0UFzMU+HqDZjJHHbA8Ns8x7cOJHVd1sW6IS5aCgJiTYi2GCFkaRSqpwzeSu/Kcccncx3y8T88rJjDwKEcizXdtYILpdjrzB5eZkXGlXeLwJ6oOhZZ8b5w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746028079; c=relaxed/relaxed;
	bh=5fPm0g+mPTnPOby9c69lKlBbnnZq9KjaqJbW4mpoG2I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lpuCNDUEGMCxmO6dHI0f9wv9gNeuBBDrehHMzsEQLgYpJPx0A1QrKPKi4jEB4ityPMCaexdNirSFkVbK4xszk0EvpnuFjK8daPZ5cLNLSNARKyV5rxeLdZ2B5NeReNDUz2jRPE9RPfJ45x3YAwMCuD4XDSXoxXcbgozuYskc4Gl4A8JmkyprXCT2+j418u6KntgLuKlxau+6/sw8c7zdgV/S99eJlF43nTLFalEMYYieOamabsN4sdN49RJpcypLBYh6AJLNk/OFnqLwVU1mI0cldUlHIVnq+BItOoIfXJ+OvmYy5FSZ/+hAhJYUNeuJ8lBUPO88zniUGlBj5RL6nA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FXBvLp6V; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=jarkko@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FXBvLp6V;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=jarkko@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZnhR236CZz301G
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 May 2025 01:47:58 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EEFF343F27;
	Wed, 30 Apr 2025 15:47:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CA4FC4CEE7;
	Wed, 30 Apr 2025 15:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746028076;
	bh=f9vaf9DxyD8z2Q/o/BFiff3Umf0tnskp9fmVY7CIEio=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FXBvLp6VaHaLbGjkaQGyLkJzrWelTgowFyf6dEbcMDnAPXlZFroKnPnvlVGddJGql
	 GhFs0xAfajb4Gjn468c0b9R/xF1Flcij0QP0dpVVvwrImu3E6kKQGaAE9CKzZPUhBK
	 oAq8kC9DYOEDDN9iGyapTrEkeFf7wQi6xVgepEk9AdukT/N0DN4UnRjV6ZjO1ErRUz
	 GUeL37ZEeI0+L6OP1xzXkZ19/C8OO31TyU9KexphopScF3vqgyu4Oj2kuZ9NVicrqU
	 /0OroxEC5eN/dE3orF050V8wyyh24kcf9Ij5nCUXTqZOQ9srxGAkKtLxl8eExN0GTo
	 ZdRXDxOc+IKRw==
Date: Wed, 30 Apr 2025 18:47:51 +0300
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
Subject: Re: [PATCH v3 3/4] tpm/tpm_ftpm_tee: support TPM_CHIP_FLAG_SYNC
Message-ID: <aBJGJwVyp3pvRlqE@kernel.org>
References: <20250414145653.239081-1-sgarzare@redhat.com>
 <20250414145653.239081-4-sgarzare@redhat.com>
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
In-Reply-To: <20250414145653.239081-4-sgarzare@redhat.com>
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Apr 14, 2025 at 04:56:52PM +0200, Stefano Garzarella wrote:
> From: Stefano Garzarella <sgarzare@redhat.com>
> 
> This driver does not support interrupts, and receiving the response is
> synchronous with sending the command.
> 
> So we can set TPM_CHIP_FLAG_SYNC to support synchronous send() and

"Enable synchronous send() with TPM_CHIP_FLAG_SYNC, which implies that
->send() already fills the provided buffer with a reponse, and ->recv()
is not implemented."

So, instead of jargon it is better to explicitly state what the heck
is going on.

> return responses in the same buffer used for commands. This way we
> don't need the 4KB internal buffer used to cache the response before
> .send() and .recv(). Also we don't need to implement recv() op.
> 
> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> ---
> v2:
> - set TPM_CHIP_FLAG_SYNC and support it in the new send()
> - removed Jens' T-b
> v1:
> - added Jens' T-b
> ---
>  drivers/char/tpm/tpm_ftpm_tee.h |  4 ---
>  drivers/char/tpm/tpm_ftpm_tee.c | 64 ++++++++++-----------------------
>  2 files changed, 19 insertions(+), 49 deletions(-)
> 
> diff --git a/drivers/char/tpm/tpm_ftpm_tee.h b/drivers/char/tpm/tpm_ftpm_tee.h
> index e39903b7ea07..8d5c3f0d2879 100644
> --- a/drivers/char/tpm/tpm_ftpm_tee.h
> +++ b/drivers/char/tpm/tpm_ftpm_tee.h
> @@ -22,16 +22,12 @@
>   * struct ftpm_tee_private - fTPM's private data
>   * @chip:     struct tpm_chip instance registered with tpm framework.
>   * @session:  fTPM TA session identifier.
> - * @resp_len: cached response buffer length.
> - * @resp_buf: cached response buffer.
>   * @ctx:      TEE context handler.
>   * @shm:      Memory pool shared with fTPM TA in TEE.
>   */
>  struct ftpm_tee_private {
>  	struct tpm_chip *chip;
>  	u32 session;
> -	size_t resp_len;
> -	u8 resp_buf[MAX_RESPONSE_SIZE];
>  	struct tee_context *ctx;
>  	struct tee_shm *shm;
>  };
> diff --git a/drivers/char/tpm/tpm_ftpm_tee.c b/drivers/char/tpm/tpm_ftpm_tee.c
> index 637cc8b6599e..b9adc040ca6d 100644
> --- a/drivers/char/tpm/tpm_ftpm_tee.c
> +++ b/drivers/char/tpm/tpm_ftpm_tee.c
> @@ -31,46 +31,18 @@ static const uuid_t ftpm_ta_uuid =
>  		  0x82, 0xCB, 0x34, 0x3F, 0xB7, 0xF3, 0x78, 0x96);
>  
>  /**
> - * ftpm_tee_tpm_op_recv() - retrieve fTPM response.
> - * @chip:	the tpm_chip description as specified in driver/char/tpm/tpm.h.
> - * @buf:	the buffer to store data.
> - * @count:	the number of bytes to read.
> - *
> - * Return:
> - *	In case of success the number of bytes received.
> - *	On failure, -errno.
> - */
> -static int ftpm_tee_tpm_op_recv(struct tpm_chip *chip, u8 *buf, size_t count)
> -{
> -	struct ftpm_tee_private *pvt_data = dev_get_drvdata(chip->dev.parent);
> -	size_t len;
> -
> -	len = pvt_data->resp_len;
> -	if (count < len) {
> -		dev_err(&chip->dev,
> -			"%s: Invalid size in recv: count=%zd, resp_len=%zd\n",
> -			__func__, count, len);
> -		return -EIO;
> -	}
> -
> -	memcpy(buf, pvt_data->resp_buf, len);
> -	pvt_data->resp_len = 0;
> -
> -	return len;
> -}
> -
> -/**
> - * ftpm_tee_tpm_op_send() - send TPM commands through the TEE shared memory.
> + * ftpm_tee_tpm_op_send() - send TPM commands through the TEE shared memory
> + * and retrieve the response.
>   * @chip:	the tpm_chip description as specified in driver/char/tpm/tpm.h
> - * @buf:	the buffer to send.
> - * @len:	the number of bytes to send.
> + * @buf:	the buffer to send and to store the response.
> + * @cmd_len:	the number of bytes to send.
>   * @buf_size:	the size of the buffer.
>   *
>   * Return:
> - *	In case of success, returns 0.
> + *	In case of success, returns the number of bytes received.
>   *	On failure, -errno
>   */
> -static int ftpm_tee_tpm_op_send(struct tpm_chip *chip, u8 *buf, size_t len,
> +static int ftpm_tee_tpm_op_send(struct tpm_chip *chip, u8 *buf, size_t cmd_len,
>  				size_t buf_size)
>  {
>  	struct ftpm_tee_private *pvt_data = dev_get_drvdata(chip->dev.parent);
> @@ -82,16 +54,15 @@ static int ftpm_tee_tpm_op_send(struct tpm_chip *chip, u8 *buf, size_t len,
>  	struct tee_param command_params[4];
>  	struct tee_shm *shm = pvt_data->shm;
>  
> -	if (len > MAX_COMMAND_SIZE) {
> +	if (cmd_len > MAX_COMMAND_SIZE) {
>  		dev_err(&chip->dev,
>  			"%s: len=%zd exceeds MAX_COMMAND_SIZE supported by fTPM TA\n",
> -			__func__, len);
> +			__func__, cmd_len);
>  		return -EIO;
>  	}
>  
>  	memset(&transceive_args, 0, sizeof(transceive_args));
>  	memset(command_params, 0, sizeof(command_params));
> -	pvt_data->resp_len = 0;
>  
>  	/* Invoke FTPM_OPTEE_TA_SUBMIT_COMMAND function of fTPM TA */
>  	transceive_args = (struct tee_ioctl_invoke_arg) {
> @@ -105,7 +76,7 @@ static int ftpm_tee_tpm_op_send(struct tpm_chip *chip, u8 *buf, size_t len,
>  		.attr = TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT,
>  		.u.memref = {
>  			.shm = shm,
> -			.size = len,
> +			.size = cmd_len,
>  			.shm_offs = 0,
>  		},
>  	};
> @@ -117,7 +88,7 @@ static int ftpm_tee_tpm_op_send(struct tpm_chip *chip, u8 *buf, size_t len,
>  		return PTR_ERR(temp_buf);
>  	}
>  	memset(temp_buf, 0, (MAX_COMMAND_SIZE + MAX_RESPONSE_SIZE));
> -	memcpy(temp_buf, buf, len);
> +	memcpy(temp_buf, buf, cmd_len);
>  
>  	command_params[1] = (struct tee_param) {
>  		.attr = TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT,
> @@ -158,17 +129,20 @@ static int ftpm_tee_tpm_op_send(struct tpm_chip *chip, u8 *buf, size_t len,
>  			__func__, resp_len);
>  		return -EIO;
>  	}
> +	if (resp_len > buf_size) {
> +		dev_err(&chip->dev,
> +			"%s: resp_len=%zd exceeds buf_size=%zd\n",
> +			__func__, resp_len, buf_size);
> +		return -EIO;
> +	}
>  
> -	/* sanity checks look good, cache the response */
> -	memcpy(pvt_data->resp_buf, temp_buf, resp_len);
> -	pvt_data->resp_len = resp_len;
> +	memcpy(buf, temp_buf, resp_len);
>  
> -	return 0;
> +	return resp_len;
>  }
>  
>  static const struct tpm_class_ops ftpm_tee_tpm_ops = {
>  	.flags = TPM_OPS_AUTO_STARTUP,
> -	.recv = ftpm_tee_tpm_op_recv,
>  	.send = ftpm_tee_tpm_op_send,
>  };
>  
> @@ -253,7 +227,7 @@ static int ftpm_tee_probe(struct device *dev)
>  	}
>  
>  	pvt_data->chip = chip;
> -	pvt_data->chip->flags |= TPM_CHIP_FLAG_TPM2;
> +	pvt_data->chip->flags |= TPM_CHIP_FLAG_TPM2 | TPM_CHIP_FLAG_SYNC;
>  
>  	/* Create a character device for the fTPM */
>  	rc = tpm_chip_register(pvt_data->chip);
> -- 
> 2.49.0
> 

BR, Jarkko

