Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA708FA808
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2024 04:01:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bnlgXxEM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VtYjY2gLvz3dTH
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2024 12:01:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bnlgXxEM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=dlemoal@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VtY1S3yR2z3dJ9
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Jun 2024 11:30:04 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DFC22611CC;
	Tue,  4 Jun 2024 01:30:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79DCCC2BD10;
	Tue,  4 Jun 2024 01:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717464601;
	bh=+0MwbPrNLjHstEP7nUmI9nU5cr+C1uEqCmU+IfVJhBs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bnlgXxEMpTvmKahSPWzVW2eioXzJ7InXnLcF2Rs1JSkMfQA93wXQBY9/XKuZVVXJi
	 oeHmsD31IY3HyHMYtTD7PSrvj9S1H3KP04TKlWZzgFGXGWPDdoy6u+l15hTWpd+gzW
	 rrkqErwJ5iAh1ROObeeg8gEUmGPLn4HkWiomXClAUEV1Ygn9FUP+Qbw+IPeT8+Ws56
	 I8+zq8Wdj1Ege6tKvptsdljRUJrjovlC8dK+XkPQEaDh/6yi5A2iz8Lc911AkK3iVQ
	 9J/Qo4EvtrUegklsv+qidHqtelitfCS46Jvgeoe5elf4+5tozjA1SGSUxdf7rn2IsA
	 VjsM2fsbxxo3g==
Message-ID: <3f98a7da-19c8-4e91-94d7-e8256cc0cb1e@kernel.org>
Date: Tue, 4 Jun 2024 10:29:35 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] treewide: Align match_string() with
 sysfs_match_string()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Corey Minyard <minyard@acm.org>, Allen Pais <apais@linux.microsoft.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Perry Yuan <perry.yuan@amd.com>,
 Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Nuno Sa <nuno.sa@analog.com>,
 Guenter Roeck <linux@roeck-us.net>, Randy Dunlap <rdunlap@infradead.org>,
 Andi Shyti <andi.shyti@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>,
 Lee Jones <lee@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Elad Nachman <enachman@marvell.com>,
 Arseniy Krasnov <AVKrasnov@sberdevices.ru>,
 Johannes Berg <johannes.berg@intel.com>,
 Gregory Greenman <gregory.greenman@intel.com>,
 Benjamin Berg <benjamin.berg@intel.com>, Bjorn Helgaas
 <bhelgaas@google.com>, Robert Richter <rrichter@amd.com>,
 Vinod Koul <vkoul@kernel.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Linus Walleij <linus.walleij@linaro.org>, Hans de Goede
 <hdegoede@redhat.com>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, Nikita Kravets <teackot@gmail.com>,
 Jiri Slaby <jirislaby@kernel.org>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Stanley Chang <stanley_chang@realtek.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Abdel Alkuor <abdelalkuor@geotab.com>,
 Kent Overstreet <kent.overstreet@linux.dev>,
 Eric Biggers <ebiggers@google.com>, Kees Cook <keescook@chromium.org>,
 Ingo Molnar <mingo@kernel.org>, "Steven Rostedt (Google)"
 <rostedt@goodmis.org>, Daniel Bristot de Oliveira <bristot@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Hugh Dickins <hughd@google.com>,
 Abel Wu <wuyun.abel@bytedance.com>,
 John Johansen <john.johansen@canonical.com>, Mimi Zohar
 <zohar@linux.ibm.com>, Stefan Berger <stefanb@linux.ibm.com>,
 Roberto Sassu <roberto.sassu@huawei.com>,
 Eric Snowberg <eric.snowberg@oracle.com>, Takashi Iwai <tiwai@suse.de>,
 Takashi Sakamoto <o-takashi@sakamocchi.jp>,
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 Mark Brown <broonie@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 keyrings@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-acpi@vger.kernel.org, linux-ide@vger.kernel.org,
 openipmi-developer@lists.sourceforge.net, linux-clk@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-pm@vger.kernel.org, qat-linux@intel.com,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-hwmon@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-leds@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-omap@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-mtd@lists.infradead.org, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-gpio@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-usb@vger.kernel.org,
 linux-fbdev@vger.kernel.org, linux-bcachefs@vger.kernel.org,
 linux-hardening@vger.kernel.org, cgroups@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-mm@kvack.org,
 apparmor@lists.ubuntu.com, linux-security-module@vger.kernel.org,
 linux-integrity@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org
References: <20240603211538.289765-1-andriy.shevchenko@linux.intel.com>
From: Damien Le Moal <dlemoal@kernel.org>
Content-Language: en-US
Organization: Western Digital Research
In-Reply-To: <20240603211538.289765-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 04 Jun 2024 12:00:46 +1000
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
Cc: Juri Lelli <juri.lelli@redhat.com>, Andrew Lunn <andrew@lunn.ch>, Prashant Gaikwad <pgaikwad@nvidia.com>, Heiko Stuebner <heiko@sntech.de>, "Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, Jaroslav Kysela <perex@perex.cz>, Ben Segall <bsegall@google.com>, Pavel Machek <pavel@ucw.cz>, Miquel Raynal <miquel.raynal@bootlin.com>, Kishon Vijay Abraham I <kishon@kernel.org>, Vincent Guittot <vincent.guittot@linaro.org>, James Morris <jmorris@namei.org>, Tvrtko Ursulin <tursulin@ursulin.net>, Danilo Krummrich <dakr@redhat.com>, Mel Gorman <mgorman@suse.de>, Jean Delvare <jdelvare@suse.com>, Potnuri Bharat Teja <bharat@chelsio.com>, Nicholas Piggin <npiggin@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Zhihao Cheng <chengzhihao1@huawei.com>, Dietmar Eggemann <dietmar.eggemann@arm.com>, Scott Branden <sbranden@broadcom.com>, Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Masami Hiramatsu <mhiramat@kernel.org>, "
 Gautham R. Shenoy" <gautham.shenoy@amd.com>, Tejun Heo <tj@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, Lukasz Luba <lukasz.luba@arm.com>, Zefan Li <lizefan.x@bytedance.com>, Dave Hansen <dave.hansen@linux.intel.com>, Clemens Ladisch <clemens@ladisch.de>, Liam Girdwood <lgirdwood@gmail.com>, Hu Ziji <huziji@marvell.com>, Eric Dumazet <edumazet@google.com>, Thierry Reding <thierry.reding@gmail.com>, Oliver O'Halloran <oohall@gmail.com>, Mario Limonciello <mario.limonciello@amd.com>, Valentin Schneider <vschneid@redhat.com>, Paul Moore <paul@paul-moore.com>, Gregory Clement <gregory.clement@bootlin.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Jonathan Hunter <jonathanh@nvidia.com>, Len Brown <lenb@kernel.org>, Brian Foster <bfoster@redhat.com>, Maxime Ripard <mripard@kernel.org>, Jason Baron <jbaron@akamai.com>, Jani Nikula <jani.nikula@linux.intel.com>, Stephen Boyd <sboyd@kernel.org>, Daniel Bristot de Oliveira <bristot@redhat.com>, Miri Korenblit <miriam.rachel
 .korenblit@intel.com>, Ulf Hansson <ulf.hansson@linaro.org>, Karol Herbst <kherbst@redhat.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Michael Turquette <mturquette@baylibre.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Peter Zijlstra <peterz@infradead.org>, Chen-Yu Tsai <wens@csie.org>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Paolo Abeni <pabeni@redhat.com>, "Serge E. Hallyn" <serge@hallyn.com>, Lyude Paul <lyude@redhat.com>, Ray Jui <rjui@broadcom.com>, Borislav Petkov <bp@alien8.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Sergey Shtylyov <s.shtylyov@omp.ru>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Sebastian Reichel <sre@kernel.org>, Daniel Scally <djrscally@gmail.com>, JC Kuo <jckuo@nvidia.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, "David S. Miller" <davem@davemloft.net>, Vignesh Raghavendra <vigneshr@ti.com>, Tony L
 indgren <tony@atomide.com>, Takashi Iwai <tiwai@suse.com>, David Howells <dhowells@redhat.com>, Niklas Cassel <cassel@kernel.org>, Huang Rui <ray.huang@amd.com>, "H. Peter Anvin" <hpa@zytor.com>, David Airlie <airlied@gmail.com>, Jim Cromie <jim.cromie@gmail.com>, Florian Fainelli <florian.fainelli@broadcom.com>, Richard Weinberger <richard@nod.at>, x86@kernel.org, Ingo Molnar <mingo@redhat.com>, Jakub Kicinski <kuba@kernel.org>, Zhang Rui <rui.zhang@intel.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>, Kalle Valo <kvalo@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Adrian Hunter <adrian.hunter@intel.com>, Daniel Vetter <daniel@ffwll.ch>, Johannes Weiner <hannes@cmpxchg.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Helge Deller <deller@gm
 x.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 6/3/24 00:57, Andy Shevchenko wrote:
> Make two APIs look similar. Hence convert match_string() to be
> a 2-argument macro. In order to avoid unneeded churn, convert
> all users as well. There is no functional change intended.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---

[...]

> diff --git a/drivers/ata/pata_hpt366.c b/drivers/ata/pata_hpt366.c
> index bdccd1ba1524..8134f9290791 100644
> --- a/drivers/ata/pata_hpt366.c
> +++ b/drivers/ata/pata_hpt366.c
> @@ -178,7 +178,7 @@ static int hpt_dma_blacklisted(const struct ata_device *dev, char *modestr,
>  
>  	ata_id_c_string(dev->id, model_num, ATA_ID_PROD, sizeof(model_num));
>  
> -	i = match_string(list, -1, model_num);
> +	i = __match_string(list, -1, model_num);
>  	if (i >= 0) {
>  		ata_dev_warn(dev, "%s is not supported for %s\n", modestr, list[i]);
>  		return 1;
> diff --git a/drivers/ata/pata_hpt37x.c b/drivers/ata/pata_hpt37x.c
> index c0329cf01135..2d0b659bbd65 100644
> --- a/drivers/ata/pata_hpt37x.c
> +++ b/drivers/ata/pata_hpt37x.c
> @@ -226,7 +226,7 @@ static int hpt_dma_blacklisted(const struct ata_device *dev, char *modestr,
>  
>  	ata_id_c_string(dev->id, model_num, ATA_ID_PROD, sizeof(model_num));
>  
> -	i = match_string(list, -1, model_num);
> +	i = __match_string(list, -1, model_num);
>  	if (i >= 0) {
>  		ata_dev_warn(dev, "%s is not supported for %s\n",
>  			     modestr, list[i]);

Looks good to me.

Acked-by: Damien Le Moal <dlemoal@kernel.org>	# drivers/ata/

-- 
Damien Le Moal
Western Digital Research

