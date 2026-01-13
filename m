Return-Path: <linuxppc-dev+bounces-15609-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B23ED16513
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jan 2026 03:38:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dqtjF0CkSz2xl0;
	Tue, 13 Jan 2026 13:38:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=52.101.228.124 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768271920;
	cv=pass; b=SbolTXYPK78PcEzE4UgJycyQFCBqzzHdTWre2kM9vQpihc9+TICvu6JTyi+GZptcCEVSCMIJVxDUQP9wxPw30sBTC3tCjJSuWk9n3d206lBNV+YGzo0LQajR9cceHdLWDfX0vxiQ3sw/CYUQC2H4EUsMHdrGen+fHkbJovf/4ruMZkKucPxlnn6+PJflU3XAfXYdzCXHfwihCJM4VH1NwVvjTQgG4z5SfMAbx22nal73UD13Bs91owiZQ+/y6lBGd5Scv5/vEK0qlOt1TS2HDU5l3V7tf9P90w02Ty5qSrDCmkpt/DwItPr9tqpm2ZDzDkVfwUC0Thzyamn6f3MFow==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768271920; c=relaxed/relaxed;
	bh=wG72pkiXQrx8VvUdbj8kHT7b9xVLlyeqQFsTk2hM+dg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SU2u5Nu09u0OvGE9xk5BMR83Cjpkb3xLqJ+WYigmS+fcrCF/e69RvfdU70AqmIAjgXB5yhxxeJOcM+9IiUq9rIqtKFmCZo1IfrZN3ODjeuEF1vbRjS9xw85M33MpxYaKVI5wu8WAj1+KzpUoOQJ7eXtDtkJby1G4ji7Si2gTjGMyGdV/aYW5C6+Ru6KIrqWr3s12sT9i67why8U3D0caKbg48K21QhlGEY4shRdIdCCYOyPWJ1CMvvS/rcGcFvhjPgWQGpqalXRn2T0Dmsr/DrLn99vVEbAvwUfVJjQNhV9S13PrRSC4nYzr3ajnERXEUdWBuo1GQyunhfupN1pkkw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; dkim=pass (1024-bit key; unprotected) header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=dbRweLnj; dkim-atps=neutral; spf=pass (client-ip=52.101.228.124; helo=os0p286cu011.outbound.protection.outlook.com; envelope-from=den@valinux.co.jp; receiver=lists.ozlabs.org) smtp.mailfrom=valinux.co.jp
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=dbRweLnj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=valinux.co.jp (client-ip=52.101.228.124; helo=os0p286cu011.outbound.protection.outlook.com; envelope-from=den@valinux.co.jp; receiver=lists.ozlabs.org)
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11020124.outbound.protection.outlook.com [52.101.228.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dqtjD1fL8z2xKx
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jan 2026 13:38:40 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bJQSdbnCfdRz38Ln+aPRJK+sESnldggQBq/c79PwDYx4DiCAiTgNROxvrl0R4b+LXiGpXtblvt2Nw07vgXfKEZEXXRHnSco4dtgKSdaGRHQm6wNA4/+H5B5cb0E6Gu1mt1nG6bbU7Drz0n8eEp/8pIxrGTUybabZc3NInSaYSdte6g0vvEht3kQtVPAGbc2IJ+FYAYhIUgFWSRYhPiulPo9YD4d9CBNywSDAQasT3nofKBoez/CrpFAHZmUEgIpixu6OUzkul+SHz5aHkW6LtR29iUi0BHyslPMzd1oTmFtD3lDH2JwlgfRD8d0xLVljckUFuCDQJwtOVMhvVh/XGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wG72pkiXQrx8VvUdbj8kHT7b9xVLlyeqQFsTk2hM+dg=;
 b=W78NqHcOtwpWPCsLRgCsDhcuLjhQibvbLfm479P6PqcmNbUyKUFMCLY4xFlvFycuwFDYOOXZ4ACIpLDxwq2J7kCZbf47ObW6HGq+mQAFtzK70u3SmI25zABPz7Et739O+VvuGq6ktxD0LjinvS+dyQYki1B219wcwm0x8Sk2p66GCMHoUmV5Gp6FPQgPZApOBN9/9fzBBcKgLFVFEv/iBZOao4F8qaA/xw5py6z0mrGHY2DaIr80hTarHkBO9UHrdFb7DXI1T3Ax93nOFPLfW0XeX2G8PZoflAs+o99ZAtAbgZq4AKUxfJKKNF7ovWkQsShsrMZR6feWVQmSt1Qc6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wG72pkiXQrx8VvUdbj8kHT7b9xVLlyeqQFsTk2hM+dg=;
 b=dbRweLnjjssSwNpXaY3+lwBYS6k2n6BfoprdeZESwG+c9er7XqMGaa6FLvOtxtO1L+Mdiao3ESB57Wob1mZhMZNDqikJPqvsvWzKUeYCgJZZl822zahJ1Hq+mqKVAAW8pmwACOzaJwSWqUrPcGWJtxKPDXEEPKKbAnFqgjYIdx4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TY7P286MB6708.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:323::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 02:37:20 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%5]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 02:37:20 +0000
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
Subject: [PATCH v6 2/5] PCI: dwc: Allow glue drivers to return mutable EPC features
Date: Tue, 13 Jan 2026 11:37:12 +0900
Message-ID: <20260113023715.3463724-3-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260113023715.3463724-1-den@valinux.co.jp>
References: <20260113023715.3463724-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0126.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::6) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
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
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TY7P286MB6708:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a72d3c4-79a8-44cc-e81c-08de524caca1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7SY2wbYa3s8kCBAtKvOVPZ0OBRmQqIVIzTiyZVkKTRxXxN9RPrO5LCVU/9nk?=
 =?us-ascii?Q?lS9UesTjT4TCjHxMjnX9WSTnyidnB8rUHYrgJY6ERestsonVSas196WHdLQn?=
 =?us-ascii?Q?DXavQ5RI+MTRUUfGKwda3Sdo8jUR9IwBHiu8wfTzDEk4dfTF/+bOp6tvuAtq?=
 =?us-ascii?Q?qyFvkEAUusCI+9GudHGexYopo15yhwdd1V+eKYF4rOycOtY2jUR/kD/pDiYt?=
 =?us-ascii?Q?VeueAZdXAfdgSAH/seagNi9VaNJshuFHJMauheXyu0NcC2hqcmNYHvzSjjmC?=
 =?us-ascii?Q?hM0cvG2jACC5D1FbXo/hd/ceX9KEA/yNeUsA4t3NLmE+skf0HeGByoSlJXb3?=
 =?us-ascii?Q?pz9bY/Ez58HxRJE+jneMLdh0lUB+ovIy3KeX6tKXGG+xbKIFpf4PJXgvJO8V?=
 =?us-ascii?Q?8foj7RVNeN0mOnm3CZZkd5WlFbJKeiwcTuFWGRP91xCHZ2Z9lFI1/u+6ICY/?=
 =?us-ascii?Q?mZUNiDKCEVoh84bJKLd7fWHVibJBq7k8B4AvpFhWz+asJdgbEsfLxWL2gJKX?=
 =?us-ascii?Q?BtyKCRXi8LqaqfIZOxBnK8DMoZxrYnDZFqhsn+vUEWpSGZuBqCs3Tp3vnrO5?=
 =?us-ascii?Q?BkiIFTWep75Zg6IQtnp/Azo7QZdDAEF/c84Vn7Zlf0UL+XJwh9TLSMtsdjBi?=
 =?us-ascii?Q?nZ4KbgfTQh5NHZo+qPkrAps4mLslqcw5yS9Umhrrf8vlt7iTVJkf3KC+TLu2?=
 =?us-ascii?Q?7jAcGlRt/0bDi0TRzJ+ffR+xUxJxlxe/2XKjcICIkkQzK3UKtfKtkE/RJpdT?=
 =?us-ascii?Q?iZVBPVjqfHLdBAvVCo5ZHRsXEqxBcl/IQB2K4/MQ+/yNgPeeR08G/i4hrRY9?=
 =?us-ascii?Q?rdYFVps7cHF7o2Gm9V33omXlIXKuiffNhKOrEKo8WXSEm+KZoU0pHe/F55Sd?=
 =?us-ascii?Q?EyQ/Gv23rFH7AyZihTzZ0qTyKHUeBZTc3lubMD80julDAqoaVRMmn0lKRYhZ?=
 =?us-ascii?Q?0MS2dje2SY6ZsAZHmCBDg2mZ4AeLLAo2V2RuZIJOzIAyAr+/FjCdTp3bocfL?=
 =?us-ascii?Q?gyoqIUaSCrL6fQUDAx0gnCIKnytzrQIg78XYieiN0PRSFKBY55/85iDPu0qm?=
 =?us-ascii?Q?aSCtL9ok5G3ejKoqF3O2oytJH7lQKnCr4rsgXp/+vHEPQVFvFdiIvTUQkUCN?=
 =?us-ascii?Q?Oo5jraDkrUnRsv30GV3rRIe8NBgtTajLrVGigeCsenhGbtpSO+J323CpoWeA?=
 =?us-ascii?Q?P4y/QmcDaKmoxp9yHNMgDxOVcZ65NScJ6d0kmxMwKGyiieVzVzHOF/KhXdGJ?=
 =?us-ascii?Q?cLXLl7aWX31Deqt3APILQqYXuM4HdzrjMZ891Yr9OD8L4Vguida+nZvHjEXr?=
 =?us-ascii?Q?dlmpkVw9zNm/12fNd8efVbKjqZC3bD8S6TwhZ2ZvhMHvNHXA4JABbuwBPv2n?=
 =?us-ascii?Q?9PtE1S3uE2XdLoOpG0z65kiirXCxAtMA2vR/iIiG1IK3WvVBygw+5gML3B/k?=
 =?us-ascii?Q?7ug36bMLBD6V/KjVfw6xO7fChw+FrVbR?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(7416014)(376014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qOeXs02xXzvRJqq8CP9HVfohkwRackdPi4lWTDsDLoxXXSZ1fezgRb5IXbiY?=
 =?us-ascii?Q?FpvrjRNFKUasA3Ai98AkdYfa5ir8pm7d1WK9fFxu1qcMEWv3LSI9bTegR+BB?=
 =?us-ascii?Q?t+KT3FGn78ba6bZ0KNFSvkLAdGAnRjJsYy3sI4EN7mjA5vXqQf/mYXj4c2zt?=
 =?us-ascii?Q?U7HzTXhLJH6LXYBVssZwEdDFBsColvv+G2GDF9bkxT3IxzbuBkFeRCA+S3wm?=
 =?us-ascii?Q?PNJhR4S1GqlN2tI5M+iQz5uQuhbNNHw1Fw0GHrvLZl72TCZLgZnb+wjS6v4h?=
 =?us-ascii?Q?RYDuPr/fVXHHLNkl8iWJjIhIlbjSb/t9GnIstobImJvzkKZMwpYP7FqXDxAr?=
 =?us-ascii?Q?tMyGj2zC/QcH4AMg2C1vXv+oKWnjoacXC2cs/9ZhcWxfsCO0J3Q/yk9faNnA?=
 =?us-ascii?Q?5GTvahM70IUzJ906T0wUoz2XsQtWLTuLrtBXuGJQ+YadvujPgdk28sm1VOl9?=
 =?us-ascii?Q?/bdzEaQdz6+x+QzHLbSIN8VRIFWnqwt78SediRmJWpjGbOmrWDXsasPhPuFi?=
 =?us-ascii?Q?pZ2nVRube0Nd+YIuJU1f8jpNabM2WshgLMaQ7J8U4wP384a/WjH5fXilElXH?=
 =?us-ascii?Q?6DiJ3c/8s2V8P7vQkgs8WCTBFNVBSIeUnH377OjapMCH+OSDL0apBeGIf+SK?=
 =?us-ascii?Q?VTfrzWrTMspxSPlY7naKSA8utMccWQYC4NTwWlpu6Rfke+NZNjtKlY96tw9u?=
 =?us-ascii?Q?Y4orcHKfHL/uk7yL59+q4mWcBFCCWEswyWN9aY+witX54fdDN8+o6fU7lgwZ?=
 =?us-ascii?Q?W4OJxdTiIJF6BnXFwpGmUsm5473RaLPcI4I+BK6D9W9d6EaB0XgNU25uQNtn?=
 =?us-ascii?Q?Y+cJ/AE9dmaXfV8jUn/VSvmp7Lvpk2Uj37zvmE/Ku7eR6IVcVAiL1PPzMD1f?=
 =?us-ascii?Q?YhjnijZsd7SX/LIQLQ7FWYRDcB4nGne/3a7/vLVEvWK3w30+FDDXipo4hXVE?=
 =?us-ascii?Q?rILTcyw9gSc2zCXoxT+rAH0NndEq3XUJHj0+wLg/KdNL24zJGViTMHzSOdVP?=
 =?us-ascii?Q?LJ1kEXqyHolmFVeHx/p7ylgbhWAecNSvccYwajMfn2i3Wh39i+oDdzGaWDSt?=
 =?us-ascii?Q?xm1N9QsYauxjvyYljz5hCl/O4kQ+oVxab3YaDq3a+TK0fBbVxVN/yb8TlXUg?=
 =?us-ascii?Q?R4oynSDmOTUnhagEEs3nOza2ktyN20/3LeQFqlwXYBmmB/O3fCxNYPJZFF1m?=
 =?us-ascii?Q?ZUDt6ewuzpg3iBGomMTtVRg0ecN+RKff3mRDWVWitDbot+9Xf2MiVNAiTyfL?=
 =?us-ascii?Q?zEqszNa5jI8bYAsOYDAvDtNpMN6JKNesVY86XTd+GrrGAZB3Ua4Og3UDxame?=
 =?us-ascii?Q?bmiVujiYLZ8RpchRSzQlydMHpGpI78aZH5DmgNue/xZJsutgcLjrIBW0hhQ0?=
 =?us-ascii?Q?EcVyMrzGXJc5SoWOzR/mubDj5UA5iWrT2gjlNxXCM1gQKIcf8nBmb1G5LeCD?=
 =?us-ascii?Q?ckrqfWI/EV5aF9RZrgNINqgQW+6XmZe/IyYzLp6U0Kf+flMOnveGYN+AhZm3?=
 =?us-ascii?Q?QWHh2v126JnPOVF7nkF0DWQXGuRdNgVCSQlGxdWc/vkRdwHJaBVg1x6tOUDk?=
 =?us-ascii?Q?03JbdJAHzB+SHBQNnTpVqAPNIFu1EGB9WzORXB63EKjatfcLY3tV/3qmRLgW?=
 =?us-ascii?Q?NSFxfggMS7fMjIF4JpyP7Tx7k4rZJ1NhUS/WnkPaMnpzBt+4uHJ8S0QPTxu9?=
 =?us-ascii?Q?VZ4guYO2hOqsp0NWBkvIUPCdEwifhKs52Y3gK8bU0B/euRxX9q0ObEi3hprJ?=
 =?us-ascii?Q?lZBi6gCroTygpn0MKl6y4HZbHICER37VXclQN6FaZv/IDaWEb/72?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a72d3c4-79a8-44cc-e81c-08de524caca1
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 02:37:20.3373
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jIiXi1r06ifc6iJvGKyucf+PISMhc4Gu7EMslq+wU8PlRzQF11rRM4NPHvGCJdBQli0oHrcCFg6rf/8o72lPdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7P286MB6708
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The DesignWare EP midlayer needs to advertise additional capabilities at
the DWC layer (e.g. subrange_mapping) without duplicating the same bit
in every DWC-based glue driver and without copying feature structures.

Change dw_pcie_ep_ops.get_features() to return a mutable
struct pci_epc_features * and update all DWC-based glue drivers
accordingly. The DWC midlayer can then adjust/augment the returned
features while still exposing a const struct pci_epc_features * to the
PCI EPC core.

No functional change on its own.

Suggested-by: Niklas Cassel <cassel@kernel.org>
Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
 drivers/pci/controller/dwc/pci-dra7xx.c       |  4 +-
 drivers/pci/controller/dwc/pci-imx6.c         | 10 ++--
 drivers/pci/controller/dwc/pci-keystone.c     |  4 +-
 .../pci/controller/dwc/pci-layerscape-ep.c    |  2 +-
 drivers/pci/controller/dwc/pcie-artpec6.c     |  4 +-
 .../pci/controller/dwc/pcie-designware-plat.c |  4 +-
 drivers/pci/controller/dwc/pcie-designware.h  |  2 +-
 drivers/pci/controller/dwc/pcie-dw-rockchip.c |  8 +--
 drivers/pci/controller/dwc/pcie-keembay.c     |  4 +-
 drivers/pci/controller/dwc/pcie-qcom-ep.c     |  4 +-
 drivers/pci/controller/dwc/pcie-rcar-gen4.c   |  4 +-
 drivers/pci/controller/dwc/pcie-stm32-ep.c    |  4 +-
 drivers/pci/controller/dwc/pcie-tegra194.c    |  4 +-
 drivers/pci/controller/dwc/pcie-uniphier-ep.c | 58 ++++++++++---------
 14 files changed, 60 insertions(+), 56 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-dra7xx.c b/drivers/pci/controller/dwc/pci-dra7xx.c
index 01cfd9aeb0b8..e67f8b7b56cb 100644
--- a/drivers/pci/controller/dwc/pci-dra7xx.c
+++ b/drivers/pci/controller/dwc/pci-dra7xx.c
@@ -423,12 +423,12 @@ static int dra7xx_pcie_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
 	return 0;
 }
 
-static const struct pci_epc_features dra7xx_pcie_epc_features = {
+static struct pci_epc_features dra7xx_pcie_epc_features = {
 	.linkup_notifier = true,
 	.msi_capable = true,
 };
 
-static const struct pci_epc_features*
+static struct pci_epc_features*
 dra7xx_pcie_get_features(struct dw_pcie_ep *ep)
 {
 	return &dra7xx_pcie_epc_features;
diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index 4668fc9648bf..fe1de30b3df6 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -131,7 +131,7 @@ struct imx_pcie_drvdata {
 	const u32 ltssm_mask;
 	const u32 mode_off[IMX_PCIE_MAX_INSTANCES];
 	const u32 mode_mask[IMX_PCIE_MAX_INSTANCES];
-	const struct pci_epc_features *epc_features;
+	struct pci_epc_features *epc_features;
 	int (*init_phy)(struct imx_pcie *pcie);
 	int (*enable_ref_clk)(struct imx_pcie *pcie, bool enable);
 	int (*core_reset)(struct imx_pcie *pcie, bool assert);
@@ -1386,7 +1386,7 @@ static int imx_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
 	return 0;
 }
 
-static const struct pci_epc_features imx8m_pcie_epc_features = {
+static struct pci_epc_features imx8m_pcie_epc_features = {
 	.msi_capable = true,
 	.bar[BAR_1] = { .type = BAR_RESERVED, },
 	.bar[BAR_3] = { .type = BAR_RESERVED, },
@@ -1395,7 +1395,7 @@ static const struct pci_epc_features imx8m_pcie_epc_features = {
 	.align = SZ_64K,
 };
 
-static const struct pci_epc_features imx8q_pcie_epc_features = {
+static struct pci_epc_features imx8q_pcie_epc_features = {
 	.msi_capable = true,
 	.bar[BAR_1] = { .type = BAR_RESERVED, },
 	.bar[BAR_3] = { .type = BAR_RESERVED, },
@@ -1415,13 +1415,13 @@ static const struct pci_epc_features imx8q_pcie_epc_features = {
  * BAR4	| Enable   | 32-bit  |  1 MB   | Programmable Size
  * BAR5	| Enable   | 32-bit  | 64 KB   | Programmable Size
  */
-static const struct pci_epc_features imx95_pcie_epc_features = {
+static struct pci_epc_features imx95_pcie_epc_features = {
 	.msi_capable = true,
 	.bar[BAR_1] = { .type = BAR_FIXED, .fixed_size = SZ_64K, },
 	.align = SZ_4K,
 };
 
-static const struct pci_epc_features*
+static struct pci_epc_features*
 imx_pcie_ep_get_features(struct dw_pcie_ep *ep)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
diff --git a/drivers/pci/controller/dwc/pci-keystone.c b/drivers/pci/controller/dwc/pci-keystone.c
index f86d9111f863..4292007a9b3a 100644
--- a/drivers/pci/controller/dwc/pci-keystone.c
+++ b/drivers/pci/controller/dwc/pci-keystone.c
@@ -929,7 +929,7 @@ static int ks_pcie_am654_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
 	return 0;
 }
 
-static const struct pci_epc_features ks_pcie_am654_epc_features = {
+static struct pci_epc_features ks_pcie_am654_epc_features = {
 	.msi_capable = true,
 	.msix_capable = true,
 	.bar[BAR_0] = { .type = BAR_RESERVED, },
@@ -941,7 +941,7 @@ static const struct pci_epc_features ks_pcie_am654_epc_features = {
 	.align = SZ_64K,
 };
 
-static const struct pci_epc_features*
+static struct pci_epc_features*
 ks_pcie_am654_get_features(struct dw_pcie_ep *ep)
 {
 	return &ks_pcie_am654_epc_features;
diff --git a/drivers/pci/controller/dwc/pci-layerscape-ep.c b/drivers/pci/controller/dwc/pci-layerscape-ep.c
index a4a800699f89..8d48413050ef 100644
--- a/drivers/pci/controller/dwc/pci-layerscape-ep.c
+++ b/drivers/pci/controller/dwc/pci-layerscape-ep.c
@@ -138,7 +138,7 @@ static int ls_pcie_ep_interrupt_init(struct ls_pcie_ep *pcie,
 	return 0;
 }
 
-static const struct pci_epc_features*
+static struct pci_epc_features*
 ls_pcie_ep_get_features(struct dw_pcie_ep *ep)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
diff --git a/drivers/pci/controller/dwc/pcie-artpec6.c b/drivers/pci/controller/dwc/pcie-artpec6.c
index f4a136ee2daf..84111d8257f2 100644
--- a/drivers/pci/controller/dwc/pcie-artpec6.c
+++ b/drivers/pci/controller/dwc/pcie-artpec6.c
@@ -369,11 +369,11 @@ static int artpec6_pcie_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
 	return 0;
 }
 
-static const struct pci_epc_features artpec6_pcie_epc_features = {
+static struct pci_epc_features artpec6_pcie_epc_features = {
 	.msi_capable = true,
 };
 
-static const struct pci_epc_features *
+static struct pci_epc_features *
 artpec6_pcie_get_features(struct dw_pcie_ep *ep)
 {
 	return &artpec6_pcie_epc_features;
diff --git a/drivers/pci/controller/dwc/pcie-designware-plat.c b/drivers/pci/controller/dwc/pcie-designware-plat.c
index 12f41886c65d..60ada0eb838e 100644
--- a/drivers/pci/controller/dwc/pcie-designware-plat.c
+++ b/drivers/pci/controller/dwc/pcie-designware-plat.c
@@ -60,12 +60,12 @@ static int dw_plat_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
 	return 0;
 }
 
-static const struct pci_epc_features dw_plat_pcie_epc_features = {
+static struct pci_epc_features dw_plat_pcie_epc_features = {
 	.msi_capable = true,
 	.msix_capable = true,
 };
 
-static const struct pci_epc_features*
+static struct pci_epc_features*
 dw_plat_pcie_get_features(struct dw_pcie_ep *ep)
 {
 	return &dw_plat_pcie_epc_features;
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index f87c67a7a482..4dda9a38d46b 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -449,7 +449,7 @@ struct dw_pcie_ep_ops {
 	void	(*init)(struct dw_pcie_ep *ep);
 	int	(*raise_irq)(struct dw_pcie_ep *ep, u8 func_no,
 			     unsigned int type, u16 interrupt_num);
-	const struct pci_epc_features* (*get_features)(struct dw_pcie_ep *ep);
+	struct pci_epc_features* (*get_features)(struct dw_pcie_ep *ep);
 	/*
 	 * Provide a method to implement the different func config space
 	 * access for different platform, if different func have different
diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
index 352f513ebf03..1f3c91368dc3 100644
--- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
+++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
@@ -100,7 +100,7 @@ struct rockchip_pcie {
 
 struct rockchip_pcie_of_data {
 	enum dw_pcie_device_mode mode;
-	const struct pci_epc_features *epc_features;
+	struct pci_epc_features *epc_features;
 };
 
 static int rockchip_pcie_readl_apb(struct rockchip_pcie *rockchip, u32 reg)
@@ -383,7 +383,7 @@ static int rockchip_pcie_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
 	return 0;
 }
 
-static const struct pci_epc_features rockchip_pcie_epc_features_rk3568 = {
+static struct pci_epc_features rockchip_pcie_epc_features_rk3568 = {
 	.linkup_notifier = true,
 	.msi_capable = true,
 	.msix_capable = true,
@@ -403,7 +403,7 @@ static const struct pci_epc_features rockchip_pcie_epc_features_rk3568 = {
  * default.) If the host could write to BAR4, the iATU settings (for all other
  * BARs) would be overwritten, resulting in (all other BARs) no longer working.
  */
-static const struct pci_epc_features rockchip_pcie_epc_features_rk3588 = {
+static struct pci_epc_features rockchip_pcie_epc_features_rk3588 = {
 	.linkup_notifier = true,
 	.msi_capable = true,
 	.msix_capable = true,
@@ -416,7 +416,7 @@ static const struct pci_epc_features rockchip_pcie_epc_features_rk3588 = {
 	.bar[BAR_5] = { .type = BAR_RESIZABLE, },
 };
 
-static const struct pci_epc_features *
+static struct pci_epc_features *
 rockchip_pcie_get_features(struct dw_pcie_ep *ep)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
diff --git a/drivers/pci/controller/dwc/pcie-keembay.c b/drivers/pci/controller/dwc/pcie-keembay.c
index 60e74ac782af..e6de5289329f 100644
--- a/drivers/pci/controller/dwc/pcie-keembay.c
+++ b/drivers/pci/controller/dwc/pcie-keembay.c
@@ -308,7 +308,7 @@ static int keembay_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
 	}
 }
 
-static const struct pci_epc_features keembay_pcie_epc_features = {
+static struct pci_epc_features keembay_pcie_epc_features = {
 	.msi_capable		= true,
 	.msix_capable		= true,
 	.bar[BAR_0]		= { .only_64bit = true, },
@@ -320,7 +320,7 @@ static const struct pci_epc_features keembay_pcie_epc_features = {
 	.align			= SZ_16K,
 };
 
-static const struct pci_epc_features *
+static struct pci_epc_features *
 keembay_pcie_get_features(struct dw_pcie_ep *ep)
 {
 	return &keembay_pcie_epc_features;
diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
index f1bc0ac81a92..6ad033301909 100644
--- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
+++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
@@ -819,7 +819,7 @@ static void qcom_pcie_ep_init_debugfs(struct qcom_pcie_ep *pcie_ep)
 				    qcom_pcie_ep_link_transition_count);
 }
 
-static const struct pci_epc_features qcom_pcie_epc_features = {
+static struct pci_epc_features qcom_pcie_epc_features = {
 	.linkup_notifier = true,
 	.msi_capable = true,
 	.align = SZ_4K,
@@ -829,7 +829,7 @@ static const struct pci_epc_features qcom_pcie_epc_features = {
 	.bar[BAR_3] = { .type = BAR_RESERVED, },
 };
 
-static const struct pci_epc_features *
+static struct pci_epc_features *
 qcom_pcie_epc_get_features(struct dw_pcie_ep *pci_ep)
 {
 	return &qcom_pcie_epc_features;
diff --git a/drivers/pci/controller/dwc/pcie-rcar-gen4.c b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
index 80778917d2dd..ff0c4af90eff 100644
--- a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
+++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
@@ -419,7 +419,7 @@ static int rcar_gen4_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
 	return 0;
 }
 
-static const struct pci_epc_features rcar_gen4_pcie_epc_features = {
+static struct pci_epc_features rcar_gen4_pcie_epc_features = {
 	.msi_capable = true,
 	.bar[BAR_1] = { .type = BAR_RESERVED, },
 	.bar[BAR_3] = { .type = BAR_RESERVED, },
@@ -428,7 +428,7 @@ static const struct pci_epc_features rcar_gen4_pcie_epc_features = {
 	.align = SZ_1M,
 };
 
-static const struct pci_epc_features*
+static struct pci_epc_features*
 rcar_gen4_pcie_ep_get_features(struct dw_pcie_ep *ep)
 {
 	return &rcar_gen4_pcie_epc_features;
diff --git a/drivers/pci/controller/dwc/pcie-stm32-ep.c b/drivers/pci/controller/dwc/pcie-stm32-ep.c
index 2cecf32d2b0f..8a892def54f5 100644
--- a/drivers/pci/controller/dwc/pcie-stm32-ep.c
+++ b/drivers/pci/controller/dwc/pcie-stm32-ep.c
@@ -69,12 +69,12 @@ static int stm32_pcie_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
 	}
 }
 
-static const struct pci_epc_features stm32_pcie_epc_features = {
+static struct pci_epc_features stm32_pcie_epc_features = {
 	.msi_capable = true,
 	.align = SZ_64K,
 };
 
-static const struct pci_epc_features*
+static struct pci_epc_features*
 stm32_pcie_get_features(struct dw_pcie_ep *ep)
 {
 	return &stm32_pcie_epc_features;
diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
index 0ddeef70726d..06f45a17e52c 100644
--- a/drivers/pci/controller/dwc/pcie-tegra194.c
+++ b/drivers/pci/controller/dwc/pcie-tegra194.c
@@ -1987,7 +1987,7 @@ static int tegra_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
 	return 0;
 }
 
-static const struct pci_epc_features tegra_pcie_epc_features = {
+static struct pci_epc_features tegra_pcie_epc_features = {
 	.linkup_notifier = true,
 	.msi_capable = true,
 	.bar[BAR_0] = { .type = BAR_FIXED, .fixed_size = SZ_1M,
@@ -2000,7 +2000,7 @@ static const struct pci_epc_features tegra_pcie_epc_features = {
 	.align = SZ_64K,
 };
 
-static const struct pci_epc_features*
+static struct pci_epc_features*
 tegra_pcie_ep_get_features(struct dw_pcie_ep *ep)
 {
 	return &tegra_pcie_epc_features;
diff --git a/drivers/pci/controller/dwc/pcie-uniphier-ep.c b/drivers/pci/controller/dwc/pcie-uniphier-ep.c
index d6e73811216e..ddb5ff70340c 100644
--- a/drivers/pci/controller/dwc/pcie-uniphier-ep.c
+++ b/drivers/pci/controller/dwc/pcie-uniphier-ep.c
@@ -82,7 +82,7 @@ struct uniphier_pcie_ep_soc_data {
 	bool has_gio;
 	void (*init)(struct uniphier_pcie_ep_priv *priv);
 	int (*wait)(struct uniphier_pcie_ep_priv *priv);
-	const struct pci_epc_features features;
+	struct pci_epc_features *features;
 };
 
 #define to_uniphier_pcie(x)	dev_get_drvdata((x)->dev)
@@ -273,13 +273,13 @@ static int uniphier_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
 	return 0;
 }
 
-static const struct pci_epc_features*
+static struct pci_epc_features*
 uniphier_pcie_get_features(struct dw_pcie_ep *ep)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
 	struct uniphier_pcie_ep_priv *priv = to_uniphier_pcie(pci);
 
-	return &priv->data->features;
+	return priv->data->features;
 }
 
 static const struct dw_pcie_ep_ops uniphier_pcie_ep_ops = {
@@ -415,40 +415,44 @@ static int uniphier_pcie_ep_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static struct pci_epc_features uniphier_pro5_features = {
+	.linkup_notifier = false,
+	.msi_capable = true,
+	.msix_capable = false,
+	.align = 1 << 16,
+	.bar[BAR_0] = { .only_64bit = true, },
+	.bar[BAR_1] = { .type = BAR_RESERVED, },
+	.bar[BAR_2] = { .only_64bit = true, },
+	.bar[BAR_3] = { .type = BAR_RESERVED, },
+	.bar[BAR_4] = { .type = BAR_RESERVED, },
+	.bar[BAR_5] = { .type = BAR_RESERVED, },
+};
+
+static struct pci_epc_features uniphier_nx1_features = {
+	.linkup_notifier = false,
+	.msi_capable = true,
+	.msix_capable = false,
+	.align = 1 << 12,
+	.bar[BAR_0] = { .only_64bit = true, },
+	.bar[BAR_1] = { .type = BAR_RESERVED, },
+	.bar[BAR_2] = { .only_64bit = true, },
+	.bar[BAR_3] = { .type = BAR_RESERVED, },
+	.bar[BAR_4] = { .only_64bit = true, },
+	.bar[BAR_5] = { .type = BAR_RESERVED, },
+};
+
 static const struct uniphier_pcie_ep_soc_data uniphier_pro5_data = {
 	.has_gio = true,
 	.init = uniphier_pcie_pro5_init_ep,
 	.wait = NULL,
-	.features = {
-		.linkup_notifier = false,
-		.msi_capable = true,
-		.msix_capable = false,
-		.align = 1 << 16,
-		.bar[BAR_0] = { .only_64bit = true, },
-		.bar[BAR_1] = { .type = BAR_RESERVED, },
-		.bar[BAR_2] = { .only_64bit = true, },
-		.bar[BAR_3] = { .type = BAR_RESERVED, },
-		.bar[BAR_4] = { .type = BAR_RESERVED, },
-		.bar[BAR_5] = { .type = BAR_RESERVED, },
-	},
+	.features = &uniphier_pro5_features,
 };
 
 static const struct uniphier_pcie_ep_soc_data uniphier_nx1_data = {
 	.has_gio = false,
 	.init = uniphier_pcie_nx1_init_ep,
 	.wait = uniphier_pcie_nx1_wait_ep,
-	.features = {
-		.linkup_notifier = false,
-		.msi_capable = true,
-		.msix_capable = false,
-		.align = 1 << 12,
-		.bar[BAR_0] = { .only_64bit = true, },
-		.bar[BAR_1] = { .type = BAR_RESERVED, },
-		.bar[BAR_2] = { .only_64bit = true, },
-		.bar[BAR_3] = { .type = BAR_RESERVED, },
-		.bar[BAR_4] = { .only_64bit = true, },
-		.bar[BAR_5] = { .type = BAR_RESERVED, },
-	},
+	.features = &uniphier_nx1_features,
 };
 
 static const struct of_device_id uniphier_pcie_ep_match[] = {
-- 
2.51.0


