Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED826CEE78
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Mar 2023 18:02:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pmrt747MYz3ghK
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Mar 2023 03:02:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.208.48; helo=mail-ed1-f48.google.com; envelope-from=wens213@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pmrlt4JLMz3g51
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Mar 2023 02:57:14 +1100 (AEDT)
Received: by mail-ed1-f48.google.com with SMTP id t10so65134417edd.12
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Mar 2023 08:57:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680105431;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Mv45vqNNvk7gfjj9ywv5t87xL9EGo+L1vyvtzDS68LU=;
        b=QBj93ltn7axau7Z9XQ6Bcn2XAqmqFx37WAiihhbW2nUShjJWGXvEKEc0+RDdlcHgAi
         XgTq+mQsBXCIn14jykSuLkPDDKUVh5BOzcI114XiyUNVws5B+vDejTatj2ajw8wmllCH
         tJtLEXFkbiObkvS1KiiVhsqsL5/e8Pga32dlTbtliqn2sbk8ND2eEXNAMNE56VPN0JkP
         d5kNkHYP4evD74hALXQlZTB7Bj5g2nkXJ2szfI0b51DNPpULVBqkp2uivuRPtpooJpar
         SRnjeqKBqPbiFtRzRXQniBB7wA1pFQOeNyqldUpbwzB0AJ7qEqXg5+UUkscHfSmdWiVa
         Nw0A==
X-Gm-Message-State: AAQBX9dM5vI3LNGJfO7X2aHEa6CjES5iw3ZFWQpAGny3/fgVgRPOQdLj
	X1BgHuYi8gAS2NzZE6oUVk8+kMnVd4GKmc2b
X-Google-Smtp-Source: AKy350ZnFE6GZG38IXatMCC/ciPBhi//96/TrJG/hazihXeeRlbdHtzo3tZ+RvLwiTYWZ2RdtQaCyA==
X-Received: by 2002:a17:906:380a:b0:93b:943f:6261 with SMTP id v10-20020a170906380a00b0093b943f6261mr19946445ejc.74.1680105430786;
        Wed, 29 Mar 2023 08:57:10 -0700 (PDT)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com. [209.85.221.54])
        by smtp.gmail.com with ESMTPSA id g13-20020a170906198d00b008c16025b318sm16628141ejd.155.2023.03.29.08.57.10
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Mar 2023 08:57:10 -0700 (PDT)
Received: by mail-wr1-f54.google.com with SMTP id l12so16250298wrm.10
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Mar 2023 08:57:10 -0700 (PDT)
X-Received: by 2002:a5d:591c:0:b0:2ca:4533:5d6a with SMTP id
 v28-20020a5d591c000000b002ca45335d6amr4154237wrd.7.1680105410028; Wed, 29 Mar
 2023 08:56:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230329-dt-cpu-header-cleanups-v1-0-581e2605fe47@kernel.org> <20230329-dt-cpu-header-cleanups-v1-6-581e2605fe47@kernel.org>
In-Reply-To: <20230329-dt-cpu-header-cleanups-v1-6-581e2605fe47@kernel.org>
From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 29 Mar 2023 23:56:38 +0800
X-Gmail-Original-Message-ID: <CAGb2v64tNZa_LCUpHBbBUdpftB_Dms=oHcb7ZAD42qL-ov73hw@mail.gmail.com>
Message-ID: <CAGb2v64tNZa_LCUpHBbBUdpftB_Dms=oHcb7ZAD42qL-ov73hw@mail.gmail.com>
Subject: Re: [PATCH 06/19] ARM: sunxi: Drop of_device.h include
To: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Reply-To: wens@csie.org
Cc: Nishanth Menon <nm@ti.com>, Huacai Chen <chenhuacai@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Yangtao Li <tiny.windzz@gmail.com>, Viresh Kumar <viresh.kumar@linaro.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Amit Kucheria <amitk@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org, linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Frank Rowand <frowand.list@gmail.com>, Viresh Kumar <vireshk@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Marc Zyngier <maz@kernel.org>, Samuel Holland <samuel@sholland.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Russell King <linux@armlinux.org.uk>, Jernej Skrabec <jernej.skrabec@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Andy Gross <agross@kernel.org>, Anup Patel <anup@brainfault.org>, Zhang Rui <rui.zhang@intel.com>, linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.ed
 u>, linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, Matthias Brugger <matthias.bgg@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Stephen Boyd <sboyd@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Amit Daniel Kachhap <amit.kachhap@gmail.com>, linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>, Sudeep Holla <sudeep.holla@arm.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, Lukasz Luba <lukasz.luba@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Mar 29, 2023 at 11:53=E2=80=AFPM Rob Herring <robh@kernel.org> wrot=
e:
>
> Now that of_cpu_device_node_get() is defined in of.h, of_device.h is just
> implicitly including other includes, and is no longer needed. Just drop
> including of_device.h as of.h is already included.
>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> Please ack and I will take the series via the DT tree.

Acked-by: Chen-Yu Tsai <wens@csie.org>

I doubt this file would ever see any more changes.

> ---
>  arch/arm/mach-sunxi/mc_smp.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/arch/arm/mach-sunxi/mc_smp.c b/arch/arm/mach-sunxi/mc_smp.c
> index 26cbce135338..cb63921232a6 100644
> --- a/arch/arm/mach-sunxi/mc_smp.c
> +++ b/arch/arm/mach-sunxi/mc_smp.c
> @@ -19,7 +19,6 @@
>  #include <linux/irqchip/arm-gic.h>
>  #include <linux/of.h>
>  #include <linux/of_address.h>
> -#include <linux/of_device.h>
>  #include <linux/smp.h>
>
>  #include <asm/cacheflush.h>
>
> --
> 2.39.2
>
