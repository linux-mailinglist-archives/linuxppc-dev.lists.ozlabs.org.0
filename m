Return-Path: <linuxppc-dev+bounces-17723-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KHclNlpIqGlOrwAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17723-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Mar 2026 15:57:30 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F802020DF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Mar 2026 15:57:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fQwkY3Zv7z3c1T;
	Thu, 05 Mar 2026 01:57:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c200::3" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772636245;
	cv=pass; b=Gc/PwBmhWnFh1pnYIkQGDluOkr2Y1e47a+vl0Ctu4NS+mNymcSfSaQyZxwYBrnSHcPeswejJGpZq4tKRNGuq7FjYp/qml8YD1DNjZEuP+tL3nN61XcoWg6SoZikxBBJHonbDQQHpz9EQDXI9XmERBcUXEZKh2C/GFMk6tzyA7zwXk/Q8tQEl1L7T1YQFanvl2VdSY6MJEEupXywx4qBL7RGJwU1+KheugLWkXH3yJB+ilTE9Rz3nzAQQ7L96e0FTNWtjwhPwndFH18D+JzTdurEb6Mva0eFITNavQCIPLGvfCrdFrF/2m1sLBilvTn/34cKbmcQRHUwfnoURv2KfYA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772636245; c=relaxed/relaxed;
	bh=9zbnzsKvry3cQSg9sPGefVepkKkEVkmPTXLh+ae2IWY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=V+fCT9h78oi+awVnfbffTz7BnVT2i214xuDFzSrFANpK8h44+HBoGh1WbhtSUaxjljDs3oViJ3oBIiN5k8vaCo0ym0WKZn1gCrLQ9wMvkznoFECVSVQKmdEmdaoaiffZy341WYqqksC6Jm7dQaI5ExrEE97VTKZIzgJRY30Qqnc4GSj59cK8+NZMACaEQ2rOWrjgeemnDGxvw4DxBd/NbTuAyx6N/adb4ahLIDc73pgHajDrA4SDhBB6DJMg81+szDkNeMMrTkCc864UTJeoFfa0RzjZVX1z+/ulamfAxmlPlslAIAp9TevhpKpUo/zZmrenKYZ5LkHOjNROCz6Z3w==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=XwnbZ7QT; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c200::3; helo=du2pr03cu002.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=XwnbZ7QT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c200::3; helo=du2pr03cu002.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazlp170110003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c200::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fQwkW5r0Wz3btg
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Mar 2026 01:57:23 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O6UXO1PhZPXZeK8ivh5+UEGBoT1B+sxXuqbV6l9uYfEILV6DzNU3sdqAHT4aMLNgeVHWCt7mMcFk0hjvBWn1Nl9/FJYpUY+eW0r22DRTgF00TCYKI4XOX3XXDeB8qrNK9dn+KC6GPHo2r5VX9BB9fKjzm2tscLt2lVY+IZlm/2XynBkKsPdO/SUETUF5e3M4zU+POQGMEgb3IliTmFLMjJ7EKpMzJdSpU5YteacZdS6Gswlx2P461NVUPUFk0EtteXyjYQB0cwMiiHv+dPxnXqIk7N+qMOwQYKnN/ZGmOmPh3LyNf5oHLw6q3MNPn/L6bP1203PQhujCHA66oig5vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9zbnzsKvry3cQSg9sPGefVepkKkEVkmPTXLh+ae2IWY=;
 b=HNEYJF7GPR9Q2P78wMSX3qe2JJmJXYYV4TgOrNwFw4keskSr4mW9iXqh0RTIp3+dq1XpshsKpfHtF/48YowJka2FaEEcrHY+MVdtUX/dD3H/jLS3uA4CNam2XDQQ3q0YnqG/+62XW6bMF0Z6Mvw9x2JU5eBHu0MWNfO8cpYADpGoPIoef1E8OddZL22mYTByi0hz6lApd4PXbk0erSZHS7wSSsfbij7noTc9rOBIr1SFQYbYYyfWJicw8mlyPlwlfFFAfQ83Tkx0LwGkUo3Q7HRDmtU1CvCOh4QEcge6t2zVgDZKCCf6NSrKWQko1wanNHyc0lwS9PAR1HOdb4/TvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9zbnzsKvry3cQSg9sPGefVepkKkEVkmPTXLh+ae2IWY=;
 b=XwnbZ7QTtkMN3o/96jM+z773OFtnCz2hWklgJwkjIwfP+jVjHN0UqVYIHrWAVVNxXOqb/U+j5hr31qgl8c4UMZnJFAZtAdsipJOE4AWlFYYbp27XmC8Fj40UbgDBYNVXDGjDYyfhSFIydU2ZvNtVyJlNvJjExLfRAsnBnplE9SBSvZKmou6hsKRZA8JZIoRUcGMnbU43FzJeATSdyKzBdvDpSd0U5ohhN4LBuAy9ZXwMocj+zKhHVlsjUiGf31Ypr8BGykGOJQ+Prng9Tq89H0CZxNpIFZK15xCjLLjnZtZFlOwGrZhV1+QdcQlkapHZyq8y6bzSdb3JhHcHY2Bk5Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PR3PR04MB7404.eurprd04.prod.outlook.com (2603:10a6:102:8f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 14:56:52 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9654.020; Wed, 4 Mar 2026
 14:56:52 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Vignesh Raghavendra <vigneshr@ti.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Minghuan Lian <minghuan.Lian@nxp.com>,
	Mingkai Hu <mingkai.hu@nxp.com>,
	Roy Zang <roy.zang@nxp.com>,
	Yue Wang <yue.wang@Amlogic.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jonathan Chocron <jonnyc@amazon.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Jesper Nilsson <jesper.nilsson@axis.com>,
	Paul Walmsley <pjw@kernel.org>,
	Greentime Hu <greentime.hu@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Chuanhua Lei <lchuanhua@maxlinear.com>,
	Srikanth Thokala <srikanth.thokala@intel.com>,
	Xiaowei Song <songxiaowei@hisilicon.com>,
	Binghui Wang <wangbinghui@hisilicon.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
	Niklas Cassel <cassel@kernel.org>,
	Hans Zhang <18255117159@163.com>,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Thippeswamy Havalige <thippeswamy.havalige@amd.com>,
	Sai Krishna Musham <sai.krishna.musham@amd.com>,
	Nagarjuna Kristam <nkristam@nvidia.com>,
	Vidya Sagar <vidyas@nvidia.com>,
	linux-omap@vger.kernel.org (open list:PCI DRIVER FOR TI DRA7XX/J721E),
	linux-pci@vger.kernel.org (open list:PCI DRIVER FOR TI DRA7XX/J721E),
	linux-arm-kernel@lists.infradead.org (moderated list:PCI DRIVER FOR TI DRA7XX/J721E),
	linux-kernel@vger.kernel.org (open list),
	linux-samsung-soc@vger.kernel.org (open list:PCI DRIVER FOR SAMSUNG EXYNOS),
	linuxppc-dev@lists.ozlabs.org (open list:PCI DRIVER FOR FREESCALE LAYERSCAPE),
	imx@lists.linux.dev (open list:PCI DRIVER FOR FREESCALE LAYERSCAPE),
	linux-amlogic@lists.infradead.org (open list:PCIE DRIVER FOR AMLOGIC MESON),
	linux-arm-kernel@axis.com (open list:PCIE DRIVER FOR AXIS ARTPEC),
	sophgo@lists.linux.dev (open list:SOPHGO DEVICETREES and DRIVERS),
	linux-tegra@vger.kernel.org (open list:TEGRA ARCHITECTURE SUPPORT),
	linux-riscv@lists.infradead.org (open list:SIFIVE DRIVERS:Keyword:fu[57]40)
Cc: Frank Li <frank.li@nxp.com>,
	Anand Moon <linux.amoon@gmail.com>
Subject: Re: [RFC v1 08/18] PCI: fu740: Allow asynchronous probing for background link training
Date: Wed,  4 Mar 2026 09:55:37 -0500
Message-ID: <20260304145540.3331304-3-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260304140329.7089-9-linux.amoon@gmail.com>
References: <20260304140329.7089-9-linux.amoon@gmail.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA9PR13CA0146.namprd13.prod.outlook.com
 (2603:10b6:806:27::31) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
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
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PR3PR04MB7404:EE_
X-MS-Office365-Filtering-Correlation-Id: dc9ca2d1-44e2-41e6-91e5-08de79fe4518
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|52116014|376014|7416014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	A0uSeeTwJuvvbKh36i3LoGlUoeTU6xTEhoou//AznbAegKhNk+S8a/EyCpZv7ykYbE4mS5CYre39Q03bttqXHpPdEjE/0CUvv/iOCvBs270lGmGRAf/FGpzye9tvLYkhbOY9HfQXq1PpayGJyOxcpI58Y52HXZgbaW/xmFPAbrcspxtz5UZKqjWBgjMk2bi1eaKXq30TKtZsBsAwfXpDB7uKu3cmZQP/Ys6neXO6U0hEajVdZk8ETcmeX2GHljRc15LSs4GphZBvZJcwc6cb905J0+G09RI4R1X77iltDH2sirXBdNNP6ZDskO20l4ijNvIudnYqm12l+EKK5mjQQbJbDxGFxqWUFMS90hpcaOmypi6EktBHnFyquGLUd594pZ4lYHlCebQMHABPKcw8lm1M2CPYJEyw8uDnOmElgioCGMdHDGZn0C3R0mNySCqofFsVY7X+hwRp7Tygpd8JBROnTwaOWdUt6c2y5gRdoqpwfRPeQ7+CZmwdy0M7JwEw53KZaf05kmRRB0vifqoMXunSUaxpHE3+08r3SfUYGbf0rTvk2BWo56Qzbofn4iK0gg96x8KkFOzakI2N6dLrcxMHBYBHbnvR2sjFe9LFMxLla+zyJJU7n7quJ7i0WSfJ7ImvvYUniRndKrjRZDC78ra/46uuxqwK4V8xZ+g0wS1yi9zkUzOVc/MIFhyDa1PGXNx/RTCmw555VumRg3qcd4Dgslr4xTpl6gAtrkdZbndtR/zjN22SHXLv85zID//PUOagkN4FXCQsWt8jsgF5i6GI7guMEHb28piXkNSKxrcrTW/hSvmLwl7W3V6N01fm
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(52116014)(376014)(7416014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zjpCgEmOqyXai+Z8pvLK6bwMme1/gJbrobUO+UTVfJvmEDq0Fik0VHWeB/gU?=
 =?us-ascii?Q?Ir8ZE/NNZXFDxnf+0di7ghlDcJJZ1lA/NaJvj0sx4RvV7MZbvC+7m4BdefzN?=
 =?us-ascii?Q?1vu5NNS2dYVtN3+HCDcosrc9vSnKjamhvbMbna8r1HaH1R2Rt1myhU78TLN1?=
 =?us-ascii?Q?ZYajnwUct9nFqvmL7dPcQFTtcfjWwAqaH/vZznsfflMovSWtkXqP8KFZv10M?=
 =?us-ascii?Q?TrKhJ7hUMSLlkptHXQgV0NXevjJyw72GFt3II23VUdwUUrx1//ivUixCl2Rh?=
 =?us-ascii?Q?D6xsq5RYPY8P5N+yQVkGbMOJ4g+FEjrEVOb5dYg3Xap02uenwu8FXNVmcE/r?=
 =?us-ascii?Q?I997PwD51I9pXbVBp3Bt7GjcJIKNHqXmjNBZjhDEWb0Kv9/zby4wTSjY4Sog?=
 =?us-ascii?Q?UVuIRZ+ojuDODiQQsFwwzqVIWuEc21U0cBwof07Hq/lMmHpezn5vEn96eXwv?=
 =?us-ascii?Q?maGhnK/9ZV6OCQqVfSggrWX7ixeJZAQrhu5sXettBLwFLwcbU5C6ohzoGnDs?=
 =?us-ascii?Q?9yASvACG7K/y+ruGFWoMANUUE0VgxkN/JfneJFcpyFMoSUFguF0QEr/hXa1H?=
 =?us-ascii?Q?ibeUEcdLhR2e12xRDS0mSPc1Be9jJNo8BrTTSA28AyJhbw2jdCJgp3lo88TS?=
 =?us-ascii?Q?G2jKkyUELXpskZjH0IYk7Qm3fVfi0pY+dKB1YfuQPbEz77S+tBjU4BY8r91R?=
 =?us-ascii?Q?JKcRHC5k0GlxyeMrRwKSkEp6v9I9OIAqbdRX6hYNa6ynYib42Hxl94U9WRdU?=
 =?us-ascii?Q?xm3sQaTKcPszfnqIjJOI64601wz4KzdE5NK9FUvbMjuSGfuRQ/gjN4cDDZg1?=
 =?us-ascii?Q?N5QqVbxhvHu2JPsB9jzcpz4SzCVLGqVYpGAT+VkxIv5vmmZ8h4358hDkifIt?=
 =?us-ascii?Q?zT14GMtfRsk1XSqq5M0mZx62P/LQUuWPosJqMOeoalt2qAmLeJQPY2CvIR9J?=
 =?us-ascii?Q?t3mV4DCP7AkYBdreZvvpcJSQsUcshCvQbhc5EPflTadKl/SBDb60Fxc9ZU3S?=
 =?us-ascii?Q?iUyGkEMrCzir7SMsaRFyQWmh9HFdy5TnBcluxfz7fODx6ZZBXlfqEI5eji99?=
 =?us-ascii?Q?dm5/MrAEnVOiEIqJhaoc7S/EcYolNDiyTvolC7X5pJsaE+75fG4JOCmrWyy6?=
 =?us-ascii?Q?hwJHxMQb4HXyxHtp53N49UKU0BZh1HZZV46XVSKORqEbwa12E2SjgOYTHJoA?=
 =?us-ascii?Q?8mUoTyv7qgQpnKV93QkU05kUqMLt3zn8BoIM6VqPfb1uv9JisAUZanS1JERg?=
 =?us-ascii?Q?GfD9tNxTlmoCnb4MEa+eCKHs6+lB/abQIXcOiuC7GSA4YLUW9t1f1JyX0QH/?=
 =?us-ascii?Q?dMN/D5uM8Gx1vcYJc/Eawu1A8QABI6Ts6PYEV+gd/1g7JuGNIYcIByGqcVG/?=
 =?us-ascii?Q?x9Y5Frq7hR5c+j+NIvDqqBK3292zWFKNqGiq5Fc1WrrzTx6WS+QKD5l13g9h?=
 =?us-ascii?Q?B8m7DWKdXdxyhPPmcTBWgFjQprqHNtmE3NHZO3sO52VgAeDjxeEMoGYePybT?=
 =?us-ascii?Q?bkGzvav/sUaVFWKzZd7xiEM4WLE6edU90jt2o3QFTBWyKDzh49m6NlHAnw2f?=
 =?us-ascii?Q?OcGdg7fH5MUc1CqMcUBq6nYIaqVQPXV5FABmxP7lubNLnvf7nT+zVCE1ZuML?=
 =?us-ascii?Q?32CrpYeuL+I9bOpGuDP0gQqOFot7ZJ/4JtKATyFgfMNNWN43I7u0I/ZA5g/l?=
 =?us-ascii?Q?aOzlWfJjSyfHPphbZh3JToOLn3vO/C1CYwNqtjVPCdgeV+/s?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc9ca2d1-44e2-41e6-91e5-08de79fe4518
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 14:56:52.4022
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z5y6CXu7lglSYwJ0M52NIxWZOpIAOuszzXn/JPHQGaBOTXsX8VZR1Yx7PtUC2C+jLi7etBSL/kAgLvfpPhTpHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7404
X-Spam-Status: No, score=0.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: F2F802020DF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-17723-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:vigneshr@ti.com,m:s-vadapalli@ti.com,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:mani@kernel.org,m:robh@kernel.org,m:bhelgaas@google.com,m:jingoohan1@gmail.com,m:krzk@kernel.org,m:alim.akhtar@samsung.com,m:minghuan.Lian@nxp.com,m:mingkai.hu@nxp.com,m:roy.zang@nxp.com,m:yue.wang@Amlogic.com,m:neil.armstrong@linaro.org,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:martin.blumenstingl@googlemail.com,m:jonnyc@amazon.com,m:thomas.petazzoni@bootlin.com,m:jesper.nilsson@axis.com,m:pjw@kernel.org,m:greentime.hu@sifive.com,m:samuel.holland@sifive.com,m:lchuanhua@maxlinear.com,m:srikanth.thokala@intel.com,m:songxiaowei@hisilicon.com,m:wangbinghui@hisilicon.com,m:unicorn_wang@outlook.com,m:inochiama@gmail.com,m:thierry.reding@gmail.com,m:jonathanh@nvidia.com,m:hayashi.kunihiko@socionext.com,m:mhiramat@kernel.org,m:nobuhiro.iwamatsu.x90@mail.toshiba,m:cassel@kernel.org,m:18255117159@163.com,m:jirislaby@kernel.org,m:tglx@kernel.org,m:thippeswamy.havalige@amd.co
 m,m:sai.krishna.musham@amd.com,m:nkristam@nvidia.com,m:vidyas@nvidia.com,m:linux-omap@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-samsung-soc@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:imx@lists.linux.dev,m:linux-amlogic@lists.infradead.org,m:linux-arm-kernel@axis.com,m:sophgo@lists.linux.dev,m:linux-tegra@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:frank.li@nxp.com,m:linux.amoon@gmail.com,m:martinblumenstingl@gmail.com,m:thierryreding@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[ti.com,kernel.org,google.com,gmail.com,samsung.com,nxp.com,Amlogic.com,linaro.org,baylibre.com,googlemail.com,amazon.com,bootlin.com,axis.com,sifive.com,maxlinear.com,intel.com,hisilicon.com,outlook.com,nvidia.com,socionext.com,mail.toshiba,163.com,amd.com,vger.kernel.org,lists.infradead.org,lists.ozlabs.org,lists.linux.dev];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER(0.00)[Frank.Li@nxp.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[nxp.com,gmail.com];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@nxp.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[57];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:dkim,nxp.com:email,nxp.com:mid,lists.ozlabs.org:rdns,lists.ozlabs.org:helo]
X-Rspamd-Action: no action

From: Frank Li (AI-BOT) <frank.li@nxp.com>

Commit message has a typo:

> Fix the identation of the callback functions.

Should be "indentation" (two 'n's).

The code changes look good otherwise. The indentation fix aligns with kernel
style (8-char tabs), and adding PROBE_PREFER_ASYNCHRONOUS is a straightforward
addition that matches the stated intent.

AI bot review and may be useless.

