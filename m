Return-Path: <linuxppc-dev+bounces-7672-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 28669A8AA19
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Apr 2025 23:28:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZcchJ5LgSz3blk;
	Wed, 16 Apr 2025 07:28:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=91.218.175.170
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744737173;
	cv=none; b=E0bYlbu7nZnlipMGqFqE/qv+310BdEzsdeIk9e2UpkbMKkaMtX24vbS6Z/SZ0AhpzTpaWA9Kk3bj+5v1n8FvlQysxCTK+abyftWeFTucBH3SCFt+Si1fUXdRGo/kYD6l5PDj5W7Ztlxbcm5Yb2B6jKTIfm/2aXz3kwL3Sj9Zsyxv6KPHF/G1oroLwbU8boR0eNMvvWand9FlL/2kpA5wDWy+OQ89w4fnuUHd2LwMMqYyc/3lQHTUdgNR1gDf8tzcxe6yCgemU1wMVQbCaM6LN+ZteOVeulQjAEUM32HnVNpTvzuKScOXccmX2/mwAnBYWvXn9FtHJKm9vmcY77WPLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744737173; c=relaxed/relaxed;
	bh=AsAyDVMbjjsN4PUqyCAVbanisdIFDXY47ohYY10V5Ww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MwgfsQUUTiCSajusy+wDX35/ov4nLEfcXKREuA421qNx1K5ddSP0MOwGbEg7/x1/xWXtE2xCzu2issQQMil7ceoy1INY+ULCC8Cs+y60+hDj83frp2IlU02e+tubWQ7aQcQQMHya09/3BRswDQK/Wi7zSAc07ZOHQbg/pejLwNRUHG+yY2vp+duIzQmMCnwawdPA5IRZbrB6OgCpRaus/bmPAHe1ERf9+e4YaznXwRXdUsoiN0z48r+bMdmv9DTtiM8cKC0iDFeyH73bl+RJooL2m+Rtm2OAOAMdxEiFEVz9Oyt4KNaizWZt12xOnO1G61wx4+rCE84OdAF7fQQgSQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io; dkim=pass (2048-bit key; unprotected) header.d=rosenzweig.io header.i=@rosenzweig.io header.a=rsa-sha256 header.s=key1 header.b=Otg4poFR; dkim-atps=neutral; spf=pass (client-ip=91.218.175.170; helo=out-170.mta0.migadu.com; envelope-from=alyssa@rosenzweig.io; receiver=lists.ozlabs.org) smtp.mailfrom=rosenzweig.io
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rosenzweig.io header.i=@rosenzweig.io header.a=rsa-sha256 header.s=key1 header.b=Otg4poFR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=rosenzweig.io (client-ip=91.218.175.170; helo=out-170.mta0.migadu.com; envelope-from=alyssa@rosenzweig.io; receiver=lists.ozlabs.org)
X-Greylist: delayed 102 seconds by postgrey-1.37 at boromir; Wed, 16 Apr 2025 03:12:51 AEST
Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZcW1v6Skhz3bjg
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Apr 2025 03:12:51 +1000 (AEST)
Date: Tue, 15 Apr 2025 13:12:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1744737152;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AsAyDVMbjjsN4PUqyCAVbanisdIFDXY47ohYY10V5Ww=;
	b=Otg4poFRNuVp6rDrDol8V3vfZfcG4CE58R04ABqAIzeFZHzkoSyq/dyRGsmsD24V/AQmsO
	L3ipkO9TRoB0TOIxNgJWfSM7hMMC0iNUrqiyRGKYIzTjwDaSu+N5EuW9/JvQvGyeD+2s3B
	nGG/AqivOuVIKh90svMU9NjMFZ6avEVkxhX4M8zplhG1nLAvM75ynlourGl6X2bFhzgP7v
	3mV4n6P6Icznid3drlt1H55/vA2FZsKwhRKn3Q+s3tWUebidtLYWeBQPZEF4wxaToBUMXF
	nI9Qch+h19SK+diWQc4KRps0EKUysBXnthyFXH/cgEAgIKvteDmkE+8jdk3t8A==
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
Subject: Re: [PATCH v2 4/6] i2c: pasemi: Improve error recovery
Message-ID: <Z_6TfD-jzdLPtpYN@blossom>
References: <20250415-pasemi-fixes-v2-0-c543bf53151a@svenpeter.dev>
 <20250415-pasemi-fixes-v2-4-c543bf53151a@svenpeter.dev>
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
In-Reply-To: <20250415-pasemi-fixes-v2-4-c543bf53151a@svenpeter.dev>
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>

Le Tue , Apr 15, 2025 at 03:36:58PM +0000, Sven Peter via B4 Relay a écrit :
> From: Hector Martin <marcan@marcan.st>
> 
> The hardware (supposedly) has a 25ms timeout for clock stretching
> and the driver uses 100ms which should be plenty. The error
> reocvery itself is however lacking.
> 
> Add handling for all the missing error condition, and better recovery in
> pasemi_smb_clear(). Also move the timeout to a #define since it's used
> in multiple places now.
> 
> Signed-off-by: Hector Martin <marcan@marcan.st>
> [sven: adjusted commit message after splitting the commit into two]
> Signed-off-by: Sven Peter <sven@svenpeter.dev>
> ---
>  drivers/i2c/busses/i2c-pasemi-core.c | 75 +++++++++++++++++++++++++++++++-----
>  1 file changed, 65 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-pasemi-core.c b/drivers/i2c/busses/i2c-pasemi-core.c
> index 9b611dbdfef23e78a4ea75ac0311938d52b6ba96..2f31f039bedfd7f78d6572fe925125b1a6d0724b 100644
> --- a/drivers/i2c/busses/i2c-pasemi-core.c
> +++ b/drivers/i2c/busses/i2c-pasemi-core.c
> @@ -9,6 +9,7 @@
>  #include <linux/delay.h>
>  #include <linux/i2c.h>
>  #include <linux/io.h>
> +#include <linux/iopoll.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/pci.h>
> @@ -52,6 +53,12 @@
>  #define CTL_UJM		BIT(8)
>  #define CTL_CLK_M	GENMASK(7, 0)
>  
> +/*
> + * The hardware (supposedly) has a 25ms timeout for clock stretching, thus
> + * use 100ms here which should be plenty.
> + */
> +#define TRANSFER_TIMEOUT_MS	100
> +
>  static inline void reg_write(struct pasemi_smbus *smbus, int reg, int val)
>  {
>  	dev_dbg(smbus->dev, "smbus write reg %x val %08x\n", reg, val);
> @@ -80,24 +87,44 @@ static void pasemi_reset(struct pasemi_smbus *smbus)
>  	reinit_completion(&smbus->irq_completion);
>  }
>  
> -static void pasemi_smb_clear(struct pasemi_smbus *smbus)
> +static int pasemi_smb_clear(struct pasemi_smbus *smbus)
>  {
>  	unsigned int status;
> +	int ret;
>  
> -	status = reg_read(smbus, REG_SMSTA);
> +	/* First wait for the bus to go idle */
> +	ret = readx_poll_timeout(ioread32, smbus->ioaddr + REG_SMSTA,
> +				 status, !(status & (SMSTA_XIP | SMSTA_JAM)),
> +				 USEC_PER_MSEC, USEC_PER_MSEC * TRANSFER_TIMEOUT_MS);
> +
> +	if (ret < 0) {
> +		dev_err(smbus->dev, "Bus is still stuck (status 0x%08x)\n", status);
> +		return -EIO;
> +	}
> +
> +	/* If any badness happened or there is data in the FIFOs, reset the FIFOs */
> +	if ((status & (SMSTA_MRNE | SMSTA_JMD | SMSTA_MTO | SMSTA_TOM | SMSTA_MTN | SMSTA_MTA)) ||
> +	    !(status & SMSTA_MTE))
> +		pasemi_reset(smbus);
> +
> +	/* Clear the flags */
>  	reg_write(smbus, REG_SMSTA, status);
> +
> +	return 0;
>  }
>  
>  static int pasemi_smb_waitready(struct pasemi_smbus *smbus)
>  {
> -	int timeout = 100;
> +	int timeout = TRANSFER_TIMEOUT_MS;
>  	int ret;
>  	unsigned int status;
>  
>  	if (smbus->use_irq) {
>  		reinit_completion(&smbus->irq_completion);
> -		reg_write(smbus, REG_IMASK, SMSTA_XEN | SMSTA_MTN);
> -		ret = wait_for_completion_timeout(&smbus->irq_completion, msecs_to_jiffies(100));
> +		/* XEN should be set when a transaction terminates, whether due to error or not */
> +		reg_write(smbus, REG_IMASK, SMSTA_XEN);
> +		ret = wait_for_completion_timeout(&smbus->irq_completion,
> +						  msecs_to_jiffies(timeout));
>  		reg_write(smbus, REG_IMASK, 0);
>  		status = reg_read(smbus, REG_SMSTA);
>  
> @@ -123,9 +150,35 @@ static int pasemi_smb_waitready(struct pasemi_smbus *smbus)
>  		}
>  	}
>  
> +	/* Controller timeout? */
> +	if (status & SMSTA_TOM) {
> +		dev_warn(smbus->dev, "Controller timeout, status 0x%08x\n", status);
> +		return -EIO;
> +	}
> +
> +	/* Peripheral timeout? */
> +	if (status & SMSTA_MTO) {
> +		dev_warn(smbus->dev, "Peripheral timeout, status 0x%08x\n", status);
> +		return -ETIME;
> +	}
> +
> +	/* Still stuck in a transaction? */
> +	if (status & SMSTA_XIP) {
> +		dev_warn(smbus->dev, "Bus stuck, status 0x%08x\n", status);
> +		return -EIO;
> +	}
> +
> +	/* Arbitration loss? */
> +	if (status & SMSTA_MTA) {
> +		dev_warn(smbus->dev, "Arbitration loss, status 0x%08x\n", status);
> +		return -EBUSY;
> +	}
> +
>  	/* Got NACK? */
> -	if (status & SMSTA_MTN)
> +	if (status & SMSTA_MTN) {
> +		dev_warn(smbus->dev, "NACK, status 0x%08x\n", status);
>  		return -ENXIO;
> +	}
>  
>  	/* Clear XEN */
>  	reg_write(smbus, REG_SMSTA, SMSTA_XEN);
> @@ -187,9 +240,9 @@ static int pasemi_i2c_xfer(struct i2c_adapter *adapter,
>  	struct pasemi_smbus *smbus = adapter->algo_data;
>  	int ret, i;
>  
> -	pasemi_smb_clear(smbus);
> -
> -	ret = 0;
> +	ret = pasemi_smb_clear(smbus);
> +	if (ret)
> +		return ret;
>  
>  	for (i = 0; i < num && !ret; i++)
>  		ret = pasemi_i2c_xfer_msg(adapter, &msgs[i], (i == (num - 1)));
> @@ -210,7 +263,9 @@ static int pasemi_smb_xfer(struct i2c_adapter *adapter,
>  	addr <<= 1;
>  	read_flag = read_write == I2C_SMBUS_READ;
>  
> -	pasemi_smb_clear(smbus);
> +	err = pasemi_smb_clear(smbus);
> +	if (err)
> +		return err;
>  
>  	switch (size) {
>  	case I2C_SMBUS_QUICK:
> 
> -- 
> 2.34.1
> 
> 

