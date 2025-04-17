Return-Path: <linuxppc-dev+bounces-7741-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E2897A91D12
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Apr 2025 14:57:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZddGm3ZPxz3byP;
	Thu, 17 Apr 2025 22:57:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744894672;
	cv=none; b=T9kTgPqaMWOJ+RbTlIl6fF1hsf7tS9aVYsCprLazKKYr86CkUt+/T9v+kg54p4E7+BxfUCxSZl5SoryB4lNmecWEFjXT/9hlw5Ylx5KbciEBVJal0y6N8un2hMs9e462VdGKl224sOKm5DLjzL4lj0lV8b9ESR4e6EF8uLjROINByLq6ysH7crVEFNIrLCS1COiuyyMYL+M/px/sZdDvreMQjDK0B6tvwTTUdLPc34XLwZtkZ4Jc2grjhoPvjVHuKbOid6PHAdABCDPRNsvG6m3dKNMoo61kH/wCilHUHCsk68Fl4R9k7le6DdMiITA5KKFNIoi2NojLzkAfYqycaA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744894672; c=relaxed/relaxed;
	bh=7N2KTP9Kvaj+V0lqZJH8uAKpHq0RJXEMa2R38LKU4Ow=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dLaayN2yafh7XtWhRe6KyQjCcFdOnzU3u/hyFs5iRtNJTcqrqPAsPKSK2qMEkvdQxhF4KH/0wyloMyYjO5jLpj7/yTb/eC3QayKiXfYHvfmIo1gyFX3h9kM+cdrEV1D8TWgmM0Bt9YzDscnCVBD1e9Ctw/X0/Ly47tNrQQmqGEEqRE//sOtH2x+XFmMMOL2AJbSkncVL1Yjiij6vb1wx1Mp4tCgUpV9yp5/DAcTz+NbDg09AWvpMSY7SOZJDxZ1bxeP+23ZT5y5zrj0qSRInL15zJD5Pkw71B+zOIfPg+rS7tDJjplXbSvgIIWtG5u7HDK1i1MBKAetJseRxk+UgEw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VR3HJlu1; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=andi.shyti@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VR3HJlu1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=andi.shyti@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZddGl33lJz30Tp
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Apr 2025 22:57:51 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 200EAA4B3A9;
	Thu, 17 Apr 2025 12:52:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EC70C4CEEF;
	Thu, 17 Apr 2025 12:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744894668;
	bh=jC0ewz2A/v8CrSY20r308WeEKgKCaEyIUxe/Hk7E6J4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VR3HJlu15hmEx3pclURVQi97YKgePzYYoTA2ePOiGAW/6HvipNyAy9RUECrGMMQmU
	 b7lCeIFTHxUiRMDFzvMlxtB7jzfFC5OP/8NEJm8DlFDx5cBmlXkbSvbXRyzl1atFPA
	 gdqvlxTrq/wACQK5ixXKtHAXyhlF9P1cRe52/qkvBDGY9jdguA5Kx6TJijGg2/UWPt
	 tO4l9mEtcQ7iwQ4y/TBf1nEF92o7pjBRWVm/b0lmgLqqS6bcr+A9vuHYd4IlBRrHBc
	 rYnvFVvvyXYcGM44GwzxDngKB2VyRtvDNj9ryLJv0fvfKxvQz9OMtvzqEHQ6bOFzdt
	 0E0r0U3UBbHhw==
Date: Thu, 17 Apr 2025 14:57:43 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Sven Peter <sven@svenpeter.dev>
Cc: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, 
	linuxppc-dev@lists.ozlabs.org, asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/6] i2c: pasemi: Improve timeout handling
Message-ID: <s67nprw4a4xu3eqgom4hu6tvabt52l3aq6hp7klnkb4mocbzeu@rsyvaykn3e2j>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415-pasemi-fixes-v2-3-c543bf53151a@svenpeter.dev>
X-Spam-Status: No, score=-1.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Sven,

>  static int pasemi_smb_waitready(struct pasemi_smbus *smbus)
>  {
>  	int timeout = 100;
> +	int ret;

can you please declare this "ret" inside the if() statement
below?

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

this is an error and it's treated as an error, can we please
print dev_err()?

Andi

> +			return -ETIME;
> +		}
>  	}

