Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6135491E50F
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jul 2024 18:14:58 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Wt7x4A2Q;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WCWN013qCz3fSV
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2024 02:14:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Wt7x4A2Q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::232; helo=mail-lj1-x232.google.com; envelope-from=sergei.shtylyov@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WCWMF2fmJz30T0;
	Tue,  2 Jul 2024 02:14:15 +1000 (AEST)
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2eabd22d3f4so31661191fa.1;
        Mon, 01 Jul 2024 09:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719850449; x=1720455249; darn=lists.ozlabs.org;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N9eJvY3noQUZfbyZhFkyxOik2OAqPtae0XwqIwzXsH8=;
        b=Wt7x4A2Q5RG21NEXORdJ80zgqccYQZHgJhXthxUiVdJZBzLSHI4ktvqqk7GgKbab3w
         WsbhYlH7aBeOos0D+GJ/mxTZKfamtszB2qKfSH3a2IWyAsMOfoY+L5QFrFHd/I+XqgFn
         5kXFGD2R13Boj1Yk8Bx99S5KW03BygzoA9XYkSV96w9/ykymYIZnlZm08xQ8UqY1mQqO
         6iXzzoM1ko6QrcW2WMQ1CZJAb9t3+m6AnaahcCoJgrh/ikcD/wn2BUP+z7Tv64hTp2yT
         suEcmy7py9HUIFMyK5k0OyOHDyRfdXyitRWYkgXgj0LW8/+/wS35+DQ4Nkxv1emXaH1N
         kBGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719850449; x=1720455249;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N9eJvY3noQUZfbyZhFkyxOik2OAqPtae0XwqIwzXsH8=;
        b=UWgIkozgidZUB7aRSNA+C5Olr9CPyo6XJEIP66B+S+o/kn9pyEC5CwPJvt3mLUVtZ2
         W6Ae7LnehegN9a0lgmIl11yTdHy1voJL7pKglyZoWOEr7hvIAkT9ooLV++a6rf79uTtE
         NM9G8yMzVAczh+FsWCsAeFNAs8yzsLWQWShUX+Wvy5bvV3MU1Dzz1/WML+B/g3x8i9M1
         j6gVl7TeZ18Fq/6Apo+RSZO+YcdgiQ1wJBhHpkkuiVwlp5uGz6n8gVPrz9SSR96L+h8b
         qby6c7EajKjgXUjzeYgBpPSnBX5S5QmZQaTYYP0IZrlR9aqbqQm54vi43SHwPorJtga6
         V/4g==
X-Forwarded-Encrypted: i=1; AJvYcCWzzESAgeB1K3fwr4mCvSSK/a5oPEN4W4YfoETqYCn22us6G/0X0YbJf1LNu5vVTA/x576KmwxKpkwgCxfrQsQwe/33QWuG9L+/veQg/kAXetxaoKHh8k74s9fM7OwpxI/qaGVtSG7iaT1Fpefsj9VOGovMpDHK1UZ6AeW+tSRZuPvAXCisnw==
X-Gm-Message-State: AOJu0YyNGgAOcWT89oPjGD4HLzpYTgQyQMhlzS6B+uYTonxx7xlzvCFQ
	0Y8w72ZqME5n17xq7lDuBNAOxPMNT3RjuQQYIC0AyZmy0e1MA7zy
X-Google-Smtp-Source: AGHT+IHHz/OamA1Ukx5sIFBlK+L0AmnL9jrrDHysPJKMb3Xyg4pOUjtzhB1j4PXHUjwphZM6xFX6sw==
X-Received: by 2002:a2e:8558:0:b0:2ec:5382:2703 with SMTP id 38308e7fff4ca-2ee5e6f6972mr34830361fa.53.1719850448585;
        Mon, 01 Jul 2024 09:14:08 -0700 (PDT)
Received: from [192.168.1.105] ([178.176.75.203])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ee516803aesm14192571fa.79.2024.07.01.09.14.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jul 2024 09:14:07 -0700 (PDT)
Subject: Re: [PATCH 2/9] mtd: add mtd_is_master helper
To: Marco Felsch <m.felsch@pengutronix.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Russell King <linux@armlinux.org.uk>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>,
 Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Tony Lindgren <tony@atomide.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Dinh Nguyen <dinguyen@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.neuschaefer@gmx.net>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>
References: <20240701-b4-v6-10-topic-usbc-tcpci-v1-0-3fd5f4a193cc@pengutronix.de>
 <20240701-b4-v6-10-topic-usbc-tcpci-v1-2-3fd5f4a193cc@pengutronix.de>
From: Sergei Shtylyov <sergei.shtylyov@gmail.com>
Message-ID: <b97bf565-bef5-fbc7-63c5-f174880ad9ab@gmail.com>
Date: Mon, 1 Jul 2024 19:14:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20240701-b4-v6-10-topic-usbc-tcpci-v1-2-3fd5f4a193cc@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: imx@lists.linux.dev, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org, loongarch@lists.linux.dev, linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 7/1/24 4:53 PM, Marco Felsch wrote:

> Provide a simple helper to make it easy to detect an master mtd device.
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
>  include/linux/mtd/mtd.h | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
> index 8d10d9d2e830..bf3fc2ea7230 100644
> --- a/include/linux/mtd/mtd.h
> +++ b/include/linux/mtd/mtd.h
> @@ -408,6 +408,11 @@ static inline struct mtd_info *mtd_get_master(struct mtd_info *mtd)
>  	return mtd;
>  }
>  
> +static inline bool mtd_is_master(struct mtd_info *mtd)
> +{
> +	return mtd->parent ? false : true;

   Perhaps:

	return !mtd->parent;

[...]

MBR, Sergey
