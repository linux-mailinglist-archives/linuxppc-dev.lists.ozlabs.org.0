Return-Path: <linuxppc-dev+bounces-7671-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E1FEA8AA16
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Apr 2025 23:27:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zccgf4fQ4z2yFJ;
	Wed, 16 Apr 2025 07:27:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:41d0:1004:224b::b5"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744737140;
	cv=none; b=NxgLuzeUhTz3i9bdOgiPpUN/IAVv859vZ/t0SQ3zqhwEgOZJOb0hN1S23tBNwZ8sNVNBivTC4E1HGaKUDfwZ7VgS1tbbINqN2J2BPEynm5bkBPdZLqe4W1x8MLwOMF53l2bqp2AS5HfTzmbWMK0jISoBHKABKEHeJXAiEhPEM2z5JHS6qdvNtuQxZ1pLBmpO8PxpAM97/9PHbrQ9Oeb5OntSq5s1Hz5C6vGnoOgWZSu0FV8GRNhg7Z+RiK/eNpEhjkqQ5ucOGIpcrvXI0nPLDEU49tKnVTDYiT7rh6E6St8HsbRA7GBt+yHeyBVjAlxRCHOdvwvDtmGR03N0+czjLg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744737140; c=relaxed/relaxed;
	bh=TZ5TeuXVlqIBcTKnyUPN6n6PTqhb3E+xVpAkmmqWBI8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jqHMFV12tNLbU0Ev7ekL/6UJhziBjFJ+L9nZDqj/zTqRXlquiggWZIiJJaOggvxroHxWaUFCYMuglRsbl1c4MRmA/Rps+V3wtrRdgd/Ydcj2t98x9L7ycCjN5D+zyinBj8MUXz9IAGviBS4rdf2ZvJ5H1IA53i5zUUz2lEKVKGf6v/J97EwEstTmZ1TRMmSkaO3TCDAc17vBd/kliBjpj+FI1PCK233A03UwfpKAkOfrEHbrw5TGOjlM0cIWBmwJy4W6HwiQjZcCS5w8tjgWqYCWnl2e+q/DOLtEjtg2dujOkTu+Quz9N7QRMLirNCJfr/5bJ15QBzT5FiCs8/TqoA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io; dkim=pass (2048-bit key; unprotected) header.d=rosenzweig.io header.i=@rosenzweig.io header.a=rsa-sha256 header.s=key1 header.b=oFlrKFE4; dkim-atps=neutral; spf=pass (client-ip=2001:41d0:1004:224b::b5; helo=out-181.mta0.migadu.com; envelope-from=alyssa@rosenzweig.io; receiver=lists.ozlabs.org) smtp.mailfrom=rosenzweig.io
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rosenzweig.io header.i=@rosenzweig.io header.a=rsa-sha256 header.s=key1 header.b=oFlrKFE4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=rosenzweig.io (client-ip=2001:41d0:1004:224b::b5; helo=out-181.mta0.migadu.com; envelope-from=alyssa@rosenzweig.io; receiver=lists.ozlabs.org)
X-Greylist: delayed 62 seconds by postgrey-1.37 at boromir; Wed, 16 Apr 2025 03:12:16 AEST
Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [IPv6:2001:41d0:1004:224b::b5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZcW1D1Q2Gz3bjg
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Apr 2025 03:12:15 +1000 (AEST)
Date: Tue, 15 Apr 2025 13:11:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1744737116;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TZ5TeuXVlqIBcTKnyUPN6n6PTqhb3E+xVpAkmmqWBI8=;
	b=oFlrKFE4LAVCgIG+lnbBcjPxf379TP8S57q7VeZGqKPSLoMsXkqz8/bW4DFZwGljq48SIS
	5JGRUASghmHz8I2DS3FnnTTUgSbCY0OVjCB44yrdsBbb6gaQTdplmXNS7Pr3MbmMic8/il
	u/gK8rVWZGtJCJgA9lA6cPzx7TsCgtf3DtsLBSv1Gcjmtj3lA+cWhzUf/0ySFFQGq0uivf
	3+nDtOlNfKhzPEd1yBjoNewkC6tThMgDjJvj06zeuH71hXyaGylesqRmtdzFBQtaBWdSW/
	xuR/GbERtUk8S47AzQ2lxF5NDnBA447wq2R7byXt74R3ZcoszoXceD0TmqeMaQ==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: sven@svenpeter.dev
Cc: Janne Grunau <j@jannau.net>, Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>, Neal Gompa <neal@gompa.dev>,
	Hector Martin <marcan@marcan.st>, linuxppc-dev@lists.ozlabs.org,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/6] i2c: pasemi: Improve timeout handling
Message-ID: <Z_6TV-tPU2wRdfFf@blossom>
References: <20250415-pasemi-fixes-v2-0-c543bf53151a@svenpeter.dev>
 <20250415-pasemi-fixes-v2-3-c543bf53151a@svenpeter.dev>
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
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250415-pasemi-fixes-v2-3-c543bf53151a@svenpeter.dev>
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>

Le Tue , Apr 15, 2025 at 03:36:57PM +0000, Sven Peter via B4 Relay a écrit :
> From: Sven Peter <sven@svenpeter.dev>
> 
> Add proper timeout handling for the interrupt path.
> Previously, this was only correctly done for the polling path.
> Note that we drop reg_write(smbus, REG_SMSTA, status) here which
> will be done anyway whenever the next transaction starts via
> pasemi_smb_clear.
> 
> Signed-off-by: Sven Peter <sven@svenpeter.dev>
> ---
>  drivers/i2c/busses/i2c-pasemi-core.c | 24 +++++++++++++++++-------
>  1 file changed, 17 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-pasemi-core.c b/drivers/i2c/busses/i2c-pasemi-core.c
> index df1b0087dcacb0a3b94196368137d5e20b0e6d7e..9b611dbdfef23e78a4ea75ac0311938d52b6ba96 100644
> --- a/drivers/i2c/busses/i2c-pasemi-core.c
> +++ b/drivers/i2c/busses/i2c-pasemi-core.c
> @@ -91,32 +91,42 @@ static void pasemi_smb_clear(struct pasemi_smbus *smbus)
>  static int pasemi_smb_waitready(struct pasemi_smbus *smbus)
>  {
>  	int timeout = 100;
> +	int ret;
>  	unsigned int status;
>  
>  	if (smbus->use_irq) {
>  		reinit_completion(&smbus->irq_completion);
>  		reg_write(smbus, REG_IMASK, SMSTA_XEN | SMSTA_MTN);
> -		wait_for_completion_timeout(&smbus->irq_completion, msecs_to_jiffies(100));
> +		ret = wait_for_completion_timeout(&smbus->irq_completion, msecs_to_jiffies(100));
>  		reg_write(smbus, REG_IMASK, 0);
>  		status = reg_read(smbus, REG_SMSTA);
> +
> +		if (ret < 0) {
> +			dev_err(smbus->dev,
> +				"Completion wait failed with %d, status 0x%08x\n",
> +				ret, status);
> +			return ret;
> +		} else if (ret == 0) {
> +			dev_warn(smbus->dev, "Timeout, status 0x%08x\n", status);
> +			return -ETIME;
> +		}
>  	} else {
>  		status = reg_read(smbus, REG_SMSTA);
>  		while (!(status & SMSTA_XEN) && timeout--) {
>  			msleep(1);
>  			status = reg_read(smbus, REG_SMSTA);
>  		}
> +
> +		if (timeout < 0) {
> +			dev_warn(smbus->dev, "Timeout, status 0x%08x\n", status);
> +			return -ETIME;
> +		}
>  	}
>  
>  	/* Got NACK? */
>  	if (status & SMSTA_MTN)
>  		return -ENXIO;
>  
> -	if (timeout < 0) {
> -		dev_warn(smbus->dev, "Timeout, status 0x%08x\n", status);
> -		reg_write(smbus, REG_SMSTA, status);
> -		return -ETIME;
> -	}
> -
>  	/* Clear XEN */
>  	reg_write(smbus, REG_SMSTA, SMSTA_XEN);
>  
> 
> -- 
> 2.34.1
> 
> 

