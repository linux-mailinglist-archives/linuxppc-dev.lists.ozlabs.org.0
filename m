Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4613895E9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 May 2021 20:55:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FlhsF66R6z30G7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 04:55:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.181;
 helo=mail-oi1-f181.google.com; envelope-from=robherring2@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com
 [209.85.167.181])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Flhrv3NH9z2xtn
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 May 2021 04:55:25 +1000 (AEST)
Received: by mail-oi1-f181.google.com with SMTP id c3so14042792oic.8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 May 2021 11:55:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=DfJwaFSSdfu0thZ2Cn3t+uJakI2Lyxq/EcGAu8YcPsg=;
 b=hvK4ocGG54JbG3/xnpddWWY9xAc5aSeSG3w9/iTf61LzRklsjcXFYXtTc/3EX2niLR
 ChJgblC+/1RQzWiKnj2NQDjqH31ywABU8WIeNm3LitE8jtw4uwn9sKCrt1e1YM8NMOdm
 SVmPxpHCLtJxxwS/L2V1YOQvXl7e8LRTKtoAAORLK0wwDzuOwN5EobyPgecuT9HYbxm8
 R9U6ks9Tb/Aekuut68TcZPHs/cKp4JNL5PYYFdk6Ok9E06vRzScNOJVijn/sJhjlbFrH
 ht0p6qrp+/SQCHGIh+6gO2jgIb5g1zF/AP+VrWbZl/hWmBvxEBqoqFfEtXFXpJNdP2UF
 9ckg==
X-Gm-Message-State: AOAM531pXJUjImtUDb1Kx0WkkzI/oL57o5NWcfRmO6tGf7nt29AmrZQQ
 3xDyzqG9nIlxOkH4bm9/Fw==
X-Google-Smtp-Source: ABdhPJzoGCN0N40Nhaq9Ddug/dAwXluP1+HZQcWkRFpkBk/o4g6/sSDkr4/qhIyZP2IC3dnt/zTsSA==
X-Received: by 2002:aca:1015:: with SMTP id 21mr495980oiq.92.1621450524171;
 Wed, 19 May 2021 11:55:24 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id s17sm46433oog.31.2021.05.19.11.55.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 11:55:23 -0700 (PDT)
Received: (nullmailer pid 3449813 invoked by uid 1000);
 Wed, 19 May 2021 18:55:21 -0000
Date: Wed, 19 May 2021 13:55:21 -0500
From: Rob Herring <robh@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH v3 1/2] ASoC: dt-bindings: imx-card: Add binding doc for
 imx sound card
Message-ID: <20210519185521.GA3449751@robh.at.kernel.org>
References: <1621247488-21412-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1621247488-21412-1-git-send-email-shengjiu.wang@nxp.com>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, festevam@gmail.com,
 timur@kernel.org, Xiubo.Lee@gmail.com, shawnguo@kernel.org,
 s.hauer@pengutronix.de, tiwai@suse.com, linux-kernel@vger.kernel.org,
 lgirdwood@gmail.com, nicoleotsuka@gmail.com, robh+dt@kernel.org,
 broonie@kernel.org, linux-imx@nxp.com, kernel@pengutronix.de, perex@perex.cz,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 17 May 2021 18:31:27 +0800, Shengjiu Wang wrote:
> Imx-card is a new added machine driver for supporting
> ak4458/ak5558/ak5552/ak4497 codec on i.MX platforms. But these
> DAC/ADCs are not only supported codecs. This machine driver is
> designed to be a more common machine driver for i.MX platform,
> it can support widely cpu dai interface and codec dai interface.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
> changes in v3:
> - use a generic compatible string as Rob's comments.
> - change the file name
> 
> changes in v2:
> - update doc accoring to Rob's comment, use the common porperties.
> 
>  .../bindings/sound/imx-audio-card.yaml        | 122 ++++++++++++++++++
>  1 file changed, 122 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/imx-audio-card.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
