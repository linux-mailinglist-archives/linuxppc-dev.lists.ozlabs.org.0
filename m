Return-Path: <linuxppc-dev+bounces-15666-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0D8D1B342
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jan 2026 21:27:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4drLQF38kyz2xWP;
	Wed, 14 Jan 2026 07:27:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=40.107.159.10 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768336037;
	cv=pass; b=LSERtqRwNrxA7zuhz4yeQc+TdV6KazhiQQ0k8J614MnIbZG3+hoDEsvvrGw1nbxnLtI6SeKedWbkNY0U6sJd1Dl2vt6ZJ2OcUPwNl956qzijVFdnH+1A+UcRArowyYSvybqSJkfuIosmESNr2QbtXboSUpK51fx7f8988NPxuyfapHO87VZlCfB7BIpP2UwdaSgY4gNekJI5k/BFUQ1n6DUbFDC8egssxxKl52UY9yFJz+zE+jxSAZIx929GlcelnvMTaZ1RAUH86TjJTn4Zpq5tmBbTTeltiiP6Bk0Oh/T2YAhu94wd0MxWBxFYBVnO6SXaEaaGNRF3WhiuWkmBeA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768336037; c=relaxed/relaxed;
	bh=P/Bji9kb2pKnmOsvEEw2Xb8ObzCbj246NH6T0wrbnZY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Hw610zqI256WxqJ9PEgxtEnstoNHuSGhGyZPkE+c095NtreQtnJiryCDL3Kms6rsYdEWo8kBupgrUZfn2l1CtQw7Zy2ADz1aQUMQ4EUvApJPaRm9dgmoL764YxURvOb3LZOgZ9IfKvq1LrbisGMRwCaW/Fs+VPhI3lkYHjzzcUanErCJtUc+KTmVz/QeGH1rtkfLeBVTgVvQK70xQkbYsGufKOKoscVmyUwJ0/qe4rc6drf96TQmfvuPlH67qNgrBJGQG40J4LDC6AIybJxbIPC4W71rNAZ5793aIBiC2IuPufEPnwBD18EjUMckg319kDul+EMNYFggqL4FA8SiaQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=G/tDYaU6; dkim-atps=neutral; spf=pass (client-ip=40.107.159.10; helo=osppr02cu001.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=G/tDYaU6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=40.107.159.10; helo=osppr02cu001.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013010.outbound.protection.outlook.com [40.107.159.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4drLQC4l5kz2xQB
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jan 2026 07:27:15 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Au61bWIbkvmJCEvBPZjjJKtq01HtRT5V2+iCaDkEzCDt8tP+3P2YNeoCY4/hXT4UWAGBXVHOayaxbyc60RBu9BCl+SPc6fdo2InLQ/Fngw+lMiBM0XsKuxDgQDKTQP5uE1nYYBtmyAnmAjPooy20jIi1lNXCcNqgFID+8N0qJw+CKBU/57au8st9y1uAsfZnMg7V5UBHJBpjKptEa4FwDtUWMlqDRfdpClMrOmR+93IUPTGCisWyLerg/2CBuJ5Qj9IeQgg1Jn5+0kPhFY1prZpNHDiyxVEEKwFmYZeZOn/vvBtPMi4A27jLVFZgwKFrq0RID6IEvCXG6afpuxCUGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P/Bji9kb2pKnmOsvEEw2Xb8ObzCbj246NH6T0wrbnZY=;
 b=DVVpPsibA7OZsJNNmE5Kn8TqB24v7ubKnfT9eBqtdoFdM692ht5/4g22xB6/M9u6Wsl02h9353TKdVwM4wTeEQ6kKdqNr/arzIG+ka+9CHX+eBOR2LUq4JWhVJIqtLYC41cUYrw9C/H+BvQwWcKDMR2jNYTK5Um3MCI4jFeYOjJbkcXQ4gZRkswI2DwyrJdrqYIaC0mRDTuo73wd1yLHULEkuzti5mfxlNMM/oJqIAsTPZa41Nkv2CCE42xMfQtg4FI8jomZLK3Banh2Hsd1d2JRha3zQN1r4qWNr7N+VrejPVQJRt/oDCZQ+4tgUVYx4HwhVzgjVKyccpDkxYMQfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P/Bji9kb2pKnmOsvEEw2Xb8ObzCbj246NH6T0wrbnZY=;
 b=G/tDYaU6eIOszv8JWi3QOnQdbhTqkdfLFNPA732b6Al/bGLOg9ZTI0VYy1KI+FIc0afLwKRNZ20jx5TkEuc6EWEr69cL0BwkDv4tzai/XzzV6tkEdOfmMRQ+xVsnMR5Qc0AeR7Xj+ZKMFX/LlQWoNLR4HCkO/sslZ0nIJ3ez75ssiX0LgSRvtpuDFhJlZ4HMIJHfjo1+Q68Kv8RFAwg4qcQZMoQHck5vqoOi7mRjV/Md1Jc2V4SImO2PblxWMzq5yx9oUQWjeazSus9tYK1DHVtzzquu4WsNjmEoCQSFnhZ4apJXjKYy9Z4Drphk4GaguP6qWpSByJ7foNjR0XfBJg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by VI2PR04MB10761.eurprd04.prod.outlook.com (2603:10a6:800:27e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 20:26:34 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9478.004; Tue, 13 Jan 2026
 20:26:33 +0000
Date: Tue, 13 Jan 2026 15:26:17 -0500
From: Frank Li <Frank.li@nxp.com>
To: Koichiro Den <den@valinux.co.jp>
Cc: jingoohan1@gmail.com, mani@kernel.org, lpieralisi@kernel.org,
	kwilczynski@kernel.org, robh@kernel.org, bhelgaas@google.com,
	cassel@kernel.org, vigneshr@ti.com, s-vadapalli@ti.com,
	hongxing.zhu@nxp.com, l.stach@pengutronix.de, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	minghuan.Lian@nxp.com, mingkai.hu@nxp.com, roy.zang@nxp.com,
	jesper.nilsson@axis.com, heiko@sntech.de,
	srikanth.thokala@intel.com, marek.vasut+renesas@gmail.com,
	yoshihiro.shimoda.uh@renesas.com, geert+renesas@glider.be,
	magnus.damm@gmail.com, christian.bruel@foss.st.com,
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
	thierry.reding@gmail.com, jonathanh@nvidia.com,
	hayashi.kunihiko@socionext.com, mhiramat@kernel.org,
	kishon@kernel.org, jirislaby@kernel.org, rongqianfeng@vivo.com,
	18255117159@163.com, shawn.lin@rock-chips.com,
	nicolas.frattaroli@collabora.com, linux.amoon@gmail.com,
	vidyas@nvidia.com, linux-omap@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@axis.com,
	linux-rockchip@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH v7 2/6] PCI: endpoint: Add BAR subrange mapping support
Message-ID: <aWaqablKcUnHx/mp@lizhi-Precision-Tower-5810>
References: <20260113162719.3710268-1-den@valinux.co.jp>
 <20260113162719.3710268-3-den@valinux.co.jp>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113162719.3710268-3-den@valinux.co.jp>
X-ClientProxiedBy: BYAPR06CA0022.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::35) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
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
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|VI2PR04MB10761:EE_
X-MS-Office365-Filtering-Correlation-Id: 386a5e3c-5723-4d80-08fd-08de52e20b21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|52116014|376014|7416014|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?n0KUlTixbRG8bzhIMIgIKtXaBi7xeRw7RZ43UcYEnBxVscOSrsNdex31E7OU?=
 =?us-ascii?Q?ukv/8hiZE+XIhBUWbhIzPAalwGceGa3fZVEZ1qa8N5eBUeWws/drvtIVn7sf?=
 =?us-ascii?Q?8BKVDTEwticyWuf7AzKEE4ZU7Odqsh0UpvjAo+/4sLy0Dlv0lZof4LGyVLH5?=
 =?us-ascii?Q?An7fmpTC+73uvDZUkMSe56v+v7Gg/wLKesJSYOiwT2C+jOor75k7d7RJcJSc?=
 =?us-ascii?Q?P09wv2N7+U58iAlm//ZZZfM/EcwH9Hzq3T3opspISC5b1WS6mu0ECaGeE/sM?=
 =?us-ascii?Q?OpEgyhs8EU1+AO/xaYguNp2WhOBdsuY/KGBVlpLw2xSu9MUzFdO1ClOEt2eF?=
 =?us-ascii?Q?KjSZyg0bLIVkhgclcJxIv4xJv2i6cW2uv5c75kfhoi5IOZMqS/CfOBvWXEdm?=
 =?us-ascii?Q?bsc0dv+At3F7koE5Z50uW/3/DLYby6xI1GUOQzCqVGqqEsMl/+y4jxrRFyIL?=
 =?us-ascii?Q?XvadvB9jTAe4YNEcv/mPWIChbbCxR5hjVusg6ygLA8u9rdIhGlyV/Q9EhQPb?=
 =?us-ascii?Q?RAUjW6Xj67IoyPeRuKgG5edzOEMQDBRKvkwJiCBvS9eQFWGLyQvS5HADj8qp?=
 =?us-ascii?Q?VlJvvqY5cLwNKTHoyYYpmI91J5dVUI9c7MVHDvMnnpNVp5VrsXUe0ZEU5gpb?=
 =?us-ascii?Q?WyIMOIyRkXomuTAKqd5wKqSbmBcElRitXLGosbnFh/p5LNM5PbP6RxTQMeX9?=
 =?us-ascii?Q?+NhZYFoQmcOTUtkde6x02Kb1QFzl4lxTU/tdrugOsdoC1ee4kd9Gngil03kx?=
 =?us-ascii?Q?lJp306HExJy3QBe1s9e+7H2owjbIA8oqV/vK5ABLgZlmO6VMjl5cy95vCmJO?=
 =?us-ascii?Q?8AEl70AVBUrgnP/6z3q/QkG0Ksu7a3loisyOlQ1uEdTZT8SgUs3Z3HslaeFR?=
 =?us-ascii?Q?VIDCACOjpqDPj8NaT0hsFC4DjRM5rexlcVIyI33HVzxSimq7u6Sfp8Jn+riR?=
 =?us-ascii?Q?2KWavlxiLku3+cF7ZmXyemCA55d/jkMCPqouxxTlFMaM8J1vYOGgo2loUao5?=
 =?us-ascii?Q?+UtCHkKuEeOlTNuksC5oNiczmbPc8AxM9XCulQ4C62a2z8x46aspkLCRgV3X?=
 =?us-ascii?Q?8FfslwU9mRwrF0M28j9783LkDTjNOln/6aWNw1bg+KhnVLKTrPCcHLYQNEiJ?=
 =?us-ascii?Q?uZEa0DEl/xj0BuVNFTiGiBDAnYxZnRkGNMhGoGuPHY/WP4ztsjnWQmAh2T9b?=
 =?us-ascii?Q?lBlXpEdNagz4CbMkO3OTj2nK/HS4SNz1BDlBCZiE0JIu2Dk+PDflNtK2JY4B?=
 =?us-ascii?Q?UIcWv8vw3i0plMNUceEsAIsxZ2czYWONfNV6b5wQwIcllusMtc5cdXokgeRq?=
 =?us-ascii?Q?SGO386JiTJikHtHlg0tdRGWavReTLVIT+RpnQdEtZZh3NoiEByGZoHs5emBj?=
 =?us-ascii?Q?ox1d/5qUuL3eTU9cIaPzM8ENIS18GGlFNRyQK5wAHXd/AGu02QCMsI4m24EJ?=
 =?us-ascii?Q?ilSoKGYoxSMuc+FfW0gitvoGekHq9HwFjfZqFjtvr7Ru91v+dLlTa/xxVz2x?=
 =?us-ascii?Q?ovaMRLwjd/KBfaCIBZFtiUBh5NYj+UyfIRxk?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(52116014)(376014)(7416014)(1800799024)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4NbWw+yqdaqpkdNp+irJPfRKxknNNeHxhxwC2yTZPP2vpV6k3ZEjx74VnO5R?=
 =?us-ascii?Q?lUg6HgAGdkvdnzuxn+TDc/KHVvFHQO6fN2LzoaW81k8iReplcyy+BLfJeGXk?=
 =?us-ascii?Q?I1SMtYjVRMLljp1/NXJjqz27m74aoxEZuKpmuepi94cJFVVDZfgfhYTTAQSE?=
 =?us-ascii?Q?dVSys0JLda0R8Y58DhoYJhuThK+55bFcM25WQARgfgYfj56FfRObZEULYZ5l?=
 =?us-ascii?Q?jfTwnJ4CMFGt2/ozcPp/QI1hgAd4T8qU34FWY/reYyu+T38z0px2K+1enGMi?=
 =?us-ascii?Q?7awteLgoY4t/+opIRINrCCl1j9diWnclL3fHxMAOqSVFVq5Ljr21B5iKc1kg?=
 =?us-ascii?Q?bYgJpIm/fwAfhlywkFo8sUG/TY23bTG+bBIAYpGQL6odezu9qUIpXa62KnY8?=
 =?us-ascii?Q?9qcYHS/uCOvtg9TdnMudBn4qMMk2QrYuhfb+GSxraIQLU+/V9qn5/u49goGZ?=
 =?us-ascii?Q?jL/+hWl7HP1OoLKYOrYfKMGPyNrGNs1GKztYRqW/0mvqrTR58VOGLJeTVdvM?=
 =?us-ascii?Q?lJrPL7bAVxGA2k9JYr7wGiISiNxghh/zWQzlgABFSLHF5I4tVESmYmacAhRs?=
 =?us-ascii?Q?bb0pU5xo7vYbLv57NhtRgD9gOrqWJZ9/sET7/Dm7gV1Zcnw3m7Bn2J5OI8V3?=
 =?us-ascii?Q?cWW6GsQbFP4UWs4BWU45GCyA14QuF1KAXkf4e6W7iuL+OTtXkPiUZupUS1LS?=
 =?us-ascii?Q?UL20/0JVaW4f/PgQCLdF72SEQNg4kG0xtjJXJa7prTgdmaJjE1h6+ZsGla/z?=
 =?us-ascii?Q?4//oAKEXsL0hkpXGmhG1M8BmFx1z/K7ikXGQHuVK3ZJ0iwZM+4ITa8KveCER?=
 =?us-ascii?Q?f35E5imP4cnoB36f7IyBSdQtyzpUflITgWiDCTkzX0ZwqC0ovOUHSKsjCQZc?=
 =?us-ascii?Q?3gy2qUvSJbB8176nT6Gh98oSbHEv5MvT5axTeyiXqbl3NfS9pJ3OLBi5bE2z?=
 =?us-ascii?Q?Q6o9+NIAMq3KMrEeJ9p5YCuMTv7GkRXJUkuGYcfhu4YfUNKU6pWbVAiJ4goD?=
 =?us-ascii?Q?eSR6uDDMTM6Y9VsZgIrLJpSfyPObwPhbpboewIrVNvczKDh/mgj50pVbmS8V?=
 =?us-ascii?Q?6MjuGFG+q0REV1uFAu2ZBD0anybRiK6yr54EBsMHvKFwmi/bn0Y8R2eexX/F?=
 =?us-ascii?Q?CSZVUNC2Gi8yBodyRvDxqvHv2um4Ps6v+1NGsYX3ByXv9kdvOSUeFm7bfZqZ?=
 =?us-ascii?Q?sqtdyUym50ksOp0iaHXuWAnBe5wnAEnVIVMBcRYmMxIjewFhonZXnKEQoJPP?=
 =?us-ascii?Q?iNWIJkciCfqovc9DFOd9FFAD+nzYFVHSD79E1mpUFsY7paKEFjnRQ0tcJJEY?=
 =?us-ascii?Q?dJvRhXeDuwp++G6qLktoQLKltIZIg9B1+4YN906G8yV6ZzfOHBBrmLRD7QO9?=
 =?us-ascii?Q?uiCxwDnY4A0uJHMgKGByfdAtDGSlqRiaKUljEM4edn7QPvz0SXz8IHAwnZBq?=
 =?us-ascii?Q?5+EqeVVl1o4/EOVGs9FPZV8iuW7hlRCf9PEpn5BE95/tM6dQIparEKgEB5qy?=
 =?us-ascii?Q?DcEdROpGSIfellShGHH1UJb+KjN65GaDR7kVFko//YAmlcd7IA4QjHyEQlcH?=
 =?us-ascii?Q?RUIKoNDyLjDP6Dwt6i+ZuKC9eKZ1eOXdusyZAohF1jfSsflUe1yz4015pzpC?=
 =?us-ascii?Q?aimdV/FUEv1btdrGM5LGRqT0QLh8pJrZxVPf1QbbqFHxFLTKUSIckQ0xRn4r?=
 =?us-ascii?Q?6dKDRbKRp/GDNoKs98gmAOdcVOWIm4dmdX9dBt0kZbwdHp+SwPhKJ4+zVjA6?=
 =?us-ascii?Q?ZaQr6ZtVWg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 386a5e3c-5723-4d80-08fd-08de52e20b21
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 20:26:33.7520
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d51+s/mDIiHNJ6MdZd7zuiQ0Np31KCcYycuEcG9EKY5qRB5chuOEYbZbpFSuq2EOptFFSA1thrZ4i4NVlbGGjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10761
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Jan 14, 2026 at 01:27:15AM +0900, Koichiro Den wrote:
> Extend the PCI endpoint core to support mapping subranges within a BAR.
> Introduce a new 'submap' field and a 'use_submap' flag in struct
> pci_epf_bar so an endpoint function driver can request inbound mappings
> that fully cover the BAR.
>
> Add a subrange_mapping feature bit to struct pci_epc_features so EPC
> drivers can explicitly advertise support. Make pci_epc_set_bar() reject
> use_submap requests (-EINVAL) when the EPC does not advertise
> subrange_mapping, to avoid silently accepting a configuration that the
> controller cannot implement.
>
> The submap array describes the complete BAR layout (no overlaps and no
> gaps are allowed to avoid exposing untranslated address ranges). This
> provides the generic infrastructure needed to map multiple logical
> regions into a single BAR at different offsets, without assuming a
> controller-specific inbound address translation mechanism. Also, the
> array must be sorted in ascending order by offset.
>
> Reviewed-by: Niklas Cassel <cassel@kernel.org>
> Signed-off-by: Koichiro Den <den@valinux.co.jp>
> ---
...
>
>  #define to_pci_epf_driver(drv) container_of_const((drv), struct pci_epf_driver, driver)
>
> +/**
> + * struct pci_epf_bar_submap - BAR subrange for inbound mapping
> + * @phys_addr: target physical/DMA address for this subrange
> + * @size: the size of the subrange to be mapped
> + * @offset: byte offset within the BAR base
> + *
> + * When pci_epf_bar.use_submap is set, pci_epf_bar.submap describes the
> + * complete BAR layout. This allows an EPC driver to program multiple
> + * inbound translation windows for a single BAR when supported by the
> + * controller.
> + *
> + * Note that the subranges:
> + * - must be non-overlapping
> + * - must exactly cover the BAR (i.e. no holes)
> + * - must be sorted (in ascending order by offset)
> + */
> +struct pci_epf_bar_submap {
> +	dma_addr_t	phys_addr;
> +	size_t		size;
> +	size_t		offset;
> +};

I suppose offset is sum of previous all submap's size? If yes, needn't
offset.

> +
>  /**
>   * struct pci_epf_bar - represents the BAR of EPF device
>   * @phys_addr: physical address that should be mapped to the BAR
> @@ -119,6 +141,10 @@ struct pci_epf_driver {
>   *            requirement
>   * @barno: BAR number
>   * @flags: flags that are set for the BAR
> + * @use_submap: set true to request subrange mappings within this BAR
> + * @num_submap: number of entries in @submap
> + * @submap: array of subrange descriptors allocated by the caller. See
> + *          struct pci_epf_bar_submap for the restrictions in detail.
>   */
>  struct pci_epf_bar {
>  	dma_addr_t	phys_addr;
> @@ -127,6 +153,11 @@ struct pci_epf_bar {
>  	size_t		mem_size;
>  	enum pci_barno	barno;
>  	int		flags;
> +
> +	/* Optional sub-range mapping */
> +	bool		use_submap;
> +	unsigned int	num_submap;

can we use num_submap != 0 as use_submap?

Frank
> +	struct pci_epf_bar_submap	*submap;
>  };
>
>  /**
> --
> 2.51.0
>

