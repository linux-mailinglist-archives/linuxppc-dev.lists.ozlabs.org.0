Return-Path: <linuxppc-dev+bounces-16531-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OHoPEeBngWl5GAMAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16531-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Feb 2026 04:13:36 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D63AD402D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Feb 2026 04:13:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f4pTV6XRtz3bmM;
	Tue, 03 Feb 2026 14:13:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c20a::7" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770088398;
	cv=pass; b=h8ASsgFQTHqgJlCVeK5H/Nd83ArjXjZ/3t9aMoYcpQnzFPkzj3csb7Nd69NmD8TY3MzFT6FLwgYh1eYaGMXLyrHIIOELgU7mNncfTHxlDAkphpKV1NXAZ5q1eTPhgIg7XSZ9UoKk8tg+sa42IIs0WTHYfZZmYoHXKeyfy1Qoy9AN7dAwzPszkKzPsqwGCAHM5Ym3xBcfVwYpdk2u3IUX7VM6tDtstxxM2iP03mgENJLENDo12mO0oYI5+bDPbCT5805+XppvPg3SuAp296mCPEzpEKonfrg9nlybnddJvDBoUznNvrQeZcHbIacVDWok1iZ06wpFs+rxO1XWEtuLHQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770088398; c=relaxed/relaxed;
	bh=zr6Rqa+wuMrcxaLnffeQ7pdHyuN73FYXJzfWyNfmxS0=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=K7caZKAQMFI+mhd9MmPKbu2yqV2Hz+ThB5LZ0twA9OaXT/irwAp5EmnDj6TduU4IqtZ54TgDvbj2FHiidQjLUHylqwVBBqznGYlHGPpbKqr8garXFBznYHoOJss0oPZcfyFKH3xftiGUdRNTtQy/jIoUISfaXL5zoocg/Yj1dN9za9+gr01jT+wqm9WmrOGM96KRhkBmw0Dg+L9esVhN0X759Ez22nju+PKjE1PFFO3m5J73pN3qQmFB1R1wuwCUfWlf70l+PdCniYcLcZGFFQ6l1aJ/cT8ewVjiRNEL/elGGqPWm2+4NF7Ea2owvoCNMHHiOwgt/iVa9Gz+iQ36bA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=W1qETF8n; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c20a::7; helo=pa4pr04cu001.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=W1qETF8n;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c20a::7; helo=pa4pr04cu001.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazlp170130007.outbound.protection.outlook.com [IPv6:2a01:111:f403:c20a::7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f4pTV072jz3bf8
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Feb 2026 14:13:18 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sL91GHW4ZuKIwChPc8ciTCenJT/z7yUsUP6q8PaUDhVqnwO0Tr3HEaxHZIxEORrSSh+TFej2gFsqUzyJLOOuKjNUKa4rO0AdBlZU0SEVccKVKuNkh9orChO3zXuzeV0iDAs3WM+Zjigy5fLJ555xcE61L3ZUjrXNwqSe1VQtsDNknGRtOJVIeHHIy0mfuU7cRpPQyriRP7E2OQN18O0Z86IglgDMj7EMqFmSFE2X7JczmWse7JZ0CVldEpds3kBRvj5NBpGaOHzkK83WMOyBCa1PmziONWsXP5LdfVNjPPRH3E1T2MKFzqIt2JQ3GWD0lfsuu2eNtzWhZ4gSZWVw2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zr6Rqa+wuMrcxaLnffeQ7pdHyuN73FYXJzfWyNfmxS0=;
 b=Fp3z9l8FPl9/DOmbrp587TWTUULYPBJOISFAVm5cMxUw8zVAJoLmhlvzwZb4HbG7Xcev42bHDTQHMfmsX2pI/oS1TDSkL8JDNbu5pAcmWHsy2hTrXjtpbWdXjcHZD9RZjsuE/FjBsEcaRuvIkA+Wov5Dx1/23sLRmOLI2+eYOBYPhPjzzN3USREVVnK7N+4vFLKzMNGXUg6/pGct0FY6VbhEq2hQ5wAyg6fsRcVG1i+uWCeilQunTlX0wUsjCQ2SMde9iQ8SsD+4EnUSQrWOnpVDHi0IhT3b5//js8XfdXfniigcBSXpalm6M19f0neuEvfRTCDjGW9Iu6cZ4SXsPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zr6Rqa+wuMrcxaLnffeQ7pdHyuN73FYXJzfWyNfmxS0=;
 b=W1qETF8nOYlEh4svpaX/37A/Ylb/1rsvmIj3xYsr2pY8o/sD/p/WCCuDVvKjYlCL650iR9nbwZfQguKkNuiLcHyB6SFKJ6wnaxFb3J3e17KPj1x968zQ5PDSu8SBPr8tR+uz3Y+LrOZI0bXtdYU8pVj+6HOH+OThqDUc5x26lK97JaNFOIOCMc+wUD7E6pdK/goQt1nwWeQgVpoCw7JH9s9rZ6D0suSfBSKfXusvuA4GM0KvU4k+O7vSfkvvcSYNo41QiPp0Y157OSySaMCN82XmCtynHn4LOAdpka0+POCSPmgbOR0mck1zpam+mTIbnYvHtvUeI6WdYbH/WYUm0g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB7055.eurprd04.prod.outlook.com (2603:10a6:800:123::21)
 by GV2PR04MB12271.eurprd04.prod.outlook.com (2603:10a6:150:32a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 03:12:55 +0000
Received: from VI1PR04MB7055.eurprd04.prod.outlook.com
 ([fe80::d6ab:1538:d868:bf8]) by VI1PR04MB7055.eurprd04.prod.outlook.com
 ([fe80::d6ab:1538:d868:bf8%7]) with mapi id 15.20.9564.014; Tue, 3 Feb 2026
 03:12:55 +0000
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
Subject: [PATCH v3 2/4] ASoC: fsl_asrc_m2m: Add option to start ASRC before DMA device for M2M
Date: Tue,  3 Feb 2026 11:13:43 +0800
Message-Id: <20260203031345.3850533-3-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260203031345.3850533-1-shengjiu.wang@nxp.com>
References: <20260203031345.3850533-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0040.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::7) To VI1PR04MB7055.eurprd04.prod.outlook.com
 (2603:10a6:800:123::21)
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
X-MS-TrafficTypeDiagnostic: VI1PR04MB7055:EE_|GV2PR04MB12271:EE_
X-MS-Office365-Filtering-Correlation-Id: 28a765b7-e10e-4747-3e20-08de62d21ff9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|19092799006|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?036f0+Pjv46S9xtCcHicfaQ/pU1MnSRoKA4I+wYkq2wiexWfW/DyZEC0M/rE?=
 =?us-ascii?Q?qZ+STgSnvurPE9v3mIx4chFPjwJABav98gikMoZzYF9u/l0D2NS+jGrUzYEm?=
 =?us-ascii?Q?J29JGV7NTopNWQV4e1YMhfki+JbQ/1Ufts9eM+8iEPtpaJ6xgnFrN1145swA?=
 =?us-ascii?Q?dJoLREec4sYIfaZWbd1bARAbEl4HruoMoAWpWgu/7qyjsL46ycWFfWrv57nz?=
 =?us-ascii?Q?HY4IMpVXQBgQbl00imSgis4TEV3FIg1rvNFiCEvFbpKwHq8dWbI5W2OKPf6V?=
 =?us-ascii?Q?E5ooKRGo3N50NOllCBiMapmS7lKKMxdinj6qdr3zB3FV6lIO4X0Hpf/YxKwl?=
 =?us-ascii?Q?2NEfwWXYqTabHRajWjgya9AoRwbvs52q83d2so7FED6Z96adW3/cGYiN8Mll?=
 =?us-ascii?Q?L7OVSA74E1/hCFYQoDdGF79kBqscfamiRfLZbXSkbdHx7SW5ilLzTxfhlety?=
 =?us-ascii?Q?NBDyBlyOz4YjQEk7qCv24pZDYQXeWu8Ww8Yk62LQwVY3zneZ2+ezJzKXDIaS?=
 =?us-ascii?Q?eO+9ZiiqnQty46ZCQ/nHucP1Ttsyn8AvAQvXT4U6evZtrRgikQrWjvronibz?=
 =?us-ascii?Q?ojaS/fa4L+cANjMs8zoMnsWX4jCcCl8wWJuXG4W5j/5liQOom7DH1Mnq3wTz?=
 =?us-ascii?Q?iumdT8VG2gVcSOYGc1IfKRY1BQ/uGLArgorFRTVRUQF8SgnuXnnpHNwn/iCJ?=
 =?us-ascii?Q?Ije+KuAGzA6GSFgkCAhMWB/IRHjbE8+zBv7rZ5Vz9LBxzw/O6IYNXRgGFq6r?=
 =?us-ascii?Q?+uUm2TWAEEXeSLwoviSThJYywgkfH7+4UdpOqBwRMqPoDH7+LLpuaOSl3bRX?=
 =?us-ascii?Q?NmTEqb+MLvfHzEBYZ4wcOOaEV5cn/5rYuiq5jdTso2d1Mb1F62kJr7nBaRDm?=
 =?us-ascii?Q?K0M2VTqORjQiu2qaUacEBdW4Ds+LAVCeX4kvcKsfVxU2MkCoxDklxdVRR8P8?=
 =?us-ascii?Q?b1icGMgM/fFMc9H2ySo4G3nxPdfLriQnuRrHuSpSDWlblb316ja2s7jn5FpD?=
 =?us-ascii?Q?Mz5fOGDYC59/fBW5yowXLerNzPb1ZAlnDAMe7kQ8B7SIqkBwYVz0lePadsSZ?=
 =?us-ascii?Q?3unJRJV5rGe7ah8imwwb2eoZFt7nTCkvpxMqsH3jL+rw9qrUJnH44Q26fQk3?=
 =?us-ascii?Q?eIl+Q4wCQveIG60nKwJVXTE8zfK21llwOfIzVzD5LT7nscuGmpcUj5F1YGok?=
 =?us-ascii?Q?nYTC2Ewds91bh7GDYx7d8TR/CUbs6eS7Wdv73nPesE1+HCoMSEkQmT9JQMNM?=
 =?us-ascii?Q?T1lDlvFYnkOe9bpIdNuXhRx3JIhx2sGENoDaKDD7lsMdnQilaLYrwvqJ6hUG?=
 =?us-ascii?Q?cnBJZ8dxmx6NfCXm3E5l1Dr5MYBMhn5X/i142/icg/vl4BUvB0SvbzgwnJ7X?=
 =?us-ascii?Q?dkDDpdMDXjx1fCDIO8x045JTwLMa4PAdu0oL3RlUonvGsiMOWK1yZBX6zi8d?=
 =?us-ascii?Q?9H1zqazPwGayYpWeVDCFOg0zcllQP06SpRSFgl5NaXmNPxl6B1dQWicMyMIe?=
 =?us-ascii?Q?m5ZNhXiHYwali1gX5lF0eWUVug5w3rS/wM+uxt8HdJ+3r1qQHlcKCjRZM67n?=
 =?us-ascii?Q?q6npinsMhQtz29L9i7VviEU7/Z/cM9ILcnwhN9GStAMVGG8zN/sjHksNqum8?=
 =?us-ascii?Q?gu+7dBuHXCYoyOD3zw0AUvhAKIGAwN2TBPXkGXHnahFQ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7055.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(19092799006)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SgLZ2sBv58pNuyCk+AfIa8ondzjdQBWpjY0hH+tC9EeuiRy6zUxPrwL4NXfv?=
 =?us-ascii?Q?qFn8YqOn6MCNDn9Ys2cjvI0NqiqhTkUnIQ52M8c8yL+o7ajL7tjIZnMUwpnR?=
 =?us-ascii?Q?NF5Izlgm/4umTFAWQxonTcHVLg2AgkHO/V/HpqPQyqb52ev7KDYcvpmv+E5e?=
 =?us-ascii?Q?xBPgPXUy3Pm7eqKU/gQP5mBXwulIZeNTNeAzuIMQmHPMYNgGwrE9EsbV6dOm?=
 =?us-ascii?Q?s9J4IKMIgkKpbWESTTrRizAC8Rqvl1hrMnBGSgBKLhuu95JCiT8oOcVcMF/M?=
 =?us-ascii?Q?wu/L+FksKTkHGB4nihOMS0A09lbyCFnAt5Qv/dUL9i6ZzQtsZ+9RssxgC0Yf?=
 =?us-ascii?Q?M+nVCk9ReCn5ekf5sCDm0kh6GzSMiTRErUZY9SXJL1ZD4/rnI6fuCQh/TKIr?=
 =?us-ascii?Q?Awx24/hl50T9r1K4YkBbtfj8BSknh5jGZAbjEoa8tvR1b+PEK0HIb/EucpQL?=
 =?us-ascii?Q?0pmxCVkOQ6ZBeArVp/aBolRD/yd8YCRUqIqas04rCVnPuZ6uj+KzSXX8RizR?=
 =?us-ascii?Q?5KPTD0zbBjXlBK8fjArAvfUc4jAlvSZHbk4zt+61KhR6HyjNPPOf+pxPTE5I?=
 =?us-ascii?Q?Xg1tP+OBxif5h8fHjXS4QJ38+zd1Z/tiJgFmo2Eczs8Sr/97AOa+vjQyYX4l?=
 =?us-ascii?Q?vJogubO7zcSRY/hpwTujdAam3GMjNDjDCyZ6mmEwWSI3btM/xr0R+5lJtw3X?=
 =?us-ascii?Q?9VyXPlnwiFzaHu7VW/AT5pyNxZ6R3YIO5JnqG1OzCYN3uubBIiMQlDRPkDpW?=
 =?us-ascii?Q?WOQtVoLbrx1fd+ybLYNrwkeU89Dy37PduBjw0VVcE/HhFqnz6GTF/6CM7Q8k?=
 =?us-ascii?Q?b9DvT2g4ocL/+gCDj8Lb9gHjEvFZXQ2q91nBVInlzVFU7X8c4++6f34Na95w?=
 =?us-ascii?Q?UjMSUhdJQp86Anf20Agyyus0ZyjUpxPDJfdILu8lJSSywhxsm5J8PNTGqnLC?=
 =?us-ascii?Q?fSGUXA+y/QV8DQbXdsvpT0zzuW8+1X3pImHsuQCziNK03x1u9pLpSX+/chcC?=
 =?us-ascii?Q?UBLXIExmGnkpIu+M1Byl44673wpZsFCPuDBygEzRIGIK6SRRoG9kNhpC9yK2?=
 =?us-ascii?Q?TLX6AeMo1MEHHoQbYtAlbjWbwxlrdgQ/10OqVAvMQam9UQA+Xaz3ljBWWXVE?=
 =?us-ascii?Q?q6ESJWCtT6VKHfE5zHCtyXsSozHhhqbcSM6dbXN93jdbqftn5kDd8D3OLojr?=
 =?us-ascii?Q?A0ntpTpFwc4s7zbHNHANsRf9RKOypk7bu0PZFs7mzMiyqIBBS5oZHtnKVf1T?=
 =?us-ascii?Q?OzOyTf/B0n7ZN6sNWOPkMXpNJpxZl6VGKpBRqP3ZiuMCVUlAc+H5X6/kDRgo?=
 =?us-ascii?Q?X3hOX4QS4INxl5JWAIEVkbPQwQFXaJtiR7ad9nqgjC2wswkUGGnLuhTC4ptk?=
 =?us-ascii?Q?VG7KTWosxkAK/cwk+MDV9odSvLWSSsS2El3esK+BmMiuy1qJPQ06Lq2Whvwt?=
 =?us-ascii?Q?sOdM6GcqQuWC3zWZ1DA5UHdnbjcVVV7HNT+uwzudv8C6v4IkeHAlHcIYLzBh?=
 =?us-ascii?Q?qOI12xQu5ZeB1RihmNmwKAKPPXCGH/EsncNaFUFixGzJlu57RXR9loFOnRJ5?=
 =?us-ascii?Q?AkYvR4czZae5DPTCzPaGtkAVECWfff55Pt+KWPHtwEIAvwK2NPkx1NzGYndi?=
 =?us-ascii?Q?5B76isHpcyXDVBEBrKMydAvEOuKajNebfltedIAYSRsuh8UCNlPCqUAi7dpi?=
 =?us-ascii?Q?tlW9o9x0JuuaNLJD5xLxCdGx9hfQmthBV1SIPn3GElzs1oih/JNBHc3DZBZM?=
 =?us-ascii?Q?YxIqHCls4g=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28a765b7-e10e-4747-3e20-08de62d21ff9
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7055.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 03:12:55.5164
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a0QlklMNOhNwOSqceGEHWnA204mOwFgZs420X3Dwk/kWBWKtAO+ojzwlk8ITYD94ExYZUmCQ0y8bpvQ18N/2NA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12271
X-Spam-Status: No, score=0.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled
	version=4.0.1 OzLabs 8
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
	TAGGED_FROM(0.00)[bounces-16531-lists,linuxppc-dev=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,nxp.com:email,nxp.com:dkim,nxp.com:mid]
X-Rspamd-Queue-Id: 5D63AD402D
X-Rspamd-Action: no action

There is a limitation on i.MX952 that dma request is not cleared at the
end of conversion with dma slave mode. Which causes sample is dropped
from the input fifo on the second time if dma is triggered before the
client device and EDMA may copy wrong data from output fifo as the output
fifo is not ready in the beginning.

The solution is to trigger asrc before dma on i.MX952, and add delay to
wait output data is generated then start the EDMA for output, otherwise
the m2m function has noise issues.

So add an option to start ASRC first for M2M before ASRC is enabled on
i.MX952.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_asrc.c        | 23 +++++++++++++++++++++++
 sound/soc/fsl/fsl_asrc.h        |  4 ++++
 sound/soc/fsl/fsl_asrc_common.h |  4 ++++
 sound/soc/fsl/fsl_asrc_m2m.c    |  8 +++++++-
 4 files changed, 38 insertions(+), 1 deletion(-)

diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
index 92fb16f7be45..b6d4f1e09e2e 100644
--- a/sound/soc/fsl/fsl_asrc.c
+++ b/sound/soc/fsl/fsl_asrc.c
@@ -1078,6 +1078,27 @@ static unsigned int fsl_asrc_get_output_fifo_size(struct fsl_asrc_pair *pair)
 	return val >> ASRFSTi_OUTPUT_FIFO_SHIFT;
 }
 
+static bool fsl_asrc_m2m_output_ready(struct fsl_asrc_pair *pair)
+{
+	struct fsl_asrc *asrc = pair->asrc;
+	enum asrc_pair_index index = pair->index;
+	int retry = 1000;
+	u32 val;
+	int ret;
+
+	/* Check output fifo status if it exceeds the watermark. */
+	ret = regmap_read_poll_timeout(asrc->regmap, REG_ASRFST(index), val,
+				       (ASRFSTi_OUTPUT_FIFO_FILL(val) >= ASRC_M2M_OUTPUTFIFO_WML) ||
+				       (--retry == 0), 0, USEC_PER_SEC);
+
+	if (ret || !retry) {
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
@@ -1275,6 +1296,7 @@ static int fsl_asrc_probe(struct platform_device *pdev)
 
 	asrc_priv->soc = of_device_get_match_data(&pdev->dev);
 	asrc->use_edma = asrc_priv->soc->use_edma;
+	asrc->start_before_dma = asrc_priv->soc->start_before_dma;
 	asrc->get_dma_channel = fsl_asrc_get_dma_channel;
 	asrc->request_pair = fsl_asrc_request_pair;
 	asrc->release_pair = fsl_asrc_release_pair;
@@ -1289,6 +1311,7 @@ static int fsl_asrc_probe(struct platform_device *pdev)
 	asrc->m2m_get_maxburst = fsl_asrc_m2m_get_maxburst;
 	asrc->m2m_pair_resume = fsl_asrc_m2m_pair_resume;
 	asrc->m2m_get_cap = fsl_asrc_m2m_get_cap;
+	asrc->m2m_output_ready = fsl_asrc_m2m_output_ready;
 
 	if (of_device_is_compatible(np, "fsl,imx35-asrc")) {
 		asrc_priv->clk_map[IN] = input_clk_map_imx35;
diff --git a/sound/soc/fsl/fsl_asrc.h b/sound/soc/fsl/fsl_asrc.h
index 1c492eb237f5..60b6865ca952 100644
--- a/sound/soc/fsl/fsl_asrc.h
+++ b/sound/soc/fsl/fsl_asrc.h
@@ -257,6 +257,8 @@
 #define ASRFSTi_OUTPUT_FIFO_WIDTH	7
 #define ASRFSTi_OUTPUT_FIFO_SHIFT	12
 #define ASRFSTi_OUTPUT_FIFO_MASK	(((1 << ASRFSTi_OUTPUT_FIFO_WIDTH) - 1) << ASRFSTi_OUTPUT_FIFO_SHIFT)
+#define ASRFSTi_OUTPUT_FIFO_FILL(v)	\
+	(((v) & ASRFSTi_OUTPUT_FIFO_MASK) >> ASRFSTi_OUTPUT_FIFO_SHIFT)
 #define ASRFSTi_IAEi_SHIFT		11
 #define ASRFSTi_IAEi_MASK		(1 << ASRFSTi_IAEi_SHIFT)
 #define ASRFSTi_IAEi			(1 << ASRFSTi_IAEi_SHIFT)
@@ -432,10 +434,12 @@ struct dma_block {
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
index f46881f71e43..77999526dd9e 100644
--- a/sound/soc/fsl/fsl_asrc_m2m.c
+++ b/sound/soc/fsl/fsl_asrc_m2m.c
@@ -253,15 +253,21 @@ static int asrc_m2m_device_run(struct fsl_asrc_pair *pair, struct snd_compr_task
 	reinit_completion(&pair->complete[IN]);
 	reinit_completion(&pair->complete[OUT]);
 
+	if (asrc->start_before_dma)
+		asrc->m2m_start(pair);
+
 	/* Submit DMA request */
 	dmaengine_submit(pair->desc[IN]);
 	dma_async_issue_pending(pair->desc[IN]->chan);
 	if (out_dma_len > 0) {
+		if (asrc->start_before_dma && asrc->m2m_output_ready)
+			asrc->m2m_output_ready(pair);
 		dmaengine_submit(pair->desc[OUT]);
 		dma_async_issue_pending(pair->desc[OUT]->chan);
 	}
 
-	asrc->m2m_start(pair);
+	if (!asrc->start_before_dma)
+		asrc->m2m_start(pair);
 
 	if (!wait_for_completion_interruptible_timeout(&pair->complete[IN], 10 * HZ)) {
 		dev_err(dev, "out DMA task timeout\n");
-- 
2.34.1


