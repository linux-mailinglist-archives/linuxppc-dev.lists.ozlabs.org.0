Return-Path: <linuxppc-dev+bounces-16417-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kM7ROFVFfGnfLgIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16417-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jan 2026 06:44:53 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC6FB767B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jan 2026 06:44:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f2Q220Znwz2ydj;
	Fri, 30 Jan 2026 16:44:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c20f::7" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769751881;
	cv=pass; b=hE9DgwIGpJ80WiGEyNO1L/0bYwMwFqUAHcTUK/RjD62x5rFisuyzJ8XUMp+lQSVSObOBdEarCJqSzVcD8zEOmUlewncuHrpTKXJnCQrTQKUUudI8MgWQ8qAs7xNzGETj4UrsVi3vNnfTv9ugTcF5TTqRDUP1hFwpTOhTuZMLaZhMaFafZ20mgZsKDVl/+rX96o+T3riSun/pw/OVT9Buu7ofGun7zSgS6ZkegOaSKzDXRBZ4k8lImMtPBZ4psHdhBAB8hvSCMcV9J0fHM4icdZ/J/QT0tSYJXfwgDsDwtMRJjlqIebCQdCrf1zpPGTkMf0n0eUnpBwqCgxSynvPzhw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769751881; c=relaxed/relaxed;
	bh=NeuzcnTqdAA1Zj6sZaA/TgsUA8C8RoXUmLnNpiVGoTI=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hAnVIUIpMMCbtUqmWk7Wxnqe1FshEtg+a8M1RWpEnkj96/w3fa2uDZcekRJlfOZnmzKDVohOWEYa6oMdp6oeQyTuXL9plRMIK1z9E4bcFrVtEv1qAsNP+QFRsmGKSRRO53eX2unmSwmGflDnAHMRQ0fvXWrrUajRDZiyphHmmmAsnp5k73Ix4b+cyz1OBg3dHRc3ZG7VcJ7T0dqNQecgGbxFVYNyEdEiRPCxrMwNBHXej0DhMcvd186KyGtOlMc2faHU01XpFAP7nztetcW4v0d8bYbgoF1PjBh1qjownTlILQG8Lb1dXg7TmmfVFopgBl856mi4soxlz5xMX1iyLQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=T4KaK55C; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c20f::7; helo=osppr02cu001.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=T4KaK55C;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c20f::7; helo=osppr02cu001.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazlp170130007.outbound.protection.outlook.com [IPv6:2a01:111:f403:c20f::7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f2Q2104jRz2xS6
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Jan 2026 16:44:40 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qoy1zy8+QZkD5zqasNjcVqoFNNwJERJ8tVazKJGPhxxMLDZoqmAaPY7gFWjWlU6zYkvengbEWBMcCO9wFNUOdPZHe/JHhgjcxnq5D9NlTBSDonDTZodQrqxX7u0L/mr9VBW1zo9SO5VSlNW1z+kbWe9EVVtwwIrfK+ij/frP2Cl0tBrITmhGT6FRn8/KLTZlI5q5m/aEnVfhX8dEuseopVLGP6+EXkh8bof5sd952t8c3BQhYmbHQgl1zJvGYY/GJLkb4aO6x2zcoNWFRm9ECj9yohdab6R2m1uCa9wOArwccvivza2ZQpJ1/tdJDSkYgHm3v2w1fw544qrP0kjysA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NeuzcnTqdAA1Zj6sZaA/TgsUA8C8RoXUmLnNpiVGoTI=;
 b=sb6b4pRmB6q7yYBqbFJAYJ2XMS97S61bCwnmOiNWHlC1ozYyUNk7RPoS2BqcCwAKj9jjy54U9TITWAh4p7eJRcivTAkIPZKV5aQ+uuOYLTG2KD5kLR60hkXSDnbRiNIsFjwkoBxxc7nG/PNKW2YEPI8WvHVjEQZmjuazvbrF7wFi31zivZkGiEKD9FgyYQMYHVILNprzpiW4weelDAwvhKjSdK/B+L8/0eBQqf1v+m3JszZEuStpyfQiRDDUDQtGUi2ESCwGVaKIRBbOQVG54s18G9nLT3sCcnwqF8hHlUUoAUr1Yc9pgH1HE7j+TFIZ+8xK0D6rsgzYPYViTw0JsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NeuzcnTqdAA1Zj6sZaA/TgsUA8C8RoXUmLnNpiVGoTI=;
 b=T4KaK55Cmlmv1uJLcxKObz4In3fYBNk6FEaLvhnYD+S8xvGl5qI3R744KL+3PPHy+jFr3S4JYRZaseaarbMPymS46gA/l1qpuM9aSItK9cj+GX7mt5hHNd4UcyrLRQEOqBDqRC2kmsEox0pnpTZqSYizlAvrbAR8jAK6oaPoMy6G20ELLTbeRpNeuo2ahPbyl4jZ8iQJkTUMtichWk6Vc5ha+04NqRx4dYJyRnro2WjaoI5BIqLG97e0LZdUKMKCR7CYnWaUQR7nXcKU3gl1JFv8POH2YqHYG0pEXSJ3QEK8s+XgOZEMtnHpDfrUiLL4REs3wVsV4ttUSCBVA0wGDw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by PAXPR04MB8174.eurprd04.prod.outlook.com (2603:10a6:102:1c4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Fri, 30 Jan
 2026 05:44:17 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b%3]) with mapi id 15.20.9564.008; Fri, 30 Jan 2026
 05:44:17 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	nicoleotsuka@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 3/4] ASoC: fsl_asrc_m2m: Start ASRC before DMA device for M2M
Date: Fri, 30 Jan 2026 13:43:29 +0800
Message-Id: <20260130054330.3462544-4-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260130054330.3462544-1-shengjiu.wang@nxp.com>
References: <20260130054330.3462544-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0034.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::10) To AM0PR04MB7044.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|PAXPR04MB8174:EE_
X-MS-Office365-Filtering-Correlation-Id: d7f5c3b7-be9a-45be-4475-08de5fc29b66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|19092799006|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4WFQ1Qlu1SRf5yMWt5uExI44zZQ0s4vGyfFWwG95lxGePcaWXiw6AGe+JUni?=
 =?us-ascii?Q?8dVrafrTDvR/xK1GszSVIg5gYYhzuFFK4NMcGYl8Zv2sEYlOg0BTBm6LkiRw?=
 =?us-ascii?Q?jdWx/p0z2GXEWzRZFhRXw0sXUGqlO3JmFsJK5Z/1d3aYuYPfZLXkwCgIoKDf?=
 =?us-ascii?Q?ljNWotxRh0N5hRr8XJP6DRnuj5yk5ofwY/uZ9gzV9WnX/QW8AC6dnLLbTpWF?=
 =?us-ascii?Q?qcEMrjQ1EZoR5KxmZmuuk+gQi2lQb65ifN6RrYVbJ6j+FsEDlfNic/481Z/u?=
 =?us-ascii?Q?Nq5PPqVRwvbZ5g8x+vvh53uWLgJr1aw7GcO8ApdQieYzk7bM56n64CzCdKjs?=
 =?us-ascii?Q?m7Qus/hmzGSFazpU7bjMiPTIx4w/nfXNUNRxYH5VVBIG/vTtXtUvTUT1wX95?=
 =?us-ascii?Q?2JhPQikyD5hzpJOzj9B1HJoPjGWMDTD43vvkdl5ENbXURssjXHGJGeuV3o79?=
 =?us-ascii?Q?0YYN7WjREoKqTbXsR0qhbPzOZmimBlM+5Kw0FcZFQQJ2X9DtoUfuxc/oqkWD?=
 =?us-ascii?Q?xw3dcj4sGTDZ8KIRelfhNrXuAvzRO60E41o1j0qglHd/zqZuMA1fWAGHwjaC?=
 =?us-ascii?Q?ymSJrL9VCaP5bkv+YVkJEemqEEDALH8q4K4QMpYTEGnYyiB1whdjYZVxfUyc?=
 =?us-ascii?Q?peTPHEJb/K9JVMe2ZyuPF0pKWFD4kEV44JXIHfY3NpC8sh4Ayo/F/ZS2gLJa?=
 =?us-ascii?Q?2iezD4KIDCqyZcRmpINgTHbcIE32OTpKR6F4uhQcl9OYRjUuHSXUiUdMsMk8?=
 =?us-ascii?Q?MqTCeOQyJRL8J7IMtX9t6OnxH+lNVNn4O/Jlyb5/wGWww6JravtN67GOf80d?=
 =?us-ascii?Q?ZhUu8Q4FAnEvVPK9IkTv3XslZgAC4QpbF2/MYjncDgAZZcbvcnG4Pktv9Hqj?=
 =?us-ascii?Q?g55kiQJ4+p7cxTs90ArUOu0B+VsLLRsrvNIhU3I6FnoI417e4rsj6pyCMIqj?=
 =?us-ascii?Q?Wzmns21F5LO8L9EZ40gCLhmNg3QLNuSiRw2QuohIZQPoD1J8i0HrmhGnSF7F?=
 =?us-ascii?Q?6Jg3GV3weCkiCr3NOw4AWYCtrOW7kP5vq/C5JA86NFV+cO+ylIq4P97K79IH?=
 =?us-ascii?Q?j77SopulXBAolgKfqcVlrdxbbSI8+zBBnLzjH0OCLLx3o90qIZmXIzwleT7r?=
 =?us-ascii?Q?nFo/SBM4Y3eP8n63ZuZ1HsLtk9Cc5lcCYE4idpBo3qoqcTQ6UiM3+B9qTPHM?=
 =?us-ascii?Q?d34egavjH3eU+iG6OJcJNvd1nmZTrwM5x3pTSbZ0DKu0+kRVC4HxCFUxdyse?=
 =?us-ascii?Q?mF/1gE8r7oQAudn6PMp/5BWH5JVALBbgpJuEA6hYhGQkWzAPGTT2fLP0oLKb?=
 =?us-ascii?Q?0KUZXGgYr8m2iQW7t9hKEPT3pmAIRL2hG/ninDwOnej41U0+znwH76wktOIC?=
 =?us-ascii?Q?SEMR8edLzln43VVrCZFFKNUW0e6GnqBSTUqLuzyh3BOaqTDDvctdMlwYDxKP?=
 =?us-ascii?Q?UT81GGMUajYaZbUuGXJNiptF0E+Z9CHfANJ/Vyo5CbIwklxJDB74A5AQBu9j?=
 =?us-ascii?Q?+nyGYqg6lFojT2mdlu3+YKWNJsAIjpLvBrkZzbxEPxUHutsU1er9qZGieFBW?=
 =?us-ascii?Q?bGkZj6Eg7iWGZfb2LmHXMwu2ihrJHOsbakKo3ulcAJ4Mv42RMQIwDxGT0rhD?=
 =?us-ascii?Q?tOIwPqOaxKIoK1KXXt4OeNHyRyxrtSSccWBZBxm0G+zJ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(19092799006)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sfRWWXGb/oZKAbQDhQgbtav++zRIVQJXr+Cq+xbKhqzKXfK3H9Cej2g2BUuL?=
 =?us-ascii?Q?DvNCLrPXtp9XWNEYv8xU5datHm1lmsuzrXMCiEMlpgwT4HgGGfjd5wXXNlgL?=
 =?us-ascii?Q?qjWJCEIEcpE4d8cc5O1G5EtRBBLzzJezTKqvm/vJ0P7ObZ6MGmAB4PBIQ/t8?=
 =?us-ascii?Q?otUG9S/vLg80wckuZRB3xUDXK6svfIalIPpFQai+U0jG2bLG6+upvzsfb0L+?=
 =?us-ascii?Q?IjqKRNfHiTxo0/zMfM3Brdm/+KHHNkShfm1HEsXi5GrBAgQM5eaIAtG6FVLv?=
 =?us-ascii?Q?Twe6j5CrgHTnXtGLyh0pVcigKqG7+Z3V6LOThjcWf6dyNS/7yXNwtmZJLAec?=
 =?us-ascii?Q?zfGYCkZfDoBXHy1zYTVHaFPtG9zmFP1+JcusgOFr/aCOLwp1rqwo7ErqdhJM?=
 =?us-ascii?Q?IS7MgZ3fLJxI7QGgltp6ngHiz1r1VCTaX64blc2vO3w+7h5eUDF2xfqIbP6R?=
 =?us-ascii?Q?fRSG8q+F7NcCGp3APTJEl0tZ6FfEpQgD6RxB3fj3LFq+6ENe8tJRGbBVI+B1?=
 =?us-ascii?Q?9p+VyZaxn4O03GfkWl4jZ13cQyDIlmwvE5oTPwWVxXKKHu8kTPrEq8iNdqAy?=
 =?us-ascii?Q?nzIZGMeMFIvFQ927PjN/wpxzwFXPD3sWJNDy0McE8buItwnvopVBMEv/0jxd?=
 =?us-ascii?Q?R2K/71lIKVWQFmv2xfJvBccKOzzlGutMIjvaz3C4pglV8xlQBxreCqVN6Tow?=
 =?us-ascii?Q?7Bc/JD6/ZxHlgwPUncb79EeAvyEsFhSuxDdSv6PIv1PJ06UfilKCJGV3Fwto?=
 =?us-ascii?Q?HLrY2RmRKgQnsxE4DB8wwSTb1A9BfeWXGxphHDf66dLzDLuhE8p1WnnPdzbX?=
 =?us-ascii?Q?spy1XX2WA/gJ0gRXMgkPPk1WqhdaoiEzyM/fJ1xscon2QBLiOXFOAGPLcrw0?=
 =?us-ascii?Q?F1bR/N2zqRyh0NrWRREa3Iktx2m+LHN/jBs55UMx3k5HbGlZblsWOockjYen?=
 =?us-ascii?Q?C2hp+VISc6QL/Dj3WbPwIZQCOEMA2dl0e685muvhmyv6Kf1M78p5ge+V6WPA?=
 =?us-ascii?Q?ioRDaiiKWNP+CnBis05YcqYxZDh4gTni0ZdPV+PxVDKPM+3W90G3B1/DPw2a?=
 =?us-ascii?Q?Z/qC7+wqWoXVPhuh2PKoI4Yv021PHp+Lum4cWe5rW2ag3pfOBWp7QSYYPtZJ?=
 =?us-ascii?Q?naFEAKPO0BiFxcLEj7hv0+66F1rrrAfmGGh8Pt9wiY0KU3Twb3wxmUxf0KLq?=
 =?us-ascii?Q?XlBXtQWNVILHhSCJF+kWaCL9h5iJ57tkGj4n9CO/x4ZKPz0Wq/1pE+zgFA0U?=
 =?us-ascii?Q?EU5AOzg6fPFavMZnZqrjPDF1jbLFXLv8kDNTsvDSAfyOH7nW6eQVA2/uVg+y?=
 =?us-ascii?Q?BC9zUWbAxLQ0ffh3tnl7XSpp27v2G6pNvsK7Ka+tadGfmHZ+qfN0LocAQ8S1?=
 =?us-ascii?Q?ThgVButqns4/7lxOG3aKI3h/hbhdRLkDuLeQfqCZVQsBQWKpbVqMEbUn4I5m?=
 =?us-ascii?Q?lD9ONUL4o1OeFuNCOZKcdTYfqSt+dCjK1WkctFWH0PUDBTPz1NQWMcGEKohE?=
 =?us-ascii?Q?WP0n4xBoGVbTCq+NHyH/BilUm4JDRaoP3tevgsRrN6Gt8/H+JZVbT/dw9AXR?=
 =?us-ascii?Q?S+5k9mUHh0loXfyaglW9PSoCDA1i43DPP1ozVCGNDs+O6U5kpWUPurFs4Ixl?=
 =?us-ascii?Q?MoGkGma1O7DCowmrpZWfk5MaPpl9K7asOJm6w/s1c+B42yy+AtMJyKWfHMjo?=
 =?us-ascii?Q?CH4IAbm37si562dY6oWa6wRp6kS3C6whBm3ziWHw8EJ6zn0ptalIYlWvsuGi?=
 =?us-ascii?Q?3c28DceLtg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7f5c3b7-be9a-45be-4475-08de5fc29b66
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 05:44:17.0599
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3zueoK9SBDg6/cNLNFjMHJu6gVrPrCAzfMUq9sVRVzd48YgIP77vk2FPHp/J7BSRAHO1VG22uXCzBEmOb7Z9kw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8174
X-Spam-Status: No, score=0.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-16417-lists,linuxppc-dev=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,pengutronix.de,vger.kernel.org,lists.linux.dev,lists.infradead.org,perex.cz,suse.com,lists.ozlabs.org];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER(0.00)[shengjiu.wang@nxp.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS(0.00)[m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:shengjiu.wang@gmail.com,m:Xiubo.Lee@gmail.com,m:nicoleotsuka@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:linuxppc-dev@lists.ozlabs.org,m:krzk@kernel.org,m:conor@kernel.org,m:shengjiuwang@gmail.com,m:XiuboLee@gmail.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengjiu.wang@nxp.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,nxp.com:email,nxp.com:dkim,nxp.com:mid]
X-Rspamd-Queue-Id: 3DC6FB767B
X-Rspamd-Action: no action

There is a limitation on i.MX952 that dma request is not cleared at the
end of conversion with dma slave mode. Which causes sample is dropped
from the input fifo on the second time if dma is triggered before the
client device and EDMA may copy wrong data from output fifo as the output
fifo is not ready in the beginning.

So need to trigger asrc before dma on i.MX952, and add delay to wait
output data is generated then start the EDMA for output, otherwise the
m2m function has noise issues.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_asrc.c        | 25 +++++++++++++++++++++++++
 sound/soc/fsl/fsl_asrc.h        |  2 ++
 sound/soc/fsl/fsl_asrc_common.h |  4 ++++
 sound/soc/fsl/fsl_asrc_m2m.c    | 29 +++++++++++++++++++++--------
 4 files changed, 52 insertions(+), 8 deletions(-)

diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
index 5846a2b1f73c..2374577c13f9 100644
--- a/sound/soc/fsl/fsl_asrc.c
+++ b/sound/soc/fsl/fsl_asrc.c
@@ -1084,6 +1084,28 @@ static unsigned int fsl_asrc_get_output_fifo_size(struct fsl_asrc_pair *pair)
 	return val >> ASRFSTi_OUTPUT_FIFO_SHIFT;
 }
 
+static bool fsl_asrc_m2m_output_ready(struct fsl_asrc_pair *pair)
+{
+	struct fsl_asrc *asrc = pair->asrc;
+	enum asrc_pair_index index = pair->index;
+	int retry = 1000;
+	u32 val;
+
+	/* Check output fifo status if it exceeds the watermark. */
+	do {
+		regmap_read(asrc->regmap, REG_ASRFST(index), &val);
+		val &= ASRFSTi_OUTPUT_FIFO_MASK;
+		val = val >> ASRFSTi_OUTPUT_FIFO_SHIFT;
+	} while (val < ASRC_M2M_OUTPUTFIFO_WML && --retry);
+
+	if (!retry) {
+		pair_warn("output is not ready\n");
+		return false;
+	}
+
+	return true;
+}
+
 static int fsl_asrc_m2m_prepare(struct fsl_asrc_pair *pair)
 {
 	struct fsl_asrc_pair_priv *pair_priv = pair->private;
@@ -1281,6 +1303,7 @@ static int fsl_asrc_probe(struct platform_device *pdev)
 
 	asrc_priv->soc = of_device_get_match_data(&pdev->dev);
 	asrc->use_edma = asrc_priv->soc->use_edma;
+	asrc->start_before_dma = asrc_priv->soc->start_before_dma;
 	asrc->get_dma_channel = fsl_asrc_get_dma_channel;
 	asrc->request_pair = fsl_asrc_request_pair;
 	asrc->release_pair = fsl_asrc_release_pair;
@@ -1295,6 +1318,7 @@ static int fsl_asrc_probe(struct platform_device *pdev)
 	asrc->m2m_get_maxburst = fsl_asrc_m2m_get_maxburst;
 	asrc->m2m_pair_resume = fsl_asrc_m2m_pair_resume;
 	asrc->m2m_get_cap = fsl_asrc_m2m_get_cap;
+	asrc->m2m_output_ready = fsl_asrc_m2m_output_ready;
 
 	if (of_device_is_compatible(np, "fsl,imx35-asrc")) {
 		asrc_priv->clk_map[IN] = input_clk_map_imx35;
@@ -1565,6 +1589,7 @@ static const struct fsl_asrc_soc_data fsl_asrc_imx8qxp_data = {
 static const struct fsl_asrc_soc_data fsl_asrc_imx952_data = {
 	.use_edma = true,
 	.channel_bits = 4,
+	.start_before_dma = true,
 };
 
 static const struct of_device_id fsl_asrc_ids[] = {
diff --git a/sound/soc/fsl/fsl_asrc.h b/sound/soc/fsl/fsl_asrc.h
index 2f67b085de24..1be93148a879 100644
--- a/sound/soc/fsl/fsl_asrc.h
+++ b/sound/soc/fsl/fsl_asrc.h
@@ -446,10 +446,12 @@ struct dma_block {
  *
  * @use_edma: using edma as dma device or not
  * @channel_bits: width of ASRCNCR register for each pair
+ * @start_before_dma: start asrc before dma
  */
 struct fsl_asrc_soc_data {
 	bool use_edma;
 	unsigned int channel_bits;
+	bool start_before_dma;
 };
 
 /**
diff --git a/sound/soc/fsl/fsl_asrc_common.h b/sound/soc/fsl/fsl_asrc_common.h
index 0cd595b0f629..c8a1a2b5915d 100644
--- a/sound/soc/fsl/fsl_asrc_common.h
+++ b/sound/soc/fsl/fsl_asrc_common.h
@@ -107,6 +107,7 @@ struct fsl_asrc_pair {
  * @asrc_rate: default sample rate for ASoC Back-Ends
  * @asrc_format: default sample format for ASoC Back-Ends
  * @use_edma: edma is used
+ * @start_before_dma: start asrc before dma
  * @get_dma_channel: function pointer
  * @request_pair: function pointer
  * @release_pair: function pointer
@@ -116,6 +117,7 @@ struct fsl_asrc_pair {
  * @m2m_start: function pointer
  * @m2m_unprepare: function pointer
  * @m2m_stop: function pointer
+ * @m2m_output_ready: function pointer, check output fifo ready or not
  * @m2m_calc_out_len: function pointer
  * @m2m_get_maxburst: function pointer
  * @m2m_pair_suspend: function pointer
@@ -143,6 +145,7 @@ struct fsl_asrc {
 	int asrc_rate;
 	snd_pcm_format_t asrc_format;
 	bool use_edma;
+	bool start_before_dma;
 
 	struct dma_chan *(*get_dma_channel)(struct fsl_asrc_pair *pair, bool dir);
 	int (*request_pair)(int channels, struct fsl_asrc_pair *pair);
@@ -154,6 +157,7 @@ struct fsl_asrc {
 	int (*m2m_start)(struct fsl_asrc_pair *pair);
 	int (*m2m_unprepare)(struct fsl_asrc_pair *pair);
 	int (*m2m_stop)(struct fsl_asrc_pair *pair);
+	bool (*m2m_output_ready)(struct fsl_asrc_pair *pair);
 
 	int (*m2m_calc_out_len)(struct fsl_asrc_pair *pair, int input_buffer_length);
 	int (*m2m_get_maxburst)(u8 dir, struct fsl_asrc_pair *pair);
diff --git a/sound/soc/fsl/fsl_asrc_m2m.c b/sound/soc/fsl/fsl_asrc_m2m.c
index f46881f71e43..296e13a16490 100644
--- a/sound/soc/fsl/fsl_asrc_m2m.c
+++ b/sound/soc/fsl/fsl_asrc_m2m.c
@@ -253,15 +253,28 @@ static int asrc_m2m_device_run(struct fsl_asrc_pair *pair, struct snd_compr_task
 	reinit_completion(&pair->complete[IN]);
 	reinit_completion(&pair->complete[OUT]);
 
-	/* Submit DMA request */
-	dmaengine_submit(pair->desc[IN]);
-	dma_async_issue_pending(pair->desc[IN]->chan);
-	if (out_dma_len > 0) {
-		dmaengine_submit(pair->desc[OUT]);
-		dma_async_issue_pending(pair->desc[OUT]->chan);
-	}
+	if (asrc->start_before_dma) {
+		asrc->m2m_start(pair);
+		/* Submit DMA request */
+		dmaengine_submit(pair->desc[IN]);
+		dma_async_issue_pending(pair->desc[IN]->chan);
+		if (out_dma_len > 0) {
+			if (asrc->m2m_output_ready)
+				asrc->m2m_output_ready(pair);
+			dmaengine_submit(pair->desc[OUT]);
+			dma_async_issue_pending(pair->desc[OUT]->chan);
+		}
+	} else {
+		/* Submit DMA request */
+		dmaengine_submit(pair->desc[IN]);
+		dma_async_issue_pending(pair->desc[IN]->chan);
+		if (out_dma_len > 0) {
+			dmaengine_submit(pair->desc[OUT]);
+			dma_async_issue_pending(pair->desc[OUT]->chan);
+		}
 
-	asrc->m2m_start(pair);
+		asrc->m2m_start(pair);
+	}
 
 	if (!wait_for_completion_interruptible_timeout(&pair->complete[IN], 10 * HZ)) {
 		dev_err(dev, "out DMA task timeout\n");
-- 
2.34.1


