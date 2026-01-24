Return-Path: <linuxppc-dev+bounces-16275-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kGvsF0XcdGkV+gAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16275-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Jan 2026 15:50:45 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8BA7DDCE
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Jan 2026 15:50:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dyyQn2X0rz2yDk;
	Sun, 25 Jan 2026 01:50:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c407::1" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769266241;
	cv=pass; b=fIoG4RsbsSOgiEGK8j4L7uGCt0bvNzuke5yZUCkmg7/4IDjtd7N+RrsW7DXaVG4quLsxZGj2wLRVKx/jCLm3dSHU+abTCW9KxzTBVV0FnI70YxC0ipOeF5uYy8QvDjh4WY414uc7vVbCnc+lF4QQGo17K7O2WormxdLh9ELUR4joq5XhKcx3LTbtPXcP85dOUJxEEA1bNVov/SkB0VEyGjAaEezJtfgDZsZAwVm+gqgR0ii2E+GwbqAqempW0AMr3ZPxzJzEIVgp6BxX56IRUYwfIjoEP3+L/G0SxIDQUGIjhRXqtjWMUPUbxxXjfyqU4efjKJ4cu0DDM9Wzl2HdmQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769266241; c=relaxed/relaxed;
	bh=hRgnrBdv+3IYRbLCZEHVeO3G8GxK+9y8oHoPBQhJ23s=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=kh0WEkuYnqPKES8yn2qs2nHx86kA7Nq2m3TMp8FioX5p9g5fICdRFI2ZWPZXQ4/GO5k7gC0WDYRScjYhsbBXxClwldgs4zfx1movrFGMo0tevKVwnKxdxRM8C49hV1JEDLf6o3WBoxwjHIAgZY377QYtKPPqAn6Bp1whrJO+DtJfAvech94GsD69B+kGiCEtuG4PJzzEkHdW2cjth7ODKTpahIxiCqQYg4dRlfNOzcwkDbHnWmdedG50y1bfWGnV5+1THZcMtG5hVB+W0RHhMkypeW6pFzCHYFUE1WPg/VbISEmw5phmAIba4EmwAx0nns2wM/NywahzZURGiBehjQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; dkim=pass (1024-bit key; unprotected) header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=lHC+9UNS; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c407::1; helo=os0p286cu010.outbound.protection.outlook.com; envelope-from=den@valinux.co.jp; receiver=lists.ozlabs.org) smtp.mailfrom=valinux.co.jp
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=lHC+9UNS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=valinux.co.jp (client-ip=2a01:111:f403:c407::1; helo=os0p286cu010.outbound.protection.outlook.com; envelope-from=den@valinux.co.jp; receiver=lists.ozlabs.org)
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazlp170110001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c407::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dyyQl10Vkz2xlF
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 25 Jan 2026 01:50:38 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MCcXaDjVBTvoM2GUnou9CJmsixAvoqsU/qK8ArUivSgA6kRvpctOBUwSSj2YwfbJN1C8Caq9fN9ySCa8evuhSUJM+vIO0+Lj5hJK0ALGrIGT/lhWJxl73Igul7mi2V8zYJFKmULVu++IXVYLnZxh739yX2Ktu3sSytj2yoztzCiKE//Fin6eEIW2SRGQ+Hn89J1cVrZkYqsqWKiEscIwyO6sSmnYbKqjGuleSfe2tj8S1SxitDwmIHm2HJ3hgww/xA7KEZCcl3q2EJtnmHmKAvIzQEVy7JkuT/jGHyvhV9NrPVQjjIkRL+EqrOTZ+i8jAzCTp3AvMfM7+AdVdYlgPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hRgnrBdv+3IYRbLCZEHVeO3G8GxK+9y8oHoPBQhJ23s=;
 b=R0N7RPR+8qbxfzoWh+sgpkQwxAdVEswSl6IznD4PuhisNfuFVm5xr8lcpLJdBqP6Zx5hGhi2NjwX2n+EtF7Y0MO2rafwqXKH1K370evwNQI3rCKJxskFUvJYLn0PtKEIk1xaJdSYLiimmVHDVdH8/Er238CkleGO2siiEc/qZJFFm5eJNw4cwkh8AhPd/sk6Qw0I4w1Y2w1acB0qTXoaffi/NP3Xn1+uBWI0cr1uZ5iYpa7rxm7osLmihT4QbI3okPZ5G0KgAmUNvTPiFIRjpqk1QWxOQAA9VWhQWnwxpY/dWTVykHjyMLBbdDgUavF+MEOP1J1K3A9bqmdjBrY7kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hRgnrBdv+3IYRbLCZEHVeO3G8GxK+9y8oHoPBQhJ23s=;
 b=lHC+9UNSUrPwQfLfuI2CjTye97wOXBgOW5jyZTex6j+FYrSgfPdl5TYVF4p3nRAirjfkazTO8MZePzmRYHQM/WmRlUbvGxFsMbBna7ik92TBFjNlV7a6TvxjXy6NtESFiuUzXe0hBqS0E0XwU1GK/aUN6gqP6RXEE/WyK06ELW8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYYP286MB4692.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:19c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Sat, 24 Jan
 2026 14:50:15 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%5]) with mapi id 15.20.9542.010; Sat, 24 Jan 2026
 14:50:15 +0000
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
Subject: [PATCH v10 0/8] PCI: endpoint: BAR subrange mapping support
Date: Sat, 24 Jan 2026 23:50:04 +0900
Message-ID: <20260124145012.2794108-1-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4PR01CA0014.jpnprd01.prod.outlook.com
 (2603:1096:405:26e::17) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
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
X-MS-Office365-Filtering-Correlation-Id: 4b698580-b333-4a55-8af2-08de5b57e26c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|10070799003|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TSArqQxaBkAsYc/xqhkIc2RPGZU32RFU2IGjnniFxA7tUeNplPz9oQsE4f5T?=
 =?us-ascii?Q?bdYoJDAF5eDya1gLKs1L2poiEhm7VQvLHKxqbQvvJiKjA1vTaqRUQbD9bqUg?=
 =?us-ascii?Q?g+PJgS/Ri4V/CrtH9YKdLymqWp5GcHCV4fKxDwrydy4Tih5gBoJ1PhHphs1p?=
 =?us-ascii?Q?RBCgh/1f/tUk6UgM58x0B1QUxByl218d+9gYCRnOalAMlS/wOsLh9SAc7NhO?=
 =?us-ascii?Q?Kca+rx+4vpr4uaa7+0YET+wBbSz024Cwx1TqP5C7UpqlOSgPviAAUU6T6u9L?=
 =?us-ascii?Q?SH0ETN8yx2hEweyg3DkYZ9wSizgSgbZ2a4ghhBKIFiTrnT9jBTcC5FXxV2SB?=
 =?us-ascii?Q?mJvJci4th9xuZhSj/ZAqq+5tAYsI4QonFjY3HjMjPMzi1tUhpug9hZVaJUWd?=
 =?us-ascii?Q?hPXlqj9Br6+TAiwaa+JqXPv6DbHSDEt/tcLu8R+/wI3QTb6sqlWlIjaTJALX?=
 =?us-ascii?Q?LoMHmcqehjwbzoc+/ixnKEooauvJC8AFv2uAh0yFiTtK9MbC9u3Aaddzvhz/?=
 =?us-ascii?Q?2R28YICSHvQGIQiBRYKeh5Z0UvPgrVTO8BiD2uADWUY2FgNiw2VohhDi4xUo?=
 =?us-ascii?Q?KBfZ8gV2TXWR6sg1LCGe3Ts7LjU/CwOSxK9RxNMSx7ZDh3KO4HfiHeeBNjqk?=
 =?us-ascii?Q?JdRmMk0HbF/ePj7w1TJ1GK+YeNSskMyEAfHVRkgpMX0psKNIKQNpNPwGhNpC?=
 =?us-ascii?Q?NPk7ZXNE5aHTwFWBGm0JD8bOB4a7AfKltV7GQKO0n5gy4QQySyLtlQs5+95A?=
 =?us-ascii?Q?mWpjd08H5aNiVWF1HxlLATS9XMZr/lHydJrguQJhU0eN3vl4WnAMzh3f5rlC?=
 =?us-ascii?Q?u/sA6B7eZI7eVEF/HARXbzHMc2kAClFSE1z0aZ/gHMuad+5NK7oZQ1gtVi3y?=
 =?us-ascii?Q?SKrDXFnkax+/OBWDHlxFi+Ccbgj8ZThtkpiH0bGn/EvodO3Udfy9zAPuRBXA?=
 =?us-ascii?Q?FpYhrp2mYxmOU7EOu20/4At8OWyxNc9h79WTNQFO9TIjjokSsuj6ej4nYsE/?=
 =?us-ascii?Q?kGF4L+TsxlryhgS+kQixgLztmL24Q3cy/zXS8uGxkGV7TqCAu4OWtx4Cvv7p?=
 =?us-ascii?Q?OcQo2JYULPmib6xdnmVo+GIo//3cI0O89kaUpYOUAhOA3yn1PZ5Z9iD3hfIE?=
 =?us-ascii?Q?cJmeS0rTZaCPLwNs5abfZPRUl1LdFZa6CH5MNruo0qSCddfUUm09/OE2YaS8?=
 =?us-ascii?Q?lrQGH/mKaIxrIhjBoA06cgue4stCkf5R0ozUi3jfuZEEG2POSKjsY3mbZbxx?=
 =?us-ascii?Q?cCOWMG660QBrqlf+gWtAuz088epHYA6Cx64HYoIuxOgDFGyRothEc+DdnRdG?=
 =?us-ascii?Q?2VCIzmhj/b/TqM13yuj1ujwcS60RjZ1ZlcTgMgTnRzxttYZgDaQ5tW4B9wXL?=
 =?us-ascii?Q?W1iPf/Inri07H0Ue2CwUrWVVO+nzcVOrqQQ33bkN0oafwzJ+IrLwWrMjek5N?=
 =?us-ascii?Q?ycoTyDwdCki7gF43vq362QJBsF2vdplRaya3yuJlxDs/us9gCIW19dO7HUuX?=
 =?us-ascii?Q?rBZEMGLReqAf9VN0vmYfarox3u6fBNcrqhigQ1qMaAj/Q68pzIvDvYQddAPW?=
 =?us-ascii?Q?U1ztcb+pqIp2KD/SchM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(10070799003)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?L6/mMpx3FkPYoAz5ON7Y1z+4xiYdzb8A+lQ7PpIZNhnL8fgvxE5ErGOUTbAw?=
 =?us-ascii?Q?jqtEdffswXsDXwlxp50q2wr3dxtIKl5xDqXXN80efvtABJ9NvmEy0/l++L5R?=
 =?us-ascii?Q?SGDQDrQo+VkTOW7BMbIpKumkHA4yekQpm9lYSK5lE1Ssw8VgTxuaPL2I5UPT?=
 =?us-ascii?Q?lgURe3Add2xb3yAxX77wKYngP7kWrTjfxJRkJcE6soCKQVdv5NYubYtKlVo9?=
 =?us-ascii?Q?TEaYTIKMH8M/cdSQWNY8EZ50bALAgQhE1EGyEpvXoJVxOkl/cmKBrjCXTYHI?=
 =?us-ascii?Q?jYhaSkIzKGYt2/bc2mj6zQtSZ4XutaRK2DJVs6hH7OVZiKRckGLxPw61Bxfm?=
 =?us-ascii?Q?7RIPV89wJe38hHnkvjwm+siPQO/+h/cE+XsmXYdV3Se4r//WdLV4TuwF4vUJ?=
 =?us-ascii?Q?Y9wmgRg1/IffQmM4L5X0zubA70j7nNo6uFzBYbD1SeTWxtGSVryq/1IGDX5l?=
 =?us-ascii?Q?OtjNqeRhLzXmK73F8M6jDbYwp5sXYb4QY+ocqBw4ODI2X6ROSlnt6d3lCsJ+?=
 =?us-ascii?Q?w6PcGNHGCgWci2Ljqewg8z3Rf459LW5Ji6Ibq1/xAwHEQdmodzhnIKSLNy+p?=
 =?us-ascii?Q?O0vOgXu2A59oPBjqjiB9dFo1Z6537LwZzRHF1901A5KMYRwofy6+fVc0qry6?=
 =?us-ascii?Q?0S5w8M5p11nyHCIEsOFNXfvouPYbwfpcJEArZ8Z7YQH4ZBXs3+UeUmDrMJqk?=
 =?us-ascii?Q?Dm1truvM7VYo6gsLE2Ke9JIPzcjzLfleYIuIQgy8hKgvLio/yWgsgDqhNk+t?=
 =?us-ascii?Q?U7sE52qbRPs06hbmywZufbVfRmyLPshjV2hnN9kcLWwFJaT4gFpkPkw+7jum?=
 =?us-ascii?Q?P5NLrE5XLEvGZ9UWWqxnqMUa/KDKQDJNHoqQDW7xivXrhSXmLfdkP/QEwt72?=
 =?us-ascii?Q?wkjdkj/xmrjxwsD8K6Ff4EZeoO1RXNSU+T0FZ9zqzVSqavpGxVA9CvI+L4Zr?=
 =?us-ascii?Q?gzRTixK6Pb167mIQ9uAbo1SnnvxmyYjmTt5rK0dSSOQ18Dj3pK6f3prht1k+?=
 =?us-ascii?Q?Cp3zi6fZlDiNFh6aLWqcbqjraD2EB64chAimoD14R6RpARAVrMTxggNCw/jc?=
 =?us-ascii?Q?3C2mV/WakEQJXge1FTQSVoS0+b4fgv8dYUQlMps7PCzBKjv91Ejbhylg87i9?=
 =?us-ascii?Q?xfyJb2R+zfaWKG89zeimq1RWuwqRrhslmRbRBlj6y/AEg439jAX8W8Rrjihz?=
 =?us-ascii?Q?J4eRVbSVnnc804KVStK4+RrSVvHqR+reLcX3IQz3ghESE2ned4iKj5syxGqc?=
 =?us-ascii?Q?BUH5/yKE7Ur5R95V28u+zdEaFYw73F8c0V8Sx/sZtiLyu4ZBkuvStHbFOVZo?=
 =?us-ascii?Q?nFnykPQv7xWhe+sbVP5KFcUf3mM7Mksg/i4t09Q4UFoI6ItFU5FTpTz5a4CJ?=
 =?us-ascii?Q?NaWBUD9V0wXFVJfbqebEGvtMUX+bq80wo2n/VZCizJOtBnse9t7vxW3gKPHZ?=
 =?us-ascii?Q?mhq7+gKtJxCpa4xpyIsMW5uv5NOuX7am7RlCogeIfGJUPlRCdPDis5LX83dI?=
 =?us-ascii?Q?b84kfKHH+j1vuyOMC31BSYsTKHBzuHhpWJ/moHtBM4zTXmaT0TkW6x7J0203?=
 =?us-ascii?Q?u/pz6jZb7KF06MLS1mcOijrt8crC+ZVhvQYlgBoPb0vWvASnbU3qbnrgsoIN?=
 =?us-ascii?Q?B4WqhHp21dpmuEtRxLCpKUnBsyxGjnWaEi9aWjNTPZ0zh9jmSaSP+fKIbus2?=
 =?us-ascii?Q?B/GvTMGhxN8JX4JaSfwQuyJOrzMU4pOVP207RRJa78RncjQ3MVfnp9gX5EXi?=
 =?us-ascii?Q?5824qJzBgAwWo7ApacIySM20OGLu+stg7nvb9Jug/MAE4UNdsHRX?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b698580-b333-4a55-8af2-08de5b57e26c
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2026 14:50:15.3111
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yc8nqa+oApPk2OrplNJMXf+qUsCX52OQ36C9iE7JKpxJgwD0RKln87osRaN+kI4fqNeoKvzJ8RA9yc4tFm/9OQ==
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
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[ti.com,nxp.com,pengutronix.de,kernel.org,gmail.com,axis.com,sntech.de,intel.com,renesas.com,glider.be,foss.st.com,nvidia.com,socionext.com,vivo.com,163.com,rock-chips.com,collabora.com,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.ozlabs.org,st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[den@valinux.co.jp,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16275-lists,linuxppc-dev=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[valinux.co.jp:mid,valinux.co.jp:dkim]
X-Rspamd-Queue-Id: 2F8BA7DDCE
X-Rspamd-Action: no action

This series proposes support for mapping subranges within a PCIe endpoint
BAR and enables controllers to program inbound address translation for
those subranges.

Note: This series is a spin-off from a larger RFC series:
      https://lore.kernel.org/all/20260118135440.1958279-1-den@valinux.co.jp/
      The first user is the pci-endpoint-test, and the real user will
      likely be epf-vntb for Remote eDMA-backed NTB transport, demonstrated
      in that RFC series.


Motivation
==========

(This section is identical to my earlier explanation at:
https://lore.kernel.org/linux-pci/waapztvy6jyjqtfcoo3rbgvagi4z3p5afw6x2acgf5bxatcui6@nkodhtqqtetr)

The motivation for BAR subrange mapping is that some EP platforms
effectively have only two practically usable BARs, while needing multiple
logically independent inbound mapping.

For example, on Renesas R-Car Gen4 Spider, 64-bit BAR0 and BAR2 are the
only practically usable BARs, since BAR4 is only 256 bytes. epf-vntb
already needs two separate regions (config+spad and MW1 for the
data-plane), leaving no spare BAR. Adding ntb_msi requires yet another MW,
which simply does not fit unless an existing BAR is further divided.

In theory, some vNTB regions (e.g. config+spad and dynamically allocated
memory-backed MWs) could be tightly packed into a single physically
contiguous BAR region to barely make it work. However, it immediately makes
features mutually exclusive (e.g. ntb_msi / ntb_edma cannot coexist), and
the layout becomes extremely fragile.

Similarly, for remote eDMA-backed NTB transport, the host needs separate
inbound access to the eDMA register block and the LL regions, which are
distinct local address ranges. Without subrange mapping, the only choice is
unnatural layout (e.g. dedicating one BAR entirely to eDMA register block,
and another one to everything else that can be packed into a single locally
contiguous memory region), even when this is barely possible.

So while some cases might be made to work by aggressive packing, they are
already at the limit on platforms such as R-Car Spider. BAR subrange
mapping allows these features to be implemented in a straightforward,
loosely-coupled, and extensible way on platforms with severely constrained
BAR resources.


Patch layout
============

- Patch 1/8 introduces dynamic_inbound_mapping feature bit. This can be
  used as a safeguard to check whether a BAR can really be reconfigured
  without clearing/resetting it.

- Patch 2/8 introduces generic BAR subrange mapping support in the PCI
  endpoint core.

- Patch 3/8 advertises dynamic inbound mapping support via
  DWC_EPC_COMMON_FEATURES for all DWC-based glue drivers.

- Patch 4/8 adds an implementation for the DesignWare PCIe endpoint
  controller using Address Match Mode IB iATU. It also advertises
  subrange_mapping support via DWC_EPC_COMMON_FEATURES.

- Patch 5/8 updates a documentation for pci_epc_set_bar().

- Patch 6/8 extends pci-epf-test to support BAR subrange setup/teardown
  commands and advertise CAP_SUBRANGE_MAPPING when supported by the EPC.

- Patch 7/8 adds a BAR subrange mapping test to pci_endpoint_test and
  introduces a new uapi ioctl (PCITEST_BAR_SUBRANGE).

- Patch 8/8 adds BAR_SUBRANGE_TEST to the pci_endpoint kselftest suite.


Kernel base
===========

- repo: git://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git
- branch: controller/dwc
- commit: 0ecd890e3cf5 ("PCI: dwc: Rename dw_pcie_rp::has_msi_ctrl to
                         dw_pcie_rp::use_imsi_rx for clarity")


Tested on
=========

I tested the new BAR_SUBRANGE_TEST on R-Car Spider boards and verified that
it passes on BAR2. It requires the following unmerged patch as a
prerequisite though:
https://lore.kernel.org/all/20251023072217.901888-1-den@valinux.co.jp/


Changelog
=========

* v9->v10 changes:
  - Added a safeguard in dw_pcie_ep_set_bar() to ensure that
    dw_pcie_ep_ib_atu_addr() is only called when updating an already
    configured BAR with matching size and flags.
  - Added BAR_SUBRANGE_TEST coverage via pci_endpoint_test and kselftest.
  - Fixed the commit message for Patch 4/8 (dropped the line "subranges are
    sorted in ascending order by offset").

* v8->v9 changes:
  - Dropped now meaningless source code comments, which should have been
    removed in v8 (feedback from Frank).
  - Added motivation text to the cover letter and to Patch 2/5 and Patch
    4/5.
  - Rebased onto the latest controller/dwc branch (see "Kernel base"
    section above).

* v7->v8 changes:
  - Drop the explicit submap offset and use_submap fields. The submap
    array order now defines BAR offsets (gapless decomposition). Commit
    messages and source code documentations are adjusted accordingly.
  - Drop the no-longer-needed dw_pcie_ib_map and add ib_atu_indexes field
    to track iatu indexes used for teardown.
  - Move inbound mapping teardown into dw_pcie_ep_set_bar() to cover all
    BAR transition cases.
  - Centralize feature bit advertisement via DWC_EPC_COMMON_FEATURES.
  - Added a (epf_bar->num_submap && !epf_bar->submap) check in
    pci_epc_set_bar().
  - Note that some Reviewed-by tags are dropped, as the changes need to be
    re-reviewed.

* v6->v7 changes:
  - Added missing check of dynamic_inbound_mapping feature bit in
    pci_epc_set_bar() when use_submap is set true.
  - Addressed the remaining review comments from Niklas (patch reordering,
    splitting, and source code comment/documentation refinements).

* v5->v6 changes:
  - Added a new feature bit dynamic_inbound_mapping and set it centrally
    in dw_pcie_ep_get_features() for all DWC-based glue drivers.
  - Updated documentation for pci_epc_set_bar().
  - Dropped a needless and harmful dw_pcie_ep_clear_bar() call on the error
    path.
  - Fixed "Bar Match Mode" to "BAR Match Mode" in a source code comment.

* v4->v5 changes:
  - Added subrange_mapping to struct pci_epc_features and enforced a
    strict capability check in pci_epc_set_bar() (reject use_submap when
    unsupported).
  - Changed DWC-based glue drivers to return a mutable features pointer
    and set subrange_mapping centrally at the DWC midlayer.
  - Split the series into 3 patches accordingly.

* v3->v4 changes:
  - Drop unused includes that should have been removed in v3

* v2->v3 changes:
  - Remove submap copying and sorting from dw_pcie_ep_ib_atu_addr(), and
    require callers to pass a sorted submap. The related source code
    comments are updated accordingly.
  - Refine source code comments and commit messages, including normalizing
    "Address Match Mode" wording.
  - Add const qualifiers where applicable.

* v1->v2 changes:
  - Introduced stricter submap validation: no holes/overlaps and the
    subranges must exactly cover the whole BAR. Added
    dw_pcie_ep_validate_submap() to enforce alignment and full-coverage
    constraints.
  - Enforced one-shot (all-or-nothing) submap programming to avoid leaving
    half-programmed BAR state:
    * Dropped incremental/overwrite logic that is no longer needed with the
      one-shot design.
    * Added dw_pcie_ep_clear_ib_maps() and used it from multiple places to
      tear down BAR match / address match inbound mappings without code
      duplication.
  - Updated kernel source code comments and commit messages, including a
    small refinement made along the way.
  - Changed num_submap type to unsigned int.

v9: https://lore.kernel.org/all/20260122084909.2390865-1-den@valinux.co.jp/
v8: https://lore.kernel.org/all/20260115084928.55701-1-den@valinux.co.jp/
v7: https://lore.kernel.org/all/20260113162719.3710268-1-den@valinux.co.jp/
v6: https://lore.kernel.org/all/20260113023715.3463724-1-den@valinux.co.jp/
v5: https://lore.kernel.org/all/20260108172403.2629671-1-den@valinux.co.jp/
v4: https://lore.kernel.org/all/20260108044148.2352800-1-den@valinux.co.jp/
v3: https://lore.kernel.org/all/20260108024829.2255501-1-den@valinux.co.jp/
v2: https://lore.kernel.org/all/20260107041358.1986701-1-den@valinux.co.jp/
v1: https://lore.kernel.org/all/20260105080214.1254325-1-den@valinux.co.jp/


Thank you for reviewing,


Koichiro Den (8):
  PCI: endpoint: Add dynamic_inbound_mapping EPC feature
  PCI: endpoint: Add BAR subrange mapping support
  PCI: dwc: Advertise dynamic inbound mapping support
  PCI: dwc: ep: Support BAR subrange inbound mapping via Address Match
    Mode iATU
  Documentation: PCI: endpoint: Clarify pci_epc_set_bar() usage
  PCI: endpoint: pci-epf-test: Add BAR subrange mapping test support
  misc: pci_endpoint_test: Add BAR subrange mapping test case
  selftests: pci_endpoint: Add BAR subrange mapping test case

 Documentation/PCI/endpoint/pci-endpoint.rst   |  24 ++
 drivers/misc/pci_endpoint_test.c              | 203 ++++++++++++++++-
 drivers/pci/controller/dwc/pci-dra7xx.c       |   1 +
 drivers/pci/controller/dwc/pci-imx6.c         |   3 +
 drivers/pci/controller/dwc/pci-keystone.c     |   1 +
 drivers/pci/controller/dwc/pcie-artpec6.c     |   1 +
 .../pci/controller/dwc/pcie-designware-ep.c   | 212 +++++++++++++++++-
 .../pci/controller/dwc/pcie-designware-plat.c |   1 +
 drivers/pci/controller/dwc/pcie-designware.h  |   8 +
 drivers/pci/controller/dwc/pcie-dw-rockchip.c |   2 +
 drivers/pci/controller/dwc/pcie-keembay.c     |   1 +
 drivers/pci/controller/dwc/pcie-qcom-ep.c     |   1 +
 drivers/pci/controller/dwc/pcie-rcar-gen4.c   |   1 +
 drivers/pci/controller/dwc/pcie-stm32-ep.c    |   1 +
 drivers/pci/controller/dwc/pcie-tegra194.c    |   1 +
 drivers/pci/controller/dwc/pcie-uniphier-ep.c |   2 +
 drivers/pci/endpoint/functions/pci-epf-test.c | 172 +++++++++++++-
 drivers/pci/endpoint/pci-epc-core.c           |   8 +
 include/linux/pci-epc.h                       |   9 +
 include/linux/pci-epf.h                       |  23 ++
 include/uapi/linux/pcitest.h                  |   1 +
 .../pci_endpoint/pci_endpoint_test.c          |  17 ++
 22 files changed, 681 insertions(+), 12 deletions(-)

-- 
2.51.0


