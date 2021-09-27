Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CEF9419DC4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Sep 2021 20:01:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HJ9SC03sYz2yg2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Sep 2021 04:01:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.50; helo=mail-ot1-f50.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com
 [209.85.210.50])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HJ9Rk3h77z2xgJ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Sep 2021 04:01:05 +1000 (AEST)
Received: by mail-ot1-f50.google.com with SMTP id
 o59-20020a9d2241000000b0054745f28c69so23472785ota.13
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Sep 2021 11:01:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=bk6IEL1uZf2s3dmk9m5afP7AhxL2b1kO1A39LyNaXkM=;
 b=EJ44a4+wXyxOs7vP25tZrpaiMt99OLHjcrGcU4Yc01op7jqBZ8nw2WQlX6SfDhA+R1
 ATL0RU/4aeK4RiAn+zBcwv2fldpS2DJvpBxe6RK6ar9GGnHb4z2j+y4GYcg9fxIPxWGw
 Q7rUU9ZszkF7YEr9e0kienSmjEX+cU361l4Aqr5z4vT63Ln5cNPvjmNz/S3jO83+CfoK
 ipcuzgcrGnqSOH82Fb8V5X0sv+Yg2ifHMrcWP8naVkiw/XGWLRU7TdTKcepRnfq2ZO7/
 dGXuCKyVFu7y+htdTPqLMJ1ipGnqLK3WTlbZHvuljIeXpESSL9U/PQyg4YbIGm08k48P
 Lt2Q==
X-Gm-Message-State: AOAM532gGgTNVsYco5m3ghaHXPD4GiJ3kf8vP9oHfQEwx2piSntwlqSm
 zm6fn2fFc20tm39NPJEuHQ==
X-Google-Smtp-Source: ABdhPJy1u1047PO9kAE4IDPov+AHa+ZWbRS+2hfY06WstvUKSl+QP0r+E7Y8mYsUq1/d7F3I8OpOWw==
X-Received: by 2002:a05:6830:2f2:: with SMTP id
 r18mr1223863ote.228.1632765662725; 
 Mon, 27 Sep 2021 11:01:02 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id g23sm4108432otl.23.2021.09.27.11.01.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 11:01:02 -0700 (PDT)
Received: (nullmailer pid 3555843 invoked by uid 1000);
 Mon, 27 Sep 2021 18:01:01 -0000
Date: Mon, 27 Sep 2021 13:01:01 -0500
From: Rob Herring <robh@kernel.org>
To: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
Subject: Re: [PATCH 2/4] dt-bindings: nintendo-aes: Document the Wii and Wii
 U AES support
Message-ID: <YVIG3aOWt7jqtZIl@robh.at.kernel.org>
References: <20210921213930.10366-1-linkmauve@linkmauve.fr>
 <20210921213930.10366-3-linkmauve@linkmauve.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210921213930.10366-3-linkmauve@linkmauve.fr>
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
Cc: devicetree@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>,
 linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, Ash Logan <ash@heyquark.com>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>,
 Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.ne@posteo.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Sep 21, 2021 at 11:39:28PM +0200, Emmanuel Gil Peyrot wrote:
> Both of these consoles use the exact same AES engine, which only
> supports CBC mode with 128-bit keys.
> 
> Signed-off-by: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
> ---
>  .../bindings/crypto/nintendo-aes.yaml         | 34 +++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/crypto/nintendo-aes.yaml
> 
> diff --git a/Documentation/devicetree/bindings/crypto/nintendo-aes.yaml b/Documentation/devicetree/bindings/crypto/nintendo-aes.yaml
> new file mode 100644
> index 000000000000..e62a2bfc571c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/crypto/nintendo-aes.yaml
> @@ -0,0 +1,34 @@
> +# SPDX-License-Identifier: GPL-2.0

Dual license new bindings. checkpatch.pl will tell you this.

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/crypto/nintendo-aes.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Nintendo Wii and Wii U AES engine
> +
> +maintainers:
> +  - Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
> +
> +description: |+
> +  The AES engine in the Nintendo Wii and Wii U supports the following:
> +  -- Advanced Encryption Standard (AES) in CBC mode, with 128-bit keys
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: nintendo,hollywood-aes
> +      - const: nintendo,latte-aes
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    description: Not supported yet.
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +additionalProperties: false
> -- 
> 2.33.0
> 
> 
