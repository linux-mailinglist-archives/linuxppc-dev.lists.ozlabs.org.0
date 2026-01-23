Return-Path: <linuxppc-dev+bounces-16178-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Gj6Lw7McmlgpgAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16178-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jan 2026 02:17:02 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 497CA6EF83
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jan 2026 02:17:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dy0QJ4r1qz2xKh;
	Fri, 23 Jan 2026 12:16:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c407::3" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769131016;
	cv=pass; b=B/bEaaX9ic7WOWwTun78l7Yki+XNShKwqfnrtbqUVTs82cBVFq2FhzLpUaaCn+nmVNBWcH6ODN8xfTC5BE2SUYQdb8rpkao1SdkR+HbRzKT88HNsmzKyP4tM1zNHx1/oG0DdrEeKkthFCtXnDtEEiUut+gTUVC814GOWJQRrEE8Ihym0s9mZsEVQb/Fgsq6HVCpH+1NZ+HA/vifd21bXfOj2Ch064SVu8BNnHQN84owlR7fd75oCvhTZ3WN6rvT7HraVKkG30t0bqlj8eO/yGg/nX0NiPLzlqAqokgmg/QEAZ2bL/B3AnWwLAemP6fjcjB6FtsGcpmWEDUahKqYiaQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769131016; c=relaxed/relaxed;
	bh=t5mSSD+fAplRMfb3joiSiyJChCQwTs0sTG3eink0tGI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=bO5IibokU9vmefVlvuIg3EsE1Y43Dl0OKwXqW6ERq8nAYkEk0nyv1Hgn7hVnyXLDXymwzMPLGTv4CrY7h7kNcahi5N8Cpa8DB/FXx0GWbwWsimh7psQnKylpjKQYuoOR0m0l8XJ3Gm8jVwR4pMzsC4OmfZiEP3i4DzUaBTVfvFyVlFXbveQMK1R//pklw6NzTayrdKgSnWif/EF4jomCf4SVzqsG4jQzfP6V8S99DV+NW6QvwLOCYyDn4RRqpaGl8y+0MZKziNdz4f4PxHj4b4D7KrZOqLJ8rRYj1pL51fweN5DeUfStTz1DB6jnW8CxaTpMbbVhqR+xmIitYzihhA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; dkim=pass (1024-bit key; unprotected) header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=gmrxX+Ke; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c407::3; helo=os0p286cu011.outbound.protection.outlook.com; envelope-from=den@valinux.co.jp; receiver=lists.ozlabs.org) smtp.mailfrom=valinux.co.jp
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=gmrxX+Ke;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=valinux.co.jp (client-ip=2a01:111:f403:c407::3; helo=os0p286cu011.outbound.protection.outlook.com; envelope-from=den@valinux.co.jp; receiver=lists.ozlabs.org)
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazlp170100003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c407::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dy0QG2kRFz2xHt
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Jan 2026 12:16:53 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q9EeqErb7QNdxusE82s9RLkD6uf459cTuVlOYC6FegvDv/KEZrzs99u3ahDkZepdTQDH6RBMtNUX5PwyjSzyrxyHNX3fCS1mYjYF2kwdy8rQ+vQX9j5QIRMngg+qsteFjBA5ktmVkyQR8cA7RU0/ru9r+UhI0GeNMryhdAE1J954UbQyxwWSfm0Skg8OhWhTnHPzez2vHrw++o6tWfK+Un5aQCmF6d9fKFfB8OD+h+2ROFaBDDB1c/ZwzDzvxG+PnP31BdDj4JVMtjcT7nKXfxfXS2Wz144Xg6/1dHAr5cuw/xzOKb3jiG3Mf96DaPzop0BZCKzTx3RQLk7x1BjPYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t5mSSD+fAplRMfb3joiSiyJChCQwTs0sTG3eink0tGI=;
 b=MsnBQQO8WY5mWO23H4+hVbQOQ7Rgvl9UlxDont4DlZbCwQbm23XJKNxwSptUaO3RDHWT4ENw3S9VpDUkMRz92efSKzjcU8TE++VHw1HsEANU0jHncL3bw38hxiZQbW4m9MSiZ78VUebI6vQNku9oJ/R7qg/34bPxibM0voshVbkTsc1ckG1CsugdR+RWPU65QTklR0+52GA/NqOT3dFmjt6BbY3sl7hagsL2gHaf16ty0xLyqIvMF2EAH4mZYupBd2AP4hoDe3odYWZGlrVM/cauUYwRL6iPatiTke3bVAPqwimRU8/3qsNqOmeqGezE426AI9JX+L7g94Hbh2OOrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t5mSSD+fAplRMfb3joiSiyJChCQwTs0sTG3eink0tGI=;
 b=gmrxX+KeGbU/qdPfG1ETzb/JM/2x1wEqtAgs7TZCBgnaeGw9oG3oH/nzwIgpoUimZw1Fa2/v9frjQ9md1kWaZnIyEnQgldBiwn6x5x86sUNXI68qrHo8RMXD3GYwE2HM2m0/E+fFcV7YyJ+u26J2INWbW4K5FnAWxysSQfUvZKo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by OS3P286MB2456.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:17f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 01:16:24 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%5]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 01:16:23 +0000
Date: Fri, 23 Jan 2026 10:16:21 +0900
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
Message-ID: <l7wknbayighcczjkqfwhbaqrepjtbgxxstgkntoqvnrs7dnm6g@wvmy67ky37pv>
References: <20260122084909.2390865-1-den@valinux.co.jp>
 <20260122084909.2390865-5-den@valinux.co.jp>
 <aXHsd7-WWAGyhy_w@ryzen>
 <s6bnqkbuugi7oio7ybekdbk3dokpbe2bui2wjltdwajxix2app@wosgmhrfsriv>
 <19D609EC-F850-4B43-A83C-0B8C70E641B5@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <19D609EC-F850-4B43-A83C-0B8C70E641B5@kernel.org>
X-ClientProxiedBy: TYCPR01CA0167.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::7) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
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
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|OS3P286MB2456:EE_
X-MS-Office365-Filtering-Correlation-Id: 92cab8b6-18a9-4804-6151-08de5a1d05c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IP2bAzVB8Tt/gg4tiiMoSVN2yW5x/yWeAMVBXsHzHaMrLBn0U7AcPnbXZPV2?=
 =?us-ascii?Q?bZsIKvK+kqf9Nv8cKzFDI4M1UB8klPJBatlaGWvlEi6Y1PkB+u449ct93XOl?=
 =?us-ascii?Q?L+X7N31hX31rklG9D1FhJg0J3viLbap62A3p52VwqeMixHGA7I1mG8Q0XcGU?=
 =?us-ascii?Q?6ADgMgYVpEn6EWuVSNXiksw8klyyC5eq1miKV3H5Vx/ifEXnufak5O3H9WXy?=
 =?us-ascii?Q?0/ihYm5a5peEFIhan3yJg+xlwKWfDpnUr33fv3JGFbctbJ64RPNuUQiAUbrz?=
 =?us-ascii?Q?Ugv78Ie6C9qnwh9rwN/NW2gyiamfRA8PFM7Tu3Tiywkb/Hz1y9FwrvoMsRou?=
 =?us-ascii?Q?j9ImiMQaa5pmVCMVHbMT+t8DV9MDb9XZUZozOFLXnP7wriY8vczZNvXAdmS6?=
 =?us-ascii?Q?RJY7jnlUQ7+A4I+haeYPOpDn253qnDG3AHMkqB5y62GV6RXMtvd4krlA7S8Z?=
 =?us-ascii?Q?UA5Sadw85SsWiq9KsLxk4m8p4Sccxc8T/WEuffw/MLAuEO8fSxFcIsv2D1Ch?=
 =?us-ascii?Q?WauIqiKMiNA9PMtP52y91u8mUw6TywT7uYybKp7MrUxdnpm7X7a7jeZKxGVK?=
 =?us-ascii?Q?AzQyBSqmJmhPU0obxzVIljZmrlxGZzImKqqqY6Hrx2vfut6WF/KTVr+QhG4m?=
 =?us-ascii?Q?8hA11WWXr0QTTymFWOEXY7s1PrnxkrztF1z8lu7Gn/UzuOgyrjqv2lN8iQ7r?=
 =?us-ascii?Q?Fb5EXK5EDAhnKWz+r/WqmASWiSoSHdhYlzb+tjb/B/qfb8Rj1HDIANdbeWza?=
 =?us-ascii?Q?wJnL51mE6ZgcBQYGth28nGyYKgncaRRatP0iJrSKoYoj0HwOrSBpihT/SGtu?=
 =?us-ascii?Q?BFJYp/2grxKiZyRjIusUU65aq/ZPcH7ykYAIEirxJhwTCvGbP6QKR69Oo9UG?=
 =?us-ascii?Q?YaEXDIyIIpjjAtdyWBPljJES8olwK6uYQ4UkRAtzcV/QRR0wH1lpoB/v7LSQ?=
 =?us-ascii?Q?YH7bPX/rIfeknX9wrk2ggneftQCWcwr/K6t/CKn7UGIlWSo7+49OBsrUNfzS?=
 =?us-ascii?Q?Hk6qhyDWx77DQ3WN8Bwpitok5pukHc72Ceody1Q3bq21Us1hmKWC3hJ6iD+7?=
 =?us-ascii?Q?hzkWPf0b/GsEjC1sjoL/tg3Ezh4YiJa3jYFb9+1J6ohkkmPMmcZFQGLGhOnQ?=
 =?us-ascii?Q?Q1ezqMIvi4jUFAVHUXVlgGZXlYXuG4VWPuO4m7ku2o0oC56GPbPgC+iyIc3f?=
 =?us-ascii?Q?Z1a1dv1SvcN5oZSF8DtwaXjQib1aaUxwjoIdezoazJp2T39ULPuaJuY5Fcq3?=
 =?us-ascii?Q?j+ucekr5io9W1S/cAiGVe+FLACtS3R1AUtNanRDOS+5XtFV1rVl0csUGQHYy?=
 =?us-ascii?Q?Zl4+lTSId3jV6WG4qiblt0RhO4AhAaAUz9WzoWbgKzgswi7LLPfULxCg0uvd?=
 =?us-ascii?Q?BTgjNMGaaCgymy5aUuwqBIZm1O+c6F46DTBbHdbAsA0f9b+3M9PwhbXffSI/?=
 =?us-ascii?Q?F7ubapy44wmltXDwKeLodK9KFCme6ZdqvF/4hR5cSE5VIOgZFv2YHmebjtU+?=
 =?us-ascii?Q?bOAf16JDokVk8Cpc1WGyb9OzXJYE3RtpNaPC/W6/e2RVxBc0yknwOnrrb+dX?=
 =?us-ascii?Q?UxvLWOb3I20DEYEaCORnpjTxAPphMSmvRLE/S/HU?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uFKdkRN+IAQjOBce+7EjddDNFTsDh9spiX7UPYcIGWhwEPvRXzmHoI3ygf8Y?=
 =?us-ascii?Q?+3UAWL+mWrZ1zc9psJdOsuVXLcH25ZR+Lc2uqiaJXTLdEaUJvpW1PBx9vcHC?=
 =?us-ascii?Q?NMrJj+K31MFbvAE2b4r56MgU7ZbD7TdyrOg4sWTpDCnPASzBFWcKzoEzwnYe?=
 =?us-ascii?Q?tji7TbowIRXoq3xRk5OiWz4iXQCcGY6c4tgJfbpvIgg0zLAEdm4JWZ6SjJr9?=
 =?us-ascii?Q?rywcEkZFcum2gCEz6XBCQ+FWEQJ1i5t/EIcdf6iktnoRWeFmZq6nyLGMsPDc?=
 =?us-ascii?Q?QFdhd396w5Lefdek6BhrpkqESxuLnc5+hq6TpzRPphHUqbuQooJbEMKFjtsq?=
 =?us-ascii?Q?DJEgLbNsSH4JIm8ZDBxmP/ewIWfi/k5zY6ZZuxzcHURPpHTrukzjGGKNV0Sl?=
 =?us-ascii?Q?JBF0ycy5ftcnKEuU8lZjG/vfOY2MT9KHojKULWZ8V3fP4Iti4LMbxYTJQ2tC?=
 =?us-ascii?Q?lQUXFU+c0c3mhtskkIe7w9q9MRVhGnFyzrGilxXFjAPhj0WGho3mg+w07W5q?=
 =?us-ascii?Q?Ut4HqqKXVSealuBO3nd7ZX+UvHWuY4NoVGSZvP5fB0LUG/XmZSXYGH4KwN9A?=
 =?us-ascii?Q?+Q1Y5xb3dtsXkNk2dY8ayQ0P7XfT6DlkXd4XWvlVbwmZuEL4cgiF6XjHOHx6?=
 =?us-ascii?Q?Kmk8OfnH8R6HVYCovcPzEBCDuskCYsdmknmqEM1StT+rwpolq2LZZUD3SZEg?=
 =?us-ascii?Q?k3K7+1nJ3iSr9ntfjJb1lEImOeWaXEX+IluCpuIxAVBG2bnoIujttGP1r/cz?=
 =?us-ascii?Q?uWOnkUdv0tPjGZz/p6Dh+iQL2hMGSQ66z73XjLIydVQm2zPLTnIKLQ/zyIVH?=
 =?us-ascii?Q?+KExForjtFVBqGpsXQqrtxDjnZx0HsSFHZ6No3c4rvckjxGzc99Li0uW5gfu?=
 =?us-ascii?Q?rkNJQGmBiIAjUqzdZl7WdIcB7bhLSj9oAd/2docKjtceacad9nXRN/pyG3oA?=
 =?us-ascii?Q?vKnVgz5I6JHgcmw5m+NBeMFnWwlUf8/tFi6g2hjrHOO5xuta8sSE7PDMzS9K?=
 =?us-ascii?Q?ZU5BLljq8p1LMONS0sdfiZWJAJph/OYV9Wl+QP8jXs2bsyiIY3hE6Y2Cl3ry?=
 =?us-ascii?Q?R0mQRpE7J4jOw6ojbVaIpiSLHEddTGGQIvaP5WD+AYGiFyFLmankLhZlQH9P?=
 =?us-ascii?Q?5fsoUF2Wb2WaBN8TMo8gal8t9Tif1//u4huXCsWaLjAuzctbwPCTqyGVUpfZ?=
 =?us-ascii?Q?Ajq4XiYEimeWEdPl5IjT5l7dfjHRPbw2tIeG2izjdxMZAr3rOpS9roRbMspt?=
 =?us-ascii?Q?Kjazd1oEYqGQ4z7W84a9dQSykVo/MQkrtbBoqeHOT3vZ6UCyElUk9kLAujPO?=
 =?us-ascii?Q?88QwQK6yf8J/92H+XJFKsFEwLKcEudC0lBUNjjg7RhlR6Je3vBVThmCZvZUc?=
 =?us-ascii?Q?OxJAv5DtI7+JBboJHlEWff2t7Hji2OAeBJLkI6tZc2AVjL7SWLkUy3dO599a?=
 =?us-ascii?Q?9w2xCKahTaBjnbtLjQf2gmkx5OwSDzzfK6WNmB2sABaACUqAEAiKNTJjHbqT?=
 =?us-ascii?Q?4fTUcSR7MHgLciNu8MEpxWMvfdrfYu01mKr11Sdw8i7jU7V/eUu8LPwmF45+?=
 =?us-ascii?Q?dP6digMiNsryDu1q8Hgaq71diYpQbZhrNkzLl1W35Vd50rBm10jAY/O+wYvs?=
 =?us-ascii?Q?+1VEkak6wp1TJ1DDH3hK71nlk1/swSZ8qh+/2tEVZBVw/IjDQp6LK3WRVKFv?=
 =?us-ascii?Q?krhR+SpXLanat6z3dw4pdIMeSSXBKSxuL0JPBomZiFocT2DyUhFGF7o41ALp?=
 =?us-ascii?Q?KGw8ViKDKUN4zWJ/48p1fWLR8Oln2gegxkbCrKVNy3N3Bn3KYi0t?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 92cab8b6-18a9-4804-6151-08de5a1d05c2
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 01:16:23.1754
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2brbgcZGu0r+ZtXTOKbkvCTqndJHNRTnzQbfDK52sBE2ewZaHNBW/ok7AxFmQTpWYmLAyok3ppbGhG/EoG4EIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3P286MB2456
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.21 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[valinux.co.jp,none];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	R_DKIM_ALLOW(-0.20)[valinux.co.jp:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-16178-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
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
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev,renesas];
	NEURAL_SPAM(0.00)[0.214];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[valinux.co.jp:email,valinux.co.jp:dkim,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 497CA6EF83
X-Rspamd-Action: no action

On Thu, Jan 22, 2026 at 05:59:18PM +0100, Niklas Cassel wrote:
> On 22 January 2026 15:29:02 CET, Koichiro Den <den@valinux.co.jp> wrote:
> >
> >> To make sure that dw_pcie_ep_ib_atu_addr() cannot be called without already
> >> having a BAR configured, to we perhaps want something like:
> >
> >Thanks for the review.
> >Isn't the existing guard in dw_pcie_ep_ib_atu_addr sufficient?
> >
> >        [...]
> >        base = dw_pcie_ep_read_bar_assigned(ep, func_no, bar, epf_bar->flags);
> >        if (!base) {
> >                dev_err(dev,
> >                        "BAR%u not assigned, cannot set up sub-range mappings\n",
> >                        bar);
> >                return -EINVAL;
> >        }
> >
> 
> Well, for a driver that does not call dw_pcie_ep_reset_bar() in their .init() to disable all BARs that are enabled in the controller by default, the host side will assign an PCI address even if no EPF has called set_bar() on that BAR.

Thanks for the explanation.

> 
> See e.g.
> https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git/commit/drivers/pci/controller/dwc/pcie-tegra194.c?h=controller/dwc&id=42f9c66a6d0cc45758dab77233c5460e1cf003df
> 
> There might be other EPC drivers that don't disable all BARs in their .init(), so I would say that simply checking if the BAR has an address is not sufficient to guarantee that an EPF driver has called set_bar().
> 

Even if an EPC driver does not reset the BAR in their .init() and some
default translation is left exposed, wouldn't it be safe as long as
dw_pcie_ep_ib_atu_addr() succeeds in programming inbound mappings for the
entire BAR?

That said, such usage apparently contradicts the documented usage (1st
set_bar with no submap, then with submap) described in the docs and commit
messages in this series, and allowing it would make things unnecessarily
complicated. So I agree that adding such a safeguard is the right approach.

> 
> I think the safest option is my second suggestion because then we know that we will only call
> dw_pcie_ep_ib_atu_addr()
> 
> When:
> 
> 1) If ep->epf_bar[bar] is set:
> https://github.com/torvalds/linux/blob/v6.19-rc6/drivers/pci/controller/dwc/pcie-designware-ep.c#L363
> 
> 
> 2) All the other requirements to dynamically update a BAR is also met:
> 
> https://github.com/torvalds/linux/blob/v6.19-rc6/drivers/pci/controller/dwc/pcie-designware-ep.c#L368-L370
> 

That makes sense, and it ensures that the behavior always accords with the
docs and commit messages in this series.

Thanks a lot for the careful review,
Koichiro

> 
> 
> Kind regards,
> Niklas
> 

