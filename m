Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D5BB9563B48
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Jul 2022 22:55:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LZSBq5f9Jz3chY
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Jul 2022 06:55:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.166.173; helo=mail-il1-f173.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LZSBM3Dylz3cdX
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Jul 2022 06:54:50 +1000 (AEST)
Received: by mail-il1-f173.google.com with SMTP id i17so2106123ils.12
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 01 Jul 2022 13:54:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HrTG0yud13UmQCFPBZCzpXGEK9vy1R8RoOTRKyUValo=;
        b=AHPJPb+467ANa/WGAQBILIae9911qtwMoW6sU8LUVbcH/vHRs2WxMU/yRoFyQg++jN
         FKLwD0tWQcfUTySOk0o68EnIlX+KJoKxIsquTDIswDbNVt4VPi+jI6DDlY15aSvXLTF4
         Mjp59wGEdEfZhbNWgGRIU29LPliis8exFP29GJ5+baLIofVRbAGIghnWZRiZ5omJVF8o
         LdfUDbssosOD0I/KF0nojEjp2EhPUxzfuHjZLzF4M88ZzoCck2/J5bVgTXf3fkrTdf64
         5zw5TphYPXh/dngGWi3gFx4Jg/0gzLcp3AoARpjOZ5NqydnI5NE3P3eMQWZiplPglK6w
         mhsg==
X-Gm-Message-State: AJIora8FdOYzer96OVFEsWPw7dFSMAzQYl8e5UQ38ZrEuCJVSMbbT4lE
	aZ2MgDF9EgAEJhO8BODVdA==
X-Google-Smtp-Source: AGRyM1tN03ajV9JtjOBB9YmRsmAfhh0DZ3pRb8uoazawRe++MW5uDTrgKNun8JIBUIZsI2Usu7M1NQ==
X-Received: by 2002:a92:ddd1:0:b0:2d5:4877:65c8 with SMTP id d17-20020a92ddd1000000b002d5487765c8mr9847783ilr.267.1656708886842;
        Fri, 01 Jul 2022 13:54:46 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id f65-20020a0284c7000000b00339ddd8adddsm10257382jai.98.2022.07.01.13.54.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Jul 2022 13:54:46 -0700 (PDT)
Received: (nullmailer pid 1511267 invoked by uid 1000);
	Fri, 01 Jul 2022 20:54:44 -0000
Date: Fri, 1 Jul 2022 14:54:44 -0600
From: Rob Herring <robh@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH v2 5/6] ASoC: dt-bindings: fsl_spdif: Add two PLL clock
 source
Message-ID: <20220701205444.GA1511232-robh@kernel.org>
References: <1656667961-1799-1-git-send-email-shengjiu.wang@nxp.com>
 <1656667961-1799-6-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1656667961-1799-6-git-send-email-shengjiu.wang@nxp.com>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, Xiubo.Lee@gmail.com, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, lgirdwood@gmail.com, robh+dt@kernel.org, tiwai@suse.com, nicoleotsuka@gmail.com, broonie@kernel.org, festevam@gmail.com, krzk+dt@kernel.org, perex@perex.cz, shengjiu.wang@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 01 Jul 2022 17:32:40 +0800, Shengjiu Wang wrote:
> Add two PLL clock source, they are the parent clocks of root clock
> one is for 8kHz series rates, another one is for 11kHz series rates.
> They are optional clocks, if there are such clocks, then driver
> can switch between them for supporting more accurate rates.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  Documentation/devicetree/bindings/sound/fsl,spdif.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
