Return-Path: <linuxppc-dev+bounces-16280-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QKy1EmzcdGkV+gAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16280-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Jan 2026 15:51:24 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F027DE48
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Jan 2026 15:51:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dyyQt0bg9z3cBW;
	Sun, 25 Jan 2026 01:50:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c407::1" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769266245;
	cv=pass; b=gDQqKrNe5x8ZPxlD0b+mQf8gIvimh2+mdNNtvnHr2hFP2NG5Ds3Veyf9iVZ6V1MFXrgiSDZAr0b2AXcZPkgZqD71Z0No0OrVLw8hmIfk8NdqKl6T5eczigx3dgS2mt3QBt7+aqSBOKfOOy45sLR4mU9OJQiLzNoP8Sybw0l+jWj4o9RJbqX5ocyhpJbXVnYEEyh7OKPDPBAyvq88IFVN4tJJKuHN0gn4Cpww35qjY+aVfrDFbDvEBD4mCV4ttmCMj/NoTUsm7S0MChhxEXUrQ6JE/zT2GijYrU/4blIzb0DnO3f5n14y4qPsIWuTZ/Z9QPraR41r12Arx3HqBBwwIQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769266245; c=relaxed/relaxed;
	bh=lrFY5/aIxzIIGCoLxuYNbQbTa7W/I1AYD7rFUrK+oIc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jy7u78U/TVPpD1xMhVIQ6E55RvgUsloB2DijUyI81HUYOReGcJHuuPDC7e9g4L4Q+Op5jPczpoYLNNkDtfOquW4MYVfjEyB8UC4z3saApqOib6Pkdz8IroTnhjoYf41fi4Samkb0JGSTz25/YsReycR2EymzFFP8vxvtAQcDRMZ7vmGd9at40XiTk80ziE5WJhMAracNYVLoy9yLEod2roxAW5tkcfsv4Y570R+t11sXs4gz51ErfHrt0KxCDsM3qlvTf9bLbp4i6n/7hQjAdOjW52a3MdgPROAQ/k73JwKxqH7X+bY6FQV+OZKIqWWp+3CCpq0JyTaSnzeTzQ3JZQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; dkim=pass (1024-bit key; unprotected) header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=ockLjkDX; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c407::1; helo=os0p286cu010.outbound.protection.outlook.com; envelope-from=den@valinux.co.jp; receiver=lists.ozlabs.org) smtp.mailfrom=valinux.co.jp
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=ockLjkDX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=valinux.co.jp (client-ip=2a01:111:f403:c407::1; helo=os0p286cu010.outbound.protection.outlook.com; envelope-from=den@valinux.co.jp; receiver=lists.ozlabs.org)
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazlp170110001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c407::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dyyQr0132z3bt9
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 25 Jan 2026 01:50:43 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YhROoJFCNhCP6iFqpzB7MBaRQzZ7hcRQxH7oPIPWL7hDrwmHwmUv/77scWLhpdk2tIxod0x4/g5Z9yMOBFp9w9Dvq8IEn4BUjuvh+ThqIupunlsFp3K2beQs9Crbc01h2Z8qZbLcj5TeD8Jh4dxRb7A2NTQbnUqzmY/hjqzel1E/LhuSCX1kM38ofrhArl1198enz2vqX++/MJ1JL/fEJufYPjKs+8ag4wM7cyhMhjdiTIt63NySS+fcj6CnYXGwo1akbpiyqOD4h9yuJhWBIUmLarViv/I9zK93u1AMaAzh1FrZVDIf2S5rMQerSkWCase1zZyszWmXcOd79sJxsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lrFY5/aIxzIIGCoLxuYNbQbTa7W/I1AYD7rFUrK+oIc=;
 b=h0GMgBIQHkPwHD5okL1c4A7NbNKmRxxKuAHDkUCdOEebI9OmUbC6dtP9zubnSCDzzvl5bYJHIDAgiQD5+v0cCEPBrdJzfGt1Cxs5qXieyiHcd6MSxP8CZxj79jbL7jSURXaf5bX6bJ93XmaeR2RF1KmVgjMbGfKAiieRXp2vCX5sCTX1hjCOd8cCAx2fPEOgCIB2hdgZ8oFe8OGlJ3VLC2AB0UrkpPvFaamoZmoXZWQWpyZWkO9TZ9DluXjRAOLqqPGgGepzC+VvJRVnTGvgwczCFNvboxth8br0U7+u0MUB4NmElRR+8b+zXRUvSn0SFecf9Bi+FXHK3x5BKtc9og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lrFY5/aIxzIIGCoLxuYNbQbTa7W/I1AYD7rFUrK+oIc=;
 b=ockLjkDXEQRjIxiOrCpb/udPTXTNKs7bgZpxNLDNiiyRXpjVaIzNYqCD21vkpzJ20KwueLTe5XHiUtoSO6Jj1CrLyd/KIODq5hQGhyhSvd3GDbO+7n+JQz8GJYubPPM68gLV+VMGu5tVZbJe/9n4DQKcNwu3mCtg/b+Fi90tFbo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYYP286MB4692.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:19c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Sat, 24 Jan
 2026 14:50:21 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%5]) with mapi id 15.20.9542.010; Sat, 24 Jan 2026
 14:50:21 +0000
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
Subject: [PATCH v10 6/8] PCI: endpoint: pci-epf-test: Add BAR subrange mapping test support
Date: Sat, 24 Jan 2026 23:50:10 +0900
Message-ID: <20260124145012.2794108-7-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260124145012.2794108-1-den@valinux.co.jp>
References: <20260124145012.2794108-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P286CA0009.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:26d::17) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
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
X-MS-Office365-Filtering-Correlation-Id: b64b4d2d-377a-4f30-1ff4-08de5b57e622
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|10070799003|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oMT/+pJLiReCXJyBL3siOdd9s7IaVUed4uOgdZ4RX5KDK42bY394+LQtKzeK?=
 =?us-ascii?Q?Po1Atqq5TR1N5I3LWZT1Hus2iPIDmCION1uHqsYMu9nGfN8XLpgW42eP4Gl5?=
 =?us-ascii?Q?1QEWZrhKlz72qGl/eDRuJB/1A5ZRcLZpQy4Od1SHtEbBOb7IvWfYsppC+cem?=
 =?us-ascii?Q?m9OcqVa4q341UCULMX/ayFkfaAR/ZzmNgv8wOt3j0ARlNOJzkfJS3Vs7D7eU?=
 =?us-ascii?Q?aWTCo1RNGUNd6+Dy3wSDAuM734Bs9Ih2vcau8JRWcK9hW/a3gAqk332oUeHh?=
 =?us-ascii?Q?ZqNYZOf97mXzY/oCXZWT2v7O/9HPShCBz6a++aFDnemtVIfaGDbMisN7cuaC?=
 =?us-ascii?Q?ZMOtWopxzfARnYco+zzBJZWHhIJN0aqXQ7qMAvxocqQOPjqOIWOtFUm9tcEc?=
 =?us-ascii?Q?syAaazTjvtWYw9ou9CfbyOxC02inCW+jbpq5S1d+2lW7WE4F4Ok6Ozkm459t?=
 =?us-ascii?Q?bDsiNbsxUDMlD8dgSLLB3lbR4ALJ+l2FxgfRTB/mVc/xxhmzOCPb3V7sB0Wo?=
 =?us-ascii?Q?ddmr+Mee9LYTRgf/Dx17KpV573pAlkanaMaIEjER7ra25zhp6Gz2oPnXUR+I?=
 =?us-ascii?Q?0BmRbnfqrchOd+tjFXeo4pAbc9bnk9vSzggeaeO8njW7/Wuvu2ys1gGhHzoC?=
 =?us-ascii?Q?4bhr49h2shQ2OwmqKv6avOALwPM35jTidAIXa+St01m4LfpALDtbwrAUkajR?=
 =?us-ascii?Q?46ewJriW9ME9VEs7WqoWSVz/fMe9MdSmRhHvmWBDVX0SDXYR03Og+wiyRPEK?=
 =?us-ascii?Q?d8TDoN9NzWpp2aY6SEXCLNyyLXrbwz1etafSFC3u/eEtxRxZNp7yV2fLiDP2?=
 =?us-ascii?Q?HsaYXzqb8HO9upcPupXdY8StoPnP6RfX39tZHyz7M4gowlPO/4Siy4xol/UW?=
 =?us-ascii?Q?oT6Pkbnkn0dOTYoSozMPBRWbL/S4kWXX8lBPAtIa5gsUtQRMFWR4EzRwSt4n?=
 =?us-ascii?Q?iF2qjLbqhZwdy9d9hdQ6LidJF4NvAW38Af7zo5kYEPHnnYjx+LA6tR4YgbNr?=
 =?us-ascii?Q?GziNx1NwTplk2HL9LtFw499jwAbCLBtOhrI3rDdrJKI6/fQJ6VMlRNYO+SXQ?=
 =?us-ascii?Q?5Sbdf0gBHy8bpVgDIOMejqJQAulhVBcBk81oFEGeDNIm5n2t0lVDCU//NFuF?=
 =?us-ascii?Q?anzhIlxYzLO3bNAGxjPn+H4FqbqQRpYKRejWNil3LknnY2BXj9iBUXDr4ImC?=
 =?us-ascii?Q?9gTz5278Yph5XDNQnLjxd2WO1PB0l73sZ/g9B3CnX1zu6qDD/XVCtzyMNLsC?=
 =?us-ascii?Q?1guCFsqLWKvgPTSomxLv4hqxvOgU/FX9sKM2jDsdcK4SLJemnagPw+Sdmnts?=
 =?us-ascii?Q?tkTodKQMF0meDiWClB9WhY8DIPlXZ4PnNgDB42WEj0+j3ReHjruXB4KOEWUe?=
 =?us-ascii?Q?gC1RuVt6EBL2gQaImYPmCqsDt46a9kZJDCKaPWN1/VvihR3Euaxp8qJPyr7n?=
 =?us-ascii?Q?b9OejToZGEv3P22IJd6qj+bIL7TlhPSxvxU/rU/zXsO6FQtDuBs4h+JWCxQI?=
 =?us-ascii?Q?oX8dRKCfISSE6PDaLqrrj7/W51GsIXk90uEKtixR2on50KX/v5GTr6QtFFB2?=
 =?us-ascii?Q?w7BaDqVosCoFQIwZu0E=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(10070799003)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xDgnR026SnbVP+GCXYBaUJn8hfCXMcSegBczi8HDQnGgxF0GoRvvmzDm65/e?=
 =?us-ascii?Q?+LXFmmT+vxiXKh0a3wE/Q0nlt4W+aZhye4be+qWwk84sDZruG6rgqNs2ZLHX?=
 =?us-ascii?Q?b2WQIPSYxLNdU+eoj+ZZg1zDlu7kQfdjOMUB/uGKQazUwdkzK7uxHAxa8deo?=
 =?us-ascii?Q?Mx4XZqDB5na2DUFHuQHm9nxy7TT9tS7J8S3N5CwAVc5lDiV1RiLdQ0SKthKR?=
 =?us-ascii?Q?wXvyMKGAvjCjNJ6lejthaS+b7/kkvwYzFopygjXLtwyavySTYWxwppg2k7bL?=
 =?us-ascii?Q?+Hull31V+B05IivK6Z8srU5iK5KEI2IUJcL19tI0xvYWaGAhwmDbn9ftqRyo?=
 =?us-ascii?Q?wvq1mHDM63Ex6VtUpgXLx4lqMZ6VYIjuZ6Bn1J4BVy03F47tDU9yysxaB3It?=
 =?us-ascii?Q?8SUpwiHSwJ0kfbdF/cFeWn6/sSJJPcveACN0lTTQd+l95IKdumvHNOjY8buH?=
 =?us-ascii?Q?0+1xsd6zVgSOkRBx/0+KdeK208tAQkFc58KmGYdu8vHif5C9SXr4LThTPvI5?=
 =?us-ascii?Q?gtkk516yjcMA6eNta8uHNZV9Df9OwBTE1v8CNUelYJeHKOIB+knxcG+Fl32C?=
 =?us-ascii?Q?89T/OcxtmMEp9iXimmGw4MKYf8fcnKeP4YCSy5eLb1+uO/FBjT7owyjEEtyJ?=
 =?us-ascii?Q?6fS2TKJ9QnR4PyC5yGT9VbYAbcKp9B2a/x6AdCZkKlXHC0IQx3icfbXLHmqE?=
 =?us-ascii?Q?C7Ladi5Q9dQkAZ6XGT50SCTP7EUbZAYL2kG4ZKDDrsm23Hy3hZqg6hy+BKF1?=
 =?us-ascii?Q?W9iZasTu3EhcMILMkNvNBUAxFbx9IbMZlwotcTMESeplf0Vq+x86M94jNbwk?=
 =?us-ascii?Q?LAoB7JC+AClC9eO4r158nVOJlbPAmDffr//6LdOiPxJ6Eo8HmXNJdfSqh6mI?=
 =?us-ascii?Q?fiuFPl8cvL9AnRMqsBO+GhwfM5IPu6U+2qMicvMu8+ppzgGri167jcpCAJNT?=
 =?us-ascii?Q?7zjh2jNHfuLilpRHl/XDCpZKfOG5LSFvOM+3RA5aOsU23vO7EjMM5kPkjFfU?=
 =?us-ascii?Q?yrur5YPqGXmEU2Tf9hSy7JBDFJ33gxn3JtXpeqVbaxJYqcMF6uM763HR5434?=
 =?us-ascii?Q?famUd413CO9/fjsPavN1v92I1Bh4DLjhzr4/KjohDc6Nyi2VRJnxDvzQga8a?=
 =?us-ascii?Q?xs2Gg+TfX/Nw4rTvo8Q28g2WOny0knZVhSXvZI60hICBp2HRz5pio96be9Pm?=
 =?us-ascii?Q?4hRwuFoih5wVcSgV8RZtYU+wyPRapouKPzVR06dakxJdEMDLBi5M2FvG60Gx?=
 =?us-ascii?Q?Qx2H89rkwMOmN7hdwhCmqG1iaP9JNib28WitqSrFxMU1KOxtyEIWCYAbPUtH?=
 =?us-ascii?Q?oPMuBbyE0zXO5nIbq2sSxHo7uEnYqddeXUai0A6mv37xcyyxyxscnulWGf2H?=
 =?us-ascii?Q?YyFJjmMqm6e2enxvOnMkjlciVnJhyeNS01Mr2/iFDpTwI1c5/xG9PWiNhQ2Y?=
 =?us-ascii?Q?LC0N6iSCNJrvtzVNrxQuo7uNDPW+9W6cYj92oMiaULn06SK9P2pmQGWp9QNH?=
 =?us-ascii?Q?X9XmxOEqreaIU4TCn/QZyulHv9qgozbTIgrRaiH5bvVxUHg2TpgTGYkjcU7+?=
 =?us-ascii?Q?ChxQg9pN4JRM1DOz8s+CKAnQPsCZeiMr/PJ2arZDOZ52QyxRDBUB/tTp1oeK?=
 =?us-ascii?Q?DSe850hl5Lh8ETetRhxGA7dJQ5Y5lV7c0uKLYafwUTdTgHz7oMky/7a6pT7+?=
 =?us-ascii?Q?l6dbl2z48hUPoeFqjZNXNAiu3YnEZ/5DPSnOQWGNvkgfyvO1qN/csLjGPTk6?=
 =?us-ascii?Q?Wg9Oz/f5xuJsC9r4ts/J9IHanxjClje9dEcxnjvB6MiaqVeRxTMe?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: b64b4d2d-377a-4f30-1ff4-08de5b57e622
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2026 14:50:21.5001
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F/gT6w6xaQ9IX5dXuBt3Oc3P0v3HMYMtJVW4H0IEBOTlcTfNxTyumPM99Dhnul+gNCh7Tim1Kb+MHwtDptRT/A==
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
	TAGGED_FROM(0.00)[bounces-16280-lists,linuxppc-dev=lfdr.de];
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
X-Rspamd-Queue-Id: 25F027DE48
X-Rspamd-Action: no action

Extend pci-epf-test so that pci_endpoint_test can exercise BAR subrange
mapping end-to-end.

Add BAR_SUBRANGE_SETUP/CLEAR commands that program (and tear down) a
simple 2-subrange layout for a selected BAR. The endpoint deliberately
permutes the physical backing regions (swap the halves) and writes a
deterministic signature byte per subrange. This allows the RC to verify
that the submap order is actually applied, not just that reads/writes
work with an identity mapping.

Advertise CAP_SUBRANGE_MAPPING only when the underlying EPC supports
dynamic_inbound_mapping and subrange_mapping. Also bump the default BAR
sizes (BAR0-4) to 128 KiB so that split subranges are large enough to
satisfy common inbound-translation alignment constraints. E.g. for DWC
EP, the default and maximum CX_ATU_MIN_REGION_SIZE is 64 kB, so 128 KiB
is sufficient for DWC-based EP platforms for 2-subrange testing.

Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
 drivers/pci/endpoint/functions/pci-epf-test.c | 172 +++++++++++++++++-
 1 file changed, 171 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/endpoint/functions/pci-epf-test.c b/drivers/pci/endpoint/functions/pci-epf-test.c
index debd235253c5..1cc630a2ee75 100644
--- a/drivers/pci/endpoint/functions/pci-epf-test.c
+++ b/drivers/pci/endpoint/functions/pci-epf-test.c
@@ -33,6 +33,8 @@
 #define COMMAND_COPY			BIT(5)
 #define COMMAND_ENABLE_DOORBELL		BIT(6)
 #define COMMAND_DISABLE_DOORBELL	BIT(7)
+#define COMMAND_BAR_SUBRANGE_SETUP	BIT(8)
+#define COMMAND_BAR_SUBRANGE_CLEAR	BIT(9)
 
 #define STATUS_READ_SUCCESS		BIT(0)
 #define STATUS_READ_FAIL		BIT(1)
@@ -48,6 +50,10 @@
 #define STATUS_DOORBELL_ENABLE_FAIL	BIT(11)
 #define STATUS_DOORBELL_DISABLE_SUCCESS BIT(12)
 #define STATUS_DOORBELL_DISABLE_FAIL	BIT(13)
+#define STATUS_BAR_SUBRANGE_SETUP_SUCCESS	BIT(14)
+#define STATUS_BAR_SUBRANGE_SETUP_FAIL		BIT(15)
+#define STATUS_BAR_SUBRANGE_CLEAR_SUCCESS	BIT(16)
+#define STATUS_BAR_SUBRANGE_CLEAR_FAIL		BIT(17)
 
 #define FLAG_USE_DMA			BIT(0)
 
@@ -57,6 +63,9 @@
 #define CAP_MSI				BIT(1)
 #define CAP_MSIX			BIT(2)
 #define CAP_INTX			BIT(3)
+#define CAP_SUBRANGE_MAPPING		BIT(4)
+
+#define PCI_EPF_TEST_BAR_SUBRANGE_NSUB	2
 
 static struct workqueue_struct *kpcitest_workqueue;
 
@@ -102,7 +111,7 @@ static struct pci_epf_header test_header = {
 	.interrupt_pin	= PCI_INTERRUPT_INTA,
 };
 
-static size_t bar_size[] = { 512, 512, 1024, 16384, 131072, 1048576 };
+static size_t bar_size[] = { 131072, 131072, 131072, 131072, 131072, 1048576 };
 
 static void pci_epf_test_dma_callback(void *param)
 {
@@ -806,6 +815,155 @@ static void pci_epf_test_disable_doorbell(struct pci_epf_test *epf_test,
 	reg->status = cpu_to_le32(status);
 }
 
+static u8 pci_epf_test_subrange_sig_byte(enum pci_barno barno,
+					 unsigned int subno)
+{
+	return 0x50 + (barno * 8) + subno;
+}
+
+static void pci_epf_test_bar_subrange_setup(struct pci_epf_test *epf_test,
+					    struct pci_epf_test_reg *reg)
+{
+	struct pci_epf_bar_submap *submap, *old_submap;
+	struct pci_epf *epf = epf_test->epf;
+	struct pci_epc *epc = epf->epc;
+	struct pci_epf_bar *bar;
+	unsigned int nsub = PCI_EPF_TEST_BAR_SUBRANGE_NSUB, old_nsub;
+	/* reg->size carries BAR number for BAR_SUBRANGE_* commands. */
+	enum pci_barno barno = le32_to_cpu(reg->size);
+	u32 status = le32_to_cpu(reg->status);
+	unsigned int i, phys_idx;
+	size_t sub_size;
+	u8 *addr;
+	int ret;
+
+	if (barno >= PCI_STD_NUM_BARS) {
+		dev_err(&epf->dev, "Invalid barno: %d\n", barno);
+		goto err;
+	}
+
+	/* Host side should've avoided test_reg_bar, this is a safeguard. */
+	if (barno == epf_test->test_reg_bar) {
+		dev_err(&epf->dev, "test_reg_bar cannot be used for subrange test\n");
+		goto err;
+	}
+
+	if (!epf_test->epc_features->dynamic_inbound_mapping ||
+	    !epf_test->epc_features->subrange_mapping) {
+		dev_err(&epf->dev, "epc driver does not support subrange mapping\n");
+		goto err;
+	}
+
+	bar = &epf->bar[barno];
+	if (!bar->size || !bar->addr) {
+		dev_err(&epf->dev, "bar size/addr (%zu/%p) is invalid\n",
+			bar->size, bar->addr);
+		goto err;
+	}
+
+	if (bar->size % nsub) {
+		dev_err(&epf->dev, "BAR size %zu is not divisible by %u\n",
+			bar->size, nsub);
+		goto err;
+	}
+
+	sub_size = bar->size / nsub;
+
+	submap = kcalloc(nsub, sizeof(*submap), GFP_KERNEL);
+	if (!submap)
+		goto err;
+
+	for (i = 0; i < nsub; i++) {
+		/* Swap the two halves so RC can verify ordering. */
+		phys_idx = i ^ 1;
+		submap[i].phys_addr = bar->phys_addr + (phys_idx * sub_size);
+		submap[i].size = sub_size;
+	}
+
+	old_submap = bar->submap;
+	old_nsub = bar->num_submap;
+
+	bar->submap = submap;
+	bar->num_submap = nsub;
+
+	ret = pci_epc_set_bar(epc, epf->func_no, epf->vfunc_no, bar);
+	if (ret) {
+		dev_err(&epf->dev, "pci_epc_set_bar() failed: %d\n", ret);
+		bar->submap = old_submap;
+		bar->num_submap = old_nsub;
+		kfree(submap);
+		goto err;
+	}
+	kfree(old_submap);
+
+	/*
+	 * Fill deterministic signatures into the physical regions that
+	 * each BAR subrange maps to. RC verifies these to ensure the
+	 * submap order is really applied.
+	 */
+	addr = (u8 *)bar->addr;
+	for (i = 0; i < nsub; i++) {
+		phys_idx = i ^ 1;
+		memset(addr + (phys_idx * sub_size),
+		       pci_epf_test_subrange_sig_byte(barno, i),
+		       sub_size);
+	}
+
+	status |= STATUS_BAR_SUBRANGE_SETUP_SUCCESS;
+	reg->status = cpu_to_le32(status);
+	return;
+
+err:
+	status |= STATUS_BAR_SUBRANGE_SETUP_FAIL;
+	reg->status = cpu_to_le32(status);
+}
+
+static void pci_epf_test_bar_subrange_clear(struct pci_epf_test *epf_test,
+					    struct pci_epf_test_reg *reg)
+{
+	struct pci_epf *epf = epf_test->epf;
+	struct pci_epf_bar_submap *submap;
+	struct pci_epc *epc = epf->epc;
+	/* reg->size carries BAR number for BAR_SUBRANGE_* commands. */
+	enum pci_barno barno = le32_to_cpu(reg->size);
+	u32 status = le32_to_cpu(reg->status);
+	struct pci_epf_bar *bar;
+	unsigned int nsub;
+	int ret;
+
+	if (barno >= PCI_STD_NUM_BARS) {
+		dev_err(&epf->dev, "Invalid barno: %d\n", barno);
+		goto err;
+	}
+
+	bar = &epf->bar[barno];
+	submap = bar->submap;
+	nsub = bar->num_submap;
+
+	if (!submap || !nsub)
+		goto err;
+
+	bar->submap = NULL;
+	bar->num_submap = 0;
+
+	ret = pci_epc_set_bar(epc, epf->func_no, epf->vfunc_no, bar);
+	if (ret) {
+		bar->submap = submap;
+		bar->num_submap = nsub;
+		dev_err(&epf->dev, "pci_epc_set_bar() failed: %d\n", ret);
+		goto err;
+	}
+	kfree(submap);
+
+	status |= STATUS_BAR_SUBRANGE_CLEAR_SUCCESS;
+	reg->status = cpu_to_le32(status);
+	return;
+
+err:
+	status |= STATUS_BAR_SUBRANGE_CLEAR_FAIL;
+	reg->status = cpu_to_le32(status);
+}
+
 static void pci_epf_test_cmd_handler(struct work_struct *work)
 {
 	u32 command;
@@ -861,6 +1019,14 @@ static void pci_epf_test_cmd_handler(struct work_struct *work)
 		pci_epf_test_disable_doorbell(epf_test, reg);
 		pci_epf_test_raise_irq(epf_test, reg);
 		break;
+	case COMMAND_BAR_SUBRANGE_SETUP:
+		pci_epf_test_bar_subrange_setup(epf_test, reg);
+		pci_epf_test_raise_irq(epf_test, reg);
+		break;
+	case COMMAND_BAR_SUBRANGE_CLEAR:
+		pci_epf_test_bar_subrange_clear(epf_test, reg);
+		pci_epf_test_raise_irq(epf_test, reg);
+		break;
 	default:
 		dev_err(dev, "Invalid command 0x%x\n", command);
 		break;
@@ -933,6 +1099,10 @@ static void pci_epf_test_set_capabilities(struct pci_epf *epf)
 	if (epf_test->epc_features->intx_capable)
 		caps |= CAP_INTX;
 
+	if (epf_test->epc_features->dynamic_inbound_mapping &&
+	    epf_test->epc_features->subrange_mapping)
+		caps |= CAP_SUBRANGE_MAPPING;
+
 	reg->caps = cpu_to_le32(caps);
 }
 
-- 
2.51.0


