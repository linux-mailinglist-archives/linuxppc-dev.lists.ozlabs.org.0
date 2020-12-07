Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A9A72D16CD
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Dec 2020 17:53:56 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CqTsr538gzDqb5
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Dec 2020 03:53:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.195;
 helo=mail-oi1-f195.google.com; envelope-from=robherring2@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CqTnh3yFHzDqVV
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Dec 2020 03:50:16 +1100 (AEDT)
Received: by mail-oi1-f195.google.com with SMTP id v85so5511286oia.6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Dec 2020 08:50:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=sVqHnk5+Qd48rsQgEdxe7AzLNS+jRVeavbI0MHrpgH8=;
 b=Mkv4zgGQZEXQgdAOkMiAMBPz5GKBKRJ+Cic0t8Yt6BhvZxYoc5OfLoBnw2A2sMV/an
 YGQ0B8oHgGqcrevgA91dR0ObR3xFmW1kinR5pjbELLvPZ0Ta1hRmBcPluXDaPsrUFQSI
 KyO5twkqBARMxxszA5VfckIJV6SqTKJEXDuBHqGDIhH/EAdkVpYmDDfRvLidNCwcxvsD
 hL9yuQ+hsYGUfMRENZBYK7NKYkHAVXF+czMDaAQCuorS065+4YUnYWH576Rc7anzT6/g
 +XfgPGbhD5NnOTOWe16lUHUSGJ7409olTr67v55LI8rJAW7NAseHzGLaCoTfvV+WIVEZ
 ryAw==
X-Gm-Message-State: AOAM533ZuoqAgKbIR7u1GsXOYlPK00J/Y/hjqopOYlXU4ySUctF/CMMV
 +OjJ2xMaVAUWYuRcD+77tw==
X-Google-Smtp-Source: ABdhPJyi1wFJCXTTwPWZTDNSZYVtXEjaTrMTXAL1g/vcuUtmd8ZXTbe7OhMA8bMQ/ovZiNG8xiPfvg==
X-Received: by 2002:aca:ccc1:: with SMTP id
 c184mr10424948oig.121.1607359813295; 
 Mon, 07 Dec 2020 08:50:13 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id j62sm2730022otc.49.2020.12.07.08.50.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 08:50:12 -0800 (PST)
Received: (nullmailer pid 421441 invoked by uid 1000);
 Mon, 07 Dec 2020 16:50:10 -0000
Date: Mon, 7 Dec 2020 10:50:10 -0600
From: Rob Herring <robh@kernel.org>
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Subject: Re: [PATCH v5 01/19] dt-bindings: usb: usb-hcd: Detach generic USB
 controller properties
Message-ID: <20201207165010.GB420349@robh.at.kernel.org>
References: <20201205152427.29537-1-Sergey.Semin@baikalelectronics.ru>
 <20201205152427.29537-2-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201205152427.29537-2-Sergey.Semin@baikalelectronics.ru>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, linux-mips@vger.kernel.org,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
 Kevin Hilman <khilman@baylibre.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>,
 Andy Gross <agross@kernel.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 linux-snps-arc@lists.infradead.org, devicetree@vger.kernel.org,
 Mathias Nyman <mathias.nyman@intel.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Rob Herring <robh+dt@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-arm-kernel@lists.infradead.org, Roger Quadros <rogerq@ti.com>,
 Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>, Manu Gautam <mgautam@codeaurora.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 05 Dec 2020 18:24:08 +0300, Serge Semin wrote:
> There can be three distinctive types of the USB controllers: USB hosts,
> USB peripherals/gadgets and USB OTG, which can switch from one role to
> another. In order to have that hierarchy handled in the DT binding files,
> we need to collect common properties in a common DT schema and specific
> properties in dedicated schemas. Seeing the usb-hcd.yaml DT schema is
> dedicated for the USB host controllers only, let's move some common
> properties from there into the usb.yaml schema. So the later would be
> available to evaluate all currently supported types of the USB
> controllers.
> 
> While at it add an explicit "additionalProperties: true" into the
> usb-hcd.yaml as setting the additionalProperties/unevaluateProperties
> properties is going to be get mandatory soon.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> 
> ---
> 
> Changelog v4:
> - This is a new patch created as a result of the comment left
>   by Chunfeng Yun in v3
> 
> Changelog v5:
> - Discard duplicated additionalProperties property definition.
> ---
>  .../devicetree/bindings/usb/usb-hcd.yaml      | 14 ++-------
>  .../devicetree/bindings/usb/usb.yaml          | 29 +++++++++++++++++++
>  2 files changed, 31 insertions(+), 12 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/usb/usb.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
schemas/usb/usb-hcd.yaml: ignoring, error in schema: 
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/usb-hcd.yaml: 'anyOf' conditional failed, one must be fixed:
	'properties' is a required property
	'patternProperties' is a required property
schemas/usb/usb-hcd.yaml: ignoring, error in schema: 
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/usb-hcd.yaml: ignoring, error in schema: 
warning: no schema found in file: ./Documentation/devicetree/bindings/usb/usb-hcd.yaml
schemas/usb/usb-hcd.yaml: ignoring, error in schema: 
dt-validate: recursion error: Check for prior errors in a referenced schema
schemas/usb/usb-hcd.yaml: ignoring, error in schema: 
dt-validate: recursion error: Check for prior errors in a referenced schema
schemas/usb/usb-hcd.yaml: ignoring, error in schema: 
dt-validate: recursion error: Check for prior errors in a referenced schema
schemas/usb/usb-hcd.yaml: ignoring, error in schema: 
dt-validate: recursion error: Check for prior errors in a referenced schema
schemas/usb/usb-hcd.yaml: ignoring, error in schema: 
dt-validate: recursion error: Check for prior errors in a referenced schema
dt-validate: recursion error: Check for prior errors in a referenced schema


See https://patchwork.ozlabs.org/patch/1411574

The base for the patch is generally the last rc1. Any dependencies
should be noted.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

