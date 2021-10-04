Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0C94215EA
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Oct 2021 20:02:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HNT7W0PcRz3c52
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Oct 2021 05:01:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.41; helo=mail-ot1-f41.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com
 [209.85.210.41])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HNT726K1mz2xlC
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Oct 2021 05:01:34 +1100 (AEDT)
Received: by mail-ot1-f41.google.com with SMTP id
 5-20020a9d0685000000b0054706d7b8e5so22702251otx.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Oct 2021 11:01:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Pv86mBYYQI6ZTZjtJe5Lu8vOr6IQOHLnJWKdcQKjRzc=;
 b=Kk3A/3n4Kj9c9mep8vWL0yuMKGmzJPAcKYZfOBzCqtpGh8u7AqRgtsdBl0V5Dzajx9
 f7MwgyyuQRTPDUV8JxWBvBSxPMEwjyB06DfHhrAD6RHkchj/E2zxsgVJPkGVbs8MNe03
 MxoU3+hcMFpQ6l2pGDS7DTh0dP1rOJJolPLZGhVmzDGcxdlk1WEyekdwRinbDHukHoiH
 XI9otxKWo8TUnDBaPWSF7YkINMC6VBKHxIAXpxlZ4S09UXSlumsOU5mKXTsvtmSSHNa7
 0DV41uIR8rXZb4DtFpdrsnFoBXSmwphBsB5GH/Jje2NjvVEDQbBMVnksLoxHCNBLxvQ4
 Z3sQ==
X-Gm-Message-State: AOAM530rtpy8j2PiAAJ3ES/CTznGWAwaq/ujIzOK47/MBu8o/AFBU5wH
 UpDqJO5f+BZ3Rto2ernj2A==
X-Google-Smtp-Source: ABdhPJzhXWNovn9uWaeLJ8IddFdPPa+myX6TR4D87Hapmy4PG1jAlRPPCh0xx7swB3WDfIkmyGc9Rg==
X-Received: by 2002:a9d:7116:: with SMTP id n22mr10788066otj.56.1633370490645; 
 Mon, 04 Oct 2021 11:01:30 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id i12sm2820400oik.50.2021.10.04.11.01.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 11:01:30 -0700 (PDT)
Received: (nullmailer pid 1569210 invoked by uid 1000);
 Mon, 04 Oct 2021 18:01:29 -0000
Date: Mon, 4 Oct 2021 13:01:29 -0500
From: Rob Herring <robh@kernel.org>
To: Sven Peter <sven@svenpeter.dev>
Subject: Re: [PATCH 01/10] dt-bindings: i2c: Add Apple I2C controller bindings
Message-ID: <YVtBeZKqErioOMkD@robh.at.kernel.org>
References: <20210926095847.38261-1-sven@svenpeter.dev>
 <20210926095847.38261-2-sven@svenpeter.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210926095847.38261-2-sven@svenpeter.dev>
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
Cc: devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Hector Martin <marcan@marcan.st>, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Paul Mackerras <paulus@samba.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Olof Johansson <olof@lixom.net>,
 Mohamed Mediouni <mohamed.mediouni@caramail.com>,
 Stan Skowronek <stan@corellium.com>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, Mark Kettenis <mark.kettenis@xs4all.nl>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, 26 Sep 2021 11:58:38 +0200, Sven Peter wrote:
> The Apple I2C controller is based on the PASemi I2C controller.
> It is present on Apple SoCs such as the M1.
> 
> Signed-off-by: Sven Peter <sven@svenpeter.dev>
> ---
>  .../devicetree/bindings/i2c/apple,i2c.yaml    | 61 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 62 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/apple,i2c.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
