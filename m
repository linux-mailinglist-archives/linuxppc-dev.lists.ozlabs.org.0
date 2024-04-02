Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC2E895D75
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Apr 2024 22:19:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=mhvzoqMi;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V8K380x4Mz3dTx
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Apr 2024 07:19:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=mhvzoqMi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::112b; helo=mail-yw1-x112b.google.com; envelope-from=linus.walleij@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V86mQ27WJz3d4H
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Apr 2024 23:35:31 +1100 (AEDT)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-61495e769bdso19226017b3.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 02 Apr 2024 05:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712061329; x=1712666129; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZhodAsfbqQph/6Oss9KdocUA4jNT8v1VGBe4Vmslbbg=;
        b=mhvzoqMiiZ9JHFTwocYixF4nYxnGGOtK6SEnWjouxE8+THvz6H3OBdbUjRsuhZDQbP
         Pb8NQZGLkZf7bXWvu8j4Jhjaw30Kkko5UK+qe8iIOlT6bQv3qEDyZlUOakxZtS0M6AF2
         gWNrnsPDv+HrXE3PefCbq5kh5WcfUd8QfzPbhN1Z++prjwpWqDgjl3fiK8gctp/3gqta
         XhLIt9nuTGBo9lsHPGf/DbtQSg0CKKKWwjDcJWQI7gs4ZRS8NWA4J3cX9AJXciXwsW7l
         Z6vcXobYmBwvuCqm4fgFvFz4VMWoFWxcXIIJhijLwUgyYcHGmwZmnPyazmjM+q4t6lvH
         2+Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712061329; x=1712666129;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZhodAsfbqQph/6Oss9KdocUA4jNT8v1VGBe4Vmslbbg=;
        b=pM002vD9phcVe64H6SFVcpUP6QpYKbhnIbitnzF10N7AXvWdu59SKtMMlx+Nzo22ZB
         Hv30N5QlhrliV25RGKEZAqpdCiaukHQtmdeNBHXhSdKzSJZuxOrUVn9okGIPX8fHoVlj
         htNfqvhUwN7z0HTPM3MgbwtfT2FF0Cr4o5hI0sXF6UqwfqHnl4b9gJa513x8FNPN4dJp
         dguOhiI88ufh8tRYtCJe5XH7o6vcFn1VPJnwfTdzQUWD5RskqGQKERVBwccVCRxNxuRD
         5nC084oXjJNl3VDn26ShS5j/Tk9GV0gHG6uuM1gbETVkbO4k/MIL4lh2KcwgeccSA2Qo
         wORQ==
X-Forwarded-Encrypted: i=1; AJvYcCWiTckyIk3fxo6C6TAgNnvZNImEO0ET0Sy33jxnfNmUkM9NpOAFexjjIX9MDh29UuEzbamH3tOA2qP1A34uEm7FxPh1xnPuY94l9Klglw==
X-Gm-Message-State: AOJu0Yxia9/yoAkvRuSYq4JcSPWs/0UCxTJ/RGUGQPZmxdjCsUfHEj0r
	QeNKFZLIm4sEwUwlKu52aQCakfLowy5Od+W3Ka/RLpAlH8OyjA9lxWoTo1F8zpSIIZbbDcXOlXR
	pxRBN9U9OApbOVYk4YzrDnj1VbpB4Rna6mNn9OQ==
X-Google-Smtp-Source: AGHT+IG5hxT/EMYnHoU6u7S6MkbvLw5l9U/Ss0P2rks8Fb0m+zQTGqjqkjSlSz0lY1KsLwpjx1moujtIXAN3uBffPV8=
X-Received: by 2002:a25:6d86:0:b0:dc2:2d75:5fde with SMTP id
 i128-20020a256d86000000b00dc22d755fdemr10687728ybc.29.1712061328813; Tue, 02
 Apr 2024 05:35:28 -0700 (PDT)
MIME-Version: 1.0
References: <20240322132619.6389-1-wsa+renesas@sang-engineering.com> <20240322132619.6389-65-wsa+renesas@sang-engineering.com>
In-Reply-To: <20240322132619.6389-65-wsa+renesas@sang-engineering.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 2 Apr 2024 14:35:17 +0200
Message-ID: <CACRpkdbtRoDtWN4mnyZY_yEfWQFPCQaVudjBki8N1sOXxXWupQ@mail.gmail.com>
Subject: Re: [PATCH 64/64] i2c: reword i2c_algorithm in drivers according to
 newest specification
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 03 Apr 2024 07:17:02 +1100
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
Cc: Andrew Lunn <andrew@lunn.ch>, Shyam Sundar S K <shyam-sundar.s-k@amd.com>, Tomer Maimon <tmaimon77@gmail.com>, Ajay Gupta <ajayg@nvidia.com>, Viresh Kumar <viresh.kumar@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, Dmitry Osipenko <digetx@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>, linux-samsung-soc@vger.kernel.org, Robert Foss <rfoss@kernel.org>, Aaro Koskinen <aaro.koskinen@iki.fi>, Khalil Blaiech <kblaiech@nvidia.com>, Oleksij Rempel <o.rempel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, Nicholas Piggin <npiggin@gmail.com>, linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Yicong Yang <yangyicong@hisilicon.com>, Laxman Dewangan <ldewangan@nvidia.com>, linux-i2c@vger.kernel.org, Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev, Fabio Estevam <festevam@gmail.com>, Jonathan Hunter <jonathan
 h@nvidia.com>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Alain Volmat <alain.volmat@foss.st.com>, Andi Shyti <andi.shyti@kernel.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-arm-msm@vger.kernel.org, Nicolas Ferre <nicolas.ferre@microchip.com>, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Nick Hawkins <nick.hawkins@hpe.com>, linux-amlogic@lists.infradead.org, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-arm-kernel@lists.infradead.org, Neil Armstrong <neil.armstrong@linaro.org>, Hector Martin <marcan@marcan.st>, linux-renesas-soc@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Kevin Hilman <khilman@baylibre.com>, linux-mediatek@lists.infradead.org, imx@lists.linux.dev, Jean-Marie Verdun <verdun@hpe.com>, linux-tegra@vger.kernel.org, Elie Morisse <syniurge@gmail.com>, Krzysztof Adamski <krzysztof.adamski@nokia.com>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, Peter Korsgaard <peter@korsgaard.com>, Benjamin Fair <benjaminfair@goog
 le.com>, Michal Simek <michal.simek@amd.com>, Nancy Yuen <yuenn@google.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Codrin Ciubotariu <codrin.ciubotariu@microchip.com>, Robert Richter <rric@kernel.org>, Asmaa Mnebhi <asmaa@nvidia.com>, Vladimir Zapolskiy <vz@mleia.com>, Conghui Chen <conghui.chen@intel.com>, Benson Leung <bleung@chromium.org>, Qii Wang <qii.wang@mediatek.com>, Avi Fishman <avifishman70@gmail.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Konrad Dybcio <konrad.dybcio@linaro.org>, Thierry Reding <thierry.reding@gmail.com>, Jarkko Nikula <jarkko.nikula@linux.intel.com>, asahi@lists.linux.dev, Shawn Guo <shawnguo@kernel.org>, Vignesh R <vigneshr@ti.com>, Tony Lindgren <tony@atomide.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Tali Perry <tali.perry1@gmail.com>, Paul Cercueil <paul@crapouillou.net>, Jan Dabros <jsd@semihalf.com>, openbmc@lists.ozlabs.org, Janusz Krzysztofik <jmkrzyszt@gmail.com>, Sven Peter <sven@svenpeter.dev>, virtualization@lists.li
 nux.dev, Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>, Matthias Brugger <matthias.bgg@gmail.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Loic Poulain <loic.poulain@linaro.org>, Patrick Venture <venture@google.com>, Bjorn Andersson <andersson@kernel.org>, linux-mips@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Mar 22, 2024 at 2:27=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:

> Match the wording in i2c_algorithm in I2C drivers wrt. the newest I2C
> v7, SMBus 3.2, I3C specifications and replace "master/slave" with more
> appropriate terms. For some drivers, this means no more conversions are
> needed. For the others more work needs to be done but this will be
> performed incrementally along with API changes/improvements. All these
> changes here are simple search/replace results.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
