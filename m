Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87ABA6CEEA7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Mar 2023 18:06:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PmryN2Y1gz3g4T
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Mar 2023 03:06:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ZP8azEYR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52f; helo=mail-ed1-x52f.google.com; envelope-from=jernej.skrabec@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ZP8azEYR;
	dkim-atps=neutral
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PmrxX5l0Rz2yPY
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Mar 2023 03:05:35 +1100 (AEDT)
Received: by mail-ed1-x52f.google.com with SMTP id r11so65428195edd.5
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Mar 2023 09:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680105931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oXQRlBCYnqGo9Fi48YDM5Iz/n3EKV6wgfQDls4v49ZQ=;
        b=ZP8azEYR3T/kmocgq8bSZlNTouSdAv0pqNbONNvK6pjIOYfvW0EWRaDVO44E5sowbA
         4MGZKJiXz7VE108ciJQNXn5/hHquTqMqhb6tRaq9zC55es7aV4eyXx5sWcvFrwBw8u31
         DcptBNfTU6x5mTKuHF7vCiSdOphP7f1dZ5xyT7jA8pE036EK0r7Mwyj+wpf0qOtr4/dO
         PtsdhtBZV/jUZWdd6KSP5EkVxa9qFL2fQNK4V/Imeno6KN+BWXvR2ysex446RXd1SjcJ
         RuPjjhn8s3ln2xq7NpQb+o1cGn+mn2pwwyW/FTHZVbW4BbukRommLkvptqsBpXQc4gTR
         WTBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680105931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oXQRlBCYnqGo9Fi48YDM5Iz/n3EKV6wgfQDls4v49ZQ=;
        b=VrN7R1tMAcILrrqOpFwmQncSZFLwhHpCK8dgtQf789bAojhazzzvrkzaBTPsZo6WMh
         cOO1Hdk9sYlKVjgOFgY/LGnL+vrh8YacR4Hi9xfjN2l5fkpt7jqTODUtg5IBMYaCLqCN
         vUZVvva3agfqtRpF6u/1vETtbHQXM0IQHoQdBHx8AX8jXijEKVO6K3ekS2dCH4OW9fjo
         +N3TXjejh6jOBZYkcMmPMxaLMwaGULKwbMsxpGeEDBFytMSRRLI2xKSPzxFBBPGhqlUp
         SL5s69UQo2kGunvMqrdjZ3wCSIT8zsakaaPFdxGYw2qCdeDOStWCEeyzyi3QBIM3xdPc
         Mxww==
X-Gm-Message-State: AAQBX9fondge3rxkG1+bG+GFGGoYOlJvb8b8G/+8HSjrRfhFbCSOcH1L
	PjdUltZBGS2HejdMa0HLFbk=
X-Google-Smtp-Source: AKy350Y0SxvEseTuQQeEwplPrjnDboy+i5rUViT0BUXK5Dv5qulkowom3JNTJJ/XP46pJIz4L/hzEA==
X-Received: by 2002:a17:906:f1c7:b0:933:c474:420b with SMTP id gx7-20020a170906f1c700b00933c474420bmr20841888ejb.19.1680105930843;
        Wed, 29 Mar 2023 09:05:30 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id l19-20020a170906079300b00932ed432475sm15417251ejc.124.2023.03.29.09.05.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 09:05:30 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Amit Daniel Kachhap <amit.kachhap@gmail.com>,
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
 Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 15/19] cpufreq: sun50i: Add explicit include for cpu.h
Date: Wed, 29 Mar 2023 18:05:27 +0200
Message-ID: <2672894.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <20230329-dt-cpu-header-cleanups-v1-15-581e2605fe47@kernel.org>
References:  <20230329-dt-cpu-header-cleanups-v1-0-581e2605fe47@kernel.org>
 <20230329-dt-cpu-header-cleanups-v1-15-581e2605fe47@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, linux-tegra@vger.kernel.org, linux-mediatek@lists.infradead.org, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Dne sreda, 29. marec 2023 ob 17:52:12 CEST je Rob Herring napisal(a):
> Removing the include of cpu.h from of_device.h causes an error:
>=20
> drivers/cpufreq/sun50i-cpufreq-nvmem.c:42:19: error: implicit declaration=
 of
> function =E2=80=98get_cpu_device=E2=80=99; did you mean =E2=80=98get_devi=
ce=E2=80=99?
> [-Werror=3Dimplicit-function-declaration]
>=20
> As of_device.h is not otherwise needed, it can be replaced with of.h
> (also implicitly included).
>=20
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


