Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EA1D64F1C01
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Apr 2022 23:26:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KXP3X67nqz3bgV
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Apr 2022 07:26:32 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KXP331hqwz2xWg
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Apr 2022 07:26:05 +1000 (AEST)
Received: by mail-oi1-f181.google.com with SMTP id e4so11423762oif.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Apr 2022 14:26:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jAP1OWdT/qDUoPVv9G7nl7G1PXDxStBen+UYZx6kZGo=;
 b=WMwoI6U2pGUH+aFXt31DGT8dbCoMV0lOh7l4hE7bRkLPu+z+l3pGR3ao9WpuxUiHpG
 01UQMfpt1LHZ5KNNXwH7+q5NnYSwQxcK2igmkrEeeL2jVG+XEj1AuSSwIPnJc5h99P2N
 XNu5NP1MGw3AMl7Hpce3FA3mIlyKGvMfKu7uma6o5Y17sqgH0JMqM8S7qF9GvOscjBMX
 n1HVTFIBs+d/aOmLsGhTfYopLDuqSTR6mH7qs9DkrH/1FlGfYOZlM0LQ8V9En2W/b6ue
 miTHpTTggxd3iJqRBF7kuEukatMB1iNDYGVlsiXkEszs5tZLppOa2bnrAJG4CHkdkgUY
 vBgQ==
X-Gm-Message-State: AOAM530fTAgbcA0u7X0LKuKDmCUYItvTsQAIwry9P4UYklU5kbm6sDab
 JpjnXGbxz7y95xPGDYCEsP1+EaP/ug==
X-Google-Smtp-Source: ABdhPJxW2wscvKlm8gcJbXbRc0IWjFTIyDNUVIdjjAxIIjjxENxn2/s77BAwtbGe6+K90UrYW/lvlw==
X-Received: by 2002:a05:6808:1a9b:b0:2ec:9c38:185 with SMTP id
 bm27-20020a0568081a9b00b002ec9c380185mr105502oib.165.1649107562121; 
 Mon, 04 Apr 2022 14:26:02 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 n66-20020acabd45000000b002ef6c6992e8sm4569111oif.42.2022.04.04.14.26.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Apr 2022 14:26:01 -0700 (PDT)
Received: (nullmailer pid 2010240 invoked by uid 1000);
 Mon, 04 Apr 2022 21:26:00 -0000
Date: Mon, 4 Apr 2022 16:26:00 -0500
From: Rob Herring <robh@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/85xx: Remove FSL_85XX_CACHE_SRAM
Message-ID: <YktiaO4n62O7BqXZ@robh.at.kernel.org>
References: <9949813a6b758903b7bee910f798ba2ca82ff8ee.1648720908.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9949813a6b758903b7bee910f798ba2ca82ff8ee.1648720908.git.christophe.leroy@csgroup.eu>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Scott Wood <oss@buserror.net>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 31 Mar 2022 12:03:06 +0200, Christophe Leroy wrote:
> CONFIG_FSL_85XX_CACHE_SRAM is an option that is not
> user selectable and which is not selected by any driver
> nor any defconfig.
> 
> Remove it and all associated code.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  .../bindings/powerpc/fsl/cache_sram.txt       |  20 --
>  .../powerpc/include/asm/fsl_85xx_cache_sram.h |  35 ---
>  arch/powerpc/platforms/85xx/Kconfig           |   9 -
>  arch/powerpc/sysdev/Makefile                  |   1 -
>  arch/powerpc/sysdev/fsl_85xx_cache_ctlr.h     |  88 -------
>  arch/powerpc/sysdev/fsl_85xx_cache_sram.c     | 147 ------------
>  arch/powerpc/sysdev/fsl_85xx_l2ctlr.c         | 216 ------------------
>  7 files changed, 516 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/powerpc/fsl/cache_sram.txt
>  delete mode 100644 arch/powerpc/include/asm/fsl_85xx_cache_sram.h
>  delete mode 100644 arch/powerpc/sysdev/fsl_85xx_cache_ctlr.h
>  delete mode 100644 arch/powerpc/sysdev/fsl_85xx_cache_sram.c
>  delete mode 100644 arch/powerpc/sysdev/fsl_85xx_l2ctlr.c
> 

Acked-by: Rob Herring <robh@kernel.org>
