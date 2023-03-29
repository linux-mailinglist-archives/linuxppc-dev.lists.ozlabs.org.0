Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FCE66CEE8A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Mar 2023 18:03:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pmrvd2PKbz3h03
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Mar 2023 03:03:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.208.47; helo=mail-ed1-f47.google.com; envelope-from=rjwysocki@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PmrpN0L89z3gNh
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Mar 2023 02:59:23 +1100 (AEDT)
Received: by mail-ed1-f47.google.com with SMTP id eg48so65212051edb.13
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Mar 2023 08:59:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680105561;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J5wozgmwB4K3uhtLQG0ELPhsGFHRdp3FOmHAQorjhl0=;
        b=fQqWusjlwJlJ+a0r/EHZ/xMvgDSMsg2+uWf5s5R5AcuVV4NKwhlGOsOTbGYmkBkefp
         evJvDMOJcAdYjcpe7e5ilVO/l4kSuelOXC89Gfss7xiFY/aiQyekHdnu6k4akh9zftbt
         DgMczLQE7Op5HYyqoryOUWnMED2AuYyaGwHQTBATEnip58PYahbdZw0cbzFRVOU4ueHp
         maHsuYw5ybEmO195SRrL7O3ibirJE+uVrkGWYaJlvCRsvN9miKcUqvBULISA3UrlW92x
         Mt9kT8lRl1q+QXUmO+Sr8uMF15iZT1MUglwb5UT9bhn+vaHMVNqCjA4xjXGI7FRV/Mpb
         zHXw==
X-Gm-Message-State: AAQBX9dhl/wuCKzskaOgmvWsJoTLtzcGvh0N5mJdRXCpSH3xG5rOfFhS
	Tdl2DKPudGroSqjKW+IrcBBv1TYQWCFJDZZ0ZLE=
X-Google-Smtp-Source: AKy350aoH0YzB4EGxwWgRtfVzYdwc/jxafoqtAza3yowu+hrkNWR6MYo9KvzVJ1ZAz0kSvIrND9NAtkY2JWrK3waVKA=
X-Received: by 2002:a50:c34f:0:b0:4fa:71a2:982b with SMTP id
 q15-20020a50c34f000000b004fa71a2982bmr1623255edb.0.1680105560897; Wed, 29 Mar
 2023 08:59:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230329-dt-cpu-header-cleanups-v1-0-581e2605fe47@kernel.org> <20230329-dt-cpu-header-cleanups-v1-12-581e2605fe47@kernel.org>
In-Reply-To: <20230329-dt-cpu-header-cleanups-v1-12-581e2605fe47@kernel.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 29 Mar 2023 17:59:09 +0200
Message-ID: <CAJZ5v0g2g7-M1cuvXNs=t-n6rZD7v=uS_rEPBQtyBBAq1yWJ7w@mail.gmail.com>
Subject: Re: [PATCH 12/19] thermal: cpuidle_cooling: Adjust includes to remove of_device.h
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
Cc: Nishanth Menon <nm@ti.com>, Huacai Chen <chenhuacai@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Yangtao Li <tiny.windzz@gmail.com>, Viresh Kumar <viresh.kumar@linaro.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Amit Kucheria <amitk@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org, linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Frank Rowand <frowand.list@gmail.com>, Viresh Kumar <vireshk@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Marc Zyngier <maz@kernel.org>, Samuel Holland <samuel@sholland.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Russell King <linux@armlinux.org.uk>, Jernej Skrabec <jernej.skrabec@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Chen-Yu Tsai <wens@csie.org>, Andy Gross <agross@kernel.org>, Anup Patel <anup@brainfault.org>, Zhang Rui <rui.zhang@intel.com>, linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, A
 lbert Ou <aou@eecs.berkeley.edu>, linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, Matthias Brugger <matthias.bgg@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Stephen Boyd <sboyd@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Amit Daniel Kachhap <amit.kachhap@gmail.com>, linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>, Sudeep Holla <sudeep.holla@arm.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, Lukasz Luba <lukasz.luba@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Mar 29, 2023 at 5:53=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
>
> Now that of_cpu_device_node_get() is defined in of.h, of_device.h is just
> implicitly including other includes, and is no longer needed. Adjust the
> include files with what was implicitly included by of_device.h (cpu.h and
> of.h) and drop including of_device.h.
>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> Please ack and I will take the series via the DT tree.

Acked-by: Rafael J. Wysocki <rafael@kernel.org>

> ---
>  drivers/thermal/cpuidle_cooling.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/thermal/cpuidle_cooling.c b/drivers/thermal/cpuidle_=
cooling.c
> index 4f41102e8b16..6f6daead485e 100644
> --- a/drivers/thermal/cpuidle_cooling.c
> +++ b/drivers/thermal/cpuidle_cooling.c
> @@ -7,12 +7,13 @@
>   */
>  #define pr_fmt(fmt) "cpuidle cooling: " fmt
>
> +#include <linux/cpu.h>
>  #include <linux/cpu_cooling.h>
>  #include <linux/cpuidle.h>
>  #include <linux/device.h>
>  #include <linux/err.h>
>  #include <linux/idle_inject.h>
> -#include <linux/of_device.h>
> +#include <linux/of.h>
>  #include <linux/slab.h>
>  #include <linux/thermal.h>
>
>
> --
> 2.39.2
>
