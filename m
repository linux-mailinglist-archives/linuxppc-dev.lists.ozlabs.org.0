Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE7A221025
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jul 2020 17:04:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B6LJG0QtGzDqcW
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 01:04:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::341;
 helo=mail-wm1-x341.google.com; envelope-from=lee.jones@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=ZsjT0iHq; dkim-atps=neutral
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B6L8H6Dz7zDqnc
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jul 2020 00:57:19 +1000 (AEST)
Received: by mail-wm1-x341.google.com with SMTP id c80so5912384wme.0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jul 2020 07:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=f2CbQp7JxGal1BdX0jNapHeOunGDBGdvrvEEUG5tMLY=;
 b=ZsjT0iHq1P3/z04/ctVDlAEdshwpCt+0LY1xJUraexpA6ESa5Cm58MH/VggfjMie2p
 DOXKxhzgpER0jwoId2TfiZ7bP2lxQamHk6c00FR8KAo3oRjGLunRTgHaTiaWwJ1RoBye
 NT2cC3p2k719f8CdUvoM00VKA07EH+SwOqplybI3qZ5o0OTFHyFwQutxrvDQFS1Fv7hX
 aiCn7Z1/PH66m09Sjab0iSZeCdbwagDQwX2flcM1C75VDJu6POrFGhk8WYATSbMbSA2F
 tCMNIbyhqfX3pLEYCnPjB/pKUTz76+kzImWY/838nep6Gfa00aA6aa3s740UTDF8Jcdd
 IxNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=f2CbQp7JxGal1BdX0jNapHeOunGDBGdvrvEEUG5tMLY=;
 b=MTXaBE3821HFCWOItOOKNcxH9+Vu3n+XZdpcZ0fHW8qBlPUJuHeC3JnOElmVEAr8lu
 cxkjZNvS+dqq5JxuWa9uEEivL2eSRJ7cXL5fpRU3IoRVBFF3+ZLkeM/rdRYhPapqFs4K
 Yje3hYEFJ7tN/sHrxyV/8izUxC6ZPM65KZGj95H5YYPFH4efHcGMLwFa6RIo3uKeTdRJ
 X3ZonHx1lwuSEqVWU/x9ztjLyPVlFGIzsEWi7KJDGpWTPCNoFol8ptYIL+DBZbLzMD3x
 e8SI8jtoRebQcKUj6xMnWxwZhosAHb3W037bGUUswqvAAR8Hw81y9GPPelF7eM6zYq/u
 kDIg==
X-Gm-Message-State: AOAM532XAbWZf43jq+WomIAdtUIlFUJApNnYuCYmN0wjw25yEAEF5Pom
 Mu4dEj2C/gCERr9vMHCFGSkL4A==
X-Google-Smtp-Source: ABdhPJwcQKIqBh34jcnUoTZ3kXw7R8fUZWe+6TCuYehKA+AQH/THmFlpQIeXdrAeHkNAbd82o6RElA==
X-Received: by 2002:a1c:5581:: with SMTP id j123mr8828248wmb.75.1594825033869; 
 Wed, 15 Jul 2020 07:57:13 -0700 (PDT)
Received: from dell ([2.31.163.61])
 by smtp.gmail.com with ESMTPSA id a22sm3624918wmj.9.2020.07.15.07.57.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jul 2020 07:57:13 -0700 (PDT)
Date: Wed, 15 Jul 2020 15:57:11 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/1] ASoC: fsl: fsl-asoc-card: Trivial: Fix misspelling
 of 'exists'
Message-ID: <20200715145711.GI3165313@dell>
References: <20200715094447.3170843-1-lee.jones@linaro.org>
 <20200715142651.GA44014@sirena.org.uk>
 <20200715145516.GH3165313@dell>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200715145516.GH3165313@dell>
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
Cc: alsa-devel@alsa-project.org, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 Nicolin Chen <nicoleotsuka@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 15 Jul 2020, Lee Jones wrote:

> On Wed, 15 Jul 2020, Mark Brown wrote:
> 
> > On Wed, Jul 15, 2020 at 10:44:47AM +0100, Lee Jones wrote:
> > 
> > >  /*
> > > - * This dapm route map exits for DPCM link only.
> > > + * This dapm route map exists for DPCM link only.
> > >   * The other routes shall go through Device Tree.
> > 
> > This doesn't apply against current code, please check and resend.
> 
> What is 'current code'?  It's applied against today's -next.

Hmm... something went wrong.  Stand by ...

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
