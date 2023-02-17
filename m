Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B18869A80A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Feb 2023 10:23:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PJ5vj0shpz3f3P
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Feb 2023 20:23:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=XOl3+vff;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::536; helo=mail-ed1-x536.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=XOl3+vff;
	dkim-atps=neutral
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PJ5tk18KFz3bg1
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Feb 2023 20:22:19 +1100 (AEDT)
Received: by mail-ed1-x536.google.com with SMTP id j20so3393889edw.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Feb 2023 01:22:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7LQsmO8BJ1on7K8O2a2MHWuCjPwW4wmR8+WhYFU/VUQ=;
        b=XOl3+vffPd/tr8VTgKyaurW98MVfUTdskc41q1EjjW71xvLiIYgKWXQkNyYZ+Y67PO
         2iJKSuTzoFWi85dqTZWcoFn0iPYHhaViU5+nnOIyHbnUlJJ26fo+SI+v7BjsHRbQbg/a
         UnGkezss5oQXW41AQ/grewhxfhvc42oIKSt4Qw7jN/vNv4P4NkJLwaoHUeLB9DqHozpU
         3aT6jRcgK7PQlaHoI8ygzg6JKEv2dbOIqaKK0YdxRHa7xXdoT4nVTiObhyOytOGpQN31
         kaxoAXBqxOUV3hcCC+FOiXTK9AN8YxvsbF7hBkREnPd1mdzp1Zysm/v5zpiBVMHQEnzS
         JCFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7LQsmO8BJ1on7K8O2a2MHWuCjPwW4wmR8+WhYFU/VUQ=;
        b=gOjar85BEf1haaw5oxkOq3oc/g6G97fecKOdABQoapXc9xAK5zbFbcPDzdeGL+ZxN4
         vNkeT1hIX7DjAD7B7V8W8tUahqGEJ1RoXSZKJFrQ04qvlN+z2eSGeuUhBZRa4JcAQwZi
         kujZOiqRKQaU5NkAFLdmjG0QpJnlbOryjpLBpNrNoTFe4+/Lm/t4oCjgx2Bp8d9XLY29
         +q/TBcR02TD34UvaOU+4NkeJlCEi4N+4zAHhXJkfsJE8fvKP/AM2ddW2/ng2L81ezRQB
         uWPnZBFe9ZDtpL3Gs2pChACSS5X0CgsIx9B36eP5DSCdA4d+Y7iV6sRspu/GGwUrfIm5
         I2mA==
X-Gm-Message-State: AO0yUKXg6OiWucqWG3SuuwPopzzjKV4HK/ImLEMaU3Jqj+Fr2yu4C7MB
	iRxAaQT2zcyxOOI82PFLHgzJwQ==
X-Google-Smtp-Source: AK7set/pxhKkcmJ7uQ2CkOz1aneV7sr4U6gYAbzUn9nsEPVXQhfN1+InHaCiguvDh+QE9kvztTD+7Q==
X-Received: by 2002:a17:906:16d3:b0:8b1:23cf:13dc with SMTP id t19-20020a17090616d300b008b123cf13dcmr9984759ejd.16.1676625735479;
        Fri, 17 Feb 2023 01:22:15 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id oq15-20020a170906cc8f00b008b165948da6sm1742629ejb.101.2023.02.17.01.22.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Feb 2023 01:22:15 -0800 (PST)
Message-ID: <7535d488-37fc-1e67-6a14-b658beb000e3@linaro.org>
Date: Fri, 17 Feb 2023 10:22:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v5 05/10] dt-bindings: soc: fsl: cpm_qe: Add QMC
 controller
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
References: <20230216134226.1692107-1-herve.codina@bootlin.com>
 <20230216134226.1692107-6-herve.codina@bootlin.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230216134226.1692107-6-herve.codina@bootlin.com>
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

On 16/02/2023 14:42, Herve Codina wrote:
> Add support for the QMC (QUICC Multichannel Controller)
> available in some PowerQUICC SoC such as MPC885 or MPC866.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  .../soc/fsl/cpm_qe/fsl,cpm1-scc-qmc.yaml      | 172 ++++++++++++++++++
>  1 file changed, 172 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-scc-qmc.yaml
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

