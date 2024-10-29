Return-Path: <linuxppc-dev+bounces-2681-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C349B4DD0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Oct 2024 16:24:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XdDZ62Yscz2yQL;
	Wed, 30 Oct 2024 02:24:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730215454;
	cv=none; b=cUIigSkp5rE6i89I7eEJ2T4fLmZVXkiIVrZtsA3qJIR0b73GB12cyLSZVeVoYyB86LVN7VdO+sgbMLu4lKzxqAOTrtopkPZm2lxRz9UzxUAV2KZkPa6yaloBw+orxY1uuClQ9ItLmCsJ5FxaxXkUGN87wkD7MjtCZQRDnIy2Gx8mY8MGU3dN3/L5VPq4pabBK+ntw86QTD+4na4ek5ewIK0WAebcCOh2aODBDWeAG9/9zxR0418sYgFovoQ5ksPlppZSpNU5l010QuGuxe4il6lkOlCeqdD8E+OmR5E2qDJgnuUMXxIu1xKX1kDfISoMlM8knQS5UVX4/PIFwV25mg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730215454; c=relaxed/relaxed;
	bh=ZkWZGKb51lNq5GXpAPgw2PWMYs1TWirtQYaIbVCFreI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BVbB+gMTV7ogWSjuTtm9eehrIyHUS66NMDtQmuH9qqwrN9BHWGeMI6rqeY80AndteFAgKykWGeP3dbcyoXoFIi1SyPDtKNxtUi3JhqlPZY7PYVx7TQxo+3I3gz0jiywoHUkR/toPVko/0WuVLtc6VMMKqqi6o55yqcFq3zs285ru2GM/sUAC9hwnJOCmhmsRAekJaLHYC9oOFmLTPH7Hcoo2fjGaYcrggrZKbpxKx8NUGoFv+exmweNOvCOoDbmiixOBKMTojn4Z/Z2HZ91nErDPhlJExdVvgapcGUBZcwtMtYeTbJrkNXlO09HG9j0VcPMgekbbGL57X1TceHO87g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=E31i4+n2; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=andersson@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=E31i4+n2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=andersson@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XdDZ45xWPz2xlF;
	Wed, 30 Oct 2024 02:24:12 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A19205C55E2;
	Tue, 29 Oct 2024 15:23:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C660FC4CECD;
	Tue, 29 Oct 2024 15:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730215448;
	bh=OnfPNjPFcprKl1sN97TkhOv/xNK+Q/zpiKD+oNhDMSk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E31i4+n2VfP73VqUtiK+gGGwGyJPG/gqLdz1F/Xn8gtzgIte2GFbSrzS2tWamSxWl
	 9Zw0YDHmBYpciQUj3b95NnqAHMns0WZL/efHJoyMUe+TT5Av6j75+LIOn2d10jG2Sa
	 Y/wGc+s3uqYoxSChwozTI4vlkJhehj9XoxmAnsXi9m/WRyrUAexAyJpLI7kZGMq9cI
	 Jv7t9zvjRKrRJHu6S4D0XxbuREDxDww2gja2p+62K9u14TvqnkkJV5ZTCLzYcENc29
	 ekLAvwOCsdlxLy8apvJqWVnUINaro65w+MkYq8mkZm8f4/4hV8Vcja9W6w98QyEBGi
	 YG75XcuK7bCvw==
Date: Tue, 29 Oct 2024 10:24:02 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Herve Codina <herve.codina@bootlin.com>, 
	Qiang Zhao <qiang.zhao@nxp.com>, Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>, 
	Huisong Li <lihuisong@huawei.com>, Linus Walleij <linusw@kernel.org>, 
	Imre Kaloz <kaloz@openwrt.org>, Karol Gugala <kgugala@antmicro.com>, 
	Mateusz Holenko <mholenko@antmicro.com>, Gabriel Somlo <gsomlo@gmail.com>, 
	Yinbo Zhu <zhuyinbo@loongson.cn>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Nishanth Menon <nm@ti.com>, 
	Santosh Shilimkar <ssantosh@kernel.org>, Michal Simek <michal.simek@amd.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Duje =?utf-8?Q?Mihanovi=C4=87?= <duje.mihanovic@skole.hr>, 
	Mark Brown <broonie@kernel.org>, David Wu <david.wu@rock-chips.com>, 
	Jianqun Xu <jay.xu@rock-chips.com>, Jay Buddhabhatti <jay.buddhabhatti@amd.com>, 
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>, Izhar Ameer Shaikh <izhar.ameer.shaikh@amd.com>, 
	Naman Trivedi Manojbhai <naman.trivedimanojbhai@amd.com>, linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	loongarch@lists.linux.dev, linux-mediatek@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-pm@vger.kernel.org
Subject: Re: [PATCH] soc: Switch back to struct platform_driver::remove()
Message-ID: <7iufjf4cnoofq63vtzrnlxneyjhmuhuaq2tqflzw6nc6xpixiu@dnyh4etii2vz>
References: <20241029074859.509587-2-u.kleine-koenig@baylibre.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241029074859.509587-2-u.kleine-koenig@baylibre.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, Oct 29, 2024 at 08:48:58AM GMT, Uwe Kleine-König wrote:
> After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
> return void") .remove() is (again) the right callback to implement for
> platform drivers.
> 
> Convert all platform drivers below drivers/soc to use .remove(), with
> the eventual goal to drop struct platform_driver::remove_new(). As
> .remove() and .remove_new() have the same prototypes, conversion is done
> by just changing the structure member name in the driver initializer.
> 
> On the way do a few whitespace changes to make indention consistent.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>

Acked-by: Bjorn Andersson <andersson@kernel.org> # qcom parts

Regards,
Bjorn

