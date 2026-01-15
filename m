Return-Path: <linuxppc-dev+bounces-15854-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42DFAD254A4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jan 2026 16:23:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dsRZt06tRz309H;
	Fri, 16 Jan 2026 02:23:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c202::7" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768490613;
	cv=pass; b=CArO0cezwDfSFedsI7YL9NRKQxel6AeeyP1lXwx0F3ZDYf1VGb7vOSJEb2ilfwhodgQSar6YJRhNoilh5MGAjL68aCwwYZGC98qf5ajNklq5CX5ooVezu8el4fEBr6kvKaymGXhzRNqoQW3GC9QLdoJfvGhCA1+eV8njNzgr6056yrvVkhGejwxDl21QmHKpSL5SWzN/ylORim8Jt9eaBTocItB1vR7O6ndNR5VE39bBHtn+0AfAXkmAfCe25Y2SiT4Ksjvoi9zgmosjpCx5mh0rIIahwkrS/qVQQ+ZttXaR+mVay6jgTaXC2NxZXFFXLm0ISlcVtrXNOG9Zz15mTQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768490613; c=relaxed/relaxed;
	bh=oxmF6EHWQrLQGbSKfEByjCBcROGVNYcKQiW+Ioa/Thg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=e6897PizkeGHjVTDch1sPBYamm6PrApAicIWPBogBZKtyKCOcBxaJwBhgkkQoEERa9fMMfZhoVItk3ddvVZ6jkSBF2csn7oR0HyonLZxkYMNsvsZs8Kd5X3FVmWyMGQwlrKvQ2VBZbWN62mtY0ZyJ6ICIiXItJgEspO264UGtMRfu4uAwDIu6iiO3812TD6zf+zO1GP7SPQMNie2+j6wYpvQntDKUITdJ27doiX6OpcIFR8/vsZTHqi9qolkkRzDibJGoHteto5nXi6TCeYo+34gTLi+F/WM4N620pMQquJb2munygok+lfuTenqLX0xeBeJuCmKWXNerMmUN3Y4PA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=A6vxMox9; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c202::7; helo=gvxpr05cu001.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=A6vxMox9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c202::7; helo=gvxpr05cu001.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazlp170130007.outbound.protection.outlook.com [IPv6:2a01:111:f403:c202::7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dsRZr4Mtyz2xNg
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jan 2026 02:23:32 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xWAfr8VMkw9/7A7GT750B6uMMbXPBGZqTUgxDUFqjdcZAFkXjQCnIhZy+nOKQU7z6nVqsKdJHqz9GMx1+DHPqTfO3zueelL74UYnTBiX/jasfsmdTdDTvB+fzYhaMb+Pn/yOb0IGHEGWDUy5N2i+sm441n1QNZDV6+XETIE3dgafwyQv/losjje7F/HHf8dd9jGAc80CERttOvVRz41bi4jBr0uUUoXNgR66LwFvPwpf0WyHxan2Fl0O6Ac3XGKM7kI12acuE443gFUm5kSuiaKNJHJt6MVKGlz6GKluXlOrHuliErr+jJY5qnboT4Z6A1XbxE1JhJI8C0ZVtcUGhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oxmF6EHWQrLQGbSKfEByjCBcROGVNYcKQiW+Ioa/Thg=;
 b=COa/hAK3WVWrp6X6x1o+IJ4aUgwbkUqFWLk2qX5D9XAHseM7In1Y8wb/CdL8dkOizs6ymyjxeHsnV14/DZe4xH/UAutY9UkxyBxjGHFdzN8S91RtaPiehOyqj73FEb85dZ/lZA/ksRM2GteIV46XIAZYhEowo0T3CIJG9G3tD7R3kK0MHlEB23X21KdU01TKqk++gWWMkdyYaCXDHm0tfZ3UqYDD0XwvWf5FFssc96SoYrX3QMyYCYFW8DNkreUeLn4sdLh++dRej3IQsb8KrQw9OnXZOOzV3AP3OWtruqfuqSk9OLimUJsj4goILQvi+QQtDnajxvDParfVcd6xKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oxmF6EHWQrLQGbSKfEByjCBcROGVNYcKQiW+Ioa/Thg=;
 b=A6vxMox9UMTSjxZleC1ACEC2KHnqvJGz7totlzoqgClxKArX6/GATL93cYhYZSREQqHRtXmb5g7HDP/wIkt1367dtqYm5jYAFlK/PXYIJt8B7jmb23yok6Ff6mklh0U5zFFp2zsKmuAm277FIdIIMvicYFm1LlTbqGH9Po3Hp1GZ2ie0G2rjfjm8XI3gsiswSLnvYztD23QIsTl7qWFR9dvUUp6z6OUPOG8ZI1HgVhA73RP/LSx9Io0CPbAwWER29nQn75z7TRjKt66+t/G8N2U+9j6ILnyLHvxKZaqjOuGEr3NB3WERamBWAol7rryR/FZmGAgpw+OAm8PNJOqZXQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8948.eurprd04.prod.outlook.com (2603:10a6:20b:42f::17)
 by DU2PR04MB8662.eurprd04.prod.outlook.com (2603:10a6:10:2dd::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Thu, 15 Jan
 2026 15:23:06 +0000
Received: from AS8PR04MB8948.eurprd04.prod.outlook.com
 ([fe80::843f:752e:60d:3e5e]) by AS8PR04MB8948.eurprd04.prod.outlook.com
 ([fe80::843f:752e:60d:3e5e%4]) with mapi id 15.20.9499.002; Thu, 15 Jan 2026
 15:23:06 +0000
Date: Thu, 15 Jan 2026 10:22:49 -0500
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
Subject: Re: [PATCH v8 4/5] PCI: dwc: ep: Support BAR subrange inbound
 mapping via Address Match Mode iATU
Message-ID: <aWkGSSPGcNKuDo3L@lizhi-Precision-Tower-5810>
References: <20260115084928.55701-1-den@valinux.co.jp>
 <20260115084928.55701-5-den@valinux.co.jp>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115084928.55701-5-den@valinux.co.jp>
X-ClientProxiedBy: SJ0PR05CA0171.namprd05.prod.outlook.com
 (2603:10b6:a03:339::26) To AS8PR04MB8948.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::17)
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
X-MS-TrafficTypeDiagnostic: AS8PR04MB8948:EE_|DU2PR04MB8662:EE_
X-MS-Office365-Filtering-Correlation-Id: 1507e131-6dba-4d21-c8d2-08de5449fb84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|52116014|376014|7416014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GLwTaYbJYViVnJXK71jJLc2eVKKr1dk0hfgVPnSIojSrCyv/Eh+3qvSvMIJs?=
 =?us-ascii?Q?Sy/UIpKj91HBK4OqYNbTurt7rwNYlh68XHlEfGGXo87RZBHki6hUJdLaVQRv?=
 =?us-ascii?Q?VR7RQFV6mIB7f+UeXYA3WcojK6ViM0O5f4yuhNo5AiuyMjDdU61f+zFu4j4f?=
 =?us-ascii?Q?dI8082LzoxcnmjR7KPPt+xOCsyuS209qXtFf4CSV5qsmThlz/ukdMuUt1HhB?=
 =?us-ascii?Q?N/OVouGxg7wj10xK19KTGu35jgHZQGt7ZCBuRMbxPNEjWNxqwpnbTn41jVEr?=
 =?us-ascii?Q?uCUrNwm8smdn/YKrBa0r30fXsmiwnOFr/cYxTBozPhAM7+/Nk2joRT+JyWBo?=
 =?us-ascii?Q?E8wTaY9fgWk4VtRl9lNfrv/GLauUnDGRSL9BRKti+NEMNQUR9/XSrY6oSZRf?=
 =?us-ascii?Q?M6Sg030C2xxYrFcKJ3Hcr1DK8wxgYZvoou/ZaS/gIfdn+8TjAwuvXnukOTBE?=
 =?us-ascii?Q?ID2crSDNq+H/l872PMsJHO+sa5z9oCYotPh7VDpk30nDVUrJvc7+nnKS1rfJ?=
 =?us-ascii?Q?4UhFEO+rVHzoqhOjyiNk9uCXYNd2zV+tsaRk/0dTw8pvWm9Y8jdJpvkcNxbh?=
 =?us-ascii?Q?tlwBPpOoz2UxgY70ZNrKyNAf93J3xZnbl5m4f7sJVG8YUHrOPengHzyTKR5z?=
 =?us-ascii?Q?CsCwhkI0Tr1zv9yIymwRIMleR6YaaOjp+rrL07E8bAMunoc46AA8j48Cprtk?=
 =?us-ascii?Q?rs61QIZb3jDIgKR0sa0BLE664HMMZUf9OKrSMQzT8UJ0aFbedkhKzc/TLCRO?=
 =?us-ascii?Q?/Zujt8xAMxllK+Mugey3DKvl/3mAfR1zIafT/8DD/fAfpKQFyYtjoRDrPpcp?=
 =?us-ascii?Q?CkdIbfUVe4b7qlF2c5821mjCquWR72sveITKpIRYlXHXJbKgJofk/AWclaQE?=
 =?us-ascii?Q?Pa8vghTWmog962zGvO5lWtuvEXjj2JFFdKZ+pezWrSgtwGoP33f8MXNKgXF0?=
 =?us-ascii?Q?2cYCq2rklAT504KevzbG+0CmfRh/KsXBg9lsAsoq/NbkY5S9e6DE7znyf8GJ?=
 =?us-ascii?Q?WkBGpBnZGjCWR54x9mqO2jZEqI+DikgHpuhBpLP1Qqw05Y8o84phbZqOLqN3?=
 =?us-ascii?Q?PJfICScGDFnv2UTkhgqGVCsdd37h3HRg6x6ebNzkKSf+EtyPV4/hKUd43ZU+?=
 =?us-ascii?Q?VGijOw4/o4Nw8Jl6/aHWogViAJ7A+qP3VX282IoeKJFrPCe0xobLueVrBMkp?=
 =?us-ascii?Q?sEtDrWiUveDyFoJ60v6MrwBa899+iFI0wgP90wga4CEnIw6KsEQl8xBv6Kcx?=
 =?us-ascii?Q?XjTbpbiuD22XMDUaq4T1Jih4RpjDAzS3z41jQwWOhfhAsHio+eMnqAQAUmnx?=
 =?us-ascii?Q?ftTXSDYZ4E09Wi5+QQp/HRXloUrzpJOcULnWREV+dEJiNduEo0rQh6AcbYV/?=
 =?us-ascii?Q?ZLrN16dm1mAPXcaZtD9I3/08TQHprwWsMb+gGcsL/QKVboGdDB2aQxCqWadE?=
 =?us-ascii?Q?jUwBJ3xjVXBMMN0vkbLFPkWhqqblO9Au+daFyA9n2F6kZJIdrgkbNUQA5Fs2?=
 =?us-ascii?Q?gsXE6FpYAIWNcUQmJN5ZJLp+YNY1uujA03ZGpv8pHdqGRxthsf+soQRdrZ6f?=
 =?us-ascii?Q?BqJzN6Y2+lF1MOQm5Lt2AvHU6Al21wsJObJrYStZoPsjyEMuL+62MLY6jsZh?=
 =?us-ascii?Q?U+Pyt/Qyta9ZJR+FvZTmTs0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8948.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(52116014)(376014)(7416014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1n8uhQve+eBzbAj4KKWo7l9TmPteoV7VQi201MH6wC7aLasFuNFbzmSVVBNk?=
 =?us-ascii?Q?FCbPeHN58udRIrwllQYPhnOXZHp//b60HsIMlS0paIvlljYTmoSQKyVBUrZ5?=
 =?us-ascii?Q?Vd9ZdI6kdZ07hKnKfHYcqUJ2btz5ysput8CrdLINYhcL9H24Zczb6JXBdnRJ?=
 =?us-ascii?Q?RV3tEyuSkEstkfCI1NcLLSjOrvSAGRvjLcc6yzJfzC3KaWczQWdipUZX0Unt?=
 =?us-ascii?Q?hX5o8h2R767E8hc00iePGYA1PUnsfcyTAgr4+1F1Usj49WUb6bz4OKgNJYsa?=
 =?us-ascii?Q?8TM52DiafDs6p5O3sM3OMON+hw3XqtuCK18kO3zakJbjUe7pbdEWjSSsG3Aw?=
 =?us-ascii?Q?cD45E+EBZwV6vsDVn1Srw1Y720UQF3zL0yoawkVywFbHTVL9VC9P8Q3/PiCh?=
 =?us-ascii?Q?PffSfOHJhljFAuxeTFMO2d1IfyHrqRZE1j/h38H6SajXny0I8NMLCPA88/PR?=
 =?us-ascii?Q?jX+R6eMk7FKpl6k+WWhnxcqPjJbL3P4Uw3hhUGwmn1dydJXHgv7KCA3jPPwy?=
 =?us-ascii?Q?HYx4Uu+fz4FZdXAFHqlw69UheMXbI4CXhxPpNyFsN9fPDBGykL3HAm17oqs8?=
 =?us-ascii?Q?8UhPBARQtOqGR0yMV7d/u7VBzKbWQvn/s2pZ9y7qzYm3E7+HFOlxmaAvFlD1?=
 =?us-ascii?Q?jVKLP5pl4aKnRsoGyGkb9PEw0U+IinJRjjZd4Lj1lucYMqxLqpcwN0wBoXYy?=
 =?us-ascii?Q?OkzgZ7SdqhzkSDPHKnZ5ijBMMvqVVJDiJI2FkRROkM5CBFY9eW/mZFQFJao+?=
 =?us-ascii?Q?BrrR2Df+J/6JhcMaixzdujnLbdt52o9BiHOqlt3kwXnH2eR7Mp9vc2WgzVDs?=
 =?us-ascii?Q?56buUJJruhVEsmcJSlyFnpVeJzW2pGDk85EdvT7qlj0Eqty75+n5GX9/Z5HU?=
 =?us-ascii?Q?kg2OUas6fU34jGN0GSXMpXWb6321PiG/OwYqI+7iK4rLekok9SYTxmL3895K?=
 =?us-ascii?Q?/rpkyMI1nZ/jJ/jx2JGeCgQdkjaUP2jNfTnFzbtMD6o+uV6zxw9zArqN0jvw?=
 =?us-ascii?Q?hHFP94xzXMHEBjlq2PEfPGggNVy3NyOelw9rrm35wsOALJ5RbFqwHFYgJma0?=
 =?us-ascii?Q?FxDW9DNkASmpmnv7rMlUbhqkT1aPetuPXwi7vXDl/bFaleppRTaoFUSlLoZH?=
 =?us-ascii?Q?JCm7xYJQUBxMs0fIZjGhS4pJez9xHFKbRGWCOZO+k07n3EwaensBY/trNFOt?=
 =?us-ascii?Q?GwsEVIvM6ESisz3yGNLYjH5Fz4/+DVsamSqW00SOkmvXaOn/6Quz1FttJT7I?=
 =?us-ascii?Q?a1vQhEjbupAfqkowg0IETrebdehHZhPu2r+5dc0hla/MlY3KogOuVqjI9z71?=
 =?us-ascii?Q?heBji/b22m+MwKn6BjECrjugTh14nK/UwkUy4JoqHhgPDPKQTYeXl3UpBMRp?=
 =?us-ascii?Q?AsyGfLIeW4ZvGY0inUc+RFAHjsMlf4aRyj9nG0KPoTiMNrrxxBF6fTv23prZ?=
 =?us-ascii?Q?e+dkk03qJerqthZGP+38FJsVIeyGYRLb+vFCj6aCnk3MJJOvB0VEA746CGAd?=
 =?us-ascii?Q?Seo4W+lR3My1F1oxBEl9MtnItpWyyeA6IiewvLly+8YlxiUxdlXE4vYLzwqy?=
 =?us-ascii?Q?Mn3SDVjCu7ZzWQdZLB5TbUFx/sRWk1KInDbDpDoA82MsmhDxvYKDW2IAmp1w?=
 =?us-ascii?Q?wr6K5FHYD8Npgqpomkpi60U5d8cnYTLpKxWK9YWqT8VGuVBIvC0MlKxUjX5y?=
 =?us-ascii?Q?LXPj0RoL9oPszludbmvoLSHLlkhDZ+XDFR9DsvDgkTHQtWhtsY5nM9oABg4N?=
 =?us-ascii?Q?G5L82vFNXA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1507e131-6dba-4d21-c8d2-08de5449fb84
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8948.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 15:23:06.4882
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WYLWn7uLZsZM7J+hZFEHEUQbaEiDjdhSYJlNYzqc6piAkRA6JEQ6ggjULSmLzR9yhxI+PgtokQjGxsJZ4yceZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8662
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
	T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Jan 15, 2026 at 05:49:27PM +0900, Koichiro Den wrote:
> Extend dw_pcie_ep_set_bar() to support inbound mappings for BAR
> subranges using Address Match Mode IB iATU when pci_epf_bar.num_submap
> is non-zero.
>
> Rename the existing BAR-match helper into dw_pcie_ep_ib_atu_bar() and
> introduce dw_pcie_ep_ib_atu_addr() for Address Match Mode. When
> num_submap is non-zero, read the assigned BAR base address and program
> one inbound iATU window per subrange. Validate the submap array before
> programming:
> - each subrange is aligned to pci->region_align
> - subranges cover the whole BAR (no gaps and no overlaps)
> - subranges are sorted in ascending order by offset
>
> Track Address Match Mode mappings and tear them down on clear_bar() and
> on set_bar() error paths to avoid leaving half-programmed state or
> untranslated BAR holes.
>
> Advertise this capability by extending the common feature bit
> initializer macro (DWC_EPC_COMMON_FEATURES).
>
> Signed-off-by: Koichiro Den <den@valinux.co.jp>

Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../pci/controller/dwc/pcie-designware-ep.c   | 203 +++++++++++++++++-
>  drivers/pci/controller/dwc/pcie-designware.h  |   7 +-
>  2 files changed, 199 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
> index 1195d401df19..904c90f16a0b 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-ep.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
> @@ -139,9 +139,10 @@ static int dw_pcie_ep_write_header(struct pci_epc *epc, u8 func_no, u8 vfunc_no,
>  	return 0;
>  }
>
> -static int dw_pcie_ep_inbound_atu(struct dw_pcie_ep *ep, u8 func_no, int type,
> -				  dma_addr_t parent_bus_addr, enum pci_barno bar,
> -				  size_t size)
> +/* BAR Match Mode inbound iATU mapping */
> +static int dw_pcie_ep_ib_atu_bar(struct dw_pcie_ep *ep, u8 func_no, int type,
> +				 dma_addr_t parent_bus_addr, enum pci_barno bar,
> +				 size_t size)
>  {
>  	int ret;
>  	u32 free_win;
> @@ -174,6 +175,179 @@ static int dw_pcie_ep_inbound_atu(struct dw_pcie_ep *ep, u8 func_no, int type,
>  	return 0;
>  }
>
> +static void dw_pcie_ep_clear_ib_maps(struct dw_pcie_ep *ep, enum pci_barno bar)
> +{
> +	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> +	struct device *dev = pci->dev;
> +	unsigned int i, num;
> +	u32 atu_index;
> +	u32 *indexes;
> +
> +	/* Tear down the BAR Match Mode mapping, if any. */
> +	if (ep->bar_to_atu[bar]) {
> +		atu_index = ep->bar_to_atu[bar] - 1;
> +		dw_pcie_disable_atu(pci, PCIE_ATU_REGION_DIR_IB, atu_index);
> +		clear_bit(atu_index, ep->ib_window_map);
> +		ep->bar_to_atu[bar] = 0;
> +	}
> +
> +	/* Tear down all Address Match Mode mappings, if any. */
> +	indexes = ep->ib_atu_indexes[bar];
> +	num = ep->num_ib_atu_indexes[bar];
> +	ep->ib_atu_indexes[bar] = NULL;
> +	ep->num_ib_atu_indexes[bar] = 0;
> +	if (!indexes)
> +		return;
> +	for (i = 0; i < num; i++) {
> +		dw_pcie_disable_atu(pci, PCIE_ATU_REGION_DIR_IB, indexes[i]);
> +		clear_bit(indexes[i], ep->ib_window_map);
> +	}
> +	devm_kfree(dev, indexes);
> +}
> +
> +static u64 dw_pcie_ep_read_bar_assigned(struct dw_pcie_ep *ep, u8 func_no,
> +					enum pci_barno bar, int flags)
> +{
> +	u32 reg = PCI_BASE_ADDRESS_0 + (4 * bar);
> +	u32 lo, hi;
> +	u64 addr;
> +
> +	lo = dw_pcie_ep_readl_dbi(ep, func_no, reg);
> +
> +	if (flags & PCI_BASE_ADDRESS_SPACE)
> +		return lo & PCI_BASE_ADDRESS_IO_MASK;
> +
> +	addr = lo & PCI_BASE_ADDRESS_MEM_MASK;
> +	if (!(flags & PCI_BASE_ADDRESS_MEM_TYPE_64))
> +		return addr;
> +
> +	hi = dw_pcie_ep_readl_dbi(ep, func_no, reg + 4);
> +	return addr | ((u64)hi << 32);
> +}
> +
> +static int dw_pcie_ep_validate_submap(struct dw_pcie_ep *ep,
> +				      const struct pci_epf_bar_submap *submap,
> +				      unsigned int num_submap, size_t bar_size)
> +{
> +	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> +	u32 align = pci->region_align;
> +	size_t off = 0;
> +	unsigned int i;
> +	size_t size;
> +
> +	if (!align || !IS_ALIGNED(bar_size, align))
> +		return -EINVAL;
> +
> +	/*
> +	 * The submap array order defines the BAR layout (submap[0] starts
> +	 * at offset 0 and each entry immediately follows the previous
> +	 * one). Here, validate that it forms a strict, gapless
> +	 * decomposition of the BAR:
> +	 *  - each entry has a non-zero size
> +	 *  - sizes, implicit offsets and phys_addr are aligned to
> +	 *    pci->region_align
> +	 *  - each entry lies within the BAR range
> +	 *  - the entries exactly cover the whole BAR
> +	 *
> +	 * Note: dw_pcie_prog_inbound_atu() also checks alignment for the
> +	 * PCI address and the target phys_addr, but validating up-front
> +	 * avoids partially programming iATU windows in vain.
> +	 */
> +	for (i = 0; i < num_submap; i++) {
> +		size = submap[i].size;
> +
> +		if (!size)
> +			return -EINVAL;
> +
> +		if (!IS_ALIGNED(size, align) || !IS_ALIGNED(off, align))
> +			return -EINVAL;
> +
> +		if (!IS_ALIGNED(submap[i].phys_addr, align))
> +			return -EINVAL;
> +
> +		if (off > bar_size || size > bar_size - off)
> +			return -EINVAL;
> +
> +		off += size;
> +	}
> +	if (off != bar_size)
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +/* Address Match Mode inbound iATU mapping */
> +static int dw_pcie_ep_ib_atu_addr(struct dw_pcie_ep *ep, u8 func_no, int type,
> +				  const struct pci_epf_bar *epf_bar)
> +{
> +	const struct pci_epf_bar_submap *submap = epf_bar->submap;
> +	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> +	enum pci_barno bar = epf_bar->barno;
> +	struct device *dev = pci->dev;
> +	u64 pci_addr, parent_bus_addr;
> +	u64 size, base, off = 0;
> +	int free_win, ret;
> +	unsigned int i;
> +	u32 *indexes;
> +
> +	if (!epf_bar->num_submap || !submap || !epf_bar->size)
> +		return -EINVAL;
> +
> +	ret = dw_pcie_ep_validate_submap(ep, submap, epf_bar->num_submap,
> +					 epf_bar->size);
> +	if (ret)
> +		return ret;
> +
> +	base = dw_pcie_ep_read_bar_assigned(ep, func_no, bar, epf_bar->flags);
> +	if (!base) {
> +		dev_err(dev,
> +			"BAR%u not assigned, cannot set up sub-range mappings\n",
> +			bar);
> +		return -EINVAL;
> +	}
> +
> +	indexes = devm_kcalloc(dev, epf_bar->num_submap, sizeof(*indexes),
> +			       GFP_KERNEL);
> +	if (!indexes)
> +		return -ENOMEM;
> +
> +	ep->ib_atu_indexes[bar] = indexes;
> +	ep->num_ib_atu_indexes[bar] = 0;
> +
> +	for (i = 0; i < epf_bar->num_submap; i++) {
> +		size = submap[i].size;
> +		parent_bus_addr = submap[i].phys_addr;
> +
> +		if (off > (~0ULL) - base) {
> +			ret = -EINVAL;
> +			goto err;
> +		}
> +
> +		pci_addr = base + off;
> +		off += size;
> +
> +		free_win = find_first_zero_bit(ep->ib_window_map,
> +					       pci->num_ib_windows);
> +		if (free_win >= pci->num_ib_windows) {
> +			ret = -ENOSPC;
> +			goto err;
> +		}
> +
> +		ret = dw_pcie_prog_inbound_atu(pci, free_win, type,
> +					       parent_bus_addr, pci_addr, size);
> +		if (ret)
> +			goto err;
> +
> +		set_bit(free_win, ep->ib_window_map);
> +		indexes[i] = free_win;
> +		ep->num_ib_atu_indexes[bar] = i + 1;
> +	}
> +	return 0;
> +err:
> +	dw_pcie_ep_clear_ib_maps(ep, bar);
> +	return ret;
> +}
> +
>  static int dw_pcie_ep_outbound_atu(struct dw_pcie_ep *ep,
>  				   struct dw_pcie_ob_atu_cfg *atu)
>  {
> @@ -204,17 +378,15 @@ static void dw_pcie_ep_clear_bar(struct pci_epc *epc, u8 func_no, u8 vfunc_no,
>  	struct dw_pcie_ep *ep = epc_get_drvdata(epc);
>  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
>  	enum pci_barno bar = epf_bar->barno;
> -	u32 atu_index = ep->bar_to_atu[bar] - 1;
>
> -	if (!ep->bar_to_atu[bar])
> +	if (!ep->epf_bar[bar])
>  		return;
>
>  	__dw_pcie_ep_reset_bar(pci, func_no, bar, epf_bar->flags);
>
> -	dw_pcie_disable_atu(pci, PCIE_ATU_REGION_DIR_IB, atu_index);
> -	clear_bit(atu_index, ep->ib_window_map);
> +	dw_pcie_ep_clear_ib_maps(ep, bar);
> +
>  	ep->epf_bar[bar] = NULL;
> -	ep->bar_to_atu[bar] = 0;
>  }
>
>  static unsigned int dw_pcie_ep_get_rebar_offset(struct dw_pcie *pci,
> @@ -370,6 +542,13 @@ static int dw_pcie_ep_set_bar(struct pci_epc *epc, u8 func_no, u8 vfunc_no,
>  		    ep->epf_bar[bar]->flags != flags)
>  			return -EINVAL;
>
> +		/*
> +		 * When dynamically changing a BAR, tear down any existing
> +		 * mappings before re-programming.
> +		 */
> +		if (ep->epf_bar[bar]->num_submap || epf_bar->num_submap)
> +			dw_pcie_ep_clear_ib_maps(ep, bar);
> +
>  		/*
>  		 * When dynamically changing a BAR, skip writing the BAR reg, as
>  		 * that would clear the BAR's PCI address assigned by the host.
> @@ -408,8 +587,12 @@ static int dw_pcie_ep_set_bar(struct pci_epc *epc, u8 func_no, u8 vfunc_no,
>  	else
>  		type = PCIE_ATU_TYPE_IO;
>
> -	ret = dw_pcie_ep_inbound_atu(ep, func_no, type, epf_bar->phys_addr, bar,
> -				     size);
> +	if (epf_bar->num_submap)
> +		ret = dw_pcie_ep_ib_atu_addr(ep, func_no, type, epf_bar);
> +	else
> +		ret = dw_pcie_ep_ib_atu_bar(ep, func_no, type,
> +					    epf_bar->phys_addr, bar, size);
> +
>  	if (ret)
>  		return ret;
>
> diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
> index 4df0cc44faab..b74f5014faf6 100644
> --- a/drivers/pci/controller/dwc/pcie-designware.h
> +++ b/drivers/pci/controller/dwc/pcie-designware.h
> @@ -306,7 +306,8 @@
>  #define DMA_LLP_MEM_SIZE		PAGE_SIZE
>
>  /* Common struct pci_epc_feature bits among DWC EP glue drivers */
> -#define DWC_EPC_COMMON_FEATURES		.dynamic_inbound_mapping = true
> +#define DWC_EPC_COMMON_FEATURES		.dynamic_inbound_mapping = true, \
> +					.subrange_mapping = true
>
>  struct dw_pcie;
>  struct dw_pcie_rp;
> @@ -486,6 +487,10 @@ struct dw_pcie_ep {
>  	phys_addr_t		msi_mem_phys;
>  	struct pci_epf_bar	*epf_bar[PCI_STD_NUM_BARS];
>
> +	/* Only for Address Match Mode inbound iATU */
> +	u32			*ib_atu_indexes[PCI_STD_NUM_BARS];
> +	unsigned int		num_ib_atu_indexes[PCI_STD_NUM_BARS];
> +
>  	/* MSI outbound iATU state */
>  	bool			msi_iatu_mapped;
>  	u64			msi_msg_addr;
> --
> 2.51.0
>

