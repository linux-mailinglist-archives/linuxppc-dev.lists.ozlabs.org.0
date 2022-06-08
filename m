Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5906154343B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jun 2022 16:48:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LJ98g2HP6z3brH
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jun 2022 00:48:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=eLn6iBll;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com; envelope-from=daniel.thompson@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=eLn6iBll;
	dkim-atps=neutral
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LJ9832FTcz3bjX
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jun 2022 00:48:17 +1000 (AEST)
Received: by mail-wm1-x332.google.com with SMTP id q15so7890895wmj.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 08 Jun 2022 07:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=AsTSbqFq1Bopw0lIZVLog4Y2QM1oEyRUOLCTFHozoZk=;
        b=eLn6iBll/WTIQUuGDQ+QCpgV81cFMNL+AKveFF9S3470O834KXDumV4UKBWTw1pEPs
         cHKslrjXiv+/5341NX17Cx5T57aIRk0z4s4Gks8H3olH7xqVfzG/2jVnqhzsVjB9bT/U
         yRvHg6alelEnO6XUJ3LRQLok79r6p0UgSlsMAsjZvV0wpEchpqVu4gz7qy5f+7KrU3Fo
         g2tQKERXGg/kiRwYF0yFN12s2vm7ClyJRCJFy04KTw74CJjcJVJnZLH4Z4+/RXI4iq2w
         XbAVS6p966Ue0vecFY6b5IQ4BTvmWRLjIas4aWtv7YxVgL20j1xXXrEi12mJvabaTL8p
         vL6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=AsTSbqFq1Bopw0lIZVLog4Y2QM1oEyRUOLCTFHozoZk=;
        b=rAPustDicS+aXKaYYBK456B+OcYZl2XD6CmsXy1xa0cK15fqrErFQ7fzy3CELMvf/3
         3UA9/LBft+TxF6uEHFIuFTG/vCIECx2ARoAe26t19uuZZxZzNmpBofUk4ydRQ1JaUtEh
         TfJ2V97Dgkn6vbk3hBlAKi2RrHVp3+CN8TfQwGc5msUtQGl1pJUL5/NDhSPT/1MOfr56
         +eWfZEV7aGmirv1RY+cKtivEtHriKnXlMrnFqQJynFDfm7DN1A5tZTAZ3mYiGdLBqPod
         kkYhxqoNDEAWmLGrxTLgiA+4se1XDel7uHYWic7bzrWK90ls7IeWIDSEW0yJGAXz+d6p
         9OJg==
X-Gm-Message-State: AOAM533ByeqZ1hk9vG5UPery2XIsXOWal6EuAit1TdqOvx7myWkEMPDo
	YE95VIxJXpXGoDYcZI7M8HWfzw==
X-Google-Smtp-Source: ABdhPJyNlX9mR+jfNuLkw5Yxng7DND6T3Ht+znaw7QZFDOMidaX+rthFvD7e9+uOs7qoh4Ru05/7Kw==
X-Received: by 2002:a05:600c:a44:b0:39c:1395:b44b with SMTP id c4-20020a05600c0a4400b0039c1395b44bmr48989879wmq.127.1654699692560;
        Wed, 08 Jun 2022 07:48:12 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net. [80.7.220.175])
        by smtp.gmail.com with ESMTPSA id n13-20020a5d400d000000b0020ff7246934sm21433309wrp.95.2022.06.08.07.48.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jun 2022 07:48:11 -0700 (PDT)
Date: Wed, 8 Jun 2022 15:48:10 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Stephen Kitt <steve@sk2.org>
Subject: Re: [PATCH] backlight: Use backlight helper
Message-ID: <20220608144810.gd6ckqfitoveztkh@maple.lan>
References: <20220607183411.1125030-1-steve@sk2.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220607183411.1125030-1-steve@sk2.org>
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

^^^
Subject seems a bit generic...

On Tue, Jun 07, 2022 at 08:34:11PM +0200, Stephen Kitt wrote:
> diff --git a/drivers/macintosh/via-pmu-backlight.c b/drivers/macintosh/via-pmu-backlight.c
> index 2194016122d2..c2d87e7fa85b 100644
> --- a/drivers/macintosh/via-pmu-backlight.c
> +++ b/drivers/macintosh/via-pmu-backlight.c
> @@ -71,12 +71,7 @@ static int pmu_backlight_get_level_brightness(int level)
>  static int __pmu_backlight_update_status(struct backlight_device *bd)
>  {
>  	struct adb_request req;
> -	int level = bd->props.brightness;
> -
> -
> -	if (bd->props.power != FB_BLANK_UNBLANK ||
> -	    bd->props.fb_blank != FB_BLANK_UNBLANK)
> -		level = 0;
> +	int level = backlight_get_brightness(bd);

Other than that LGTM.


Daniel.
