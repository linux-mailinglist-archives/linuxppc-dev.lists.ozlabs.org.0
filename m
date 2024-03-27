Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3536488F0CB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Mar 2024 22:21:38 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=B5zRUrgV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V4fk76Xjfz3vh8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Mar 2024 08:21:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=B5zRUrgV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com; envelope-from=jernej.skrabec@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V4cNS3y13z3dW4
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Mar 2024 06:36:06 +1100 (AEDT)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-a46ea03c2a5so42697466b.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Mar 2024 12:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711568159; x=1712172959; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aojaArSnA0JfedDto4elyer8YODIKcUTNNFpLzMMgW8=;
        b=B5zRUrgVKV2jw6NFFreC9Et/RrNkG6MPzD02YpxQZGvRxyVYiJQA+iZYGWgszstySB
         AHWmvDQXLFr5pyHDfQvwim4pmx2Qw3+zLlObyca3MvReBJp1KlEbAzVL0eXr1m0RNdfC
         tDn12Xchfz9AA8ep2FRGsm4GbzW/08zXpFyLRF/vX73d4fT/nk4eGp5AFBIafnFl8qUX
         o+eM8GOfg23oZSFtN5p+0Qm/rWWUSVEXjxZFFsCXKBns8aOf9/BlNHobol054hiD3/F8
         Dzkd1/Ygcp7gFe9MLiEn7WGzdrTUdzWjoJX6uHqch4AvVd2ooDkzrZ5DcC2EJFRtZpfi
         FKbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711568159; x=1712172959;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aojaArSnA0JfedDto4elyer8YODIKcUTNNFpLzMMgW8=;
        b=S65SwJaKChR0/pMn9p9BdJL8QE7ddEarg58Kds/xQiha2uThK+YuIwfsv13CN45tXJ
         EeX6ZIWF9UwiSZd995h3Ypq69zWYUFwsv89+GgQ3NjBuKaBjM9Nf+lFPMveyGgULXopr
         9r4NxnSh5FaNLgtNaxPnoRZbJM+O3cDrPJcgQI5YWQS8XcjTsu4zQFn2lHhLaLWNoONZ
         guAPS53HDHf9EKtrid4cBmOeKFSzICmjAwarF5pShjblFEz5DLdptpK64qP49/8ubGew
         DJ+OsF8PDjT+1+WnKQo375g3VPMHXsQ9/XPpR2qMWqi8pum430VLN/u5Lukb1WlW/WlQ
         ADQg==
X-Forwarded-Encrypted: i=1; AJvYcCWfFM6EQuADzZWVLoEUcTiIynRYwn/75YyQUpFTlVq0qjL+d8q4883iiSWhV4ObUcNtULqrGC3WB58paP3NOO1NAE5MkI+Yfx1Q41hppA==
X-Gm-Message-State: AOJu0YyqL22mbtOtZG/hMH/Qh6z5dP1OXR9lUOJkMfmy+A7WqnP89bDX
	Pxhpj0WODq3PqxCK3xO71aYsjRsUIBTWY5lcEZ04iCbNQuClUUL9
X-Google-Smtp-Source: AGHT+IHWYCsKCZfCKe9WJ0A8h2jBWKCzprPvh9Stt4hH84aJN1DmeskwZihR1IueuTRTWs9wYxpP6Q==
X-Received: by 2002:a17:906:119a:b0:a47:3766:cfec with SMTP id n26-20020a170906119a00b00a473766cfecmr235001eja.9.1711568159337;
        Wed, 27 Mar 2024 12:35:59 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id j24-20020a17090643d800b00a4672fb2a03sm5858783ejn.10.2024.03.27.12.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 12:35:58 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-kernel@vger.kernel.org, Allen Pais <apais@linux.microsoft.com>
Subject: Re: [PATCH 9/9] mmc: Convert from tasklet to BH workqueue
Date: Wed, 27 Mar 2024 20:35:54 +0100
Message-ID: <9252961.CDJkKcVGEf@jernej-laptop>
In-Reply-To: <20240327160314.9982-10-apais@linux.microsoft.com>
References:  <20240327160314.9982-1-apais@linux.microsoft.com>
 <20240327160314.9982-10-apais@linux.microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-Mailman-Approved-At: Thu, 28 Mar 2024 08:10:21 +1100
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
Cc: imx@lists.linux.dev, ulf.hansson@linaro.org, oneukum@suse.com, duncan.sands@free.fr, hayashi.kunihiko@socionext.com, linux-mmc@vger.kernel.org, aubin.constans@microchip.com, linus.walleij@linaro.org, Frank.Li@nxp.com, linux-hyperv@vger.kernel.org, HaraldWelte@viatech.com, paul@crapouillou.net, linux-tegra@vger.kernel.org, netdev@vger.kernel.org, maintainers@bluecherrydvr.com, manivannan.sadhasivam@linaro.org, linux-riscv@lists.infradead.org, kys@microsoft.com, robert.jarzmik@free.fr, haijie1@huawei.com, linux-renesas-soc@vger.kernel.org, wei.liu@kernel.org, linux-omap@vger.kernel.org, florian.fainelli@broadcom.com, linux-rdma@vger.kernel.org, vireshk@kernel.org, jassisinghbrar@gmail.com, decui@microsoft.com, wangzhou1@hisilicon.com, peter.ujfalusi@gmail.com, jh80.chung@samsung.com, zw@zh-kernel.org, wens@csie.org, stern@rowland.harvard.edu, linux-arm-msm@vger.kernel.org, orsonzhai@gmail.com, pierre@ossman.eu, linux-usb@vger.kernel.org, Eugeniy.Paltsev@synopsys.com, patrice.chotar
 d@foss.st.com, asahi@lists.linux.dev, brucechang@via.com.tw, keescook@chromium.org, oakad@yahoo.com, sven@svenpeter.dev, rjui@broadcom.com, s.hauer@pengutronix.de, sean.wang@mediatek.com, linux-actions@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, haojian.zhuang@gmail.com, mirq-linux@rere.qmqm.pl, dmaengine@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, baolin.wang@linux.alibaba.com, matthias.bgg@gmail.com, openipmi-developer@lists.sourceforge.net, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com, sbranden@broadcom.com, logang@deltatee.com, andersson@kernel.org, marcan@marcan.st, haiyangz@microsoft.com, linux-mips@vger.kernel.org, leoyang.li@nxp.com, konrad.dybcio@linaro.org, linux-sunxi@lists.linux.dev, vkoul@kernel.org, linux-s390@vger.kernel.org, mhiramat@kernel.org, zhang.lyra@gmail.com, tj@kernel.org, manuel.lauss@gmail.com, linux-media@vger.kernel.org, shawnguo@kernel.org, afaerb
 er@suse.de, daniel@zonque.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Dne sreda, 27. marec 2024 ob 17:03:14 CET je Allen Pais napisal(a):
> The only generic interface to execute asynchronously in the BH context is
> tasklet; however, it's marked deprecated and has some design flaws. To
> replace tasklets, BH workqueue support was recently added. A BH workqueue
> behaves similarly to regular workqueues except that the queued work items
> are executed in the BH context.
> 
> This patch converts drivers/infiniband/* from tasklet to BH workqueue.

infiniband -> mmc

Best regards,
Jernej

> 
> Based on the work done by Tejun Heo <tj@kernel.org>
> Branch: https://git.kernel.org/pub/scm/linux/kernel/git/tj/wq.git for-6.10
> 
> Signed-off-by: Allen Pais <allen.lkml@gmail.com>



