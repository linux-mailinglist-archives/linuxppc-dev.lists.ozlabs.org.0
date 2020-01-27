Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E7CB0149F38
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jan 2020 08:24:42 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 485h8P6fPdzDqMG
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jan 2020 18:24:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 485h6p17KvzDq7k
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jan 2020 18:23:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=ZkdUqd2z; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 485h6n56LQz8t5c
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jan 2020 18:23:13 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 485h6n3hzhz9sRR; Mon, 27 Jan 2020 18:23:13 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::a44;
 helo=mail-vk1-xa44.google.com; envelope-from=ulf.hansson@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=ZkdUqd2z; dkim-atps=neutral
Received: from mail-vk1-xa44.google.com (mail-vk1-xa44.google.com
 [IPv6:2607:f8b0:4864:20::a44])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 485h6n2mvcz9sR1
 for <linuxppc-dev@ozlabs.org>; Mon, 27 Jan 2020 18:23:10 +1100 (AEDT)
Received: by mail-vk1-xa44.google.com with SMTP id m195so1103217vkh.10
 for <linuxppc-dev@ozlabs.org>; Sun, 26 Jan 2020 23:23:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9Zs7ordlPu6oLMie0ztw+ViABr97RTMvxSHDoSvg2y8=;
 b=ZkdUqd2zKSeWdVR91y36SdzJKYZWn6y3ItuefmZXZQ65FE7TOnAneczRyXuYZ73Q09
 dxyrhyivxIhtQcR2Niso9FYPdVIMx7MpX3rk2ZMJ0xzAOkFCuRZxaewbU0pVz0EnbFTf
 RwBf8kQhz4qiuQMkW/EoW11SdohZV+sqIYsjjZXPVt4bwAZ+59aKtKpOT4x+mz3DATbJ
 l8XSQjy40AFGHpBJmIXEwQ54J73jRsoZi6Gy68//Pw8gcbJwFQ77p8u1E4EGmL7UpgvB
 JZ/1N0idA75Y+pP1l/5Pl9EJcLI54QRiC4BtLNNHuB7wI92mBOYSLhRXl9HWHp1fHViD
 6DQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9Zs7ordlPu6oLMie0ztw+ViABr97RTMvxSHDoSvg2y8=;
 b=NX6wfMkhLL3xhPC6zSGCu+ThRcJ9nHzhoygsT8X+BmpErOlC9b/XvIhJatZuLvfy2R
 cada6Um2i9n6AIjq3SIjbQvJ5xVAhuBAOdg/kZ8iJJCJxr1vLOQKXSkBfa+1F8DAS1e0
 4DVB4Xv8ftoGmjnQEP743633l7DfaabkY9r9Y2zO2JkwjvvOAbGdDPVnxG3t0eipaGf3
 TTAfzIZqPSzVUPYCNU1DRcQXdehoDLYQKg9u0uwielevviUdq0v40pV6Cd3mtZiky6Zp
 TAg9yERioODksUJBxFiGfwgQJ1pi5j0FGbzuYxtg4vNNIqgjpM8ygWi+QqnvHxZhlqAV
 DEAQ==
X-Gm-Message-State: APjAAAUdTyJTpzPK6sVhaDscrBSVSWFmxwb959ZTczX+tQyKI1ikLJLf
 W7VN6koavEekMQEi97BrnwF6YIMUlv/bNbZDVygr4Q==
X-Google-Smtp-Source: APXvYqz4OQZA/2kIUqEb6B2klRTdDoZkhD2PvmDkLDercb9w5oGLFffYnzmHjIgmSkCuBSvVCAvCAxfvm+k7OKQr2M8=
X-Received: by 2002:a1f:434b:: with SMTP id q72mr8497371vka.53.1580109787392; 
 Sun, 26 Jan 2020 23:23:07 -0800 (PST)
MIME-Version: 1.0
References: <20200126115247.13402-1-mpe@ellerman.id.au>
In-Reply-To: <20200126115247.13402-1-mpe@ellerman.id.au>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 27 Jan 2020 08:22:29 +0100
Message-ID: <CAPDyKFrbYmV6_nV6psVLq6VRKMXf0PXpemBbj48yjOr3P130BA@mail.gmail.com>
Subject: Re: [PATCH] of: Add OF_DMA_DEFAULT_COHERENT & select it on powerpc
To: Michael Ellerman <mpe@ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
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
Cc: DTML <devicetree@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linuxppc-dev@ozlabs.org, Rob Herring <robh+dt@kernel.org>,
 Christian Zigotzky <chzigotzky@xenosoft.de>, Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, 26 Jan 2020 at 12:53, Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> There's an OF helper called of_dma_is_coherent(), which checks if a
> device has a "dma-coherent" property to see if the device is coherent
> for DMA.
>
> But on some platforms devices are coherent by default, and on some
> platforms it's not possible to update existing device trees to add the
> "dma-coherent" property.
>
> So add a Kconfig symbol to allow arch code to tell
> of_dma_is_coherent() that devices are coherent by default, regardless
> of the presence of the property.
>
> Select that symbol on powerpc when NOT_COHERENT_CACHE is not set, ie.
> when the system has a coherent cache.
>
> Fixes: 92ea637edea3 ("of: introduce of_dma_is_coherent() helper")
> Cc: stable@vger.kernel.org # v3.16+
> Reported-by: Christian Zigotzky <chzigotzky@xenosoft.de>
> Tested-by: Christian Zigotzky <chzigotzky@xenosoft.de>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

Thanks Michael for helping out fixing and this! The patch looks good to me.

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe

> ---
>  arch/powerpc/Kconfig | 1 +
>  drivers/of/Kconfig   | 4 ++++
>  drivers/of/address.c | 6 +++++-
>  3 files changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 1ec34e16ed65..19f5aa8ac9a3 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -238,6 +238,7 @@ config PPC
>         select NEED_DMA_MAP_STATE               if PPC64 || NOT_COHERENT_CACHE
>         select NEED_SG_DMA_LENGTH
>         select OF
> +       select OF_DMA_DEFAULT_COHERENT          if !NOT_COHERENT_CACHE
>         select OF_EARLY_FLATTREE
>         select OLD_SIGACTION                    if PPC32
>         select OLD_SIGSUSPEND
> diff --git a/drivers/of/Kconfig b/drivers/of/Kconfig
> index 37c2ccbefecd..d91618641be6 100644
> --- a/drivers/of/Kconfig
> +++ b/drivers/of/Kconfig
> @@ -103,4 +103,8 @@ config OF_OVERLAY
>  config OF_NUMA
>         bool
>
> +config OF_DMA_DEFAULT_COHERENT
> +       # arches should select this if DMA is coherent by default for OF devices
> +       bool
> +
>  endif # OF
> diff --git a/drivers/of/address.c b/drivers/of/address.c
> index 99c1b8058559..e8a39c3ec4d4 100644
> --- a/drivers/of/address.c
> +++ b/drivers/of/address.c
> @@ -995,12 +995,16 @@ int of_dma_get_range(struct device_node *np, u64 *dma_addr, u64 *paddr, u64 *siz
>   * @np:        device node
>   *
>   * It returns true if "dma-coherent" property was found
> - * for this device in DT.
> + * for this device in the DT, or if DMA is coherent by
> + * default for OF devices on the current platform.
>   */
>  bool of_dma_is_coherent(struct device_node *np)
>  {
>         struct device_node *node = of_node_get(np);
>
> +       if (IS_ENABLED(CONFIG_OF_DMA_DEFAULT_COHERENT))
> +               return true;
> +
>         while (node) {
>                 if (of_property_read_bool(node, "dma-coherent")) {
>                         of_node_put(node);
> --
> 2.21.1
>
