Return-Path: <linuxppc-dev+bounces-7549-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 91DB8A81008
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Apr 2025 17:31:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZX96M0bgDz30KY;
	Wed,  9 Apr 2025 01:31:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744126298;
	cv=none; b=MQ0dm7ugh1jmM8KY9AOvJhLAMa53tAifTEJMUGTzH/pZcBZRC+DsDhbywVMoNaL/g3jAPeD56kLhUTYXW4k1PmgIx5yyDW3GOpOEpI+PuJFezG75HP+O0R04oErNAn5GdnGIqwi06W80Vl18GwJsa6ev/er2kLEyVTMehnkK73DSwuOzZxtSQ+dE3ofe4AzDOJ779HGuoThFvynGMmjA4AITHS7bJv5FCe4ESvkL8GnpyAiZLUTrHJy6qzR8OcZX5dpkP/PF67s+GoKIC41Etu/pI26rFRHEoFlgkHLUkRIee8BM6TqVLqXqYIjA+rwu8bg4G2BjCjpukg1SxMDtQA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744126298; c=relaxed/relaxed;
	bh=h3v2u8ip3cqMDDLNIpKhDZO5Hm5vU3p7hzEHmiU+27A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AEwU1OZc739/FTqEnM48v6V/qQI7uYEz3z74R8HMxTBEXITpkCOHD+9YNtgk+IWIs+BrQp9HgsSBjijHEYgwatABs1AfS8KxHPqX+9Jzx+HUk9yQJwn16K9Xdyrg1nOvcm6MZ7IS/scEDW59CqoQKaSWIDFWiUn3WxCywIx8gdlRSZ/X3Y64cEAX88Zg1G0IVOCCeIa9kGu1ZuH0Pbx2k+zGfZqCSp/t2W5dNVS0LjNtrPnlcP1bnpSiG4nrFvd2WiWarQ3RkDvHtDYsCuJnSaR/OmANkhpe67pJql/e53Rt9hesT0Cnp2fqdsg/Nj5se40Xvf1qsovN4oh31ZlcSg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=P4UJEaCt; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=jarkko@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=P4UJEaCt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=jarkko@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZX96K6BFHz30D3
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Apr 2025 01:31:37 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4793E5C59B4;
	Tue,  8 Apr 2025 15:29:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A14E9C4CEE5;
	Tue,  8 Apr 2025 15:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744126294;
	bh=Uq29KL+ro4IRBo8g5H8MypBCBK0Ooc76QGNcWH4alfw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P4UJEaCtF61oGuLRw5Uii2z9vVlYo67NwlmwTqICCwpgHdYrc/oIvkhAI0jjnKiYr
	 Foi1EZ+/FfOtwDutvDlZ9IsQ6EaTcYYiD+reVoWqi4tU8zzV1GPixJdCq3xMn5ULof
	 keSD4lGX9dDqatRoGU+M0XVaSjc2nQ2FStY95360gQvs2zoe+wDlgAKASUDQjaYgeZ
	 kQ3WWSvJQ9LkYm40V+PxAHXYZKpuv+S9USOhEty0CogIdTgr+YTMAnmHfwKeorOjfK
	 lEPaV0ygH0+6jINKFxGVxFPjOV4RS3OnCQKWa9pJFTARzwygN4IV07Gvc2xj2sINKa
	 D8jpHP3BSx3cg==
Date: Tue, 8 Apr 2025 18:31:30 +0300
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-arm-kernel@lists.infradead.org,
	Jens Wiklander <jens.wiklander@linaro.org>,
	linuxppc-dev@lists.ozlabs.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Sumit Garg <sumit.garg@kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-integrity@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Naveen N Rao <naveen@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Peter Huewe <peterhuewe@gmx.de>,
	James Bottomley <James.Bottomley@hansenpartnership.com>
Subject: Re: [PATCH v2 2/4] tpm: support devices with synchronous send()
Message-ID: <Z_VBUozuHvbxdyB3@kernel.org>
References: <20250408083208.43512-1-sgarzare@redhat.com>
 <20250408083208.43512-3-sgarzare@redhat.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408083208.43512-3-sgarzare@redhat.com>
X-Spam-Status: No, score=-1.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Apr 08, 2025 at 10:32:06AM +0200, Stefano Garzarella wrote:
> From: Stefano Garzarella <sgarzare@redhat.com>
> 
> Some devices do not support interrupts and provide a single synchronous
> operation to send the command and receive the response on the same buffer.
> 
> Currently, these types of drivers must use an internal buffer where they
> temporarily store the response between .send() and recv() calls.
> 
> Introduce a new flag (TPM_CHIP_FLAG_SYNC) to support synchronous send().
> If that flag is set by the driver, tpm_try_transmit() will use the send()
> callback to send the command and receive the response on the same buffer
> synchronously. In that case send() return the number of bytes of the
> response on success, or -errno on failure.
> 
> Suggested-by: Jason Gunthorpe <jgg@ziepe.ca>
> Suggested-by: Jarkko Sakkinen <jarkko@kernel.org>
> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> ---
>  include/linux/tpm.h              |  1 +
>  drivers/char/tpm/tpm-interface.c | 18 +++++++++++++++---
>  2 files changed, 16 insertions(+), 3 deletions(-)
> 
> diff --git a/include/linux/tpm.h b/include/linux/tpm.h
> index 2e38edd5838c..0e9746dc9d30 100644
> --- a/include/linux/tpm.h
> +++ b/include/linux/tpm.h
> @@ -350,6 +350,7 @@ enum tpm_chip_flags {
>  	TPM_CHIP_FLAG_SUSPENDED			= BIT(8),
>  	TPM_CHIP_FLAG_HWRNG_DISABLED		= BIT(9),
>  	TPM_CHIP_FLAG_DISABLE			= BIT(10),
> +	TPM_CHIP_FLAG_SYNC			= BIT(11),
>  };
>  
>  #define to_tpm_chip(d) container_of(d, struct tpm_chip, dev)
> diff --git a/drivers/char/tpm/tpm-interface.c b/drivers/char/tpm/tpm-interface.c
> index 3b6ddcdb4051..9fbe84b5a131 100644
> --- a/drivers/char/tpm/tpm-interface.c
> +++ b/drivers/char/tpm/tpm-interface.c
> @@ -114,8 +114,17 @@ static ssize_t tpm_try_transmit(struct tpm_chip *chip, void *buf, size_t bufsiz)
>  		return rc;
>  	}
>  
> -	/* A sanity check. send() should just return zero on success e.g.
> -	 * not the command length.
> +	/* Synchronous devices return the response directly during the send()
> +	 * call in the same buffer.
> +	 */

Nit:

/*
 * ...

It's wrong in the existing comment.

> +	if (chip->flags & TPM_CHIP_FLAG_SYNC) {
> +		len = rc;
> +		rc = 0;
> +		goto out_send_sync;
> +	}
> +
> +	/* A sanity check. send() of asynchronous devices should just return
> +	 * zero on success e.g. not the command length.
>  	 */
>  	if (rc > 0) {
>  		dev_warn(&chip->dev,
> @@ -151,7 +160,10 @@ static ssize_t tpm_try_transmit(struct tpm_chip *chip, void *buf, size_t bufsiz)
>  	if (len < 0) {
>  		rc = len;
>  		dev_err(&chip->dev, "tpm_transmit: tpm_recv: error %d\n", rc);
> -	} else if (len < TPM_HEADER_SIZE || len != be32_to_cpu(header->length))
> +		return rc;
> +	}
> +out_send_sync:

out_sync would be sufficient

> +	if (len < TPM_HEADER_SIZE || len != be32_to_cpu(header->length))
>  		rc = -EFAULT;
>  
>  	return rc ? rc : len;
> -- 
> 2.49.0
> 

BR, Jarkko

