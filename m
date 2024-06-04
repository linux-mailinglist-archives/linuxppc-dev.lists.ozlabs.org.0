Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F26D88FC149
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jun 2024 03:30:06 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=F74qibwl;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vv8z01861z3flt
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jun 2024 11:30:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=F74qibwl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vv0GT72NWz3cGC
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Jun 2024 04:57:52 +1000 (AEST)
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-35a264cb831so5413505f8f.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 Jun 2024 11:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1717527468; x=1718132268; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3Iay1wNfKZ5p2yKYQUB8UE9csohQVR6x64V5CAu9ZDo=;
        b=F74qibwlH27e4yU3skFZjOj6Us0GXWcPPATgOKf01cff8YTbPHCsJTBni0VI3E5p4Z
         aVb+7XSb9kmbjQswZfcsuFPzrsNgIiNWyv9q1/tamMlXMo+2d/4RGV4PywbK2B4y9inN
         qmf0gNixVtsCvRC9kvaZHTnalnIJNmw5jkKzQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717527468; x=1718132268;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Iay1wNfKZ5p2yKYQUB8UE9csohQVR6x64V5CAu9ZDo=;
        b=a4cO6O5LMYfXkJMJAE2CVfMxH9jc1KY5vKDXbvwgGd3iJ3tO2RTqQk8bqN4A+VMBYz
         /ZUioILA1vaCjgIgkeZc0FWHKKK4iVo6DIOhG6ZmDG1e4l3WTj+TA2up0iLiZx167hjc
         T7N0o2lPfBtRL7aeCF5u+Zq9Z44poLY8eldEcpW8pj8DvtycH3v4ZPQ5Duc3+IqAUxtB
         hed7OqF6BMBJzzDBeO562mXIHbf9yJAGxPQEzEdK3L9h99+k3wES0YL1gcpDHfB38Zpt
         g5sGNstosTzyl872yssG9dI7CEn4Wmov7R6oOKnBaZKZQ9PMP8AkogrROIBwXMPUcQIr
         aIWg==
X-Forwarded-Encrypted: i=1; AJvYcCUXxyD5SfgpFyyqU7YnrVdQPf0eSMVNfVEx1H/vH6Yz2ilfrkuhOlplk/nrckP3INz9LU5HSZOTtgfwOIgtnyjjm4mA71FCBgouKC+tuA==
X-Gm-Message-State: AOJu0YwZKawz8NaFSTQm0SDPZHwZHYEWKqgdOQTwQAaxpp4ZvncR8/9M
	kgpxRxzjHAc10Ix9wfMBdK7bvsy/f+RO/bTA4HfnOC5SOd20wPzVdlm/KXqvW1g2dj8x3grFVSt
	dMT0oJkrf
X-Google-Smtp-Source: AGHT+IGk0OYO94oe+bbaDlKDYoHDcetOmWbfpptr4yFQGNJrffqua1724cnawHeWI7sfhyBR/JLVeQ==
X-Received: by 2002:a50:d781:0:b0:578:72d4:e3b0 with SMTP id 4fb4d7f45d1cf-57a8bcb4d09mr287250a12.36.1717527014463;
        Tue, 04 Jun 2024 11:50:14 -0700 (PDT)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com. [209.85.128.41])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57a31be52b5sm7902897a12.49.2024.06.04.11.50.14
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jun 2024 11:50:14 -0700 (PDT)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4213485697fso34196545e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 Jun 2024 11:50:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXA9B22mkaXSmECR4pKn2Y2DDiuQB9UJZOcKYXSw3/wadjy4gr0R8+cvefU3jLgYcGMfm5ZLFUKdNc2XkIgRCbrt2y2lqLMIWn2IiYUPQ==
X-Received: by 2002:a17:906:54b:b0:a62:2cae:c02 with SMTP id
 a640c23a62f3a-a69a024ce40mr20818866b.61.1717526574326; Tue, 04 Jun 2024
 11:42:54 -0700 (PDT)
MIME-Version: 1.0
References: <20240603211538.289765-1-andriy.shevchenko@linux.intel.com> <Zl9b_Wh_Lx7Aln1q@intel.com>
In-Reply-To: <Zl9b_Wh_Lx7Aln1q@intel.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 4 Jun 2024 11:42:36 -0700
X-Gmail-Original-Message-ID: <CAHk-=whAnzrovfD8MtpRwfbkVxi-W61CqKxYdX+94r_uJeCT7w@mail.gmail.com>
Message-ID: <CAHk-=whAnzrovfD8MtpRwfbkVxi-W61CqKxYdX+94r_uJeCT7w@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] treewide: Align match_string() with sysfs_match_string()
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 05 Jun 2024 11:28:46 +1000
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
Cc: Juri Lelli <juri.lelli@redhat.com>, Andrew Lunn <andrew@lunn.ch>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Heiko Stuebner <heiko@sntech.de>, "Rafael J. Wysocki" <rafael@kernel.org>, Takashi Iwai <tiwai@suse.de>, Viresh Kumar <viresh.kumar@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, dri-devel@lists.freedesktop.org, Jaroslav Kysela <perex@perex.cz>, Ben Segall <bsegall@google.com>, Perry Yuan <perry.yuan@amd.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Pavel Machek <pavel@ucw.cz>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, linux-clk@vger.kernel.org, Kishon Vijay Abraham I <kishon@kernel.org>, Abel Wu <wuyun.abel@bytedance.com>, Vincent Guittot <vincent.guittot@linaro.org>, Karol Herbst <kherbst@redhat.com>, Samuel Holland <samuel@sholland.org>, Sebastian Reichel <sebastian.reichel@collabora.com>, Tvrtko Ursulin <tursulin@ursulin.net>, linux-acpi@vger.kernel.org, Danilo Krummrich <dakr@redhat.com>, Mel Gorman <mgorman@suse.de>, linux-sunxi@lists.linux.dev, Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.com>, linux-pm@vger.kernel.org, Potnuri Bharat Teja <bharat@chelsio.com>, James Morris <jmorris@namei.org>, linux-sound@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, linux-omap@vger.kernel.org, Zhihao Cheng <chengzhihao1@huawei.com>, Dietmar Eggemann <dietmar.eggemann@arm.com>, Niklas Cassel <cassel@kernel.org>, Scott Branden <sbranden@broadcom.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, "Gautham R. Shenoy" <gautham.shenoy@amd.com>, Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, Tejun Heo <tj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Elad Nachman <enachman@marvell.com>, Lukasz Luba <lukasz.luba@arm.com>, linux-fbdev@vger.kernel.org, linux-usb@vger.kernel.org, Zefan Li <lizefan.x@bytedance.com>, nouveau@lists.freedesktop.org, Dave Hansen <dave.hansen@linux.intel.com>, Clemens Ladisch <clemens@ladisch.de>, Mimi Zohar <zohar@linux.ibm.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Hu Ziji <huziji@marvell.com>, Eric Dumazet <edumazet@google.com>, keyrings@vger.kernel.org, Oliver O'Halloran <oohall@gmail.com>, linux-i2c@vger.kernel.org, Gregory Greenman <gregory.greenman@intel.com>, Ingo Molnar <mingo@kernel.org>, linux-security-module@vger.kernel.org, Valentin Schneider <vschneid@redhat.com>, Corey Minyard <minyard@acm.org>, Gregory Clement <gregory.clement@bootlin.com>, Lee Jones <lee@kernel.org>, Hugh Dickins <hughd@google.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org, linux-trace-kernel@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>, Robert Richter <rrichter@amd.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Brian Foster <bfoster@redhat.com>, Maxime Ripard <mripard@kernel.org>, linux-gpio@vger.kernel.org, Jason Baron <jbaron@akamai.com>, linux-rpi-kernel@lists.infradead.org, Bjorn Helgaas <bhelgaas@google.com>, cgroups@vger.kernel.org, Allen Pais <apais@linux.microsoft.com>, linux-arm-kernel@lists.infradead.org, Daniel Lezcano <daniel.lezcano@linaro.org>, Stephen Boyd <sboyd@kernel.org>, Roberto Sassu <roberto.sassu@huawei.com>, linux-integrity@vger.kernel.org, Daniel Bristot de Oliveira <bristot@redhat.com>, Len Brown <lenb@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>, Miri Korenblit <miriam.rachel.korenblit@intel.com>, Arseniy Krasnov <AVKrasnov@sberdevices.ru>, Ulf Hansson <ulf.hansson@linaro.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, linux-pci@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, alsa-devel@alsa-project.org, Nuno Sa <nuno.sa@analog.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-mtd@lists.infradead.org, linux-hardening@vger.kernel.org, linux-phy@lists.infradead.org, Jiri Slaby <jirislaby@kernel.org>, linux-staging@lists.linux.dev, Jernej 
 Skrabec <jernej.skrabec@gmail.com>, Nikita Kravets <teackot@gmail.com>, Peter Zijlstra <peterz@infradead.org>, Chen-Yu Tsai <wens@csie.org>, Abdel Alkuor <abdelalkuor@geotab.com>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, Paolo Abeni <pabeni@redhat.com>, "Serge E. Hallyn" <serge@hallyn.com>, Lyude Paul <lyude@redhat.com>, Kees Cook <keescook@chromium.org>, Ray Jui <rjui@broadcom.com>, intel-gfx@lists.freedesktop.org, "Steven Rostedt \(Google\)" <rostedt@goodmis.org>, Johannes Berg <johannes.berg@intel.com>, Paul Moore <paul@paul-moore.com>, Mark Brown <broonie@kernel.org>, Borislav Petkov <bp@alien8.de>, Stanley Chang <stanley_chang@realtek.com>, Daniel Vetter <daniel@ffwll.ch>, openipmi-developer@lists.sourceforge.net, linux-hwmon@vger.kernel.org, Sergey Shtylyov <s.shtylyov@omp.ru>, linux-mm@kvack.org, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, linux-mmc@vger.kernel.org, Sebastian Reichel <sre@kernel.org>, Takashi Sakamoto <o-takashi@sakamocchi.jp>, Daniel Scally <djrscally@gmail.com>, JC Kuo <jckuo@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Masami Hiramatsu <mhiramat@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, "David S. Miller" <davem@davemloft.net>, Mario Limonciello <mario.limonciello@amd.com>, Giovanni Cabiddu <giovanni.cabiddu@intel.com>, Vignesh Raghavendra <vigneshr@ti.com>, Eric Biggers <ebiggers@google.com>, Tony Lindgren <tony@atomide.com>, Takashi Iwai <tiwai@suse.com>, David Howells <dhowells@redhat.com>, linux-ide@vger.kernel.org, Huang Rui <ray.huang@amd.com>, "H. Peter Anvin" <hpa@zytor.com>, David Airlie <airlied@gmail.com>, Jim Cromie <jim.cromie@gmail.com>, linux-leds@vger.kernel.org, Eric Snowberg <eric.snowberg@oracle.com>, Herbert Xu <herbert@gondor.apana.org.au>, Florian Fainelli <florian.fainelli@broadcom.com>, Richard Weinberger <richard@nod.at>, x86@kernel.org, qat-linux@intel.com, linux-bcachefs@vger.kernel.org, Jani Nikula <jani.nikula@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Jakub Kicinski <kuba@kernel.org>, Zhang Rui <rui.zhang@intel.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, platform-driver-x86@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>, Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Kalle Valo <kvalo@kernel.org>, apparmor@lists.ubuntu.com, Hans de Goede <hdegoede@redhat.com>, linux-mediatek@lists.infradead.org, Nicholas Piggin <npiggin@gmail.com>, Benjamin Berg <benjamin.berg@intel.com>, linux-tegra@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, intel-xe@lists.freedesktop.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, John Johansen <john.johansen@canonical.com>, Liam Girdwood <lgirdwood@gmail.com>, netdev@vger.kernel.org, Peter De Schrijver <pdeschrijver@nvidia.com>, Kent Overstreet <kent.overstreet@linux.dev>, Adrian Hunter <adrian.hunter@intel.com>, Vinod Koul <vkoul@kernel.org>, Damien Le Moal <dlemoal@kernel.org>, Daniel Bristot de Oliveira <bristot@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, linuxppc-dev@lists.ozlabs.org, Helge Deller <deller@gmx.de>, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 4 Jun 2024 at 11:25, Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
>
> (I believe that the new _match_string(str1, size, str2) deserves a better name,
> but since I'm bad with naming stuff, I don't have any good suggestion)

I hated the enormous cc list, so I didn't reply to all. But clearly
everybody else is just doing so.

Anyway, here's my NAK for this patch with explanation:

    https://lore.kernel.org/all/CAHk-=wg5F99-GZPETsasJd0JB0JGcdmmPeHRxCtT4_i83h8avg@mail.gmail.com/

and part of it was the naming, but there were other oddities there too.

           Linus
