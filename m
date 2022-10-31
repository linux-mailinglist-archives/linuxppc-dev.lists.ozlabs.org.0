Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC53613C07
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Oct 2022 18:18:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N1KcP1DNtz3ds0
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Nov 2022 04:18:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.167.171; helo=mail-oi1-f171.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N1Kbp0fHsz3bhZ
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Nov 2022 04:17:57 +1100 (AEDT)
Received: by mail-oi1-f171.google.com with SMTP id l5so13434900oif.7
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Oct 2022 10:17:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7pOvyjw1Chc1Qo3mwyQQ5nSHExlsUwet1RU0yznC5TE=;
        b=ZvZZzkIo7jyLpWKbSi2XJAm6yGiEaNP4NVXO7Q+oaG9otscRV/wEzquFJLtKZrDycf
         KtyzsPWzQUUYN3n8USAT5Ex+AE94QQlT4UWoBE1zJELH2VFM45U4uVtD62Dwih4xDV1B
         I7KkglfmyJ1zKCeAtfeRk/U4qQAbwynVC0/e9xIYlFM310XuGyuuUdRnYuj/P9+uRtbG
         wLf/UyeuoHI5w7poHiJFLBIXW1zvI8d6i8/YvjSD4cdxO8c4vedF9qQitoX6ZszQwwzh
         JjqBuOQRnJzLpqXywJjpS+U5yDrXTYcfZLa6JDxiDKCYMRN+xit3iADqSVZIa/gmSELt
         uE3A==
X-Gm-Message-State: ACrzQf1mR9lnDMTLIcTb5FeZxtQKDMdW5yRu1Z1m7zYJpoWH5rMob4da
	3GIIh5Sd9N79szFKf0jqWQ==
X-Google-Smtp-Source: AMsMyM4hwSJ/t/sMgz8pe9Mn/V17zTjGPM4dJIHLWsN4XqhLFE8N5tkSwNmUpwHLALXTF9rtwNPhfQ==
X-Received: by 2002:a05:6808:1992:b0:359:d863:e870 with SMTP id bj18-20020a056808199200b00359d863e870mr6990457oib.289.1667236674184;
        Mon, 31 Oct 2022 10:17:54 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id t9-20020a4adbc9000000b004768f725b7csm2567227oou.23.2022.10.31.10.17.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 10:17:53 -0700 (PDT)
Received: (nullmailer pid 3025675 invoked by uid 1000);
	Mon, 31 Oct 2022 17:17:55 -0000
Date: Mon, 31 Oct 2022 12:17:55 -0500
From: Rob Herring <robh@kernel.org>
To: Chancel Liu <chancel.liu@nxp.com>
Subject: Re: [PATCH 1/3] ASoC: dt-bindings: fsl,micfil: Add compatible string
 for i.MX93 platform
Message-ID: <166723667417.3025615.2589955186893152938.robh@kernel.org>
References: <20221028082750.991822-1-chancel.liu@nxp.com>
 <20221028082750.991822-2-chancel.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221028082750.991822-2-chancel.liu@nxp.com>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, Xiubo.Lee@gmail.com, festevam@gmail.com, broonie@kernel.org, tiwai@suse.com, lgirdwood@gmail.com, linux-kernel@vger.kernel.org, nicoleotsuka@gmail.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, perex@perex.cz, shengjiu.wang@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On Fri, 28 Oct 2022 16:27:48 +0800, Chancel Liu wrote:
> Add compatible string "fsl,imx93-micfil" for i.MX93 platform
> 
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
> ---
>  Documentation/devicetree/bindings/sound/fsl,micfil.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
