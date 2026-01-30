Return-Path: <linuxppc-dev+bounces-16418-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QGCiOlxFfGnfLgIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16418-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jan 2026 06:45:00 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE77B7682
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jan 2026 06:45:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f2Q226pbMz3c1T;
	Fri, 30 Jan 2026 16:44:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c20f::7" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769751882;
	cv=pass; b=HRmXhU+RDuTvf3WDRleZ+sOCV6Rd7KQnSm7lXy3kQvJBjGRq3ZWlYnni83zJux29BTIc/LtXfCvs6tNsyp1oGgSo+EXV3Pb1G7EE9GvOum4n+kkO60dWeJbOl8xKV6WG8V5LqOqb6XL7Sgsy3scNIiQ9JJ+DgDXlhLxeuALHVfur7OqaiDE/E9gNZrSnE3g3uvrNje/pMJNN8xPrvKN+qiadNWdNtuh+uGFPkXKJcA1yY+Mst/6F/u+Qc4NxAXPQSxF4F+uKwF7VO9EkwxXYQ/UrwwLSMJHRC8zJ1fJMacsXvpyS1C7dmSPS2omh9Ey8o0TEQO+jQpU98JM3tYdkPg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769751882; c=relaxed/relaxed;
	bh=nYBCgdVnJ9uTFWH49fM4PwhUjwp3X164WXPES8CBV40=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ADEMKdrJyW+EFHji8iPh1w5alPw0qmxmby+t+SycpjhIu2wWkMhZEiChppq2Hf0sMF1Uffc73+Eu8R1ko7cgOC5TL7bL3g2xj8se8cWde8hnW3HKK6CxGZXDhCDd5DMbkwth6Yr+Ax9Vbe75T7U4z89mGDdl7ozoZDBzP122zK+KOHb+Zp5rLYcamvFHVlNC7fl2u3r7TRjMfj4cJyVbVe/pGgo8SdVGeipnT/yuyfPh/pq5GqjesUbcywk14goq8mQxa+H4x6vv/QbCcD8Cznn4vopOdzN+O8bqA+uPVuXa/I1Zzw8oRorfOoJ8qN6igncfZhT6pibsh/S0jYzyug==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=mPDU2D0u; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c20f::7; helo=osppr02cu001.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=mPDU2D0u;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c20f::7; helo=osppr02cu001.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazlp170130007.outbound.protection.outlook.com [IPv6:2a01:111:f403:c20f::7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f2Q222H6bz3bmM
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Jan 2026 16:44:42 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IzakqJxZ/sQj8WjVDyzvYZwXNYFP+AaEqJ7PaE1IcK/FRSlwmu2se6ox9xUkgaBPvAPVLw8DuuMayr2IucQ4LaAdWdOCanUo/wPPhmTnmZtVNfkEebEGCzMZ1xK6dcTXvLbkTp+e3kggHYNz69v6yV056WckHznDa0ayjALOfcUMG8eVAAeh1oO1zQH8uy8XCJ9DGOfSy9y2HBq0helTw7ivudj4zpmJXU8lXjzc1uVBWFlz5CzGfIXfbJfvh6A2T1WyVRJ6Au+l1XBkjq5Ma/fSfYMzSXFovBKdvG7Gv/yFsEO9h9XdHpdHyq7D9f7+a3HwNHZr7x/BNcReqJkfHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nYBCgdVnJ9uTFWH49fM4PwhUjwp3X164WXPES8CBV40=;
 b=V07mXHlEoRxQ6oDmKGFeK2fvb50mloNp0TphTVE65fFDtS98VTzhi/9QDIKsheEVQEvBdAfd8wL2t18AYjfkNHJCLCFe67lccOWNLL8AmtYhwueRcPaydZQvJHKqosC7Xf2sdCTDuGaruObCZTdIqexn97OWc+HWmqGmQDu3W9Jhcl7VwegTxZgtfXUQ/3u7czYQdCztmq5+HKbhWRyEtN/hDNfJvM2zLOibMbQKfIbVvn2aWjipnbwC649tjzZSPrbNS/XitjjtohDB6/PjzLSX6SSj1OUjcPMkGbovAHZ7Acg0UIbkZL4ndtgaLuP0MULfoA5DmEBD4FdrmsgRgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nYBCgdVnJ9uTFWH49fM4PwhUjwp3X164WXPES8CBV40=;
 b=mPDU2D0u8xliHCYnuS2Xl8+ViYzTV8LAaKdsI/8rD7dLT4xPDFPLBZJczpvr9hFL4Ls8l3Uzk5v7ffnHCvFoXpd+QXva/rFCEo/iMYcCQSANk/WHfEH5PGYrPzF+5YHjvf6lWjPnZ5nry2fWaSwNSNVuzdrFnZHiUbBvndMZpF6Re6aCK4gqGIBpWoPxsLc4e56NSU1epFIuutRvPoDldVsjyyW8alsHjnJkAMtxiRY9NVtLOZzIIz4OhBZNWUfJbDpC3+rGKb7qXeUE1PoI7PPI/SEuQtgbZMOu+7GLsboP4fMNh0cQto1dfjsixGtk5MPCRalV6cRN6BF+jSQwnw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by PAXPR04MB8174.eurprd04.prod.outlook.com (2603:10a6:102:1c4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Fri, 30 Jan
 2026 05:44:22 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b%3]) with mapi id 15.20.9564.008; Fri, 30 Jan 2026
 05:44:22 +0000
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
Subject: [PATCH v2 4/4] ASoC: fsl_asrc_dma: allocate memory from dma device
Date: Fri, 30 Jan 2026 13:43:30 +0800
Message-Id: <20260130054330.3462544-5-shengjiu.wang@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: e64b8550-6a8d-404e-a79b-08de5fc29ec1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|19092799006|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?72X8KEZaTPyrS6E7v/F/XC2qv0TVwzxxodW/Uw7H2Xo7dHu1DIb3KJU+fofY?=
 =?us-ascii?Q?rQf35Bp3Ti/lfQ98BJYrGAywjRg5r/sox7MyRQQ1U3meX3NLtpB86UAyHsNH?=
 =?us-ascii?Q?a46v6O6ykxaOF2glmZTLX6GXDCqkTMy3A7UdUBKupJa+hHtadKW1gFPG79lO?=
 =?us-ascii?Q?VWpd2EsqbTrEWW754kdNSVStO12eBVlJucRKD2UaNJ+74jhrkuU4KvEJdj04?=
 =?us-ascii?Q?LZFRGYSAagUhKK6/hAHieW+vbusItmZyiOxS+sXGBkCL9SYWTqUVpZ7FS65l?=
 =?us-ascii?Q?F+1HTj9EGjABqqIXbhUEov2fH9EtSh02OqUzgBPRjtq0fJmM92daZQ8f4atQ?=
 =?us-ascii?Q?HSXVn35kubfKNAJN0mM+rql3ZoO/1Wix8NmxrM41ExrSw0ceMaFe7uHU71Re?=
 =?us-ascii?Q?Xg777i+V8FaqjG/FUhrupLcyTkMbTfl4LS7HG3b6wlz+TtIQAzCp7W3797Rs?=
 =?us-ascii?Q?ZjY4geW6yq64iQG/oFhlfgmwa3t7eY55jqA3icb85iII8iWN83gve3GI47Fg?=
 =?us-ascii?Q?rsB5IUiovLIavKVwc6k8gzrQR5D/SRa7brLTA12A4AhlCRxGUCi9kDDo7q07?=
 =?us-ascii?Q?uVVs6IiX4LtcBu+5yuqTZqRjFTbTCexQji6iIaum3tyNU9Op9CjSa3DmL0ci?=
 =?us-ascii?Q?x0l+dCgzhh9jHDT+CpdnQg3j+mal9vSAgF5oFLvhFmD4M9OLoHSO6o189/22?=
 =?us-ascii?Q?+hlShxJ9dBnlAsYyK3TtjToGTdKJMfsfGn5MPvkjoiBnc0Jl0tn0mdR/fx5Z?=
 =?us-ascii?Q?gr9ZPWANHSu6ZNAtVDAV+37DUMg/593Ho+9IUz/lPp6NGjZrOU6+S6d+g3Qq?=
 =?us-ascii?Q?uDxs1DuNv4GTNbJNHeMREM0ffVuzYJBentzD07yy+7Jas+jF2DeCfAlgCJla?=
 =?us-ascii?Q?CJyLA5E4WaZERQLYOAsPh/zKAtKoW9D+1YGQsdjBfZUlaQ4igaRI/hVrvspK?=
 =?us-ascii?Q?vMGHldrsIaYhvtvjkuSFuTRJhp+c4lQ1lB9KKfCJ2A4s19FzNaRn3U4yka3y?=
 =?us-ascii?Q?cpAarV5WSdQAGV2UeQHuBh2T4aW1L7USTfnCiEBjyjawhiSbI/MPAtqghssr?=
 =?us-ascii?Q?S2+aCyvIgqJ9H31eLLsEQinttSCXdtPFLXC9gvkDlyk7Y6hx1Yqo0jQr3Pdr?=
 =?us-ascii?Q?2pLUd/XkvAQlKmP7QRVk7+tK73P2QI72WOCUJvzxoWGeXxpMx/g7OqryYoa6?=
 =?us-ascii?Q?jnLsUI+JG37CPibr49lTa22PtrotKrwf19eQ8DIMf+7TPQHj9QELy0OQhSXv?=
 =?us-ascii?Q?H+DFUgoppIx3e51Ps3LZvCRKwW+/u1CWvPksq2N7eQIQpXvT8qsqAkd9xCqC?=
 =?us-ascii?Q?riHzCbxdq2oAZ3EhDuRBeK2UdsbBtzWucgQ0uYZ/1DZCW/HL0TUfpvLA4/6x?=
 =?us-ascii?Q?8bBFx32vK1AArc7wXiTchKfxktS1Xz+0wE9aHYFNkixLp1JrT95+4M9yTp67?=
 =?us-ascii?Q?ZvdkmJALSOFbfWXnnmZczKKKc23sjszSp17h/IB5PbAgIATfajnqPbAP+sUN?=
 =?us-ascii?Q?FPLgQhW38j29l8uExyGNAC4Y5/hm3zUBJPz3dNmvz81UYqv957++c/Lpx1ie?=
 =?us-ascii?Q?G03rHz2pDYi7TE8kGIRrvbsuw0MgXUL/JKbA/cNUNt7tTPhki1XZzaZXCC3q?=
 =?us-ascii?Q?zvcfX8w/ZPDxbXN91wDT41EmVSgifiRil96O8SyWlNmV?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(19092799006)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lvR/0UgqqEo8cSRPk3IYCNGS7ijvCO2kDQnoAQNWo+Zs0ih0aXZU4BsgjEPE?=
 =?us-ascii?Q?9OuAD5TT+DJvuR/1rYZbZDKU4WS8RM6Cq8CDBYQG/zg1K3BMJCDll7TJFdMH?=
 =?us-ascii?Q?u/n0K0kwcGBqBeqpSc6rbWwDC/flgfkHNqG1z8t05XOKK9+qIgU9DZBUeo5u?=
 =?us-ascii?Q?DWu2ydaFlGvdneJrCE/J/0CQgOY2OgM+plCkW4XKfVmi4M0aWQMSvm7Y5CSj?=
 =?us-ascii?Q?OXHFhm5U+sTC0/pYiz3WvbwrwT3IOBSc9q1JJAwctCUB5iB/IMF0Yqdrbo2s?=
 =?us-ascii?Q?SlZmPzYwlgRlvyc2uvXG3sROxFuYXyByi8LmTa16oe39fgT7sLblRTJ7dKx8?=
 =?us-ascii?Q?qSP/pqzYEC6imzbEpUoh3MC8N3i+9CrPiQyeA+8SOgW0ZWvjsyQDrHO++dD4?=
 =?us-ascii?Q?wH1/C37xJjHIqEp7pA6d+o1XPen02jtIUle7BaEhCxSiKYSWf8gxke0N6nqw?=
 =?us-ascii?Q?Zo9f/D4gF6ebLGvE5Ub7rZPLia/kXS2c579UHdX2awywbdtXS9ianxl8rCCY?=
 =?us-ascii?Q?ZEEqYUyKSuz6GxGeJLAo+NdSDuIQmxMYg9MmCJ8OyM7gJt+bXvBdRfanpCnH?=
 =?us-ascii?Q?Pzy8MCwWUecRIMkkpfTiJUew3rE0bh5y/1bFwviJBovUGaUP7doUTXFcxyEX?=
 =?us-ascii?Q?ter/LPqbWj4MMA7edbZ81R7BLy16L9CnLmabOSja3/B8Y4goAp8hny+2aERR?=
 =?us-ascii?Q?ENjRYSnACnhpZr1XU4nuduTJdH5bx4Jamqi7yuqoRUmM/RrbwQQTej/y/gnE?=
 =?us-ascii?Q?LBfMwq92U/+ojuRRkL7RKNwH8y3zIZ2Ft2zTTtOeGUqF1JePEdd/uWpUUi6x?=
 =?us-ascii?Q?qMPh+acNz46U2RsOcWQRWKeSdFqSeMZqkB50DNHaMZp+YBoKurP7bi1ycPZw?=
 =?us-ascii?Q?XQzag7qQlV9OpDkJn2GAHbue+mgtWZYLCvw9yQqVXykCuhgDykYp7SBRd/Uc?=
 =?us-ascii?Q?nvOBJ8iJRELFFmGgiaBYXMMpS7Xq4ndsgpWq5nrZ6sM4Ev+pXFBxzOdVkNb8?=
 =?us-ascii?Q?6vkDfXWW1ZCow17PCFx+1vwRvZIkxJqxrQWK0P81Ufy7nc5Wuzo86c+ff3V6?=
 =?us-ascii?Q?olmPQV9GHYDtwf8Yjjk0phn4TA0o866kEjeQEVHwYZFVEFFovCiK6YqSwQiR?=
 =?us-ascii?Q?l7C06ldiR6hL/r1B/YeMir4i2/SS2v4vjubUVNHD9bIrQlNawsglkRZxeSrE?=
 =?us-ascii?Q?zzVesaGnMi9kC7T7d3nZKa4dFXzoKHUlcdHDaJXmZN9BAhA2++Il2VC5V2S0?=
 =?us-ascii?Q?x2j9DIYknDJjlKBsGe9I7uDdsVtrdUwhI2bdQHDpDpj0n8nnpDuvIL1yxQtK?=
 =?us-ascii?Q?GDYIk4tI8nvjm9JGjdb5vQcLTRIJtrM6iJTpUxeTZA+FbLFT/+y+1UoNCbst?=
 =?us-ascii?Q?PXzD0HyKqZgM22u/EK+KzVPuZ1LkWixQpHJYC4kSoyRSQLc915rAqTVYPc4f?=
 =?us-ascii?Q?Fi+M8Ow7gjA7wT4K16lTocJ6bROQass2e15yswb5p5ZArWf7iHsvJt97nZkG?=
 =?us-ascii?Q?/DtssgX7leTgS5Pmkt07S82yR4+v5GZuTjfQAsGM33p1V7CggnmmJXEtGIYH?=
 =?us-ascii?Q?uYSW+MvpWUqSOuZdlpigLrigEjZnTUMdAIjxbACi1cqXlLgMxG6tkwkNu4C6?=
 =?us-ascii?Q?wGsV2M/8UYRTiC7I24/JfEJVDsKItFUl5slEC3YiXlf0DIFd/aR3P7RwT5xp?=
 =?us-ascii?Q?h5ikfMAO27iW2ABoQDvSRVWj2HhIyYRYMgtJwOOFUMRFFsts58BfH1i3fa47?=
 =?us-ascii?Q?m7pDlcuGOQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e64b8550-6a8d-404e-a79b-08de5fc29ec1
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 05:44:22.8043
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kcwx/earwrt1lDylmzzONPRbg5tmzPCYFnt1Lj93X0rSlkPkZLU2rm1Y9Ak2aGT/m/Do72+Lpv0Nx/ner0U/kg==
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
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-16418-lists,linuxppc-dev=lfdr.de];
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
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,nxp.com:email,nxp.com:dkim,nxp.com:mid]
X-Rspamd-Queue-Id: 1EE77B7682
X-Rspamd-Action: no action

The dma-coherent property is used to indicate a device is capable of
coherent DMA operations. On i.MX952, one of EDMA devices support such
feature, in order to support the EDMA device, the memory needs to be
allocated from the DMA device.

The code change here is to make this driver compatible for non
dma-coherent and dma-coherent dma devices.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_asrc_dma.c | 48 ++++++++++++++++++++++++++++++------
 1 file changed, 41 insertions(+), 7 deletions(-)

diff --git a/sound/soc/fsl/fsl_asrc_dma.c b/sound/soc/fsl/fsl_asrc_dma.c
index 7dacc06b2f02..348b0aabfa68 100644
--- a/sound/soc/fsl/fsl_asrc_dma.c
+++ b/sound/soc/fsl/fsl_asrc_dma.c
@@ -449,18 +449,52 @@ fsl_asrc_dma_pcm_pointer(struct snd_soc_component *component,
 static int fsl_asrc_dma_pcm_new(struct snd_soc_component *component,
 				struct snd_soc_pcm_runtime *rtd)
 {
-	struct snd_card *card = rtd->card->snd_card;
+	struct device *dev = component->dev;
+	struct fsl_asrc *asrc = dev_get_drvdata(dev);
+	struct fsl_asrc_pair *pair;
 	struct snd_pcm *pcm = rtd->pcm;
+	struct dma_chan *chan;
 	int ret;
 
-	ret = dma_coerce_mask_and_coherent(card->dev, DMA_BIT_MASK(32));
-	if (ret) {
-		dev_err(card->dev, "failed to set DMA mask\n");
-		return ret;
+	pair = kzalloc(size_add(sizeof(*pair), asrc->pair_priv_size), GFP_KERNEL);
+	if (!pair)
+		return -ENOMEM;
+
+	pair->asrc = asrc;
+	pair->private = (void *)pair + sizeof(struct fsl_asrc_pair);
+
+	/* Request a pair, which will be released later.
+	 * Request pair function needs channel num as input, for this
+	 * pair, we just request "1" channel temporarily.
+	 */
+	ret = asrc->request_pair(1, pair);
+	if (ret < 0) {
+		dev_err(dev, "failed to request asrc pair\n");
+		goto req_pair_err;
+	}
+
+	/* Request a dma channel, which will be released later. */
+	chan = asrc->get_dma_channel(pair, IN);
+	if (!chan) {
+		dev_err(dev, "failed to get dma channel\n");
+		ret = -EINVAL;
+		goto dma_chan_err;
 	}
 
-	return snd_pcm_set_fixed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV,
-					    card->dev, FSL_ASRC_DMABUF_SIZE);
+	ret = snd_pcm_set_fixed_buffer_all(pcm,
+					   SNDRV_DMA_TYPE_DEV,
+					   chan->device->dev,
+					   FSL_ASRC_DMABUF_SIZE);
+
+	dma_release_channel(chan);
+
+dma_chan_err:
+	asrc->release_pair(pair);
+
+req_pair_err:
+	kfree(pair);
+
+	return ret;
 }
 
 struct snd_soc_component_driver fsl_asrc_component = {
-- 
2.34.1


