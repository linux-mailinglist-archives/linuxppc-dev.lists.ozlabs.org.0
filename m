Return-Path: <linuxppc-dev+bounces-16923-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8GChEj/zlGkJJQIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16923-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Feb 2026 00:01:19 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA0A151AB7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Feb 2026 00:01:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fFw9h6rTBz2xlw;
	Wed, 18 Feb 2026 10:01:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c20a::7" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771369272;
	cv=pass; b=jBmNbSje48QXa8+Jb31io+9001sYxFFAVcj2+yI7naGkdAQuw4IyT+qgbebTKSfkmaNOnHIQiq37da6dK2zRrARaP3h33fG7kp1mVuxHJVH4yQJAT66xtc8UtHTYckKT22PotIlHxhIVzouq7zuAIayidfXERoqVnRvUsHbWBgTkV6gX9O5KOPF/1FK/HSYKptqQ2mQNNMWCaKFeerdnRL84QfmJLeoJfKQojPZhCpFYDS5B42V+3yENPuAgTlHBjGvMIrfpiBJSCaHdgCMW0glcrRuFRSjggHo0qwLrYzyybvtunp48IeWv6CoTlpbnbbWnY6AA6Mii3/GscPo5JQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771369272; c=relaxed/relaxed;
	bh=6Xg4UyINZAe0JyZcb13/Q41a8ZvHpZS5Ya5R/jqeHgI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=T2vPQzjHo2uJIPdFduf3caidawk6ftLdESiekJJK8QsAGzxxWnLQkHxS4wl4U3crOqBVMmBkDUTZJD4n0MPxSgoaNKALc1a8rTCfBGP8hOWjmhKkGrv6tbzDwTszAKeAnzGqhQHW3FYgy/auGKPFGlj7+0EqgOSeMiR6y70vK1YwB8i6dlLEZO06YOI9XEAcwDeS+83aOM8aYSis/FN2RvTcSwM4rrYZwqWpMx0fFv+HpmPrkzZKktX9LMGDx9A/4oBQOzYHg8Ri2EOKB8S+GiSR5BlqF5VIkGSwIlsKa/oTPNtT53ZckC9Qm1PvFNrGQwCreCainnDKBBYi1uBGWw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=jhkm2xOI; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c20a::7; helo=pa4pr04cu001.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=jhkm2xOI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c20a::7; helo=pa4pr04cu001.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazlp170130007.outbound.protection.outlook.com [IPv6:2a01:111:f403:c20a::7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fFw9g1k9Tz2xln
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Feb 2026 10:01:10 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R+H2FlLf4K9hp3H42orgnqLCFulfRf7xbiyibb7OGwHByz0fUY7hfmo1EujxBNPB6QoKHIxtqZnTpnGPMRfsqGgTmm7xMsBVeJ4PZawmy8YtBNdriEkyBwRCOv/RCBxVWympo7Xs93Otz+5h39WlLOgyYAeiVQMH3qzp9K0i7iOY1i6q8d4oBIxeslPcKqZhuJSe6GBjGQlAcu7V1UBtuyLtkCqLw3si4SdDzLoMdNwYs94qvsmWsmdzEggV/JEicqi+PbHn/g+I9bA7/6rKbEaU92du9n9mQez4SZ++6yFOh6IyhAYha29hzzrTdDY2c2fOXzPTDas4lHALMyeTNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Xg4UyINZAe0JyZcb13/Q41a8ZvHpZS5Ya5R/jqeHgI=;
 b=zI64ggGlttIVFLl1Cvxr8Ys/5i/aLtpWJkUM70n2FJ8GIK4mak+TpERdV7NQ0Cu4RgYKnPQlk8uU6DspPoU1d1SboM+btqdY1W4jMbZyGa7YIPwQxe4tibmuhwxNzrI8OtFhF5l5mbsJC63JJZsgM8H5HTTGavjKZh3KHACtulJbJxQgGM+JdrcjCpgIYLeeCFprH1ffNDHPDIXq++yLLHt99+/X3PjRqt+kxa1wqM7I/qR8ZW6kI9/AlVDHRmdKH1qQIG/OR2AnhjeCxzJAxHYDQP0J1cSehmGGmnaGzqpR3t46+oAc1bOVQhTmsUZ/YFPw7sIOuxlJ91mhnDqTMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Xg4UyINZAe0JyZcb13/Q41a8ZvHpZS5Ya5R/jqeHgI=;
 b=jhkm2xOIzeKsh1NqmDLNB87emTjhGtNuQvI7wfSKTka+Oy9hLMW4saTjdiGwcwexZ9ZELpoAKl3BTtzRAMtfpgT6gAvMRiACcZLtYQBV/zB5wlxBOdt05T96WTTeDZdOWiHPQgdfS39u/4myqEev01Rvcgk7oDqSAViqTHWZwF8Q2MHcDRyVxvi5Ayp1lr/gJtXyTFRjxBY+Bkoiwsl1LtHOcYpH6P0KoOkbJzq+xTbK4X9sKco5EB6JRegLXqE8s0Umuphof3kkpZtx6z0e2CMN2JDkX0IbV+NBBrch1hSpsRwFY49I3h0h/KTvpUXPOW/Ru9B+k0s4pIdycOrb1w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com (2603:10a6:10:35b::7)
 by VI2PR04MB10764.eurprd04.prod.outlook.com (2603:10a6:800:271::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.18; Tue, 17 Feb
 2026 23:00:41 +0000
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4]) by DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4%4]) with mapi id 15.20.9632.010; Tue, 17 Feb 2026
 23:00:40 +0000
Date: Tue, 17 Feb 2026 18:00:19 -0500
From: Frank Li <Frank.li@nxp.com>
To: Niklas Cassel <cassel@kernel.org>
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Minghuan Lian <minghuan.Lian@nxp.com>,
	Mingkai Hu <mingkai.hu@nxp.com>, Roy Zang <roy.zang@nxp.com>,
	Jesper Nilsson <jesper.nilsson@axis.com>,
	Jingoo Han <jingoohan1@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
	Marek Vasut <marek.vasut+renesas@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Christian Bruel <christian.bruel@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Manikanta Maddireddy <mmaddireddy@nvidia.com>,
	Koichiro Den <den@valinux.co.jp>,
	Damien Le Moal <dlemoal@kernel.org>, linux-omap@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@axis.com, linux-rockchip@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH 6/9] PCI: dwc: Disable BARs in common code instead of in
 each glue driver
Message-ID: <aZTzA90dWgtpY7jo@lizhi-Precision-Tower-5810>
References: <20260217212707.2450423-11-cassel@kernel.org>
 <20260217212707.2450423-17-cassel@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260217212707.2450423-17-cassel@kernel.org>
X-ClientProxiedBy: PH8PR21CA0019.namprd21.prod.outlook.com
 (2603:10b6:510:2ce::9) To AS1PR04MB9382.eurprd04.prod.outlook.com
 (2603:10a6:20b:4da::15)
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
X-MS-TrafficTypeDiagnostic: DU0PR04MB9372:EE_|VI2PR04MB10764:EE_
X-MS-Office365-Filtering-Correlation-Id: 210630b7-edac-4f6d-86aa-08de6e785ee3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|366016|52116014|7416014|376014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CKrbk02+uLfd7VwzxZzt4BvOcoEjEwDB2t98ef1ZTQyO0m6/d+A9woqbvGPV?=
 =?us-ascii?Q?32f//ov7JKag9mGOwaU6R0em9JXXhwlUr0qeuUS3lx/PZWDd7gJX0+AYr7b2?=
 =?us-ascii?Q?nizaURD/kfHeLttNfS+tLK8q93BwBVwgM1X2J2TOUg/D+uZ/sr3RZSlKCDbP?=
 =?us-ascii?Q?o2NmCX2m0q+1lSoOQMFxxER/VaxsIqGgfD2Uv6JQBYhNW1bDd5IFU+BeSl9D?=
 =?us-ascii?Q?yry6u3mPpZw3bV1TF2ByB7PFNcSBnoSVaCnk4CPlR3fv8l/AM9XanBtMdVKV?=
 =?us-ascii?Q?SSscgpvLArjQOA9coLm9xPyzS786fyKhPy1/+1Rg5+C2HBSZd0k5wyOCo+9j?=
 =?us-ascii?Q?i+Z8grbL0qcutAo1MBbe+ubxIrIgesLXau6ePdHo1OIwnAXRZ+9SOMfLS3/u?=
 =?us-ascii?Q?NTvHMZj2Elr7HBMq3fuAfo2P9A5c3XIhkFxEqrvTQ6CC2pQExGIi1RkFN1Ge?=
 =?us-ascii?Q?PrtjsXyyNffPNkCyfzUQmdUmmCBO4lOEMvBSjCBON0Eihm7zasJr93a00kmc?=
 =?us-ascii?Q?K17LB8PE3KRELbaR2KRUvM8FYTOd45uJ6vJCwXdx+bD47RAjE0EU1JqPtyLi?=
 =?us-ascii?Q?7JbIDJMJGymNg3CkZqN+w4NgvfnD0a7HKMPttxZj+bGP/1y7Pnw8SUqRjT7f?=
 =?us-ascii?Q?OqB8+jJgqMrSqW1tlTYZ+8m0T2sLwt12h4grZx2LqS58lW9CbnfCHKBSTmRm?=
 =?us-ascii?Q?wMloTMFM32NgYiw8ulcZxRZiKFo00Q9kDX4FbBFSIjaUVJ/5ObrHvTuITnS/?=
 =?us-ascii?Q?bTjP0lF7UmcG5p67bWMACNpXDZQHk+fy6LfrByzmn+/4o/bbMnm+GnjZAIh4?=
 =?us-ascii?Q?JW/77D1TiyP0E5vB7AeyxN23M2FYKsCFRY9SJJHFIbrmGDjpIS02eGTY/T3Y?=
 =?us-ascii?Q?VCMVJ4UouSK9P+NNLC/o6iz7+W2TXwdAHAHYtA45aX0zOeKV5UqcTLFjN5jL?=
 =?us-ascii?Q?/p7PzInJO1K7C9+Y9ZsUJyx/HPX8IcWMScUMvP5RZ8yrgdk377Z/ryPFJ5yS?=
 =?us-ascii?Q?rwHcBzxAYdJjugGVpZq4tDAvOb/6/XJ+vAHwrvah0u2FZs5794VohBIIeji4?=
 =?us-ascii?Q?nkwmZJmmOzcfrTEZRRr9Aj5uQtDPEc0WyefnJrM1XQT/DFQbJ+mUmk53den0?=
 =?us-ascii?Q?pZznu9VSaF5ZQ9NhbNOMs8u1JF2C0/22s2AfDf0Eb213n93htTgrPf+zRiNV?=
 =?us-ascii?Q?5nCXsQ3bp6I34Dj1qRcxm9P8s2BOfGROaajWlS91l4axXLufoWWKMmyDYoLF?=
 =?us-ascii?Q?dn+hY9aGsXbbOAtiJOdp2x60tNt7++y58fFED4YvAZ+uHoT+/pSxnwpXD/L1?=
 =?us-ascii?Q?E/2zeqwxmaXXzBO2zywQ7SLMSDi7JhQDdUaykX6bV2i6dCxvoiW/OzwqyJQ5?=
 =?us-ascii?Q?xI6zacfE4IuGOR4JrukyiHdcQ3TNvphdRbF3SrZL8IUH+cb/rvqo7QW3Q491?=
 =?us-ascii?Q?3ILX+u3EfbaevGtIUOgFnAj0FkNf1R9zHgHriAYnFdgmzLqZKile6IOszONy?=
 =?us-ascii?Q?tPO2oiBnPX32RwmUbn/kR38UClPzCDs66qH78P/+zDF0QdSLWmfLyjKXU8Pd?=
 =?us-ascii?Q?4lgxJn8wdSWLPgHnafuoDoaE1GEioyq6ahFKr188QyKq7Y3IYDyNZxpxa+5V?=
 =?us-ascii?Q?biIN4YPi2OmGTb+gCE9+psc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9372.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(52116014)(7416014)(376014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?eB27rWWqU25XcUsFxndO9f9HVxrliCccI8Ob6vA07ObsdyiZ+kb0Y/BFnryE?=
 =?us-ascii?Q?Q6GJ3AaFsRGmXG4gcRiajOt+hdGygzIvKPtTYVZW8rwok70ghn3l+k8QEMJi?=
 =?us-ascii?Q?81CWB8Vz2sztCU1d9BHiclL4dFDzcSnu2ISe2Sa/XHC+JMlPicLDe/G+GhVH?=
 =?us-ascii?Q?esgDu2RF1mq9qqySdfSmBiV4sKdp/nTzrYKPhzepPiR45T77XF+0OvTbuzad?=
 =?us-ascii?Q?bIVzBD5p1xR2jqqxy0M1cAykv10p6MYjP5dLJBHbbqtWQw4OZEFagTthVY97?=
 =?us-ascii?Q?8bNMHGWyy8FVMOt2tBmi+C3qNKjvnL9cXR6DYtb7/QQomDnTmuM4SoXrhIlj?=
 =?us-ascii?Q?NZ/VVE2Zrrt4fQ/6V1/XNz2UJ5xwC30Lo3emgBeE8JKdEEgqfw/EuuGZu0jr?=
 =?us-ascii?Q?QRHFLhIaIbD0u4LrZSusT6rn+/e19s8FTVJ98OMD/8Nx5RV4ODD6zEFpLAfb?=
 =?us-ascii?Q?D5qHjVhGH6kdq46tNUbJQuCCy1Kk67tXyslAROmBwabJmKlpwystx7+c481w?=
 =?us-ascii?Q?meIc6IBRluCgl5imbT4PGOYkcHdp5zToZmXzZyG0beKiJaZQGYrMvWiHyv1+?=
 =?us-ascii?Q?hJ8mZd3Tw2kAsJaUR7Yb3xbTk5vvo9k6gUitkQBSgtkybr5KAAqfk/YOgXfV?=
 =?us-ascii?Q?QLbBmy34pbS6gxmuTJqsfp0kunzRQnWdR9Cixi4c4Oi2bBYx+O85A3OXOIcx?=
 =?us-ascii?Q?FsgO6Ch74KcwKj667s2OkwM6fmsr3X/CSBKYvq0Ebslg3QeBYo0KhJyCMoP3?=
 =?us-ascii?Q?YmY7+KB/DYZ91BBH9Vx3jD1GWXk2RXeMJzC3zNA/mOWWaP92/CcsGiCEPY3L?=
 =?us-ascii?Q?rfLk9dlqOoLUyRbTu63EBZBonZrORJ/Ptm66VbWOpon+1s6D317fws0bg00u?=
 =?us-ascii?Q?P8Wl1LLaESxUVNst/vbbWv6OAtjaSQQ9JX0b0BxljZo4dP89nz2pEny5/oxv?=
 =?us-ascii?Q?wGCy+lF09jD49veuT/1n/ntkhbg5aFGTXQ1xdnuFiy1+luAxTjuPfrZa2zLs?=
 =?us-ascii?Q?ZyixbWbfPIK5hB27z91debdisgm2o5EU/5JkBD/19767XL6ab2mY8KAa/xcr?=
 =?us-ascii?Q?A8abRxzgELmDau+Au2mneSvCTDEkSPvAh6aUPRN4d34hKk6ixqoauYrQdzkO?=
 =?us-ascii?Q?Dps9kYO0Gx9jAND5NYq367Qx/xFkif6xT6t2ZLAV2UtEuZdicLzHlVdNfs8o?=
 =?us-ascii?Q?eyxS1D3Y6T0oBNHaXgfvjezDyWmOOrtOBaZqCpyfZxpYqIi1ab2UVvluDdVG?=
 =?us-ascii?Q?F2Vqlm2O9Yonijhoj7yf65HjRMMX8FMUAr1HLTOTHvdj/UufczJtXpL/TGNE?=
 =?us-ascii?Q?45ToM/j5SeJqvDWCl76740hxb517es45WKal2t+wQYZ/BgbHGE/kLLvxusom?=
 =?us-ascii?Q?gHBldIVsAi/WH82aLqe5JDLgnuywGdJKhsxoefCUyvKj/R8Cw6MwLXy7j0la?=
 =?us-ascii?Q?nX1izlEY7IyMs8KqpTJ0nmHhojDsjJD/zKI4x0luq6gxVS9sXMLEH8hGOC6G?=
 =?us-ascii?Q?xJpJQH+981Ush9xXG8AfGY4u7AbkMFLgU4X2asb2/Tu5eHgEG7SgCUXuVRBG?=
 =?us-ascii?Q?ewE1968EJfSB6ZholLxRZkrtvg67Z+Zg7hCjB0S4pTpCa/jEXSSd4kD4ynFM?=
 =?us-ascii?Q?AX1IvtvfyuYWxB0UtciSw9TVYnLEtPuCA7C3b+MtFoErT2LhLLpIQb/UZv+f?=
 =?us-ascii?Q?Lkf5MKeXHTdklwC6wCjOvkni8pGb6uWVecG6Ww8dEB+XAgXS?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 210630b7-edac-4f6d-86aa-08de6e785ee3
X-MS-Exchange-CrossTenant-AuthSource: AS1PR04MB9382.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 23:00:40.7795
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gzVPHI0bm8SgFr17UceyN/lQdcd0YUxpyswyKhcAqTgmxQ42URZFMqzr8DvMLMZdlRl3Si95lmnGwNk5FNXf2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10764
X-Spam-Status: No, score=0.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.21 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[44];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-16923-lists,linuxppc-dev=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:cassel@kernel.org,m:vigneshr@ti.com,m:s-vadapalli@ti.com,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:mani@kernel.org,m:robh@kernel.org,m:bhelgaas@google.com,m:hongxing.zhu@nxp.com,m:l.stach@pengutronix.de,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:minghuan.Lian@nxp.com,m:mingkai.hu@nxp.com,m:roy.zang@nxp.com,m:jesper.nilsson@axis.com,m:jingoohan1@gmail.com,m:heiko@sntech.de,m:marek.vasut+renesas@gmail.com,m:yoshihiro.shimoda.uh@renesas.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:christian.bruel@foss.st.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:thierry.reding@gmail.com,m:jonathanh@nvidia.com,m:hayashi.kunihiko@socionext.com,m:mhiramat@kernel.org,m:mmaddireddy@nvidia.com,m:den@valinux.co.jp,m:dlemoal@kernel.org,m:linux-omap@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:imx@lists.linux.dev,m:linuxppc-dev@lists.ozlabs.org,m:linux-arm-kernel@axis.com,m:l
 inux-rockchip@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-tegra@vger.kernel.org,m:marekvasut@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:mcoquelinstm32@gmail.com,m:thierryreding@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[Frank.li@nxp.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[ti.com,kernel.org,google.com,nxp.com,pengutronix.de,gmail.com,axis.com,sntech.de,renesas.com,glider.be,foss.st.com,nvidia.com,socionext.com,valinux.co.jp,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.ozlabs.org,st-md-mailman.stormreply.com];
	TAGGED_RCPT(0.00)[linuxppc-dev,renesas];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,nxp.com:dkim]
X-Rspamd-Queue-Id: EFA0A151AB7
X-Rspamd-Action: no action

On Tue, Feb 17, 2026 at 10:27:12PM +0100, Niklas Cassel wrote:
> The current EPC core design relies on an EPC driver disabling all BARs by
> default. An EPF driver will then enable the BARs that it wants to enabled.
>
> This design is there because there is no epc->ops->disable_bar().
> (There is a epc->ops->clear_bar(), but that is only to disable a BAR that
> has been enabled using epc->ops->set_bar() first.)
>
> By default, an EPF driver will not be able to get/enable BARs that are
> marked as BAR_RESERVED or BAR_DISABLED (see pci_epc_get_next_free_bar()).
>
> Since the current EPC code design requires an EPC driver to disable all
> BARs by default, let's do this in the DWC common code rather than in each
> glue driver.

Move this to DWC common code from each glue driver.

>
> BARs that are marked as BAR_RESERVED are not disabled by default.
> This is because these BARs are hardware backed, and should only be disabled

Needn't "this is",  ... are not disabled by default because these BARS ..


> explicitly by an EPF driver if absolutely necessary for the EPF driver to
> function correctly. (This is similar to how e.g. NVMe may have vendor
> specific BARs outside of the mandatory BAR0 which contains the NVMe
> registers.)
>
> Note that there is currently no EPC operation to disable a BAR that has not
> first been programmed using pci_epc_set_bar(). If an EPF driver ever wants
> to disable a BAR marked as BAR_RESERVED, a disable_bar() operation would
> have to be added first.
>
> No functional changes intended.
>
> Signed-off-by: Niklas Cassel <cassel@kernel.org>
> ---
>  drivers/pci/controller/dwc/pci-dra7xx.c       |  4 ----
>  drivers/pci/controller/dwc/pci-imx6.c         | 10 --------
>  .../pci/controller/dwc/pci-layerscape-ep.c    |  4 ----
>  drivers/pci/controller/dwc/pcie-artpec6.c     |  4 ----
>  .../pci/controller/dwc/pcie-designware-ep.c   | 24 +++++++++++++++++++
>  .../pci/controller/dwc/pcie-designware-plat.c | 10 --------
>  drivers/pci/controller/dwc/pcie-dw-rockchip.c |  4 ----
>  drivers/pci/controller/dwc/pcie-qcom-ep.c     | 10 --------
>  drivers/pci/controller/dwc/pcie-rcar-gen4.c   | 10 --------
>  drivers/pci/controller/dwc/pcie-stm32-ep.c    | 10 --------
>  drivers/pci/controller/dwc/pcie-tegra194.c    | 10 --------
>  drivers/pci/controller/dwc/pcie-uniphier-ep.c | 10 --------
>  12 files changed, 24 insertions(+), 86 deletions(-)
>
> diff --git a/drivers/pci/controller/dwc/pci-dra7xx.c b/drivers/pci/controller/dwc/pci-dra7xx.c
> index d5d26229063f..cd904659c321 100644
> --- a/drivers/pci/controller/dwc/pci-dra7xx.c
> +++ b/drivers/pci/controller/dwc/pci-dra7xx.c
> @@ -378,10 +378,6 @@ static void dra7xx_pcie_ep_init(struct dw_pcie_ep *ep)
>  {
>  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
>  	struct dra7xx_pcie *dra7xx = to_dra7xx_pcie(pci);
> -	enum pci_barno bar;
> -
> -	for (bar = 0; bar < PCI_STD_NUM_BARS; bar++)
> -		dw_pcie_ep_reset_bar(pci, bar);
>
>  	dra7xx_pcie_enable_wrapper_interrupts(dra7xx);
>  }
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index ec1e3557ca53..f5fe5cfc46c7 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -1401,15 +1401,6 @@ static const struct dw_pcie_ops dw_pcie_ops = {
>  	.stop_link = imx_pcie_stop_link,
>  };
>
> -static void imx_pcie_ep_init(struct dw_pcie_ep *ep)
> -{
> -	enum pci_barno bar;
> -	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> -
> -	for (bar = BAR_0; bar <= BAR_5; bar++)
> -		dw_pcie_ep_reset_bar(pci, bar);
> -}
> -
>  static int imx_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
>  				  unsigned int type, u16 interrupt_num)
>  {
> @@ -1478,7 +1469,6 @@ imx_pcie_ep_get_features(struct dw_pcie_ep *ep)
>  }
>
>  static const struct dw_pcie_ep_ops pcie_ep_ops = {
> -	.init = imx_pcie_ep_init,
>  	.raise_irq = imx_pcie_ep_raise_irq,
>  	.get_features = imx_pcie_ep_get_features,
>  };
> diff --git a/drivers/pci/controller/dwc/pci-layerscape-ep.c b/drivers/pci/controller/dwc/pci-layerscape-ep.c
> index 5a03a8f895f9..1f5fccdb4ff4 100644
> --- a/drivers/pci/controller/dwc/pci-layerscape-ep.c
> +++ b/drivers/pci/controller/dwc/pci-layerscape-ep.c
> @@ -152,15 +152,11 @@ static void ls_pcie_ep_init(struct dw_pcie_ep *ep)
>  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
>  	struct ls_pcie_ep *pcie = to_ls_pcie_ep(pci);
>  	struct dw_pcie_ep_func *ep_func;
> -	enum pci_barno bar;
>
>  	ep_func = dw_pcie_ep_get_func_from_ep(ep, 0);
>  	if (!ep_func)
>  		return;
>
> -	for (bar = 0; bar < PCI_STD_NUM_BARS; bar++)
> -		dw_pcie_ep_reset_bar(pci, bar);
> -
>  	pcie->ls_epc->msi_capable = ep_func->msi_cap ? true : false;
>  	pcie->ls_epc->msix_capable = ep_func->msix_cap ? true : false;
>  }
> diff --git a/drivers/pci/controller/dwc/pcie-artpec6.c b/drivers/pci/controller/dwc/pcie-artpec6.c
> index e994b75986c3..55cb957ae1f3 100644
> --- a/drivers/pci/controller/dwc/pcie-artpec6.c
> +++ b/drivers/pci/controller/dwc/pcie-artpec6.c
> @@ -340,15 +340,11 @@ static void artpec6_pcie_ep_init(struct dw_pcie_ep *ep)
>  {
>  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
>  	struct artpec6_pcie *artpec6_pcie = to_artpec6_pcie(pci);
> -	enum pci_barno bar;
>
>  	artpec6_pcie_assert_core_reset(artpec6_pcie);
>  	artpec6_pcie_init_phy(artpec6_pcie);
>  	artpec6_pcie_deassert_core_reset(artpec6_pcie);
>  	artpec6_pcie_wait_for_phy(artpec6_pcie);
> -
> -	for (bar = 0; bar < PCI_STD_NUM_BARS; bar++)
> -		dw_pcie_ep_reset_bar(pci, bar);
>  }
>
>  static int artpec6_pcie_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
> diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
> index 7e7844ff0f7e..5e47517c757c 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-ep.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
> @@ -1105,6 +1105,28 @@ static void dw_pcie_ep_init_non_sticky_registers(struct dw_pcie *pci)
>  	dw_pcie_dbi_ro_wr_dis(pci);
>  }
>
> +static void dw_pcie_ep_disable_bars(struct dw_pcie_ep *ep)
> +{
> +	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> +	enum pci_epc_bar_type bar_type;
> +	enum pci_barno bar;
> +
> +	for (bar = 0; bar < PCI_STD_NUM_BARS; bar++) {
> +		bar_type = dw_pcie_ep_get_bar_type(ep, bar);
> +
> +		/*
> +		 * Reserved BARs should not get disabled by default. All other
> +		 * BAR types are disabled by default.
> +		 *
> +		 * This is in line with the current EPC core design, where all
> +		 * BARs are disabled by default, and then the EPF driver enables
> +		 * the BARs it wishes to use.
> +		 */
> +		if (bar_type != BAR_RESERVED)
> +			dw_pcie_ep_reset_bar(pci, bar);

Any bad impact if reset a RESERVED bar?

Frank

> +	}
> +}
> +
>  /**
>   * dw_pcie_ep_init_registers - Initialize DWC EP specific registers
>   * @ep: DWC EP device
> @@ -1187,6 +1209,8 @@ int dw_pcie_ep_init_registers(struct dw_pcie_ep *ep)
>  	if (ep->ops->init)
>  		ep->ops->init(ep);
>
> +	dw_pcie_ep_disable_bars(ep);
> +
>  	/*
>  	 * PCIe r6.0, section 7.9.15 states that for endpoints that support
>  	 * PTM, this capability structure is required in exactly one
> diff --git a/drivers/pci/controller/dwc/pcie-designware-plat.c b/drivers/pci/controller/dwc/pcie-designware-plat.c
> index 8530746ec5cb..d103ab759c4e 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-plat.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-plat.c
> @@ -32,15 +32,6 @@ struct dw_plat_pcie_of_data {
>  static const struct dw_pcie_host_ops dw_plat_pcie_host_ops = {
>  };
>
> -static void dw_plat_pcie_ep_init(struct dw_pcie_ep *ep)
> -{
> -	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> -	enum pci_barno bar;
> -
> -	for (bar = 0; bar < PCI_STD_NUM_BARS; bar++)
> -		dw_pcie_ep_reset_bar(pci, bar);
> -}
> -
>  static int dw_plat_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
>  				     unsigned int type, u16 interrupt_num)
>  {
> @@ -73,7 +64,6 @@ dw_plat_pcie_get_features(struct dw_pcie_ep *ep)
>  }
>
>  static const struct dw_pcie_ep_ops pcie_ep_ops = {
> -	.init = dw_plat_pcie_ep_init,
>  	.raise_irq = dw_plat_pcie_ep_raise_irq,
>  	.get_features = dw_plat_pcie_get_features,
>  };
> diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> index ecc28093c589..4e9b813c3afb 100644
> --- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> +++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> @@ -361,13 +361,9 @@ static void rockchip_pcie_ep_hide_broken_ats_cap_rk3588(struct dw_pcie_ep *ep)
>  static void rockchip_pcie_ep_init(struct dw_pcie_ep *ep)
>  {
>  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> -	enum pci_barno bar;
>
>  	rockchip_pcie_enable_l0s(pci);
>  	rockchip_pcie_ep_hide_broken_ats_cap_rk3588(ep);
> -
> -	for (bar = 0; bar < PCI_STD_NUM_BARS; bar++)
> -		dw_pcie_ep_reset_bar(pci, bar);
>  };
>
>  static int rockchip_pcie_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
> diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
> index e55675b3840a..e8c8ba1659fd 100644
> --- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
> +++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
> @@ -861,17 +861,7 @@ qcom_pcie_epc_get_features(struct dw_pcie_ep *pci_ep)
>  	return &qcom_pcie_epc_features;
>  }
>
> -static void qcom_pcie_ep_init(struct dw_pcie_ep *ep)
> -{
> -	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> -	enum pci_barno bar;
> -
> -	for (bar = BAR_0; bar <= BAR_5; bar++)
> -		dw_pcie_ep_reset_bar(pci, bar);
> -}
> -
>  static const struct dw_pcie_ep_ops pci_ep_ops = {
> -	.init = qcom_pcie_ep_init,
>  	.raise_irq = qcom_pcie_ep_raise_irq,
>  	.get_features = qcom_pcie_epc_get_features,
>  };
> diff --git a/drivers/pci/controller/dwc/pcie-rcar-gen4.c b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> index 9dd05bac22b9..1198ddc1752c 100644
> --- a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> +++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> @@ -386,15 +386,6 @@ static void rcar_gen4_pcie_ep_pre_init(struct dw_pcie_ep *ep)
>  	writel(PCIEDMAINTSTSEN_INIT, rcar->base + PCIEDMAINTSTSEN);
>  }
>
> -static void rcar_gen4_pcie_ep_init(struct dw_pcie_ep *ep)
> -{
> -	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> -	enum pci_barno bar;
> -
> -	for (bar = 0; bar < PCI_STD_NUM_BARS; bar++)
> -		dw_pcie_ep_reset_bar(pci, bar);
> -}
> -
>  static void rcar_gen4_pcie_ep_deinit(struct rcar_gen4_pcie *rcar)
>  {
>  	writel(0, rcar->base + PCIEDMAINTSTSEN);
> @@ -449,7 +440,6 @@ static unsigned int rcar_gen4_pcie_ep_get_dbi2_offset(struct dw_pcie_ep *ep,
>
>  static const struct dw_pcie_ep_ops pcie_ep_ops = {
>  	.pre_init = rcar_gen4_pcie_ep_pre_init,
> -	.init = rcar_gen4_pcie_ep_init,
>  	.raise_irq = rcar_gen4_pcie_ep_raise_irq,
>  	.get_features = rcar_gen4_pcie_ep_get_features,
>  	.get_dbi_offset = rcar_gen4_pcie_ep_get_dbi_offset,
> diff --git a/drivers/pci/controller/dwc/pcie-stm32-ep.c b/drivers/pci/controller/dwc/pcie-stm32-ep.c
> index c1944b40ce02..a7988dff1045 100644
> --- a/drivers/pci/controller/dwc/pcie-stm32-ep.c
> +++ b/drivers/pci/controller/dwc/pcie-stm32-ep.c
> @@ -28,15 +28,6 @@ struct stm32_pcie {
>  	unsigned int perst_irq;
>  };
>
> -static void stm32_pcie_ep_init(struct dw_pcie_ep *ep)
> -{
> -	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> -	enum pci_barno bar;
> -
> -	for (bar = 0; bar < PCI_STD_NUM_BARS; bar++)
> -		dw_pcie_ep_reset_bar(pci, bar);
> -}
> -
>  static int stm32_pcie_start_link(struct dw_pcie *pci)
>  {
>  	struct stm32_pcie *stm32_pcie = to_stm32_pcie(pci);
> @@ -82,7 +73,6 @@ stm32_pcie_get_features(struct dw_pcie_ep *ep)
>  }
>
>  static const struct dw_pcie_ep_ops stm32_pcie_ep_ops = {
> -	.init = stm32_pcie_ep_init,
>  	.raise_irq = stm32_pcie_raise_irq,
>  	.get_features = stm32_pcie_get_features,
>  };
> diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
> index 9f9453e8cd23..3a6bffaff9ea 100644
> --- a/drivers/pci/controller/dwc/pcie-tegra194.c
> +++ b/drivers/pci/controller/dwc/pcie-tegra194.c
> @@ -1923,15 +1923,6 @@ static irqreturn_t tegra_pcie_ep_pex_rst_irq(int irq, void *arg)
>  	return IRQ_HANDLED;
>  }
>
> -static void tegra_pcie_ep_init(struct dw_pcie_ep *ep)
> -{
> -	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> -	enum pci_barno bar;
> -
> -	for (bar = 0; bar < PCI_STD_NUM_BARS; bar++)
> -		dw_pcie_ep_reset_bar(pci, bar);
> -};
> -
>  static int tegra_pcie_ep_raise_intx_irq(struct tegra_pcie_dw *pcie, u16 irq)
>  {
>  	/* Tegra194 supports only INTA */
> @@ -2008,7 +1999,6 @@ tegra_pcie_ep_get_features(struct dw_pcie_ep *ep)
>  }
>
>  static const struct dw_pcie_ep_ops pcie_ep_ops = {
> -	.init = tegra_pcie_ep_init,
>  	.raise_irq = tegra_pcie_ep_raise_irq,
>  	.get_features = tegra_pcie_ep_get_features,
>  };
> diff --git a/drivers/pci/controller/dwc/pcie-uniphier-ep.c b/drivers/pci/controller/dwc/pcie-uniphier-ep.c
> index 5bde3ee682b5..494376d1812d 100644
> --- a/drivers/pci/controller/dwc/pcie-uniphier-ep.c
> +++ b/drivers/pci/controller/dwc/pcie-uniphier-ep.c
> @@ -203,15 +203,6 @@ static void uniphier_pcie_stop_link(struct dw_pcie *pci)
>  	uniphier_pcie_ltssm_enable(priv, false);
>  }
>
> -static void uniphier_pcie_ep_init(struct dw_pcie_ep *ep)
> -{
> -	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> -	enum pci_barno bar;
> -
> -	for (bar = BAR_0; bar <= BAR_5; bar++)
> -		dw_pcie_ep_reset_bar(pci, bar);
> -}
> -
>  static int uniphier_pcie_ep_raise_intx_irq(struct dw_pcie_ep *ep)
>  {
>  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> @@ -283,7 +274,6 @@ uniphier_pcie_get_features(struct dw_pcie_ep *ep)
>  }
>
>  static const struct dw_pcie_ep_ops uniphier_pcie_ep_ops = {
> -	.init = uniphier_pcie_ep_init,
>  	.raise_irq = uniphier_pcie_ep_raise_irq,
>  	.get_features = uniphier_pcie_get_features,
>  };
> --
> 2.53.0
>

