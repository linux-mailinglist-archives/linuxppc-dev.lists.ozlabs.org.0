Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 06FBF63EC22
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Dec 2022 10:15:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NN9RD6dVnz3bcN
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Dec 2022 20:15:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=arinc9.com header.i=arinc.unal@arinc9.com header.a=rsa-sha256 header.s=zmail header.b=kC5OJuae;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arinc9.com (client-ip=136.143.188.14; helo=sender4-op-o14.zoho.com; envelope-from=arinc.unal@arinc9.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=arinc9.com header.i=arinc.unal@arinc9.com header.a=rsa-sha256 header.s=zmail header.b=kC5OJuae;
	dkim-atps=neutral
Received: from sender4-op-o14.zoho.com (sender4-op-o14.zoho.com [136.143.188.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NN9QG31k0z30hw
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Dec 2022 20:15:01 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1669886069; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=PuFREHxuJ3FoD3zI0cgmwgxXBACrFbsNXtmB1ZUDMZF0Vw7u5go+yLfWIyRlKmsI4dy/C4JBEgDliSKn1GHoNmOpzBqaWl6iXr8io/eTVI3oCPsCmOMRaRxdzRXptLt4DP3hnV53GkO6NAhhWer+prEaTAbxrLXw/JqtvaQrzWo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1669886069; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=rmnGX0as+j0mWZhRBwCINR7c9wsJ33DTrPhAflpkh7k=; 
	b=fw/MEtbCpCH9VgI82wo0vE16g6dZ8NV1Le4xk0BjWdTYK38rt7XBr8kXPBBPo3YRUN6Qe0dqE8w6e3UHXsxU9mNhstxy2c3zRoUP/VEPwky/wlzovr2sCQ7tztCh20i22nk9oPAoF3GnSvN5RPlNAcT6sNLjUOovaigMSm1VuKI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1669886069;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=rmnGX0as+j0mWZhRBwCINR7c9wsJ33DTrPhAflpkh7k=;
	b=kC5OJuaedGtqPWAXavS8QBOXmOzGAN9KVKeFTZblN5hQvtgIY+bZgMHEmvSv5xeL
	m50GcHUsZyBhq0mNsX+aCeIwwvLqFeeWwtPZKWwBHrfnYXDUeClaEjUb82O6yrKKDVx
	OifNFxxqXQi0y0KKnh1zyARvxBzbuGAfmR/P71Bk=
Received: from [10.10.10.3] (37.120.152.236 [37.120.152.236]) by mx.zohomail.com
	with SMTPS id 1669886067241836.827775278157; Thu, 1 Dec 2022 01:14:27 -0800 (PST)
Message-ID: <b5ed90cf-1b5d-9306-7b06-ded7c331ca2a@arinc9.com>
Date: Thu, 1 Dec 2022 12:14:21 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 0/5] remove label = "cpu" from DSA dt-binding
Content-Language: en-US
To: Jakub Kicinski <kuba@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 soc@kernel.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Michael Ellerman <mpe@ellerman.id.au>
References: <20221130141040.32447-1-arinc.unal@arinc9.com>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20221130141040.32447-1-arinc.unal@arinc9.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
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
Cc: devicetree@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org, Vladimir Oltean <vladimir.oltean@nxp.com>, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

I'm sending a more specific mail to make sure this series doesn't fall 
through the cracks like Andrew said. I'd like this merged this week 
before the merge window closes.

Jakub, please take patch 1.
Arnd, please take patch 2 and 3.
Thomas, please take patch 4.
Michael, please take patch 5.

Arınç

On 30.11.2022 17:10, Arınç ÜNAL wrote:
> Hello folks,
> 
> With this patch series, we're completely getting rid of 'label = "cpu";'
> which is not used by the DSA dt-binding at all.
> 
> Information for taking the patches for maintainers:
> Patch 1: netdev maintainers (based off netdev/net-next.git main)
> Patch 2-3: SoC maintainers (based off soc/soc.git soc/dt)
> Patch 4: MIPS maintainers (based off mips/linux.git mips-next)
> Patch 5: PowerPC maintainers (based off powerpc/linux.git next-test)
> 
> I've been meaning to submit this for a few months. Find the relevant
> conversation here:
> https://lore.kernel.org/netdev/20220913155408.GA3802998-robh@kernel.org/
> 
> Here's how I did it, for the interested (or suggestions):
> 
> Find the platforms which have got 'label = "cpu";' defined.
> grep -rnw . -e 'label = "cpu";'
> 
> Remove the line where 'label = "cpu";' is included.
> sed -i /'label = "cpu";'/,+d arch/arm/boot/dts/*
> sed -i /'label = "cpu";'/,+d arch/arm64/boot/dts/freescale/*
> sed -i /'label = "cpu";'/,+d arch/arm64/boot/dts/marvell/*
> sed -i /'label = "cpu";'/,+d arch/arm64/boot/dts/mediatek/*
> sed -i /'label = "cpu";'/,+d arch/arm64/boot/dts/rockchip/*
> sed -i /'label = "cpu";'/,+d arch/mips/boot/dts/qca/*
> sed -i /'label = "cpu";'/,+d arch/mips/boot/dts/ralink/*
> sed -i /'label = "cpu";'/,+d arch/powerpc/boot/dts/turris1x.dts
> sed -i /'label = "cpu";'/,+d Documentation/devicetree/bindings/net/qca,ar71xx.yaml
> 
> Restore the symlink files which typechange after running sed.
> 
> Arınç ÜNAL (5):
>    dt-bindings: net: qca,ar71xx: remove label = "cpu" from examples
>    arm: dts: remove label = "cpu" from DSA dt-binding
>    arm64: dts: remove label = "cpu" from DSA dt-binding
>    mips: dts: remove label = "cpu" from DSA dt-binding
>    powerpc: dts: remove label = "cpu" from DSA dt-binding
> 
> 
