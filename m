Return-Path: <linuxppc-dev+bounces-7742-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 13FBCA91D51
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Apr 2025 15:08:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZddVb6Cj0z3byT;
	Thu, 17 Apr 2025 23:08:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744895287;
	cv=none; b=Q/UeezijL9PT9hry64WBD+0RL/+G1k9Svzouh2qD+TAYH3gtzMs25eM06gy/v/15s3ujkAN//0l5DMckSTSyNk5C3OEDjRYOfB3cAu6F8DEYw0DBcyrevLuojeEBWOmdBKp5BenguSk1c8TXv7EK4RJErj+sl+LREqNfgp0t9rGawlC5sGPNhXb8S/rF+NAovvh09SD74KJIbNnypgqB0Vi1mon3bneyK8qZxEZivrEsXKM5r+gibQbdiAHYytv3IT5PgcsrLll/BYlJ9H+CLfbmjJXGQ0iR2Ts8QgCdrTtVFkPdiZsWSjxdXqpUbyVqP+P7+kbeD5hnds+/E7aHRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744895287; c=relaxed/relaxed;
	bh=EBbHta6iKokVfcc1bePIO7Nx8/nJkoOCsQta59zO56Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mb80PY6k8glR6Z9+lbARdYu6B+Us1efvMX9U6s/zkM3gubHCIWDOd7jOfl9W2836s0GyRtOA1dz/pO1SQkk8uV9uvf4dCsa0/n4/vWnDk7NlOcsmaJ5K6n+GeWvJN93VQQYokmrIoqKf24MRxT7RKYsbsOHGspi5416QfoZ1WigTzny5tTFPcX7uEFQDSd5PBn+Ws0NJ1vrxRcDZ4W0sEDCfOq5Hn+FdfPKfJKHzwSRTxOAn9zj2bLUW1wp/p3H9J5IQojPemEQ2R9o2ftNIy6JqvQ10io7ct5TOgQN0e1idxzReIJ3pOXIkTvhYIrJVDOIYxJaP1eGWZ7UctkrcLA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=s/aFT4KA; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=andi.shyti@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=s/aFT4KA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=andi.shyti@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZddVX5R3kz30Tp
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Apr 2025 23:08:04 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D53285C100D;
	Thu, 17 Apr 2025 13:05:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F24DC4CEE4;
	Thu, 17 Apr 2025 13:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744895281;
	bh=qXwSbKoa+3CLa3KQktU6eGBwQ/lN3JxTlgMWrtWYA4k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s/aFT4KAzeo3foK4z0YCpKh70KkL/axv2rszxLiM/7DEfhxQfevMVARGd5oVb7ySp
	 f53s/xg3FmPkXNdnvkuSopX2+5BJ97mWX2J+VpUnX+FKBe8DLy0OMfKCwgyIKqP9Xa
	 Y944DXO1gMXLyeG8utxvdSDatJpGPMQl8xloeFrs/FwlJsQSztxK+8aPBIYJoMNhmb
	 iPmLVgWQw72SlVGGuOBq6t1nKd630l50OMaVX24lpwpdUCIAUIp+VOeCrLk/HfnqCU
	 QtwPtobCRC5i8G1j2hadf9La2MWbV7sja8SWxagGFV0YItyY2hG3osM4vanhx4qyiv
	 p+xPtSl6yGXVQ==
Date: Thu, 17 Apr 2025 15:07:56 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Sven Peter <sven@svenpeter.dev>
Cc: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, 
	linuxppc-dev@lists.ozlabs.org, asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/6] i2c: pasemi: Improve error recovery
Message-ID: <dtjvj34q4ojbci67akkxfiskpiro24xupagr5rl4dn3idd6vxh@2emtiwbvpvra>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415-pasemi-fixes-v2-4-c543bf53151a@svenpeter.dev>
X-Spam-Status: No, score=-6.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Sven, Hector,

...

> +/*
> + * The hardware (supposedly) has a 25ms timeout for clock stretching, thus
> + * use 100ms here which should be plenty.
> + */
> +#define TRANSFER_TIMEOUT_MS	100

Please use the PASEMI prefix here. TRANSFER_TIMEOUT_MS it's not a
naming belonging to this driver.

100ms looks a bit too much to me, but if you say it works, then
it works.

> +

...

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

as before, these warnings are treated as errors. Can we just
print error?

The rest looks good.

Andi

> +	}
> +
> +	/* Peripheral timeout? */
> +	if (status & SMSTA_MTO) {
> +		dev_warn(smbus->dev, "Peripheral timeout, status 0x%08x\n", status);
> +		return -ETIME;
> +	}

...

