Return-Path: <linuxppc-dev+bounces-15661-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D183AD1B06D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jan 2026 20:25:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4drK2b6lthz2xWP;
	Wed, 14 Jan 2026 06:25:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768332311;
	cv=none; b=cTJo9XP8uB9lVjrPSaRjEe1OEKSSkjrU2nHTqMjX1t2Riavn8TCudzjfkCO/C83JB1pxay3FQYZY/lceGCtO0e9fjeZtFIngRKxtCpM3GrbMkJusy/ysiT85xRsOE+mYvWtX2BFHhS55EsVdHPYhHoT9y23tf4Fu5fzSg9UQ0kGl38rfSv9nWri87QJvBJjpzFwGibuj7wtWVmtL7UV1wzoOB9K3BcRuiI9avTlyNtQtCTz7WnRaN9/J6ugZb+H3bJl6m+73+jvCuUNNMWHf6O1zuBadLN6Un4EeLm0NBgr9Dsiq9i5nvdYKcj23vYD7VuYjxCrrlraJ1Up4m9FyKg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768332311; c=relaxed/relaxed;
	bh=RbkuFGzZ/qxkFM1i2QPzG5mu1vRK4w8zsIRNMINeoQk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hYoJW9zM/kU/DlKnnK7i5Vfd9RAGmhm73SPLONT3a3H6/DMe/5NN8qjVANfYH4bhnILGz2Ofya1DKtz9gcS9MBgk8lfj2LLBOMvH/kbmWoUXfE5ZZsJrzxWiTF2Hl3MS1ptZjzAC8PvEeOPI86G/GkHP6Ut8OW2Uh08I0Betrd5UEkiOuiP9eGvoFc9hWEySbuFrHFamg640RqMTubibMqTSid8oyMVtmFKaaZZIMnCjvb4L1XwabqeqSTDAP949ZZT/SOzWBY6i+x6sgTBjtTqY9RPrDDDNettKIvMQVJHmu+FQmtc+7F/8aQ/XenerIzy3M26VDNLJWZxk+/9ukA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=fgod3tPV; dkim-atps=neutral; spf=pass (client-ip=185.246.85.4; helo=smtpout-03.galae.net; envelope-from=maxime.chevallier@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=fgod3tPV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=185.246.85.4; helo=smtpout-03.galae.net; envelope-from=maxime.chevallier@bootlin.com; receiver=lists.ozlabs.org)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4drK2Z2m7Yz2xQs
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jan 2026 06:25:08 +1100 (AEDT)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 467834E420B1;
	Tue, 13 Jan 2026 19:25:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 084C160701;
	Tue, 13 Jan 2026 19:25:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 614E9103C8516;
	Tue, 13 Jan 2026 20:24:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768332301; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=RbkuFGzZ/qxkFM1i2QPzG5mu1vRK4w8zsIRNMINeoQk=;
	b=fgod3tPV+p1NxOdA3zr/s/ztTDol0auWhGDfnLz8DV+a36lyWFl5w/RL9Mk20DTSZSmeIm
	FYd6DGbVsUCDh9GIAbaxF1NSKpjgdZbo98lb1RRj6mPwjhtABFQKR5Y7G63FIngKmo8kiM
	TFtSWBZN9uXSmyDd7XKqFgPtW0JM38x1qqpX05IOkQC8/iNvliuPWpCqz8FbpUgRVQxSJx
	/UES1Lp5Wq/VHLRSW6XOQTsaIY3UmESF1ZAJ8Qu129MkxCdk6lzI5QRtHOEX9W6Krdscsc
	PgaR74V6SJ7DlCU6JPBLpQ5Rba+UuT//K23jY7FEU9q0R9q59D+b2futuEkOdg==
Message-ID: <6b8aebe7-495e-40e5-a99d-57f8f7b2e683@bootlin.com>
Date: Tue, 13 Jan 2026 20:24:49 +0100
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: freescale: ucc_geth: Return early when TBI found
 can't be found
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Pei Xiao <xiaopei01@kylinos.cn>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, netdev@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 thomas.petazzoni@bootlin.com, Dan Carpenter <dan.carpenter@linaro.org>,
 kernel test robot <lkp@intel.com>
References: <20260113074316.145077-1-maxime.chevallier@bootlin.com>
 <d89cb3a7-3a55-4bdf-805a-b3386572b220@bootlin.com>
 <aWaSnRbINHoAerGo@shell.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <aWaSnRbINHoAerGo@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Russell,

On 13/01/2026 19:44, Russell King (Oracle) wrote:
> On Tue, Jan 13, 2026 at 09:16:29AM +0100, Maxime Chevallier wrote:
>> Hi,
>>
>> On 13/01/2026 08:43, Maxime Chevallier wrote:
>>> In ucc_geth's .mac_config(), we configure the TBI block represented by a
>>> struct phy_device that we get from firmware.
>>>
>>> While porting to phylink, a check was missed to make sure we don't try
>>> to access the TBI PHY if we can't get it. Let's add it and return early
>>> in case of error
>>>
>>> Reported-by: kernel test robot <lkp@intel.com>
>>> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
>>> Closes: https://lore.kernel.org/r/202601130843.rFGNXA5a-lkp@intel.com/
>>> Fixes: 53036aa8d031 ("net: freescale: ucc_geth: phylink conversion")
>>> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
>>
>> Heh that's what I get from sending patches while having mild fever, the
>> patch title is all wrong and should be :
>>
>> net: freescale: ucc_geth: Return early when TBI PHY can't be found
>>
>> I'll wait for the 24h cooldown, grab some honey + milk and resend after :)
> 
> A question - based on dwmac:
> 
> When implementing dwmac to support 1000base-X, the dwmac doesn't
> implement the _full_ 1000base-X, but only up to the PCS. The PCS
> provides a TBI interface to the SerDes PHY provided by the SoC
> designer which acts as the PMA layer.
> 
> The talk here of TBI makes me wonder whether the same thing is going
> on with ucc_geth. Is the "TBI PHY" in fact the SerDes ?

Yeah I think it is indeed.

> Traditionally, we've represented the SerDes using drivers/phy rather
> than the drivers/net/phy infrastructure, mainly because implementations
> hvaen't provided anything like an 802.3 PHY register set, but moreover
> because the SerDes tends to be generic across ethernet, PCIe, USB, SATA
> etc (basically, anything that is a high speed balanced pair serial
> communication) and thus the "struct phy" from drivers/phy can be used
> by any of these subsystems.
> 

True, and I completely agree with that. The reason I didn't touch that
when porting to phylink is that the device I'm using, that has a
Motorola/Freescale/NXP MPC832x, doesn't have that TBI/RTBI block, so I
can't test that at all should we move to a more modern SerDes driver
(modern w.r.t when this driver was written) :(

Maxime


