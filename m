Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F1F4911A9E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2024 07:47:42 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=BcHwKT8q;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W55wp2TMDz3cZB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2024 15:47:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=BcHwKT8q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=web.de (client-ip=212.227.15.14; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=lists.ozlabs.org)
Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W55w40SM0z3cX6
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jun 2024 15:46:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1718948759; x=1719553559; i=markus.elfring@web.de;
	bh=kkYqZYijKZreQC7isvDQVtuAI4cUP9+RI5g70SolPKQ=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:Cc:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=BcHwKT8qczQBUZmomUv0AM6QnX97SDGgPlBDIVTabydiiO2YNuvLTi0vxybiHhtx
	 6ooiz0LklK63jJ12sUOR41eTFnHJ29i6E8dwPItmoNQ8eJ85122eKDwij4wJDHN7E
	 jyhyIJVk1GiWjQyvMjc4L2HZ9tAkI56L1V1w9BsPe0Q4wpW9+gOOMaaqgQfI1/EfQ
	 bL4WzQetE6FwBgkj0JRIkCdRabXU5Yl9TdVjHesjkqim7Er/RNbJyQ9UcnggovU/c
	 jyo4VWLQUVqaDTF9GjRZ7doK/FlD0NXDCi2Nl/YD2mc268HvX7Rf/6BG240vgSaxa
	 hJ2hXVSkzKRX78qM9Q==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.95]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MyvB8-1sYT6j1kTS-016cfq; Fri, 21
 Jun 2024 07:45:59 +0200
Message-ID: <4b368817-11ba-4d6d-9a46-59bee8406ee7@web.de>
Date: Fri, 21 Jun 2024 07:45:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Patch v4 05/10] clk: lpc32xx: initialize regmap using parent
 syscon
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
 <20240620175657.358273-6-piotr.wojtaszczyk@timesys.com>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240620175657.358273-6-piotr.wojtaszczyk@timesys.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:/HnPeG1IAMU/Df3lJw189pApwGB8C6p6sxQOjGGDgYaEXEYX3rR
 1fzF6oMG/oC3y4WJ7MEJ4TBAKQIyhyJR9kLS1DmPUSeNWoeRLiHOx6XiA4dc3aykL6q8xK8
 ppHVp27GOpJ/Bs+b4hwtsFX07S22yoUi7Yykat+/2SOia9gZAP0dOgdRdMUjNp+ybmCNrse
 f6I1C/okSjZJiM9p46NnQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:RZzKrzeMnoA=;3Xr8mLJNU5K+f3Yl83BIysqGVe0
 4rpRYhraZfI1bck68O03DyDm4Cg0Ralh0kzhMQ7XEn/NHb22XhOO/qEek+tkZj9AymaCo5rlw
 bSKPoi1i/ladDc5kcnxbIKRRmcQGzYb4SSgAVMqhYt/qj/PBeAEk81mo2AOh/48zJcgz+wqoi
 MPAi/oqcMFuSKBk+mdhb2o9DXXDBjHLdAU3Yav7jWcUVm9sv3UXQg5rkBV+K14j45sxBBfCgj
 BF0eH/zDH8oj6G819SSeDhWuOAk+DOSqO7rbNv2Qt7c+GSAO2UYlxSB/Rjlnk6hp8CJKsxJLN
 TYBNewFaMSiY6DlviClA4CjSyDZabDzR2UfartoiCxpy0CsdpCAwUZZ7+/W/nRM4IPTPBuXVq
 DZOPeZX3tdo2dEw49H4cW1veaubeQCNBos2daRlftqwTo/+d6d4aoQtD0rHTwlsvcd0g6RObu
 37Jmd3rYX0642LHQoEDxlMQ9ZVSJCkdNf19a7al0wniU1zydyKkNOG7JOzZoS5qXb+WREAufY
 QKToA9R0LG4Ix6eTpjodQq1tzUl7rLtW1asXsu4MO6VZ+MSTWdYTmapSC2TD9GmScTYm+lZwY
 5gpJpFwGpIL0viYTOu0iXtFgTO0Lpw2eVrKsKPMkDP++IbWbuu4VOrvp/t8bgavYXXMUu4T6N
 /6VsHf5yFd4+pm1faTJC+gQmyIZzRN78+tAQwW4DfScDwIVbbvlXUxZShAa6XFjM4//+SobX1
 GbjpiRCVpeFw+GzVaX7nD6J9JYgj6Gh8vBIsAD0+ZwHk6nmmTdIMTVYTFwx3FvFnzFu1tSMhy
 9FKVb+6gaSPCl/M1gSvlML1hIN3Q3IKlJwNFX4wmTfG34=
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

> This allows to share the regmap with other simple-mfd devices like
> nxp,lpc32xx-dmamux

Please choose an imperative wording for an improved change description.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v6.10-rc4#n94

Regards,
Markus
