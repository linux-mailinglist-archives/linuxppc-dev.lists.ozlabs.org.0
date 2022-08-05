Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B4AF758A62A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Aug 2022 08:54:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lzbt44V2rz3bqn
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Aug 2022 16:54:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=fcizwj7U;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::12b; helo=mail-lf1-x12b.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=fcizwj7U;
	dkim-atps=neutral
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LzbsS2dtwz2xH4
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Aug 2022 16:53:29 +1000 (AEST)
Received: by mail-lf1-x12b.google.com with SMTP id x39so2159649lfu.7
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 Aug 2022 23:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=svGbdJtoA42vxhMw0xl6uJ/CKt4Zq7+usPD0U/PNy5Q=;
        b=fcizwj7UD0ZDd1mZ0oDmsurKWnpaQ6W8uIjVJaOD0QvmsghpTV2mhyjgilSZfV3gfp
         VKxKifhMNxIxkv84hkBVE/pSxJMeMj+KoWkFL2y+KDM6m2ZZWeC9sJYVxT6Eo7Xe5I1W
         iV/F1O2wQ9eUQTVwfppVzZa0FHW+OxPbQV5/ji8lTUwWD3fxaFyFZOx4kNeQCte4KSj8
         xKOGnH+sqff7E8e7Pb1UHtsuYRJl+IYJZbr6Ce0PeJiLzh1nHgmWeMbzZFyduUJFdbcX
         GB7zxiqDzQ0zakdY5rGcgEwK7b7VDGioVCMp2950fn0J5lmPnn7nh8gr6S99j3QHei4p
         vsYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=svGbdJtoA42vxhMw0xl6uJ/CKt4Zq7+usPD0U/PNy5Q=;
        b=NFOpufOcTkc7Ye8nt9jN0halDwOG+EU73oHT7aKKv3sHmWWW387U1uZ4QHQkpgDhsk
         k99HA1lsEYtXzGDHMBF3oaMqs4FS2XBB9poKPdNjsJSPq+0/hkHndLb4TIJttGhYHLF9
         /8qF6WUR/EXLe251rw872onxEa2y6aoM3cuxX0Shf11ExAFvoo+phWM7X8brUBXmh2Mr
         OiuULalWz8McX6QBkxStlm2RXTBcT5s4GyHsNf6KXeRAHlxSNBzLHfyYQwx8F9aa+9UO
         GfwRbOZU6KJrZMnwDZjYPCqsCNIHCABpSYD+5S6xSwyfhCrUihL8fUkKzgAOcB62oXim
         mLJg==
X-Gm-Message-State: ACgBeo1nZjV2+bTogSH2YBzqa7nZEmNlNKPPiiDvIe4bIjuFQ7OP7tQH
	yBVfMjgPUdDrjWiaT1blV1lfXQ==
X-Google-Smtp-Source: AA6agR5PP/ENG7yXEHTvyafw/XQB2vIAh7cCSieTd83vPiy91LJfZPa5YrNOmaUMVOVwlr0V6qymXg==
X-Received: by 2002:a05:6512:230b:b0:48a:7c11:664d with SMTP id o11-20020a056512230b00b0048a7c11664dmr2034885lfu.390.1659682405752;
        Thu, 04 Aug 2022 23:53:25 -0700 (PDT)
Received: from [192.168.1.6] ([77.222.167.48])
        by smtp.gmail.com with ESMTPSA id z16-20020a2e9650000000b0025dd6c8933csm362348ljh.114.2022.08.04.23.53.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Aug 2022 23:53:23 -0700 (PDT)
Message-ID: <bee3d724-1efb-d5c7-6698-c98a198e69fd@linaro.org>
Date: Fri, 5 Aug 2022 08:53:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v4 3/8] dt-bindings: clock: Add ids for Lynx 10g PLLs
Content-Language: en-US
To: Sean Anderson <sean.anderson@seco.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@ti.com>, linux-phy@lists.infradead.org
References: <20220804220602.477589-1-sean.anderson@seco.com>
 <20220804220602.477589-4-sean.anderson@seco.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220804220602.477589-4-sean.anderson@seco.com>
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
Cc: devicetree@vger.kernel.org, Madalin Bucur <madalin.bucur@nxp.com>, Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Ioana Ciornei <ioana.ciornei@nxp.com>, linuxppc-dev@lists.ozlabs.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 05/08/2022 00:05, Sean Anderson wrote:
> This adds ids for the Lynx 10g SerDes's internal PLLs. These may be used
> witn assigned-clock* to specify a particular frequency to use.
> 
> Signed-off-by: Sean Anderson <sean.anderson@seco.com>
> ---
> 
> Changes in v4:
> - New
> 
>  include/dt-bindings/clock/fsl,lynx-10g.h | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>  create mode 100644 include/dt-bindings/clock/fsl,lynx-10g.h
> 
> diff --git a/include/dt-bindings/clock/fsl,lynx-10g.h b/include/dt-bindings/clock/fsl,lynx-10g.h
> new file mode 100644
> index 000000000000..f5b955658106
> --- /dev/null
> +++ b/include/dt-bindings/clock/fsl,lynx-10g.h
> @@ -0,0 +1,14 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */

This should be dual license.

> +/*
> + * Copyright (C) 2022 Sean Anderson <sean.anderson@seco.com>

It's confusing to see personal copyrights with company email. Either the
copyright is attributed to your employer or to you. If to you, use
private email.

> + */
> +
> +#ifndef __DT_BINDINGS_CLK_LYNX_10G_H
> +#define __DT_BINDINGS_CLK_LYNX_10G_H
> +
> +#define LYNX10G_CLKS_PER_PLL 2
> +
> +#define LYNX10G_PLLa(a)		((a) * LYNX10G_CLKS_PER_PLL)
> +#define LYNX10G_PLLa_EX_DLY(a)	((a) * LYNX10G_CLKS_PER_PLL + 1)

These do not look like proper IDs for clocks for bindings. Numbering
starts from 0 or 1 and any "a" needs to be clearly explained. What do
you bind here?

> +
> +#endif /* __DT_BINDINGS_CLK_LYNX_10G_H */


Best regards,
Krzysztof
