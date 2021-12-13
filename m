Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AEDD473608
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Dec 2021 21:36:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JCYFW1S87z3cbx
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Dec 2021 07:36:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.178;
 helo=mail-oi1-f178.google.com; envelope-from=robherring2@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com
 [209.85.167.178])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JCYDf2qzKz304n
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Dec 2021 07:35:46 +1100 (AEDT)
Received: by mail-oi1-f178.google.com with SMTP id u74so24712469oie.8
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Dec 2021 12:35:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=AxSFGAofOwMIAYDCCLSObSduTWGbW1+gxYdw/nwgbn8=;
 b=b+Pt3GRH4k96MRzWI3GdMuDTQgzbtBFWakJ3vHDdG9ObtS3mvfNPvOUB++XwZyXyuY
 92iFlXS6t2+9IBOqUO7Cy1+nwzqRljAfYZkb6Py6fwixdOWRDqTgJSJnW5TGSHdLIh8K
 YtZplx3UFn+Hd2Tq2NGA6AfT9QBCZpzEIz7bX+0khXH6381Uj5tbNfgqauqsMki65M0+
 Qj7e1wKMPeDNsvIwZnc3DFIzW6ws3QgJSM9M1IHFRgpsJwC3ImVfwJlaKr/42bW6ch4I
 xLHr1vwVRoijERdQfw2CgMz6e73Ch6k6Q6fEaiz9RSQXqGtRg2YGWjT7pc+hOHUHVZqn
 0JYw==
X-Gm-Message-State: AOAM530QWg4QqrFcFnXL+FwI1UM/bL48NDkpZVQM6AoDZL4ADZyxn2HO
 jItaeArJSI6TyPSCtr4g/w==
X-Google-Smtp-Source: ABdhPJw7qa4AuHZj7EbN/+1qNf7EXChlDMQ/Ktbo40SMyKH7L4Hvz/la/8EklTYV0aHyX/NY6RRJLA==
X-Received: by 2002:a05:6808:1311:: with SMTP id
 y17mr843858oiv.32.1639427743733; 
 Mon, 13 Dec 2021 12:35:43 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id a16sm2338828otj.79.2021.12.13.12.35.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 12:35:43 -0800 (PST)
Received: (nullmailer pid 1526832 invoked by uid 1000);
 Mon, 13 Dec 2021 20:35:42 -0000
Date: Mon, 13 Dec 2021 14:35:42 -0600
From: Rob Herring <robh@kernel.org>
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Subject: Re: [PATCH 1/4] dt-bindings: sound: Rename tlv320aic31xx-micbias as
 tlv320aic31xx
Message-ID: <YbeunvMNmyDxGrLb@robh.at.kernel.org>
References: <20211203134930.128703-1-ariel.dalessandro@collabora.com>
 <20211203134930.128703-2-ariel.dalessandro@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211203134930.128703-2-ariel.dalessandro@collabora.com>
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
 linuxppc-dev@lists.ozlabs.org, kuninori.morimoto.gx@renesas.com,
 Xiubo.Lee@gmail.com, tony@atomide.com, shengjiu.wang@gmail.com, tiwai@suse.com,
 lgirdwood@gmail.com, robh+dt@kernel.org, perex@perex.cz,
 nicoleotsuka@gmail.com, linux-omap@vger.kernel.org, broonie@kernel.org,
 bcousson@baylibre.com, michael@amarulasolutions.com, festevam@gmail.com,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 03 Dec 2021 10:49:27 -0300, Ariel D'Alessandro wrote:
> Let's use a more generic name, so other definitions for tlv320aic31xx
> can be included.
> 
> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> ---
>  .../devicetree/bindings/sound/tlv320aic31xx.txt          | 2 +-
>  arch/arm/boot/dts/am43x-epos-evm.dts                     | 2 +-
>  include/dt-bindings/sound/tlv320aic31xx-micbias.h        | 9 ---------
>  include/dt-bindings/sound/tlv320aic31xx.h                | 9 +++++++++
>  sound/soc/codecs/tlv320aic31xx.c                         | 2 +-
>  5 files changed, 12 insertions(+), 12 deletions(-)
>  delete mode 100644 include/dt-bindings/sound/tlv320aic31xx-micbias.h
>  create mode 100644 include/dt-bindings/sound/tlv320aic31xx.h
> 

Acked-by: Rob Herring <robh@kernel.org>
