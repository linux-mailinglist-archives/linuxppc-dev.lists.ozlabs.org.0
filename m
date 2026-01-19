Return-Path: <linuxppc-dev+bounces-15954-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA288D39EA9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jan 2026 07:38:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dvgkh5wNsz2yDk;
	Mon, 19 Jan 2026 17:38:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::341"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768804684;
	cv=none; b=CMURLLp+fTGBOtxEXhWeFcaZeEQLS8cfOcaAaX68klbK9mpdojVZt1/ueQU0v5TjuLPXMydEJ5QrMUr17TbOUHn8gqomCfqQ0uHTJtmyPTA0JYJ1T4MLbbMw5/48WYU+OnHcnIKpz4x5SwHU/W5TV6nnkAJ3vLv1Vf7tJxSXw2WO1z1/lUo4rgt1O7y7fTiHh1t+nbL6AV6hA7u5fO5sXWcHz2dItcLc1VWet/ad2nki6YwFVFGInd11ruQEe4AacA/wF8Ez1pRQXxLCA0t6+8AYONl848o2VQ4GpaG8c2nME2mCVA7h/B8UF8b5IHYg/NkDOA3UTf5W3SVzG0dcMg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768804684; c=relaxed/relaxed;
	bh=CbWcz9mMKDIu3Eeo2pw/1X+znIUuGvzIKZFjWHoDt0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=hu76GjgKHqDmX9DSuyK6MazOeym3TEDaG208/dsuvItFzVgWO9+DU7pGjKUD5es1YSBcgTiuwNhVnO+H5bpmpVjp2vsJnLYTRtnBQV/hP4N5c9fCPRKnSfhz7447zz4S9CnVxEMEFvNwlPWX2S73ZTSewCQEOGTn8qCsv8gDZ2qKmYncWpjM7czpDjX/HCyLulHTxC571dxjdrbKXd0yi7JMMQoQrNZ2/dzTINixrt0jx2Onc8hh30vwtDzSy4HBw9imm4xE98u8LV8JIK+8yP4NsoyWO9rPu1lxMa7AMhr5NTh2WwIJqfLHDsxLe8B/JPh9+pHoICz2DZx41lK+TQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=wrqa4/Zv; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::341; helo=mail-wm1-x341.google.com; envelope-from=dan.carpenter@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=wrqa4/Zv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::341; helo=mail-wm1-x341.google.com; envelope-from=dan.carpenter@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dvgkf4m5Xz2xSZ
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jan 2026 17:38:02 +1100 (AEDT)
Received: by mail-wm1-x341.google.com with SMTP id 5b1f17b1804b1-4801bc328easo30303985e9.3
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 18 Jan 2026 22:38:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768804677; x=1769409477; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CbWcz9mMKDIu3Eeo2pw/1X+znIUuGvzIKZFjWHoDt0Q=;
        b=wrqa4/ZvvNk1khtC+NAMSohbqIJuhbmhAASHbTPXqaNRmZq4l5BhFpyh4BxVqZ4bfC
         Gd6/5a4IY3vGOfqazkZwu6oMzXGL3fEGf/g3Xi3FecmFxwj335FlOqvlRvsgsIS+gHmb
         NOw5t+CeI2cb8ikljm9fekMhYYQr+D7b1xqCLeXQjFtY7K3Gfy0gDwN4hH0zsZbLwnr8
         E42q2XvvBiB84FFQffLeCLr8iIHi7AaA+3ruuHfCK8Hdf1Uz+9D27G8icRz1yaiDv2O5
         RLc/N0WyaEzNxfja3vnCiADcecve8GinX2hmVw+N8KXGUe29cWyoWnMOnz7/82Cq9jwy
         L7cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768804677; x=1769409477;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CbWcz9mMKDIu3Eeo2pw/1X+znIUuGvzIKZFjWHoDt0Q=;
        b=t6qmxrdLB7OnhJb/TeeE02bn0Qxq3gkZvvsUK21hLqfeIXPNM7AeknFdI30B1XHMyk
         tYMYannjOLudK3TT9RnA447yYutLVu6UPOC1y+44xdQ5DCxQ3KMHnArNcZEz0WN8H914
         TqnsWSeujdkSWJQqsCXzht9zbfxr1AQTfJF4sz3R9weoIq7ct3w7cAQxD0AsItR3vtbn
         lQGwjb65r3jDpMArqnCVuqYQygtdE8hYsoSYyxgdazTANg4vUMS0OXRccUZWsDux5eLk
         xzfa3hR5KNSPCHYk8GLfKJ/k19Anz0olDN0xPctClT2zqnXhPqWnY5h38d2l1uImcXBZ
         +lug==
X-Forwarded-Encrypted: i=1; AJvYcCXzbTTrGCGw/k4vT2/QzmcIN5nHZzeM+yd7QjRtqe9AcfQgtka01svdEx045RT5le+8FNbxRzQsr8UNxbE=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwyxfE94kuFkT9gxSm8bAYpNk3mk/9MNQz4o/Vd4KNCdGX4Rrpy
	XnagtZMfRD7mrLX9cec59TEz9mUns2Wyy2VnIEDhFRQqznFP0LHmRiZjuEvcfHPUe38=
X-Gm-Gg: AY/fxX4wC2aQZAhWgvWgPgIQjvXM+JQt7P3mEaz7PHMXcYjG6AIYwaXkW6Z/jw/i8n9
	L3u5h8ZhHpA7MpYmlPYFo5Y6Qlep9nZ4MpRej5UmIiqS1/r/Nhf2GxmfxCBSMODcA9CpyCpiXml
	H203Rh2TBJdQWNpSuA4KzU6B9Gln9eSKUvQXg/qn5ZjLe1zyO0+zCdofRR1S+grFfVB2z0ikzgY
	ZzYYMqgP6qSZ6sUaEcUWQptqFaQ9/3L/V0mBaSv3DrQmhmCOtWzE/GmVT6YXN5qJnvnpbs+bpfW
	zfdRyu1q0gBjYMV/r5qNYaWWYagHMOpuV6nGu8z+hxL68feh0Cd2FHmdkGbEk9CzOpRwOEfNyOk
	WKywaMytc2C5xngU4S3QHflThAM0/xcYSnJWYRCsspUg29EdTioqARTeKxJi4m8V0BBIKhowCjV
	6vgWptS2Q6irr8xzL3LKyZE8DoUpk=
X-Received: by 2002:a05:600c:37c8:b0:47e:e87f:4bba with SMTP id 5b1f17b1804b1-4801eb0e1cfmr109058555e9.29.1768804677011;
        Sun, 18 Jan 2026 22:37:57 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801fe6d9a7sm75156405e9.17.2026.01.18.22.37.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 22:37:56 -0800 (PST)
Date: Mon, 19 Jan 2026 09:37:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Shengjiu Wang <shengjiu.wang@nxp.com>,
	shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
	perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 2/2] ASoC: fsl_audmix: Add support for i.MX952 platform
Message-ID: <202601170203.upPyGvI2-lkp@intel.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260116101648.377952-3-shengjiu.wang@nxp.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Shengjiu,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shengjiu-Wang/ASoC-dt-bindings-fsl-audmix-Add-support-for-i-MX952-platform/20260116-182050
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20260116101648.377952-3-shengjiu.wang%40nxp.com
patch subject: [PATCH 2/2] ASoC: fsl_audmix: Add support for i.MX952 platform
config: s390-randconfig-r071-20260116 (https://download.01.org/0day-ci/archive/20260117/202601170203.upPyGvI2-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 8.5.0
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202601170203.upPyGvI2-lkp@intel.com/

smatch warnings:
sound/soc/fsl/fsl_audmix.c:522 fsl_audmix_probe() warn: missing error code 'ret'

vim +/ret +522 sound/soc/fsl/fsl_audmix.c

be1df61cf06efb Viorel Suman  2019-01-22  465  static int fsl_audmix_probe(struct platform_device *pdev)
be1df61cf06efb Viorel Suman  2019-01-22  466  {
0c44e9e9e61cde Shengjiu Wang 2026-01-16  467  	const struct fsl_audmix_soc_data *soc_data;
62be484f7ad844 Viorel Suman  2019-04-10  468  	struct device *dev = &pdev->dev;
be1df61cf06efb Viorel Suman  2019-01-22  469  	struct fsl_audmix *priv;
be1df61cf06efb Viorel Suman  2019-01-22  470  	void __iomem *regs;
be1df61cf06efb Viorel Suman  2019-01-22  471  	int ret;
f2a36a78423ee8 Viorel Suman  2019-04-10  472  
62be484f7ad844 Viorel Suman  2019-04-10  473  	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
be1df61cf06efb Viorel Suman  2019-01-22  474  	if (!priv)
be1df61cf06efb Viorel Suman  2019-01-22  475  		return -ENOMEM;
be1df61cf06efb Viorel Suman  2019-01-22  476  
be1df61cf06efb Viorel Suman  2019-01-22  477  	/* Get the addresses */
959bb6b54d7086 YueHaibing    2019-07-27  478  	regs = devm_platform_ioremap_resource(pdev, 0);
be1df61cf06efb Viorel Suman  2019-01-22  479  	if (IS_ERR(regs))
be1df61cf06efb Viorel Suman  2019-01-22  480  		return PTR_ERR(regs);
be1df61cf06efb Viorel Suman  2019-01-22  481  
3feaba79d8f701 Shengjiu Wang 2021-03-24  482  	priv->regmap = devm_regmap_init_mmio(dev, regs, &fsl_audmix_regmap_config);
be1df61cf06efb Viorel Suman  2019-01-22  483  	if (IS_ERR(priv->regmap)) {
62be484f7ad844 Viorel Suman  2019-04-10  484  		dev_err(dev, "failed to init regmap\n");
be1df61cf06efb Viorel Suman  2019-01-22  485  		return PTR_ERR(priv->regmap);
be1df61cf06efb Viorel Suman  2019-01-22  486  	}
be1df61cf06efb Viorel Suman  2019-01-22  487  
62be484f7ad844 Viorel Suman  2019-04-10  488  	priv->ipg_clk = devm_clk_get(dev, "ipg");
be1df61cf06efb Viorel Suman  2019-01-22  489  	if (IS_ERR(priv->ipg_clk)) {
62be484f7ad844 Viorel Suman  2019-04-10  490  		dev_err(dev, "failed to get ipg clock\n");
be1df61cf06efb Viorel Suman  2019-01-22  491  		return PTR_ERR(priv->ipg_clk);
be1df61cf06efb Viorel Suman  2019-01-22  492  	}
be1df61cf06efb Viorel Suman  2019-01-22  493  
fe965096c9495d Shengjiu Wang 2019-11-11  494  	spin_lock_init(&priv->lock);
be1df61cf06efb Viorel Suman  2019-01-22  495  	platform_set_drvdata(pdev, priv);
62be484f7ad844 Viorel Suman  2019-04-10  496  	pm_runtime_enable(dev);
be1df61cf06efb Viorel Suman  2019-01-22  497  
62be484f7ad844 Viorel Suman  2019-04-10  498  	ret = devm_snd_soc_register_component(dev, &fsl_audmix_component,
be1df61cf06efb Viorel Suman  2019-01-22  499  					      fsl_audmix_dai,
be1df61cf06efb Viorel Suman  2019-01-22  500  					      ARRAY_SIZE(fsl_audmix_dai));
be1df61cf06efb Viorel Suman  2019-01-22  501  	if (ret) {
62be484f7ad844 Viorel Suman  2019-04-10  502  		dev_err(dev, "failed to register ASoC DAI\n");
77fffa742285f2 Chuhong Yuan  2019-12-03  503  		goto err_disable_pm;
be1df61cf06efb Viorel Suman  2019-01-22  504  	}
be1df61cf06efb Viorel Suman  2019-01-22  505  
294a60e5e98300 Shengjiu Wang 2025-02-26  506  	/*
294a60e5e98300 Shengjiu Wang 2025-02-26  507  	 * If dais property exist, then register the imx-audmix card driver.
294a60e5e98300 Shengjiu Wang 2025-02-26  508  	 * otherwise, it should be linked by audio graph card.
294a60e5e98300 Shengjiu Wang 2025-02-26  509  	 */
294a60e5e98300 Shengjiu Wang 2025-02-26  510  	if (of_find_property(pdev->dev.of_node, "dais", NULL)) {
5057d108d69a55 Fabio Estevam 2020-12-02  511  		priv->pdev = platform_device_register_data(dev, "imx-audmix", 0, NULL, 0);
be1df61cf06efb Viorel Suman  2019-01-22  512  		if (IS_ERR(priv->pdev)) {
be1df61cf06efb Viorel Suman  2019-01-22  513  			ret = PTR_ERR(priv->pdev);
5057d108d69a55 Fabio Estevam 2020-12-02  514  			dev_err(dev, "failed to register platform: %d\n", ret);
77fffa742285f2 Chuhong Yuan  2019-12-03  515  			goto err_disable_pm;
be1df61cf06efb Viorel Suman  2019-01-22  516  		}
294a60e5e98300 Shengjiu Wang 2025-02-26  517  	}
be1df61cf06efb Viorel Suman  2019-01-22  518  
0c44e9e9e61cde Shengjiu Wang 2026-01-16  519  	soc_data = of_device_get_match_data(dev);
0c44e9e9e61cde Shengjiu Wang 2026-01-16  520  	if (!soc_data) {
0c44e9e9e61cde Shengjiu Wang 2026-01-16  521  		dev_err(dev, "failed to match device\n");
0c44e9e9e61cde Shengjiu Wang 2026-01-16 @522  		goto err_disable_pm;

missing error code.

0c44e9e9e61cde Shengjiu Wang 2026-01-16  523  	}
0c44e9e9e61cde Shengjiu Wang 2026-01-16  524  
0c44e9e9e61cde Shengjiu Wang 2026-01-16  525  	if (of_property_read_bool(pdev->dev.of_node, "fsl,amix-bypass") &&
0c44e9e9e61cde Shengjiu Wang 2026-01-16  526  	    soc_data->bypass_index > 0) {
0c44e9e9e61cde Shengjiu Wang 2026-01-16  527  		ret = scmi_imx_misc_ctrl_set(soc_data->bypass_index, 0);
0c44e9e9e61cde Shengjiu Wang 2026-01-16  528  		if (ret)
0c44e9e9e61cde Shengjiu Wang 2026-01-16  529  			goto err_disable_pm;
0c44e9e9e61cde Shengjiu Wang 2026-01-16  530  	}
0c44e9e9e61cde Shengjiu Wang 2026-01-16  531  
77fffa742285f2 Chuhong Yuan  2019-12-03  532  	return 0;
77fffa742285f2 Chuhong Yuan  2019-12-03  533  
77fffa742285f2 Chuhong Yuan  2019-12-03  534  err_disable_pm:
77fffa742285f2 Chuhong Yuan  2019-12-03  535  	pm_runtime_disable(dev);
be1df61cf06efb Viorel Suman  2019-01-22  536  	return ret;
be1df61cf06efb Viorel Suman  2019-01-22  537  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


