Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5917A6CEE7D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Mar 2023 18:03:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pmrtd2BGgz3gt9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Mar 2023 03:03:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.208.44; helo=mail-ed1-f44.google.com; envelope-from=rjwysocki@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pmrm70yJPz3g6Z
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Mar 2023 02:57:27 +1100 (AEDT)
Received: by mail-ed1-f44.google.com with SMTP id x3so65220514edb.10
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Mar 2023 08:57:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680105444;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CiLLqeasGYV72OnUftYDwpJH98iYFk7qhLz9/jkuOco=;
        b=nutDbiTbQFR4nRTidpvfB3WyyIqjbhxr93Q4XpCXNT+hp1SruMOP0EKYWQ0I8N4MxP
         PUOin6fLDgj5PTUxUhY5MTN6iS88z9M/qWZdX7Wp6+AKqbctkdhDR6ZplKd0AFL9YUYI
         Sbs+j4eiMFBX+3pF+ncQJdqXcGAfipWXzTNxv5PNTi92R1qXhKXFHBVUJf4YOxxDTjDm
         y47jozpgEGMfgXrU7WSwtBeApID5g7+iRaF5jOQJCoYGwgymwgBd6tF391PTH+6IyZ9C
         Cj4mOAUmOe1bb9DO1fyGTuNDVAbF/QOukiT1R+yjqI7aXwg8X9npFLPifguuZr/CyqKs
         XiFQ==
X-Gm-Message-State: AAQBX9eAJGWo+jVz9wCgYb+gL8pSR5GgH1Qlvd1rjqNc9reAs7n7wgXo
	pPoJsUO35wb6xMyGrgr9nGgBBsiXTTASex2erlE=
X-Google-Smtp-Source: AKy350bpppzhtgK7epjSXQz3h0DFNSdZnWNofTwOprIA61Xay8SqtY2fCtP8X1SqYIkDWIEHDZMZthJxQAfHpdrMVVg=
X-Received: by 2002:a50:cc94:0:b0:4fb:c8e3:1ae2 with SMTP id
 q20-20020a50cc94000000b004fbc8e31ae2mr10233137edi.3.1680105443653; Wed, 29
 Mar 2023 08:57:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230329-dt-cpu-header-cleanups-v1-0-581e2605fe47@kernel.org> <20230329-dt-cpu-header-cleanups-v1-16-581e2605fe47@kernel.org>
In-Reply-To: <20230329-dt-cpu-header-cleanups-v1-16-581e2605fe47@kernel.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 29 Mar 2023 17:57:12 +0200
Message-ID: <CAJZ5v0iFMOWMuG1t4gwzF=m-kfonj4ni9+zciRHDzqFcTGaYpw@mail.gmail.com>
Subject: Re: [PATCH 16/19] cpuidle: Adjust includes to remove of_device.h
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

On Wed, Mar 29, 2023 at 5:52=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
>
> Now that of_cpu_device_node_get() is defined in of.h, of_device.h is just
> implicitly including other includes, and is no longer needed. Adjust the
> include files with what was implicitly included by of_device.h (cpu.h,
> cpuhotplug.h, of.h, and of_platform.h) and drop including of_device.h.
>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> Please ack and I will take the series via the DT tree.

Acked-by: Rafael J. Wysocki <rafael@kernel.org>

> ---
>  drivers/cpuidle/cpuidle-psci.c      | 1 -
>  drivers/cpuidle/cpuidle-qcom-spm.c  | 3 +--
>  drivers/cpuidle/cpuidle-riscv-sbi.c | 2 +-
>  drivers/cpuidle/dt_idle_states.c    | 1 -
>  4 files changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/cpuidle/cpuidle-psci.c b/drivers/cpuidle/cpuidle-psc=
i.c
> index 6de027f9f6f5..bf68920d038a 100644
> --- a/drivers/cpuidle/cpuidle-psci.c
> +++ b/drivers/cpuidle/cpuidle-psci.c
> @@ -16,7 +16,6 @@
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> -#include <linux/of_device.h>
>  #include <linux/platform_device.h>
>  #include <linux/psci.h>
>  #include <linux/pm_domain.h>
> diff --git a/drivers/cpuidle/cpuidle-qcom-spm.c b/drivers/cpuidle/cpuidle=
-qcom-spm.c
> index c6e2e91bb4c3..1fc9968eae19 100644
> --- a/drivers/cpuidle/cpuidle-qcom-spm.c
> +++ b/drivers/cpuidle/cpuidle-qcom-spm.c
> @@ -11,8 +11,7 @@
>  #include <linux/io.h>
>  #include <linux/slab.h>
>  #include <linux/of.h>
> -#include <linux/of_address.h>
> -#include <linux/of_device.h>
> +#include <linux/of_platform.h>
>  #include <linux/err.h>
>  #include <linux/platform_device.h>
>  #include <linux/cpuidle.h>
> diff --git a/drivers/cpuidle/cpuidle-riscv-sbi.c b/drivers/cpuidle/cpuidl=
e-riscv-sbi.c
> index be383f4b6855..ae0b838a0634 100644
> --- a/drivers/cpuidle/cpuidle-riscv-sbi.c
> +++ b/drivers/cpuidle/cpuidle-riscv-sbi.c
> @@ -8,6 +8,7 @@
>
>  #define pr_fmt(fmt) "cpuidle-riscv-sbi: " fmt
>
> +#include <linux/cpuhotplug.h>
>  #include <linux/cpuidle.h>
>  #include <linux/cpumask.h>
>  #include <linux/cpu_pm.h>
> @@ -15,7 +16,6 @@
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> -#include <linux/of_device.h>
>  #include <linux/slab.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_domain.h>
> diff --git a/drivers/cpuidle/dt_idle_states.c b/drivers/cpuidle/dt_idle_s=
tates.c
> index 02aa0b39af9d..12fec92a85fd 100644
> --- a/drivers/cpuidle/dt_idle_states.c
> +++ b/drivers/cpuidle/dt_idle_states.c
> @@ -14,7 +14,6 @@
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> -#include <linux/of_device.h>
>
>  #include "dt_idle_states.h"
>
>
> --
> 2.39.2
>
