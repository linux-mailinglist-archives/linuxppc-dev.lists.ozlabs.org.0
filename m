Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 59EA16D53BE
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Apr 2023 23:40:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pr4892Pcjz3f8D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Apr 2023 07:40:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.160.47; helo=mail-oa1-f47.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pr47c2Zkmz3brK
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Apr 2023 07:40:27 +1000 (AEST)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-17aaa51a911so32385924fac.5
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 03 Apr 2023 14:40:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680558024;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GjyuESymcsR2VMINdm5Bfho26ybLnXPxoDubHNZ3lbA=;
        b=abLw43v6hHTE1IC+9640hXRZSIZSq4tvHmoSgZ4vl4E/Fy20J0s+YXMVhGMKb2gZUl
         mKMW/UbfUSSziJzxzvplkIzKOWJv2XTVYYIher9XbBV65joZ3kAaEEbmtDxF32CUzd2B
         eYB4QwL4eLFUbG0kR+dkeA2HE5AwaA1i2HykK9b/a34Ld8E4DArkgtYPirAnwbfkLHpt
         biEOvxv3EDbZWOUiTQBmZObK8soMriqYgGEs7U1lbsAqKZYa/pyCxAkPB1xjNulqRpvH
         3t/xyiEgHyflph/eBlzBju0AJ2g8v0t7XCkPmjeKI1LBPuppUkv7vrkVf6wV0b1zoeBJ
         GCKA==
X-Gm-Message-State: AAQBX9exdLsbogi4We174u5bLX3R9cgkvfhXomdovxBB+zjRSY7sSSUR
	G1II0jabOjdPU5zQ0va8gQ==
X-Google-Smtp-Source: AKy350aFlhW6NPkDPCD/nqbhHu6uFB2MQkICizhIFFbEPL5jfztjWv/9j8uFDgl83EMtCrKL01hYiQ==
X-Received: by 2002:a05:6870:b38a:b0:177:c013:9dac with SMTP id w10-20020a056870b38a00b00177c0139dacmr366185oap.48.1680558024171;
        Mon, 03 Apr 2023 14:40:24 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id d11-20020a9d5e0b000000b006a3170fe3efsm2942956oti.27.2023.04.03.14.40.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Apr 2023 14:40:23 -0700 (PDT)
Received: (nullmailer pid 1920507 invoked by uid 1000);
	Mon, 03 Apr 2023 21:40:22 -0000
Date: Mon, 3 Apr 2023 16:40:22 -0500
From: Rob Herring <robh@kernel.org>
To: Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH v1] dt-bindings: move cache controller bindings to a
 cache directory
Message-ID: <168055794093.1918674.10704326537545829066.robh@kernel.org>
References: <20230330173255.109731-1-conor@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230330173255.109731-1-conor@kernel.org>
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
Cc: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Conor Dooley <conor.dooley@microchip.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-riscv@lists.infradead.org, Prakash Ranjan <saiprakash.ranjan@codeaurora.org>, Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Scott Wood <oss@buserror.net>, Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-arm-kernel@lists.infradead.org, Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>, Konrad Dybcio <konrad.dybcio@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>, Masami Hiramatsu <mhiramat@kernel.org>, Rishabh Bhatnagar <rishabhb@codeaurora.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On Thu, 30 Mar 2023 18:32:56 +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> There's a bunch of bindings for (mostly l2) cache controllers
> scattered to the four winds, move them to a common directory.
> I renamed the freescale l2cache.txt file, as while that might make sense
> when the parent dir is fsl, it's confusing after the move.
> The two Marvell bindings have had a "marvell," prefix added to match
> their compatibles.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../{memory-controllers => cache}/baikal,bt1-l2-ctl.yaml        | 2 +-
>  .../{powerpc/fsl/l2cache.txt => cache/freescale-l2cache.txt}    | 0
>  Documentation/devicetree/bindings/{arm => cache}/l2c2x0.yaml    | 2 +-
>  .../{arm/mrvl/feroceon.txt => cache/marvell,feroceon-cache.txt} | 0
>  .../{arm/mrvl/tauros2.txt => cache/marvell,tauros2-cache.txt}   | 0
>  .../devicetree/bindings/{arm/msm => cache}/qcom,llcc.yaml       | 2 +-
>  .../devicetree/bindings/{riscv => cache}/sifive,ccache0.yaml    | 2 +-
>  .../socionext => cache}/socionext,uniphier-system-cache.yaml    | 2 +-
>  MAINTAINERS                                                     | 2 ++
>  9 files changed, 7 insertions(+), 5 deletions(-)
>  rename Documentation/devicetree/bindings/{memory-controllers => cache}/baikal,bt1-l2-ctl.yaml (95%)
>  rename Documentation/devicetree/bindings/{powerpc/fsl/l2cache.txt => cache/freescale-l2cache.txt} (100%)
>  rename Documentation/devicetree/bindings/{arm => cache}/l2c2x0.yaml (99%)
>  rename Documentation/devicetree/bindings/{arm/mrvl/feroceon.txt => cache/marvell,feroceon-cache.txt} (100%)
>  rename Documentation/devicetree/bindings/{arm/mrvl/tauros2.txt => cache/marvell,tauros2-cache.txt} (100%)
>  rename Documentation/devicetree/bindings/{arm/msm => cache}/qcom,llcc.yaml (96%)
>  rename Documentation/devicetree/bindings/{riscv => cache}/sifive,ccache0.yaml (98%)
>  rename Documentation/devicetree/bindings/{arm/socionext => cache}/socionext,uniphier-system-cache.yaml (96%)
> 

Applied, thanks!

