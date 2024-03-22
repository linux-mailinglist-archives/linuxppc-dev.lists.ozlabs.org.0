Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 667B1887279
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Mar 2024 19:02:27 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=vW6G1Xg2;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V1VXd1NJHz3wGZ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Mar 2024 05:02:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=vW6G1Xg2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::82e; helo=mail-qt1-x82e.google.com; envelope-from=groeck@google.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com [IPv6:2607:f8b0:4864:20::82e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V1TGg0M9Zz3cRB
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Mar 2024 04:05:14 +1100 (AEDT)
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-431347c6c99so11921cf.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Mar 2024 10:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711127111; x=1711731911; darn=lists.ozlabs.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v4N44CMN5oCIe/XAnwlaVauiT1tmi9O/mBbrMgK8XAg=;
        b=vW6G1Xg2qOnZWvxnH6UfpgvzGxtimjR9MMtd2VXsgidEvdA+HhhBQ4LGMFSgiUVDI0
         aMvGeFesTq5Tx9/ISsffEjjVd5+THMbSrkt6H6Xw3XZj44PxQ40ghHUgO5miW0fra+er
         blttUIyXoniRTJgJHR2wvQcu+qXPJ2IUdsJ1li54GZpcd5uP0/0M+FCIdWay0+VzHUmP
         CxrXNj3JTq4huUVFnTu7nqGCU+88+C6bwjHcB9IQIUAiC/hx4qe97ep6nPmiyaSLgDmw
         PPRSpHNW1BHfLyh1IE3HppQuyhWQPIuFukHjfHv+qZnEDVMNCbO6k61egTGC6K//hB9d
         IA/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711127111; x=1711731911;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v4N44CMN5oCIe/XAnwlaVauiT1tmi9O/mBbrMgK8XAg=;
        b=teAlp6sASAFL1+rmxwlpULLW0fe+wOz+Dwz6hg5B5p9QK+FcccJ2zxFzdz0/IKjS6J
         O4YXTgZ9DOt1RHniXb1D0aYFtXS4ViPCadItQNj9XReqAxl8hWtmVRL3AtlovPmkvJH5
         Lb2v/RxFFlX9mKsIJq4wmCS8B7yTRHmXcp4cYdQWVSnUoeqn6VO5S//Uz5kjqx4i9Za7
         jMeC3GK3wy5xoi+bacIMRVKUr8E/Pnf+uvPE8CT2qZJXwSC1LUNXvMUA9A3zKxh+z8Y+
         uWmO1WqRyVIyF9ZB7OFI9OZ7GcvcXKoo4iiqP1JQsPHyxG6hncj72rNLq8Fej+DmpV6h
         tpQw==
X-Forwarded-Encrypted: i=1; AJvYcCUBL2KFCEPReyxkJ2U43MTuI4TQuX7iQ+LjV0CgD+mkH/qhppQENKOq81qSsiRguCyMN+XY0hSlKrghemxNfSSlogWEE9Blp2KOUDjMeA==
X-Gm-Message-State: AOJu0YyxEmpTEri101qmetBV9NxmeuWqGr2VOLMpaft0vOPZ1e1X4ktl
	RJCLd4Yd/Yr6GUruC0j7Gk+SHIjHfE3FdGXZ17GY+KSiuH1i9z4Fw3k0b/MiGYeebbOwBvI1d/M
	FiFD4v8TA83fx7lFB0nXofQA+UIDiuqK1wEOZ
X-Google-Smtp-Source: AGHT+IEMXRAiaxzgPudCV28IsnfTo93KghidIO1NcmkDbiSOepYGnBba5CPcjtadamz0IWr8XSq/M+NvnzVf5opCbEA=
X-Received: by 2002:a05:622a:2486:b0:431:3c48:a65b with SMTP id
 cn6-20020a05622a248600b004313c48a65bmr12492qtb.11.1711127111085; Fri, 22 Mar
 2024 10:05:11 -0700 (PDT)
MIME-Version: 1.0
References: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
 <20240322132619.6389-65-wsa+renesas@sang-engineering.com> <e8dff9d4-ed15-44e9-ae9a-2e77845ec40b@microchip.com>
 <Zf22G4jC2gIlzhi_@shikoro>
In-Reply-To: <Zf22G4jC2gIlzhi_@shikoro>
From: Guenter Roeck <groeck@google.com>
Date: Fri, 22 Mar 2024 10:05:00 -0700
Message-ID: <CABXOdTc14kfPpkF96KG-oeLRTLvjxAD_gtOO2TQFLnHMLNoU_Q@mail.gmail.com>
Subject: Re: [PATCH 64/64] i2c: reword i2c_algorithm in drivers according to
 newest specification
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, linux-i2c@vger.kernel.org, 
	Elie Morisse <syniurge@gmail.com>, Shyam Sundar S K <shyam-sundar.s-k@amd.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Codrin Ciubotariu <codrin.ciubotariu@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Krzysztof Adamski <krzysztof.adamski@nokia.com>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Jarkko Nikula <jarkko.nikula@linux.intel.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Jan Dabros <jsd@semihalf.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Jean-Marie Verdun <verdun@hpe.com>, Nick Hawkins <nick.hawkins@hpe.com>, 
	Yicong Yang <yangyicong@hisilicon.com>, Oleksij Rempel <o.rempel@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Paul Cercueil <paul@crapouillou.net>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Khalil Blaiech <kblaiech@nvidia.com>, 
	Asmaa Mnebhi <asmaa@nvidia.com>, Qii Wang <qii.wang@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Avi Fishman <avifishman70@gmail.com>, 
	Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
	Benjamin Fair <benjaminfair@google.com>, Ajay Gupta <ajayg@nvidia.com>, 
	Peter Korsgaard <peter@korsgaard.com>, Andrew Lunn <andrew@lunn.ch>, Robert Richter <rric@kernel.org>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, 
	Tony Lindgren <tony@atomide.com>, Vignesh R <vigneshr@ti.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, 
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Hector Martin <marcan@marcan.st>, 
	Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Vladimir Zapolskiy <vz@mleia.com>, Loic Poulain <loic.poulain@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>, Alain Volmat <alain.volmat@foss.st.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Laxman Dewangan <ldewangan@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, 
	Conghui Chen <conghui.chen@intel.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Michal Simek <michal.simek@amd.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, chrome-platform@lists.linux.dev, 
	linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, openbmc@lists.ozlabs.org, 
	linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	asahi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-tegra@vger.kernel.org, virtualization@lists.linux.dev, 
	Ryan Wanner <Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sat, 23 Mar 2024 04:58:59 +1100
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Mar 22, 2024 at 9:47=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
>
> > Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com> # for at91
> > Probably file names themselves will need some care, in a second time.
>
> Totally true. I am aware of that. But one step after the other...
>

Kind of odd though to change function names but not parameter names of
those very same functions.

Guenter
