Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E90B7627AB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jul 2023 02:14:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RK+5U9OH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R9ZCP07C8z3ccP
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jul 2023 10:14:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RK+5U9OH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R9SY06CKrz3bf6
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jul 2023 05:59:32 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9F545618F4
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 19:59:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C7ABC43140
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 19:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690315169;
	bh=jVkGbzOh79AEXIeMVY1s/WgLpPOOReQVmsy9pu11HgA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=RK+5U9OHGM5kVctFC0fXVoH/MPRkxl3yqjH0JkiqY14J62a84cAuHHldU+QJmZwJw
	 m+XqPzyLakTqHV2HXVcWKWGF1mJiOi483ksql83UAjacp2W+449PAc1Gy7ne7EwyeR
	 MsoU56g+i2jjsXGJeJINbc52BCaV8HU0tYJJ7er833v7XkogTWiQi1fNS2kICYDa74
	 P8CPb6B9Topo5JelE0Q1Pj/c79T5XDlopvnCrd/HqoNTziMh4A4pI0EHt0afJyJ7vk
	 ha8zpcp3YQiQ9ilYgEvI8y/bppIY1jkW6W5qaFxm4Z0AGFxqSgeeGZwG6UB78Vkakt
	 mzVNJZl4/0d6w==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2b734aea34aso86977231fa.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 12:59:29 -0700 (PDT)
X-Gm-Message-State: ABy/qLa4P4+KIa8agEb6f447t0bA+aJbkroGX0rLWluwmXJj9z0++CVx
	XsFQMXENUfwF9bqqCwr4SnU+RsAmzKficwVySA==
X-Google-Smtp-Source: APBJJlFwGjXaJCJydGIeGV4iVYCIq6ysqPH1CxKSwb/h2lZDdMtrrV65McGRvNB57SLo+rUN/j76IhUhQXfq96gAGDg=
X-Received: by 2002:a2e:8786:0:b0:2b6:dd26:c02a with SMTP id
 n6-20020a2e8786000000b002b6dd26c02amr8693672lji.14.1690315146580; Tue, 25 Jul
 2023 12:59:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230724212222.809909-1-robh@kernel.org> <ZMAD25Yp6gCNq+wH@corigine.com>
In-Reply-To: <ZMAD25Yp6gCNq+wH@corigine.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 25 Jul 2023 13:58:54 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+UYF79tUWvHh=5AfrERJPvFRaV4vh1mnbYn_nNjOQTcw@mail.gmail.com>
Message-ID: <CAL_Jsq+UYF79tUWvHh=5AfrERJPvFRaV4vh1mnbYn_nNjOQTcw@mail.gmail.com>
Subject: Re: [PATCH v2] net: Explicitly include correct DT includes
To: Simon Horman <simon.horman@corigine.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 26 Jul 2023 10:11:06 +1000
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
Cc: Kevin Brace <kevinbrace@bracecomputerlab.com>, A ndrew Lunn <andrew@lunn.ch>, Iyappan Subramanian <iyappan@os.amperecomputing.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, Jonathan Hunter <jonathanh@nvidia.com>, Horatiu Vultur <horatiu.vultur@microchip.com>, Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>, Jerome Brunet <jbrunet@baylibre.com>, Samuel Holland <samuel@sholland.org>, Sean Anderson <sean.anderson@seco.com>, Kevin Hilman <khilman@baylibre.com>, Madalin Bucur <madalin.bucur@nxp.com>, Jose Abreu <joabreu@synopsys.com>, NXP Linux Team <linux-imx@nxp.com>, Mark Lee <Mark-MC.Lee@mediatek.com>, Sascha Hauer <s.hauer@pengutronix.de>, linux-omap@vger.kernel.org, Alex Elder <elder@kernel.org>, Douglas Miller <dougmill@linux.ibm.com>, linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>, linux-wpan@vger.kernel.org, Claudiu Beznea <claudiu.beznea@microchip.com>, Alexandre Belloni <alexandre.bello
 ni@bootlin.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Chris Snook <chris.snook@gmail.com>, Eric Dumazet <edumazet@google.com>, Thierry Reding <thierry.reding@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, Stefan Schmidt <stefan@datenfreihafen.org>, Yisen Zhuang <yisen.zhuang@huawei.com>, Steve Glendinning <steve.glendinning@shawell.net>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-arm-msm@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, Claudiu Manoil <claudiu.manoil@nxp.com>, linux-amlogic@lists.infradead.org, Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org, Mirko Lindner <mlindner@marvell.com>, Neil Armstrong <neil.armstrong@linaro.org>, UNGLinuxDriver@microchip.com, linux-renesas-soc@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-mediatek@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>, Taras Chorny i <taras.chornyi@plvision.eu>, Emil Renner Berthing <kernel@esmil.dk>, Andreas 
 Larsson <andreas@gaisler.com>, linux-tegra@vger.kernel.org, Giuseppe Cavallaro <peppe.cavallaro@st.com>, Fabio Estevam <festevam@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Shenwei Wang <shenwei.wang@nxp.com>, Samin Guo <samin.guo@starfivetech.com>, Francois Romieu <romieu@fr.zoreil.com>, Paolo Abeni <pabeni@redhat.com>, Lorenzo Bianconi <lorenzo@kernel.org>, Grygorii Strashko <grygorii.strashko@ti.com>, Bhupesh Sharma <bhupesh.sharma@linaro.org>, John Crispin <john@phrozen.org>, Salil Mehta <salil.mehta@huawei.com>, Sergey Shtylyov <s.shtylyov@omp.ru>, Timur Tabi <timur@kernel.org>, linux-sunxi@lists.linux.dev, linux-oxnas@groups.io, Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>, Alexander Aring <alex.aring@gmail.com>, Vladimir Oltean <vladimir.oltean@nxp.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Russell King <linux@armlinux.org.uk>, Clark Wang <xiaoning.wang@nxp.com>, Alex Elder <elder@linaro.org>, Ja
 kub Kicinski <kuba@kernel.org>, Richard Cochran <richardcochran@gmail.com>, Keyur Chudgar <keyur@os.amperecomputing.com>, Wei Fang <wei.fang@nxp.com>, Matthias Brugger <matthias.bgg@gmail.com>, Marcin Wojtas <mw@semihalf.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, Nicolas Ferre <nicolas.ferre@microchip.com>, Li Yang <leoyang.li@nxp.com>, Stephen Hemminger <stephen@networkplumber.org>, Vinod Koul <vkoul@kernel.org>, linuxppc-dev@lists.ozlabs.org, Felix Fietkau <nbd@nbd.name>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 25, 2023 at 11:18=E2=80=AFAM Simon Horman <simon.horman@corigin=
e.com> wrote:
>
> On Mon, Jul 24, 2023 at 03:22:16PM -0600, Rob Herring wrote:
>
> ...
>
> >  90 files changed, 88 insertions(+), 92 deletions(-)
>
> Hi Rob,
>
> I suppose that it's reasonable to take this patch through netdev.
> But it does have a pretty wide surface, and netdev moves a lot.
>
> As it stands the patch doesn't apply due to a conflict
> in dwmac-qcom-ethqos.c

It did yesterday... Anyways, looks like 0-day decided to find something els=
e.

Rob
