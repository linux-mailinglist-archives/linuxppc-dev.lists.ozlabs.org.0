Return-Path: <linuxppc-dev+bounces-16557-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uEU1O1I2gmmVQgMAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16557-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Feb 2026 18:54:26 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CEAFDD2A5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Feb 2026 18:54:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f5B243Y0bz3bZm;
	Wed, 04 Feb 2026 04:54:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c20a::7" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770141260;
	cv=pass; b=Epzv4KLY9sibgIWIrQBf1vX0U4+zAJdLo6hUK0+GrmaOlYhw3ERduPmUq+ePuAUwQJaH6S67gFlk0P0gxB0ExtxLiDE2C4CKoywCgF/o3Zwm/FB7Uz/+V1rH5tRm0hOaz+ibi1EfF5/3Qy8qxGM8Xz2x1WZXBUiMjTwRg0oQ5zicaiBe0jaOU25r6hkElCF7Fk4q4bp31o0tHTFwZUcDCI+3sG+fCcVQAZAQBHdbqwBCJNYRS1kwYAsTHwu68nV91Vj6B7IFQObFnTaPh+1CA9XS5SAmyrc6AHEG3jaJTqJjwn1YNmEV/ywHRRNK+RYtEoNnQKUOkoD4nJP18I9Pfw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770141260; c=relaxed/relaxed;
	bh=FJVWjImSHOKLE1vU0BKHb7oVWVDieVIruTdagcF4ZFQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=BGMYp4W+/Qs90JSqDo1UYUnkMjKK3I9O2t+mn57f363P+a7Cz/7mh0ZMeoWsZ4h+tgZPzsD9xGI8Fco6r7rN9j/YqGHzLURNLrEq+S28AU/+msPPtbPfYh+9K87X8hXFGz8KrSCOF1bOtfdDQIT4qAet4SpZvpw5gBGGYzoRC+VmAlxT0iHglfW28FoWDRtLUbmL8qbw7vq/HhVmykmiShyRisWF+g0JnFgoUkMHsXB0b0LCIdqwcNVi/4Lq8LgkO4WBXJfUeXIJk9OPqtfOh23X7HvAWvcVRrQB5cjpfC2hn61iy3EoWXggpozQGuHKRcbTaPIv/2VeDWEp3qFriw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=g95kdfj3; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c20a::7; helo=pa4pr04cu001.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=g95kdfj3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c20a::7; helo=pa4pr04cu001.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazlp170130007.outbound.protection.outlook.com [IPv6:2a01:111:f403:c20a::7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f5B223wkSz3bTf
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Feb 2026 04:54:17 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c8Hq9HWP/pxN2A++J2l8r9cH6cPrVeqQ/m6nFKi+WKOLzCV10SbbB9oudXxE0lME6g713wGka9rXtcdm0gNAk498+rZSCh3MN27sOsD+zkvHAIf31C+JWX0ntR2D01hQjX2D5i/gNOnV6YxTBOplCvZhEbnRJpArHagn3YhaO8fIuPBUC4BT02vwZh6qQNCP/l7ssJhOe4tCt/ybXwN37Jc/J7LmOzUZKIazgMM5Qh+4mUbf3G+lFoW5KciDniowy9ONA5V32IBO+GKd1NBmfwU6YbtY9jz5C24EULtKTOpWERENXw7jyqF+8vPJQpp8056vT5V3kgyiwGOxxzSU5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FJVWjImSHOKLE1vU0BKHb7oVWVDieVIruTdagcF4ZFQ=;
 b=ZJeCxCjEu3jfwkXuqqr0SFlVxIPh+EtIX29ZHtce4Xt7wPptVWyD5ft7nhDHhlUbwWE64pOuU6yL2VsBl/hc8PzCsWkUOZFP5XKW4cEN4xa9n+6nnV5ZnkhHxEV5Z1IymJoQsCZW3NSjh8rHYkIOl1yFedQJpzlj7Sb508ejisFGGwXQkFKBPvGQr0SJBv+c8Bbk1ufTUFZGgUy4RE0LYEqquCKw1JkH39pENE0gi+f0FreKqcslHLUagJGi9igOre5oMXJ+PzcU/XIEDZurdJa4ngJ9Zebw0+hQPmaTkSY/vbEr8OyKPRMnTGfoTN7Cdy6LjY7ySk5Un8dOt3CEcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FJVWjImSHOKLE1vU0BKHb7oVWVDieVIruTdagcF4ZFQ=;
 b=g95kdfj349WKm6j9bw4f1e4ehzYDwWC3FWBw8UKU2JvAar2Fd6VkscTSWjxHQjr8S+vamvsEUEPp686293b9/nImtBDbyEuZ5gfYXCGa8HY2lWf8NlRiUxhFtIfVfo1HQ0OOejHgGSBIRX9WuEMGzrCyTrrUFdmmjwL8Xn3fyKvAqu00H/25iqaTVwNdnOPV4HRrWjc6hQQylgVKLQY7l+9KSrndWcuQOYrBYej8RuRf6fwgjqxI+8bv1kvtPqnkqlQslsl9QRR7XHmGZNJD5v0hQIsXYu2aDCkl24CXtJuSX589ooTJi6l/vrf4yFDS07jykz3QIRJhbR9JysPkCg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DBBPR04MB7499.eurprd04.prod.outlook.com (2603:10a6:10:203::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 17:53:53 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9587.010; Tue, 3 Feb 2026
 17:53:53 +0000
Date: Tue, 3 Feb 2026 12:53:45 -0500
From: Frank Li <Frank.li@nxp.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com, perex@perex.cz,
	tiwai@suse.com, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v3 2/4] ASoC: fsl_asrc_m2m: Add option to start ASRC
 before DMA device for M2M
Message-ID: <aYI2KZE8/MGQ633A@lizhi-Precision-Tower-5810>
References: <20260203031345.3850533-1-shengjiu.wang@nxp.com>
 <20260203031345.3850533-3-shengjiu.wang@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260203031345.3850533-3-shengjiu.wang@nxp.com>
X-ClientProxiedBy: SA1PR05CA0006.namprd05.prod.outlook.com
 (2603:10b6:806:2d2::10) To DU0PR04MB9372.eurprd04.prod.outlook.com
 (2603:10a6:10:35b::7)
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
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DBBPR04MB7499:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cfbe631-e39c-4abd-3700-08de634d318a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|376014|366016|52116014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?L4hT5SVSNMHCxqTm2UJrXk3D/SQQuNbTUUX9wS73e2+1QS+6MI3YtmDfeYpY?=
 =?us-ascii?Q?HgpLYrgbrWGi2K2S3d8dCBzu5e+u9HDKOSmsE8dnhmA8Mx9OaifUSlu9b2Kv?=
 =?us-ascii?Q?NACodcnxf9ARs/DOFw7UTNtKAnGItM5PMwGsKjRnV/s7WE6V1y6pJGTCnjnt?=
 =?us-ascii?Q?WSymaWFfAJhdxaKiGMHXi9AE9ChlickPWY8T448lDFT98kosqC5bYP5H0uEJ?=
 =?us-ascii?Q?zpEuuzZ9molGHrZX39dwnMJ0l0gx/YIdF+2JM1I4VBf2/6Pg99QaysQi6MXf?=
 =?us-ascii?Q?J3kpN3O7ILuDGpjJzgettw2SE7dUDUYZjCwtaoaOKRrfm1b2AGm2SHEr7pmm?=
 =?us-ascii?Q?sf9IAnjT+4B+2qMD/uf2MmkAPRkHy1aACHfPPIoOVH6Sn/PtO7hENzvKQ463?=
 =?us-ascii?Q?a/ObwyljTmHQlxYHsqL4aAVyjNLplCi+jKWak4yY2iNRY3potAMN09gQPkCG?=
 =?us-ascii?Q?mLsq21e/aAUiOzxYU+W3t2XWfZaXj6iT5vxHyvmU3ej+woi583PeyACMDbzY?=
 =?us-ascii?Q?8m9MaVPxGy6zeA/QmGDJ+jruT5cGj4tqxO4tQk9sHphqNP2SGo57rgS6CzHV?=
 =?us-ascii?Q?rZ6z7i47eO0SGm3DI3gLvMItxM3XAfvZvyRE0eaG9XZcw1h1Hqsqn9NIR2N4?=
 =?us-ascii?Q?VMbvvaFTI56jKJuK4zfChBmwn8enY+ASCV8+9QY2H5ydcAllp7xcb8wPYvjJ?=
 =?us-ascii?Q?31lEkMr8olWaGKPEQzGaFY6NbEJHIkC3HmdtreOobq7tCnksoZIhkcBvBfcs?=
 =?us-ascii?Q?FL5mU7/46cDycPsyjH5AimmJhJDHoJkd0CC18qJwFjJLBfQjGqaV3jN1tORJ?=
 =?us-ascii?Q?o+6cPMhcC73wgcgB6C6rxB0avdDk9PUTKoZZ4YlDJ503bH3Ffv1g3wVhXDE8?=
 =?us-ascii?Q?qjxI23lK0U3qkKEehl6JD9bTStFXLW3HpGVdSBON3WgUCWI9ZOwJgcc9K2xt?=
 =?us-ascii?Q?eKGPBTEpWhtZXlfnDxrqARXRlAGYd6RJiUyr1dr8TYLxUCsfUrdRUiOOjfvw?=
 =?us-ascii?Q?+7V8tOCN1reaS4NthNvFhNLc9IkjT2eMbJArw/0JXFxYQuR0FXtQDX+kbJ6C?=
 =?us-ascii?Q?R4YXMgLkTDxnRTpqSV3+jwRMpf9W3suOV78eu4b1NzZVMcKsBYzZXFaoMgE3?=
 =?us-ascii?Q?94AqaS6AdHVtK5LSW3uJZb7+F2ptJvlx4K7WFXr4uPuO3aY+yLWp0UXXLlJJ?=
 =?us-ascii?Q?IoUzAlwrQzy9rmMGFpAN0dOd+gcXWNh3Sud8b1P1HOBV5ITTcBk6iVEj8xzL?=
 =?us-ascii?Q?BdFJSJ+9B7GbFdSTHE1ROcGROYPJ30i3Be4jp5izJo/9ngfdKPYStuC+63bJ?=
 =?us-ascii?Q?ZoK65f8Xguc/ok5wgnJfKsvyke0HytP9UuyswVNXveaRAG7sX+Gw0Uptoztw?=
 =?us-ascii?Q?pE8n5NhJENJfwK9xd6q8L8ATha+wiK3UsV1GhF3UNZmC3QzdwRca4TV66sYG?=
 =?us-ascii?Q?ioq+2r6pwTFRHSOXsfLLTxELTLdBNBOV0q/5GlcCuj+6hYoJEJ/IZetOXUQ8?=
 =?us-ascii?Q?lnGBCLDIpa0XbTsIgjVPzUNYCi/olVxSppCd0Lx/CI3j1qObRB345AE/Y5pp?=
 =?us-ascii?Q?ZtJWdzapHKxUfWEv18LDr10CikF9hNM8P6xlqENsXUciIOh818tYBDkTVY96?=
 =?us-ascii?Q?1695RvbC0UeiToTk6CDj7AE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016)(52116014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5w9fjl6L5CWIz5wTyG72mAYYIll0Kj2mk1kEM/lfGFtdv1/m4LjckdtWtKJr?=
 =?us-ascii?Q?ENGdEcAdn0XQXMQtoaLj1mNfS1suveYqnxdLSC2XCDFsKudSl6af/sc2hQgK?=
 =?us-ascii?Q?GpiOT/8iCaWTx4aC5DXREtNRP7EdCnJLwDOVmXZC7+EXG9fvA4XKC0udbwUv?=
 =?us-ascii?Q?QwtFactp1mtJai44GXWP0pkIuprMsWv2bnwjG798ylyPC/csqT/1zb77j32B?=
 =?us-ascii?Q?quOupVVSquVtr3767FHeDb1l+Mlk3w7bU5rL8c0KKTfOX5bi3U0Fq7bXs0Ch?=
 =?us-ascii?Q?t/oQYMvtKd9R2qS7U5tq2LYwV3xSAJcLXhVNxXNAmr0h63Jlgn/ZZevdrpeA?=
 =?us-ascii?Q?tpW60mDylmDxocUJ5adfMzzPhP4q47x4BeF/dptA5Cjq+f/q4lw2dIUeIPEi?=
 =?us-ascii?Q?etGWfj6W1diSgoL6VWQYLfT1zPeNllNFZSv+p4/DgkBkmRY5GKL/TT/QxEGe?=
 =?us-ascii?Q?OJmJQWSWyGCuV+bKhsW95JWamUoMNpSEWfBp13jNwqllLJhZ19Amj/Kc+m54?=
 =?us-ascii?Q?NGMWWTmNoyWewnbmZMOIKc6KrUhDDycSeEQEInCqR44p2g4GnO7cz/7R7b7W?=
 =?us-ascii?Q?N0emttCt73KXBqqO1K3x6n9xVgLEvDY/R+flAPiPaJNAo12KZqRGIXjHM3mu?=
 =?us-ascii?Q?vO6aKNB+ti0mV8iJyzVTtfGvVyWPf0isJkKF9H1u76wj5A4f7KMcTmCLwuLJ?=
 =?us-ascii?Q?YYzXY/AN++eqIe39pSoNSvn3NvY0ae1bz23rh6qumK6ENa7mPfyz/p3J7E0e?=
 =?us-ascii?Q?6nooztRDU3G/U6NT3ijhVlrDpxWiHSmidoqMRNVIrxVAOPy7IxLdhSEuZAmi?=
 =?us-ascii?Q?L6C2dsbwFln+3aigyODbPrPvvozauhs3EtMEZ5wtGiZ8gHg9DNq2eR2Vi4Eh?=
 =?us-ascii?Q?tmIDSY2ru4Vse71yzEfh8koOQxzJhtR6c2moJRgKREnqULUFiatsYkVoxPdL?=
 =?us-ascii?Q?JdoqpsEa02uR1IJCcKNW1TKw3VvsoiwsEdxFCtxqEs0MVLi7TJorvtUCb3qi?=
 =?us-ascii?Q?l6q418dw7IRCa/uBHBqtWX2one422tu05ULw0pmAVJyjxgZ7hs4gy1oMFb0C?=
 =?us-ascii?Q?e7+wQRH+VYOmtu6j7XiwkCTzPyc3Ek2j85VALZLmuwy/aGzKlCoc9C8xCze7?=
 =?us-ascii?Q?CMjWxEnoqubJFcfbwpIisqHfcEucHvOv1WpPhlaAxWUzp66kPc5U4KLx7p+j?=
 =?us-ascii?Q?3eImQHtLZziN/eLwMx4Ad6NW/rJAaCrZ0VkSOS1KbrxoAIz9it+kcU6E8SoS?=
 =?us-ascii?Q?6pSFF4q+xoB6CDDlk4mE5gIJsFW/jtBsvGe6STtzFwc+GsR3BWkLJeQFqzm+?=
 =?us-ascii?Q?rk8DlW9+UHiVha/DM+Fo/Y9EqMbVY3IvNQ5ry9JJYoas7ytPf5/l96Oc4y6H?=
 =?us-ascii?Q?i/JDOpYoVMOdVzc0c8dXgh+4kZDcDlosHBD9D1sBFMrLrMtMMoi3BpoKoM43?=
 =?us-ascii?Q?1QpXl8pRLKp4TQzTAnG3U1OQbzBzTMPnTUhKJ4rZ7Az3JFmNU7TLhoo3mVPr?=
 =?us-ascii?Q?wwskNf2zMNkwbfVP338sj7/iBcoBDqMaQwBmaVq9CH95C+yKWp5QSx29UsgX?=
 =?us-ascii?Q?EFqaPJcOu7Rdw/X3VUJRWC7jnwQYhT2G4g4rPQRIh7WEarE8WVYJs2aBP+Fo?=
 =?us-ascii?Q?TjpUJnQHpWlFM+pO6ky/c1FboulzEHiZPySCVN7228flL6+L4RTlJ8lqVUbK?=
 =?us-ascii?Q?U7lMq9aYkVGe8LetIPszSN5XYdyGXXb72gcw5XB8u15w264x?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cfbe631-e39c-4abd-3700-08de634d318a
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9372.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 17:53:53.3074
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MDdApRcD94o1IObgt0lJjTNYW7viqu05GPVhkQTjO/FAjgk98yAVuekVfH/crDvbVRhva9xCT+DepQIfkI28mQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7499
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
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:shengjiu.wang@nxp.com,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:shengjiu.wang@gmail.com,m:Xiubo.Lee@gmail.com,m:nicoleotsuka@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:linuxppc-dev@lists.ozlabs.org,m:krzk@kernel.org,m:conor@kernel.org,m:shengjiuwang@gmail.com,m:XiuboLee@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[Frank.li@nxp.com,linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	TAGGED_FROM(0.00)[bounces-16557-lists,linuxppc-dev=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,pengutronix.de,vger.kernel.org,lists.linux.dev,lists.infradead.org,perex.cz,suse.com,lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,nxp.com:dkim]
X-Rspamd-Queue-Id: 0CEAFDD2A5
X-Rspamd-Action: no action

On Tue, Feb 03, 2026 at 11:13:43AM +0800, Shengjiu Wang wrote:
> There is a limitation on i.MX952 that dma request is not cleared at the
> end of conversion with dma slave mode. Which causes sample is dropped
> from the input fifo on the second time if dma is triggered before the
> client device and EDMA may copy wrong data from output fifo as the output
> fifo is not ready in the beginning.
>
> The solution is to trigger asrc before dma on i.MX952, and add delay to
> wait output data is generated then start the EDMA for output, otherwise
> the m2m function has noise issues.
>
> So add an option to start ASRC first for M2M before ASRC is enabled on
> i.MX952.
>
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  sound/soc/fsl/fsl_asrc.c        | 23 +++++++++++++++++++++++
>  sound/soc/fsl/fsl_asrc.h        |  4 ++++
>  sound/soc/fsl/fsl_asrc_common.h |  4 ++++
>  sound/soc/fsl/fsl_asrc_m2m.c    |  8 +++++++-
>  4 files changed, 38 insertions(+), 1 deletion(-)
>
> diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
> index 92fb16f7be45..b6d4f1e09e2e 100644
> --- a/sound/soc/fsl/fsl_asrc.c
> +++ b/sound/soc/fsl/fsl_asrc.c
> @@ -1078,6 +1078,27 @@ static unsigned int fsl_asrc_get_output_fifo_size(struct fsl_asrc_pair *pair)
>  	return val >> ASRFSTi_OUTPUT_FIFO_SHIFT;
>  }
>
> +static bool fsl_asrc_m2m_output_ready(struct fsl_asrc_pair *pair)
> +{
> +	struct fsl_asrc *asrc = pair->asrc;
> +	enum asrc_pair_index index = pair->index;
> +	int retry = 1000;
> +	u32 val;
> +	int ret;
> +
> +	/* Check output fifo status if it exceeds the watermark. */
> +	ret = regmap_read_poll_timeout(asrc->regmap, REG_ASRFST(index), val,
> +				       (ASRFSTi_OUTPUT_FIFO_FILL(val) >= ASRC_M2M_OUTPUTFIFO_WML) ||
> +				       (--retry == 0), 0, USEC_PER_SEC);

are sure need "retry"? there are timeout, which should be equal to 'retry'.

Frank
> +
> +	if (ret || !retry) {
> +		pair_warn("output is not ready\n");
> +		return false;
> +	}
> +
> +	return true;
> +}
> +
>  static int fsl_asrc_m2m_prepare(struct fsl_asrc_pair *pair)
>  {
>  	struct fsl_asrc_pair_priv *pair_priv = pair->private;
> @@ -1275,6 +1296,7 @@ static int fsl_asrc_probe(struct platform_device *pdev)
>
>  	asrc_priv->soc = of_device_get_match_data(&pdev->dev);
>  	asrc->use_edma = asrc_priv->soc->use_edma;
> +	asrc->start_before_dma = asrc_priv->soc->start_before_dma;
>  	asrc->get_dma_channel = fsl_asrc_get_dma_channel;
>  	asrc->request_pair = fsl_asrc_request_pair;
>  	asrc->release_pair = fsl_asrc_release_pair;
> @@ -1289,6 +1311,7 @@ static int fsl_asrc_probe(struct platform_device *pdev)
>  	asrc->m2m_get_maxburst = fsl_asrc_m2m_get_maxburst;
>  	asrc->m2m_pair_resume = fsl_asrc_m2m_pair_resume;
>  	asrc->m2m_get_cap = fsl_asrc_m2m_get_cap;
> +	asrc->m2m_output_ready = fsl_asrc_m2m_output_ready;
>
>  	if (of_device_is_compatible(np, "fsl,imx35-asrc")) {
>  		asrc_priv->clk_map[IN] = input_clk_map_imx35;
> diff --git a/sound/soc/fsl/fsl_asrc.h b/sound/soc/fsl/fsl_asrc.h
> index 1c492eb237f5..60b6865ca952 100644
> --- a/sound/soc/fsl/fsl_asrc.h
> +++ b/sound/soc/fsl/fsl_asrc.h
> @@ -257,6 +257,8 @@
>  #define ASRFSTi_OUTPUT_FIFO_WIDTH	7
>  #define ASRFSTi_OUTPUT_FIFO_SHIFT	12
>  #define ASRFSTi_OUTPUT_FIFO_MASK	(((1 << ASRFSTi_OUTPUT_FIFO_WIDTH) - 1) << ASRFSTi_OUTPUT_FIFO_SHIFT)
> +#define ASRFSTi_OUTPUT_FIFO_FILL(v)	\
> +	(((v) & ASRFSTi_OUTPUT_FIFO_MASK) >> ASRFSTi_OUTPUT_FIFO_SHIFT)
>  #define ASRFSTi_IAEi_SHIFT		11
>  #define ASRFSTi_IAEi_MASK		(1 << ASRFSTi_IAEi_SHIFT)
>  #define ASRFSTi_IAEi			(1 << ASRFSTi_IAEi_SHIFT)
> @@ -432,10 +434,12 @@ struct dma_block {
>   *
>   * @use_edma: using edma as dma device or not
>   * @channel_bits: width of ASRCNCR register for each pair
> + * @start_before_dma: start asrc before dma
>   */
>  struct fsl_asrc_soc_data {
>  	bool use_edma;
>  	unsigned int channel_bits;
> +	bool start_before_dma;
>  };
>
>  /**
> diff --git a/sound/soc/fsl/fsl_asrc_common.h b/sound/soc/fsl/fsl_asrc_common.h
> index 0cd595b0f629..c8a1a2b5915d 100644
> --- a/sound/soc/fsl/fsl_asrc_common.h
> +++ b/sound/soc/fsl/fsl_asrc_common.h
> @@ -107,6 +107,7 @@ struct fsl_asrc_pair {
>   * @asrc_rate: default sample rate for ASoC Back-Ends
>   * @asrc_format: default sample format for ASoC Back-Ends
>   * @use_edma: edma is used
> + * @start_before_dma: start asrc before dma
>   * @get_dma_channel: function pointer
>   * @request_pair: function pointer
>   * @release_pair: function pointer
> @@ -116,6 +117,7 @@ struct fsl_asrc_pair {
>   * @m2m_start: function pointer
>   * @m2m_unprepare: function pointer
>   * @m2m_stop: function pointer
> + * @m2m_output_ready: function pointer, check output fifo ready or not
>   * @m2m_calc_out_len: function pointer
>   * @m2m_get_maxburst: function pointer
>   * @m2m_pair_suspend: function pointer
> @@ -143,6 +145,7 @@ struct fsl_asrc {
>  	int asrc_rate;
>  	snd_pcm_format_t asrc_format;
>  	bool use_edma;
> +	bool start_before_dma;
>
>  	struct dma_chan *(*get_dma_channel)(struct fsl_asrc_pair *pair, bool dir);
>  	int (*request_pair)(int channels, struct fsl_asrc_pair *pair);
> @@ -154,6 +157,7 @@ struct fsl_asrc {
>  	int (*m2m_start)(struct fsl_asrc_pair *pair);
>  	int (*m2m_unprepare)(struct fsl_asrc_pair *pair);
>  	int (*m2m_stop)(struct fsl_asrc_pair *pair);
> +	bool (*m2m_output_ready)(struct fsl_asrc_pair *pair);
>
>  	int (*m2m_calc_out_len)(struct fsl_asrc_pair *pair, int input_buffer_length);
>  	int (*m2m_get_maxburst)(u8 dir, struct fsl_asrc_pair *pair);
> diff --git a/sound/soc/fsl/fsl_asrc_m2m.c b/sound/soc/fsl/fsl_asrc_m2m.c
> index f46881f71e43..77999526dd9e 100644
> --- a/sound/soc/fsl/fsl_asrc_m2m.c
> +++ b/sound/soc/fsl/fsl_asrc_m2m.c
> @@ -253,15 +253,21 @@ static int asrc_m2m_device_run(struct fsl_asrc_pair *pair, struct snd_compr_task
>  	reinit_completion(&pair->complete[IN]);
>  	reinit_completion(&pair->complete[OUT]);
>
> +	if (asrc->start_before_dma)
> +		asrc->m2m_start(pair);
> +
>  	/* Submit DMA request */
>  	dmaengine_submit(pair->desc[IN]);
>  	dma_async_issue_pending(pair->desc[IN]->chan);
>  	if (out_dma_len > 0) {
> +		if (asrc->start_before_dma && asrc->m2m_output_ready)
> +			asrc->m2m_output_ready(pair);
>  		dmaengine_submit(pair->desc[OUT]);
>  		dma_async_issue_pending(pair->desc[OUT]->chan);
>  	}
>
> -	asrc->m2m_start(pair);
> +	if (!asrc->start_before_dma)
> +		asrc->m2m_start(pair);
>
>  	if (!wait_for_completion_interruptible_timeout(&pair->complete[IN], 10 * HZ)) {
>  		dev_err(dev, "out DMA task timeout\n");
> --
> 2.34.1
>

