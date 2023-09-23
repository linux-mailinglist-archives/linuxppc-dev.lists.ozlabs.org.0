Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07CC47AC415
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Sep 2023 19:40:52 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=nKnRmvjH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RtGdF5ylqz3cbp
	for <lists+linuxppc-dev@lfdr.de>; Sun, 24 Sep 2023 03:40:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=nKnRmvjH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RtGcM5SkBz2yVg
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 24 Sep 2023 03:40:01 +1000 (AEST)
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-31dcf18f9e2so3790521f8f.0
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Sep 2023 10:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695490793; x=1696095593; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aZ65IqURCbrJh1H5SuytbArtgpPFyuR+P9xbkBzeh10=;
        b=nKnRmvjHypBvDdhT1fsiT5j4nS9ThcSI3k8fGktivadHHM0g1/jtz8+YcAbJK6N35k
         E/eA21Ln8/hpxAMuKsj8uEEsQA/eZxNem1KaD3NHhrjLkiK9CA6Vmc3+2fC1Mj3kE1YI
         Xfw7E3QvY44IO8zTmr5n6SucazWlGRz163muet6iN+ubiJx60YI7SGhSAnVQYezhF2oA
         hESg+btRzmj8Nijk2ge/eR6N4xPXDzJhfyUkuSoi7+g++cmi9qk3ud7BwKB6T9dDzI0d
         +6/fO2g41OFAjZlcDxkKca8rjGNSXk7PwDCSwFmPEZOV7m323Dhhsz7s+ue66XKQ4ssQ
         P6iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695490793; x=1696095593;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aZ65IqURCbrJh1H5SuytbArtgpPFyuR+P9xbkBzeh10=;
        b=ViKnXz1Rh/Ujh8lGx7j8HfPM6AHTPfs9mXqyumH9T6duNOxpA0P4CfsM7vLAg7Q+rR
         MJVoV3bPUqo+Gc4G+5pQvb1Y11f/+OIqN3puo3aabwmxOn3Vz7wXT4TEV0SsYAiZlSpY
         W6QSpqRhnkNvjGe1eFq9zjaO+RgOarq67dBs2zGNtbAc4QzxryhFvdzhG9tYlV12YjI6
         6OBhfzSiL4/2XKU6WyJPDQxVgyhqlfYAdlNNyEWa02gszI56ZsIF3O4ANy3+SrnBg1ou
         3gul634MhgEbGvZ//aWKe20plXKEaCtR+a7VH4jJNFOQg5Fmam9WRqOGhrR3uwL1gW8D
         weYw==
X-Gm-Message-State: AOJu0Yw1tskPcQjHBkodHt2/kkvOt03vD8wfL5fMKLM6hvQOimkDKTpG
	M2L3qi7vebybMNmStrhTgUbDbw==
X-Google-Smtp-Source: AGHT+IEEd3282Di2q0YcAJqtYDFuU8V+zYApnExmD7VbqyW5M1Qk14z70LmY7eS/A/fQK8DyM9Oszw==
X-Received: by 2002:adf:ef11:0:b0:321:4ab6:9b28 with SMTP id e17-20020adfef11000000b003214ab69b28mr2382788wro.16.1695490793135;
        Sat, 23 Sep 2023 10:39:53 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.100])
        by smtp.gmail.com with ESMTPSA id h16-20020adffd50000000b0031ad5fb5a0fsm7449654wrs.58.2023.09.23.10.39.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 23 Sep 2023 10:39:52 -0700 (PDT)
Message-ID: <5efae150-3d92-81b8-5c25-68846d27132e@linaro.org>
Date: Sat, 23 Sep 2023 19:39:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v6 08/30] dt-bindings: soc: fsl: cpm_qe: cpm1-scc-qmc: Add
 support for QMC HDLC
Content-Language: en-US
To: Herve Codina <herve.codina@bootlin.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Andrew Lunn <andrew@lunn.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Qiang Zhao <qiang.zhao@nxp.com>,
 Li Yang <leoyang.li@nxp.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Shengjiu Wang <shengjiu.wang@gmail.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Randy Dunlap <rdunlap@infradead.org>
References: <20230922075913.422435-1-herve.codina@bootlin.com>
 <20230922075913.422435-9-herve.codina@bootlin.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230922075913.422435-9-herve.codina@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Simon Horman <horms@kernel.org>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 22/09/2023 09:58, Herve Codina wrote:
> The QMC (QUICC mutichannel controller) is a controller present in some
> PowerQUICC SoC such as MPC885.
> The QMC HDLC uses the QMC controller to transfer HDLC data.
> 
> Additionally, a framer can be connected to the QMC HDLC.
> If present, this framer is the interface between the TDM bus used by the
> QMC HDLC and the E1/T1 line.
> The QMC HDLC can use this framer to get information about the E1/T1 line
> and configure the E1/T1 line.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  .../soc/fsl/cpm_qe/fsl,cpm1-scc-qmc.yaml      | 24 +++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-scc-qmc.yaml b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-scc-qmc.yaml
> index 82d9beb48e00..61dfd5ef7407 100644
> --- a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-scc-qmc.yaml
> +++ b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-scc-qmc.yaml
> @@ -101,6 +101,27 @@ patternProperties:
>            Channel assigned Rx time-slots within the Rx time-slots routed by the
>            TSA to this cell.
>  
> +      compatible:
> +        const: fsl,qmc-hdlc

Why this is not a device/SoC specific compatible?

> +
> +      fsl,framer:
> +        $ref: /schemas/types.yaml#/definitions/phandle
> +        description:
> +          phandle to the framer node. The framer is in charge of an E1/T1 line
> +          interface connected to the TDM bus. It can be used to get the E1/T1 line
> +          status such as link up/down.
> +
> +    allOf:
> +      - if:
> +          properties:
> +            compatible:
> +              not:
> +                contains:
> +                  const: fsl,qmc-hdlc
> +        then:
> +          properties:
> +            fsl,framer: false
> +
>      required:
>        - reg
>        - fsl,tx-ts-mask
> @@ -159,5 +180,8 @@ examples:
>              fsl,operational-mode = "hdlc";
>              fsl,tx-ts-mask = <0x00000000 0x0000ff00>;
>              fsl,rx-ts-mask = <0x00000000 0x0000ff00>;
> +
> +            compatible = "fsl,qmc-hdlc";

compatible is always the first property.

> +            fsl,framer = <&framer>;
>          };
>      };

Best regards,
Krzysztof

