Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 710AE63F6DA
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Dec 2022 18:51:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NNNtT1nrTz3f9s
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Dec 2022 04:51:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=arinc9.com header.i=arinc.unal@arinc9.com header.a=rsa-sha256 header.s=zmail header.b=Sxoe6pf0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arinc9.com (client-ip=136.143.188.14; helo=sender4-op-o14.zoho.com; envelope-from=arinc.unal@arinc9.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=arinc9.com header.i=arinc.unal@arinc9.com header.a=rsa-sha256 header.s=zmail header.b=Sxoe6pf0;
	dkim-atps=neutral
Received: from sender4-op-o14.zoho.com (sender4-op-o14.zoho.com [136.143.188.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NNDdZ3v1Cz30R8
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Dec 2022 22:40:02 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1669894669; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=QTQmm9pOeLgmKb8bWo/bk1tmntAG21CY8mqL5Y7GzMv84vMVC3VrVna9NzX1hngi7eK1jcFyuiSXXvVA9bOp7v2JNs+2P/yWem+qMtXkZfdIeULvLO4Rfg8yQmTObIt1kyNHO2k94mTkgHZvRKbMyIMAcRvOxm9qMfK6qb3t88g=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1669894669; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=dfOEXnlaPDTQyh5hwojKntKZbR0Ct6BYQNOU/3518PU=; 
	b=OYF7SwvD1mv3O+HAFCbq9CfMSGf7fvV73aJ926EunEgVq/bUTdRUCCmRrZD9+8rTw9wNG3PDjimgO76TJJ6VPC/P/vttun+Obu5Dzyp0sS31x9L5iYLvG+rdO6kZvZ2wtK6Gn86PgqwwiOO9sfMtbOWsOMExVMcejf44MYA+nAo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1669894669;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=dfOEXnlaPDTQyh5hwojKntKZbR0Ct6BYQNOU/3518PU=;
	b=Sxoe6pf0viFvg95RBI3wMeoXYd0syHO9a0cEcwxKEbUeNP5X1PyRVz24a8qLfztM
	cNOs3+XlOAmEYW4Cspyrx9xPr6rdVmINXwU/r6bTSOpPefuylQ7S/DIWSUhazWPCj3l
	ohbSEg1Td2+qDT3JhrnQZaDjIZ9aCibjEQyIlKI4=
Received: from [10.10.10.3] (37.120.152.236 [37.120.152.236]) by mx.zohomail.com
	with SMTPS id 1669894667415837.5294444284028; Thu, 1 Dec 2022 03:37:47 -0800 (PST)
Message-ID: <83ed1490-4d87-98c5-2616-54b5f1ab64b7@arinc9.com>
Date: Thu, 1 Dec 2022 14:37:31 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 0/5] remove label = "cpu" from DSA dt-binding
To: Michael Ellerman <mpe@ellerman.id.au>, Andrew Lunn <andrew@lunn.ch>
References: <20221130141040.32447-1-arinc.unal@arinc9.com>
 <Y4d9B7VSHvqJn0iS@lunn.ch> <32638470-b074-3b14-bfb2-10b49307b9e3@arinc9.com>
 <877czbs8w7.fsf@mpe.ellerman.id.au>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <877czbs8w7.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-Mailman-Approved-At: Fri, 02 Dec 2022 04:43:21 +1100
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Heiko Stuebner <heiko@sntech.de>, Geert Uytterhoeven <geert+renesas@glider.be>, Tim Harvey <tharvey@gateworks.com>, Vladimir Oltean <vladimir.oltean@nxp.com>, Linus Walleij <linus.walleij@linaro.org>, Konrad Dybcio <konrad.dybcio@somainline.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Stefan Agner <stefan@agner.ch>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Oleksij Rempel <linux@rempel-privat.de>, Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, Florian Fainelli <f.fainelli@gmail.com>, Samuel Holland <samuel@sholland.org>, linux-rockchip@lists.infradead.org, Gregory Clement <gregory.clement@bootlin.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, Russell King <linux@armlinux.org.uk>, Jernej Skrabec <jernej.skrabec@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, Sergio Paracuellos <sergio.paracuellos@gmail.com
 >, Chen-Yu Tsai <wens@csie.org>, Andy Gross <agross@kernel.org>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, NXP Linux Team <linux-imx@nxp.com>, Ray Jui <rjui@broadcom.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Sascha Hauer <s.hauer@pengutronix.de>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Frank Wunderlich <frank-w@public-files.de>, Hauke Mehrtens <hauke@hauke-m.de>, Hans Ulli Kroll <ulli.kroll@googlemail.com>, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>, linux-mips@vger.kernel.org, soc@kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Scott Branden <sbranden@broadcom.com>, netdev@vger.kernel.org, Bjorn Andersson <anders
 son@kernel.org>, Rasmus Villemoes <rasmus.villemoes@prevas.dk>, Nicolas Ferre <nicolas.ferre@microchip.com>, "David S. Miller" <davem@davemloft.net>, linux-renesas-soc@vger.kernel.org, linux-sunxi@lists.linux.dev, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Claudiu Beznea <claudiu.beznea@microchip.com>, Michael Riesch <michael.riesch@wolfvision.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 1.12.2022 13:42, Michael Ellerman wrote:
> Arınç ÜNAL <arinc.unal@arinc9.com> writes:
>> On 30.11.2022 18:55, Andrew Lunn wrote:
>>> On Wed, Nov 30, 2022 at 05:10:35PM +0300, Arınç ÜNAL wrote:
>>>> Hello folks,
>>>>
>>>> With this patch series, we're completely getting rid of 'label = "cpu";'
>>>> which is not used by the DSA dt-binding at all.
>>>>
>>>> Information for taking the patches for maintainers:
>>>> Patch 1: netdev maintainers (based off netdev/net-next.git main)
>>>> Patch 2-3: SoC maintainers (based off soc/soc.git soc/dt)
>>>> Patch 4: MIPS maintainers (based off mips/linux.git mips-next)
>>>> Patch 5: PowerPC maintainers (based off powerpc/linux.git next-test)
>>>
>>> Hi Arınç
>>>
>>> So your plan is that each architecture maintainer merges one patch?
>>
>> Initially, I sent this series to soc@kernel.org to take it all but Rob
>> said it must be this way instead.
>>
>>>
>>> That is fine, but it is good to be explicit, otherwise patches will
>>> fall through the cracks because nobody picks them up. I generally use
>>> To: to indicate who i expect to merge a patch, and everybody else in
>>> the Cc:
>>
>> Thanks for this, I'll follow suit if I don't see any activity for a few
>> weeks.
> 
> IMHO the best solution if the patches are truly independent is to send
> them independantly to each maintainer. That way there's no confusion
> about whether someone else will take the series.
> 
> It's also simpler for maintainers to apply a single standalone patch vs
> pick a single patch from a larger series.

I agree. I'll do that next time.

Cheers.
Arınç
