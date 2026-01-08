Return-Path: <linuxppc-dev+bounces-15435-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8F3D06292
	for <lists+linuxppc-dev@lfdr.de>; Thu, 08 Jan 2026 21:47:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dnH5K6gsrz2yTH;
	Fri, 09 Jan 2026 07:47:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=40.107.74.135 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767893122;
	cv=pass; b=Y/LHQ9TxF0jjnq1k7nVKUPE6wKv0RPcSc7xpEMqEr7xqFAE3b3jdrnCneEhSsSA+ucsxn2eIYn1IrTPZLw17moXE+RdPGB42M9MoYQ7r5oOT++8qCGGgdVnuTXEgJWi/Sligsaob5c1tVVVBFJL7Zhv4NWP4C18nlXEDCixCzTHxZRgqliFBMvZnkNX2tmT7n8u6Z9G9G+aWkkSlGyeO76COugplEVN/N4p7nYjJWMGwQgrpTkMAG6usgxizkRk5fNVZC65qsJ0BrOEx6omr2NuXN+VS+YiTMKVO+49ysGqxxOWmaIwDAgiAANIXtuh34efyr2LVASd7W2gKsJuyKg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767893122; c=relaxed/relaxed;
	bh=cRXIqIwsuJBMeivlP/0+QY+PYXeZgOGtLBAtu2rTABE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kgiiPH8ay+7lSueM/4+UyxwzU2yiScOwVghfYpccUE/aJn1+OH9Z1a5gY383yUZwxv3G0/TEH7QPNC8pC3EpvOh/khj8vPaWWIAOeUD2b5Xfj1oUFlEp2BppOoRAiUk5IVMfg16AQKWQveL6fFr4hR9TazMD/z8TzGkJ9Mn+cLL6MGGbxFd58dYnRMzlq9knEddC8JEUOdfhj/0KPQuO4eiQ2ff3b6bfZ4jyjbI8/FhaGtqFVfDwk4ZZdLJ1wCQjIpQjhKipDp6oMRtGwLUZc8NJEoCpA0zCB89VjkRYY7I4b+enYZcrkaTE7UltWMdeJyuBsz+XaGBxeS6vWXwF/w==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; dkim=pass (1024-bit key; unprotected) header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=S9vGfMMV; dkim-atps=neutral; spf=pass (client-ip=40.107.74.135; helo=os0p286cu010.outbound.protection.outlook.com; envelope-from=den@valinux.co.jp; receiver=lists.ozlabs.org) smtp.mailfrom=valinux.co.jp
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=S9vGfMMV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=valinux.co.jp (client-ip=40.107.74.135; helo=os0p286cu010.outbound.protection.outlook.com; envelope-from=den@valinux.co.jp; receiver=lists.ozlabs.org)
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11021135.outbound.protection.outlook.com [40.107.74.135])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dnBcf1Q43z2xGF
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Jan 2026 04:25:22 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pqvbJhJ4ku9CHMjhgEMbwz150gezhZ9VIrNhOecZ0jrlD4LHJqxb5hW728a01ujdFamXAMdB8SJCHP9cIY91i/TPM4ZplhqPmYy448D41iAaUUeM0QvSCpeincNuD8fnuV+LGFBuB0uEPSOG6XUbWI9qd4xx9V5G2VwfB/AC76DSBuQ/71DPmX61/g+reWwBcHMg1NolB1yTAxLCM8fCy98jHNIeXoisoVv6zyG2zD5XKbLCaXAhWhUcgr7hN9TnlIyLQt3d5ikGTdVMEi949J/5DRqgtCDvHmolH5k6WZSFqiNPEZTaHEgzHEy9lC2ad5CPZ3dYNSV3WxPmJqpBxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cRXIqIwsuJBMeivlP/0+QY+PYXeZgOGtLBAtu2rTABE=;
 b=gl+vQB9NmercpNDTCPxnRsuVXmwTy7C3v1YmjnWW5HMFf21E26YKCslebcuzLm4sagkZDXbXnRUNCP4tL2r3LUE4sv2qdCJBoildxlXdjCu+hE5uE5rbTNXl7tQYCztIdDhjI8tE0/w7uV1MhNeoFHgY7fc4OA38uWi6EI30mE5rAM46TEL2o71jD2zne1/IP8/7nXXkmWai4R15nNwbhf3/3FYkuCjXWyMowkVY8BO0RFVF59piImK5jtQLrKXYgq+27MkWvqDX7Q7MX7f2+NiS5wNWCxuB0PVMqjP82f4wNbuUfEIx7lUMAzQ60BfWcQcC1iGp04f//XFK1ShQkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cRXIqIwsuJBMeivlP/0+QY+PYXeZgOGtLBAtu2rTABE=;
 b=S9vGfMMVk6Y+6vtOb9/jUgpKeCLpDmpIcYU1M/bvLlSOvK0sLmtUPC/bAMJLhMaGNpxQS3g0pIOcU4OTMN3CIRJUTRmEQWa6pAXdTdN51993VKRxXTs81BnAFN+vjgIOavSdHaqinxpMbZAQqeVasr4dU91zhYF3jwct/w+17QI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYRP286MB5284.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:11a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Thu, 8 Jan
 2026 17:24:07 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%5]) with mapi id 15.20.9499.002; Thu, 8 Jan 2026
 17:24:07 +0000
From: Koichiro Den <den@valinux.co.jp>
To: jingoohan1@gmail.com,
	mani@kernel.org,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	robh@kernel.org,
	bhelgaas@google.com,
	cassel@kernel.org
Cc: vigneshr@ti.com,
	s-vadapalli@ti.com,
	hongxing.zhu@nxp.com,
	l.stach@pengutronix.de,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	minghuan.Lian@nxp.com,
	mingkai.hu@nxp.com,
	roy.zang@nxp.com,
	jesper.nilsson@axis.com,
	heiko@sntech.de,
	srikanth.thokala@intel.com,
	marek.vasut+renesas@gmail.com,
	yoshihiro.shimoda.uh@renesas.com,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	christian.bruel@foss.st.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	thierry.reding@gmail.com,
	jonathanh@nvidia.com,
	hayashi.kunihiko@socionext.com,
	mhiramat@kernel.org,
	kishon@kernel.org,
	jirislaby@kernel.org,
	rongqianfeng@vivo.com,
	18255117159@163.com,
	shawn.lin@rock-chips.com,
	nicolas.frattaroli@collabora.com,
	linux.amoon@gmail.com,
	vidyas@nvidia.com,
	Frank.Li@nxp.com,
	linux-omap@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@axis.com,
	linux-rockchip@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-tegra@vger.kernel.org
Subject: [PATCH v5 1/3] PCI: endpoint: Add BAR subrange mapping support
Date: Fri,  9 Jan 2026 02:24:01 +0900
Message-ID: <20260108172403.2629671-2-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260108172403.2629671-1-den@valinux.co.jp>
References: <20260108172403.2629671-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4PR01CA0110.jpnprd01.prod.outlook.com
 (2603:1096:405:378::8) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
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
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYRP286MB5284:EE_
X-MS-Office365-Filtering-Correlation-Id: 42e803bb-2bef-4a65-5115-08de4edaba80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GUkVRJmB8impqHjiEj6bx+TSrIJVyTBNOyMsnnhE3DQwcNGgXDLzX7UUdGVV?=
 =?us-ascii?Q?UVhFfuisn8DVPiwEtWhpaFZv4ZJPl5NeEzrmRJz3u7nfhvZ45Yip8paS+J/b?=
 =?us-ascii?Q?otBvqd1IH2nxyddclTDTOKG0Tv6AITWZaaCdZR+SXXQNNJMSdrUNYkeAJTJh?=
 =?us-ascii?Q?Y3chUIzAKOGuA0EgRyOjuX6tdzMAS7AQ/awLn7gD/hTP4JqotpbJIZvhe2A2?=
 =?us-ascii?Q?+mKUdo2+sEqHx05dHcB8gc+Gt9xZiy0INyo51FkA3NJOYT3D4/kpo7RFcNj1?=
 =?us-ascii?Q?JaMjMz4FSXr95XkX/c85rxzmkg4XKTtYtP9YwsOanjl8QPfET3FB6A7RVfQM?=
 =?us-ascii?Q?IkbG2CHXSvMUhIITdMkIw/zC/IWdjNdUkTEv6pIC4fTs64DzUjgWrKS7A2tT?=
 =?us-ascii?Q?UYHkqNFa+M4du4bTJGYXAV4b2UDBG5Cs74UQUtGwF/AoHkaDYAfJHY2lrQks?=
 =?us-ascii?Q?UUJmvgEIbFrxCEe4vvVoEL8Emgeie3bHcypgnJ9zUM2U0DrHiQtK/BTw8d/D?=
 =?us-ascii?Q?9UeyjaYOR7BpMnkot9mhMCJNO7hywTI4IhJpgKHPkJKjiNkBA8ZBnCVGngNP?=
 =?us-ascii?Q?oKSvtFZ9bjsqvS2ILkI1Qk1nQNAhg0S1WvV2GC7Bk7p9ZVWc59nDyO4EjA8j?=
 =?us-ascii?Q?Sk60sKKsQStRdJftkLVyPMoF9mc3/nIy4xCVmcs8UswCyy6giLlbPlr3eaZB?=
 =?us-ascii?Q?iZcGGVvuwSpvo3D05Jt1Ul3fH8hPoqaul6VdIH0dwEgEQ7o99B0jqMZLRowf?=
 =?us-ascii?Q?s7CmU5QBiVbn8ok67y2K3Y0RKunWQH7VsMGnqwwlqNVEOLZvJj5srSLUbdsd?=
 =?us-ascii?Q?GLVh/wwSgyAFQPPiWyVs5XmsluGTC481Z0qOriiTOGBElS4uhvhdnd7H1Spj?=
 =?us-ascii?Q?erC48JASFnqaYt5MT80345Wj+D6xsCMcZDiGii12vjvGOxHDQYj214oPqETh?=
 =?us-ascii?Q?GfBqU0MPQ16/rzwRfr6LTerL2vUHG7TuJF/wQeZqaUM8YPHW2BgG/FWzI+2R?=
 =?us-ascii?Q?5jFLC88wCBYlS5HibRrpF385L7PPMYlu1qeCgCHAb4jtMTgPd5rzLpeW1TmF?=
 =?us-ascii?Q?xhT6Q7Ly+rNybIuRgZB8YkGtgU5hp+dy+R2oyY6b0rlGdoJwQEn+bpL5ItWu?=
 =?us-ascii?Q?tO8JGUDEpHZ1jN2LtUQO4MyRMJdR/jhzezK+0AUQkrS+9BzCvZb7OwwsH+7c?=
 =?us-ascii?Q?Sggj5SJRQqmGt2uJC1oCHBOM43boDTg7mTi5W5Vbe2Xln66F6Lh6r+p/6ZZc?=
 =?us-ascii?Q?Wjy8F00YxJ63oLtCm3LG7hn4Xd3bocwsk48MnEnhY0317/rZzPhkcsIvck2f?=
 =?us-ascii?Q?fvroLxnt7EXgsWSYrIyVkPz2pqRy5N3Nc8tgBBhGIGIUuZ4aB0bbELwLHcbM?=
 =?us-ascii?Q?zcKCwVXHz8RftMLDWBr9sZysMfl7heLnOliLUlLtPgZ5JDJtqIJ9M4tG9zfu?=
 =?us-ascii?Q?9b8YI7ydGq2lKv6DeBBkwc5kBx1jDaYB?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(7416014)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4s+KmB/qI1X15sfbmrFOHvTBEmVeSCM+WNDcgW5ARUbbdKrT2AhpIIG84Zpf?=
 =?us-ascii?Q?RUVdI/JrrrLZrd2kgfnf++InCNto+z2czxVmufip6dpLIva3Govni6cumIQC?=
 =?us-ascii?Q?/Rgfce2GW6bObswE6Nd9QiefcSImv2ODnnkldTf9+mWZPz19wTOOD89F6Jrh?=
 =?us-ascii?Q?dQcwOd6BKdiJPpXQElyIdN6ggdrw/e+Calnt1nu43WIB5CMvUcaqHiygUW1g?=
 =?us-ascii?Q?EKxgEKvoiCYGGPFmZ6IQsECP4pI7c5S8XbZZJgTVrgk/dBB57LlFAMdzHTDP?=
 =?us-ascii?Q?Kkyj+avzwtjm3lnrxWcyVlRUzn3iATxfmeQE506T8tuaVYmPXBCi9+EOKsU3?=
 =?us-ascii?Q?2Ygco9U8YguO3ZQbuMK7MfjmhkBqKNiLZ1sqqy49dM2/oiC/B0QM3WjGZG2Q?=
 =?us-ascii?Q?+8m66B0bsnepmJIBlb7thFVGSTlU8c4oSAaVzp9UZT2q5m4t1FJ1qbEIld/A?=
 =?us-ascii?Q?x2+/KT4OiGg8zja7D71LKIEZcEvqI0KMbKAaFCT5Lj/zB38CVRpPpDmmVvT4?=
 =?us-ascii?Q?epNG78hlS6kms/OFCfSsw5/CvNX0LREii7kqjtEBLAOOpPNvtQZUfC4pTlj4?=
 =?us-ascii?Q?6/r5mSBURpLyA7iJOyu4K1ooo2Zjb2s8G+4kr59vWg73Muiii4M9DQmHlicv?=
 =?us-ascii?Q?VG8WlQaDPkrn0Gp1/34hovO7kT++3UCDUVeVHPMSo6CDybNd0HwayNqnzGDm?=
 =?us-ascii?Q?EtZHbJ9hnXuKrJpjHPixBnrEr56a+NdAna2zs5YzAsL3hXCZT/256iM9fhSz?=
 =?us-ascii?Q?M0WYJc4LZIu3TdUnMBneUvDbi9t+4IRH4z/ouJNY1dp0lGEyedTkVN3hZUCA?=
 =?us-ascii?Q?jKAEKhrLiHZGLCMhAP1NrIsqvA9Q7zCFJWlppMuvieAM6lB3TggBV5rP6ZTH?=
 =?us-ascii?Q?5FRPxxJlp3NV1Nv1rSMHkrcKGFe3jIp494RHfClTAqeS/j6rPd51W+hqSeUO?=
 =?us-ascii?Q?2vVlTGi3OMSemBnVwnvxIXsCj+lwDiMJ6MigTLLRpTUpVqI8aflAEA5BaHkW?=
 =?us-ascii?Q?ZlvUTAeNcTJ2iMo2JYCE2yUxm7DhJDtlzxi/9Zp8ex8E0ryVCdNEyZObV1WR?=
 =?us-ascii?Q?l7kG2GuWlPkjXq4dNhl1OhI6/saeOXe53NeJ6QE31IMRxGrko1vU35OeozHk?=
 =?us-ascii?Q?QrINHI+KuHMepAPJz1qHvbewcw3hGHwTuZ/xuXK2sZ8jAPOMwzST1HYaAGPJ?=
 =?us-ascii?Q?wwvu14LWDgG5njVIutnRxsHn4F+i30E9RL/tTAAkuwYY5AiO8gVRpixVP1pw?=
 =?us-ascii?Q?87SLkbU8gbNpkCu0Qre42hndNR8CPK/97es6KLMrqasG+w8eK/l3e4oBM0/u?=
 =?us-ascii?Q?g+eiKgdDvUA6yZRMSKzPa6l2SSe7Vf4Tl385nIm+260wOagFtX0TJ+GTz21P?=
 =?us-ascii?Q?FPpW4ZWwaJdOKBSDmcA2ymLh40iDPNVMMH8DCKWV+FyMnHwS4rC45l0VwNFn?=
 =?us-ascii?Q?hpT0A7jkRFwyWmbAhPcmU80gGvA2ociWA6cpbX3aJ8c+7VQkfJns3zGjJi68?=
 =?us-ascii?Q?BWcG+L+vLn91XkzFHVUEVAd6wC4lVLluiJFOPdaUenaJZsWB8KSiP4oYlIUW?=
 =?us-ascii?Q?0tbCQtYX0t/5ZrEd9awTGfT3umJ2EG3q3dEhi0QlZBbDJay7RWIhmSO+hv+5?=
 =?us-ascii?Q?fQXhdRUOoSHMsaPG5NCPQ94TitjR3iYlqzVqFUveSxp1DbE5R6iOfppDDe+n?=
 =?us-ascii?Q?Fvg6aKLBqwFb9WlvKGf39DutZsmrZnl+3u+In3Dnha/oCah6x7V4nkibirUb?=
 =?us-ascii?Q?Pzg/c9qB2IAOl6YZBPfRL8Pk4FrN76rYi4MO8M1d/HiirbM/jEe2?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 42e803bb-2bef-4a65-5115-08de4edaba80
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 17:24:07.2674
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7zoPQ8v+tbWQ/OwsEH91/mV7gTMWl8Pf1RSSDRs11j5Z9pjD94wbxp9DxNXXFenkk86eiAUTyUNLFa7JgAHUUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRP286MB5284
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Extend the PCI endpoint core to support mapping subranges within a BAR.
Introduce a new 'submap' field and a 'use_submap' flag in struct
pci_epf_bar so an endpoint function driver can request inbound mappings
that fully cover the BAR.

Add a subrange_mapping feature bit to struct pci_epc_features so EPC
drivers can explicitly advertise support. Make pci_epc_set_bar() reject
use_submap requests (-EINVAL) when the EPC does not advertise
subrange_mapping, to avoid silently accepting a configuration that the
controller cannot implement.

The submap array describes the complete BAR layout (no overlaps and no
gaps are allowed to avoid exposing untranslated address ranges). This
provides the generic infrastructure needed to map multiple logical
regions into a single BAR at different offsets, without assuming a
controller-specific inbound address translation mechanism. Also, the
array must be sorted in ascending order by offset.

Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
 drivers/pci/endpoint/pci-epc-core.c |  3 +++
 include/linux/pci-epc.h             |  3 +++
 include/linux/pci-epf.h             | 31 +++++++++++++++++++++++++++++
 3 files changed, 37 insertions(+)

diff --git a/drivers/pci/endpoint/pci-epc-core.c b/drivers/pci/endpoint/pci-epc-core.c
index ca7f19cc973a..8d809a2c3ce9 100644
--- a/drivers/pci/endpoint/pci-epc-core.c
+++ b/drivers/pci/endpoint/pci-epc-core.c
@@ -596,6 +596,9 @@ int pci_epc_set_bar(struct pci_epc *epc, u8 func_no, u8 vfunc_no,
 	if (!epc_features)
 		return -EINVAL;
 
+	if (epf_bar->use_submap && !epc_features->subrange_mapping)
+		return -EINVAL;
+
 	if (epc_features->bar[bar].type == BAR_RESIZABLE &&
 	    (epf_bar->size < SZ_1M || (u64)epf_bar->size > (SZ_128G * 1024)))
 		return -EINVAL;
diff --git a/include/linux/pci-epc.h b/include/linux/pci-epc.h
index 4286bfdbfdfa..898a29e7d6f7 100644
--- a/include/linux/pci-epc.h
+++ b/include/linux/pci-epc.h
@@ -223,6 +223,8 @@ struct pci_epc_bar_desc {
 /**
  * struct pci_epc_features - features supported by a EPC device per function
  * @linkup_notifier: indicate if the EPC device can notify EPF driver on link up
+ * @subrange_mapping: indicate if the EPC device can map inbound subranges for a
+ *                    BAR
  * @msi_capable: indicate if the endpoint function has MSI capability
  * @msix_capable: indicate if the endpoint function has MSI-X capability
  * @intx_capable: indicate if the endpoint can raise INTx interrupts
@@ -231,6 +233,7 @@ struct pci_epc_bar_desc {
  */
 struct pci_epc_features {
 	unsigned int	linkup_notifier : 1;
+	unsigned int	subrange_mapping : 1;
 	unsigned int	msi_capable : 1;
 	unsigned int	msix_capable : 1;
 	unsigned int	intx_capable : 1;
diff --git a/include/linux/pci-epf.h b/include/linux/pci-epf.h
index 48f68c4dcfa5..91f2e3489cda 100644
--- a/include/linux/pci-epf.h
+++ b/include/linux/pci-epf.h
@@ -110,6 +110,28 @@ struct pci_epf_driver {
 
 #define to_pci_epf_driver(drv) container_of_const((drv), struct pci_epf_driver, driver)
 
+/**
+ * struct pci_epf_bar_submap - BAR subrange for inbound mapping
+ * @phys_addr: target physical/DMA address for this subrange
+ * @size: the size of the subrange to be mapped
+ * @offset: byte offset within the BAR base
+ *
+ * When pci_epf_bar.use_submap is set, pci_epf_bar.submap describes the
+ * complete BAR layout. This allows an EPC driver to program multiple
+ * inbound translation windows for a single BAR when supported by the
+ * controller.
+ *
+ * Note that the subranges:
+ * - must be non-overlapping
+ * - must exactly cover the BAR (i.e. no holes)
+ * - must be sorted (in ascending order by offset)
+ */
+struct pci_epf_bar_submap {
+	dma_addr_t	phys_addr;
+	size_t		size;
+	size_t		offset;
+};
+
 /**
  * struct pci_epf_bar - represents the BAR of EPF device
  * @phys_addr: physical address that should be mapped to the BAR
@@ -119,6 +141,10 @@ struct pci_epf_driver {
  *            requirement
  * @barno: BAR number
  * @flags: flags that are set for the BAR
+ * @use_submap: set true to request subrange mappings within this BAR
+ * @num_submap: number of entries in @submap
+ * @submap: array of subrange descriptors allocated by the caller. See
+ *          struct pci_epf_bar_submap for the restrictions in detail.
  */
 struct pci_epf_bar {
 	dma_addr_t	phys_addr;
@@ -127,6 +153,11 @@ struct pci_epf_bar {
 	size_t		mem_size;
 	enum pci_barno	barno;
 	int		flags;
+
+	/* Optional sub-range mapping */
+	bool		use_submap;
+	unsigned int	num_submap;
+	struct pci_epf_bar_submap	*submap;
 };
 
 /**
-- 
2.51.0


