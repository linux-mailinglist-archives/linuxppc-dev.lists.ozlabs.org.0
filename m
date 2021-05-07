Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0300E376BEC
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 May 2021 23:50:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FcPHx6d1Jz303b
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 May 2021 07:50:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.45; helo=mail-ot1-f45.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com
 [209.85.210.45])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FcPHW3wv5z2yXs
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 May 2021 07:49:41 +1000 (AEST)
Received: by mail-ot1-f45.google.com with SMTP id
 36-20020a9d0ba70000b02902e0a0a8fe36so2842815oth.8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 07 May 2021 14:49:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=PjEtFCe5+lrFxZTe/Zi9n6poa77xUGPKZ2g66tXrfzo=;
 b=fjb5w9xXcd993g0FT5sKxh6bf8kf3FFb+hUstxx/z7nJ3tg8lJy0hiU4deYrY+nbPd
 grBzkuIr6ujlr+p2wdBHH/2XFtAofwfVDq2W4miIziE1oMPJQNlJNAALk1N6E2KZLQF8
 ULgKp1NdDN/3jnGsiR/cmBpuUtnqGscAs+z6NMpjcBW6CE27d5Z1Nqznd8E23aYygPqJ
 Dv6iN53JqxFEeHRf+PwIPw6uJ8cYbcGUXqJegl4W4JRzHKM2TEHz/zITuwGrDRcfdE+D
 46jrpD7CC1e+MjRnLGGV7vsPiQ6N5sTD+0apHl1gAYDpF1WohEs31pBIDT+pLxUjX9je
 a+sA==
X-Gm-Message-State: AOAM531snhICUo9VQtCji90AaCBjPniO7AN7wIr/7OYZaLvyEoBqGZCI
 9iDG+CVS8i1oPELRFTASEg==
X-Google-Smtp-Source: ABdhPJyQMXenAYcP+muUQjeAoJD82VnM0IixSPbaYREYvzrhdcxF/iI6pg2O2zAGiUqHjjdXcDhQXg==
X-Received: by 2002:a9d:4115:: with SMTP id o21mr10002087ote.52.1620424178375; 
 Fri, 07 May 2021 14:49:38 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id 65sm1423105otj.17.2021.05.07.14.49.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 May 2021 14:49:37 -0700 (PDT)
Received: (nullmailer pid 2952512 invoked by uid 1000);
 Fri, 07 May 2021 21:49:36 -0000
Date: Fri, 7 May 2021 16:49:36 -0500
From: Rob Herring <robh@kernel.org>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: Re: [PATCH v2 1/3] dt-bindings: i2c: mpc: Add
 fsl,i2c-erratum-a004447 flag
Message-ID: <20210507214936.GA2944698@robh.at.kernel.org>
References: <20210507004047.4454-1-chris.packham@alliedtelesis.co.nz>
 <20210507004047.4454-2-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210507004047.4454-2-chris.packham@alliedtelesis.co.nz>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, wsa@kernel.org,
 andy.shevchenko@gmail.com, linux-i2c@vger.kernel.org,
 andriy.shevchenko@linux.intel.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, May 07, 2021 at 12:40:45PM +1200, Chris Packham wrote:
> Document the fsl,i2c-erratum-a004447 flag which indicates the presence
> of an i2c erratum on some QorIQ SoCs.
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
>  Documentation/devicetree/bindings/i2c/i2c-mpc.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-mpc.yaml b/Documentation/devicetree/bindings/i2c/i2c-mpc.yaml
> index 7b553d559c83..98c6fcf7bf26 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-mpc.yaml
> +++ b/Documentation/devicetree/bindings/i2c/i2c-mpc.yaml
> @@ -46,6 +46,13 @@ properties:
>      description: |
>        I2C bus timeout in microseconds
>  
> +  fsl,i2c-erratum-a004447:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description: |
> +      Indicates the presence of QorIQ erratum A-004447, which
> +      says that the standard i2c recovery scheme mechanism does
> +      not work and an alternate implementation is needed.

The problem with adding a property for an errata is you have to update 
the dtb. If you use the compatible string, then only an OS update is 
needed. That assumes you have specific enough compatible strings.

Rob
