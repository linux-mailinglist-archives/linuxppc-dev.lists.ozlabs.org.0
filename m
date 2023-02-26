Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C4A6A334C
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Feb 2023 18:49:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PPrjN0vLpz3cdt
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Feb 2023 04:49:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.166.172; helo=mail-il1-f172.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PPrhs2jGtz30Ky
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Feb 2023 04:48:43 +1100 (AEDT)
Received: by mail-il1-f172.google.com with SMTP id i4so2804741ils.1
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Feb 2023 09:48:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tACdGgGFajYXgjnpQBRHCU3URa1Aa3HOSGApSi6BQP0=;
        b=qlev1kn6VCsELR4r92603S0Z7igfMZ+ZBd256vYSUq2d1wsbjQn2bQnpaswfTXyyVe
         wjCDcbgx46+DLuy4zhf/RzCkE5tpUll4y4d3hw1xtCzogx0kWgDzExDNo5E50b5QamW1
         cpLAgHpvaAdnU5a3s5J/plgk4If9KEQV2KzT2QO8mawczHB4s75RkSMBy3sHhzi4z1aE
         Xron5KGe2felgO/z28PgLYYvBnLnox0sIKl3i5Kkzg35YOkUmAxb97lz8DVSl5AJorqz
         nRgui6DxH7OlzG9qLe6yHRDqe0KdoYo9SLA/l4U2x2a8mr8SzU0qStyhxaTHqzcX+/35
         yY+Q==
X-Gm-Message-State: AO0yUKVXzh28q4UdUyr30Hkg86gs5j6Fdt5+ZH6yTVEOIeMPhyOFVygy
	Hm88hPSSKlwLHeCSh3TT6w==
X-Google-Smtp-Source: AK7set8Wd5SMOa9NAntTVq35NywdsrvS0Q2rvoUt9kZ/yG7JfyCQCXnbFwE/T/rvGtqqOhUIjqeNHg==
X-Received: by 2002:a05:6e02:1a8c:b0:316:e793:9dba with SMTP id k12-20020a056e021a8c00b00316e7939dbamr15338967ilv.26.1677433719096;
        Sun, 26 Feb 2023 09:48:39 -0800 (PST)
Received: from robh_at_kernel.org ([2605:ef80:8069:8ddf:ff6b:c94c:94fd:4442])
        by smtp.gmail.com with ESMTPSA id z19-20020a056638001300b003a9595b7e3asm1479085jao.46.2023.02.26.09.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Feb 2023 09:48:38 -0800 (PST)
Received: (nullmailer pid 84297 invoked by uid 1000);
	Sun, 26 Feb 2023 17:48:33 -0000
Date: Sun, 26 Feb 2023 11:48:33 -0600
From: Rob Herring <robh@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v6 01/10] dt-bindings: soc: fsl: cpm_qe: Add TSA
 controller
Message-ID: <20230226174833.GA76710-robh@kernel.org>
References: <20230217145645.1768659-1-herve.codina@bootlin.com>
 <20230217145645.1768659-2-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230217145645.1768659-2-herve.codina@bootlin.com>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Li Yang <leoyang.li@nxp.com>, Nicolin Chen <nicoleotsuka@gmail.com>, linuxppc-dev@lists.ozlabs.org, Mark Brown <broonie@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jaroslav Kysela <perex@perex.cz>, Shengjiu Wang <shengjiu.wang@gmail.com>, linux-arm-kernel@lists.infradead.org, Qiang Zhao <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Feb 17, 2023 at 03:56:36PM +0100, Herve Codina wrote:
> Add support for the time slot assigner (TSA)
> available in some PowerQUICC SoC such as MPC885
> or MPC866.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  .../bindings/soc/fsl/cpm_qe/fsl,cpm1-tsa.yaml | 215 ++++++++++++++++++
>  include/dt-bindings/soc/cpm1-fsl,tsa.h        |  13 ++
>  2 files changed, 228 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-tsa.yaml
>  create mode 100644 include/dt-bindings/soc/cpm1-fsl,tsa.h
> 
> diff --git a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-tsa.yaml b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-tsa.yaml
> new file mode 100644
> index 000000000000..332e902bcc21
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-tsa.yaml
> @@ -0,0 +1,215 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,cpm1-tsa.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: PowerQUICC CPM Time-slot assigner (TSA) controller
> +
> +maintainers:
> +  - Herve Codina <herve.codina@bootlin.com>
> +
> +description:
> +  The TSA is the time-slot assigner that can be found on some PowerQUICC SoC.
> +  Its purpose is to route some TDM time-slots to other internal serial
> +  controllers.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - fsl,mpc885-tsa
> +          - fsl,mpc866-tsa
> +      - const: fsl,cpm1-tsa
> +
> +  reg:
> +    items:
> +      - description: SI (Serial Interface) register base
> +      - description: SI RAM base
> +
> +  reg-names:
> +    items:
> +      - const: si_regs
> +      - const: si_ram
> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
> +  '#fsl,serial-cells':

#foo-cells is for when there are differing foo providers which need 
different number of cells. That's not the case here.

> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    const: 1
> +    description:
> +      TSA consumers that use a phandle to TSA need to pass the serial identifier
> +      with this phandle (defined in dt-bindings/soc/fsl,tsa.h).
> +      For instance "fsl,tsa-serial = <&tsa FSL_CPM_TSA_SCC4>;".
