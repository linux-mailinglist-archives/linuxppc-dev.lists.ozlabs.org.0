Return-Path: <linuxppc-dev+bounces-15665-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C168D1B2F1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jan 2026 21:21:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4drLGz5q5Zz2xWP;
	Wed, 14 Jan 2026 07:20:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=52.101.84.26 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768335659;
	cv=pass; b=Na/A20zDygfyMqsTvCPX88AKCc+v8Is6oEthkyRx8OYRiYXnCbXvFI7mjyDIArhm/zZkHbgvtA6OVZjeCzNEpRFQWciPyw0y9ESjKW/UOnlptSBpV5TT4CuykRHUh2fNoTubRPqmVPF9GDNYc6smdIy1bZODTu5K+kzRQV0AuHEqe+O3s2HwYB8wj/3GzD0e1/zBIKqpninCZXjX36kp/+u6KnlzXIHsIV1DNr0bGlHF493MvNwozJOX7lsmOspKiFGsmDipK8xUQEmFSKvucm2slCYbqNdbh5MTIXAShxeloiXSbNt7myXuVcSJVCzCcVFRaBjAO+0ulrNJSqB3pg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768335659; c=relaxed/relaxed;
	bh=h1YD/fV7ApuqyNA+39UIVPOp5u2MTX8vUOoj+QoUQAw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=IptPioG4dzkRQYFHSi+ycrAu0z4QPHQ3U71pzpxIhlGitqTkhFb5Y9+jtxzBjmtxskPxK7FhQKK1ux8NA8nAR9md/NABP1pq0gzRMxpNK+Br1GcpDX2/Np6FybLIL4b/zGIXRuY8tP4ZgAXF6MVgU8lpE0y24v5bltIr1zQR8WA+VERGneatcMYrDk3ykms8uVWf9Z0nXodAKtvnLkEPuLQWBq/RLF0qx90dWihFslGyAUMNuvw4lm3TD1cZwbB3/ITHOIA7AEa6ztgpYeFS4FSg44yjDG1/r8lC7jPD8QWiddEUQ48HCFdvt6LtPgjYheJRWvNLd0vBbsMUArWNWg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=EDnEKAho; dkim-atps=neutral; spf=pass (client-ip=52.101.84.26; helo=db3pr0202cu003.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=EDnEKAho;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=52.101.84.26; helo=db3pr0202cu003.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010026.outbound.protection.outlook.com [52.101.84.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4drLGy0HZgz2xQB
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jan 2026 07:20:57 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DPjIc5z6r1sBlQfZPBgErB+oRxtjUqmxZquHgOk0dnCUzjKy/egQR2n77RaZtNYTe8RA2bcIq+HozWqtsH81H1KZlMi57DWpVwYUfs2uOgd66jEM0S6avh5SOO9YT2meEeZIR2uZKazBVzYwDB4p/F/bH/C0tcuW3fUiBAio6w9N9eUPWKYxGHX2jGEWGmdxzspm3G5hz5PO88K3ZruJrbDW9WTtFuiUOdQH2nVX8Ma8tC/1sM4kIhwLyf6LbtDrhzEIq4Zc2i+iBJSTU7bRxqXE35+N5AwYCaagNBO6gkH96edXzk5qL9901nJMV72E7bPIHmTuPSPpHhGcYk/2nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h1YD/fV7ApuqyNA+39UIVPOp5u2MTX8vUOoj+QoUQAw=;
 b=SwQTrwMQBffxwaMGhysUwQqaao0THG/+L3Vi1nXJkiP+jkHsekQ1+MJKVViFveX0e4DGlSxZXBr4y3wWgdYqlKQ5ixYfosDtorvukdqFvPLXkMXbK00qM8Q+YdkEdMrRfuctrD9WJ1PYdPZ0zOxauBr2RxYBKJM0MVkVSrcwKiOYYEG9Y/Qi8YXK1o3426pb1sU8vHPEP/ljKavlBvtCUl7eF+7lv3DiUuzvJ/LuGtjI0TFoGyqL9bA1scIYgP0sRjt7+FUAEnkiV9kl5MaNvstjnlYAGEqru9RakbClrTjE2uzYtM4y5swKkQ4LIqJGZhTpZFDhkZXXVxB357xKrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h1YD/fV7ApuqyNA+39UIVPOp5u2MTX8vUOoj+QoUQAw=;
 b=EDnEKAhoRURPi1UMxiRQQQ/2uxY9KCSOjJtYp2mpR5rZ9hl9lEIn+rIqLru3c/NT56XG39/5ozuP5ByXkLeJwnUxR6j4YvRZymTrKJ3HpDzSRE/AgUOB3HvNxYIypn7E9Ykpq1w6Dp27GzZT3T1GM2JeF2A6a83RXlk5TiHyZC0lmWZooVeWm6O9cA208nYlC5IytggVydHvmE2ue6uHy4iZjDEe5gckc2AcBISoELtjRSTs+uRXNVztMzlLeSsxhvH4Vn0U82/H7aGzpjYLZyRNU2tLKxWoZbqaEQKRTAlxIr72mJat2ZTdzbzUcUDb6Bz68RR1ka2h3niezyDTtg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by GV2PR04MB12319.eurprd04.prod.outlook.com (2603:10a6:150:32a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 20:20:16 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9478.004; Tue, 13 Jan 2026
 20:20:16 +0000
Date: Tue, 13 Jan 2026 15:19:55 -0500
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
Subject: Re: [PATCH v7 1/6] PCI: endpoint: Add dynamic_inbound_mapping EPC
 feature
Message-ID: <aWao64gu48V6aD+n@lizhi-Precision-Tower-5810>
References: <20260113162719.3710268-1-den@valinux.co.jp>
 <20260113162719.3710268-2-den@valinux.co.jp>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113162719.3710268-2-den@valinux.co.jp>
X-ClientProxiedBy: BYAPR06CA0057.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::34) To AS8PR04MB8948.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|GV2PR04MB12319:EE_
X-MS-Office365-Filtering-Correlation-Id: c72659b8-0917-4b5d-5c55-08de52e12797
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|1800799024|19092799006|376014|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zRtjCXll3v8D7tfDHj+hx3Ifc/zDCQU3r6OA0AnSqEm8CGs7o2R6lHFcnPf0?=
 =?us-ascii?Q?kzRlugB9gHWm1fwGexFH3uiULpJGk/2GkkrVxmSNQmz/okJ8LEJCOz0EpeMy?=
 =?us-ascii?Q?eJr/vhTm4fHUdrQDxt9XH9eJ1ZDOLY/4KiDRDkchB3TN9lrAZLs4/ojqVd3E?=
 =?us-ascii?Q?V92wvaQyKzlSmpw4h4DMcyCBrEPMwt+3KrSr+iSglLENP/D0wJAGrV5dCsSJ?=
 =?us-ascii?Q?OyC+XjH9mlry4UKjE3ekuPdN1PjzIBwa89YjwkcieaWpZUF9GcCLBFA1UaLu?=
 =?us-ascii?Q?uDqlTcKiDeKmjaWZdz3RieJSfA8m8A/i3xIQKcEhNzaydUaHdb16ckHca9YY?=
 =?us-ascii?Q?5K2awyleuUM+K5jtjFxH1x9g31pg3IztIJJ0SUdwCcuvO3xyQegIyrXv+dZT?=
 =?us-ascii?Q?ukv0cAS4GMvBXEBvikg95SR/1J83GbEwzGo05KFEnArAAv1cF8YSIAMUaaCd?=
 =?us-ascii?Q?e30uhk+PuPniuI/ovXMnT7uutxNAyCYPQJUdnrvvZNQgv4kC21wSxqpu3nP8?=
 =?us-ascii?Q?9s8SgJJ+Z23Ngp6MmGutrUHYDnSfFdKx9ZHl+Vh968nUOjNAELV1kuQunXWb?=
 =?us-ascii?Q?aARoFuTPuGhwTs5ox1Gb6hWVjBlAQIONxYH5IqkxPX6D31y7E2niZTeJgalq?=
 =?us-ascii?Q?HgU/KuSDnyRXer11k9D6oXAF0Q/W9wvs90unQ0HkSJy9ZVFwIDNODyp2MHeE?=
 =?us-ascii?Q?7ocaJUAjEbKW2BwyREaQJhPg6FcSNUqXNx0efjlbra+U0RRtTPZ6jHW3vGr8?=
 =?us-ascii?Q?YKdXsey5db3OKbNzQXVjJKDSNreogZc550LRAVJBf2RitWy8fRUi6dd25SFR?=
 =?us-ascii?Q?t22QXtbZ0TlJAD/x/wqNp2eFgRzyTjDzkgOxK5nhzODZ10PfAtf2jridn8Wu?=
 =?us-ascii?Q?MLUv4tV3A/xiBzjPcxsJPvUWSQ/Itp25OfnA+6SVZL1kAH9xV0tu8NkGvImY?=
 =?us-ascii?Q?jtw8B6JD+rc5ok4Ku2f2PDL9Q9Pp7ZvgdrFSO/mEDACrvn3lGLH7nPxzM8my?=
 =?us-ascii?Q?c/LrajeziW0JUuT+wHKZA9nuTX2rRtE3zKMIXgtG2Onseblt4zvNjkHB2uk7?=
 =?us-ascii?Q?biigR7FMxtRYAPVAicF52q1Gz2FD7lxPXfnwAyEn3KQ3XFo+Rx4EUCIQaV9j?=
 =?us-ascii?Q?nETdP1eeTCXBPGoevy/62EzMGR378vs7sKvxR6xMI60pnWygRB7k2YlxDsYg?=
 =?us-ascii?Q?jOsaGx8Gy/E6PYStWupLxmaloq8Yst2eTLwg1TqOYYvzkMSE9ys1W/+SjcWv?=
 =?us-ascii?Q?mN+L9SubPxLr/B7fGhvOt7JaF+7CQaER/LuhFC+VoK1UXUX7DWiZ0SlnVzAt?=
 =?us-ascii?Q?jU4PAf+XaI62CeLwgTO1VS41QKVR8FKQ1TbgrA8KQ7RkEN82m+pNYKRClQEf?=
 =?us-ascii?Q?kEIFLE8b5LjwfgqFhxB2fDWxXeZX+5DZzvlQ94wOBx1J1cWD0NTa8sFve9FQ?=
 =?us-ascii?Q?jAquRg/hHgl80XJxh0gBEtEKc30u1llvk9UEZonwDTBOv6ZcnF6Fd+Ms7ou+?=
 =?us-ascii?Q?lrlKiiijJi34ajX6DTOAU4SDAyu3VksSsWsd?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(1800799024)(19092799006)(376014)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dPjMcvzS/R0c/LjewQ1gJOr8Y4NSv17n3fDas76PJU74/v5St6qGqqixmK4L?=
 =?us-ascii?Q?W3nNDnTS+AEh2IB1STD5DX45sRyvrOjIX5MCJgCA4Xxn+CzPMI5XblksTW9I?=
 =?us-ascii?Q?QwaMC2wrKe+rV6wyRcQIPHl4eWeImtlPUNx1A4coZ9KmhQtR28iBRjlIjDmN?=
 =?us-ascii?Q?UV0j5I71tN3q0erFAlZdT0wzEAA8dX7hTu9dn4CROtfPCK8CGGLpcvyadLuE?=
 =?us-ascii?Q?LW8H9d6dpKorK+z4b6IK2OUXgRsW+9/W+WX0BvUWd6pu9yLD2OpdQMWtzbfc?=
 =?us-ascii?Q?vR7aj7FLy3TzY4Zw0uNy189klLC491nGifZ8gGCt8dD6GgNosU+5ADaKvXCl?=
 =?us-ascii?Q?SHTN+1VsCwk2WM+loURcmROfpLs1REOA3wCtm/feKkPtY5vFy/H+Sxij7FNE?=
 =?us-ascii?Q?qlfQFVm8KL2fT7MMHaJNiec5x58R87ncaCXVkt7kAgdd1MXKF6lJSI5oeEmO?=
 =?us-ascii?Q?QnLbaTtIAIxjOP9CIZHK4oH+Qz8vT0hImiHZyf4d/Fg+3VqjF7/iieW4u3MP?=
 =?us-ascii?Q?wsXc1eGQddRVYsouyr18fnOOzJlCk5UjqngwySDLSeu0GApwjf3DGvHC1hRd?=
 =?us-ascii?Q?htLemV5W2eo4xreKtXYQOWrEfsv5Mb8xzIJzrfb2E1gPKTVNe0YZNQ8Qgj7a?=
 =?us-ascii?Q?UAHZpHoULCLn+WLi2c9a3rXK8fN4MdSj4uUWQLsqtxIeFLCpLVj6EaVSwuNZ?=
 =?us-ascii?Q?WbqHkHD7bXEZahJLyeXB/rde/vNppxJO6ySRwHD3FupiHPTDX24OBPr2Nn4p?=
 =?us-ascii?Q?JPkpjphF5Qp0Sd/x+/Ds+0biYTHsQMg/CSOQ4zipOAOoD11DFPLu6g7XaI/6?=
 =?us-ascii?Q?FS2qNA6Zw2UrjZrGVb+9vEbfFXAgemX4qYy8E2HM2GBb6IlbZABZNVhdeXia?=
 =?us-ascii?Q?+dnF0lxJuQ22CqIUCpDE6744UcyXrF57PHnHyGz7uAFXIEGWnb6rTZTSnz3C?=
 =?us-ascii?Q?/t6BYo9KzBq0xpzvHWZXntwthHJdFs6fwoq56Q+7229gIee05p6V7wnCoQjF?=
 =?us-ascii?Q?gD/XCG9c8E4Tni8z9p6V6iyvYJXUAMhHGEbcvi5vyBKSqswt9A6MGYM2M6dX?=
 =?us-ascii?Q?IKR3L+f4doT3dAZq5HxfLZPMKsdZzHzziPczdKp343BGGdTjMYFFwowY2CY7?=
 =?us-ascii?Q?bzo3VBx8Zttev0iKqwVNv4FXdqNGdPq0pfXvS+EVUyrB+l62YJSDLn1u0KnP?=
 =?us-ascii?Q?Ie8lWSZfTSUvIsQHhuGWYSMnE1S1MfM3fv9eX3X/u7Vp1iC5S3qTjjUYbQql?=
 =?us-ascii?Q?jV4cfnqpFYxa+rBXGFhMwXOCoKmcAA5LBqIdgh/cJW6sqm6yBiIMrPcL/nR+?=
 =?us-ascii?Q?eheXxmqxTX4mFLvgH3kabgnoA7yVYV6vjtulP6dyam6LB2D5WL+S1dOsEBiV?=
 =?us-ascii?Q?DVA8XvQDT2x5kasfWbiz4isclnrBKRWfg6lKrsC2cv61GiO5X+trArjZ1OCA?=
 =?us-ascii?Q?Sagl3a2xP8X6uMnRyuLBOyjdkBSk9bZdfnlf7TTAKzkczaRn3HhVkCUNaGRZ?=
 =?us-ascii?Q?ok2RUznCN9ksrEvy56GOalh4SFHVjI99xJ2SsenEXxEhgxE3RARyiSd+/1fw?=
 =?us-ascii?Q?snN8dbbyyIVFgRo5uxuct0YUzu0OtlduWOFwZQksaTDFGajyPf1yzWGvZ+DV?=
 =?us-ascii?Q?9fLTMfQZ/SPYvY6AA0ZI4whXPfuTWH0DoQAFmVYQZ1pVTj1yWGlpyBhG/Gk7?=
 =?us-ascii?Q?WD1ZJHbeAfy7GGxQKOjMUZrgz+pdu8kUN1G5/dLMpAyS9zHc?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c72659b8-0917-4b5d-5c55-08de52e12797
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8948.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 20:20:16.4580
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lEd3ZKerRs4CLS05g6RCUMARJul3tDv1F4XrG52c4t+eovn0K3BAvmRJTKIFauJVvOPkMfWhVNP+o7DgOyBR3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12319
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Jan 14, 2026 at 01:27:14AM +0900, Koichiro Den wrote:
> Introduce a new EPC feature bit (dynamic_inbound_mapping) that indicates
> whether an Endpoint Controller can update the inbound address
> translation for a BAR without requiring the EPF driver to clear/reset
> the BAR first.
>
> Endpoint Function drivers (e.g. vNTB) can use this information to decide
> whether it really is safe to call pci_epc_set_bar() multiple times to
> update inbound mappings for the BAR.
>
> Suggested-by: Niklas Cassel <cassel@kernel.org>
> Reviewed-by: Niklas Cassel <cassel@kernel.org>
> Signed-off-by: Koichiro Den <den@valinux.co.jp>
> ---
Reviewed-by: Frank Li <Frank.Li@nxp.com>
>  include/linux/pci-epc.h | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/include/linux/pci-epc.h b/include/linux/pci-epc.h
> index 4286bfdbfdfa..4c8516756c56 100644
> --- a/include/linux/pci-epc.h
> +++ b/include/linux/pci-epc.h
> @@ -223,6 +223,10 @@ struct pci_epc_bar_desc {
>  /**
>   * struct pci_epc_features - features supported by a EPC device per function
>   * @linkup_notifier: indicate if the EPC device can notify EPF driver on link up
> + * @dynamic_inbound_mapping: indicate if the EPC device supports updating
> + *                           inbound mappings for an already configured BAR
> + *                           (i.e. allow calling pci_epc_set_bar() again
> + *                           without first calling pci_epc_clear_bar())
>   * @msi_capable: indicate if the endpoint function has MSI capability
>   * @msix_capable: indicate if the endpoint function has MSI-X capability
>   * @intx_capable: indicate if the endpoint can raise INTx interrupts
> @@ -231,6 +235,7 @@ struct pci_epc_bar_desc {
>   */
>  struct pci_epc_features {
>  	unsigned int	linkup_notifier : 1;
> +	unsigned int	dynamic_inbound_mapping : 1;
>  	unsigned int	msi_capable : 1;
>  	unsigned int	msix_capable : 1;
>  	unsigned int	intx_capable : 1;
> --
> 2.51.0
>

