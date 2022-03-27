Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A9C4E8A3C
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Mar 2022 23:33:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KRTZh6N9dz3c2x
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Mar 2022 08:33:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=W7sg25bH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62c;
 helo=mail-ej1-x62c.google.com; envelope-from=andy.shevchenko@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=W7sg25bH; dkim-atps=neutral
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KRRX71fFJz305B
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Mar 2022 07:00:38 +1100 (AEDT)
Received: by mail-ej1-x62c.google.com with SMTP id yy13so24729074ejb.2
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Mar 2022 13:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=78iW5XK4+ASAwJVsAvI1krxN1Cn3kULaSzDMrQW3lbE=;
 b=W7sg25bHaszzvWVJN0gyX6n6UFKurK5uWS8e6vL3YRtpn8QA30BzDbsf0Fo0KnzuVo
 f5lgeCM1g7VjeI4+YsTMtUtXLU8OULMmeB5PSBFxtOhNQxOmFPwV58KHSise/8GMyt0R
 UkRxgQ3CLiyEWm9B5wmzgYC64NBf7VmqUh+uCDsTRhKm1dBL3PhDD7kvx2KxY5v+Ou9s
 LtCbA+PaAxJA8Aqhhp0q2Rfl3QnpipqfZJ/WNelj96BMMf018qhLZN8AMLxNqJh1Ixg8
 Af8ZbFHjT7fOZzcs+O1sgyvPQnq9W6Aze+RWRCdQHnD8mS6FSfbjKHib+pU03gWIfqf1
 ov8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=78iW5XK4+ASAwJVsAvI1krxN1Cn3kULaSzDMrQW3lbE=;
 b=1QCXekiJ2tcztNDMrUMEdu9xUc+tIMH0Q1gNNPKbHYOeL7WJYma9JxEwR/YTjdmTzV
 1XUHHJmsHkx16BFnpXF0+vFrLOWRVq6FQe453T9iXyqbMd7E29QbqYNbmoeQ5CNno2sF
 7nPEtGIFnQAQkwL7rZ89AB2qpt59p0wI39H/ZUH2LtFOFGD6pqVSvo4PbMCXbmEDm1k1
 YX614xw0C7G5fPwrDwZM8LO9NGm8V34SrzpjzmYIQqZR35UFihJwv6tntei5OIP7Ohig
 6zDFeeZJBteGZ9Li4qOVBieg0kNyRTyy+LZl+6oJRX6FHQcsuEE1uav97MdFqYrCQmf5
 lWCw==
X-Gm-Message-State: AOAM531otYrcdkWwKh2bmL2JMaYOuei86z5gbcH1VLMbWv6nmFJKqzk+
 WKDeZXQ2yPH3hvXOrWVm6Ub9GbZdXo/4+jIV35U=
X-Google-Smtp-Source: ABdhPJwdyxkAQAdfH1wRFs+W0MNyk4bgRb4Rgv1M9DLQvwm3YbnfTG06hhOU+eKDq7Hs4uOIofL7RgDFq+x0npk+U+Y=
X-Received: by 2002:a17:907:628e:b0:6d9:c6fa:6168 with SMTP id
 nd14-20020a170907628e00b006d9c6fa6168mr23537601ejc.132.1648411230602; Sun, 27
 Mar 2022 13:00:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220326165909.506926-1-benni@stuerz.xyz>
 <20220326165909.506926-5-benni@stuerz.xyz>
In-Reply-To: <20220326165909.506926-5-benni@stuerz.xyz>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 27 Mar 2022 22:59:54 +0300
Message-ID: <CAHp75VeTXMAueQc_c0Ryj5+a8PrJ7gk-arugiNnxtAm03x7XTg@mail.gmail.com>
Subject: Re: [PATCH 05/22] acpica: Replace comments with C99 initializers
To: =?UTF-8?Q?Benjamin_St=C3=BCrz?= <benni@stuerz.xyz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 28 Mar 2022 08:32:29 +1100
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
Cc: Andrew Lunn <andrew@lunn.ch>, linux-atm-general@lists.sourceforge.net,
 linux-ia64@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-pci@vger.kernel.org,
 Robert Moore <robert.moore@intel.com>, Harald Welte <laforge@gnumonks.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, "H. Peter Anvin" <hpa@zytor.com>,
 wcn36xx@lists.infradead.org, Ping-Ke Shih <pkshih@realtek.com>,
 Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 linux-edac@vger.kernel.org, dennis.dalessandro@cornelisnetworks.com,
 "open list:HFI1 DRIVER" <linux-rdma@vger.kernel.org>,
 Gregory Clement <gregory.clement@bootlin.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Ingo Molnar <mingo@redhat.com>, 3chas3@gmail.com,
 linux-input <linux-input@vger.kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Len Brown <lenb@kernel.org>,
 mike.marciniszyn@cornelisnetworks.com, Robert Richter <rric@kernel.org>,
 Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 Kalle Valo <kvalo@kernel.org>,
 "open list:LINUX FOR POWERPC PA SEMI PWRFICIENT"
 <linuxppc-dev@lists.ozlabs.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Loic Poulain <loic.poulain@linaro.org>, Borislav Petkov <bp@alien8.de>,
 Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux@simtec.co.uk,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 "open list:ACPI COMPONENT ARCHITECTURE \(ACPICA\)" <devel@acpica.org>,
 Karsten Keil <isdn@linux-pingi.de>, Tony Luck <tony.luck@intel.com>,
 Nicolas Pitre <nico@fluxnic.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-wireless@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "David S. Miller" <davem@davemloft.net>, James Morse <james.morse@arm.com>,
 netdev <netdev@vger.kernel.org>, Frederic Barrat <fbarrat@linux.ibm.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Mar 26, 2022 at 7:39 PM Benjamin St=C3=BCrz <benni@stuerz.xyz> wrot=
e:
>
> This replaces comments with C99's designated
> initializers because the kernel supports them now.

Does it follow the conventions which are accepted in the ACPI CA project?

--=20
With Best Regards,
Andy Shevchenko
