Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3894E6F25DE
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Apr 2023 20:26:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q7ybp13bkz3cj9
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 Apr 2023 04:26:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=dabbelt-com.20221208.gappssmtp.com header.i=@dabbelt-com.20221208.gappssmtp.com header.a=rsa-sha256 header.s=20221208 header.b=osIreuhF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=dabbelt.com (client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com; envelope-from=palmer@dabbelt.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=dabbelt-com.20221208.gappssmtp.com header.i=@dabbelt-com.20221208.gappssmtp.com header.a=rsa-sha256 header.s=20221208 header.b=osIreuhF;
	dkim-atps=neutral
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q7yYz1gFZz3bhx
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 Apr 2023 04:24:53 +1000 (AEST)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-64115e652eeso19274884b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Apr 2023 11:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1682792690; x=1685384690;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HCZIXMPhuJUf80scSK3agzn9QDDKa0LblR7ePMqe91Q=;
        b=osIreuhFqrOaZAAl/27+IK5Hi1AB1StDT3MQB4UJdmyvLv00XqfYnZDOR5DEup+Zbc
         EMMhztAPOHm+IIUb2Jko/Ql1Qxequoi14q5q6ioXxwV6ONNbTHbCpppQsquBotBv7NZA
         0xsoGYgWKOy6+E6yOM0QJd1lS7m7Gz/d+GxIdfE4O363XFxvr58OuzUA8yahfjRkgl76
         daFFl6DyngHfFxsVeUlgdYpwovv5SK9w21aq217ZLhFo3Y8jm5Njv+T6oNvGK4lJj/ES
         nDCkxSdKHcKkITKghp2NRdG/dKj2tCryrSlZDF5O3eK56lzP0kExP10+gizADZGE0dho
         uu6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682792690; x=1685384690;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HCZIXMPhuJUf80scSK3agzn9QDDKa0LblR7ePMqe91Q=;
        b=CarA9LBLzroLdD+Dm6LTey5wW+7FjHiEypdGQFfxF1gbxyuTMjWaAH83qCNCy5NehH
         K/L446Mjy/BBn2O8M/qiwEuzp6XgaRExB3leXJw3eAnI2VpCUFajfmWc1EOS/T0BDu64
         61WmhFPiixyC6gMGGt5p5P5Truz0nHptnEpGBJ/4djnq36cn/qAYJ1mQFkIZeglZf/T3
         Ayzl9ijG9DeKHKwjJCDAyrVQaL6XI6Y2ArDIfGMUMENIrk+1OCuMOoZl56MaXVgO2dJ/
         eD3nfjuXz5ol0Qe/pV6O5Nam9a57DIUVVw8Oam7JwmYbC0s1WTIhlpLEFo7xvGR+pSfs
         DZ0Q==
X-Gm-Message-State: AC+VfDxTbBERNN0SM4skxEd76dJa0kcmw0+5SCHETPwKYf/k66EjxJ2g
	6Jl1XtEiaqr1IYRTbEilF3LhyA==
X-Google-Smtp-Source: ACHHUZ56+SNdXMph8Hdac6/dfoFg0Vhv/AYaUOOmwxyPYiHuY8kgDpOram8U+gPi6EA5PyHcO2u8+w==
X-Received: by 2002:a17:903:41cf:b0:1a6:d0a8:c70f with SMTP id u15-20020a17090341cf00b001a6d0a8c70fmr11307108ple.5.1682792690325;
        Sat, 29 Apr 2023 11:24:50 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id l4-20020a170902eb0400b001960706141fsm15126026plb.149.2023.04.29.11.24.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Apr 2023 11:24:49 -0700 (PDT)
Date: Sat, 29 Apr 2023 11:24:49 -0700 (PDT)
X-Google-Original-Date: Sat, 29 Apr 2023 11:24:22 PDT (-0700)
Subject: Re: [PATCH 08/19] riscv: Add explicit include for cpu.h
In-Reply-To: <20230329-dt-cpu-header-cleanups-v1-8-581e2605fe47@kernel.org>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: robh@kernel.org
Message-ID: <mhng-3fdcd7ba-9d00-4521-a55f-367cf53f5f12@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: nm@ti.com, chenhuacai@kernel.org, rafael@kernel.org, tiny.windzz@gmail.com, viresh.kumar@linaro.org, lpieralisi@kernel.org, amitk@kernel.org, jiaxun.yang@flygoat.com, linux-mips@vger.kernel.org, linux-tegra@vger.kernel.org, thierry.reding@gmail.com, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, frowand.list@gmail.com, vireshk@kernel.org, andersson@kernel.org, Marc Zyngier <maz@kernel.org>, samuel@sholland.org, daniel.lezcano@linaro.org, linux@armlinux.org.uk, jernej.skrabec@gmail.com, jonathanh@nvidia.com, wens@csie.org, agross@kernel.org, anup@brainfault.org, rui.zhang@intel.com, linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, aou@eecs.berkeley.edu, linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org, npiggin@gmail.com, robh+dt@kernel.org, linux-mediatek@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, matthias.bgg@gmail.com, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com, sboyd@kernel.o
 rg, Greg KH <gregkh@linuxfoundation.org>, amit.kachhap@gmail.com, linux-kernel@vger.kernel.org, konrad.dybcio@linaro.org, sudeep.holla@arm.com, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net, lukasz.luba@arm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 29 Mar 2023 08:52:05 PDT (-0700), robh@kernel.org wrote:
> Removing the include of cpu.h from of_device.h (included by
> of_platform.h) causes an error in setup.c:
>
> arch/riscv/kernel/setup.c:313:22: error: arithmetic on a pointer to an incomplete type 'typeof(struct cpu)' (aka 'struct cpu')
>
> The of_platform.h header is not necessary either, so it can be dropped.
>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> Please ack and I will take the series via the DT tree.
> ---
>  arch/riscv/kernel/setup.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> index 376d2827e736..dcfa4b6fa4b1 100644
> --- a/arch/riscv/kernel/setup.c
> +++ b/arch/riscv/kernel/setup.c
> @@ -8,6 +8,7 @@
>   *  Nick Kossifidis <mick@ics.forth.gr>
>   */
>
> +#include <linux/cpu.h>
>  #include <linux/init.h>
>  #include <linux/mm.h>
>  #include <linux/memblock.h>
> @@ -15,7 +16,6 @@
>  #include <linux/console.h>
>  #include <linux/screen_info.h>
>  #include <linux/of_fdt.h>
> -#include <linux/of_platform.h>
>  #include <linux/sched/task.h>
>  #include <linux/smp.h>
>  #include <linux/efi.h>

Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
