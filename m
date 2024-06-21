Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE96911AC7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2024 07:58:07 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=wO5bF2dn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W568n2Q8Pz3cYm
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2024 15:58:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=wO5bF2dn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=web.de (client-ip=212.227.15.3; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=lists.ozlabs.org)
Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W5684694Jz2xjK
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jun 2024 15:57:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1718949371; x=1719554171; i=markus.elfring@web.de;
	bh=70TtcVLm9kmqiepSERoWu/9Hwwx1Rf4phfsof9PPYa4=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:Cc:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=wO5bF2dnR36pYugAZFszjcO3gw0sL18WgGHyX6gNBuq9IaZKpqCaNVBg+xCZQrMx
	 Y2/x2INaouP5hzu5A401lKHRk7OGa3pJy5idb/1yHkzlUWvXWThvtMFbrnTqNOOaQ
	 DijgoTMjTEyJ+dI2rxFtO1nrQdEFiMI+S/8ZepiBj2pGkSWclmr6QLpGDbcMh40Q+
	 XRUlVAvh/BsNifyu6T8mjVYsbFLPDy2WrtwyIoO94VC1T7Y7w5W5sAhzntGtkBQkM
	 Sg3JFn+9S/TJCMLmkTHUru/f9YHCz3ElL6T4dGGVpuOJy1ueVodJvxjo5Odt1Pd/j
	 EoKpzuAwElV5I+mU2Q==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.95]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MN6FV-1s1cnG2hm9-00UG7M; Fri, 21
 Jun 2024 07:56:11 +0200
Message-ID: <bc3d018e-5a60-46b0-8e84-7158d231d2cc@web.de>
Date: Fri, 21 Jun 2024 07:56:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Patch v4 07/10] ARM: lpc32xx: Remove pl08x platform data in
 favor for device tree
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
 Yangtao Li <frank.li@vivo.com>, Arnd Bergmann <arnd@arndb.de>,
 Li Zetao <lizetao1@huawei.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Chancel Liu <chancel.liu@nxp.com>, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 linux-sound@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-mtd@lists.infradead.org
References: <20240620175657.358273-1-piotr.wojtaszczyk@timesys.com>
 <20240620175657.358273-8-piotr.wojtaszczyk@timesys.com>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240620175657.358273-8-piotr.wojtaszczyk@timesys.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:iTUduqMb9cBGoyLdNuW6NQOj676Ul3b9o6PsNTkjdCixiNwYyKR
 oRvmzegMp0qsnzSo70irPsk4uNh054uLIALzh4CztbqWraJbmZHWwsKMRTm8H8QF3uXl6aw
 kX1K/LyUquko0H/IMh72DAyOoKYpTBJD4E6yCi3y21vP7Qgmc0rbTfrxSric9CHiwM0yEkI
 srUTTBp1uUclGZLL0j4BA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:4zwWuLMBIcI=;p3T9mcjmv9EhVlHD/sbm6ZtwCba
 UW1bkeS7/UTJNK3NQOP8ZTd48Yusiy5ZCAL1lyRMxOHwlVEQftGxe98qQylZmEpcdepsI+I/O
 /Gd7WAKyUHB2sWSHJFyt0//5tzvkYVAoJqXpUa173WTSwzFjjp8Mmm16e3xjTwMiEFa8s1wFo
 RMVLj3dQ43GBmpWNbS+3WoOplbIYIXLIkTgqR0dhJ4mOuVn7lHvfrCplqqsferQTJvMYZH7Ns
 INtfxjHQy8bLawfnhVbbBE/yeGK0Fy4EbE/1qo+BZpOZK8+cjnghxQiiNggT9SJC+GIa2e0zP
 rnZGJ5ZtpynHbThpuiManMYgp/NWQfdMvTFFm5GdzCAvNlfWeSzAbYaxc/DPQ8sT/Y6Xw89rd
 q8uoiSTyU6wQpib1I/h7mL0JaUI5nU9o3ByLA4f87UBVBXaz5YcBmAvvNVoEVCVylJ2gm24eb
 TWhgJG8fsq5TFXpP3zrBtVGr6/cqv3HwJv9XoRqhahaTAuc9AnSt9P/xeisDATr5AxmRFGNZn
 Bf/aIaIQEJArOgYQwP+hVLatduOlUoeajtsaXAzmhQhWtQhSvVjGxsNbdKOpwkku0X5GctvOg
 gJWAZy6HqbpBqQ8qQNH8sZen5E60fHE9ZMADZS9NrbJYBwfUApaMyYfHpyOEsdlZ9xrGY2Bvg
 s5zglaFXZisv5uabkgkayKCx/HDe0gnGtkZ6QIu4bm/w9BbmW0vXhd6jTqtK9ZCyhGf0aHRV6
 4HgugA1UVbpqfWetnoa0VNmw+tRV61JKjOqSbx+O2VEMFROG/2I206GuAeiCCobeg14qAVH39
 d60BOgwvPQJESFlorxlJel7invZ+WB2Ew+jDa9ggMRf9o=
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

> With the driver for nxp,lpc3220-dmamux we can remove the pl08x platform
> data and let pl08x driver to create peripheral channels from the DT
> properties.

Do you see opportunities to improve such a change description?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v6.10-rc4#n94

Regards,
Markus
