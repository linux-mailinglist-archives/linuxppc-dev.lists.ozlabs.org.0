Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6DB1911A76
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2024 07:38:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=OxGxApPm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W55kj2b3lz3cZd
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2024 15:38:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=OxGxApPm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=web.de (client-ip=212.227.15.14; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=lists.ozlabs.org)
Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W55jx3qc8z3cXb
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jun 2024 15:38:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1718948207; x=1719553007; i=markus.elfring@web.de;
	bh=1SQIJLyP8KM0t0hXj5dAJLCq9lDBaf/TIWUVsJ97Ung=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:Cc:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=OxGxApPm3qrh/Uq5UHSKdmuHA/EdQNdVJma2RSdg+S1AafTTsW8sFpAYf2MgTKfv
	 fZqivsvv+R5zbqNTRfhhkPPlGppoe5bmTcmMuGHMKC0k/OAykV552sZwl8awTQDsB
	 AGzeQ4RW7xxaGjveQJX3GD9ERf6C+RV4Ym6AX+TKIf52lZS7atgVBQbv1mV4RtSRH
	 KkLEhiS7KHYlRbJUQEAALxh1GO9FOVOYR0xJfPw94pP+vbFbjZ76u0PXn2nVtSrHY
	 6zTbgoX3wK0YvcjZsvq6EeqaZsHZhLuAlAjT+yQReM8MI5A86H1yxI1+ANljXev5R
	 k8YcZrvMI2bYGwTXBg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.95]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1N0Zs0-1sWp6x1rro-018Giw; Fri, 21
 Jun 2024 07:36:47 +0200
Message-ID: <a39f024c-7ab0-41f2-839d-ee2f62ddd6e9@web.de>
Date: Fri, 21 Jun 2024 07:36:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Patch v4 04/10] ARM: dts: lpc32xx: Add missing dma and i2s
 properties
To: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
 Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, "J.M.B. Downing" <jonathan.downing@nautel.com>,
 Vladimir Zapolskiy <vz@mleia.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Arnd Bergmann <arnd@arndb.de>, Yangtao Li <frank.li@vivo.com>,
 Li Zetao <lizetao1@huawei.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Chancel Liu <chancel.liu@nxp.com>, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 linux-sound@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-mtd@lists.infradead.org
References: <20240620175657.358273-1-piotr.wojtaszczyk@timesys.com>
 <20240620175657.358273-5-piotr.wojtaszczyk@timesys.com>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240620175657.358273-5-piotr.wojtaszczyk@timesys.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:Q7NNgNryQC4SvaqLSK46kUdFDA/ZWIIeO+B+DYHgCi0VqphfXz0
 LxOkeihG+Vrnw4q7094DPBzn7YDv2hUbpmVAdrJiShrqQhvj/8VJB5CO1x9U8dSN1exLjhS
 laSizbk3rhAQA4KMMEgqhwVU706cLgRCb467YcJy47Twkvz6B9MtZOubwGfQ9bMn5k+qiZq
 UXTnwNamwsXRAU6cK3a+Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:sxFXbRmwiow=;ItU3h73LSNWoHkiePPzF614YhOu
 vuWij/Wyd7G8C5bGFuxA34oRBoufqeSTJ1sO9oRDCQE17yA7yy+qUu1NsP3rGmwp607imLjET
 tlxMODkKmLWwjZN6WYB6OA00j+fL4/qe6kTDDGUFCsG3taFS+ziaS/XOF31nR0iYxmcGadXTF
 6WbDUOyp+fcYOvOUMdt9RtSb2KDjSlAT7V/u2dyxjIY7X2vNdA2A3LesS4hrWtUQ/j9jjsvCn
 9beVtwcM8ulERcSMjuM741ha+Tw/qMRQ7gvbaw8+RqndqAdbkDOMNKreIXpENNCPmnCrs2u7d
 uu7d4ceOXvKIb0nfzXvE8ZxudF5gVftjMcbGm9p5v/g2bWH7hYwtq5BZvz2s5DSK5Ta2ADRIX
 Zj2gqGUTQD6PH2NOVY/JvDoxrqN45EWShbKqn6+ZNV5ks/kb+tYB/7ZiQ0Pa0HXSr9tf+A+so
 2m0HXc6DpDDbA5nZafQpxxhgKpzPfPkjIo0773z24llMY/3IgrJYUbesX+Q5vBXyKqmi9y2M0
 LK96kUrboZ04zfJ43TiSAduhHGvUqMa0Jd2kkqNGi3fbr9ha1sNkt9rYqZm5yiKLdvXbfM2No
 5QPLKvW7DEDeT5xgYTZuSUEhGr0NvKoFBDWXfNP1E1JvGayANL1ZwqCpCoC1SFc5KVhOkyEO2
 22iZ/kQ+CA2ClHf081/2WBHIHecK0qpypwt0wXVmjFbC/kbygWKAOart5LMzLQ+2A7RERaKAl
 2v4BF7zzWd40QCWglLMTkaLvdwDoghAUBkoMXKoI+FWfJV1ZYWSEIJdBn8GPUvZFcmMAMgaTm
 TmADuSAnsOy9ft+lNhrWayN5+XfvhQrVkx6wjoHCE4kfM=
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
Cc: LKML <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> Adds properties declared in the new DT bindings:

  Add?                                How do you think about to replace such an abbreviation?

  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v6.10-rc4#n94

Regards,
Markus
