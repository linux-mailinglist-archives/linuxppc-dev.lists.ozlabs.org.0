Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DED662AC821
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Nov 2020 23:14:29 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CVQJf2l0NzDqdj
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Nov 2020 09:14:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.65; helo=mail-ot1-f65.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CVQFD1JwgzDqdj
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Nov 2020 09:11:27 +1100 (AEDT)
Received: by mail-ot1-f65.google.com with SMTP id 30so4800418otx.9
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Nov 2020 14:11:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=w99VRsHxGGVhkKnYr9GxplJ6+hwzD9gZqjB/fyCbsQA=;
 b=WZV3xHmxUVDMXwruL3H+R3GiJOx+HvMH8YuqbLA7H2Mo/zJDFyYNXU6XQTrNvlg7dH
 sIj12ml1NBU6g32Wg7ZBInz82jMYDA02xT+/bWoCQMj2WL2EQQoTijnq/wqiPr6LWkbG
 R48SIu7aEPOYR5Rj5xPcl6OdbNVQSKPmYedSqccfQJZGGTBXPuLLqQVZh2spkcQYcmY6
 EV9l3krz8vJ4ZVVn5g4nbbIQuPcrhfHOpk/P+WJ0ar0qJx2x0m3g0+3FRX9XMtjOOmDI
 Cadm21X6TDSmKe6hKGmlqhlWCMKt9Mo5In/7nyzcX2LdXLwmxRfOUMLDtsTQjvgTHKP8
 rHvg==
X-Gm-Message-State: AOAM532NarHniggGfxDxWSexObheCxlqlkzF2PqCON0TIUgBwKJZEqTA
 VklViK51GYf3fhI5jgo/Yw==
X-Google-Smtp-Source: ABdhPJyOksCeOBm7Kr71g34UbyQfWqqLB5Tuz20BPaZCFCHazu4Vl2Z1fmfv9TZy1F4NE4IFf2jMVA==
X-Received: by 2002:a9d:6416:: with SMTP id h22mr1316544otl.241.1604959884908; 
 Mon, 09 Nov 2020 14:11:24 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id z77sm2676516ooa.37.2020.11.09.14.11.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 14:11:24 -0800 (PST)
Received: (nullmailer pid 1846745 invoked by uid 1000);
 Mon, 09 Nov 2020 22:11:23 -0000
Date: Mon, 9 Nov 2020 16:11:23 -0600
From: Rob Herring <robh@kernel.org>
To: Laurentiu Tudor <laurentiu.tudor@nxp.com>
Subject: Re: [PATCH v2 2/2] dt-bindings: misc: convert fsl, qoriq-mc from txt
 to YAML
Message-ID: <20201109221123.GA1846668@bogus>
References: <20201109104635.21116-1-laurentiu.tudor@nxp.com>
 <20201109104635.21116-2-laurentiu.tudor@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201109104635.21116-2-laurentiu.tudor@nxp.com>
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
Cc: devicetree@vger.kernel.org, corbet@lwn.net, netdev@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, leoyang.li@nxp.com,
 robh+dt@kernel.org, ioana.ciornei@nxp.com,
 Ionut-robert Aron <ionut-robert.aron@nxp.com>, kuba@kernel.org,
 linuxppc-dev@lists.ozlabs.org, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 09 Nov 2020 12:46:35 +0200, Laurentiu Tudor wrote:
> From: Ionut-robert Aron <ionut-robert.aron@nxp.com>
> 
> Convert fsl,qoriq-mc to YAML in order to automate the verification
> process of dts files. In addition, update MAINTAINERS accordingly
> and, while at it, add some missing files.
> 
> Signed-off-by: Ionut-robert Aron <ionut-robert.aron@nxp.com>
> [laurentiu.tudor@nxp.com: update MINTAINERS, updates & fixes in schema]
> Signed-off-by: Laurentiu Tudor <laurentiu.tudor@nxp.com>
> ---
> Changes in v2:
>  - fixed errors reported by yamllint
>  - dropped multiple unnecessary quotes
>  - used schema instead of text in description
>  - added constraints on dpmac reg property
> 
>  .../devicetree/bindings/misc/fsl,qoriq-mc.txt | 196 ----------------
>  .../bindings/misc/fsl,qoriq-mc.yaml           | 210 ++++++++++++++++++
>  .../ethernet/freescale/dpaa2/overview.rst     |   5 +-
>  MAINTAINERS                                   |   4 +-
>  4 files changed, 217 insertions(+), 198 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
>  create mode 100644 Documentation/devicetree/bindings/misc/fsl,qoriq-mc.yaml
> 

Applied, thanks!
