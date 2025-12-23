Return-Path: <linuxppc-dev+bounces-14956-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD741CD9C91
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Dec 2025 16:35:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dbJx62NQBz2xlP;
	Wed, 24 Dec 2025 02:35:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766504122;
	cv=none; b=HRY0TVI6eAtOJcuivkUUceqHmjeTBqq22LtNMT1AtCD1+KmaBj92O60axcGi86r4IN3dFpiv7O88ugOcs8pMjETlHzQsb+XTR+5mPUsVYvTzeYkGXnLDZRVPoAgQIaU3jfz8mn58qlEkS7qzRJhHfnCdDC+9tYqYksxF5RxJpVcxPwAEAnst1G45ShabL1O4gniFlULssHjMpIuU0UPq9Tcl57htidEbNfMbdFHIjqTL7VEQNfmMx0T6iqZZnMNdrg6/Mja3I6gXL21AlR9exVOFGDBQt5NNZGIoAmj+q9DHmo0i7Sg2cfGuBTW4lIXjhaNxCXvSrnGiE41PVJZTUA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766504122; c=relaxed/relaxed;
	bh=cWPT57p6Jd7ivqyDVBK9LoLbXWUxIYTM/MWkisSP2Bk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UBoXxDUVmWmkeQ75/qyEEROubz9/lRhM62e5Y8RKCLTJ7JxnaE5JlFbAzwnY1O8r9AsQOSRUos6a9nPZ8anUJgXB4c0qQXICbc6BRFfI98HB1y88COf7SFrAR5cp2adNMKiYQzer9y3LAcc2FA455a0Vx5YxALegEGf9FHq8CEV+cUOMmfcHqF2DSJ2P3vXmhY97bpkzKLUGw3/qRpY8VWtHgZBI+OxSlla7q6awrwMGwHIEZywZ+XrLUy7BjcgvrMK0opG6saQNuqevfd8ucFk04J2+BGHg2M811fH5RAsbyELEPDshA/uybwgqNgAPDAneWR6RIyuofJDWV4kOrw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=h/aT7SJZ; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=h/aT7SJZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dbJx53y9qz2xLR
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Dec 2025 02:35:21 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3AA434384C;
	Tue, 23 Dec 2025 15:34:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C179FC113D0;
	Tue, 23 Dec 2025 15:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766504089;
	bh=LC3cdBZ6Ngf+4CQshxrt4rb7NbJ4XT2zTtCXsIe8ZMc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=h/aT7SJZFhu3TPKfr7pa7n+7Kca5g4gxPtM7SDNqp7Mu91YvmBwBcrVd5KZhHdw2m
	 VYEhK0VnDI8vewLgzJcACh7IQKl2LlyCnT4Zdzx1hrZBX0cje9HOkOK2kbW7bypKcj
	 4FGeYr95q88x94Ta3ljFaCXIqpiPO6cMDxaBNRZJOXUZsivpV6y+RJSulwhcPfw7Z9
	 LnSQ0x3NWze3wnSmlhpykg2V8fwhyEazyWuUYtNnZ6g/Hq3m5fD2KC0Ka3saiQ4s4l
	 c52yj1k0iPa1BjeFqzUfBtwXM7FplF/qVU3NzoDpWH5p5xQS1IssczdPU9ELQmq4KD
	 KegoYKLjU/m7w==
Message-ID: <cce0a0ca-9ea1-437a-a857-17a2bfa28791@kernel.org>
Date: Tue, 23 Dec 2025 16:34:44 +0100
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] bus: fsl-mc: fix an error handling in fsl_mc_device_add()
To: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>, ioana.ciornei@nxp.com
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Dan Carpenter <dan.carpenter@linaro.org>, Su Hui <suhui@nfschina.com>
References: <20251222074958.992911-1-lihaoxiang@isrc.iscas.ac.cn>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20251222074958.992911-1-lihaoxiang@isrc.iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 22/12/2025 à 08:49, Haoxiang Li a écrit :
> If device_add() fails, call put_device() to drop the device
> reference and do the cleanp.
> 
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/all/b767348e-d89c-416e-acea-1ebbff3bea20@stanley.mountain/
> Signed-off-by: Su Hui <suhui@nfschina.com>
> Signed-off-by: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
> ---
>   drivers/bus/fsl-mc/fsl-mc-bus.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/bus/fsl-mc/fsl-mc-bus.c b/drivers/bus/fsl-mc/fsl-mc-bus.c
> index 25845c04e562..90a2107a9905 100644
> --- a/drivers/bus/fsl-mc/fsl-mc-bus.c
> +++ b/drivers/bus/fsl-mc/fsl-mc-bus.c
> @@ -896,7 +896,8 @@ int fsl_mc_device_add(struct fsl_mc_obj_desc *obj_desc,
>   		dev_err(parent_dev,
>   			"device_add() failed for device %s: %d\n",
>   			dev_name(&mc_dev->dev), error);
> -		goto error_cleanup_dev;
> +		put_device(&mc_dev->dev)

This change has obviously not been tested, not even built.

And by droping the goto, the kfree() are not done anymore, leaking 
mc_bus/mc_dev p kzalloced areas.

> +		return error;
>   	}
>   
>   	dev_dbg(parent_dev, "added %s\n", dev_name(&mc_dev->dev));


