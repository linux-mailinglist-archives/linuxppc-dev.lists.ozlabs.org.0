Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B705F335C
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Oct 2022 18:21:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mh5gM0VN0z3c8V
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Oct 2022 03:21:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.160.50; helo=mail-oa1-f50.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mh5fn59X7z2xjt
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Oct 2022 03:20:48 +1100 (AEDT)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-131ea99262dso11244055fac.9
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 03 Oct 2022 09:20:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=SrQIQIx2drceX3SN+9GboVD+7L3gb+zcudmTPkuxG4o=;
        b=fjbt1WT9uGEukM64bzmlPNGTu5ZJnY0A8x9TFjrKtSCkValGzak3Ifr4Xvl3MLgtA1
         YUDZX/gkJW/PIk+qMjuyBlKPzXadn+biEaxlRcyFi05zWVihZcib4t2tMuFDdyP4PQ51
         sKIN3gFLrGzS7Wz8AIudkU2OcFDGagJQWsb/ZJwuPXvmpZqF4R9M2r7qT9k1goR3n18m
         mX8qPuN50Y7buP3UT3DbCt1FJi7epv+wy9UUSHBKYojLe/OJWZAn3Rgn2HOt7o8cAMF5
         aovZGoayxW1dOhzxX48GZODWWoFZNm2Nh1Rskw0JfiviQi5qZTvZWH09Wzq7DrfQJVbD
         6qNQ==
X-Gm-Message-State: ACrzQf3sEpis1Vx7i2P6PSmsa+8En4IzEwq+PlReGapyLjkHYLBKFyhd
	zFQWhy+zlzC+3Jp/qxJieA==
X-Google-Smtp-Source: AMsMyM6cKgji6ciyhbfcp4feIvszGehOxAdPhv6e9KCbMI8b2WBWiPgQvBwA1TqrxbMdcC2DrtjgNg==
X-Received: by 2002:a05:6870:f60e:b0:131:b7cc:f994 with SMTP id ek14-20020a056870f60e00b00131b7ccf994mr5798922oab.113.1664814046016;
        Mon, 03 Oct 2022 09:20:46 -0700 (PDT)
Received: from macbook.herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id u17-20020a4ac991000000b00435a8024bc1sm2146879ooq.4.2022.10.03.09.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Oct 2022 09:20:45 -0700 (PDT)
Received: (nullmailer pid 2402827 invoked by uid 1000);
	Mon, 03 Oct 2022 16:20:44 -0000
Date: Mon, 3 Oct 2022 11:20:44 -0500
From: Rob Herring <robh@kernel.org>
To: Chancel Liu <chancel.liu@nxp.com>
Subject: Re: [PATCH v3 1/7] ASoC: dt-bindings: fsl_rpmsg: Add a property to
 assign the rpmsg channel
Message-ID: <166481404372.2402771.4568296878254068845.robh@kernel.org>
References: <20220930064441.2548505-1-chancel.liu@nxp.com>
 <20220930064441.2548505-2-chancel.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220930064441.2548505-2-chancel.liu@nxp.com>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, lgirdwood@gmail.com, Xiubo.Lee@gmail.com, shengjiu.wang@gmail.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, tiwai@suse.com, nicoleotsuka@gmail.com, broonie@kernel.org, krzysztof.kozlowski+dt@linaro.org, perex@perex.cz, festevam@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 30 Sep 2022 14:44:35 +0800, Chancel Liu wrote:
> Add a string property to assign the rpmsg channel this sound card sits
> on. This property can be omitted if there is only one sound card and it
> sits on "rpmsg-audio-channel".
> 
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
> ---
>  .../devicetree/bindings/sound/fsl,rpmsg.yaml  | 36 +++++++++++++++++--
>  1 file changed, 34 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
