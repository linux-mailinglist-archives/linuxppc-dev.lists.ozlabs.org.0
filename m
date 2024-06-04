Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7038FBB27
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2024 20:03:01 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=APlUSuYz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vtz366w8bz3cy8
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jun 2024 04:02:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=APlUSuYz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.12; helo=mgamail.intel.com; envelope-from=sakari.ailus@linux.intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 63 seconds by postgrey-1.37 at boromir; Tue, 04 Jun 2024 18:25:10 AEST
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VtkDQ4ClBz3bdm
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Jun 2024 18:25:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717489512; x=1749025512;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+++E6PT7Ikl/BMgbDWFQCaPzsOD33MgC2YSDizKZxfM=;
  b=APlUSuYz896q2GzQXrV61uF820Xi27VMMV/sHyeosnHNlppYW6WldkiP
   GXLXeJGlv/AyOPfJYZV9CjdCiGIZ4NtKnyuD5h/8+gyqhZRDMUaH1WSXz
   rlkNbgJb8G3nC9xGAkc9+LxJ3Jp9JSpQXG0XR159lgVUWXRqXLq6KxgZY
   pw7drpxQIXDNj4NTNmbY0X0GQFsW31/0PZNGa3nWS+ntmSRUHu5zlQnt4
   6qextkQAKCrV2aQvBSZoJ/wPCz4wa6c7rO53l2dWxe1/D2Ld7hteoD8/K
   Fw9GRYQrr0O1H8BQzNGdEY/jmrj7xdKd3fht7SCfwCF6+CZWU6pResthu
   g==;
X-CSE-ConnectionGUID: ZRAo8tdxSaSni3MEKoqfTg==
X-CSE-MsgGUID: Xy0ZBYumRO6h+D7l6tbG2Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="25418682"
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; 
   d="scan'208";a="25418682"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2024 01:24:02 -0700
X-CSE-ConnectionGUID: QnqcRERvTtiWVVqObAcxXA==
X-CSE-MsgGUID: PnRo7jT/R82Chm81jYLsGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; 
   d="scan'208";a="37030218"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2024 01:23:51 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id E1B7911FA4A;
	Tue,  4 Jun 2024 11:23:48 +0300 (EEST)
Date: Tue, 4 Jun 2024 08:23:48 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 1/1] treewide: Align match_string() with
 sysfs_match_string()
Message-ID: <Zl7PFGprypdZi6ql@kekkonen.localdomain>
References: <20240603211538.289765-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240603211538.289765-1-andriy.shevchenko@linux.intel.com>
X-Mailman-Approved-At: Wed, 05 Jun 2024 03:59:10 +1000
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
Cc: Juri Lelli <juri.lelli@redhat.com>, Andrew Lunn <andrew@lunn.ch>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Heiko Stuebner <heiko@sntech.de>, "Rafael J. Wysocki" <rafael@kernel.org>, Takashi Iwai <tiwai@suse.de>, Viresh Kumar <viresh.kumar@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, dri-devel@lists.freedesktop.org, Jaroslav Kysela <perex@perex.cz>, Ben Segall <bsegall@google.com>, Perry Yuan <perry.yuan@amd.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Pavel Machek <pavel@ucw.cz>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, linux-clk@vger.kernel.org, Kishon Vijay Abraham I <kishon@kernel.org>, Abel Wu <wuyun.abel@bytedance.com>, linux-omap@vger.kernel.org, Vincent Guittot <vincent.guittot@linaro.org>, Karol Herbst <kherbst@redhat.com>, Samuel Holland <samuel@sholland.org>, Sebastian Reichel <sebastian.reichel@collabora.com>, Tvrtko Ursulin <tursulin@ursulin.net>, linux-acpi@vger.kernel.org, Danilo Krummrich <dakr@redhat.com>, Mel Gorman <mgorman@
 suse.de>, linux-sunxi@lists.linux.dev, Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.com>, linux-pm@vger.kernel.org, Potnuri Bharat Teja <bharat@chelsio.com>, James Morris <jmorris@namei.org>, linux-sound@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, platform-driver-x86@vger.kernel.org, Zhihao Cheng <chengzhihao1@huawei.com>, Dietmar Eggemann <dietmar.eggemann@arm.com>, Niklas Cassel <cassel@kernel.org>, Scott Branden <sbranden@broadcom.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, "Gautham R. Shenoy" <gautham.shenoy@amd.com>, Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, Tejun Heo <tj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Elad Nachman <enachman@marvell.com>, Linus Torvalds <torvalds@linux-foundation.org>, Lukasz Luba <lukasz.luba@arm.com>, linux-fbdev@vger.kernel.org, linux-usb@vger.kernel.org, Zefan L
 i <lizefan.x@bytedance.com>, nouveau@lists.freedesktop.org, Dave Hansen <dave.hansen@linux.intel.com>, Clemens Ladisch <clemens@ladisch.de>, Mimi Zohar <zohar@linux.ibm.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Hu Ziji <huziji@marvell.com>, Eric Dumazet <edumazet@google.com>, keyrings@vger.kernel.org, Oliver O'Halloran <oohall@gmail.com>, linux-i2c@vger.kernel.org, Gregory Greenman <gregory.greenman@intel.com>, Ingo Molnar <mingo@kernel.org>, linux-security-module@vger.kernel.org, Valentin Schneider <vschneid@redhat.com>, Corey Minyard <minyard@acm.org>, Gregory Clement <gregory.clement@bootlin.com>, Lee Jones <lee@kernel.org>, Hugh Dickins <hughd@google.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org, linux-trace-kernel@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>, Robert Richter <rrichter@amd.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Brian Foster <bfoster@redhat.com>, Maxime Ripard <mripard@kernel.org>, linux-gpio@
 vger.kernel.org, Jason Baron <jbaron@akamai.com>, linux-rpi-kernel@lists.infradead.org, Bjorn Helgaas <bhelgaas@google.com>, cgroups@vger.kernel.org, Allen Pais <apais@linux.microsoft.com>, linux-arm-kernel@lists.infradead.org, Daniel Lezcano <daniel.lezcano@linaro.org>, Stephen Boyd <sboyd@kernel.org>, Roberto Sassu <roberto.sassu@huawei.com>, linux-integrity@vger.kernel.org, Daniel Bristot de Oliveira <bristot@redhat.com>, Len Brown <lenb@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>, Miri Korenblit <miriam.rachel.korenblit@intel.com>, Arseniy Krasnov <AVKrasnov@sberdevices.ru>, Ulf Hansson <ulf.hansson@linaro.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, linux-pci@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, alsa-devel@alsa-project.org, Nuno Sa <nuno.sa@analog.com>, Matthias Brugger <mat
 thias.bgg@gmail.com>, linux-mtd@lists.infradead.org, linux-hardening@vger.kernel.org, linux-phy@lists.infradead.org, Jiri Slaby <jirislaby@kernel.org>, linux-staging@lists.linux.dev, Jernej Skrabec <jernej.skrabec@gmail.com>, Nikita Kravets <teackot@gmail.com>, Peter Zijlstra <peterz@infradead.org>, Chen-Yu Tsai <wens@csie.org>, Abdel Alkuor <abdelalkuor@geotab.com>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, Paolo Abeni <pabeni@redhat.com>, "Serge E. Hallyn" <serge@hallyn.com>, Lyude Paul <lyude@redhat.com>, Kees Cook <keescook@chromium.org>, Ray Jui <rjui@broadcom.com>, intel-gfx@lists.freedesktop.org, "Steven Rostedt \(Google\)" <rostedt@goodmis.org>, Johannes Berg <johannes.berg@intel.com>, Paul Moore <paul@paul-moore.com>, Mark Brown <broonie@kernel.org>, Borislav Petkov <bp@alien8.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Stanley 
 Chang <stanley_chang@realtek.com>, Daniel Vetter <daniel@ffwll.ch>, openipmi-developer@lists.sourceforge.net, linux-hwmon@vger.kernel.org, Sergey Shtylyov <s.shtylyov@omp.ru>, linux-mm@kvack.org, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, linux-mmc@vger.kernel.org, Sebastian Reichel <sre@kernel.org>, Takashi Sakamoto <o-takashi@sakamocchi.jp>, Daniel Scally <djrscally@gmail.com>, JC Kuo <jckuo@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Masami Hiramatsu <mhiramat@kernel.org>, "David S. Miller" <davem@davemloft.net>, Mario Limonciello <mario.limonciello@amd.com>, Giovanni Cabiddu <giovanni.cabiddu@intel.com>, Vignesh Raghavendra <vigneshr@ti.com>, Eric Biggers <ebiggers@google.com>, Tony Lindgren <tony@atomide.com>, Takashi Iwai <tiwai@suse.com>, David Howells <dhowells@redhat.com>, linux-ide@vger.kernel.org, Huang Rui <ray.huang@amd.com>, "H. Peter Anvin" <hpa@zytor.com>, David Airlie <airlied@gmail.com>, Jim Cromie <jim.cromie@gmail.com>, linux-leds@vger.kernel.org, Eric
  Snowberg <eric.snowberg@oracle.com>, Herbert Xu <herbert@gondor.apana.org.au>, Florian Fainelli <florian.fainelli@broadcom.com>, Richard Weinberger <richard@nod.at>, x86@kernel.org, qat-linux@intel.com, linux-bcachefs@vger.kernel.org, Jani Nikula <jani.nikula@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Jakub Kicinski <kuba@kernel.org>, Zhang Rui <rui.zhang@intel.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>, Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Kalle Valo <kvalo@kernel.org>, apparmor@lists.ubuntu.com, Hans de Goede <hdegoede@redhat.com>, linux-mediatek@lists.infradead.org, Nicholas Piggin <npiggin@gmail.com>, Benjamin Berg <benjamin.berg@intel.com>, linux-tegra@vger.kernel.org, intel-xe@lists.freedesktop.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, John Johansen <john.johansen@canonical.com>, Li
 am Girdwood <lgirdwood@gmail.com>, netdev@vger.kernel.org, Peter De Schrijver <pdeschrijver@nvidia.com>, Kent Overstreet <kent.overstreet@linux.dev>, Adrian Hunter <adrian.hunter@intel.com>, Vinod Koul <vkoul@kernel.org>, Damien Le Moal <dlemoal@kernel.org>, Daniel Bristot de Oliveira <bristot@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, linuxppc-dev@lists.ozlabs.org, Helge Deller <deller@gmx.de>, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Andy,

On Sun, Jun 02, 2024 at 06:57:12PM +0300, Andy Shevchenko wrote:
> diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
> index 503773707e01..9cb350de30f0 100644
> --- a/drivers/acpi/scan.c
> +++ b/drivers/acpi/scan.c
> @@ -798,7 +798,7 @@ static bool acpi_info_matches_ids(struct acpi_device_info *info,
>  	if (!(info->valid & ACPI_VALID_HID))
>  		return false;
>  
> -	index = match_string(ids, -1, info->hardware_id.string);
> +	index = __match_string(ids, -1, info->hardware_id.string);
>  	if (index >= 0)
>  		return true;
>  
> @@ -809,7 +809,7 @@ static bool acpi_info_matches_ids(struct acpi_device_info *info,
>  		return false;
>  
>  	for (i = 0; i < cid_list->count; i++) {
> -		index = match_string(ids, -1, cid_list->ids[i].string);
> +		index = __match_string(ids, -1, cid_list->ids[i].string);
>  		if (index >= 0)
>  			return true;
>  	}

Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com> # drivers/acpi

-- 
Sakari Ailus
