Return-Path: <linuxppc-dev+bounces-10928-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4873BB24705
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Aug 2025 12:20:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c249w34myz30Tf;
	Wed, 13 Aug 2025 20:19:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:4b98:dc4:8:216:3eff:fe9d:e7b4"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755080388;
	cv=none; b=e8b8Q9pxL2xz7bMExSf5SwxNwj4BQPcZ/HYSQZqsqDqw/jROFPYesj9Njt5gdmMjDxeJEji7ofH+9oWfuYE17r8KiuD8Wm9ZUzvPLoK0Zfr0SpUK6l3+T02D6A/KNqAjSGV632cu7w/ZoQhDw5E8BdCb/tX/uI7dA+m5l8LvYVxGkYIWFZ0x0lLlXdifWgwUyJe8WzKcBYk+Si9fxWe9nG3OplQ1ysM7LVYYb3sNOhX+YM18V67GJmvdj9FXZQY5gXCLk3QL6jybQGglgs44HcfP6Ukbuy33KRekypRpJ3ShvPs9XOzdn5swh8MrZbpJKnyJcGFGCPNNi8+HzrkMIw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755080388; c=relaxed/relaxed;
	bh=G7UbX7wwdujFeV96LuYWTurrjLvi+YelqhVDF3Pcf00=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Cf0ClGcYvEiZ0gaSuwsnl+fxmragbzBy2/DpKpjfuxiMYBUQrGLo55BufhIn4bm6/FSJ+qS8MqgxwHA5UI0vzAH0qoIhT6GR1nWHhg7il3GNthh80xwA36FPu/5ibehOQDFGa/0vE1u7xEiS1cTTzlXw9HxsgTzkxakQ4hzp0MZrVVzCWc4igbEpX1MuJ3K+4XprCF6MXHNE7tSrLUWMmazVqrJtc1EIDz34gPHh2boHf0O4rSu72SPslao2ci2pDGnR48s6c5GCd2Pd1ZCb3GUuCBmUP5Jhu+1NCNfQqR9hew4iiP6uL5EVAVyyIeqn2ptMLqf4zVwZCWzLf99pqQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=nhYc/d25; dkim-atps=neutral; spf=pass (client-ip=2001:4b98:dc4:8:216:3eff:fe9d:e7b4; helo=mslow3.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=nhYc/d25;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8:216:3eff:fe9d:e7b4; helo=mslow3.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [IPv6:2001:4b98:dc4:8:216:3eff:fe9d:e7b4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c249t2kcwz30T8
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Aug 2025 20:19:46 +1000 (AEST)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	by mslow3.mail.gandi.net (Postfix) with ESMTP id 634AF58135E
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Aug 2025 10:07:18 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 53C3243AEB;
	Wed, 13 Aug 2025 10:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1755079631;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G7UbX7wwdujFeV96LuYWTurrjLvi+YelqhVDF3Pcf00=;
	b=nhYc/d25atOCsZxnP1BEo73b0xDSNGkU898413PEZDQFCUgi/jl+A+7JH7vH20jh8/YOjs
	LdM1LNR+kiCqf0IvpJqxUZkxJACTkn9jRgelrng9Z4lSbWhOhBT8M9hiX/rzjkFWTDgb/X
	4N1EBLUBy8awRI84adTQSYNt+C2WnIZK7j+Ke50aNfBW4B8fjN0fTC6G4nyqAs+OgPZBht
	jywA83eeqdf2xFxU+Uyb3XGkSHC6HfhyiVBgbI6EQ/dZSN9G2DnURreLuaGIYlMGkmjcXi
	a0GWFTA2Ud24urjwlyzV/l78wWOVNxtF+xNzE+mQIwSIxEyqgK0CM1ArFj2qFg==
Date: Wed, 13 Aug 2025 12:07:08 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Qiang Zhao <qiang.zhao@nxp.com>, Shengjiu Wang
 <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam
 <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 4/4] ASoc: fsl: fsl_qmc_audio: Drop struct
 qmc_dai_chan
Message-ID: <20250813120708.7d0303b7@bootlin.com>
In-Reply-To: <0e73d47d15cf38ad5c4c35fbab545153829dde75.1754993232.git.christophe.leroy@csgroup.eu>
References: <cover.1754993232.git.christophe.leroy@csgroup.eu>
 <0e73d47d15cf38ad5c4c35fbab545153829dde75.1754993232.git.christophe.leroy@csgroup.eu>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddufeejleefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtkeertdertdejnecuhfhrohhmpefjvghrvhgvucevohguihhnrgcuoehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepveeiffefgeeitdelleeigefhjeelueeuveekveetgeffheeltdekgeduiefggfdvnecukfhppedvrgdtudemtggstdekmeelkeeltgemkedttddtmehfugekudemleehgegvmedvudehrgemfeeluddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdtkeemleeklegtmeektddttdemfhgukedumeelheegvgemvdduhegrmeefledutddphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedugedprhgtphhtthhopegthhhrihhsthhophhhvgdrlhgvrhhohiestghsghhrohhuphdrvghupdhrtghpthhtohepqhhirghnghdriihhrghosehngihprdgtohhmpdhrtghpthhtohepshhhvghnghhjihhurdifrghnghesghhmrghilhdrtghomhdprhgtphhtthhop
 egiihhusghordfnvggvsehgmhgrihhlrdgtohhmpdhrtghpthhtohepfhgvshhtvghvrghmsehgmhgrihhlrdgtohhmpdhrtghpthhtohepnhhitgholhgvohhtshhukhgrsehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhhgihhrugifohhougesghhmrghilhdrtghomhdprhgtphhtthhopegsrhhoohhnihgvsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: herve.codina@bootlin.com
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Christophe,

On Tue, 12 Aug 2025 12:50:58 +0200
Christophe Leroy <christophe.leroy@csgroup.eu> wrote:

> prtd_tx and prtd_rx members are not used anymore and only qmc_chan
> member remains so struct qmc_dai_chan has become pointless.
> 
> Use qmc_chan directly and drop struct qmc_dai_chan.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
> v2: New
> ---
>  sound/soc/fsl/fsl_qmc_audio.c | 50 +++++++++++++----------------------
>  1 file changed, 19 insertions(+), 31 deletions(-)

Acked-by: Herve Codina <herve.codina@bootlin.com>

Best regards,
Hervé

