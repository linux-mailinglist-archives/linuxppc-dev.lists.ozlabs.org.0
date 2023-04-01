Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5119D6D337C
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Apr 2023 21:23:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PpnBs1HRdz3fSx
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 Apr 2023 05:23:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=wLou/172;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com; envelope-from=daniel.lezcano@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=wLou/172;
	dkim-atps=neutral
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ppn9M1gxLz3cMS
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  2 Apr 2023 05:22:31 +1000 (AEST)
Received: by mail-wm1-x32e.google.com with SMTP id r19-20020a05600c459300b003eb3e2a5e7bso15824419wmo.0
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 01 Apr 2023 12:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680376950;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YsdIX4QaNsFy8jAUYtXLUiYq0pMM/KF7S/HscFFRFa8=;
        b=wLou/172SsZ4tbZKAmsf4wdm/jkdhPJhgp/9PODUlSx+8zj3bvceTjgZUslKBzMWw8
         dbzF5WM+xXp7t01zz37q83r+zoMvSKVW3P/J28MwkqEbL9aNMV8iCK1aq/f4+7SIi4B9
         qp2UZBwhIDmh3rDtCB63WKwzAN5BUgdGepgfYA2wOSMqur9AYXlb5tF5t3JYnBT9m+FF
         QZNbjh2HDQTcX3YBnp/khnrydEiI2K5FE2h9klkr7WGo/ExSeTZ8Jium1tK606uJuIKM
         bxjPVjsLqxf1k5WstPx4prev8VXkZHddRS3F63SKw/dTy0euJ1u4Vad24HvY2PFiL49V
         8UgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680376950;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YsdIX4QaNsFy8jAUYtXLUiYq0pMM/KF7S/HscFFRFa8=;
        b=K/0qkC1+khAlqIFYN56DwXD35N9aM0MkGGmjles2/vUyMev4uBThBH33LzLgE1wqdt
         XnGEZDBmBt+Psg6XNey/2xQ7wpSyBaW1znZKlialJU5Tt7QyuAly796FERevLVjEddUD
         i3TNkmUgd83WTxOObz3CULyMMb15Fz0yY9zMgqiog0r/nkLInexvXdSAndLc5Qch4srx
         Z4qkv53IvFLA+0F7pMI/mjFbqV+hCIFWjkeSvekFVdZs+Zqq4ZQSquoGON1vhdY25POL
         T4cQi/ncSycxsFbdf4SQi/zBI+7p6DDOqCdV3gFQEFzju+txCaSn/7mBZXFvbnoHMSJs
         yBZA==
X-Gm-Message-State: AO0yUKUWcCopp6coVz7Q2bmlWz8Gvs6SLV0MQONIqCZfNioBcRc767BG
	Bp2WmPa63QIp8xiAdPM5y5JzVg==
X-Google-Smtp-Source: AK7set9y5bHkZCySLIhsJfaK02RbOBp8M7OwMT91WfVTWaYaVc0pGHqd8wtNzjk/5/WSJSDGT1LTiA==
X-Received: by 2002:a7b:cd88:0:b0:3ee:7061:1bdd with SMTP id y8-20020a7bcd88000000b003ee70611bddmr22820919wmj.4.1680376950405;
        Sat, 01 Apr 2023 12:22:30 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:b36a:1186:309c:1f9a? ([2a05:6e02:1041:c10:b36a:1186:309c:1f9a])
        by smtp.googlemail.com with ESMTPSA id r5-20020adfe685000000b002e61e002943sm4791678wrm.116.2023.04.01.12.22.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Apr 2023 12:22:29 -0700 (PDT)
Message-ID: <93ffd73a-4544-5148-0159-1a9ea773c0a0@linaro.org>
Date: Sat, 1 Apr 2023 21:22:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 12/19] thermal: cpuidle_cooling: Adjust includes to remove
 of_device.h
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Thomas Gleixner
 <tglx@linutronix.de>, Amit Daniel Kachhap <amit.kachhap@gmail.com>,
 Viresh Kumar <viresh.kumar@linaro.org>, Lukasz Luba <lukasz.luba@arm.com>,
 Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Yangtao Li <tiny.windzz@gmail.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Sudeep Holla <sudeep.holla@arm.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Anup Patel <anup@brainfault.org>,
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Marc Zyngier <maz@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
 Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>
References: <20230329-dt-cpu-header-cleanups-v1-0-581e2605fe47@kernel.org>
 <20230329-dt-cpu-header-cleanups-v1-12-581e2605fe47@kernel.org>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20230329-dt-cpu-header-cleanups-v1-12-581e2605fe47@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, linux-tegra@vger.kernel.org, linux-mediatek@lists.infradead.org, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 29/03/2023 17:52, Rob Herring wrote:
> Now that of_cpu_device_node_get() is defined in of.h, of_device.h is just
> implicitly including other includes, and is no longer needed. Adjust the
> include files with what was implicitly included by of_device.h (cpu.h and
> of.h) and drop including of_device.h.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> Please ack and I will take the series via the DT tree.

Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

