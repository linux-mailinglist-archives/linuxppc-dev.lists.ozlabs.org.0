Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F0F066DC61
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Jan 2023 12:29:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nx69g6j6Wz3cFw
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Jan 2023 22:29:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=GhTYI1bo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=GhTYI1bo;
	dkim-atps=neutral
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nx68j00Pvz3bgK
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Jan 2023 22:28:34 +1100 (AEDT)
Received: by mail-wm1-x32e.google.com with SMTP id k16so1332045wms.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Jan 2023 03:28:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b7QySS8sX+rCfEVcFiwHdK87drcPLIRv7jTR3Ef+m7U=;
        b=GhTYI1bo1NtfTix5Cyo757ae2aRDocMqQr9D60ev6QWvCm4a5eV+2io6PjGmnMDZEk
         PWZsbPnsy8EBab75YCi86Fg8/DokN6jhraGvl9gn642eLGsOJzpD9OSTBckznQHTHVtG
         DLG8HK+bKJX59+/4H2tkvP5oVERBJiyL7hxxEx8jl/VPHJWDDEBpMvCpg9jie7+nQ5CE
         HXknNfPRRNtdC4UKN4ZLpqNDImcg7KJluYQqOBTbRx70xc1I3hygkT2Wr/qiaYGfN7cd
         mx3qr37/gcsYFm91tcOCIs3MeR4/SEwlHsNAvoUHXgETjDMGrX2y8ToLIcV+i7WILo2g
         8FbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b7QySS8sX+rCfEVcFiwHdK87drcPLIRv7jTR3Ef+m7U=;
        b=e/FiNfc36IGCOPHdgE4/re0/SJSFNxpZgxGGpGYka2U5jo1jgptToGROjki0eb+jhn
         I7PvqeXBuS1cYzBGk5UbRUKus9sA2Oov1Wniue25JzEYXGapB1vSBMh+dPBOo/0yiXWB
         7yI75QCma996t5IgORPAnHl3CFha8ZRgVjr+psXXgen9DVL9i/UOFd1WkVNV0qNb1GFz
         wUUBOo25Z/JNPpUXM4upVhvPZhasxHiMuua0LW0n1o4k0M8jWUL/AP1bUaz8ASjfX94p
         i9m6Vk8ABD2fdnhbZ8BMMdVYGS8wKjy/GdFgo4y2JXGmzCS7l+Hgl2SVOS6IrfCgoLnv
         aZ+w==
X-Gm-Message-State: AFqh2kof7nfrWF+ygoVIc+8f+NQAmJCh/KEDK0TbUM8Fb72ipaWrdGDR
	aVia2cwke6gGoK7P75a5iH2Jkw==
X-Google-Smtp-Source: AMrXdXtLnHaHuaeFv5L3Vh+VPC3Xb4+iZJCGtmnWJmdoM/jdqpG02sq79R8ekQkcRR1GCybLYG6nQg==
X-Received: by 2002:a05:600c:228d:b0:3d1:ee97:980 with SMTP id 13-20020a05600c228d00b003d1ee970980mr2748366wmf.7.1673954907271;
        Tue, 17 Jan 2023 03:28:27 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id c6-20020adffb06000000b002423620d356sm8398144wrr.35.2023.01.17.03.28.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jan 2023 03:28:26 -0800 (PST)
Message-ID: <6e1a2182-ffbf-5684-dd2f-e3b862ad6763@linaro.org>
Date: Tue, 17 Jan 2023 12:28:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 01/10] dt-bindings: soc: fsl: cpm_qe: Add TSA
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
References: <20230113103759.327698-1-herve.codina@bootlin.com>
 <20230113103759.327698-2-herve.codina@bootlin.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230113103759.327698-2-herve.codina@bootlin.com>
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

On 13/01/2023 11:37, Herve Codina wrote:
> Add support for the time slot assigner (TSA)
> available in some PowerQUICC SoC such as MPC885
> or MPC866.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  .../bindings/soc/fsl/cpm_qe/fsl,tsa.yaml      | 260 ++++++++++++++++++
>  include/dt-bindings/soc/fsl,tsa.h             |  13 +
>  2 files changed, 273 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,tsa.yaml
>  create mode 100644 include/dt-bindings/soc/fsl,tsa.h
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

