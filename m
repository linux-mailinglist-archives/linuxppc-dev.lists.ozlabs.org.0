Return-Path: <linuxppc-dev+bounces-16282-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sGoHLnPcdGks+gAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16282-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Jan 2026 15:51:31 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4FA7DE8B
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Jan 2026 15:51:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dyyQv2wpvz3bf4;
	Sun, 25 Jan 2026 01:50:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c407::1" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769266247;
	cv=pass; b=EwR3/7M7qsnz18Q7h6dUNV1zHr380S4xHNeklcqrSkBi0hxMLYo9PUoYuSjRz+2X5xHV+VIPf533ALhQM5mVwPO24jP1uZ9In1YVG77BE8MAsl6Ch0qH2ByNqeJmdleNrVkQnCYDlbJtmNuNuqDs+ktBSP3MCO5+VPXKfZGh0CmgqG571fdmkNTTuhiG1cDrHi3c6IrddqsywlpXav5os2TT815J1PpUGIxxC1UlOPXQH9jHw5k7hLsgQAPlgfVagMa/ncgzHtxbGb7glRMnkZu6ZeBufAkGDmxFcgnnoev4+4zwxqU6uqbYOgtsxQYBuQsnrVWvdEjMa1g9czl8Hw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769266247; c=relaxed/relaxed;
	bh=uqv5b0rVdZWl6jWcBfaeDRjqb8MGukLgkiwYCtOwdTg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SGkTCoHESsJ1B0SBFFFu/xNezIQHGAaemPIIxFCYFQ+uZCQig13LlYSGdvJlzKZLQzMEijeNY0GcF2DitPkHibr4GzExcVYaJRm6ltun/x5R58ynwlH00eCKFzyjgqfQNk2D0txtP00kDXqYeni/7oTTIyLtkSLETe8zhZ6kCgdzPRfNkntHkXcLcIh3+MMD2sn9TYVGlgpY538SXhFTOhWaZK9u2vXdw2uv5PVy7nzitGwaV+vZKLoJntPNUNWL6N7PtEwc7HKjJUdj6pHU1b8FCMU1ZIrzpiHQYD2GvvQ9+XslQoMS3+In5UGYwGQNhjuHL3twYxiawf1r8xTc4Q==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; dkim=pass (1024-bit key; unprotected) header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=r19aWuLI; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c407::1; helo=os0p286cu010.outbound.protection.outlook.com; envelope-from=den@valinux.co.jp; receiver=lists.ozlabs.org) smtp.mailfrom=valinux.co.jp
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=r19aWuLI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=valinux.co.jp (client-ip=2a01:111:f403:c407::1; helo=os0p286cu010.outbound.protection.outlook.com; envelope-from=den@valinux.co.jp; receiver=lists.ozlabs.org)
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazlp170110001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c407::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dyyQt2r9Kz3cCM
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 25 Jan 2026 01:50:46 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KsN8TxlnU69cD/aqhHAeQye35/ZXLhael4e5Ep78TyGFKx13HhEX0nh8e4xAPr0xfO0jOjReqpDsk8H35bRcmL3KJx3cxaO1CWZsMNZYHtx9CwgAFiJujLbcE8f1V9+sm+TcWo9zCNtuansu8TDM0uFOd7hZHZzXyut8nLXD56x1zI2DvjK9RxciPHfzhangtEdzuN5rnokntqiC+egYuHV8hG0uihGkYd9Olx/1cEVXoa7Jw6wSLILzefIrUuSnVfr2ClH1ITF63UZLOUEWlaewX1b9rh/nzAWS+zl+z2o5NATyTKdE/92gRw53BT0TBN2gZ6r81GuNg5i4J+43Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uqv5b0rVdZWl6jWcBfaeDRjqb8MGukLgkiwYCtOwdTg=;
 b=DjLGqhwwgRcRfqNaDbvSymLnt8f1mBgYFUCQ+P9lAfgV0O/5Pt4y3W5Irn7rH1TNR1/DEDBGbOc1OOXpTWRhbw6sesv3OhGZ+Rij2Fv5IOwPoDaMF8TG5pNxXvfKtKbw4LyHzinzNtvuWC2FLr6xgBpJDk8Kz3Z1J6HCFthCwaJ0SVGg2p5bDkyaEDcFCxy0/Y/4AgHuvr8fbe2sC6QT9joyLrdkJSyYepUiawKuR9SU8s5uHti6pSrrM1w78NbbCR3jnjWgkkCSnmURD62g5vXtyNrWvTkHQyIbPAY26h1oWgukd3TULw1jruX9y/I7w7JDBRpxdRAkfVAbLDNSNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uqv5b0rVdZWl6jWcBfaeDRjqb8MGukLgkiwYCtOwdTg=;
 b=r19aWuLIzV/tn7R3YG2/357ivXX0mFbenCWDi3j88ckgStKVpelWcZfpydlg+RGgY+vnJjhD+XIQluTgeTdubQtWRSD9NNdrYo6tO8wS4/IFqXlhpnvTjoLgn7OiqCai+iNDKsWpbPUrawp29mIhFut40Jkn1N+0U+ijKGuXwCo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYYP286MB4692.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:19c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Sat, 24 Jan
 2026 14:50:23 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%5]) with mapi id 15.20.9542.010; Sat, 24 Jan 2026
 14:50:23 +0000
From: Koichiro Den <den@valinux.co.jp>
To: jingoohan1@gmail.com,
	mani@kernel.org,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	robh@kernel.org,
	bhelgaas@google.com,
	cassel@kernel.org,
	Frank.Li@nxp.com
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
	shuah@kernel.org,
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
	linux-tegra@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v10 8/8] selftests: pci_endpoint: Add BAR subrange mapping test case
Date: Sat, 24 Jan 2026 23:50:12 +0900
Message-ID: <20260124145012.2794108-9-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260124145012.2794108-1-den@valinux.co.jp>
References: <20260124145012.2794108-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P286CA0025.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:2b0::7) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
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
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYYP286MB4692:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e4416be-1f8d-4d82-b0f2-08de5b57e710
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|10070799003|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?D/9mAJI4CnQC5Gq25UmNk5YJBIodjoH9QEpSGpABl159m2FfHi+2aE8mdp11?=
 =?us-ascii?Q?hiqMA1Z8MkBq6VH5QkcBbd3+B0s0UgUkY9qM4P8cwEeZyJHabTV0XLia4/EY?=
 =?us-ascii?Q?ORR4u06IEX1Nom298JTVL+zzn5VjdoZQgokH3UGGED6+LmPTCkSuf+NTEHXg?=
 =?us-ascii?Q?VTKKyt1t1roU93HfLsCQ9pbRaNvDum4ppD3S/s4qcXnU3nz7ugs90lcNdyrU?=
 =?us-ascii?Q?S0JjRvq7wq6G6PBuVUg+8Xi0oiStwK1DciGIdiNZO9TD2+Oe0zM/jxEl/nxH?=
 =?us-ascii?Q?gZMhlBc9NV1mxH9Cb/+2T7QQFyGNaK22W6sFT+TUezXrj5xzohH08tHO1Zpt?=
 =?us-ascii?Q?Iyw9RG9QtjzowCc9+xzUx85LcjWz1e6RYcb3iKdkgd/91ywDigkyP9b4O98/?=
 =?us-ascii?Q?1A03F7sB3JZ/yIuwtWOvZZLKlml4VXsc3mHXFv1z7unckXxUQ29vGjmLIOUO?=
 =?us-ascii?Q?5V0meYTiX/sDe7KqFRxPa9G6qhBzAETj+5H2hkgDI4/uaqnv6smw9djoyXei?=
 =?us-ascii?Q?bfkcj/yHJT/YRRFqGm7E6UN9wUOfa8ehOAkC+7voihI3c0GQ92YTT8ifByUa?=
 =?us-ascii?Q?Vkx+P4Gafa6MyCxnJybvj0NI7A1CNAeVafLtSTs4nYIdTQ7JFxs0OKlQmczj?=
 =?us-ascii?Q?Kb9lfs/aoXnluhequ/iqKhc8ubxxsMd1VHEz0QaElEKPni+rRO+654LEOl7P?=
 =?us-ascii?Q?7C2MGQJyAdF8jaKPq58oCjdIn8tfK83xGYo2VrXWrvCRQ/xtGcP3EnHDbNLS?=
 =?us-ascii?Q?+rGsveKBuO4hL4sp0BwQjOEx8AOBu0McNuPAx7rKT7kOOcFzFari9ZMs6M0h?=
 =?us-ascii?Q?7dzl/KQ1J5tFKD6fD1j22fyeKYy7rBikOfiON65B4Yq5k9fQuYJIF1guOwKd?=
 =?us-ascii?Q?kc3FQcQ9wIve0vhANTxIPeW2mIa/Jktj2ZZuu8/OoDaumdR453JqHQyOUZ0r?=
 =?us-ascii?Q?3JOb+tD+HZ6/oTDqSvdT5QLYcqG1seo16a1ZP9UY4V7ocjUWYtf8H1pJVykr?=
 =?us-ascii?Q?3pENXTuLeH5hwvFXos8O5qKqY8ppKCwMSlAOuQasABFswtZXz2hDVuqf3TIY?=
 =?us-ascii?Q?eGYJB5CRvan22uTXjeIc+aoCfjtXTYbCPnUPGGEtP7JRVJdJ1d28zqUeKpZ2?=
 =?us-ascii?Q?F1joYa5ScI7cmC1Vul4AXDH+oX0wnLEN/O67ZRpQwVOWfK4Bczo9+Rwc45Qq?=
 =?us-ascii?Q?KIyNY5JCIgh69cqbLVREsF0hdcfS8cNLtsOXb4zF6oIQICG3xSh+0/0tMtM2?=
 =?us-ascii?Q?yaENM06P/sgvfI25G4r91QhHg8iW9k9FeMuSTKOPv6JrZZyh8z+X7wRoiwAh?=
 =?us-ascii?Q?HOuA29YZs+7o1bXg9EKomonpggie4+Tm5nA4KyDCbl/XEt3gtpsS9fIbSddz?=
 =?us-ascii?Q?AI5WjSfxNDhyWBUxn+p1IbKxvmmd90T/4+c5f9UlYstgfF9Bgk8RyOeOJ/2M?=
 =?us-ascii?Q?wdKm0L/tbtuRpurSUNEaend0oLLprjInHNHSZh+cP/sHYBZitIqCtbMLOz+R?=
 =?us-ascii?Q?ccRgz8e0ZMNFBrRqI67fNlteyAp5xi9GD0IG+1kWeuvs3UisaUjqy02PaS2v?=
 =?us-ascii?Q?me+QvZddGVKerLn8aGM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(10070799003)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?I0TsZzlqHD5XzEP07kVA8GU3hqisVAKu7xeA6H7JdpSPhKe1VBlobH82vjmQ?=
 =?us-ascii?Q?9vdwl3iYyyAG3+R9vWW9YXcBeM6d1Tu1jakM4w6IhdvSedUTjH8sC800eKwq?=
 =?us-ascii?Q?o9TMvbSxXweQrESI6UAdK2G891qTYABRN8nfeH3rkAKMLsa31p/qooVvi29B?=
 =?us-ascii?Q?ouVsEByyU2ehHADKnASbCbDQIywPqj3KU0fKP9n7uGaR5m2fLnEi7Q/5ZwpB?=
 =?us-ascii?Q?6Ip4gNrOYiBE4kA3bSQ+VIn0l8KQYI9s4h/XY9iAu/bc/KkVvrFAGxo7VJ7j?=
 =?us-ascii?Q?r+Ovgfw0g+E5mpwCE7ZzsOK8ByG6QL96TxtJwvD78//esonZYNrhuGVtbHmP?=
 =?us-ascii?Q?HbMmeCiy9/ZYVzPHXmoJCoZS4gbaVyQx7XF22QbC02vCNVUiQzR9kTEMaLKj?=
 =?us-ascii?Q?2zBg9pGNDuFLZvoWQ+IFCc9fCVDFPD9oCECkpQEpmhQKKrBtost8LXWe/yWU?=
 =?us-ascii?Q?isNG28MfI28RyhP2/SyuZLlBeV+XJByQCcEcT3qxiYOI25zcAeFX2YSuXBQz?=
 =?us-ascii?Q?ByMzbuNMcNgEEZgWr4MLev5P2ba77YX95vxYLtGB13qb7D12XLUg+iaIvP77?=
 =?us-ascii?Q?Xx4eCl0E2/bjzIyCYU+vQZs07JEypisoQZ+/mtcEEYUVm57BzKvG0WT4GO1g?=
 =?us-ascii?Q?TQ55A8UO7BmeVyAmcDmHFbs15/Lm5st14UhyOrcCoFfyP/lLgY6VTZ8Evk0P?=
 =?us-ascii?Q?WLlXtPuZIaVP3G3ZAaFrwogESZn11ckrkSE1O+PVTkZ0suThcDKlWnUFJ/tM?=
 =?us-ascii?Q?gA/xWH+1Mz5xSrbvi6PZmzxf91L3MkQ89pN9tp7FRZy4TgqB0LTebtVWkLE3?=
 =?us-ascii?Q?uW+r+VMqVZ22hQy1dEiue8t7Hdn1Lt6nrLVt9YfUJsCpYApi+zulAoa+++LI?=
 =?us-ascii?Q?f0ueRa52z2aIWOigHJ1H9nY2qSQWDJz2FzhwUiEHBGUFybga1VUlGWOPpevt?=
 =?us-ascii?Q?hjToF7pLLOBEM1eCavSxTQjqkdT2KhG4BZHVwTXLYxbrS9c7vN3RU0hoFVHa?=
 =?us-ascii?Q?UyT+zPZ3kSJtCXLUJV0munK+kjFHZALo9upI4gX7ZhZb3PcM5XweNLgCldv2?=
 =?us-ascii?Q?CQkW1VFel4gIVoHpW7v1xZ4ZS461mCyaLWc2MLQbrbC8yubaW5pK3HyrmJql?=
 =?us-ascii?Q?xRSHoPF+awtSmKaApmVjVCjrJK6VjV7W77a2zX19W25y8vZTTFQTS9tAjT6C?=
 =?us-ascii?Q?/1hn3mGFnzzLpkFrtAZW7w75WdyZwOSv5ibWWJg2U8tIx6MNaHfjFmxJ+jHo?=
 =?us-ascii?Q?gOSWFZIi8tFSh7YJfh2WM2d4YMPDrzsZQzhXV/+HbxNh9XIJ0TtHPUrdOrCK?=
 =?us-ascii?Q?NXfyMnR3cvqiRVlhwHHnuKOb26PQbTBi19aNDw2SwTu9Jq7k8XJD8RB5wdDs?=
 =?us-ascii?Q?mj+qGQlTNOVNpycij0GPocCuKb+JABQCHWqcgg4iqYIYHHn/+UVnXNAeyPyb?=
 =?us-ascii?Q?tyw0cXTeCqfNX4C7gqsA0mRWdfhwUY8jir6WdNiNjVSI9Cg6fAy+Myx0iJNY?=
 =?us-ascii?Q?aCaXZvWrgJTCR9HthT+zLFZgVfQp0cFoR4S+cjvyXSR3YHO3RKvUvC5Kd9Dr?=
 =?us-ascii?Q?ukonoUlP1CleXrxKwGt3qcrQ9TeCEUoHCdIXNcZYR3W9VP9/HWWizMRHADZ+?=
 =?us-ascii?Q?+wvTb2I5QTvNZqnCCUcuoKiGXP16SWye/WcfwKiakmS9ywENNeJcTUoD4EuS?=
 =?us-ascii?Q?ZDuDqqkjUkW558lcPvU10C0dxTJmWeWOByqqi0XtkhY4tvCbBNAsTheTJKV7?=
 =?us-ascii?Q?kPGlhs1ioGZ1fDhOIp6SXgosZsI7z2u6RkZiIiJjEUfs7LhPDan8?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e4416be-1f8d-4d82-b0f2-08de5b57e710
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2026 14:50:23.0544
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3zOcbRiPmWjcKICTMDKjpSACieen+aDvYfGA0/5VcbJl+deWnrGdEvlmGrulOdMUCj4oFxcJduM4TfpD6LF4SA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYP286MB4692
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[valinux.co.jp,none];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[valinux.co.jp:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[ti.com,nxp.com,pengutronix.de,kernel.org,gmail.com,axis.com,sntech.de,intel.com,renesas.com,glider.be,foss.st.com,nvidia.com,socionext.com,vivo.com,163.com,rock-chips.com,collabora.com,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.ozlabs.org,st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[den@valinux.co.jp,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16282-lists,linuxppc-dev=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:jingoohan1@gmail.com,m:mani@kernel.org,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:robh@kernel.org,m:bhelgaas@google.com,m:cassel@kernel.org,m:Frank.Li@nxp.com,m:vigneshr@ti.com,m:s-vadapalli@ti.com,m:hongxing.zhu@nxp.com,m:l.stach@pengutronix.de,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:minghuan.Lian@nxp.com,m:mingkai.hu@nxp.com,m:roy.zang@nxp.com,m:jesper.nilsson@axis.com,m:heiko@sntech.de,m:srikanth.thokala@intel.com,m:marek.vasut+renesas@gmail.com,m:yoshihiro.shimoda.uh@renesas.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:christian.bruel@foss.st.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:thierry.reding@gmail.com,m:jonathanh@nvidia.com,m:hayashi.kunihiko@socionext.com,m:mhiramat@kernel.org,m:kishon@kernel.org,m:jirislaby@kernel.org,m:rongqianfeng@vivo.com,m:18255117159@163.com,m:shawn.lin@rock-chips.com,m:nicolas.frattaroli@collabora.com,m:linux.amoon@gmail.com,m:
 vidyas@nvidia.com,m:shuah@kernel.org,m:linux-omap@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:imx@lists.linux.dev,m:linuxppc-dev@lists.ozlabs.org,m:linux-arm-kernel@axis.com,m:linux-rockchip@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-tegra@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:marekvasut@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:mcoquelinstm32@gmail.com,m:thierryreding@gmail.com,m:linuxamoon@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,google.com,nxp.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[den@valinux.co.jp,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[valinux.co.jp:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCPT_COUNT_GT_50(0.00)[55];
	TAGGED_RCPT(0.00)[linuxppc-dev,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[valinux.co.jp:email,valinux.co.jp:dkim,valinux.co.jp:mid,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 1A4FA7DE8B
X-Rspamd-Action: no action

Add BAR_SUBRANGE_TEST to the pci_endpoint kselftest suite.

The test uses the PCITEST_BAR_SUBRANGE ioctl and will skip when the
chosen BAR is disabled (-ENODATA), when the endpoint/controller does not
support subrange mapping (-EOPNOTSUPP), or when the BAR is reserved for
the test register space (-EBUSY).

Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
 .../selftests/pci_endpoint/pci_endpoint_test.c  | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/tools/testing/selftests/pci_endpoint/pci_endpoint_test.c b/tools/testing/selftests/pci_endpoint/pci_endpoint_test.c
index 23aac6f97061..eecb776c33af 100644
--- a/tools/testing/selftests/pci_endpoint/pci_endpoint_test.c
+++ b/tools/testing/selftests/pci_endpoint/pci_endpoint_test.c
@@ -70,6 +70,23 @@ TEST_F(pci_ep_bar, BAR_TEST)
 	EXPECT_FALSE(ret) TH_LOG("Test failed for BAR%d", variant->barno);
 }
 
+TEST_F(pci_ep_bar, BAR_SUBRANGE_TEST)
+{
+	int ret;
+
+	pci_ep_ioctl(PCITEST_SET_IRQTYPE, PCITEST_IRQ_TYPE_AUTO);
+	ASSERT_EQ(0, ret) TH_LOG("Can't set AUTO IRQ type");
+
+	pci_ep_ioctl(PCITEST_BAR_SUBRANGE, variant->barno);
+	if (ret == -ENODATA)
+		SKIP(return, "BAR is disabled");
+	if (ret == -EBUSY)
+		SKIP(return, "BAR is test register space");
+	if (ret == -EOPNOTSUPP)
+		SKIP(return, "Subrange map is not supported");
+	EXPECT_FALSE(ret) TH_LOG("Test failed for BAR%d", variant->barno);
+}
+
 FIXTURE(pci_ep_basic)
 {
 	int fd;
-- 
2.51.0


