Return-Path: <linuxppc-dev+bounces-16661-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oPQFH6iphWlhEwQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16661-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Feb 2026 09:43:20 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B53FBA36
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Feb 2026 09:43:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f6nfg1jCvz3bkq;
	Fri, 06 Feb 2026 19:43:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c201::6" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770367387;
	cv=pass; b=MK5gXxUmRVSp8MkHc9Yu8Yx+DGlH4sdl7xeh04Ir+VUs5RmjHbMkf2SYJpfy+uujZ1rzk9qzCa8aUwOKiCqDMHMbFkE4aQWGqw9CUWYydTMAvu/e+nTc8aOSBy+iGhiclf1tscquMcUDI18QQdculxehbTxlo6hKvcbtBNKpz/qPAQxllVWbX3dbZ63NDl9iVOIn5uR6KIOV6wFFUBq82MHhuEr/hKubxNJZhGXA7NnmqXeZR1Kqa6zO8PmBU/fz3ZgScd+78WwYDXe55UJ2lx/MMmmG4mDnj8ZSPMxWSgiZlJMZOuby3WO+9+x2rIBXX9l0GXMWwZ+TdTtgIv7Mxg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770367387; c=relaxed/relaxed;
	bh=E2wxNCPBKapEPkH/d65SEN/5C5Rx2mGd22mOiRHmRiI=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UzlSb12jOaqsQZSIdhjWvsstUvWdq7CjseMy5Sc4NzaaNTHNsPU6Ex7+96zKvI/aPgm+/V9uQilURlUL7NixyShyVyW893/fFZkS2NsnFTIj78bX1RtEZktdKDVi+Er/a6Rr/TAZq4tzZ1YGLNiF5afd1khhmhkBJaAe3a9cZLZabwAw3rGnXWX2FzwUgZ4jxSN9KhBg6exuAsnMJty31LI6PcL8tvIoWor5HpvoBA/VXWnDR0ls2D6je1MfrrNpEjN6Qh4WWu3iLq9uO61AEETmhyVcZQrN0TEMr2DmVygMS2sdlKPMK1l9aGfDbLdgGxcyiZaqMJ0JmidFNJ0/Fg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=XUneEf+l; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c201::6; helo=am0pr02cu008.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=XUneEf+l;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c201::6; helo=am0pr02cu008.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazlp170130006.outbound.protection.outlook.com [IPv6:2a01:111:f403:c201::6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f6nff3hMsz3bf3
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Feb 2026 19:43:06 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hc9dB8+NLq4W6gkE+FgxKBgUsr8MWFra9Nm/4nNzUGx6D9o5qTDoDPhcODRV3cwvHpxXKYs4bm8wxBirmL/ZxG9diTFx3s3vIHx0dX6zmpP9w82twDMUXnPnRCoIBmSCHR0DX7lrWgaatIVxrS+NyyjFqPMLHZMo/T7mnzJ+QKIc1OW/O5IzS+I7/0qbL5vezH8D+T8PHOEPGyLPOpMQ6dHbXBfHS0n/WHFR+KCWRRcwENpnHQDCYjqnOwc6Q4rwKgTi4erWGK/o1oUdzo5/tKGEx7oyeFTW7sUo1+YHQSCWwQdJtl5lAHgrJgsrms6cb9LZH0SPbymOkrOmYb8CKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E2wxNCPBKapEPkH/d65SEN/5C5Rx2mGd22mOiRHmRiI=;
 b=VXTqhmLHemsjQItEc3Dw0cixNhzZE2TkYfmGSNgCWjP7/wQSoam0BYDQpZNk9EbYKVzDllVMjJuH37/zvdSzCx/T20qJsLkvCVRGLyrC6/F1gAOwVgXW0M1b2NSjUMtYCPkuRzYtnewdRGA9fYfczeKenyAmSsfF11wDApHqZmg4QGTL2gHDY+s90Y1xTPC56WLP8nfIKfNFZpO28PstFkww4UbB+xuh5URwERRe59wOw3LXI1/PwV/EwXUJdRc45TUMgOhpzWdeNjLbDnIMLVtG0LV52SPPwMnoXGFvoqDIBt21J5FfaUpz5CdkCEa+Ci1eSgKR2GrFON9653vihQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E2wxNCPBKapEPkH/d65SEN/5C5Rx2mGd22mOiRHmRiI=;
 b=XUneEf+lfu4t8ytos0MqeKKFZfOscTsK46JPecsnmxVzY9Mv3EANrlCPP91+33bOy7drQtKqb0rJEYW2iJQNX9EpQichRrKnS7k7KaHsqTTTVp0CDTeAsSMw4RtZuWLyaukSSyrN7XIMh3JxclDpBkPdhCDwvx/lvHMGEbsDfvkAntqwA3+BR2yQSjUBzrsnliv76g1T2mNEfo4QV3EbbGpV75vJFVF82fK4Ejw7Drec03l4OXM9IUhkbN1mi4PWkNQGxjRIsnkfLo26bSZ9OF79WLsM4d5Jfibj/7YAutZ/LKf26fYxiV4iGLFGlgsNrHdV2zt5iSur0rsomkmMdg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB7055.eurprd04.prod.outlook.com (2603:10a6:800:123::21)
 by VI0PR04MB11503.eurprd04.prod.outlook.com (2603:10a6:800:2c7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Fri, 6 Feb
 2026 08:42:47 +0000
Received: from VI1PR04MB7055.eurprd04.prod.outlook.com
 ([fe80::d6ab:1538:d868:bf8]) by VI1PR04MB7055.eurprd04.prod.outlook.com
 ([fe80::d6ab:1538:d868:bf8%7]) with mapi id 15.20.9564.014; Fri, 6 Feb 2026
 08:42:47 +0000
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
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] ASoC: fsl_xcvr: add bitcount and timestamp controls
Date: Fri,  6 Feb 2026 16:43:34 +0800
Message-Id: <20260206084334.483404-3-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260206084334.483404-1-shengjiu.wang@nxp.com>
References: <20260206084334.483404-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5PR01CA0107.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d1::10) To VI1PR04MB7055.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: VI1PR04MB7055:EE_|VI0PR04MB11503:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d057479-0d26-4fcc-4139-08de655bb461
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|7416014|52116014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZCFe563ZN/0h3Pk4mQrarsE5PX34tkMdKBBsLoZYb8KFg1NGpBbjxKfjqX+a?=
 =?us-ascii?Q?QAIRRXSpfXqUzWj6pzB6vPhWPaZRqeTFbaiHjNtBG29seoyM+7RQIK14rTz5?=
 =?us-ascii?Q?brVHe5aACj/XSIj0Wh12bEstrtw0b4xxidbbGX5CjZfNBL3xomhVMY/jn3dV?=
 =?us-ascii?Q?uAOV45ZHNnVb/VCWTtKd4GfQodEJNdOmoAoQFnqbl9PLrWH3tkvLecp7Az1e?=
 =?us-ascii?Q?wURLjZ2t1iG223SE/Esov8UaXxOrlz4LjqF6uTO9GV/gy/t1WFYAuBy5NE30?=
 =?us-ascii?Q?+RsT3dyQS25vIqxySruDk8x8ST/UVEVzxgbMvsor94tVpGGT6LYc56m0lXtu?=
 =?us-ascii?Q?PCbm1BpkFDMLEGgd4LxzuwAicd2j+v3ZwxmE9QA8Nb2142InLZBLTYqZqPvg?=
 =?us-ascii?Q?4EUU+rrXCTXPkPPMCMeMPqqn7ZYGaGXHdqX+/ANc4C2S1nae+Dgyljwzc19L?=
 =?us-ascii?Q?JOA+bix9DRR21d9Br/dT5sDZgJbOs2MARwZuxYkm4wAyqiYTrFj7rl3kKK4O?=
 =?us-ascii?Q?LTaTLpGcPy6SCQ77JQGp8Ktoruhp1JbT+elLgluMP0hJ5AALN0+DmvLpOAQJ?=
 =?us-ascii?Q?xVEmsh/Z+572H3r9Bv1auBFG90TWEeX73JJYpWFa83FFC3+vQEAmNUGSM1PV?=
 =?us-ascii?Q?0w9lkvhCR1FuN1tB8IaH04cynZpjoGVabeqU9IsEuZARd44w3QBb74Mquw4F?=
 =?us-ascii?Q?9xAwg6dcCPQKpKJkbTvFKTealUQ+7396ncIX6tj36Y9mxSKEAU4UQo46s9iq?=
 =?us-ascii?Q?o/wR5ap2iJZQEVAPoWIEDnXzL3Qm7UsYVzbIvVHkYZMA+wy9w4whODle+KXM?=
 =?us-ascii?Q?+rWRCG0oZc5/QB7AzedSSHDD/+YZYZfvwETvet6q/GqnlpCaz2MNRnQb83o0?=
 =?us-ascii?Q?bd22SwEmzHR5RqNzzA0uqMx7yNe3gqbm0SLoepcAFxAaN4jAiyyTMd1IG7Gr?=
 =?us-ascii?Q?A/szBycy6VSgU6UTbWJTtKDlmCuXp9FseeYJAYR+L23djgSVeSEItjSdfb38?=
 =?us-ascii?Q?0UuBT8eRfbG7oT8Fdlerqp/+kdQ//K7SVAwvC8yXk4IyFlgrZ4bt/YztNIv8?=
 =?us-ascii?Q?7P7WwJdiik1tbJ5ZcOt60w3LAqxbkJ1xOGv2RKJYiAf4aKAbZZVDiKZpSVgR?=
 =?us-ascii?Q?kKzCLE6dbcK4BwUdKIGVs5Itkxg6a4LeNT/mjv56KJLMPgMajRFC7o87tYg7?=
 =?us-ascii?Q?7DbNAhtqHyOsNhVwT1JezAHiBhgpqcYanEiB4e/CEuex/4T/28aHIrYQ9cYo?=
 =?us-ascii?Q?a4tZGdWsBY1mg5Yfp6eRNt9N+hLOGzCA5XAT68QPAWhjHOKbIoEBnbc1KdQB?=
 =?us-ascii?Q?PiMuJusHKVfvcsHrUWjsLiqsvonP5mh2kADhtEi4ZAy0IsRHSEbMxgNkzy9/?=
 =?us-ascii?Q?EBDzKSN/L3CNF3J15JKHJLc6kykuYewyHu/s2Yt0PcHIswy5//WW2dBYcyw3?=
 =?us-ascii?Q?nu3oVbqtttsO5PMiHtJxIm6obUjDWvXSQzKmnv4sdIrw9Te1Llm3dUrMyvNU?=
 =?us-ascii?Q?+YjItATmgeZSUmSZ4vFXypAtEX8X7yPIpvEO3YqtcOiQh6fALYEiHZbbUL1+?=
 =?us-ascii?Q?Cg8kAzOIDglB7Uk8mIPdAPkSzUhFEB+luhlb7U2phLzCTwWfVRciBsoIkY3Y?=
 =?us-ascii?Q?8xV80GIaz20x7Em5P34jychltJB0X4ZXbT+4G0XneIC5?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7055.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(7416014)(52116014)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hrtMR1hPHnqGXX5l6RGRl7fDd2AuMFqTg9BRKV1zEOPfP6Jq2eR/EN2ANohL?=
 =?us-ascii?Q?zl8Z6IQsAT9ycY3Dp9KpVB1/SA3WtZ0ZIRy1TxfZXpyO3+vtqVgc10HAWJp6?=
 =?us-ascii?Q?yvSIHcs0Hh/MHC3PV+IMhnTHkr0cfqIo9UJbAzeNylgy2YZsiy08WJrFFZdY?=
 =?us-ascii?Q?GfcBYNdg/u7irEs1bLWZUzW1n8uaJ16Ea3zIYyaL7gFm6M4VPT76lMAH0Hgo?=
 =?us-ascii?Q?4xoL4PizziCsni93j0dONKA0+Uxfiz3PeynUPtrYUIW3VRBR1l81i1+jXXFA?=
 =?us-ascii?Q?/YZhsiQfWs7I0nDchuD+ECPSM/Ko/hAOjQK3wBic9yADpP/wlu6BGqcQiG0e?=
 =?us-ascii?Q?i9kBV/mn0NIJrUWgaoQSJBA6hRuIxeXMr9L3/hXQktb+T+zzxfWV8pFqeqnf?=
 =?us-ascii?Q?luJ41128SIfUXjNW+EodiPYfh1J5OTQsbp4VbI32ABznlByky6mqZaMqzafT?=
 =?us-ascii?Q?u4L/Rollhpx8nYPMu/W60k1mHuTKEE4bozYOH2JAB5ekFWZifLcsgCtIGYcE?=
 =?us-ascii?Q?krHPfmrfcYf5YhrWD/LpR7pLCoj/EY+GbSsP1JDBONMyh9gKTWhIHOdg2xPp?=
 =?us-ascii?Q?Dg8Zi2HMQk9GF20OgL631EJz9eJHdKV2FkQwcPV+SOuPYHFEFP8xg+6FCPYb?=
 =?us-ascii?Q?JSB//E2CW93LutpGdLP6w7h2daCsNaTiguAsETKKWRsnD89p2cFnxtoITqU0?=
 =?us-ascii?Q?YXUyT/0rFE3P//nRk9Qhr540owxEx2npoxvicq0UytEkN5ogOokvtAoIPjPj?=
 =?us-ascii?Q?hH8vt9klPPv8fGBRcSj+/NENXPKukYCUR/dSDaFtWTrzS4MyuCi2uKaFoAt9?=
 =?us-ascii?Q?F3+uT8pyjPYPaMSi5ZeGni95163w8MMQKhwyFCmde68o1xwgJnG3d8FGzFpZ?=
 =?us-ascii?Q?sbTSGYTSQQIYbZNVcYu2eLUsvYF7RFfi/k9vkRQ0ATtVBKBgUr4lU6IPgcff?=
 =?us-ascii?Q?mBIl+KxZ3STomftAI8+FeKczYCl4pikRCoXvpknjrFA0qy3t2Px9XNoynDko?=
 =?us-ascii?Q?dsTW8VT9oywaxIsuBIZ36zZ9xTT1yp2wjH5YMYGPQfgV/cOaUKhWBjNw56IL?=
 =?us-ascii?Q?tkQPGbZENgvZeTL6rHhOQNl36ncHDuu8sX7lu+nE1z5a08MKcHk7tOlsGh8X?=
 =?us-ascii?Q?dAn+KOfpMfYIiYPzqQkkf+pFtWna5nzBkvohUgH7B4nqzoC1sJGV5nWr+VII?=
 =?us-ascii?Q?ZTByQC0a5C7yoFkb/XSRy/Q2Lg7VbnvCYZ5dLXWchX8Uyuvee0VO+YB8V/XH?=
 =?us-ascii?Q?qwNqJXT6hv/IuWYXXhIyt+w2PMK0azQnDYWVpJu80G0pc2AGjM09332kt1NF?=
 =?us-ascii?Q?kfjJRNInT+nwGyAu2XVnrmX7heBLIrQGYYH2z+ZYW6kzr5PZQpHjli413DLv?=
 =?us-ascii?Q?99EoBsiKBCNLothEF+E4j44SJ2kTO9OAyZQIk/qLO3zKcBSmNk4/rypKQ6Xy?=
 =?us-ascii?Q?FYKGDhkug/kVRBbJ5KR/lfuaOL9mA8OxrK3psTcEfBhUY3a5iggGRfteT2hb?=
 =?us-ascii?Q?V6U5oRTRPjkDQOcmu+KmE817m7MWuEvlOXt1ry2PPS98ltf9iG2OFe56RCq0?=
 =?us-ascii?Q?Sju8TCO1LYXaHAXDoF5RQ+z7iM2qvWMTQSsWj4Bp9p7qeHltdbrwEPKR1Ke0?=
 =?us-ascii?Q?pK/NCAuEK6D8Ig6sRekvRcM4KEn1LOJMXRBkTlZldnf5gfa7ZE2W2869pjrt?=
 =?us-ascii?Q?Zn57jjDrhAyF7/gf6odWssBSkY+G/E68ku5v6a76gvvHdSAlJ/CKFQti7G1M?=
 =?us-ascii?Q?4k14eNo1xw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d057479-0d26-4fcc-4139-08de655bb461
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7055.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 08:42:47.8346
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x84BqoGGF5DWYsRRTPe8BQKF+zYMG7VizvejlYdBmmhqI1puk7xKwWRUFg2UsKm2/vlyBAMSELdDmxEuMQpl2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11503
X-Spam-Status: No, score=0.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[shengjiu.wang@nxp.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:shengjiu.wang@gmail.com,m:Xiubo.Lee@gmail.com,m:festevam@gmail.com,m:nicoleotsuka@gmail.com,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:shengjiuwang@gmail.com,m:XiuboLee@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,perex.cz,suse.com,vger.kernel.org,lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-16661-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengjiu.wang@nxp.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MIME_TRACE(0.00)[0:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	RCPT_COUNT_SEVEN(0.00)[11];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,nxp.com:email,nxp.com:dkim,nxp.com:mid]
X-Rspamd-Queue-Id: 92B53FBA36
X-Rspamd-Action: no action

The transmitter and receiver implement separate timestamp counters and
bit counters. The bit counter increments at the end of each bit in a
frame whenever the transmitter or receiver is enabled. The bit counter
can be reset by software. The timestamp counter increments on the bus
interface clock whenever it is enabled. The current value of the
timestamp counter is latched whenever the bit counter increments.
Reading the bit counter register will cause the latched timestamp
value to be saved in the bit counter timestamp register. The timestamp
counter can be reset by software, this also resets the latched timestamp
value and the bit counter timestamp register.

The timestamp counter and bit counter can be used by software to track
the progress of the transmitter and receiver. It can also be used to
calculate the relative frequency of the bit clock against the bus
interface clock.

As there are three regmap handlers defined in this driver, explicitly
call the snd_soc_component_init_regmap() to init regmap handler for the
component.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_xcvr.c | 56 ++++++++++++++++++++++++++++++++++++++++
 sound/soc/fsl/fsl_xcvr.h | 10 +++++++
 2 files changed, 66 insertions(+)

diff --git a/sound/soc/fsl/fsl_xcvr.c b/sound/soc/fsl/fsl_xcvr.c
index 5de93f458b56..d9e76ea9cf07 100644
--- a/sound/soc/fsl/fsl_xcvr.c
+++ b/sound/soc/fsl/fsl_xcvr.c
@@ -62,6 +62,50 @@ struct fsl_xcvr {
 	u32 spdif_constr_rates_list[SPDIF_NUM_RATES];
 };
 
+static const char * const inc_mode[] = {
+	"On enabled and bitcount increment", "On enabled"
+};
+
+static const struct soc_enum tstmp_enum[] = {
+	SOC_ENUM_SINGLE(FSL_XCVR_TX_DPTH_CNTR_CTRL, __bf_shf(FSL_XCVR_TX_DPTH_CNTR_CTRL_TSINC),
+			ARRAY_SIZE(inc_mode), inc_mode),
+	SOC_ENUM_SINGLE(FSL_XCVR_RX_DPTH_CNTR_CTRL, __bf_shf(FSL_XCVR_RX_DPTH_CNTR_CTRL_TSINC),
+			ARRAY_SIZE(inc_mode), inc_mode),
+};
+
+static const struct snd_kcontrol_new fsl_xcvr_timestamp_ctrls[] = {
+	SOC_SINGLE("Transmit Timestamp Control Switch", FSL_XCVR_TX_DPTH_CNTR_CTRL,
+		   __bf_shf(FSL_XCVR_TX_DPTH_CNTR_CTRL_TSEN), 1, 0),
+	SOC_ENUM("Transmit Timestamp Increment", tstmp_enum[0]),
+	SOC_SINGLE("Transmit Timestamp Reset", FSL_XCVR_TX_DPTH_CNTR_CTRL,
+		   __bf_shf(FSL_XCVR_TX_DPTH_CNTR_CTRL_RTSC), 1, 0),
+	SOC_SINGLE("Transmit Bit Counter Reset", FSL_XCVR_TX_DPTH_CNTR_CTRL,
+		   __bf_shf(FSL_XCVR_TX_DPTH_CNTR_CTRL_RBC), 1, 0),
+	SOC_SINGLE_XR_SX("Transmit Timestamp Counter", FSL_XCVR_TX_DPTH_TSCR,
+			 1, 32, 0, 0xffffffff, 0),
+	SOC_SINGLE_XR_SX("Transmit Bit Counter", FSL_XCVR_TX_DPTH_BCR,
+			 1, 32, 0, 0xffffffff, 0),
+	SOC_SINGLE_XR_SX("Transmit Bit Count Timestamp", FSL_XCVR_TX_DPTH_BCTR,
+			 1, 32, 0, 0xffffffff, 0),
+	SOC_SINGLE_XR_SX("Transmit Latched Timestamp Counter", FSL_XCVR_TX_DPTH_BCRR,
+			 1, 32, 0, 0xffffffff, 0),
+	SOC_SINGLE("Receive Timestamp Control Switch", FSL_XCVR_RX_DPTH_CNTR_CTRL,
+		   __bf_shf(FSL_XCVR_RX_DPTH_CNTR_CTRL_TSEN), 1, 0),
+	SOC_ENUM("Receive Timestamp Increment", tstmp_enum[1]),
+	SOC_SINGLE("Receive Timestamp Reset", FSL_XCVR_RX_DPTH_CNTR_CTRL,
+		   __bf_shf(FSL_XCVR_RX_DPTH_CNTR_CTRL_RTSC), 1, 0),
+	SOC_SINGLE("Receive Bit Counter Reset", FSL_XCVR_RX_DPTH_CNTR_CTRL,
+		   __bf_shf(FSL_XCVR_RX_DPTH_CNTR_CTRL_RBC), 1, 0),
+	SOC_SINGLE_XR_SX("Receive Timestamp Counter", FSL_XCVR_RX_DPTH_TSCR,
+			 1, 32, 0, 0xffffffff, 0),
+	SOC_SINGLE_XR_SX("Receive Bit Counter", FSL_XCVR_RX_DPTH_BCR,
+			 1, 32, 0, 0xffffffff, 0),
+	SOC_SINGLE_XR_SX("Receive Bit Count Timestamp", FSL_XCVR_RX_DPTH_BCTR,
+			 1, 32, 0, 0xffffffff, 0),
+	SOC_SINGLE_XR_SX("Receive Latched Timestamp Counter", FSL_XCVR_RX_DPTH_BCRR,
+			 1, 32, 0, 0xffffffff, 0),
+};
+
 static const struct fsl_xcvr_pll_conf {
 	u8 mfi;   /* min=0x18, max=0x38 */
 	u32 mfn;  /* signed int, 2's compl., min=0x3FFF0000, max=0x00010000 */
@@ -1073,8 +1117,20 @@ static struct snd_soc_dai_driver fsl_xcvr_dai = {
 	},
 };
 
+static int fsl_xcvr_component_probe(struct snd_soc_component *component)
+{
+	struct fsl_xcvr *xcvr = snd_soc_component_get_drvdata(component);
+
+	snd_soc_component_init_regmap(component, xcvr->regmap);
+
+	return 0;
+}
+
 static const struct snd_soc_component_driver fsl_xcvr_comp = {
 	.name			= "fsl-xcvr-dai",
+	.probe			= fsl_xcvr_component_probe,
+	.controls		= fsl_xcvr_timestamp_ctrls,
+	.num_controls		= ARRAY_SIZE(fsl_xcvr_timestamp_ctrls),
 	.legacy_dai_naming	= 1,
 };
 
diff --git a/sound/soc/fsl/fsl_xcvr.h b/sound/soc/fsl/fsl_xcvr.h
index dade3945cc0c..1c3636567763 100644
--- a/sound/soc/fsl/fsl_xcvr.h
+++ b/sound/soc/fsl/fsl_xcvr.h
@@ -233,6 +233,16 @@
 #define FSL_XCVR_TX_DPTH_CTRL_CLK_RATIO		BIT(29)
 #define FSL_XCVR_TX_DPTH_CTRL_TM_NO_PRE_BME	GENMASK(31, 30)
 
+#define FSL_XCVR_RX_DPTH_CNTR_CTRL_TSEN		BIT(0)
+#define FSL_XCVR_RX_DPTH_CNTR_CTRL_TSINC	BIT(1)
+#define FSL_XCVR_RX_DPTH_CNTR_CTRL_RBC		BIT(8)
+#define FSL_XCVR_RX_DPTH_CNTR_CTRL_RTSC		BIT(9)
+
+#define FSL_XCVR_TX_DPTH_CNTR_CTRL_TSEN		BIT(0)
+#define FSL_XCVR_TX_DPTH_CNTR_CTRL_TSINC	BIT(1)
+#define FSL_XCVR_TX_DPTH_CNTR_CTRL_RBC		BIT(8)
+#define FSL_XCVR_TX_DPTH_CNTR_CTRL_RTSC		BIT(9)
+
 #define FSL_XCVR_PHY_AI_CTRL_AI_RESETN		BIT(15)
 #define FSL_XCVR_PHY_AI_CTRL_AI_RWB		BIT(31)
 
-- 
2.34.1


