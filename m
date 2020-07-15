Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF9E221005
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jul 2020 16:58:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B6L9q0nbCzDqfc
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 00:58:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::441;
 helo=mail-wr1-x441.google.com; envelope-from=lee.jones@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=mZ7zMteF; dkim-atps=neutral
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B6L661VjYzDql6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jul 2020 00:55:24 +1000 (AEST)
Received: by mail-wr1-x441.google.com with SMTP id f2so3020867wrp.7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jul 2020 07:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=Xx3joU+7lj4tPv3i1MBeu7gIGjv2jVS4xXq0wsixJEw=;
 b=mZ7zMteF9Dkbv4smJYU6GqQ+rNM4I9cTbn4pjKCwKenfFj3y8WMi6xF/5lDE87m0mn
 0ipw1YhEn3wMmPaqWymXg7qytDbvgBHRAmy0zz1wWns9j+WrdH3Hr0dkvY3bzZC8Y8cc
 rak79OzoglUWnTrb3nQGygOzoyTJ8+F0sb9OTXIRFkfcLdTB9yhGDUy+7aV9jFXsXhu/
 j6gvw1HI5lHnqNVrqLdvgwYJ0JR+kzUEHZqeYlDPG7AJFP8aMG2u4Wg0aXFp00ezS96E
 3TRB6il2spjRMxMrg0mN0LPgz0Dq9Og+iXFLR/R5sfl0SaYoRYSB/Hp4LCKsSAhE/EhW
 fA3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Xx3joU+7lj4tPv3i1MBeu7gIGjv2jVS4xXq0wsixJEw=;
 b=SUFmns0ndlBU05R3zP9orjdCmgbjCPRrV3skcNzMKqQ096Qw3zMLAW5B9jG75YMTRT
 AEoJ1a8dK2NMMDzIaaV3t93Toj6cYDIyYb+k2NssVLYQzg8cLA6pQ5tMD6DRfOOtpkXK
 MmgF/Ko2H0b2Tdx0MMXKPfUJSn8JLTBXILAtpAUh8qW5EG3tN71XrkM/KjaJQ3Zg30VU
 uKF/Z6S9CJuTG/2GbAdG+rBn/sELjEMdBVOUpyZ6s1rZGRw6MIOXeRm9bffdNTwKA7cV
 zVrrH7DvZt7dHzaFBuGETQ/fPCYHyp87dGoi269XkqqcFny9PWIKpUlMExiXeDfGC6hV
 RLzA==
X-Gm-Message-State: AOAM530adnBBJJp5Ihd5/zOUpJ1jZR1Wl4IBfPVzXEp74NNDL+nFV45v
 d5cwsZPRd7t7nGXwkFmAk9t7Kg==
X-Google-Smtp-Source: ABdhPJweQjLfl3Z2I4EIWZw8pwB7r6eyoCyj4BdjN5QJI5YwTdyLpOuupQoYb9sgXDe+xqjyl9/7CA==
X-Received: by 2002:a5d:628b:: with SMTP id k11mr11838681wru.107.1594824919525; 
 Wed, 15 Jul 2020 07:55:19 -0700 (PDT)
Received: from dell ([2.31.163.61])
 by smtp.gmail.com with ESMTPSA id c15sm3733251wme.23.2020.07.15.07.55.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jul 2020 07:55:18 -0700 (PDT)
Date: Wed, 15 Jul 2020 15:55:16 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/1] ASoC: fsl: fsl-asoc-card: Trivial: Fix misspelling
 of 'exists'
Message-ID: <20200715145516.GH3165313@dell>
References: <20200715094447.3170843-1-lee.jones@linaro.org>
 <20200715142651.GA44014@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200715142651.GA44014@sirena.org.uk>
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

On Wed, 15 Jul 2020, Mark Brown wrote:

> On Wed, Jul 15, 2020 at 10:44:47AM +0100, Lee Jones wrote:
> 
> >  /*
> > - * This dapm route map exits for DPCM link only.
> > + * This dapm route map exists for DPCM link only.
> >   * The other routes shall go through Device Tree.
> 
> This doesn't apply against current code, please check and resend.

What is 'current code'?  It's applied against today's -next.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
