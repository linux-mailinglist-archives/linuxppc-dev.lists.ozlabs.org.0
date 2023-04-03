Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B7B26D4C0C
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Apr 2023 17:37:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pqw4q1l9tz3cff
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Apr 2023 01:37:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=BwhoJqaL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com; envelope-from=error27@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=BwhoJqaL;
	dkim-atps=neutral
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pqw3z5MDdz3cKj
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Apr 2023 01:36:46 +1000 (AEST)
Received: by mail-wm1-x32e.google.com with SMTP id d11-20020a05600c3acb00b003ef6e6754c5so14684344wms.5
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 03 Apr 2023 08:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680536201;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=36U2ODXozF5pK2igNm59zmr3WO0Khg7qUSKHoeCIVWg=;
        b=BwhoJqaLNoSSLvyTTvqW2nbcAZCdpTdsmovvaVb46KV8S92dsIpcEftkCQPkVmRicT
         di3DThQ76Jz7UWmuKb2Z+xmLg8C7CINouWrhKwmNiyT/3pwEFnaOyhwb2jA7W3kOHCqi
         XNcKS5fu7J91yI0Mbbd0Wep/f27+bMZHv9bn08qHAye7QpYEEOCyANigbqe4PAea7qav
         gK3mRThCvxzYVnP1otso0mwRZjXIyGIjYi0XX8RPiytPzBvNRe8GrWNBY+jV4vmOk7Y6
         RFlY9NLj9xZYbh96VHzvCpUk7nQE5E9szTOdziOjDrG+a05ijkuPPzur2hzRlOY3oZ8o
         sQUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680536201;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=36U2ODXozF5pK2igNm59zmr3WO0Khg7qUSKHoeCIVWg=;
        b=g6C2krm7+maKJWtRvEKGnZ3hM1D/QcvoOJWyz0+G5M60ZIDlYaJYfLZFDI7Ic78KMx
         DXMId42YHtc7Y65PtwbGzkEj7ZokbWCprYDoiwwqPImYYPkEBvluysfXCQF7KIZfYzcJ
         xmfnjqXaDeWfbOCikceUj+54Z6yFpHsyuINqCMfUzHTEqBeXa7bs8G4T1Gk3c44F9pct
         d0ZoNP4feWkogyKmtwbnVKHNZO9YEbZrxQkhWR3NpGPNayx8tVWast0YF/juIs2clgzZ
         WrayC2xO2l5Y+4sETpBmJ1uhyAKxyw3eJLc7fvlFZBS/K7ayZVszHj+WLgnRPSSxYTDr
         FTjA==
X-Gm-Message-State: AO0yUKVwUvKk8+CVbbY6+vcir4fn37yWTq8tYFYRCNuvJsAoFYBfSEjt
	CvLIr4k+B+X13NO/TP3euDY=
X-Google-Smtp-Source: AK7set8/sU4cta/hloqerAxo76VH1Rd5+pxr7aQzErcOpUbbqvbepfu9Plu/0J3se17SDrn0HIgzvQ==
X-Received: by 2002:a05:600c:22cd:b0:3eb:29fe:7343 with SMTP id 13-20020a05600c22cd00b003eb29fe7343mr25598754wmg.33.1680536200817;
        Mon, 03 Apr 2023 08:36:40 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id p1-20020a7bcc81000000b003ef5b011b30sm12426240wma.8.2023.04.03.08.36.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Apr 2023 08:36:40 -0700 (PDT)
Date: Mon, 3 Apr 2023 18:36:36 +0300
From: Dan Carpenter <error27@gmail.com>
To: Liliang Ye <yll@hust.edu.cn>
Subject: Re: [PATCH 1/2] ASoC: fsl_mqs: move of_node_put() to the correct
 location
Message-ID: <a256ab25-bafa-4600-ab90-522bf90103fb@kili.mountain>
References: <20230403152647.17638-1-yll@hust.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230403152647.17638-1-yll@hust.edu.cn>
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
Cc: hust-os-kernel-patches@googlegroups.com, alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, Xiubo Li <Xiubo.Lee@gmail.com>, Shengjiu Wang <shengjiu.wang@gmail.com>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>, Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Apr 03, 2023 at 11:26:47PM +0800, Liliang Ye wrote:
> of_node_put() should have been done directly after
> mqs_priv->regmap = syscon_node_to_regmap(gpr_np);
> otherwise it creates a reference leak on the success path.
> 
> To fix this, of_node_put() is moved to the correct location, and change
> all the gotos to direct returns.
> 
> Fixes: a9d273671440 ("ASoC: fsl_mqs: Fix error handling in probe")
> Signed-off-by: Liliang Ye <yll@hust.edu.cn>
> Reviewed-by: Dan Carpenter <error27@gmail.com>
> ---

These patches are from a university.  I think this patch was based on
manual review rather than static analysis.  They have not been tested
and this one affects the success path so that's always extra risky.

However I do believe the patch is correct and reviewed it before it was
sent publically.

regards,
dan carpenter

