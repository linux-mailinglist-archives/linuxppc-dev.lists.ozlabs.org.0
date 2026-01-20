Return-Path: <linuxppc-dev+bounces-16057-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1BDAD3BE0F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jan 2026 04:53:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dwD284kY9z3c7n;
	Tue, 20 Jan 2026 14:53:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c201::6" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768881200;
	cv=pass; b=VmMcTDkE9ufP7J1MbDT2iTHCM4Jj4/IpRfgdytGTcnAr2FkwAaxvQP3eWxAJ/mgVNagyOCr2rSzP7Vc2jkR0YRRIHOACZBo9pA1duvaD8FCaQXtbymzSiI5yr84ZqgT6DB2/Pm3XNkcbtoNq3lRTI7DraoIriOgNiD9a4rntqAQxrHj9dI/9MY6hqp5WoOBqgP4pe9BE4g+mJYK7s9VaiOnwe2F2OOlvHJosHH0DdLGvmr9R5gCWw6gE+7qQZuyRA0CxIbT/MnOb7ZrA3CozR2XslhuWFPZ72i/Y6xKRZ3e5i9zHqU5IYvQoaUEqctEnqVA9D7yBiq0k1gAJp8v/WQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768881200; c=relaxed/relaxed;
	bh=A+Y0edS7H4RpVlf3Qg+MSjWHEcBUkL5L8aYYsp7vqfI=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Li5QMZLly0x43VUeeQipDUI2ZsDSQYKIMIBkazDDasC2zUMRwEdltnSiYL7zi5q47GnJ4tUqrCZkrgeVoEpPykssXWuCP9mLpqZLS63DOjb1/NZtzaRGnFLhHIYFOkFipGjDxe97sXlhHsUbWy/nK7g+8515syRdRShRjBGqiku25WuhaTK5I2jH4khLYET+ZoNKI0j8WCruShczhS1GIIVAU8os9sPi5hMBN/sW3YrO1+E1XpRTI3gKH+7VbOiKIoBMQO+E8b0ARYm5O4DcHQqMRIY96Dwz2QEOiPnOeiW8lc291QoaiRyw0r3TKGtrVulymt/TB9V3mr5118F23g==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=Aga9JmVa; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c201::6; helo=am0pr02cu008.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=Aga9JmVa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c201::6; helo=am0pr02cu008.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazlp170130006.outbound.protection.outlook.com [IPv6:2a01:111:f403:c201::6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dwD28034kz3btw
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jan 2026 14:53:19 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PrvYlEPLMhQz//QqLgmrnI79Q+hBvIG6HxoTQWwZG7+xd2xnjIaaIrIGuOMFgNpYbFivFj+Af18paYgiNbQlvE6kuJoU7d7HFP/bnsJvPxCIPWFipJFaSpOb4DHIsdsKdyFILjRWioRa52qxQeWJB4whm7B/vvnmkJuaojXUD+LVGqYw7y1VLWGXo3tFpqrjivt8jVAql1ax44b8PiTJBddnd4YZ+vNhwFTukdEIdUX28a4mlhF4LOAdeuFGcrU/uRuqMhTlMXpxJFyctN/b4pExOvoHkfrh1FOP9s+O1aRmyM4PaGLs43XPVPiyOgFEDVfQaXMzWRiF3pp7gXELhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A+Y0edS7H4RpVlf3Qg+MSjWHEcBUkL5L8aYYsp7vqfI=;
 b=mabdKQzaE/P/tK5O8S7yfyMEe1N3HSkZpD0xbVkaJt3cr18U4wRdsf3lFcOG/D+9RM0wy0QwI7DWza2AXeXBue+FJZq60ZcR4gdkosh9bMWsS9u7xjZWUrhxGFDk4zpvCd4x7NKVjHlHB7K9FLv2UML7BVBVwdgG0Mwm+/xtPyTITZvbh+tjLWM+P2n51lJw/2UknwzIjYnuJ8x70v6aPQX9NWn/d4AIHegs6Mqrho1XLbCdzkJIGfWvS+dky3mtL/eDYjq4EU5iMlmSTs+dyw23VYgonT8wzdZqo2impVCV4p5jJVOM2GaawaeCIt5SGBprTW+aRXl1KUAixGXhBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A+Y0edS7H4RpVlf3Qg+MSjWHEcBUkL5L8aYYsp7vqfI=;
 b=Aga9JmVaCuqeCBJ7TF2rhU3hAdR/xVvt7v0+7nDVHD7QknZTWE/umRwCATjODJKUfY7kZwMJjUWFHXs2UaH6aQ5tHRyH65i3YyfTzYzQs6QU9Z2Z5AyfKZBsXlQB048u37sjpsL+9n94NpKGKGlLXBrXKpdptyI29S3IEixnsEht1dRgS5QKHlYZ1GGoqUzvfCw1s2Oh098IUcSUPiPdmQEy9l/nGJHEXD31ofE6biNhxkw0eR4HHGVQjIg4EP6WW9UC4ZMSQ3ug1gV2I9aoPHlQqCJeVsMfF486NCeqPuurIbAszL5TkOKx59LlXza9PXxTq+pWFUThYChC1vK3LA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by VE1PR04MB7343.eurprd04.prod.outlook.com (2603:10a6:800:1a2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 03:52:59 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b%7]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 03:52:59 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 2/4] ASoC: dt-bindings: fsl,sai: Add AUDMIX mode support on i.MX952
Date: Tue, 20 Jan 2026 11:52:08 +0800
Message-Id: <20260120035210.1593742-3-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260120035210.1593742-1-shengjiu.wang@nxp.com>
References: <20260120035210.1593742-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5P287CA0074.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b3::8) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
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
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|VE1PR04MB7343:EE_
X-MS-Office365-Filtering-Correlation-Id: 059d02f4-0208-41d7-491a-08de57d76701
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|7416014|1800799024|19092799006|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?INMwBxks+PEGdxb2vInJ5om737ceTQE3BdGYyBURX0l/v19SrgPFCAtXqf9e?=
 =?us-ascii?Q?ty98RTM1kdmO/Vj1wm6Xyr5mCnWuyu/JA+3ew5JDOCtzfAySf17wzioHhLY7?=
 =?us-ascii?Q?EpX8x1ROeecN9RuCWFfh3s4cL2VGeJ2PDywspi+teFhENSVR5ATSL/TYBxID?=
 =?us-ascii?Q?Zn1G3E56Lwlmz+3tOjbG5ucdh6e/ApzJKtE+yV/iwVviTGM4LGUm9SkvFItv?=
 =?us-ascii?Q?7aD011wrVFQzweZ07sWJtvQ7fPWf/vZ+UH983ywMsTpf3PzJ7NXykC4eawJG?=
 =?us-ascii?Q?FlIxeaPKY4UxrU1kTkUTg4VhNcK2arxCDFz0xfvit1H1rijNZN37TE0HijhO?=
 =?us-ascii?Q?b9Mep9agk65fIPAh7GrVfde1MHd4lLnwTG39a4sCk1QNsbBI1L7fHnReQbi7?=
 =?us-ascii?Q?/gBCncOCGytK4e4boTYVNWRFSM74k2ATU5JYS7rbQnbOrawzMoy9FZ8K2V+M?=
 =?us-ascii?Q?zTC5xtClpA2GRt3qEs9uPVZM7qC4fwNXbwDj8Vk+QOjtb3kI8myHqY5keiQ3?=
 =?us-ascii?Q?HY7Mdkes6sunaKoc9HKh/3V6D2mScevWQ/I1ptYDCvhi76xv3gZHhEFAai8w?=
 =?us-ascii?Q?MvPMTsFKnpWmy63rh9cTOgnD95S/mL0ow/Fbll0ptKT4s8k13e/UAPsYovch?=
 =?us-ascii?Q?bbxsIYQP6Zow+3/i9jupbG5fkChf+h1ViLqZzCiKcJ7ny2WfFIvJfPJ0T7Lp?=
 =?us-ascii?Q?dTic0TmcB3gQUXEm0cXQRIyuY3oZjitgY89DCA37MUdSeN0MBV9vwQ6q1YiZ?=
 =?us-ascii?Q?rmx1AJLYhUx6TcIH3yRXbzRavEr13b2e5yV0EGmxW2qbe8MzTgSDmh3bf5Fv?=
 =?us-ascii?Q?hL0Y0sV67Vov6EClUXuiqTb0tzWgIqULu5j2dZFqScNse0q9jhJO7wz7djcR?=
 =?us-ascii?Q?ovUIh+An6GQ3SlzaRgeiW3zD4XWEulXvv1BDrmY381eAf+P41mI13jVbYMLV?=
 =?us-ascii?Q?pBfVYGrhThP556Wto+w+HsMGJXLnQSIASWZOBJzmE+ET2MCCkQ/I+EDeNgcD?=
 =?us-ascii?Q?LiQeVLr3VFJkJ9jsHGd3Gv0syjW5q0reqkHedbua6x97fL/NR44zqttsMgJd?=
 =?us-ascii?Q?W5yIMRCD8J2CqH5iZS9WftICPDODM0T/Hx4AJqO3gBh/jSe8uKJsGhV4jM2X?=
 =?us-ascii?Q?alHPvyi8EyyNLaPdyU7Yi24cWsf0Acw8xdumLqp7PiFngZD/ETF1k5k7QfoE?=
 =?us-ascii?Q?fgdguppFrxsso22Hl2uTzKlDg6NXQIJIn2D4JbG247wlS61n5eqfeJARZO+8?=
 =?us-ascii?Q?915JkPygacVC7+3+lyQTZRV0LYxUDPmffcUTRbi/OjYEwQgQwWg1qZSdl9tZ?=
 =?us-ascii?Q?y63Ch5Q75zs82rTFC+4ze4MQoxPpQef4c4OhnrAumMfH+Lvg7mEcxyDqTmdt?=
 =?us-ascii?Q?x/ETMuYpXDuFVIEMABCNH4q8PiUTVJS5X20gyFWYL3ugeeV3bEmDZRgRUvH0?=
 =?us-ascii?Q?44aqSqOOBdDPWccoRRV7xvsKcnqpRAYZDkaDCds2ImUhGGiwTdI1uWl9s+QH?=
 =?us-ascii?Q?U+VP9pgt5XOjPpbi39AFxp4zgwtQ8Yq0a/nFTJ/a6Qa6AhIFjnzNv1OxsuLz?=
 =?us-ascii?Q?Iey0qE8Psq2ssBb2aMRhWiwRz/8DCDIN9gMMKoph2M7A1n498udcD3JleiGW?=
 =?us-ascii?Q?HGpXVqTWVmlgZy6Wlp8gT3m4/SDD2nDWLeF3m7en1SL1?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(7416014)(1800799024)(19092799006)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TqWKePzcO6ATed4HXYEcpCY4eFWepbiESx7t5JLasdauNzBrOS9o9fdERU5q?=
 =?us-ascii?Q?9XFMLav3QwZewLLAUTff1V7fwC1WGi4ObGzPCaxS/t9fEIR1Iw6ei03EOLR6?=
 =?us-ascii?Q?yrYE2piCsYelaCiBomdVy1hE1WuN241np6JSPCrBunlGpLpmZivGxtdKGPfR?=
 =?us-ascii?Q?WahbB08CCpXk48ykvSJRv+Ur4B5rOKIDxBYZWDpmeiaJORMmnKYe6HGT5VHn?=
 =?us-ascii?Q?gKDEwiLAJNoh1lowG6iilISEnRfpS4l4kAGGWXdh1YvgvTnkHXANAkWw2SBK?=
 =?us-ascii?Q?f6t43IHNZiGDomdS4ZShVU+aRJoaMK6xj2byuhuDEW/ryf9Ak+6j1FFzhtY/?=
 =?us-ascii?Q?vsEAzeqt3ed5o7RF1tAZ11nng8/XqR+vFMIvusoxCpvoA2k8GYrQ2smuakLP?=
 =?us-ascii?Q?7yG1WlahW+n5uQkSVrySikeZa6zRrN3wWbtouQla5UZu7Rw+km4xqATYTQFe?=
 =?us-ascii?Q?Bw0VUGhzx1levrAHvXu62qMGvrW6SK7P3bk1zQ/qmbh+Zd1jv2ZlG82PIbcl?=
 =?us-ascii?Q?YmXv5nbqAgs0quRFeWtLQgGYHjyGB5wNLzx9teenPfPOzLCrRrymnunTtDlr?=
 =?us-ascii?Q?QvQArkGn6S9jRP1bUv6dO59mtTJWzP/oRApZCG5BMriy1Gx5ZbSkyWP7n61Q?=
 =?us-ascii?Q?RKjNVYlzwrPjr9njeK53Ixoz333lSvG9ea5pxp1njs90NlnXOOsNM7Op17lM?=
 =?us-ascii?Q?t6TmqQLsKVu1LM+4tfSccU3ZzWXgRSGE2qboU8I3zPiVYIlvc9HuE1dyiY8z?=
 =?us-ascii?Q?ijLxvttKwX6PQ3um7WHg1ouvd0e8O9LiWQwqBxbJF4INEsd2CkiBiAoEJ7Aa?=
 =?us-ascii?Q?bc4j0hHgQCP+mha7e6QhFerQqb82ERfOs/5m0uMo4X1tZrb3AlkaYEAd7dc7?=
 =?us-ascii?Q?DBAnu9MLSUsqdeKyKcGAYsiaK/067KM/UAG/gcn1hMcgDJENdL55XP8Hk5Ho?=
 =?us-ascii?Q?ILwUz3bGCxNrBRumQOL4ysnqPcwW6RfQsdXLU9oKgvqCZZvLrojS5kHKc0v7?=
 =?us-ascii?Q?Spz1CoLyOtdvOOPQjnFo3J05/vDVZyFeD91jHoqh4cofElBdEQH+uuHC3Mzz?=
 =?us-ascii?Q?TpMsmjIZruODGFNKfgW/CyMlSYl1N8jRrbGf84QW7eWhS7pTXqU7031CR9Fb?=
 =?us-ascii?Q?XyE0hl9JryzvS4g5kM5Ue+YzewrQt6MzOf77kZDvCIapX3KhxGY5RjWVMd5E?=
 =?us-ascii?Q?GqUSqstcnhfB7VKO3fcFGJcKfsY6MmlzsMoGSyvhYJ9J+Ou9yraxr6RySMhZ?=
 =?us-ascii?Q?dfssr1MgVG9VUPhpONxwkDOgeQexcxBNqMJyBOsocysZv8SQzkeLdr287al6?=
 =?us-ascii?Q?gbWRcJHgEXOEk+EuBpMmxoiPrXwxPW/Cne3kjaTiAfggnelYQ+BdeQ2PNaKR?=
 =?us-ascii?Q?ZWP7MJ6Kc3cVy+twYmwMZKrtUt83rybbtEJwUjtCx+FqR3wCXaEMDXoimXqc?=
 =?us-ascii?Q?AvggweIsiJRmQWbNIfnKTeE2HR0syqQKH/5Jw1rmnhgQbX82aCysBz/6bmmW?=
 =?us-ascii?Q?O3Smya7mjZZfjDGPve+RBC1CvLF6VkrozT5v2u8Rx/xg6iLxNGbnQiJlAbUc?=
 =?us-ascii?Q?nzdGR3EyexPIt15iGTtpAg2WPObEfylNmi++QOSw/aqg8NWmb300lGbmnJMs?=
 =?us-ascii?Q?N+qaEyOtFat9LhRn/YxvNRHO/+NS2BvQ98TlGqB9+hnuK+hklao2l3XMailT?=
 =?us-ascii?Q?dj9R1fXw+uKknoe+tyi33FI4W8FlmodbAnGW9jWw+qVQbXLPM4k6IkbPrSDs?=
 =?us-ascii?Q?w2kytfkMew=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 059d02f4-0208-41d7-491a-08de57d76701
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 03:52:59.5116
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MgYmTeDndMnULsmjcqqNPMFmtxgIOQ4lAprzzLWuP4ZnuyiQSyXjAHA44vUnutWLFvVvd+6tzwYGC0j4YB4dSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7343
X-Spam-Status: No, score=0.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The SAI can connect to AUDMIX, but AUDMIX can be bypassed or not on
i.MX952, so add 'fsl,sai-amix-mode' property for this feature, with
this property present, then SAI driver will try to config the setting,
fsl,sai-amix-mode = <0> is bypass mode, fsl,sai-amix-mode = <1> is
the AUDMIX mode.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 .../devicetree/bindings/sound/fsl,sai.yaml       | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/fsl,sai.yaml b/Documentation/devicetree/bindings/sound/fsl,sai.yaml
index d838ee0b61cb..7808c324eebc 100644
--- a/Documentation/devicetree/bindings/sound/fsl,sai.yaml
+++ b/Documentation/devicetree/bindings/sound/fsl,sai.yaml
@@ -133,6 +133,13 @@ properties:
         - description: dataline mask for 'rx'
         - description: dataline mask for 'tx'
 
+  fsl,sai-amix-mode:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      The audmix module is bypassed from hardware or not.
+      Bypass AUDMIX(0), AUDMIX mode(1)
+    enum: [0, 1]
+
   fsl,sai-mclk-direction-output:
     description: SAI will output the SAI MCLK clock.
     type: boolean
@@ -180,6 +187,15 @@ allOf:
       properties:
         fsl,sai-synchronous-rx: false
 
+  - if:
+      required:
+        - fsl,sai-amix-mode
+    then:
+      properties:
+        compatible:
+          contains:
+            const: fsl,imx952-sai
+
 required:
   - compatible
   - reg
-- 
2.34.1


