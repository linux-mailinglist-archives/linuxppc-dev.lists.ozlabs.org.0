Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4665375441D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jul 2023 23:10:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R2kfJ1bpBz3cPY
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Jul 2023 07:10:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.166.54; helo=mail-io1-f54.google.com; envelope-from=robherring2@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R2kdq0JZLz3bNq
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Jul 2023 07:10:21 +1000 (AEST)
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-78362f57500so97483539f.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Jul 2023 14:10:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689369018; x=1691961018;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RkCjprVYBJpe7HRMk9SvWkrvsXF3xVXknPaBi2ASDrw=;
        b=RrSePeEu2I7PcRCB2ENnmif5iKAxL2kliVT8toRcmva37UREJ/GwTvI/W7Eqg/ilgd
         tPgb3Uyk4Kv4Pypn82Hs+1jMf2nquBVo0EAzSPoYD16ovTqrJnWtodT5r9inkCHsbc4P
         4tyLm8x03CWHlK/LzAQF5wJVVwC58Umlz5FymMH72sD13WfrLt9EWF/z1iwFCknwRMSl
         vFQQR/ublQytvLuNVqVpQQwOuDYZ1TXCAxV2gBKIeizpO9bADLYiyP+LeQr6oZWqwDPt
         QSLLQJGT5LTY98480Y5ednUq6O4OkbuwSyTuUYvv0+fi/HWn0om9wEl0MHMRZb8khvFD
         hhaQ==
X-Gm-Message-State: ABy/qLbKHWsrMZpxXLlURItrOkJH3qGt6zCA9p6QbitCsX3zRhro6h12
	D5eCzUEZg+VLD/JF7a1WqA==
X-Google-Smtp-Source: APBJJlHw2d99DUg4gS2VZfnGG0p4S0aamaC8pUtwgVWFXwCrzpNa4KyrdxyzMFAGOi1rds0VjPsDyQ==
X-Received: by 2002:a6b:a04:0:b0:776:fd07:3c96 with SMTP id z4-20020a6b0a04000000b00776fd073c96mr6153362ioi.7.1689369018459;
        Fri, 14 Jul 2023 14:10:18 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id b9-20020a056602218900b007835686237asm2923748iob.27.2023.07.14.14.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jul 2023 14:10:17 -0700 (PDT)
Received: (nullmailer pid 250792 invoked by uid 1000);
	Fri, 14 Jul 2023 21:10:02 -0000
Date: Fri, 14 Jul 2023 15:10:02 -0600
From: Rob Herring <robh@kernel.org>
To: Chancel Liu <chancel.liu@nxp.com>
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: fsl_rpmsg: Add compatible string
 for i.MX93
Message-ID: <168936900247.250605.6973924196553077259.robh@kernel.org>
References: <20230714092913.1591195-1-chancel.liu@nxp.com>
 <20230714092913.1591195-2-chancel.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230714092913.1591195-2-chancel.liu@nxp.com>
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
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, alsa-devel@alsa-project.org, Xiubo.Lee@gmail.com, shengjiu.wang@gmail.com, broonie@kernel.org, linuxppc-dev@lists.ozlabs.org, lgirdwood@gmail.com, linux-kernel@vger.kernel.org, nicoleotsuka@gmail.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, tiwai@suse.com, perex@perex.cz, festevam@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On Fri, 14 Jul 2023 17:29:12 +0800, Chancel Liu wrote:
> Add compatible string for i.MX93 platform which supports audio
> function through rpmsg channel between Cortex-A and Cortex-M core.
> 
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
> ---
>  Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

