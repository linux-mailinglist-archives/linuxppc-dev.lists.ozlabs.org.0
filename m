Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F5C661619
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 Jan 2023 16:17:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nqgfm6MRzz3c7v
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Jan 2023 02:17:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=tpTCz4ws;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=tpTCz4ws;
	dkim-atps=neutral
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nqgdq66MPz3c6H
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Jan 2023 02:16:30 +1100 (AEDT)
Received: by mail-wr1-x430.google.com with SMTP id bn26so5827990wrb.0
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 08 Jan 2023 07:16:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BXw9KAygztT5jDGimnXGtcc/RXt5y1LZ6kVLW6bynMM=;
        b=tpTCz4ws4jY+X1l3CQZUYaPGZa/EpzKs+yq2hYz6I47CqYW66cl+bAfI4BbsrWfmGs
         wtQgtBjyGmpB2lgMW0B1jgg3XLN9/ToR1pRqizZcEcj14V864ktX4fOpZODMiqs4QVlE
         89UDXaMWkCdVIeWxrbTMXsbvD5Hi55UcJXWyAUya0Ad5cGzzO9UkgL3JPCRYHinRUwoJ
         MuLaN18LU1Pm+aAZQDXbiTxX4s7eb9ALHtsSAS30swbfEvafY2NlTrmy/rpV5N+6dMDq
         pRGu/DUepZ8mhJShTxyIljbBeZfAscuPDkR3GYSyzWUEZdDqbobrRMhAg6jYvjyFBa/M
         98kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BXw9KAygztT5jDGimnXGtcc/RXt5y1LZ6kVLW6bynMM=;
        b=s2yT4r3dCBVDxEhQuQicV80INff+PcL5NwsZbI9v2/nQJ7Qg9Yw8YqMwRXdbGw50PL
         FuYL2wFxBhIHT2BpTOb5TqrQ8P8JhjWswZubKy7fZZSjiYy3iTs9U2HpExZPLw6cUcxo
         hKuD0khhuHBdP/mhuIbtmRxhpGm1ongvOKWPF8oUZNupEsXSGOu9f80D5OC8wdMfQO1E
         Dka8laVQKJMRJjRVTQosalCRo0hXopySl7Zq+je0IKYYMHosjX7sMT9/s6tA26zAsRSg
         M4Tgh9kz2us8+9TsE7ridP8+bdAXSHX9T9PyPLIQYFpa+WTfNavG3DvuGjvdhGVvmifz
         RaKQ==
X-Gm-Message-State: AFqh2kpaxa6vGp21BE0IE5xqD/+nbyNhizqMfogfmI9GwC/HaeuY66d1
	MyU/cxl7hkLi8nJzVHXQpl8WNg==
X-Google-Smtp-Source: AMrXdXviZdBmClnb6Toply9D3tNh+sz2JLSNoU9T04Iga71AMgdwS3TaY1guKipjbFqDnRnrIwrRUA==
X-Received: by 2002:a5d:5e81:0:b0:244:e704:df2c with SMTP id ck1-20020a5d5e81000000b00244e704df2cmr44150318wrb.57.1673190986931;
        Sun, 08 Jan 2023 07:16:26 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id w4-20020a5d4b44000000b002366dd0e030sm6261986wrs.68.2023.01.08.07.16.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Jan 2023 07:16:26 -0800 (PST)
Message-ID: <c393e532-d466-366b-a390-65de47c58b6a@linaro.org>
Date: Sun, 8 Jan 2023 16:16:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 08/10] dt-bindings: sound: Add support for QMC audio
Content-Language: en-US
To: Herve Codina <herve.codina@bootlin.com>, Li Yang <leoyang.li@nxp.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Qiang Zhao <qiang.zhao@nxp.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Shengjiu Wang <shengjiu.wang@gmail.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>
References: <20230106163746.439717-1-herve.codina@bootlin.com>
 <20230106163746.439717-9-herve.codina@bootlin.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230106163746.439717-9-herve.codina@bootlin.com>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 06/01/2023 17:37, Herve Codina wrote:
> The QMC (QUICC mutichannel controller) is a controller
> present in some PowerQUICC SoC such as MPC885.
> The QMC audio is an ASoC component that uses the QMC
> controller to transfer the audio data.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  .../bindings/sound/fsl,qmc-audio.yaml         | 110 ++++++++++++++++++
>  1 file changed, 110 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/fsl,qmc-audio.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/fsl,qmc-audio.yaml b/Documentation/devicetree/bindings/sound/fsl,qmc-audio.yaml
> new file mode 100644
> index 000000000000..b3774be36c19
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/fsl,qmc-audio.yaml
> @@ -0,0 +1,110 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/fsl,qmc-audio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: QMC audio
> +
> +maintainers:
> +  - Herve Codina <herve.codina@bootlin.com>
> +
> +description: |
> +  The QMC audio is an ASoC component which uses QMC (QUICC Multichannel
> +  Controller) channels to transfer the audio data.
> +  It provides as many DAI as the number of QMC channel used.
> +
> +properties:
> +  compatible:
> +    items:

Drop items.

> +      - const: fsl,qmc-audio
> +
> +  '#address-cells':
> +    const: 1
> +  '#size-cells':
> +    const: 0
> +  '#sound-dai-cells':
> +    const: 1
> +
> +patternProperties:
> +  "^dai@([0-9]|[1-5][0-9]|6[0-3])$":
> +    description:
> +      A DAI managed by this controller
> +    type: object
> +
> +    properties:
> +      reg:
> +        minimum: 0
> +        maximum: 63
> +        description:
> +          The DAI number
> +
> +      qmc-chan:

Missing vendor prefix.

> +        $ref: /schemas/types.yaml#/definitions/phandle-array

Why this is not a phandle?

> +        description: phandle to the QMC channel> +        maxItems: 1
> +
> +    required:
> +      - reg
> +      - qmc-chan
> +
> +required:
> +  - compatible
> +  - '#address-cells'
> +  - '#size-cells'
> +  - '#sound-dai-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    qmc_audio: qmc_audio {

Same problem as in previous patch.

> +        compatible = "fsl,qmc-audio";
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        #sound-dai-cells = <1>;
> +        dai@16 {
> +            reg = <16>;
> +            qmc-chan = <&scc_qmc 16>;
> +        };
> +        dai@17 {
> +            reg = <17>;
> +            qmc-chan = <&scc_qmc 17>;
> +        };
> +    };

Best regards,
Krzysztof

