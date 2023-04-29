Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 172656F25DD
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Apr 2023 20:25:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q7yZs6QCQz3cBP
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 Apr 2023 04:25:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=dabbelt-com.20221208.gappssmtp.com header.i=@dabbelt-com.20221208.gappssmtp.com header.a=rsa-sha256 header.s=20221208 header.b=l+H0JwRF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=dabbelt.com (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=palmer@dabbelt.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=dabbelt-com.20221208.gappssmtp.com header.i=@dabbelt-com.20221208.gappssmtp.com header.a=rsa-sha256 header.s=20221208 header.b=l+H0JwRF;
	dkim-atps=neutral
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q7yYz1j15z3bmH
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 Apr 2023 04:24:54 +1000 (AEST)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1a6762fd23cso9040485ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Apr 2023 11:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1682792692; x=1685384692;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KGl5HMSK57VmBSwKSnwgm3VXr902jH6XBJlNczgIzTY=;
        b=l+H0JwRFKwAD4TzkKtg69sq/SE0iMjDe/NX6Txlv16Ba4kBdBRnOLJE9cuEp/EtowJ
         pvTfeswVQQvBqhKyncNpPdAR29BMkNe6LB9ZMzoVyBV5Q9aGwXPM1Fc+6Qr50SDIiKsJ
         q9xyHClsPNOcAaBRr9fQ8UfCjonz6jsBwXrYvJjTpLiOgKgKgvN8uwk1fTPbl8XK+035
         m3QY80DvBeDJf799u5hnhHuLgfMpPNb4a9jtTjDBw2OzLziw75OHG2J322CH+dAw1HCw
         HsmmVI7grjIDtuj7uBS5rk+EMADzgTEglzedbNWVOsorwBluoILEBWp5M0RLFiHKNfCf
         2+Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682792692; x=1685384692;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KGl5HMSK57VmBSwKSnwgm3VXr902jH6XBJlNczgIzTY=;
        b=cM6eA5NUZPPJ4tjMvziHwSsJAKzzZ91PXwofPMcXCRbVFZ7XJ7FaZjNWmI34KBHk/x
         suEJnmeCykPurjMMS/G+PeXf/Xn9SRRigIrdHs5IZ5NIzQLYl4mmYhcOCzfEAhiG83Nd
         bPxAp+gXUCTGsxdcAetCuRU68g37/8mGw+jo7Qeylvjq0GQv6SvAJWIDazEn/z+nX2mF
         h3SvsojEaJ+7cjShrN5dCZCjYlCQzaO3VGB31ZtDx1791izpGmDQdhRy6F2eErsUZVto
         BX86lnL1tqD/6fZOa5hxXWfrRAkTUTjxTXAJkiQM1JUwXGz9bzMZ89MmIz06QdJDfFtU
         t06A==
X-Gm-Message-State: AC+VfDyrca9n5Uzmrt6+oSI+CEzDpxoQgGxsnL/zT1HxsuYHg+xFObHO
	Big1FwphcOb+512Dqbg6p1IT7Q==
X-Google-Smtp-Source: ACHHUZ6ZiLzN9eR+ckFMqg7tN3D4bPpq4geojnHO1Jqz7HXa46oxZHVvxREPvQQtQygRvSqX/lxFkg==
X-Received: by 2002:a17:903:124b:b0:1a2:8c7e:f315 with SMTP id u11-20020a170903124b00b001a28c7ef315mr10630845plh.21.1682792692014;
        Sat, 29 Apr 2023 11:24:52 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id z2-20020a170902708200b001a19196af48sm15137375plk.64.2023.04.29.11.24.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Apr 2023 11:24:51 -0700 (PDT)
Date: Sat, 29 Apr 2023 11:24:51 -0700 (PDT)
X-Google-Original-Date: Sat, 29 Apr 2023 11:24:33 PDT (-0700)
Subject: Re: [PATCH 09/19] riscv: cacheinfo: Adjust includes to remove of_device.h
In-Reply-To: <20230329-dt-cpu-header-cleanups-v1-9-581e2605fe47@kernel.org>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: robh@kernel.org
Message-ID: <mhng-8827afbb-9f5f-4a6d-b528-4b79b1a32f8a@palmer-ri-x1c9a>
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

On Wed, 29 Mar 2023 08:52:06 PDT (-0700), robh@kernel.org wrote:
> Now that of_cpu_device_node_get() is defined in of.h, of_device.h is just
> implicitly including other includes, and is no longer needed. Adjust the
> include files with what was implicitly included by of_device.h (cpu.h and
> of.h) and drop including of_device.h.
>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> Please ack and I will take the series via the DT tree.
> ---
>  arch/riscv/kernel/cacheinfo.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/cacheinfo.c b/arch/riscv/kernel/cacheinfo.c
> index 3a13113f1b29..e3829d2de5d9 100644
> --- a/arch/riscv/kernel/cacheinfo.c
> +++ b/arch/riscv/kernel/cacheinfo.c
> @@ -5,7 +5,6 @@
>
>  #include <linux/cpu.h>
>  #include <linux/of.h>
> -#include <linux/of_device.h>
>  #include <asm/cacheinfo.h>
>
>  static struct riscv_cacheinfo_ops *rv_cache_ops;

Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
