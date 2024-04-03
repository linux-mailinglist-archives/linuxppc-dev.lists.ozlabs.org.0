Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC0C897A57
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Apr 2024 23:03:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Cm9/mu9e;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V8xzs67hQz3vbG
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Apr 2024 08:03:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Cm9/mu9e;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::936; helo=mail-ua1-x936.google.com; envelope-from=allen.lkml@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ua1-x936.google.com (mail-ua1-x936.google.com [IPv6:2607:f8b0:4864:20::936])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V8rDy5HYSz3c5J
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Apr 2024 03:44:17 +1100 (AEDT)
Received: by mail-ua1-x936.google.com with SMTP id a1e0cc1a2514c-7e074f8ac06so17613241.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Apr 2024 09:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712162651; x=1712767451; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Aej6QFoETxeFvbQm8/sOYYAdEcWAnghw/7Ynm8n0ucQ=;
        b=Cm9/mu9eFo2FF4QIhHvgG+5obaD0qEZeNjczne1zyTNfS9vTSmokpswlFNRZkdKGml
         E7Mkr+ctZEc3L/QoN9mgB9ABv+N5Sk1QostKSy0Dio7jV8pvApKfOhG5ae0bs/qLmaVw
         /MQzM66GueqG9HMokKRjlGkVxmzcafwKlU9L2KRAEzJcnHAm6u3wfUX6KhOn0MuRaLhj
         QIlSJxnAXKIiFL+IiYjF42pZU2POoKIqVob1gbwCDOvCRzzgeR1ETXz/akejTuR2qTQA
         g0pxGHYUFUFibC7hdjoV+LCKKMtb5fhq/VNlV47bNDMFUepOrZFAacOOooliWaUqMLO5
         I6Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712162651; x=1712767451;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Aej6QFoETxeFvbQm8/sOYYAdEcWAnghw/7Ynm8n0ucQ=;
        b=e+mxCzVNM6cCETYm8vGUo3Zdp51xWo1cHQD83HWFzwuU7I3qvCrNNg+jksv+5KlYiW
         D6Nx0Ha5r9IIaxjn4u9lWM9P53rGj4RFQqKx//RSOS28uXttWWflNygqpoibipQy3e+Y
         bIT9VtYt4KEZI0UZAYdps1psUs/1ZisRJgA/pcTbno4gVVEJcnYbu7FFrduZ5uLJzguE
         RE+Lwge/qpV4cgriMEEUCE/algDmWxcwmpTxtzRg/Kn7jVpMVGs8ar8MW6J7XjVvo5AJ
         iOzW8892c55vRkJza1+FCtVtOqWJGF5clLBvosb+khf76D/zB5FsQWUPvTR4bGeTuWe8
         yJtQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwI6CIQLTB5KTuQJnVaFsVW1oWw1HM6Xb86SZmgiAb2G9g6YZYeuxmNDr+zR3fsNOKnZ9fhh5YiKKnwnoLMxnODemjgj2xChrq6iEYtA==
X-Gm-Message-State: AOJu0YymPXmhKeArSwmhMqWgABC7R7eidtDPGjOnyOZeX6ZMWprzdmHf
	xTRr8SntWKK6dDsaRNJZdYsm34lZRdvjWFm3AoRciYHVXhgC/Dlxk7+yWSRe80XoPu0PBXa+nz1
	oxGiIISX7N3MtSAIOM+413VODj/s=
X-Google-Smtp-Source: AGHT+IFEFFEcpcdQfCxRWJYlDuuUETZ0sWBciDlGUMCvLnJmEBIY1oP87nAaJSL5QQDatxb4oTnFcly4MrzzQ8OrF5o=
X-Received: by 2002:a05:6122:499a:b0:4d3:b326:5ae8 with SMTP id
 ex26-20020a056122499a00b004d3b3265ae8mr10815788vkb.14.1712162651582; Wed, 03
 Apr 2024 09:44:11 -0700 (PDT)
MIME-Version: 1.0
References: <20240327160314.9982-1-apais@linux.microsoft.com> <20240327160314.9982-2-apais@linux.microsoft.com>
In-Reply-To: <20240327160314.9982-2-apais@linux.microsoft.com>
From: Allen <allen.lkml@gmail.com>
Date: Wed, 3 Apr 2024 09:43:57 -0700
Message-ID: <CAOMdWSLavg27YZgnfE2QHjO=4RNmFx_7veAURaPG_=qWX=KMVA@mail.gmail.com>
Subject: Re: [PATCH 1/9] hyperv: Convert from tasklet to BH workqueue
To: Allen Pais <apais@linux.microsoft.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 04 Apr 2024 08:02:05 +1100
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
Cc: imx@lists.linux.dev, ulf.hansson@linaro.org, oneukum@suse.com, duncan.sands@free.fr, hayashi.kunihiko@socionext.com, linux-mmc@vger.kernel.org, aubin.constans@microchip.com, linus.walleij@linaro.org, Frank.Li@nxp.com, linux-hyperv@vger.kernel.org, linux-usb@vger.kernel.org, HaraldWelte@viatech.com, paul@crapouillou.net, linux-tegra@vger.kernel.org, netdev@vger.kernel.org, maintainers@bluecherrydvr.com, peter.ujfalusi@gmail.com, manivannan.sadhasivam@linaro.org, linux-riscv@lists.infradead.org, kys@microsoft.com, robert.jarzmik@free.fr, haijie1@huawei.com, linux-renesas-soc@vger.kernel.org, wei.liu@kernel.org, linux-omap@vger.kernel.org, florian.fainelli@broadcom.com, linux-rdma@vger.kernel.org, vireshk@kernel.org, jassisinghbrar@gmail.com, decui@microsoft.com, wangzhou1@hisilicon.com, jernej.skrabec@gmail.com, jh80.chung@samsung.com, zw@zh-kernel.org, wens@csie.org, stern@rowland.harvard.edu, linux-arm-msm@vger.kernel.org, orsonzhai@gmail.com, pierre@ossman.eu, linux-mips@vger.ke
 rnel.org, Eugeniy.Paltsev@synopsys.com, patrice.chotard@foss.st.com, asahi@lists.linux.dev, brucechang@via.com.tw, keescook@chromium.org, oakad@yahoo.com, sven@svenpeter.dev, rjui@broadcom.com, s.hauer@pengutronix.de, sean.wang@mediatek.com, linux-actions@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, haojian.zhuang@gmail.com, mirq-linux@rere.qmqm.pl, dmaengine@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, baolin.wang@linux.alibaba.com, matthias.bgg@gmail.com, openipmi-developer@lists.sourceforge.net, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com, sbranden@broadcom.com, logang@deltatee.com, andersson@kernel.org, marcan@marcan.st, haiyangz@microsoft.com, linux-kernel@vger.kernel.org, leoyang.li@nxp.com, konrad.dybcio@linaro.org, linux-sunxi@lists.linux.dev, vkoul@kernel.org, linux-s390@vger.kernel.org, mhiramat@kernel.org, zhang.lyra@gmail.com, tj@kernel.org, manuel.lauss@gmail.com, 
 linux-media@vger.kernel.org, shawnguo@kernel.org, afaerber@suse.de, daniel@zonque.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> The only generic interface to execute asynchronously in the BH context is
> tasklet; however, it's marked deprecated and has some design flaws. To
> replace tasklets, BH workqueue support was recently added. A BH workqueue
> behaves similarly to regular workqueues except that the queued work items
> are executed in the BH context.
>
> This patch converts drivers/hv/* from tasklet to BH workqueue.
>
> Based on the work done by Tejun Heo <tj@kernel.org>
> Branch: https://git.kernel.org/pub/scm/linux/kernel/git/tj/wq.git for-6.10
>
> Signed-off-by: Allen Pais <allen.lkml@gmail.com>
> ---
>  drivers/hv/channel.c      |  8 ++++----
>  drivers/hv/channel_mgmt.c |  5 ++---
>  drivers/hv/connection.c   |  9 +++++----
>  drivers/hv/hv.c           |  3 +--
>  drivers/hv/hv_balloon.c   |  4 ++--
>  drivers/hv/hv_fcopy.c     |  8 ++++----
>  drivers/hv/hv_kvp.c       |  8 ++++----
>  drivers/hv/hv_snapshot.c  |  8 ++++----
>  drivers/hv/hyperv_vmbus.h |  9 +++++----
>  drivers/hv/vmbus_drv.c    | 19 ++++++++++---------
>  include/linux/hyperv.h    |  2 +-
>  11 files changed, 42 insertions(+), 41 deletions(-)

Wei,

 I need to send out a v2 as I did not include the second patch that
updates drivers/pci/controller/pci-hyperv.c

Thanks.
