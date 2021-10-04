Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE7E421440
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Oct 2021 18:38:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HNRH65L1Yz3cWL
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Oct 2021 03:38:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22b;
 helo=mail-oi1-x22b.google.com; envelope-from=robherring2@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HNRDN6D0Wz3drt
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Oct 2021 03:36:03 +1100 (AEDT)
Received: by mail-oi1-x22b.google.com with SMTP id q16so22340672oiw.10
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Oct 2021 09:36:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0dpw/V8bg0MxBudexnCNVse/yhrpLd1wrwigqMt/Mf4=;
 b=rdzRIlWKK5O7AJKtGMWJqNvLOoq0nIRVR5lU1J+KTVTvBT9Fh5ajR0Y60ZWSq5AuwL
 oZ+30MCFIEZZGWyMsGXjLlS3rpl3RW6F3jj70uX8qihdzIhi8GCGQUk/G1xRjOFSZwFm
 c9KyAk3VxeqHq1yjm0WgUZZhTMHCQByKG24B6M/pDWv3yoVoHAqfMAyju4isjSwGCH0z
 0MdEZIxh/0KeBfKQwbsKxsDdKPfbHOGRlV3YVEIhXnMy5kwpsX+wqdpoQSwh+ZSvaPJo
 l3QsrtXvOWnvL24nWmwEPdfonZsK4p0FY3ZtkQM92nUyDIa3ZlnsXmrGp8GXThEyejg7
 acnw==
X-Gm-Message-State: AOAM531AfWHiT/1b9l91vkutrvjrzJjF7B2HXKcyxgejQxwMRyX6/uDB
 HfleGv4X3L1rOT7jIPMekZs88gfmcw==
X-Google-Smtp-Source: ABdhPJyWs8jPtI7Az6impbOs6RYLWqtQA6g7t7PUwbGnr6ooHx6OyIrt5yr6QR8S2RGXjkrcVH6Pcw==
X-Received: by 2002:aca:30c9:: with SMTP id w192mr13601001oiw.93.1633364836818; 
 Mon, 04 Oct 2021 09:27:16 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id d21sm2868961ooh.43.2021.10.04.09.27.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 09:27:15 -0700 (PDT)
Received: (nullmailer pid 1418805 invoked by uid 1000);
 Mon, 04 Oct 2021 16:27:14 -0000
Date: Mon, 4 Oct 2021 11:27:14 -0500
From: Rob Herring <robh@kernel.org>
To: Li Yang <leoyang.li@nxp.com>
Subject: Re: [PATCH 2/5] memory: fsl_ifc: populate child devices without
 relying on simple-bus
Message-ID: <YVsrYp3kZNmB1CIu@robh.at.kernel.org>
References: <20211001000924.15421-1-leoyang.li@nxp.com>
 <20211001000924.15421-3-leoyang.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211001000924.15421-3-leoyang.li@nxp.com>
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
Cc: devicetree@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Sep 30, 2021 at 07:09:21PM -0500, Li Yang wrote:
> After we update the binding to not use simple-bus compatible for the
> controller, we need the driver to populate the child devices explicitly.
> 
> Signed-off-by: Li Yang <leoyang.li@nxp.com>
> ---
>  drivers/memory/fsl_ifc.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/memory/fsl_ifc.c b/drivers/memory/fsl_ifc.c
> index d062c2f8250f..251d713cd50b 100644
> --- a/drivers/memory/fsl_ifc.c
> +++ b/drivers/memory/fsl_ifc.c
> @@ -88,6 +88,7 @@ static int fsl_ifc_ctrl_remove(struct platform_device *dev)
>  {
>  	struct fsl_ifc_ctrl *ctrl = dev_get_drvdata(&dev->dev);
>  
> +	of_platform_depopulate(&dev->dev);
>  	free_irq(ctrl->nand_irq, ctrl);
>  	free_irq(ctrl->irq, ctrl);
>  
> @@ -285,6 +286,14 @@ static int fsl_ifc_ctrl_probe(struct platform_device *dev)
>  		}
>  	}
>  
> +	/* legacy dts may still use "simple-bus" compatible */
> +	if (!of_device_is_compatible(dev->dev.of_node, "simple-bus")) {
> +	        ret = of_platform_populate(dev->dev.of_node, NULL, NULL,
> +						&dev->dev);

There's no need to make this conditional. of_platform_populate() is safe 
to call multiple times. If that doesn't work, it's a bug.

Rob
