Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD70473605
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Dec 2021 21:36:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JCYDv5NZ3z301k
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Dec 2021 07:35:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.50; helo=mail-ot1-f50.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com
 [209.85.210.50])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JCYDS2xNJz2yws
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Dec 2021 07:35:34 +1100 (AEDT)
Received: by mail-ot1-f50.google.com with SMTP id
 u18-20020a9d7212000000b00560cb1dc10bso18698729otj.11
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Dec 2021 12:35:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=UjShsLmpN0SZM+m8SUUiNDWjd+SPX71KTwqzkwvysM0=;
 b=gOk0bqtjvl9g4Kb19jWrFZTvHgd68rMh3TrYo49KFxEZ2yWSPv/L8v85yML7/af1s6
 JXN2eTAurkPrVMuMj/FXyEHg6T7JMbm/DaIYxow1dq2sZmnvP92g+EbX9CiXiPuBu5xy
 TFVYI2tbF2cvVPK/+YKZBUM+6scebwV87JdLp3mkuCTS1t4xiAFt6ymELnmfOaJwFkgI
 d/qB2AJNzZGbTCP/tRpAcWh2JOhPK7TPcT9qJ2lrqsc4pQppDINPMwWn8WoGfIMIrval
 vW7ffbmgxRAPxJRU0fHG74cDvpfsIEPgmz9fdqcDn2nxBBjlEBeAUAm5Wpqw9zK+aDbU
 uxQg==
X-Gm-Message-State: AOAM532yn27/v2Rw1LoVtw9tl1rMDhj1EVV/hkgrTU7Frxmtxrfcc9y6
 p9FQwhuHl/F5bIWgg5AX/Q==
X-Google-Smtp-Source: ABdhPJy3T03Lv6DYRee0EAteJwqi9P/4wzvwMoGsPqpWTMFq+yupuVXKZwoG097ja4/X7OvByWI01w==
X-Received: by 2002:a9d:6190:: with SMTP id g16mr742838otk.54.1639427731541;
 Mon, 13 Dec 2021 12:35:31 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id p10sm2340679otp.53.2021.12.13.12.35.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 12:35:30 -0800 (PST)
Received: (nullmailer pid 1526504 invoked by uid 1000);
 Mon, 13 Dec 2021 20:35:29 -0000
Date: Mon, 13 Dec 2021 14:35:29 -0600
From: Rob Herring <robh@kernel.org>
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Subject: Re: [PATCH 0/4] fsl-asoc-card: Add optional dt property for setting
 mclk-id
Message-ID: <YbeukcwXQueEquJZ@robh.at.kernel.org>
References: <20211203134930.128703-1-ariel.dalessandro@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211203134930.128703-1-ariel.dalessandro@collabora.com>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 michael@amarulasolutions.com, kuninori.morimoto.gx@renesas.com,
 Xiubo.Lee@gmail.com, tony@atomide.com, festevam@gmail.com,
 shengjiu.wang@gmail.com, tiwai@suse.com, linux-kernel@vger.kernel.org,
 lgirdwood@gmail.com, nicoleotsuka@gmail.com, broonie@kernel.org,
 bcousson@baylibre.com, perex@perex.cz, linux-omap@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Dec 03, 2021 at 10:49:26AM -0300, Ariel D'Alessandro wrote:
> This is a follow up of patchset:
> 
>     [RFC patch 0/5] Support BCLK input clock in tlv320aic31xx

Link?

> Sound cards may allow using different main clock inputs. In the generic
> fsl-asoc-card driver, these values are hardcoded for each specific card
> configuration.
> 
> Let's make it more flexible, allowing setting mclk-id from the
> device-tree node.
> 
> Ariel D'Alessandro (4):
>   dt-bindings: sound: Rename tlv320aic31xx-micbias as tlv320aic31xx
>   dt-bindings: tlv320aic31xx: Define PLL clock inputs
>   ASoC: fsl-asoc-card: Add optional dt property for setting mclk-id

'mclk-id' is not documented.

>   ASoC: fsl-asoc-card: Remove BCLK default value for tlv320aic31xx card
> 
>  .../devicetree/bindings/sound/fsl-asoc-card.txt    |  1 +
>  .../devicetree/bindings/sound/tlv320aic31xx.txt    |  2 +-
>  arch/arm/boot/dts/am43x-epos-evm.dts               |  2 +-
>  include/dt-bindings/sound/tlv320aic31xx-micbias.h  |  9 ---------
>  include/dt-bindings/sound/tlv320aic31xx.h          | 14 ++++++++++++++
>  sound/soc/codecs/tlv320aic31xx.c                   |  2 +-
>  sound/soc/fsl/fsl-asoc-card.c                      |  7 ++++++-
>  7 files changed, 24 insertions(+), 13 deletions(-)
>  delete mode 100644 include/dt-bindings/sound/tlv320aic31xx-micbias.h
>  create mode 100644 include/dt-bindings/sound/tlv320aic31xx.h
> 
> -- 
> 2.30.2
> 
> 
