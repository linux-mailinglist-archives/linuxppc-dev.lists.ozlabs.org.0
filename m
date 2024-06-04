Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BD35A8FA809
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2024 04:01:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VtYk16hPwz3fmj
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2024 12:01:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.187; helo=szxga01-in.huawei.com; envelope-from=chengzhihao1@huawei.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 1146 seconds by postgrey-1.37 at boromir; Tue, 04 Jun 2024 11:58:00 AEST
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VtYdh5Xjlz3d9v
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Jun 2024 11:57:57 +1000 (AEST)
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4VtY6M5szWzwRV0;
	Tue,  4 Jun 2024 09:34:19 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id 7C016180069;
	Tue,  4 Jun 2024 09:38:14 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 4 Jun 2024 09:38:02 +0800
Subject: Re: [PATCH v1 1/1] treewide: Align match_string() with
 sysfs_match_string()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, "Rafael J. Wysocki"
	<rafael.j.wysocki@intel.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Corey Minyard <minyard@acm.org>, Allen Pais
	<apais@linux.microsoft.com>, Sebastian Reichel
	<sebastian.reichel@collabora.com>, Perry Yuan <perry.yuan@amd.com>, Giovanni
 Cabiddu <giovanni.cabiddu@intel.com>, Herbert Xu
	<herbert@gondor.apana.org.au>, Nuno Sa <nuno.sa@analog.com>, Guenter Roeck
	<linux@roeck-us.net>, Randy Dunlap <rdunlap@infradead.org>, Andi Shyti
	<andi.shyti@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>, Lee Jones
	<lee@kernel.org>, Samuel Holland <samuel@sholland.org>, Elad Nachman
	<enachman@marvell.com>, Arseniy Krasnov <AVKrasnov@sberdevices.ru>, Johannes
 Berg <johannes.berg@intel.com>, Gregory Greenman
	<gregory.greenman@intel.com>, Benjamin Berg <benjamin.berg@intel.com>, Bjorn
 Helgaas <bhelgaas@google.com>, Robert Richter <rrichter@amd.com>, Vinod Koul
	<vkoul@kernel.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Linus Walleij
	<linus.walleij@linaro.org>, Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>, Nikita
 Kravets <teackot@gmail.com>, Jiri Slaby <jirislaby@kernel.org>, Srinivas
 Pandruvada <srinivas.pandruvada@linux.intel.com>, Stanley Chang
	<stanley_chang@realtek.com>, Heikki Krogerus
	<heikki.krogerus@linux.intel.com>, Abdel Alkuor <abdelalkuor@geotab.com>,
	Kent Overstreet <kent.overstreet@linux.dev>, Eric Biggers
	<ebiggers@google.com>, Kees Cook <keescook@chromium.org>, Ingo Molnar
	<mingo@kernel.org>, "Steven Rostedt (Google)" <rostedt@goodmis.org>, Daniel
 Bristot de Oliveira <bristot@kernel.org>, Andrew Morton
	<akpm@linux-foundation.org>, Hugh Dickins <hughd@google.com>, Abel Wu
	<wuyun.abel@bytedance.com>, John Johansen <john.johansen@canonical.com>, Mimi
 Zohar <zohar@linux.ibm.com>, Stefan Berger <stefanb@linux.ibm.com>, Roberto
 Sassu <roberto.sassu@huawei.com>, Eric Snowberg <eric.snowberg@oracle.com>,
	Takashi Iwai <tiwai@suse.de>, Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, Mark Brown
	<broonie@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<keyrings@vger.kernel.org>, <linux-crypto@vger.kernel.org>,
	<linux-acpi@vger.kernel.org>, <linux-ide@vger.kernel.org>,
	<openipmi-developer@lists.sourceforge.net>, <linux-clk@vger.kernel.org>,
	<linux-rpi-kernel@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-rockchip@lists.infradead.org>,
	<linux-tegra@vger.kernel.org>, <linux-pm@vger.kernel.org>,
	<qat-linux@intel.com>, <dri-devel@lists.freedesktop.org>,
	<intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
	<nouveau@lists.freedesktop.org>, <linux-hwmon@vger.kernel.org>,
	<linux-i2c@vger.kernel.org>, <linux-leds@vger.kernel.org>,
	<linux-sunxi@lists.linux.dev>, <linux-omap@vger.kernel.org>,
	<linux-mmc@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
	<netdev@vger.kernel.org>, <linux-wireless@vger.kernel.org>,
	<linux-pci@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<linux-phy@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
	<platform-driver-x86@vger.kernel.org>, <linux-staging@lists.linux.dev>,
	<linux-usb@vger.kernel.org>, <linux-fbdev@vger.kernel.org>,
	<linux-bcachefs@vger.kernel.org>, <linux-hardening@vger.kernel.org>,
	<cgroups@vger.kernel.org>, <linux-trace-kernel@vger.kernel.org>,
	<linux-mm@kvack.org>, <apparmor@lists.ubuntu.com>,
	<linux-security-module@vger.kernel.org>, <linux-integrity@vger.kernel.org>,
	<alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>
References: <20240603211538.289765-1-andriy.shevchenko@linux.intel.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <a6cff4d3-821a-3723-b261-3699053b5a51@huawei.com>
Date: Tue, 4 Jun 2024 09:37:50 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20240603211538.289765-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="gbk"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemm600013.china.huawei.com (7.193.23.68)
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
Cc: Juri Lelli <juri.lelli@redhat.com>, Andrew Lunn <andrew@lunn.ch>, Prashant Gaikwad <pgaikwad@nvidia.com>, Heiko Stuebner <heiko@sntech.de>, "Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, Jaroslav Kysela <perex@perex.cz>, Ben Segall <bsegall@google.com>, Pavel Machek <pavel@ucw.cz>, Miquel Raynal <miquel.raynal@bootlin.com>, Kishon Vijay Abraham I <kishon@kernel.org>, Vincent Guittot <vincent.guittot@linaro.org>, James Morris <jmorris@namei.org>, Tvrtko Ursulin <tursulin@ursulin.net>, Danilo Krummrich <dakr@redhat.com>, Mel Gorman <mgorman@suse.de>, Jean Delvare <jdelvare@suse.com>, Potnuri Bharat Teja <bharat@chelsio.com>, Nicholas Piggin <npiggin@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Dietmar Eggemann <dietmar.eggemann@arm.com>, Scott Branden <sbranden@broadcom.com>, Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Masami Hiramatsu <mhiramat@kernel.org>, "Gautham R.
 Shenoy" <gautham.shenoy@amd.com>, Tejun Heo <tj@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, Lukasz Luba <lukasz.luba@arm.com>, Zefan Li <lizefan.x@bytedance.com>, Dave Hansen <dave.hansen@linux.intel.com>, Clemens Ladisch <clemens@ladisch.de>, Liam Girdwood <lgirdwood@gmail.com>, Hu Ziji <huziji@marvell.com>, Eric Dumazet <edumazet@google.com>, Thierry Reding <thierry.reding@gmail.com>, Oliver O'Halloran <oohall@gmail.com>, Mario Limonciello <mario.limonciello@amd.com>, Valentin Schneider <vschneid@redhat.com>, Paul Moore <paul@paul-moore.com>, Gregory Clement <gregory.clement@bootlin.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Jonathan Hunter <jonathanh@nvidia.com>, Len Brown <lenb@kernel.org>, Brian Foster <bfoster@redhat.com>, Maxime Ripard <mripard@kernel.org>, Jason Baron <jbaron@akamai.com>, Jani Nikula <jani.nikula@linux.intel.com>, Stephen Boyd <sboyd@kernel.org>, Daniel Bristot de Oliveira <bristot@redhat.com>, Miri Korenblit <miriam.rachel.korenblit@
 intel.com>, Ulf Hansson <ulf.hansson@linaro.org>, Karol Herbst <kherbst@redhat.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Michael Turquette <mturquette@baylibre.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Peter Zijlstra <peterz@infradead.org>, Chen-Yu Tsai <wens@csie.org>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, "Naveen
 N. Rao" <naveen.n.rao@linux.ibm.com>, Paolo Abeni <pabeni@redhat.com>, "Serge E. Hallyn" <serge@hallyn.com>, Lyude Paul <lyude@redhat.com>, Ray Jui <rjui@broadcom.com>, Damien Le Moal <dlemoal@kernel.org>, Borislav Petkov <bp@alien8.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Sergey Shtylyov <s.shtylyov@omp.ru>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Sebastian Reichel <sre@kernel.org>, Daniel Scally <djrscally@gmail.com>, JC Kuo <jckuo@nvidia.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, "David S. Miller" <davem@davemloft.net>, Vignesh Raghavendra <vigneshr@ti.com>, Tony Lindgren <tony@atomide.com>, Takashi Iwai <tiwai@suse.com>, David Howells <dhowells@redhat.com>, Niklas Cassel <cassel@kernel.org>, Huang Rui <ray.huang@amd.com>, "H. Peter Anvin" <hpa@zytor.com>, David Airlie <airlied@gmail.com>, Jim Cromie <jim.cromie@gmail.com>, Florian Fainelli <florian.fainelli@broadcom.com>, Richard Weinberger <richard@nod.at>, x86@kernel.org, Ingo Molnar <mingo@redhat.com>, Jakub Kici
 nski <kuba@kernel.org>, Zhang Rui <rui.zhang@intel.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>, Kalle Valo <kvalo@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Adrian Hunter <adrian.hunter@intel.com>, Daniel Vetter <daniel@ffwll.ch>, Johannes Weiner <hannes@cmpxchg.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Helge Deller <deller@gmx.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

ÔÚ 2024/6/2 23:57, Andy Shevchenko Ð´µÀ:
> Make two APIs look similar. Hence convert match_string() to be
> a 2-argument macro. In order to avoid unneeded churn, convert
> all users as well. There is no functional change intended.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> 
> Compile tested with `make allyesconfig` and `make allmodconfig`
> on x86_64, arm, aarch64, powerpc64 (8 builds total).
> 

[...]
> diff --git a/fs/ubifs/auth.c b/fs/ubifs/auth.c
> index a4a0158f712d..fc0da18bfa65 100644
> --- a/fs/ubifs/auth.c
> +++ b/fs/ubifs/auth.c
> @@ -264,13 +264,13 @@ int ubifs_init_authentication(struct ubifs_info *c)
>   		return -EINVAL;
>   	}
>   
> -	c->auth_hash_algo = match_string(hash_algo_name, HASH_ALGO__LAST,
> -					 c->auth_hash_name);
> -	if ((int)c->auth_hash_algo < 0) {
> +	err = __match_string(hash_algo_name, HASH_ALGO__LAST, c->auth_hash_name);
> +	if (err < 0) {
>   		ubifs_err(c, "Unknown hash algo %s specified",
>   			  c->auth_hash_name);
> -		return -EINVAL;
> +		return err;
>   	}
> +	c->auth_hash_algo = err;
>   
>   	snprintf(hmac_name, CRYPTO_MAX_ALG_NAME, "hmac(%s)",
>   		 c->auth_hash_name);

Reviewed-by: Zhihao Cheng <chengzhihao1@huawei.com>  # fs/ubifs
