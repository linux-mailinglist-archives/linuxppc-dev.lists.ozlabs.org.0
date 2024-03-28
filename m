Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BD58C890CC4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Mar 2024 22:57:44 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=T6IlFkQn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V5HTL3r14z3vf9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Mar 2024 08:57:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=T6IlFkQn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com; envelope-from=htejun@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V581c5HK1z3c0H
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Mar 2024 03:21:38 +1100 (AEDT)
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-6e782e955adso1089997b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Mar 2024 09:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711642896; x=1712247696; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TpQlnbUKf5vfOk3TpOVHNGMqh00k5XUuxEvlHT+naYc=;
        b=T6IlFkQnjP2I77M1bVP6avX7V3wzldb5IM8WfEjy2tekdGIDZUvFw67aFINmwnJ9+H
         FXzDjnU33G5B2Yt7Z/DI0Z86nF0K+DSLl+oLzwrKiE/hNgqrz/99oQl96T34LmK7OSxW
         0BD9gZRYqHc+/Z4//74iFGL3PWkd95EwumbyihluXSSslCabEyMDqZ5FE1Ubcw4XaXsx
         NNli8EFxU8GFWvPm7DSQDcEnymbABMu6BerzFu/xkHlV9JyXLVLTWAmEA4/Q2E/GNYtO
         PIh459JJaSUKEc8K917cpdOhobhsT210Qm2Z3AAB+oh6CQ6Y6IiQGX5GvzUrscB/LBZo
         GMkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711642896; x=1712247696;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TpQlnbUKf5vfOk3TpOVHNGMqh00k5XUuxEvlHT+naYc=;
        b=TViJBdu6aJhQDvnhjNiPWr5YfnTEXMgTRJxJE0o2Hs1jq8P3Vq+UJX0ioKAXwhmzEn
         Xc+jNQATsOS+Yw6Kg2H+PCZMZxlSPVzEPDd2DD9IkLNk0U5gk69fEu7OCvnM77ZOVl8e
         H+bFEnsxtCfZ8wo5nEkDwp+PD3UmenRnBjE8WixenbgV/cNnHBVcvk0wBAmEDEnXrsNu
         j/4jNJ8gKVbI7nqpWYXrdjgOElyTybAozcTF+OplpNjBvmRngBhTlYUF9BNzbUgh1luX
         v44DQ5ut7Ugi7SozrICEAfGD7y2mNUSLuyu0Voi8AsB8031v7NqnU+F5EuTLLQRvsIkb
         /w+A==
X-Forwarded-Encrypted: i=1; AJvYcCUJWeZ9htQp6qsyUSwows3pQ2R8daGO3D7Qc7XwX31HzChNC4nsI5ZCdELK0t7lGLTTlBLlvvWUJqfQ0hoByDMxJvh3bm6kzeIrOWUqvw==
X-Gm-Message-State: AOJu0YzviLH0XF1GYVIDVSd4Rf4t/WB70trnj+sMl66jZplJAGgqL8ef
	cF2UnVQshf+rZLnPUZJXOMmD4xEQbkbds43XjJvfLQkF18F8rHPT
X-Google-Smtp-Source: AGHT+IHNLtSIfLiMjPgdNbH73n29Rqo4mQsh/oBERN464FH6NwbPkAtXL24hv7Aec7RU+H+HqkGb1w==
X-Received: by 2002:a05:6a20:7495:b0:1a5:7308:3297 with SMTP id p21-20020a056a20749500b001a573083297mr1591044pzd.0.1711642896210;
        Thu, 28 Mar 2024 09:21:36 -0700 (PDT)
Received: from localhost ([2620:10d:c090:400::5:4d4e])
        by smtp.gmail.com with ESMTPSA id fd37-20020a056a002ea500b006eab6ac1f83sm1576815pfb.0.2024.03.28.09.21.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 09:21:35 -0700 (PDT)
Date: Thu, 28 Mar 2024 06:21:34 -1000
From: Tejun Heo <tj@kernel.org>
To: Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: [PATCH 9/9] mmc: Convert from tasklet to BH workqueue
Message-ID: <ZgWZDtNU4tCwqyeu@slm.duckdns.org>
References: <20240327160314.9982-1-apais@linux.microsoft.com>
 <20240327160314.9982-10-apais@linux.microsoft.com>
 <CAPDyKFpuKadPQv6+61C2pE4x4FE-DUC5W6WCCPu9Nb2DnDB56g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPDyKFpuKadPQv6+61C2pE4x4FE-DUC5W6WCCPu9Nb2DnDB56g@mail.gmail.com>
X-Mailman-Approved-At: Fri, 29 Mar 2024 08:57:06 +1100
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
Cc: imx@lists.linux.dev, linux-hyperv@vger.kernel.org, oneukum@suse.com, duncan.sands@free.fr, hayashi.kunihiko@socionext.com, linux-mmc@vger.kernel.org, aubin.constans@microchip.com, linus.walleij@linaro.org, Frank.Li@nxp.com, linux-usb@vger.kernel.org, HaraldWelte@viatech.com, paul@crapouillou.net, linux-tegra@vger.kernel.org, netdev@vger.kernel.org, maintainers@bluecherrydvr.com, peter.ujfalusi@gmail.com, manivannan.sadhasivam@linaro.org, linux-riscv@lists.infradead.org, kys@microsoft.com, robert.jarzmik@free.fr, haijie1@huawei.com, linux-renesas-soc@vger.kernel.org, wei.liu@kernel.org, linux-omap@vger.kernel.org, florian.fainelli@broadcom.com, linux-rdma@vger.kernel.org, vireshk@kernel.org, jassisinghbrar@gmail.com, decui@microsoft.com, wangzhou1@hisilicon.com, jernej.skrabec@gmail.com, jh80.chung@samsung.com, zw@zh-kernel.org, wens@csie.org, stern@rowland.harvard.edu, linux-arm-msm@vger.kernel.org, orsonzhai@gmail.com, pierre@ossman.eu, linux-mips@vger.kernel.org, Eugeniy.Paltse
 v@synopsys.com, patrice.chotard@foss.st.com, asahi@lists.linux.dev, brucechang@via.com.tw, keescook@chromium.org, oakad@yahoo.com, sven@svenpeter.dev, rjui@broadcom.com, s.hauer@pengutronix.de, sean.wang@mediatek.com, linux-actions@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, haojian.zhuang@gmail.com, mirq-linux@rere.qmqm.pl, linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, baolin.wang@linux.alibaba.com, matthias.bgg@gmail.com, openipmi-developer@lists.sourceforge.net, mchehab@kernel.org, Allen Pais <apais@linux.microsoft.com>, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com, sbranden@broadcom.com, logang@deltatee.com, andersson@kernel.org, marcan@marcan.st, haiyangz@microsoft.com, linux-kernel@vger.kernel.org, leoyang.li@nxp.com, konrad.dybcio@linaro.org, linux-sunxi@lists.linux.dev, vkoul@kernel.org, linux-s390@vger.kernel.org, mhiramat@kernel.org, zhang.lyra@gmail.com, dmaengine@vger.kernel.org, manuel.lauss@gmail.com,
  linux-media@vger.kernel.org, shawnguo@kernel.org, afaerber@suse.de, daniel@zonque.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

On Thu, Mar 28, 2024 at 01:53:25PM +0100, Ulf Hansson wrote:
> At this point we have suggested to drivers to switch to use threaded
> irq handlers (and regular work queues if needed too). That said,
> what's the benefit of using the BH work queue?

BH workqueues should behave about the same as tasklets which have more
limited interface and is subtly broken in an expensive-to-fix way (around
freeing in-flight work item), so the plan is to replace tasklets with BH
workqueues and remove tasklets from the kernel.

The [dis]advantages of BH workqueues over threaded IRQs or regular threaded
workqueues are the same as when you compare them to tasklets. No thread
switching overhead, so latencies will be a bit tighter. Wheteher that
actually matters really depends on the use case. Here, the biggest advantage
is that it's mostly interchangeable with tasklets and can thus be swapped
easily.

Thanks.

-- 
tejun
