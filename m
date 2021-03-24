Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D582234764D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Mar 2021 11:39:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F54VS5pNXz3bs3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Mar 2021 21:39:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ForY/pCi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::42b;
 helo=mail-wr1-x42b.google.com; envelope-from=lee.jones@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=ForY/pCi; dkim-atps=neutral
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F54V32wcZz30Cm
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Mar 2021 21:39:04 +1100 (AEDT)
Received: by mail-wr1-x42b.google.com with SMTP id z2so23925085wrl.5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Mar 2021 03:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=2MN1HupZ2wU1N48DN3xopdGtWYSQO4jTJCN0wDe7jKo=;
 b=ForY/pCiS80CgudsYEzzbIxR+kr2cfbrUmgzu/ludY/Uo92HPWP+SLqDWeZfxq3WSe
 HTHwDHlrQxlLWT7P7Gq8eo9BSbEShZ7hjHRYm+FqCm5EvOgkFAEOk+QHzDYOVD+U1j0f
 tDwmW4UVfjTDmjAVPP4QM5xp5ThZOQECpMToplMoLRPOXLw/Y4IhVIILv38jPcpI6xNN
 XRdQhxIB83+2oYPLvz6k45cBAaJnHHduSScmxqQamSzovWUpRTHRSE1t5w28lN0nIAss
 g5A7AXDjoyOKqTqpGIXiA7P5po/OiVPWnnd2Q9XN/aOPBLxK67bsfxN6PjDXnw+Fs2Sx
 9y/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=2MN1HupZ2wU1N48DN3xopdGtWYSQO4jTJCN0wDe7jKo=;
 b=a4rk6z3unP+I2PxUpkxWp6vMLIyHEAGy04N0MexwBR6L1oJlwU7CZWgwecjrSzHdbp
 oeGUpPhc3sVGPov3x4fGaqi5vssj3JnV113WrVWkL5rAKe+4zPkbFWq0UZJhfv0dS7Ek
 Z0O3hyMLCCDn44VA6dUp0TVcOB/OMSxnMSI7g5pS1Jyg1DvYUzdoEq9oq1Cneb3QRfNc
 xPAQFPwFqoIWVJs8AdOjWyLCFZ2i7HL7QUDaCRPzEzb6lGrq2anuvC6KPsOtrDwM0Qcu
 v4bz1cxnwals7N475ulCIys1YTvc34rl0EJCao/O1fLfsRoE8esxkQ1lRGQ8xq5w2GlW
 imaQ==
X-Gm-Message-State: AOAM5336qOscTltTCrbW2SEMOf2myi6qIxRcD9PAqFltBdlwY6NoRwL3
 Pzkkk6OrLCHL8wI+FnEBEzcBSg==
X-Google-Smtp-Source: ABdhPJwIZdrt9EiiBePHl2O9+VwbRbzY7HrD7Y+Yu81cs+LLDiS4bf1HGZlx6QURHuOw/yy5G8QTIw==
X-Received: by 2002:a5d:42ca:: with SMTP id t10mr2743090wrr.274.1616582336777; 
 Wed, 24 Mar 2021 03:38:56 -0700 (PDT)
Received: from dell ([91.110.221.180])
 by smtp.gmail.com with ESMTPSA id j12sm2678133wrx.59.2021.03.24.03.38.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 03:38:56 -0700 (PDT)
Date: Wed, 24 Mar 2021 10:38:54 +0000
From: Lee Jones <lee.jones@linaro.org>
To: linux-kernel@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [RESEND 1/1] powerpc: asm: hvconsole: Move 'hvc_vio_init_early's
 prototype to shared location
Message-ID: <20210324103854.GK2916463@dell>
References: <20210303124603.3150175-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210303124603.3150175-1-lee.jones@linaro.org>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 03 Mar 2021, Lee Jones wrote:

> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/tty/hvc/hvc_vio.c:385:13: warning: no previous prototype for ‘hvc_vio_init_early’ [-Wmissing-prototypes]
>  385 | void __init hvc_vio_init_early(void)
>  | ^~~~~~~~~~~~~~~~~~
> 
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: linuxppc-dev@lists.ozlabs.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> Acked-by: Michael Ellerman <mpe@ellerman.id.au>
> ---
>  arch/powerpc/include/asm/hvconsole.h     | 3 +++
>  arch/powerpc/platforms/pseries/pseries.h | 3 ---
>  arch/powerpc/platforms/pseries/setup.c   | 1 +
>  3 files changed, 4 insertions(+), 3 deletions(-)

Any idea who might pick this up please?

It's been on the list for months.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
