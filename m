Return-Path: <linuxppc-dev+bounces-7226-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2E9A69D27
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Mar 2025 01:17:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZJ5kJ6YvGz2yrx;
	Thu, 20 Mar 2025 11:17:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742429848;
	cv=none; b=RBsbfbLROiPXhtfpWXP1QCgHXHxOHrvW43AauuK9tETDn0iYM5jh7yGTSVuAAM631NpcBLhTLFswfyDiGPVb7+OZp1pHm4kulQo/KS72BpUx9kJaC4DiYjmSSVPf0n256FEvv9/AVEf8Homkpb9b2gDtisZ9A9rgr/Z4dFx8zQxMUV2q6vJp+bRO929WxD5rCQN2r5OjWAIw/oYlPVyJk/GI+jjpRlzyLyWwXu1v+HiXENTI5OawOE9ec3fylhsmOji7LkRPp3dT2oduI257O6yui+YhwDJeT5qdZJc5KTD4Lx7+s0ux51ghhFf8C22K8EnsVG0ifiFrUARjotwIiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742429848; c=relaxed/relaxed;
	bh=K4re5PQvpoiSUMkMH5+LC/XgtaMh83lF3Lx0UPHLfTU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cGyVU+QaLTUt+ZWalyhReh/ApZdChHAfSI86fFwEb2ZUIlN9VFO7ynUvpFcNDguWLhmq+eVUGpL1xu3wAcMpXAK3giqz7TFsOCSvvL1yDvFWSltRJWIXsjhbuFSbuIB3WdoFhcyAT1bICUWzcX7kxhqOQWHa9WtX5S9wo2iTQyHwyWP1HxUKVosYNevVa6AUwxr0dxJWcDRa2xqko0cDLgXtr/yxb/1Mnpx2SoR+SPYDlW/PfTRr2YHL+pPbvxtB9uG2hrnaqMUD4DDF1Ni+Sgs9oSLvYp86+j8y1lxUswMQfnAzmLvocQbMQWN2GnE2svU6AtdQKT53/Uz3DK+SZA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=F3SqfcKx; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=andi.shyti@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=F3SqfcKx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=andi.shyti@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZJ5kH726Zz2yrp
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Mar 2025 11:17:27 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BD8185C101A;
	Thu, 20 Mar 2025 00:15:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB01CC4CEE4;
	Thu, 20 Mar 2025 00:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742429844;
	bh=2y/dJ4wHb2mrgocbKn8ljT/pAiya0DW13gSxj/rI8uY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F3SqfcKxCqyPMWOJ9NSQgdINsa8TSI+AC7nYUeOzvewHqrjYbPtrCfZqG8vF4llvd
	 VStA0W9qBho0AXDAlUqtgpDNjrPn2s4989Ep5n92bGGDBD3wkS7SpVPcgXDSN2gXnT
	 YxMNGFCLb6tMir0ZgRn0cMuZvHTa31OY0nb9BbZbfctJzDnZFFqmXnoUHXG8qy5tVd
	 FM7wP8tueJ8HyI8tpLFcPuU9cy6HA4poytqqiXVIhy5klZEjNGc6K+VWVLuEgx4sgV
	 1GFNx6GOZW5Bww9hVt5eLJFOh3Og7UczOlJ6fraJC4Hot7PvuZb1zgoaJ/kL/kRZX+
	 sYYjiUchVfQDg==
Date: Thu, 20 Mar 2025 01:17:21 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: sven@svenpeter.dev
Cc: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, linuxppc-dev@lists.ozlabs.org, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH 2/4] i2c: pasemi: Improve error recovery
Message-ID: <mp77oombs4xgr6sjj44ne7muybfrwejgehzv5xupeanh6udui3@ymgfesctindh>
References: <20250222-pasemi-fixes-v1-0-d7ea33d50c5e@svenpeter.dev>
 <20250222-pasemi-fixes-v1-2-d7ea33d50c5e@svenpeter.dev>
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
In-Reply-To: <20250222-pasemi-fixes-v1-2-d7ea33d50c5e@svenpeter.dev>
X-Spam-Status: No, score=-1.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Sven,

On Sat, Feb 22, 2025 at 01:38:34PM +0000, Sven Peter via B4 Relay wrote:
> The hardware (supposedly) has a 25ms timeout for clock stretching
> and the driver uses 100ms which should be plenty.

Can we add this lines as a comment to the define you are adding?

> The error
> reocvery itself is however lacking.

...

> -static void pasemi_smb_clear(struct pasemi_smbus *smbus)
> +static int pasemi_smb_clear(struct pasemi_smbus *smbus)
>  {
>  	unsigned int status;
> +	int timeout = TRANSFER_TIMEOUT_MS;
>  
>  	status = reg_read(smbus, REG_SMSTA);
> +
> +	/* First wait for the bus to go idle */
> +	while ((status & (SMSTA_XIP | SMSTA_JAM)) && timeout--) {
> +		msleep(1);

Please, use usleep_range for 1 millisecond timeout.

> +		status = reg_read(smbus, REG_SMSTA);
> +	}

You could use here readx_poll_timeout() here.

> +
> +	if (timeout < 0) {
> +		dev_warn(smbus->dev, "Bus is still stuck (status 0x%08x)\n", status);

if it's an error, please use an error.

> +		return -EIO;
> +	}
> +
> +	/* If any badness happened or there is data in the FIFOs, reset the FIFOs */
> +	if ((status & (SMSTA_MRNE | SMSTA_JMD | SMSTA_MTO | SMSTA_TOM | SMSTA_MTN | SMSTA_MTA)) ||
> +		!(status & SMSTA_MTE))

Please, fixe the alignment here.

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
>  	unsigned int status;
>  
>  	if (smbus->use_irq) {
>  		reinit_completion(&smbus->irq_completion);
> -		reg_write(smbus, REG_IMASK, SMSTA_XEN | SMSTA_MTN);
> -		wait_for_completion_timeout(&smbus->irq_completion, msecs_to_jiffies(100));
> +		/* XEN should be set when a transaction terminates, whether due to error or not */
> +		reg_write(smbus, REG_IMASK, SMSTA_XEN);
> +		wait_for_completion_timeout(&smbus->irq_completion, msecs_to_jiffies(timeout));

what happens if the timeout expires?

>  		reg_write(smbus, REG_IMASK, 0);
>  		status = reg_read(smbus, REG_SMSTA);
>  	} else {

...

>  	struct pasemi_smbus *smbus = adapter->algo_data;
>  	int ret, i;
>  
> -	pasemi_smb_clear(smbus);
> +	if (pasemi_smb_clear(smbus))
> +		return -EIO;

Can we use

	ret = ...
	if (ret)
		return ret;

This way we return whatever comes from pasemi_smb_clear().

>  
>  	ret = 0;

This way we can remove this line, as well.

Andi

