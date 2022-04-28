Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DFD5512C69
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Apr 2022 09:11:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kpmxj2p7nz3bpj
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Apr 2022 17:11:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=xaa7sh6d;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::532;
 helo=mail-ed1-x532.google.com; envelope-from=krzysztof.kozlowski@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=xaa7sh6d; dkim-atps=neutral
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kpmx45T6vz2xKK
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Apr 2022 17:10:46 +1000 (AEST)
Received: by mail-ed1-x532.google.com with SMTP id e23so4423561eda.11
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Apr 2022 00:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=mfVDlT+SB+fUGtNozIrcoCBtFK15myE/xvi70Ns07Y0=;
 b=xaa7sh6dUpf/JxH5JjtFsQCnSBvLBGO59ZolFIGdMeRc1TeiA6r+f5f1yZ7Bnr2Nq/
 FjtSAulgYT8xeGzhF+fK240lXwT2M02KlfSJEwJvh/cUisAjPQ+0mVGoP5lC0LhGNTK3
 SC3u4sxieaHY5oA1CJLgbgCWSUr9B8s+Lrwu22OF+ShFdb2qQrOkPg3cGd0AD5DOW8ih
 lhr53NlIGKMPK1ebYPtovy2tJ0PfIDoGAekcR1cOLeZ8Vi6HyXb81JuBpMZEHE2uRKdZ
 EN1kUxq9ZSkxJIEkdpC816bw+O8L5srUyNB8pvvNmme61DuYZopGKaI1uBtZ6gHknl74
 uZkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mfVDlT+SB+fUGtNozIrcoCBtFK15myE/xvi70Ns07Y0=;
 b=GBTSwhaUCC/RfL8REO6VpyKFZx20sR60I9yL80aMN8m1Eze6Yc5mlN64y6vahbXP7L
 TsbkXvTrj3NRQnEwnFS2O6ueJnTxH+krFFjKOnxz9rj4a1MEAnCIoTPMSSS/YLoFl93M
 027jOnuXkrUmeaw40ucpgd3rNZ9vKU/j2ZACdzn0F85B7ThPsAXjDo7HLTuZ85LPvHM7
 VpNG5nx5pFKE+ZMh0ctlgJb/3hKcOhooZ2Efu+puIiPMf5Fcj5x1s+mmDqm55OyXgDIt
 CDNjj/KiDfiae4XxSZn1Ei2NOK/+BrkPviGa2QKCZQM6ivMAW4WSx9nAvVYvz6syenGx
 Qmcw==
X-Gm-Message-State: AOAM533DEyuin8u66qy3+c/mpK8B50BPPFkqkSol/ZfKv1JCKYaEJ3LU
 s8ZL+yKQiDmNMhlTyfKFOMb2rg==
X-Google-Smtp-Source: ABdhPJx/RN+yCmworyXkMteDeoWpMxQQIF8ARhEImfpJoyrf4ovluw4eYFLw46bzELds12rwdt2Gmg==
X-Received: by 2002:aa7:d543:0:b0:416:13eb:6fec with SMTP id
 u3-20020aa7d543000000b0041613eb6fecmr35208100edr.348.1651129843703; 
 Thu, 28 Apr 2022 00:10:43 -0700 (PDT)
Received: from [192.168.0.160] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 q9-20020a170906770900b006d20acf7e2bsm7890526ejm.200.2022.04.28.00.10.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Apr 2022 00:10:43 -0700 (PDT)
Message-ID: <57812ced-4132-51ae-98c2-62c6de809841@linaro.org>
Date: Thu, 28 Apr 2022 09:10:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3 3/4] dt-bindings: interrupt-controller: fsl, ls-extirq:
 convert to YAML
Content-Language: en-US
To: Michael Walle <michael@walle.cc>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220427075338.1156449-1-michael@walle.cc>
 <20220427075338.1156449-4-michael@walle.cc>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220427075338.1156449-4-michael@walle.cc>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Marc Zyngier <maz@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 Li Yang <leoyang.li@nxp.com>, Thomas Gleixner <tglx@linutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 27/04/2022 09:53, Michael Walle wrote:
> Convert the fsl,ls-extirq binding to the new YAML format.
> 
> In contrast to the original binding documentation, there are three
> compatibles which are used in their corresponding device trees which
> have a specific compatible and the (already documented) fallback
> compatible:
>  - "fsl,ls1046a-extirq", "fsl,ls1043a-extirq"
>  - "fsl,ls2080a-extirq", "fsl,ls1088a-extirq"
>  - "fsl,lx2160a-extirq", "fsl,ls1088a-extirq"
> 
> Depending on the number of the number of the external IRQs which is
> usually 12 except for the LS1021A where there are only 6, the
> interrupt-map-mask was reduced from 0xffffffff to 0xf and 0x7
> respectively and the number of interrupt-map entries have to
> match.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
> changes since v2:
>  - drop $ref to interrupt-controller.yaml
>  - use a more strict interrupt-map-mask and make it conditional on SoC
> 
> changes since v1:
>  - new patch
> 
>  .../interrupt-controller/fsl,ls-extirq.txt    |  53 --------
>  .../interrupt-controller/fsl,ls-extirq.yaml   | 118 ++++++++++++++++++
>  2 files changed, 118 insertions(+), 53 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/fsl,ls-extirq.txt
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/fsl,ls-extirq.yaml
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
