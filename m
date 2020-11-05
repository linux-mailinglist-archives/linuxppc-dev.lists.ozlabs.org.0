Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F1D72A86CC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Nov 2020 20:09:18 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CRtNp4N6TzDr7L
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Nov 2020 06:09:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.161.65; helo=mail-oo1-f65.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-oo1-f65.google.com (mail-oo1-f65.google.com
 [209.85.161.65])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CRtLN2qHkzDr7N
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Nov 2020 06:07:08 +1100 (AEDT)
Received: by mail-oo1-f65.google.com with SMTP id t142so224510oot.7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Nov 2020 11:07:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+0VACE33hmdxStTJYgtEs+NaMkhDM9Ld4u6K2Imaaw0=;
 b=XWva5Yl58PEwuKRE+fMR/55pO7VOlSZkr6fGrCrwlaHkYrPGtw0eBaWw2BeRn3hvW5
 MWA7QLJRTC9taCNwWx/g7AoNL1CycW3ngfjcYqQn/UgPHfAkf4xDRpkaPTEQxHi8gE1X
 l/sROE8XSMF9WvwaRE/+tR3NY16CKTUw0Ux5QUoI9TlHXnoQpcmA98sYxwbSxQwvRX5e
 BHmjCgBtD5a3VHtbqrcbnbvRU125OAcDrV1LhC/auqO/2jokWvEnaLGyugyAhRNyV8n+
 gEbjVyWfoGsQAhvnOOjPgK1cks8OJxyA8oP6QCsWv1u3grBwIylWsNreNIIBeLJRKv1v
 GGDg==
X-Gm-Message-State: AOAM532Q1Blcr2Mo1qLVJhE6SKU3r0p+XK4K5DCypx8jFsi53iMkq3gW
 0d6o1D7g0JAzFdfrl6jgrQ==
X-Google-Smtp-Source: ABdhPJxlv2YaJSGTq/PECyqzbDJue5E/f91YIMXbDcB3rZ47DKXPBTxCblP3bqGr6BC/66Y2Wtybzg==
X-Received: by 2002:a4a:d554:: with SMTP id q20mr2802975oos.23.1604603225517; 
 Thu, 05 Nov 2020 11:07:05 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id a23sm535613oot.33.2020.11.05.11.07.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 11:07:04 -0800 (PST)
Received: (nullmailer pid 1645085 invoked by uid 1000);
 Thu, 05 Nov 2020 19:07:04 -0000
Date: Thu, 5 Nov 2020 13:07:04 -0600
From: Rob Herring <robh@kernel.org>
To: Laurentiu Tudor <laurentiu.tudor@nxp.com>
Subject: Re: [PATCH 2/2] dt-bindings: misc: convert fsl,qoriq-mc from txt to
 YAML
Message-ID: <20201105190704.GA1644330@bogus>
References: <20201105141114.18161-1-laurentiu.tudor@nxp.com>
 <20201105141114.18161-2-laurentiu.tudor@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201105141114.18161-2-laurentiu.tudor@nxp.com>
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
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
 netdev@vger.kernel.org, corbet@lwn.net, linux-kernel@vger.kernel.org,
 leoyang.li@nxp.com, robh+dt@kernel.org, ioana.ciornei@nxp.com,
 Ionut-robert Aron <ionut-robert.aron@nxp.com>, kuba@kernel.org,
 linuxppc-dev@lists.ozlabs.org, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 05 Nov 2020 16:11:14 +0200, Laurentiu Tudor wrote:
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
>  .../devicetree/bindings/misc/fsl,qoriq-mc.txt | 196 ----------------
>  .../bindings/misc/fsl,qoriq-mc.yaml           | 218 ++++++++++++++++++
>  .../ethernet/freescale/dpaa2/overview.rst     |   5 +-
>  MAINTAINERS                                   |   4 +-
>  4 files changed, 225 insertions(+), 198 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
>  create mode 100644 Documentation/devicetree/bindings/misc/fsl,qoriq-mc.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/misc/fsl,qoriq-mc.yaml:128:9: [warning] wrong indentation: expected 10 but found 8 (indentation)

dtschema/dtc warnings/errors:


See https://patchwork.ozlabs.org/patch/1395017

The base for the patch is generally the last rc1. Any dependencies
should be noted.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

