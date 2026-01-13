Return-Path: <linuxppc-dev+bounces-15650-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A5BD1A3E6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jan 2026 17:28:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4drF6J1NLPz2xrC;
	Wed, 14 Jan 2026 03:28:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=52.101.125.101 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768321688;
	cv=pass; b=cpY29gXTv7F/eRkB1+38EYz1U6WXPbfmN8YYJFuuUEyYsG7duDKFbeMVU4m+sxybt+i4QHVwipTev3wEnQLJlQk+I1Dv8/Vt6ZYxG/DbOZiJqPmuWbxhUMBTXZgudfyBDi7/7mDrrI3SOoN0xg/D2YF+UGcTrII2qgjTfecUh9BTqxdupe/NppjW7ADxdvfd6hzuu58rdVFK5nRIbNt1itOBMoMjOsJWLWNAV5n1rT/XT6cjn5R6GgZPFBVbydq2ifNcG5bi6xcDkNAur9P7yR+f4dlFMGgaedC1K6bn0toox/Tq/rdiXfTxX15vAUqYpoxCNwPkPT1Y/MZjezB/9Q==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768321688; c=relaxed/relaxed;
	bh=K7s8EPB0DTn3N7kIMNeOjvJAGHqJ8tqtnD6vQm5ahDU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PBgUfN0q35QjlZ0EGOc65CFyMn1dQOf60Utyd93kmtvnXecHaxJ+rnMDDTLYNqHkVOiQtUXExckLUl2HVHTxCCmY6tr0Akba2obYRaeoqI5xo8yYRZTeDpGawWEKOkXKyl7keLpfo33G79ZETV9I4B9FGfS9o48pAqUPeWTs7xC/AwHEEuq9KT2mry8GkYBnU9QDPoUBkSeIDpd4kAjDEnlaw+CPwZQXy5Dq2c7YrOSHH50xpTVz7JJWiM/UmW2pyNUTTsfIL+s4E1Vxh7/RwK0/XLw2M3AcHsJ+AfquSpctWbVlC5RJ1ryAPtqpotKIVKNGlOGwQIxzDla7RU3udg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; dkim=pass (1024-bit key; unprotected) header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=TsdKAJTL; dkim-atps=neutral; spf=pass (client-ip=52.101.125.101; helo=tyvp286cu001.outbound.protection.outlook.com; envelope-from=den@valinux.co.jp; receiver=lists.ozlabs.org) smtp.mailfrom=valinux.co.jp
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=TsdKAJTL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=valinux.co.jp (client-ip=52.101.125.101; helo=tyvp286cu001.outbound.protection.outlook.com; envelope-from=den@valinux.co.jp; receiver=lists.ozlabs.org)
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11021101.outbound.protection.outlook.com [52.101.125.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4drF6G3kH2z2xjb
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jan 2026 03:28:05 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qbR/ejkClaHRXaV5CfsDuFKeHAMFqpQi/+Ns7sffTenqvOJe/PB/qUnkLz5fGVmKimk0uZ8og2qLeQje1f/agogrG2lr46SSNbMSkGOKo8drOVd8m0Wtm1DqZckr9h2azmalUcYmo9W65TxazX48HG4iOUPV04d0kxFo+cjr2NoXq6A431KxTatOWekxF4Nu6j+TXPclIQTvs5c+QNOX8eL9g1ODrDDjClfUioTUAL/onsvMD4W3tW9epiGVTb20GOxm+4xzuw2G0yHVe9Vo2F9HAjNhpkgLqsp8rINo4puW2BiVBMkeZo9OMeLtnVsEZeF50gyuHuzSC991ZU0tpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K7s8EPB0DTn3N7kIMNeOjvJAGHqJ8tqtnD6vQm5ahDU=;
 b=XJc1+DFUkopS02uK1olwaHTZvt0/7fm51BtQRAJLDTL6+psO/aECt6KOnElaw9xS6C3d9koY3I3JyYbqdQAVVDZhR8do89tm2EkK9+CTjz3dPiEleExzKAf8epBydbDSqXQQ+aGc584Hv5FgB0y5jpe4QbE9veEULMMmuww2ghMKHGCxw4MVkNZT7CBlUziGfTLFn6b7ihBJUIgEaW5jgn3D2tJqfC/2TlbHpyXKoOqZMVPjJq3QoBcixVGtNJD5Pzr/Vno4APjMzP9/eSOQTJynlUUMlOQN+HEq4S4srmhGOK6vWZ9Tt6I0AvmHxmrnTO0DM5v6CtYZCFopGNsP8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K7s8EPB0DTn3N7kIMNeOjvJAGHqJ8tqtnD6vQm5ahDU=;
 b=TsdKAJTLYBnxyMyqNtJDo4HxWGifwoZgSYYNT4kGMPhlD1AqzBtK7DdA1bgcmnzhValAgs1yYITH6r/saJgcVobIy0IHSTj874gDQW9zGxbXDIqRRQ1qeJRBHx3QXBVGJI55oyoVjc71FmShg2vbkVWeCb6O4a1hsIMRo7vi87A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYWP286MB2282.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:13d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 16:27:26 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%5]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 16:27:26 +0000
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
Subject: [PATCH v7 2/6] PCI: endpoint: Add BAR subrange mapping support
Date: Wed, 14 Jan 2026 01:27:15 +0900
Message-ID: <20260113162719.3710268-3-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260113162719.3710268-1-den@valinux.co.jp>
References: <20260113162719.3710268-1-den@valinux.co.jp>
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
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYWP286MB2282:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a0311c9-ded6-43f4-a0e8-08de52c0a3b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nH/fuqEQpl/omadkdYWuJFxQOm9cQ/mwJV5nIkIVraKeOEk+l3+BGnw2wodN?=
 =?us-ascii?Q?GB7g/GUAx/YpcsLUk5d0SLf/QaBVGNZVxKAlclLz6DB4010MEyUNidTPe8B0?=
 =?us-ascii?Q?l8du2/OxTtGOrJh6Al4g04vI58JdGb161MnKztuNiEdOXb515l96xBHj+vrK?=
 =?us-ascii?Q?TVnhzPay4mRLGz3b76sJxVBv7hXWb/6MfdFxKMVhb/9ZXhPwApgMr4lMyTtT?=
 =?us-ascii?Q?M2KfY8zCKtra85IO/dQF92dNJrUesoV7mtsZnb/tW/a8KLtBKmVbfFInp5Us?=
 =?us-ascii?Q?T8MW7qWzVLUlC0y02cLmKxjR66ol33CnjGLb4RqQQOqFngjhZRAPHBz0kZEA?=
 =?us-ascii?Q?LpzJyEHCrgG0U5q5ljkgY28wcvNP8JHHJrIDEH/XZKWMtq8tNhy+/jGdSEA4?=
 =?us-ascii?Q?pp+8DxxUzaRcZnZsp77gLPTJSAP9g4F8lDFm86HPkTlsAN2tcw3RGKz79B+n?=
 =?us-ascii?Q?ELJ+f7c82hnD32dD2GXeZzapBQ4PSifReO525pk9rkeUwXpZnGNZEArwZcCQ?=
 =?us-ascii?Q?ttCe9sxzNmy9mgzlTJMFQNvDU0ifQBlw7lNvPXLXmqSOXapCq9RibDDAg06z?=
 =?us-ascii?Q?cdZRr9BzYvo9y54/X5y8CAUzsIFc9+aAcrgnDCxGHQywwJrl0QHLIjwPSamL?=
 =?us-ascii?Q?9gUwbNAn0tRpe98/iyNmOZ2NqcDHXcMpMN7/s1lGDNo74qQT9Ndqbo+rCimZ?=
 =?us-ascii?Q?/g7RE9JwabJUVt1tAPvnXLVve6Tl0QdgtDzJYSzmLPCvz7/Ve2+kwZrRYQLg?=
 =?us-ascii?Q?HTlFEgB5kYBjeeR3tqTS12oF5Ur+ZfVJu1WI5U6u2TWQ9e1TTuoqBw1NjRWc?=
 =?us-ascii?Q?JrZgQSbFC0sxGr+62vFFc+X9BJX+mvVBItpb0qNrHu7f60vlfG0mW0MRVFh4?=
 =?us-ascii?Q?VgPLvFmj8U58VpEJr8VSst2Hndi8Hg1nlYH4RiSLnsw8RObAxxV2Cqrlw8UN?=
 =?us-ascii?Q?X4VxjhSRqYjWBn0ZzihIn/xVQAJAhFutdtaKZ2DJ7e0BabnOFvbiFtYgx0jG?=
 =?us-ascii?Q?Ug+gU21GG+FMDbiJInl6kofbk40yOhq52gYyzDNMxdFso4wVo5fbNk96xPNl?=
 =?us-ascii?Q?8xNqQIRHK+xtCL21ZDtj8AxT+GeFcpaVyTUaQt1FCWxaziCY59hbfmPUDGTg?=
 =?us-ascii?Q?vlxFYORFPFxjoiQYO6Bg9RJ8VWiz0JPcCggz5ZHtTFGtsJOM/+trq+DVqpEC?=
 =?us-ascii?Q?o30z9oTkcFr9Lg4MQPBD1wfm3e5IIBk+LptSh1BXLwPPpV5kw1MZ5+vF2Iml?=
 =?us-ascii?Q?3O+2oHu/Cxz4BrljFgYL3fVJZoVDPPQ0a+YBEUlO4GmG73Z93PY1bAy8REy7?=
 =?us-ascii?Q?75avwKs9mHh6EWZ8cSMf+TRQP8m++gEyGXZD576orursyf7JvYhchvqFDaSf?=
 =?us-ascii?Q?LILff+0QpQXAM7ldkOT1Iy6CDJALKQFxhH41exR9z5+EhPJZktxoq4DAJg68?=
 =?us-ascii?Q?bj8gjtfE4dgTzpZiNp0ajrHMN/vd2OzG?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VJZP2iVysseweiMGmIp9O8ko0uha5JWoR6CSwI6qlhu2ynleBh7ByXY18Her?=
 =?us-ascii?Q?9lwGaBPLpclY4yCdPsskI5pMGJ1nnXP8jLBCrmMjur2atWInTT+ZsvIectSg?=
 =?us-ascii?Q?u/j0azgJOuUOsTpKrlj05L/rWsjzz8Z8gnACJxP+RJiBR/0Epk7z7nvLn69K?=
 =?us-ascii?Q?aD8jzo+dypMgh8Orhm/3ZNW9WjCnULAvkK3Ag6PoGW2GZeQBPx7OcKs+EhUU?=
 =?us-ascii?Q?Y4qvoJtjhCFVkZ+CDC2QXnt7gU1VbXkcgxsMuKDVWsGxttcSNMHrCeiiXjGQ?=
 =?us-ascii?Q?GcPC0+dOteOdzTMfSyEVIU3/KDh5OhUK/cEkhACKW0A6eBiH3oYWaPx1BCAL?=
 =?us-ascii?Q?BWTt/pPEkN8zssSFLlISlaJ6kFPwU+jXmWDFRjK20fZvWS2Al3H7icw24Kn/?=
 =?us-ascii?Q?xuU07qUWNrPSuOR3bQcnvYRLkspFqcGTjKsRFrfeby3j8XHUw00GE6mc+d4+?=
 =?us-ascii?Q?PwqCtK1h29wGEV724C0CtTcfDXHzA4/x3e2GWc68we++bjjafO1sCyAdstxY?=
 =?us-ascii?Q?+VT7ltZsL9F9jwjVGpOwldpBHSbxyYyERKRRqPUWYX8oa5MRVuQmp4cSCA24?=
 =?us-ascii?Q?GjbKWacjTGWldSLSh2a4dvqyHpYDcfDhYyxXdsniWbxTMv6Qg1fnth6pGrye?=
 =?us-ascii?Q?Hp2fBoQfB4QY8ysapztjgeEnt+kiGfznqSY/8X2zqqfgBLQWx9vMpf0b9+xi?=
 =?us-ascii?Q?P2us0Q56ZKgWkWYiBR1fWj51NVYmmHpBZPc3OVRGEpHx5UjMW06CLUOBqHfb?=
 =?us-ascii?Q?meRn2NHhXOPTmL1+gSc0CpAvloV3fQ0mQEl7c88YC2VCMEN2N+/CNYeFNYMm?=
 =?us-ascii?Q?9xFawS3iNRRYQ1c6QU9JhRosb7sPPJaGcpMi7loIsfEeQvtffxNBtyp6l4Zw?=
 =?us-ascii?Q?NDLs8VsTxo1l6qsnkn+68FIt7izRIcUgWKPxdbZPfeRfgPpPwY4jcAcQIRVm?=
 =?us-ascii?Q?s5qPlmNGTeSpnipCA2j/NoEpmc1ujrSzHWYzjAWQEZPWBvGnPam43cse9vx5?=
 =?us-ascii?Q?FxvHDhHvWmnSQw/7TCdXG4N0b5lCe8p6BEj5FQn8f7xmKxvET0Q+FL7KueKU?=
 =?us-ascii?Q?V3xT3sEtol4kH7FAdy9JXlCPcBhww5qfo2qMr8/bxGCZE0NPa+WXkA0jR/7n?=
 =?us-ascii?Q?mP1JLHL22vMMJcOp8zoDCRTO3wNL3yLpHlWP0qFH4/CKv+lI5AwCs7a/GiB4?=
 =?us-ascii?Q?AEkfxnZoD7m1k7FpcnILnw6IY0ZHY50rXXx678ht04uuBG07gJQfWKkZXhuO?=
 =?us-ascii?Q?LLuS0lbBoxCg9Ei1V7RC6ui1ZDh5zYDRUb2mQkQLzQXmh26zve0kI1toODiF?=
 =?us-ascii?Q?VPCnBLVBdJoT4rVJk8CpOFc3uvPELmW6P14mfV/I6NfDB6T37phnmk6RdcyW?=
 =?us-ascii?Q?rAVufhPBzUjer83qxhHctM5il6HhxNy0DOt5lCiTdow2wsPN0+XfdomrEvUo?=
 =?us-ascii?Q?geS7DZuEDbV9tL6ApjNoIdcbXZqz/2b0G0d3hDxyelAt3NuBH1M9+4Jl855S?=
 =?us-ascii?Q?WGmiqGWJSD+lZwGb4otshADH1oq7LrIjbZ1FB/47jWAc1MymGS34LudFnFZl?=
 =?us-ascii?Q?v/Bk8/pIeJl/J10El4JLEn1h9k49sSwkt2Znq5XRRM0NPQfh8L15jjF43bAo?=
 =?us-ascii?Q?JUTOUgOgu4k2rOfipLuLIDEcxkFVN2psyeJlOh/iOj1247q6Gc77zjyG3tOh?=
 =?us-ascii?Q?/UwdZLpp98HKC1cA8UQvWTNfuCJ73cYlUaONxMpw1xptYEsrKWySygvDhrzP?=
 =?us-ascii?Q?WOi5ALfYphNzeJ3RiUjEMNIAPLUs9ZJNQ0Dxf3HKnDUzQKvtaMqC?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a0311c9-ded6-43f4-a0e8-08de52c0a3b2
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 16:27:26.7162
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O50oTvB9OmpSlYZXjphwamx5mNUbcGscNcmhjEuJcIiKyY+Vp/h4MuVPyykZ56aS5tpmwN0DCBPFvGS32wIFVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWP286MB2282
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
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

Reviewed-by: Niklas Cassel <cassel@kernel.org>
Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
 drivers/pci/endpoint/pci-epc-core.c |  5 +++++
 include/linux/pci-epc.h             |  4 ++++
 include/linux/pci-epf.h             | 31 +++++++++++++++++++++++++++++
 3 files changed, 40 insertions(+)

diff --git a/drivers/pci/endpoint/pci-epc-core.c b/drivers/pci/endpoint/pci-epc-core.c
index ca7f19cc973a..4870e6cdb458 100644
--- a/drivers/pci/endpoint/pci-epc-core.c
+++ b/drivers/pci/endpoint/pci-epc-core.c
@@ -596,6 +596,11 @@ int pci_epc_set_bar(struct pci_epc *epc, u8 func_no, u8 vfunc_no,
 	if (!epc_features)
 		return -EINVAL;
 
+	if (epf_bar->use_submap &&
+	    !(epc_features->dynamic_inbound_mapping &&
+	      epc_features->subrange_mapping))
+		return -EINVAL;
+
 	if (epc_features->bar[bar].type == BAR_RESIZABLE &&
 	    (epf_bar->size < SZ_1M || (u64)epf_bar->size > (SZ_128G * 1024)))
 		return -EINVAL;
diff --git a/include/linux/pci-epc.h b/include/linux/pci-epc.h
index 4c8516756c56..c021c7af175f 100644
--- a/include/linux/pci-epc.h
+++ b/include/linux/pci-epc.h
@@ -227,6 +227,9 @@ struct pci_epc_bar_desc {
  *                           inbound mappings for an already configured BAR
  *                           (i.e. allow calling pci_epc_set_bar() again
  *                           without first calling pci_epc_clear_bar())
+ * @subrange_mapping: indicate if the EPC device can map inbound subranges for a
+ *                    BAR. This feature depends on @dynamic_inbound_mapping
+ *                    feature.
  * @msi_capable: indicate if the endpoint function has MSI capability
  * @msix_capable: indicate if the endpoint function has MSI-X capability
  * @intx_capable: indicate if the endpoint can raise INTx interrupts
@@ -236,6 +239,7 @@ struct pci_epc_bar_desc {
 struct pci_epc_features {
 	unsigned int	linkup_notifier : 1;
 	unsigned int	dynamic_inbound_mapping : 1;
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


