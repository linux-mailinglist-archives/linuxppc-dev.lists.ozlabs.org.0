Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EE39D7AF814
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Sep 2023 04:27:09 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=WOBP2rXk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RwL9671L2z3c8D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Sep 2023 12:27:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=WOBP2rXk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52f; helo=mail-ed1-x52f.google.com; envelope-from=joel.stan@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RwL8B341lz3bwL;
	Wed, 27 Sep 2023 12:26:16 +1000 (AEST)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5346b64f17aso2889892a12.2;
        Tue, 26 Sep 2023 19:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1695781568; x=1696386368; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=emIKXtRIs/yM2DWwZD9zMtoiHVTkPPbqlVWgbeCiXyc=;
        b=WOBP2rXkDxl/2RLWZV0ykH5s5JAiA/xd+2OwZq68/tozjz0XNqdFFEFEVVBYPVwkt3
         8QUl131F3X3ZKCUsW3RIrQFQulCHC9OkOLb+MwspupJUKcfRgRE0WwteU0DmQDq3qef3
         Jk/arksThjoASPa5vnEwSzt1R93gYs/IgE9Ag=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695781568; x=1696386368;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=emIKXtRIs/yM2DWwZD9zMtoiHVTkPPbqlVWgbeCiXyc=;
        b=C1OCF2Z/aYD/AEdzikl73zl2L2i3lAN041t9fG6/rTu8gHk5XuOiut0O+kdA9Cme+V
         +ZfWRxNQuXhCkJ50cAhN/SIMRiyDyVXB+BuKHU7m40gwpJwOwPfoJrjCM8FtR3jA4RmG
         kgGhfHhnV8iMa9yKrvlrvjCNndeL6e3j6gYzN3/Bsq9RrjLZivu3fHbzWESW9cGhNkPE
         1YPp7FsZ3MIbo1G/LxDocBZMykVlXFg9kxnfcU+NUDwnzChB0YxlmO10FeVOIz1LQwxd
         lQUkKoR0lB0GGpaovoGgHV1N2Nhda0x967hHs07V/qfExMxtCdIK83PRPsyeIdy4N3XB
         Pufg==
X-Gm-Message-State: AOJu0Ywxa7ZQd8TtBdZc3UpjNiuFq/wue75uR7W20N832C6GWlCVSkKn
	6+oV+z41XbdmW5RfDXztO/zrNvt4MdEx+GwJuo4=
X-Google-Smtp-Source: AGHT+IHCCOjXb8+6pc5O9HOXdlXxVDhFBKsFiifAI3BglZZL/BL8JlMYEB/1h28CGguKKA8HQFS3La5RDl0OFTUHTbc=
X-Received: by 2002:a17:906:9a:b0:9b2:9d6f:2949 with SMTP id
 26-20020a170906009a00b009b29d6f2949mr400624ejc.57.1695781568293; Tue, 26 Sep
 2023 19:26:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230925095532.1984344-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230925095532.1984344-1-u.kleine-koenig@pengutronix.de>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 27 Sep 2023 02:25:56 +0000
Message-ID: <CACPK8XeROYz_XaB3TvUhdXm7Vm8fjC8yU+mfvA58=_FiDrBy-g@mail.gmail.com>
Subject: Re: [PATCH 00/40] soc: Convert to platform remove callback returning void
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
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
Cc: Nishanth Menon <nm@ti.com>, Herve Codina <herve.codina@bootlin.com>, Heiko Stuebner <heiko@sntech.de>, Mateusz Holenko <mholenko@antmicro.com>, Muhammad Usama Anjum <usama.anjum@collabora.com>, linux-tegra@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Thierry Reding <thierry.reding@gmail.com>, Alim Akhtar <alim.akhtar@samsung.com>, linux-riscv@lists.infradead.org, Karol Gugala <kgugala@antmicro.com>, Qiang Zhao <qiang.zhao@nxp.com>, Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>, Rob Herring <robh@kernel.org>, linux-samsung-soc@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Ruan Jinjie <ruanjinjie@huawei.com>, Yinbo Zhu <zhuyinbo@loongson.cn>, Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org, Gabriel Somlo <gsomlo@gmail.com>, Andy Gross <agross@kernel.org>, Huisong Li <lihuisong@huawei.com>, Yang Yingliang <yangyingliang@huawei.com>, Sumit Gupta <sumitg@nvidia.com>, zhang songyi <zhang.songyi@zte.com.cn>, Zev Weiss <zev@bewilderbeest.net>, 
 Arnd Bergmann <arnd@arndb.de>, linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org, Lubomir Rintel <lkundrak@v3.sk>, Krzysztof Halasa <khalasa@piap.pl>, loongarch@lists.linux.dev, Santosh Shilimkar <ssantosh@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Daire McNamara <daire.mcnamara@microchip.com>, Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org, Shang XiaoJing <shangxiaojing@huawei.com>, Li Yang <leoyang.li@nxp.com>, Konrad Dybcio <konrad.dybcio@linaro.org>, Andrew Jeffery <andrew@aj.id.au>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, kernel@pengutronix.de, linux-mediatek@lists.infradead.org, Nick Alcock <nick.alcock@oracle.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 25 Sept 2023 at 09:55, Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> Hello,
>
> this series converts all platform drivers below drivers/soc to use
> .remove_new(). The motivation is to get rid of an integer return code
> that is (mostly) ignored by the platform driver core and error prone on
> the driver side.
>
> See commit 5c5a7680e67b ("platform: Provide a remove callback that
> returns no value") for an extended explanation and the eventual goal.
>
> As there is no single maintainer team for drivers/soc, I suggest the
> individual maintainers to pick up "their" patches.

I'd be happy if Arnd merged the lot at once. Arnd, what do you think?

If that will be too messy then I understand. I have queued the aspeed
ones locally and will push that out if we decide that's the best way
to go.

Thanks for doing this cleanup Uwe.

Cheers,

Joel
