Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF7992F259
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jul 2024 00:56:27 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=AuPvm2HY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WKqpd01sgz3fV3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jul 2024 08:56:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=AuPvm2HY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sang-engineering.com (client-ip=194.117.254.33; helo=mail.zeus03.de; envelope-from=wsa+renesas@sang-engineering.com; receiver=lists.ozlabs.org)
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WKcwF24ZZz3cFN
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Jul 2024 00:45:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=X/Vu
	s3odAr0nVoUkxLttzX7Pk94wValiSx+VwO4R69w=; b=AuPvm2HYrBBxPCRmojQD
	7CRnGb08OzEAMIGsRtGo1cADF0LX2II9QCJrZUl8IaFo/ZZrZu7J+SrEBWtj60Pv
	1FkcrDPS/qIZnwEyGkXZcTAvUt2AcDbXPu9bRoCsRQVJ3yq7hI4gN1/pRnYBoxmm
	LrVreSCYG9WfR6AIcwartOTLwI8fldcBkiqrbY/9wh/UHI5zzHySLqznxmN0E27e
	CL+TVhOO2A9S47NlInzK62SsP9b7IiXAGum0KbJErYmlY66z9pmjZt/lJ/IEYVUY
	0s8pI4FRRnO0k8J6sY5OSdOg4ouZH//OI4WOka5wh84Dzu3nFqTCzDfn3u4TXjEA
	qA==
Received: (qmail 877093 invoked from network); 11 Jul 2024 16:45:16 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 11 Jul 2024 16:45:16 +0200
X-UD-Smtp-Session: l3s3148p1@33mez/kc+ORehhtW
Date: Thu, 11 Jul 2024 16:45:15 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andi Shyti <andi.shyti@kernel.org>
Subject: Re: [PATCH v2 00/60] i2c: reword first drivers according to newest
 specification
Message-ID: <Zo_v-xk3Hh_88sNa@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
	Ajay Gupta <ajayg@nvidia.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
	Andrew Lunn <andrew@lunn.ch>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	asahi@lists.linux.dev, Baolin Wang <baolin.wang@linux.alibaba.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Baruch Siach <baruch@tkos.co.il>,
	Bence =?utf-8?B?Q3PDs2vDoXM=?= <bence98@sch.bme.hu>,
	Benson Leung <bleung@chromium.org>,
	Binbin Zhou <zhoubinbin@loongson.cn>, Chen-Yu Tsai <wens@csie.org>,
	Chris Brandt <chris.brandt@renesas.com>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	chrome-platform@lists.linux.dev,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Conghui Chen <conghui.chen@intel.com>,
	Eddie James <eajames@linux.ibm.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Hans de Goede <hdegoede@redhat.com>, Hans Hu <hanshu@zhaoxin.com>,
	Hector Martin <marcan@marcan.st>, Heiko Stuebner <heiko@sntech.de>,
	Jean Delvare <jdelvare@suse.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jochen Friedrich <jochen@scram.de>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kamal Dasu <kamal.dasu@broadcom.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	linux-actions@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michael Shych <michaelsh@nvidia.com>, openbmc@lists.ozlabs.org,
	Orson Zhai <orsonzhai@gmail.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Peter Korsgaard <peter@korsgaard.com>,
	Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
	Ray Jui <rjui@broadcom.com>, Robert Richter <rric@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Scott Branden <sbranden@broadcom.com>, Stefan Roese <sr@denx.de>,
	Sven Peter <sven@svenpeter.dev>,
	Thierry Reding <thierry.reding@gmail.com>,
	Thor Thayer <thor.thayer@linux.intel.com>,
	Till Harbaum <till@harbaum.org>,
	Vadim Pasternak <vadimp@nvidia.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	virtualization@lists.linux.dev, Vladimir Zapolskiy <vz@mleia.com>,
	Yicong Yang <yangyicong@hisilicon.com>
References: <20240706112116.24543-1-wsa+renesas@sang-engineering.com>
 <nbi3fngfcipt35gzguk2mh4zzh3vy5a5gsk7dti5smm2iimytl@drm7p2iqsinp>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Vk6JWgUmE7mz+Biu"
Content-Disposition: inline
In-Reply-To: <nbi3fngfcipt35gzguk2mh4zzh3vy5a5gsk7dti5smm2iimytl@drm7p2iqsinp>
X-Mailman-Approved-At: Fri, 12 Jul 2024 08:54:28 +1000
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
Cc: Andrew Lunn <andrew@lunn.ch>, Baruch Siach <baruch@tkos.co.il>, Heiko Stuebner <heiko@sntech.de>, Ajay Gupta <ajayg@nvidia.com>, Viresh Kumar <viresh.kumar@linaro.org>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Eddie James <eajames@linux.ibm.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>, Matthias Brugger <matthias.bgg@gmail.com>, Chris Brandt <chris.brandt@renesas.com>, Thierry Reding <thierry.reding@gmail.com>, linux-i2c@vger.kernel.org, Kamal Dasu <kamal.dasu@broadcom.com>, Benson Leung <bleung@chromium.org>, Stefan Roese <sr@denx.de>, linux-stm32@st-md-mailman.stormreply.com, chrome-platform@lists.linux.dev, Peter Korsgaard <peter@korsgaard.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Florian Fainelli <florian.fainelli@broadcom.com>, Samuel Holland <samuel@sholland.org>, Binbin Zhou <zhoubinbin@loongson.cn>, Chunyan Zhang <zhang.lyra@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>, Sven Peter <sven@svenpeter.dev>, Jernej Skrabec <jernej.skrabec@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>, Ray Jui <rjui@broadcom.com>, Alain Volmat <alain.volmat@foss.st.com>, linux-sunxi@lists.linux.dev, Guenter Roeck <linux@roeck-us.net>, Masami Hiramatsu <mhiramat@kernel.org>, Vadim Pasternak <vadimp@nvidia.com>, Jean Delvare <jdelvare@suse.com>, Robert Richter <rric@kernel.org>, Bence =?utf-8?B?Q3PDs2vDoXM=?= <bence98@sch.bme.hu>, Gregory CLEMENT <gregory.clement@bootlin.com>, Hans Hu <hanshu@zhaoxin.com>, linux-actions@lists.infradead.org, virtualization@lists.linux.dev, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Vladimir Zapolskiy <vz@mleia.com>, Hans de Goede <hdegoede@redhat.com>, Chris Packham <chris.packham@alliedtelesis.co.nz>, linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, Baolin Wang <baolin.wang@linux.alibaba.com>, Orson Zhai <orsonzhai@gmail.com>, linux-tegra@vger.kernel.org, Yicong Yang <yangyicong@hisilicon.com>, Conghui Chen <conghui.chen@intel.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Scott Branden <sbranden@broadcom.com>, openbmc@lists.ozlabs.org, Thor Thayer <thor.thayer@linux.intel.com>, Hector Martin <marcan@marcan.st>, linux-kernel@vger.kernel.org, Michael Shych <michaelsh@nvidia.com>, Patrice Chotard <patrice.chotard@foss.st.com>, linux-renesas-soc@vger.kernel.org, asahi@lists.linux.dev, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>, linuxppc-dev@lists.ozlabs.org, Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>, Till Harbaum <till@harbaum.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--Vk6JWgUmE7mz+Biu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Thanks for this big work, at the end it turned out quite nice and
> I'm happy of the outcome!

Me too. And thanks for the enormous review work!


--Vk6JWgUmE7mz+Biu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmaP7/sACgkQFA3kzBSg
Kbbq3A/9FNY+7cgd8CU9HNabmoXmMSCsOVflmaDNapeEn/iIYZUiBBFhDcYnJczI
T429i2bK95+lup88Nhn9fzXQ4hoPFa2TuPkQ5n3M7A9hjFnAOxLmTd91uO98BfVm
8IYBr6EIu/AfX/+D6Rj1Ro1VpSwK4laze5p9WGyNjp6QIzJ+KqmRh+vf9Shg1urk
9gNjTClxMD1OjQ60X0Vr4XmDONnsK8guT/Zkkk1gtDRDC8P92Jw17/3vtuBQnwP6
S1NAFaqvdLbLKuRBsK7KwJ6oJ4sH5jq2LCiJk87GHsXnQBerXSR3AFORTQWjvEBF
6qz8rHh0/GrQklzbs/VgVlqV3NygU4D2T18NZMyLxaJAGPmDPGeL5YvcweblR0TL
yMMuXmSq7ACO+aTJgqIqt2Wx1PS4cbvSmaHUnG52eGrX28o1PgjIW5y0xGu9G5FU
Funcvt0JlI2HtC1FI2FGDsCW77U3mh3U5N5NEo7y24XPebmTVhGifj2kWp/WkA3F
UPgJdkXF0gUzDxQj3Febmvmeh3m58s+Io+3LWBncCK2eRgL4YyEaKpEegQfA43Rl
PJGODikSLI1gh/8qN/WE44DGio65TYItOJrPX3b8VwOQLCgKgwz0y+a37vy2Jd7W
X/LXLwb8txlca1gF88Bg07eWwR/jwNoHp4c/k2C80iwHtJ12Kcg=
=ribe
-----END PGP SIGNATURE-----

--Vk6JWgUmE7mz+Biu--
