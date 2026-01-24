Return-Path: <linuxppc-dev+bounces-16274-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sNWCGtfVdGlc+QAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16274-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Jan 2026 15:23:19 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF7AB7DC9A
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Jan 2026 15:23:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dyxq370z2z2yDk;
	Sun, 25 Jan 2026 01:23:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c407::1" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769264591;
	cv=pass; b=AbmpK4sCaYYj1PcYz6KQJbiR2mg7zbK2eYCACv7RXO+JJgOZ33y2axZnlp9XS3xrw+FJlsbfYnCu7KGrtDQxv5RQW3OwSymKlWmsosUq9gMPjAR7WMoGH5MuU1H6/RdhBnKdi9LWcZQ+N8jbnbvGk4ocu+gyvudOUHGVJig8bzsfxqBFBmEpyTZkeG/Z70Nx9rASfC+2oO9CpdnjGUvfjnVhEirJtFck8vUMjqjnl0CDhci9v5Jv3XQxm5SP0k+0xRCgAE0kkH5ouY50VOk54dzToKPhcwB/JCiQ+T8iZdYsXs/3qem+iMDq5PdSe/guLSXnAajzl+/xsNgYrdzwNA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769264591; c=relaxed/relaxed;
	bh=OnwWE33BUV7hdPFgs+30VmhJLyk1xRkaN2i5xkZlBHc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=mxdJjKchp4UC9I/bhtX2lLxAFpfynkUhLfPZUdCsWTHyX4vV8m9i8J9+cGIb7gh3j3Yni1JWxP9ir3CM9QKGOPuFkx6X7IZA90upqw5bgldgV3mEVHSK06lCRLhLgsfjgpGxWWJ0M26bNXt/e3U7pr8PJp/BwixcKCrKpoFcNBe2zeQ4UyUBbLedbO9tNa5xh3NvnlEjbHB8l146o3EVyycEjrxq4xb8BihtLp7y26T4YuCTGNGmiVrv/WDuBaxJboJahWcRq5DjP1xxH+RUXRDdBIxlH596taY7/FckkXKU9Xq+eErPPYJ0HQI1zskW5NZHnKOqtr+RRT0GCyOeVA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; dkim=pass (1024-bit key; unprotected) header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=XXbkNiLo; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c407::1; helo=os0p286cu010.outbound.protection.outlook.com; envelope-from=den@valinux.co.jp; receiver=lists.ozlabs.org) smtp.mailfrom=valinux.co.jp
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=XXbkNiLo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=valinux.co.jp (client-ip=2a01:111:f403:c407::1; helo=os0p286cu010.outbound.protection.outlook.com; envelope-from=den@valinux.co.jp; receiver=lists.ozlabs.org)
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazlp170110001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c407::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dyxq06kkDz2xlF
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 25 Jan 2026 01:23:07 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l/UYyX9Pxj1fo5ZM1JUzy8dC2FWViovcyuaw2LsT1Ty5SAVv31GDNF9KXB5RsT5ofEkGuKAi7c5ZW6gmV4/1QX7ngO1MmHNA/sZDb5050jH56Bvcia5t9aGQTt9ErAn2AHDZpfcuzVyYTmFbZv/Brso9Z885JF2fKt8qy5Ew5mn4jOQ5o8IAGEm7tHR+V1LlHCUfbf9WvzhH7qIjL8pcdMGg057lyHc/IJnrqG/i8NUsH8iwkM2vB3v3r9OxJVEP42X7Tv7TtlL5TM4s0EWil26PjY2p1KLFIvRI/FSu95jQsoPoOYNNwbWRGj+mV5qLt+lJoD5D0pcINK35Igdrjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OnwWE33BUV7hdPFgs+30VmhJLyk1xRkaN2i5xkZlBHc=;
 b=geDcYLXodsbig7SXNcbihznbbGcF0kQoQa1ghyTMjVrjb1kX/uyEOjbewvTFvJ32GOf4MZ33YoSio4ciQr4gXHArAPy1PuxGC/tayVhBdK8a8/tMAkcri7q29JAlJ0cLlACie39KsqJKfVyu5O0LbRZajI7YQ7kvci+TFrHqYZ6TIJFifBxpYek/Lc9N0bb247ftoqCgGFV3vn+B305Lr7W3J8B/hgmcz0SxUvk2LTjRVMwtxzptgQJ55VZPXybPQ0MfiH+x1eonSCTqHw7vrF5KC9vy1FdSjT2i3Ber9Lz2RRGaQu29JqXrh/9PTEMJYX1dmox5CnpaS2e1taSp+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OnwWE33BUV7hdPFgs+30VmhJLyk1xRkaN2i5xkZlBHc=;
 b=XXbkNiLoZCBTXwFeR7UUFo3b+uyuqPN3hNHR2UTX+zNxm7WYzFGXng6oVd72Ih/Q3P2iFBgwyNvTcBfHrkhSBAkn92RVX0bkG2cALOLkZFcCTk4ZSKKNIIpTU3yQSUycKE5e8I7EDGUmNHzytLC1vUml3iTwi/GkeH8/4O6CuCQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TY4P286MB6864.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:342::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.14; Sat, 24 Jan
 2026 14:22:43 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%5]) with mapi id 15.20.9542.010; Sat, 24 Jan 2026
 14:22:42 +0000
Date: Sat, 24 Jan 2026 23:22:41 +0900
From: Koichiro Den <den@valinux.co.jp>
To: Niklas Cassel <cassel@kernel.org>
Cc: jingoohan1@gmail.com, mani@kernel.org, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, robh@kernel.org, bhelgaas@google.com, vigneshr@ti.com, 
	s-vadapalli@ti.com, hongxing.zhu@nxp.com, l.stach@pengutronix.de, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, minghuan.Lian@nxp.com, mingkai.hu@nxp.com, roy.zang@nxp.com, 
	jesper.nilsson@axis.com, heiko@sntech.de, srikanth.thokala@intel.com, 
	marek.vasut+renesas@gmail.com, yoshihiro.shimoda.uh@renesas.com, geert+renesas@glider.be, 
	magnus.damm@gmail.com, christian.bruel@foss.st.com, mcoquelin.stm32@gmail.com, 
	alexandre.torgue@foss.st.com, thierry.reding@gmail.com, jonathanh@nvidia.com, 
	hayashi.kunihiko@socionext.com, mhiramat@kernel.org, kishon@kernel.org, jirislaby@kernel.org, 
	rongqianfeng@vivo.com, 18255117159@163.com, shawn.lin@rock-chips.com, 
	nicolas.frattaroli@collabora.com, linux.amoon@gmail.com, vidyas@nvidia.com, Frank.Li@nxp.com, 
	linux-omap@vger.kernel.org, linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-arm-kernel@axis.com, linux-rockchip@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v9 4/5] PCI: dwc: ep: Support BAR subrange inbound
 mapping via Address Match Mode iATU
Message-ID: <r7papsn5obypbm6k74zgueknli3ermfdc46a6z227trxqji7zh@me4miixh5adz>
References: <20260122084909.2390865-1-den@valinux.co.jp>
 <20260122084909.2390865-5-den@valinux.co.jp>
 <aXHsd7-WWAGyhy_w@ryzen>
 <s6bnqkbuugi7oio7ybekdbk3dokpbe2bui2wjltdwajxix2app@wosgmhrfsriv>
 <19D609EC-F850-4B43-A83C-0B8C70E641B5@kernel.org>
 <l7wknbayighcczjkqfwhbaqrepjtbgxxstgkntoqvnrs7dnm6g@wvmy67ky37pv>
 <aXM2hwCrziK2I8OL@ryzen>
 <tyudbsfjh2b7rzcascz4blv4uhkesemxqby6r5mmvgyfqrms45@mshhj53p53pt>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tyudbsfjh2b7rzcascz4blv4uhkesemxqby6r5mmvgyfqrms45@mshhj53p53pt>
X-ClientProxiedBy: TYCPR01CA0035.jpnprd01.prod.outlook.com
 (2603:1096:405:1::23) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
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
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TY4P286MB6864:EE_
X-MS-Office365-Filtering-Correlation-Id: ea6f213a-a46e-4079-2bf8-08de5b540943
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?FKpBmqWGbYIqKB4ki9RwZ/HeBS8I/yel4ZGHjT6dLduGedY/co4EmoLt1VtN?=
 =?us-ascii?Q?vBIlkb4WBaJF1ggsIqHaZMcP0GP32ysZaLC4jKsLUGWm4CefPT9Cyx/97A+o?=
 =?us-ascii?Q?MdBMNWa/vofkKiyvA0sfu72dtWnYTwhgclWwXd775BApDPit9mtCIGBdUCw1?=
 =?us-ascii?Q?mCXe5aCNhwxePXi3os6etKh1H9kJ7Uu5XTOVsvX4y9ArR0skqlcKaOPvjSrC?=
 =?us-ascii?Q?0qkUiKZUOougZ+3lIHfr5Jc2ZbdReFeOrqvDBZKpsvo4G4ncX271DGi/C7Sr?=
 =?us-ascii?Q?9JsSd6fjsyeogHoPgtdggall3hoL6qbAvKZ72kzInelnMQnbHYq+1g0vf2Ll?=
 =?us-ascii?Q?l8z4/xgSwMR/nLovh7nPeTPvlyyxoVFtDT+Qnm8/IgS2e6FiF1QAfWK52H4q?=
 =?us-ascii?Q?hvkbm6TJ+ZvwMiWegUBz7ISO/7DPds/iQSEquf78IySJB2R5uN44pzu9eD60?=
 =?us-ascii?Q?/tT0WHybqpk0x6P5BqiguQX6ylLCvN7V6MyTpKizk3DZbMpBgBVxzgGo13KA?=
 =?us-ascii?Q?RagXMmXuBeQtWRq4g8I9B7bVA3cKJuAUpc+FZR1f/VSYMGZxFIkZIBMhDL6L?=
 =?us-ascii?Q?vYtfS0WOiutDbyFotOqGCfW/I4AhhXf+bSwUyghL9JmAmZPmSwW6YKpqERqw?=
 =?us-ascii?Q?VhZDsfQrzqMcHkZotygggCh54LTIl2TjpNaYBFuRldOEMYdV9dQ+fFCOPcxR?=
 =?us-ascii?Q?cmATfKkcn/nS5MYt75BJslV4JIv2ldGc8YUtr8yWU1oRaFnFDC6Lcanhv3bb?=
 =?us-ascii?Q?/88RIX+GAMvw0X5wJNmZTLaaKYkNHM619Yai9eBnoR4tljmFhDV6GKmqHSJB?=
 =?us-ascii?Q?hf7pTTJuQLDLJERysgGpOV0TE6cC/DgWZabrtN9S0eE1rVz2rntpL6zXxp9K?=
 =?us-ascii?Q?s53Bbcfn06qOxGvNWraFcAaM0BRK89r01KF/hon0Ako5pQsdy8EzlrTlKbm4?=
 =?us-ascii?Q?zoefSkDtYnwe3TEA3qNFb4D3LXJ0KlGS6912sKTPH+rf4VOeaQCmZpb8D3D+?=
 =?us-ascii?Q?gUXLlxDn03u6VIHNj34wGgK2CrjZ36iQRSYBM0+cBDDjwrvS5IMhgkFBnDL3?=
 =?us-ascii?Q?MPt0osn576s8uWIoi26QyZ/QqgoyRqG81duJUwyU+zmKmYBzudTaz+QHfAQG?=
 =?us-ascii?Q?woos1N7SJqNh1wvjVtpQIEmy/TKbJGN11+T717sbOdQ/uc4j7X7GjNE250nv?=
 =?us-ascii?Q?sKKWLkRb1FmrzIZKc6wx63ZOaR+K5sr2NMckYcpY/8DrJdDvLZd4hoOnEGp0?=
 =?us-ascii?Q?zbV4X7osElvwmnc5aYgpLbcL2HYPT9YPzeL2I6Kxf330kvrfrDfkM3CIlUtu?=
 =?us-ascii?Q?gJ3yTOzw7DUHkvnSoy0HpnpIsA51ipnOBd3a+mKNJK2OLhvScM23quAv6jMr?=
 =?us-ascii?Q?+xNSZ8L9umn64D+xdYoS/T+hIZrRicNZVXyXInnSSjgPeod14v0/a9HNHrrQ?=
 =?us-ascii?Q?uV25me92GjYpV9nXfG1YwrvQPf/PUdureO6oK1D6+vPQudGG0Ng/inXUfEg6?=
 =?us-ascii?Q?Bg2NyvZiTrVPcXUBNkre4ltt3lcqNB1WqeNAwD1jKAVf1wUf79mMCcdyJqAW?=
 =?us-ascii?Q?YztejNUsU1WQ1p0vJOp8/m4Cs5qrzOm0sosJNB0K?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(10070799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FBtEfTWK21aWwKPlTv6Xw4IS+SiXjkoSZzaXyznRZyLHir1gwN+Aml43pfMO?=
 =?us-ascii?Q?BvsBcb2XtrBexmiyDz1LMdD28Wcm//cl3bIcoW81s99iNZILwGH2zD5FoCRw?=
 =?us-ascii?Q?kscMXWyD1H974D8EzNEbYYLLbOPPNcYjipqW2s7lwg3QPU9qqLHCIeiKVXJ9?=
 =?us-ascii?Q?wSNM2Lvbfmi1YE+vuniJY4fu76e0N9/0KH+aKavmIuOjyjqjasfhaW6+OHUE?=
 =?us-ascii?Q?rI6mEdt2c3AVkOHKm+Cnrv46oHunP+/qUtpvWp25wxhdGTW6ofPJZiZw4/6a?=
 =?us-ascii?Q?iQrYz76MQuxpPXmU7jaOAjCGXnXUwd7QAwT2T9HWG0eaN3ILgQ+a9CJm8Pya?=
 =?us-ascii?Q?gOi/vofCysIJ6DTR6qzFF+3kMbvu7/5PiLMTbzhRyPrNxd5nJt5/mtOR8JWs?=
 =?us-ascii?Q?wbIWkoAuIzSMTGjOoxnNhwTr8IbTr3J1jdIg3WEPzoAMLXcDd9EIuzZBh9ky?=
 =?us-ascii?Q?3wWwjZPh/ZVvbbm/CdUxbnMqkzOCvBItMlCbD/zvEvSBI/JoSh+dHApjNF4y?=
 =?us-ascii?Q?L8xRalqzK5shWfjZELIBQyLyKAEQppT3W9Yr+itsolB3Sh89DFTPx9KgO1tk?=
 =?us-ascii?Q?RXuRtr/AZ8TFF+XeCoXl3f91/ehjyBZgl5KhFdvCNXoJO5TAZXKOAh6HnIZn?=
 =?us-ascii?Q?tglhqFZd42NCtO/nt3jZmAT0dWYhzsT4tLI8xXWgx2uxdRf0GqmyPlJuq1Pz?=
 =?us-ascii?Q?gAyDKg8l6faDn+Aogyk8QEf3AVkwDArIX/x8f6VHp7MjC4D71yGwd0fd+Uva?=
 =?us-ascii?Q?6GgHjSjki4Ntaq3VXr6bz/kpU8ddGuWlzDO7prAXkmrXt02jEFWWuaXVGUF/?=
 =?us-ascii?Q?dHHzWnwiDGI3PtMA8vncj9rq6ERSfm0sNxHX2dJLYnhki+HcXWvp2oHdc1ny?=
 =?us-ascii?Q?STez2KUVwlhY2gEEcJIShWyT2FyGANJH6ihhS8crlnqGyk4Kn3CElMIeyKAN?=
 =?us-ascii?Q?LWMMClqgivPJZtx9T6QrUtPQgsCRLAvuDtvOmqREp00m7OqLigFJ6KDwm/9X?=
 =?us-ascii?Q?/2N0MrM6NmEwxRD8aAeUuoNGvfJ3BC6oQm7IIyt3PJcym1b0ilLM/eeH7/9t?=
 =?us-ascii?Q?lVALzl4ogwyJ3lcCQ/iGunQSBG/yfCBOKLU8R68+gsSUoq6XHse7TqWz2enF?=
 =?us-ascii?Q?gfFnKc/lz8tJ00JTzGjwBMrggOXD2ChDkhyI51a304KINoWmNY+NMlouVpP8?=
 =?us-ascii?Q?Iv3hzLDuuPoNksWTc7TFhvKXUphnxBVrPKupBfPw3q0ZTiilfP4iFlVpfQ0S?=
 =?us-ascii?Q?Mc20h81cfd4ueKn42Li6pLHMvBuMqI6kQY5BuktPT4ZmiR+UHxm4ruIwEh19?=
 =?us-ascii?Q?C/31Mvd0lSNTRy1tCqQcaZ1AVWP/VAvGI0WJwG2xieMb1Q0x+e4sDqtMB56i?=
 =?us-ascii?Q?6w+6lngOb2BacOwWYCxoQjfM90BdjBdg7XfGWXMsMRP+0V2ULeL2eLtp+LG0?=
 =?us-ascii?Q?G6jJ0PbbsMDAHAU664xiTZMLN7Jtvmh4xV6dCU5E/gdhOB6L4H+pWgW/rO5o?=
 =?us-ascii?Q?+2GwE9DuH8DBgV6aN5DYqwCVA1WBoOqgHXHZ/u/g2KLuVHyJAEBvRXq1hX0X?=
 =?us-ascii?Q?y9n3/Et3vXBVLjHBewGcDTGANntcSRLIMY8aAVZ9r2XB9rk5hvVoALvhTfF/?=
 =?us-ascii?Q?WCo6dyJ70HzLFGxXRA3sryoBODBTP22lFO5Nzp32d/PHUAvSvdIQxe/gRgP9?=
 =?us-ascii?Q?lTttNmO3vVF44cUSeU5melhD9SpBCMWKKtpy+QIpVF3Q5O5/N8NKpFF4mjTb?=
 =?us-ascii?Q?+4Jxqq7zFgTLNb3xwINpOwetM6gmY/+nZMdgsBZA2qAnHnoOxvAD?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: ea6f213a-a46e-4079-2bf8-08de5b540943
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2026 14:22:42.5266
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MUqpxXWzXhcTujUP2r/ceMDun3pTIVMvre7XKdxXlrSmJ7zJ4Tsa9RGOm1LsQGf4T1RSxy45qFEcYF7U7TN9+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4P286MB6864
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.21 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[valinux.co.jp,none];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[valinux.co.jp:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16274-lists,linuxppc-dev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[den@valinux.co.jp,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:cassel@kernel.org,m:jingoohan1@gmail.com,m:mani@kernel.org,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:robh@kernel.org,m:bhelgaas@google.com,m:vigneshr@ti.com,m:s-vadapalli@ti.com,m:hongxing.zhu@nxp.com,m:l.stach@pengutronix.de,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:minghuan.Lian@nxp.com,m:mingkai.hu@nxp.com,m:roy.zang@nxp.com,m:jesper.nilsson@axis.com,m:heiko@sntech.de,m:srikanth.thokala@intel.com,m:marek.vasut+renesas@gmail.com,m:yoshihiro.shimoda.uh@renesas.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:christian.bruel@foss.st.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:thierry.reding@gmail.com,m:jonathanh@nvidia.com,m:hayashi.kunihiko@socionext.com,m:mhiramat@kernel.org,m:kishon@kernel.org,m:jirislaby@kernel.org,m:rongqianfeng@vivo.com,m:18255117159@163.com,m:shawn.lin@rock-chips.com,m:nicolas.frattaroli@collabora.com,m:linux.amoon@gmail.com,m:vidyas@nvidia.com,m
 :Frank.Li@nxp.com,m:linux-omap@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:imx@lists.linux.dev,m:linuxppc-dev@lists.ozlabs.org,m:linux-arm-kernel@axis.com,m:linux-rockchip@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-tegra@vger.kernel.org,m:marekvasut@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:mcoquelinstm32@gmail.com,m:thierryreding@gmail.com,m:linuxamoon@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,google.com,ti.com,nxp.com,pengutronix.de,axis.com,sntech.de,intel.com,renesas.com,glider.be,foss.st.com,nvidia.com,socionext.com,vivo.com,163.com,rock-chips.com,collabora.com,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.ozlabs.org,st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_GT_50(0.00)[53];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[den@valinux.co.jp,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[valinux.co.jp:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linuxppc-dev,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[valinux.co.jp:dkim]
X-Rspamd-Queue-Id: DF7AB7DC9A
X-Rspamd-Action: no action

On Fri, Jan 23, 2026 at 11:28:30PM +0900, Koichiro Den wrote:
> On Fri, Jan 23, 2026 at 09:51:19AM +0100, Niklas Cassel wrote:
> > On Fri, Jan 23, 2026 at 10:16:21AM +0900, Koichiro Den wrote:
> > > >
> > > > There might be other EPC drivers that don't disable all BARs in their .init(), so I would say that simply checking if the BAR has an address is not sufficient to guarantee that an EPF driver has called set_bar().
> > > >
> > >
> > > Even if an EPC driver does not reset the BAR in their .init() and some
> > > default translation is left exposed, wouldn't it be safe as long as
> > > dw_pcie_ep_ib_atu_addr() succeeds in programming inbound mappings for the
> > > entire BAR?
> > 
> > For e.g. on RK3588, the default HW configuration of the DWC controller has
> > all 5 BARs as enabled, with a size of 1 GB.
> > 
> > There is no inbound address translation for these BARs by default.
> > 
> > So for it to be safe, the size of the set_bar() call would have to
> > match the current size of the BAR, but how should the EPF driver know
> > that when it has not called set_bar() yet?
> > 
> > dw_pcie_ep_read_bar_assigned() does not return the current size of the
> > BAR. So you can't verify that the set_bar() call has the same size as
> > the BARs "default size".
> 
> I wasn't considering either of the following cases as unsafe:
> - succeeding by chance in programming via a one-shot set_bar() with submaps
> - such a set_bar() failing (due to incorrect size recognition)
> 
> while as I mentioned in my previous reply, the first case effectively
> becomes a loophole that contradicts the docs and git commit messages.
> 
> However, since v8, the second case clears any existing mappings, which
> could indeed lead to an unsafe situtation.
> 
> > 
> > 
> > >
> > > That said, such usage apparently contradicts the documented usage (1st
> > > set_bar with no submap, then with submap) described in the docs and commit
> > > messages in this series, and allowing it would make things unnecessarily
> > > complicated. So I agree that adding such a safeguard is the right approach.
> > >
> > > >
> > > > I think the safest option is my second suggestion because then we know that we will only call
> > > > dw_pcie_ep_ib_atu_addr()
> > > >
> > > > When:
> > > >
> > > > 1) If ep->epf_bar[bar] is set:
> > > > https://github.com/torvalds/linux/blob/v6.19-rc6/drivers/pci/controller/dwc/pcie-designware-ep.c#L363
> > > >
> > > >
> > > > 2) All the other requirements to dynamically update a BAR is also met:
> > > >
> > > > https://github.com/torvalds/linux/blob/v6.19-rc6/drivers/pci/controller/dwc/pcie-designware-ep.c#L368-L370
> > > >
> > >
> > > That makes sense, and it ensures that the behavior always accords with the
> > > docs and commit messages in this series.
> > 
> > I think it makes most sense to put the "use_addr_translation = true"
> > 
> > after the check:
> > 
> > 		/*
> > 		 * We can only dynamically change a BAR if the new BAR size and
> > 		 * BAR flags do not differ from the existing configuration.
> > 		 */
> > 		if (ep->epf_bar[bar]->barno != bar ||
> > 		    ep->epf_bar[bar]->size != size ||
> > 		    ep->epf_bar[bar]->flags != flags)
> > 			return -EINVAL;
> > 
> > 
> > So we know that dw_pcie_ep_ib_atu_addr() is only called when the size is the
> > same.
> 
> I'll send v10 with the fix, possibly adding a BAR_SUBRANGE_TEST to pci
> endpoint test as well.

After thinking again, I believe just the following is the most robust and
safest approach, as it makes subrange mapping strictly update-only and
avoids any silent success on invalid first-time calls.


--- a/drivers/pci/controller/dwc/pcie-designware-ep.c
+++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
@@ -508,20 +508,29 @@ static int dw_pcie_ep_set_bar(struct pci_epc *epc, u8 func_no, u8 vfunc_no,
                 * mappings before re-programming.
                 */
                if (ep->epf_bar[bar]->num_submap || epf_bar->num_submap)
                        dw_pcie_ep_clear_ib_maps(ep, bar);

                /*
                 * When dynamically changing a BAR, skip writing the BAR reg, as
                 * that would clear the BAR's PCI address assigned by the host.
                 */
                goto config_atu;
+       } else {
+               /*
+                * Subrange mapping is an update-only operation.
+                * The BAR must have been configured once without submaps so that
+                * subsequent set_bar() calls can update inbound mappings without
+                * touching the BAR register (and clobbering the host-assigned address).
+                */
+               if (epf_bar->num_submap)
+                       return -EINVAL;
        }

        bar_type = dw_pcie_ep_get_bar_type(ep, bar);
        switch (bar_type) {
        case BAR_FIXED:
                /*
                 * There is no need to write a BAR mask for a fixed BAR (except
                 * to write 1 to the LSB of the BAR mask register, to enable the
                 * BAR). Write the BAR mask regardless. (The fixed bits in the
                 * BAR mask register will be read-only anyway.)


This is close to your first suggestion at:
https://lore.kernel.org/linux-pci/aXHsd7-WWAGyhy_w@ryzen/
but it avoids even performing BAR sizing when set_bar() is called in an invalid manner.

With this, we still guarantee dw_pcie_ep_ib_atu_addr() is only reached when:
  1) ep->epf_bar[bar] is set
  2) All the other requirements to dynamically update a BAR is also met

The resulting behavior matrix becomes:

                           | num_submap > 0           | num_submap == 0          |
  -------------------------+--------------------------+--------------------------+
  ep->epf_bar[bar] == NULL | returns -EINVAL          | always try BAR Match     |
  ep->epf_bar[bar] != NULL | always try Address Match | always try BAR Match     |

By contrast, with the latest idea that relies on the local
"use_addr_translation" variable, the case marked as [1] below possibly
leads to an unexpected success in BAR Match Mode, .submap/.num_submap are
silently ignored, and the caller has no way to notice the mistake.

                           | num_submap > 0           | num_submap == 0          |
  -------------------------+--------------------------+--------------------------+
  ep->epf_bar[bar] == NULL | always try BAR Match [1] | always try BAR Match     |
  ep->epf_bar[bar] != NULL | always try Address Match | always try BAR Match     |


Kind regards,
Koichiro

> 
> Kind regards,
> Koichiro
> 
> > 
> > 
> > Kind regards,
> > Niklas

