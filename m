Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 319E3563CB4
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Jul 2022 01:16:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LZWLD3Yf5z3dp2
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Jul 2022 09:16:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=jSDpH5b4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b30; helo=mail-yb1-xb30.google.com; envelope-from=andy.shevchenko@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=jSDpH5b4;
	dkim-atps=neutral
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LZB3p5WRTz3bg4;
	Fri,  1 Jul 2022 20:18:13 +1000 (AEST)
Received: by mail-yb1-xb30.google.com with SMTP id 205so799533ybe.3;
        Fri, 01 Jul 2022 03:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IK1q7pWvnzmd2/yzmMQOB6gFUgHkXgsyzwODpSKqHtU=;
        b=jSDpH5b4ezTXYDkI+Kv1qjoulW4GueRKAo9MfvH6Or74WD1aO19b0yl9X6h7ikpgsb
         Yzj9/9QR8pvv9s537mQBeUk8bodicRt2sYNtrKP02dXkQyCDQKSj99VRGbrzh5/zLrXe
         3DbujuLPciSi5vALJ+old//V6zoLm6pd0LhvBAARG1SXsh/2UP6qVVa/FfV3DuM5if+u
         lMLgaAYtih653stfzpF6JzV1TgtPEvIAiwFM7x+VFO7m6+ikg5S95jdc8NlSpoxf6NUC
         chD7vf96GrCNEtWT2dpp9TfC5k1TkiGvGH1SczyJzPL6/3uFcjCYC/RxAKuWF753UD7k
         NBBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IK1q7pWvnzmd2/yzmMQOB6gFUgHkXgsyzwODpSKqHtU=;
        b=Pld/flhVGqhOgx707tQxmuxlkqgoaftqnpF4bmWaZRRh99jnWYCFO+0y5cqx+wccli
         koHXh8iUIOCSgfWbapeM26ilCycxTJG2zxjfo4xoaKA0AFN2UytTq/PFIoWLYTUSXUZE
         ZZ8vcNPcm/rHzNqJvy53lGvHUOfBFKch2138ZnW4zwgGIhkykd7kFx5F5mHKBtG2g6xG
         WpZfNkTed1AlHYRZAxMYhRpJV0iNr0CNnYynkM+DOCdZxWPtbZ7b27mfSSoz029zZpz+
         RLapYJbH8bxQDgVJ39tmoGUJciflfa6laUSCW3+u/2KNhEbIAyftj+w7912u6S/AVmrS
         e8lw==
X-Gm-Message-State: AJIora/CiusKc6SYMWl9XsALc/Bu83oSmCV27fU+fGIet9gDYtg/NlJ1
	YwkoDUvZNEyTgZlFzWxK11xCjNhA6OC7R+6KPjs=
X-Google-Smtp-Source: AGRyM1tvrcPaXjb6qpRZmlm3mN1+HaZ3X5zFt5Vb6BDK08mCBJ8qF4vfcIrvo5gC3LEAhM4YrPgldTFVhwpUgFcS228=
X-Received: by 2002:a05:6902:1549:b0:66d:5f76:27ba with SMTP id
 r9-20020a056902154900b0066d5f7627bamr14092504ybu.385.1656670690515; Fri, 01
 Jul 2022 03:18:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220701012647.2007122-1-saravanak@google.com> <20220701012647.2007122-3-saravanak@google.com>
In-Reply-To: <20220701012647.2007122-3-saravanak@google.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 1 Jul 2022 12:17:33 +0200
Message-ID: <CAHp75Vdw8pZePnqR=mmJh4pv0bPMRJE=p7-cG3akskdxMHmoKw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] serial: Set probe_no_timeout for all DT based drivers
To: Saravana Kannan <saravanak@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sat, 02 Jul 2022 09:16:22 +1000
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
Cc: andrew lunn <andrew@lunn.ch>, peng fan <peng.fan@nxp.com>, "Rafael J. Wysocki" <rafael@kernel.org>, linus walleij <linus.walleij@linaro.org>, Paul Mackerras <paulus@samba.org>, Alim Akhtar <alim.akhtar@samsung.com>, Peter Korsgaard <jacmet@sunsite.dk>, linux-stm32@st-md-mailman.stormreply.com, Karol Gugala <kgugala@antmicro.com>, Jerome Brunet <jbrunet@baylibre.com>, Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>, Michal Simek <michal.simek@xilinx.com>, Hammer Hsieh <hammerh0314@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Vineet Gupta <vgupta@kernel.org>, len brown <len.brown@intel.com>, Nicolas Saenz Julienne <nsaenz@kernel.org>, Linux PM <linux-pm@vger.kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, linux-unisoc@lists.infradead.org, Scott Branden <sbranden@broadcom.com>, Andrew Jeffery <andrew@aj.id.au>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Richard Genoud <richard.genoud@gmail.com>, Masami Hira
 matsu <mhiramat@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Claudiu Beznea <claudiu.beznea@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, pavel machek <pavel@ucw.cz>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, eric dumazet <edumazet@google.com>, Thierry Reding <thierry.reding@gmail.com>, sascha hauer <sha@pengutronix.de>, Chunyan Zhang <zhang.lyra@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Gabriel Somlo <gsomlo@gmail.com>, Tobias Klauser <tklauser@distanz.ch>, "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, Android Kernel Team <kernel-team@android.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, linux-actions@lists.infradead.org, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>, linux-amlogic <linux-amlogic@lists.infradead.org>, linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
 , Andreas Farber <afaerber@suse.de>, Maxime Coquelin 

<mcoquelin.stm32@gmail.com>, Kevin Hilman <khilman@baylibre.com>, Pali Rohar <pali@kernel.org>, heiner kallweit <hkallweit1@gmail.com>, ulf hansson <ulf.hansson@linaro.org>, Neil Armstrong <narmstrong@baylibre.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Al Cooper <alcooperx@gmail.com>, linux-tegra <linux-tegra@vger.kernel.org>, Jiri Slaby <jirislaby@kernel.org>, "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>, Rob Herring <robh@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, Mateusz Holenko <mholenko@antmicro.com>, Alexander Shiyan <shc_work@mail.ru>, kevin hilman <khilman@kernel.org>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Joel Stanley <joel@jms.id.au>, Orson Zhai <orsonzhai@gmail.com>, paolo abeni <pabeni@redhat.com>, Patrice Chotard <patrice.chotard@foss.st.com>, Ray Jui <rjui@broadcom.com>, Vladimir Zapolskiy <vz@mleia.com>, linux-snps-arc@lists.infradead.org, Timur Tabi <timur@kernel.org>, hideaki yosh
 ifuji <yoshfuji@linux-ipv6.org>, "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>, Laxman Dewangan <ldewangan@nvidia.com>, Sudeep Holla <sudeep.holla@arm.com>, Baolin Wang <baolin.wang7@gmail.com>, Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>, Baruch Siach <baruch@tkos.co.il>, Liviu Dudau <liviu.dudau@arm.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Paul Cercueil <paul@crapouillou.net>, Sparc kernel list <sparclinux@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, Ahmad Fatoum <a.fatoum@pengutronix.de>, joerg roedel <joro@8bytes.org>, Russell King <linux@armlinux.org.uk>, Andy Gross <agross@kernel.org>, "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>, jakub kicinski <kuba@kernel.org>, will deacon <will@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Fabio Estevam <festevam@gm
 ail.com>, Paul Walmsley <paul.walmsley@sifive.com>, M
atthias Brugger <matthias.bgg@gmail.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Laurentiu Tudor <laurentiu.tudor@nxp.com>, Taichi Sugaya <sugaya.taichi@socionext.com>, netdev <netdev@vger.kernel.org>, david ahern <dsahern@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>, Takao Orito <orito.takao@socionext.com>, "open list:LINUX FOR POWERPC PA SEMI PWRFICIENT" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jul 1, 2022 at 3:28 AM Saravana Kannan <saravanak@google.com> wrote:
>
> With commit 71066545b48e ("driver core: Set fw_devlink.strict=1 by
> default") the probing of TTY consoles could get delayed if they have
> optional suppliers that are listed in DT, but those suppliers don't
> probe by the time kernel boot finishes. The console devices will probe
> eventually after driver_probe_timeout expires.
>
> However, since consoles are often used for debugging kernel issues, it
> does not make sense to delay their probe. So, set the newly added
> probe_no_timeout flag for all serial drivers that at DT based. This way,
> fw_devlink will know not to delay the probing of the consoles past
> kernel boot.

Same question, do you think only serial drivers need that?

-- 
With Best Regards,
Andy Shevchenko
