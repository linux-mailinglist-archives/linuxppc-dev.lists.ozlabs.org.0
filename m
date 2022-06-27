Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7EF55BC67
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jun 2022 01:00:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LX39P2LC0z3cj5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jun 2022 09:00:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.166.172; helo=mail-il1-f172.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LX38y6T07z3bnn
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jun 2022 09:00:17 +1000 (AEST)
Received: by mail-il1-f172.google.com with SMTP id f15so6572519ilj.11
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jun 2022 16:00:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BBFolvCCjJnxhxohRNSfL/AQrqOPHqKgSw2LBcN2NnQ=;
        b=klWXZvKJoMO1MZk2ebLIFH4EjXxOP3gY6HHglsS2yStUPld64DX6t10syRpQe77U9f
         DEwhgsnXhnwB2iRR5UeXNSPTqjJIljDXlHmLUwGKvVFhGxrofmiz16ICxlk3627JgzNb
         weDVsY6yK8oUiGIzFhEHtC81BHizbFRXDAKxomZOqupewUSr88AMJ/im6/yjAJVXguL6
         htIR6u5RZ/F07i/pwgDFIML7LR5gMiQY3x+K0AWIxvai8QbSIvkgY1DJmv8WlJ3pKuSV
         uFR7RJE8yyhW4q9zD+P2pe3SVD5pn9L8hcHp/WHuixsjlfd70SdASV2etaUACgAvaM6+
         lieg==
X-Gm-Message-State: AJIora/wD8b+xA8NwHuTDQMAvbOCL9RIlL8M5EWeGvEmDa94CL1fUSrJ
	nR4x5YSwWwRXhWO9+8zanA==
X-Google-Smtp-Source: AGRyM1s3mDmWtHR9KacZ3brBzVulekXmlkOSi7niZLvqZ3o/vbqhjQZ0fgaGh7zEyYExAh29I7iuRQ==
X-Received: by 2002:a05:6e02:154d:b0:2da:9539:3093 with SMTP id j13-20020a056e02154d00b002da95393093mr4813252ilu.131.1656370814723;
        Mon, 27 Jun 2022 16:00:14 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id u18-20020a92ccd2000000b002d8d813892csm5083745ilq.8.2022.06.27.16.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 16:00:14 -0700 (PDT)
Received: (nullmailer pid 3126600 invoked by uid 1000);
	Mon, 27 Jun 2022 23:00:12 -0000
Date: Mon, 27 Jun 2022 17:00:12 -0600
From: Rob Herring <robh@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH v2 6/7] ASoC: dt-bindings: fsl-sai: Add new property to
 configure dataline
Message-ID: <20220627230012.GA3122063-robh@kernel.org>
References: <1655451877-16382-1-git-send-email-shengjiu.wang@nxp.com>
 <1655451877-16382-7-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1655451877-16382-7-git-send-email-shengjiu.wang@nxp.com>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, Xiubo.Lee@gmail.com, festevam@gmail.com, tiwai@suse.com, lgirdwood@gmail.com, perex@perex.cz, nicoleotsuka@gmail.com, broonie@kernel.org, krzk+dt@kernel.org, shengjiu.wang@gmail.com, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jun 17, 2022 at 03:44:36PM +0800, Shengjiu Wang wrote:
> "fsl,dataline" is added to configure the dataline of SAI.
> It has 3 value for each configuration, first one means the type:
> I2S(1) or PDM(2), second one is dataline mask for 'rx', third one is
> dataline mask for 'tx'. for example:
> 
> fsl,dataline = <1 0xff 0xff 2 0xff 0x11>,
> 
> it means I2S type rx mask is 0xff, tx mask is 0xff, PDM type
> rx mask is 0xff, tx mask is 0x11 (dataline 1 and 4 enabled).
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  Documentation/devicetree/bindings/sound/fsl-sai.txt | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/fsl-sai.txt b/Documentation/devicetree/bindings/sound/fsl-sai.txt
> index c71c5861d787..4c66e6a1a533 100644
> --- a/Documentation/devicetree/bindings/sound/fsl-sai.txt
> +++ b/Documentation/devicetree/bindings/sound/fsl-sai.txt
> @@ -49,6 +49,14 @@ Required properties:
>  			  receive data by following their own bit clocks and
>  			  frame sync clocks separately.
>  
> +  - fsl,dataline        : configure the dataline. it has 3 value for each configuration
> +                          first one means the type: I2S(1) or PDM(2)
> +                          second one is dataline mask for 'rx'
> +                          third one is dataline mask for 'tx'.
> +                          for example: fsl,dataline = <1 0xff 0xff 2 0xff 0x11>;
> +                          it means I2S type rx mask is 0xff, tx mask is 0xff, PDM type
> +                          rx mask is 0xff, tx mask is 0x11 (dataline 1 and 4 enabled).

You mean 0 and 4 enabled? Or 1 and 4?

How many 3 cell entries can you have?

Rob
