Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 53CA4270332
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Sep 2020 19:25:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BtLMM4P5XzDqsZ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Sep 2020 03:25:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.166.65; helo=mail-io1-f65.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
 [209.85.166.65])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BtLJs1kFczDqpd
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Sep 2020 03:23:20 +1000 (AEST)
Received: by mail-io1-f65.google.com with SMTP id y13so7645732iow.4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Sep 2020 10:23:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=saPAo/gkpaoA/GYSZXQC6We2mkx7qeNuAH87yYUAsJQ=;
 b=sncOGqf1437C+T5aBNNwLToLARSyLV077dWnIFc/MInvdA6Fajstc/mHqGyiVvRhXR
 6E2nSHjpen+SOb2UrrPYnBXIp6v71ZhqDmO6wR0fbAkmVRAmCCaN8pbW11P4weBERoHi
 vd6RKM6aRqEBFN2dTYkpz6rDcz0hFXQIr/VobkLZlWdim+/Xqs69KkrKtpAb/UDyrYLm
 XxbqIAgCtvwKvLdMj8Ql8zL+Z+7B7Jkjpw+gHhGhkIX+L7xnFA0gtOblf92mRTfmEevT
 I2DS2IcroT4q57c7kT7gcEF9iJAhaz2b/FmszitqLtYCQNhvOXkda80/OXw+BlHXG6B2
 9GnQ==
X-Gm-Message-State: AOAM53024DRhNEHDcbO1aZE9qebX4ZfwkPq03vDh82ZRR0TzpRg5IrxC
 yVdUE1uW8/jwKvW7ShvqRg==
X-Google-Smtp-Source: ABdhPJyQ+DL7qDKH3YsIUl8R6ZI+YVf+VlM/80iVcWJIL+opE0hCMTL+s+EECMXJ3hDnBHuyiPrigA==
X-Received: by 2002:a02:7fcf:: with SMTP id r198mr30732372jac.24.1600449796568; 
 Fri, 18 Sep 2020 10:23:16 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id z26sm1983844ilf.60.2020.09.18.10.23.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Sep 2020 10:23:15 -0700 (PDT)
Received: (nullmailer pid 3819029 invoked by uid 1000);
 Fri, 18 Sep 2020 17:23:13 -0000
Date: Fri, 18 Sep 2020 11:23:13 -0600
From: Rob Herring <robh@kernel.org>
To: "Viorel Suman (OSS)" <viorel.suman@oss.nxp.com>
Subject: Re: [PATCH 2/2] ASoC: dt-bindings: fsl_xcvr: Add document for XCVR
Message-ID: <20200918172313.GA3818893@bogus>
References: <1600247876-8013-1-git-send-email-viorel.suman@oss.nxp.com>
 <1600247876-8013-3-git-send-email-viorel.suman@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1600247876-8013-3-git-send-email-viorel.suman@oss.nxp.com>
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
 Liam Girdwood <lgirdwood@gmail.com>,
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, Viorel Suman <viorel.suman@nxp.com>,
 Viorel Suman <viorel.suman@gmail.com>,
 Cosmin-Gabriel Samoila <cosmin.samoila@nxp.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>, Fabio Estevam <festevam@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 16 Sep 2020 12:17:56 +0300, Viorel Suman (OSS) wrote:
> From: Viorel Suman <viorel.suman@nxp.com>
> 
> XCVR (Audio Transceiver) is a new IP module found on i.MX8MP.
> 
> Signed-off-by: Viorel Suman <viorel.suman@nxp.com>
> ---
>  .../devicetree/bindings/sound/fsl,xcvr.yaml        | 104 +++++++++++++++++++++
>  1 file changed, 104 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/fsl,xcvr.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

Error: Documentation/devicetree/bindings/sound/fsl,xcvr.example.dts:29.30-31 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:342: Documentation/devicetree/bindings/sound/fsl,xcvr.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1366: dt_binding_check] Error 2


See https://patchwork.ozlabs.org/patch/1365072

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.

