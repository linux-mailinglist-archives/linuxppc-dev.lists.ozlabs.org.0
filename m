Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2AE03C940C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jul 2021 00:52:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GQCS04wFwz30B9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jul 2021 08:52:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.166.169;
 helo=mail-il1-f169.google.com; envelope-from=robherring2@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com
 [209.85.166.169])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GQCRc1q0Xz2yNs
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jul 2021 08:51:39 +1000 (AEST)
Received: by mail-il1-f169.google.com with SMTP id e2so3215788ilu.5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jul 2021 15:51:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=0JF+oI0cxnhcWNAgVCD4GCZHjj0Z7CzhW9QR4n4PKp4=;
 b=YRK10L1e8RKMnQyxycjM2OiMvX/7sKxRu1R/vY+5WKFBfsTaaiUy4IITbyvlu2q103
 RcQce5Yg+3TRn7OWwr+IIx2dn3URh4YsYiUAUjUxK+dXYB6IirodhsfZR7iZSoINZOvB
 lJNDrwGxXA8GmBCuj+wEH/dwvONMddq8zgRnSLO3d3dNW4cmFQS4gyZAxfgjrFZicnNq
 ZoYHxze0CrkQXUHm4ba2TEn8/XQRimDJ81FQkOx90U2qzTpDaNhAqTXHJ6db3giJH6aA
 Dl43QLtZSAA5Uc6Vn/TfOtuhUqCt2HxaMqTIhEMfSZATehbD0rQf2VvTVGeFUwA+j63Z
 Hkog==
X-Gm-Message-State: AOAM530WMuA7P45DfsVQA+Th5QswdBEV3/7eVQMUUWDSyTqJujyAtGCQ
 XZ4o9KZUmN1G4sNJQm7UtQ==
X-Google-Smtp-Source: ABdhPJy16i6Syh/W3o9kw5cPeTZ6AuFUBJ10fqojPiP57hKSEqIFARvQyv94ug4/a/DoDG0+UzvECw==
X-Received: by 2002:a92:6902:: with SMTP id e2mr62609ilc.275.1626303096930;
 Wed, 14 Jul 2021 15:51:36 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id i3sm2034041ilr.56.2021.07.14.15.51.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 15:51:36 -0700 (PDT)
Received: (nullmailer pid 3685336 invoked by uid 1000);
 Wed, 14 Jul 2021 22:51:34 -0000
Date: Wed, 14 Jul 2021 16:51:34 -0600
From: Rob Herring <robh@kernel.org>
To: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
Subject: Re: [PATCH v3 2/5] dt-bindings: nintendo-otp: Document the Wii and
 Wii U OTP support
Message-ID: <20210714225134.GB3683016@robh.at.kernel.org>
References: <20210519095044.4109-1-linkmauve@linkmauve.fr>
 <20210701225743.14631-1-linkmauve@linkmauve.fr>
 <20210701225743.14631-3-linkmauve@linkmauve.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210701225743.14631-3-linkmauve@linkmauve.fr>
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
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Ash Logan <ash@heyquark.com>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org,
 Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.ne@posteo.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jul 02, 2021 at 12:57:40AM +0200, Emmanuel Gil Peyrot wrote:
> Both of these consoles use the exact same two registers, even at the
> same address, but the Wii U has eight banks of 128 bytes memory while
> the Wii only has one, hence the two compatible strings.
> 
> Signed-off-by: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
> ---
>  .../bindings/nvmem/nintendo-otp.yaml          | 44 +++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/nvmem/nintendo-otp.yaml
> 
> diff --git a/Documentation/devicetree/bindings/nvmem/nintendo-otp.yaml b/Documentation/devicetree/bindings/nvmem/nintendo-otp.yaml
> new file mode 100644
> index 000000000000..c39bd64b03b9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/nvmem/nintendo-otp.yaml
> @@ -0,0 +1,44 @@
> +# SPDX-License-Identifier: GPL-2.0

GPL-2.0-only OR BSD-2-Clause

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/nvmem/nintendo-otp.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Nintendo Wii and Wii U OTP Device Tree Bindings
> +
> +description: |
> +  This binding represents the OTP memory as found on a Nintendo Wii or Wii U,
> +  which contains common and per-console keys, signatures and related data
> +  required to access peripherals.
> +
> +  See https://wiiubrew.org/wiki/Hardware/OTP
> +
> +maintainers:
> +  - Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
> +
> +allOf:
> +  - $ref: "nvmem.yaml#"
> +
> +properties:
> +  compatible:
> +    enum:
> +      - nintendo,hollywood-otp
> +      - nintendo,latte-otp
> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    otp@d8001ec {
> +        compatible = "nintendo,latte-otp";
> +        reg = <0x0d8001ec 0x8>;
> +    };
> +
> +...
> -- 
> 2.32.0
> 
> 
