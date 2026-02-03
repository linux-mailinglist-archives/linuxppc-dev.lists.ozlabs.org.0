Return-Path: <linuxppc-dev+bounces-16530-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cIqaM9dngWl5GAMAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16530-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Feb 2026 04:13:27 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C6BD4026
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Feb 2026 04:13:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f4pTT5sB3z3bf2;
	Tue, 03 Feb 2026 14:13:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c20a::7" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770088397;
	cv=pass; b=gmDEt/iNA3R6iGN9NbdiiFrt7sPrLIC8gVfpNgIngCNUsbKhaWK5kxo7YgASUsz/n5q9Sf0r5s9LVfctfPgXfpFelbXoXZ2HdBl0W9Tb1a0xbHWOSCiRIhjQwc2/ongcaM4kfumf02BOsTVzEFjPEReeWey4YfOm4y7d/99yy4Kedgnx6D8KqzZ6tKtAMRLu/jAenKJ91j/LtDSRxnSQJuzuBAMpOa07KRthVPSMzQEUXixwE1Qgrzgo8sijHwRWKmIWqEb2PiMiGvwj5x3LfRk8A+IeXpdUQmOHgEqxJvI5oUFHoF5BHASyKMnfWpAKlwtEOm8xee2BZmvlhrUmGw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770088397; c=relaxed/relaxed;
	bh=nNXdQu7qKQibZxnaHuOS3FriVHNa4qDe1PvKS2UOwyg=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jpU/x7OUnlRYwHsLJmuJM/+3DNFGKT3SvuebkIsJA5bU3/gIG6izTcx5BYrWkTEjNpXkaw6aD+8E9hbfmpoqXr3hCOyjQqNJ/BhkU+XPkm5vI2p+QEonXeYbnA4FAO0b2EkW1rpdLF2TuuTGjjYBJHGp6o510roA/ocATu60CuVFOfDdPmyeIY2zRBp4z3vbM8dl0z3BEXu9ffLenjCTlxTE8t/lrJWKr7xJzHOUV6NEVv98tHvisBtW2X9gGE62CZKzkwfVbi7U3kKKzVDn4A4oOrq7srwAfgjcqv/KnaYzaLBgIgxktkJK5uH/DQrfyfEchIuSQJnS8YHXQvtdEQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=WqXepWAb; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c20a::7; helo=pa4pr04cu001.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=WqXepWAb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c20a::7; helo=pa4pr04cu001.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazlp170130007.outbound.protection.outlook.com [IPv6:2a01:111:f403:c20a::7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f4pTT0gH0z30Pr
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Feb 2026 14:13:17 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pyDYQ5ywi2dNoUnijTiZlZ5JuvTjZyOseSVZ2IQS3NYMUGY3Tyr3RHE4/OOlohyDpEmfA8jgtJNOayEb7ml8HiSQAKT0TwDFQkMg7u2JAln7nl9fk67b3FvVoZYZIIgjt+UMtCwxdAytNeVnPXHsiE3VFbzm31ceF7hhi+0duI3izj25shCc9fetuAKGgz9bBd1Vp1j+9vn/fiA9pO8EjQdPmt/Vcsg2ysggB3MUe+AFUuhcK0zoWm/sYSWnlTMKJrOrnD5UUOHFZS7BTNoqMtIBRDeRs+gNpAuVj+GME7p4ieYQlJgwIa5Ssg4qXt99h1dkCIGYnYNs5Wt5VlC6lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nNXdQu7qKQibZxnaHuOS3FriVHNa4qDe1PvKS2UOwyg=;
 b=KbYVTkV2VvkyaXvD9vNCtMeFk2VrpwOVCFdnieCtDSfPkaxyhSvCwNQChneIVJJ1UnjFr/YktN8VHPnVh9ATomMiEjn+HDhpkxYdRQjFhPGHCn6m7ayddqfTPUmZNsSwJdLpzOmErkXFW8zJGznBR4FhBCwRhmOsCPZ+cgOpFk5SOWAqUQ3WVzsV5BHteVHtMgzhxB5P1sLwvY6xgAefZIb3fFuuIYMiUZTp10527vqIDYU5SOC5zekee6Ykfrc5TYaskcBG4wcRAKMKeyk372E4Euyq3YQvb0F3g0paBhwH3Bi3wWmzTGcD529TYTIfPJ5ZGlxQkZOO4+8SVQ1pyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nNXdQu7qKQibZxnaHuOS3FriVHNa4qDe1PvKS2UOwyg=;
 b=WqXepWAbGEWV19TaLPjnhztl0cXv6iqTKs4erQNiugEzHrmlljIViMkPLaYe00rCfaujnoQrrp22A9Lua/k9Z2Mbgw7CfzT/OWad3s6kbwxFXZqzW0otYzQ2jm6mLoyo31mA9WA9MmJlMPMG8JTGt52UELPpTLFqWHhAib8dXmcapzMRJVJLnG3nw+xoz+p1IIe2g7n8EI1bKEKheSKhWC8dHTCsn1Zjx4W2MIn1UXM1Z4LTB78EEhpdDDq9fOW3SqzAGkpN+F45ivq+5QHyfn/I9H4RneOq/bYJ9ML9pnAkJrgNFZjn2GsN2Uo7RrC7fH7JhYO3nwvQ26hjRnafkg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB7055.eurprd04.prod.outlook.com (2603:10a6:800:123::21)
 by GV2PR04MB12271.eurprd04.prod.outlook.com (2603:10a6:150:32a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 03:12:49 +0000
Received: from VI1PR04MB7055.eurprd04.prod.outlook.com
 ([fe80::d6ab:1538:d868:bf8]) by VI1PR04MB7055.eurprd04.prod.outlook.com
 ([fe80::d6ab:1538:d868:bf8%7]) with mapi id 15.20.9564.014; Tue, 3 Feb 2026
 03:12:49 +0000
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
Subject: [PATCH v3 1/4] ASoC: dt-bindings: fsl,imx-asrc: Add support for i.MX952 platform
Date: Tue,  3 Feb 2026 11:13:42 +0800
Message-Id: <20260203031345.3850533-2-shengjiu.wang@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 4003f64d-f258-40b5-0702-08de62d21c70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|19092799006|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CEQNIYtDVBez3A97hJLIXbC9zrlas0ElXQOXQYQ9EQtPpaDoxYr/zDWRzcAj?=
 =?us-ascii?Q?srUnmhNXipoQrOVL90tGkaL0L6S96hMS1Pc3VD0eQY3Zo48DgV0EApb4JUwe?=
 =?us-ascii?Q?9lwPo1jFk4q5k+35brWukWTm720dJeSXOhPdPTl4Pxhtf0BKpNK+K20OSN1+?=
 =?us-ascii?Q?6hbA6LEla2zwAA99o49+G5XIyr+PDgHvuDeZW3zaY/bEsNz7ZOTJ/810xz3B?=
 =?us-ascii?Q?AcarEnD9y6vVaoGMxtioN1PrOk7Ph4gWNGoOQAhrS29N9F5GHWgi1PwKnUHU?=
 =?us-ascii?Q?eyqoi6Rup9J4WyWRvVcd9roYiRlbSPcnzdH2aTeRNWQrQ67+5QeZ/NVncmnw?=
 =?us-ascii?Q?eZTWBKaKtLd3FeHfp9TTqynxzPF18e4NohjDxP3feYcSmQGUWPSYNh1VStTA?=
 =?us-ascii?Q?M+7q4C9N4T00iYqOErT/Edc8n2SGbXXRWwAeyB0PvrIarB9RArTrOQS7HYRz?=
 =?us-ascii?Q?b+ephz/FkQoRVEm9jjZ8jRtNUeWJtCUrzXal1InyoPXy6N5fgO37uOyCH+6v?=
 =?us-ascii?Q?OfLQl0opILb5F5tOeltuZEZGMvn2Rh09ztfQzbkDJ9+bLEaaNZKffGPe+Vfc?=
 =?us-ascii?Q?fB5TvTHZcFzNiJCfhvozbgCJp2PtboH17B/eWCZ4Ov0WCcauK7Z/lfftJF9y?=
 =?us-ascii?Q?9TmUlYtRWbSQzopsmZCzYoLF6EcYm0L2e8tiK/xWsTh4RaznRa0Xkvusq7im?=
 =?us-ascii?Q?znhIcbuWezTn5Fg3ILHAcsxwooAQOkYLCCjy6qsXMYSf/jlAHr3RojRBO/sC?=
 =?us-ascii?Q?K88qP3iNTwE1/EmkaIF9Q7WQp/SxMOz1kW+Fp94HVp6fkTJVgc884nIAcuDR?=
 =?us-ascii?Q?+jmevxiKV8nwJ2+GcCEE7TC6mnmtCcTpUvcLmrNXrFK5XCTH3tup+n2TiwqL?=
 =?us-ascii?Q?AKQ/fqPmvX4jnEHb6x+6NvKG6Y/fN91k2WjNpBGfy8dLIAmFsBeDRfhJu5DH?=
 =?us-ascii?Q?Ws7Qi0SaOH/FSxMjy8ZO0lz94iZHvVCopBNZrnZ8ZC/oFT+F8RcMjT25rtD0?=
 =?us-ascii?Q?TEvXpeJ0TZBoDk1y3EdJggDBtxWT+vGEp6pr/WbaZsBrJohkjxlR7K/ucwIs?=
 =?us-ascii?Q?f1nQHtJi7YJFhjlbuY0CswqJ9qnYVTBT+vITOL+EnjAg+tbW+s3pikdCe62a?=
 =?us-ascii?Q?JqcZ36p8uBz7VV4QyoFKnv2qu/09ei7FJYmXqR8Ijy09+iOMchewIuQYse6z?=
 =?us-ascii?Q?yUaklGsv8aXtfZCNZo7TgrJG0ZI89gzR9KKmmTVS3leqZiFo7Db4uQxYROBV?=
 =?us-ascii?Q?5FuHeZWNswgJQUMZk9uqbn+r0R3dlqyPyRNtwUfo+QL8xHfbSkcNe6aiKscR?=
 =?us-ascii?Q?1re7VfcoSdUIXQ9Zw5+0Jd0JndIs2XYhRDa+rl6DCdelb6QCpcixlGoeFWkl?=
 =?us-ascii?Q?Bmw9fKp8gMF79c/BjgTqbzwSRZvzXEAoN3lSxzuxe7yUAZICdGiGlTAn9gAh?=
 =?us-ascii?Q?lwHTOdONlwuvVjSGgfLJgRcZsQNnAFIgY+1NL1JiPl1QEGELsKyBCrn7FAN1?=
 =?us-ascii?Q?Ndso9EJIGIpYLz5n8fVZyGJ2R4ALMz4nlFVDZQI5WiTfM9Ymz7wM7lMrPNUD?=
 =?us-ascii?Q?lliMY/AsJ0KTlPHFys4eSgeVSUtsyw9YD0bJA0GaXigjHj7S+7DqivdxuXua?=
 =?us-ascii?Q?anRsi2XqNmN4iH4GsD/eJKI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7055.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(19092799006)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jdrH2zMuKzBbHu/6NV+Oi4okIJ6xnTw1ulc22qnmLZw4nRkdVtq7MOUlpfeB?=
 =?us-ascii?Q?WafXic0Ccj2UeWr2eBUet78ZX3KiOW0BpIOLuKFTC7VteNnn4W4Gs5ghSQbv?=
 =?us-ascii?Q?/ho/w7IGoJ0zU30JZq1xLWKO+WVuLgrSBHwHNNVdtbb5WhZycDPXHiV6cXsm?=
 =?us-ascii?Q?CNlvpFvhMioEUvPuQNPTMDnZMunXpFG2HY351s6fEghecBr0EmhIhaUSfR4t?=
 =?us-ascii?Q?rej0XjEKyokXg9Fv5mEqJkGigfASsHmbUNR8xVW5YIg1DPwU2JWYmRgwXDR9?=
 =?us-ascii?Q?B+IRqz0gQLkGL69L6/SJT1F7E2f3Fw8nQDaQ6WchaHBwYRUXlHwyXqNRAKrw?=
 =?us-ascii?Q?g27ExfPRL8BNMhm+xhMiK/VKtm9xK+VUD9i5XAjNsxEeUMymO/bhRMEnRbrZ?=
 =?us-ascii?Q?gb+0X+MBxs02bnEmJ2EoFpFVWZ2u7xb2zwXMKuEv5lR9429JWqnO0mq+Qorp?=
 =?us-ascii?Q?da0Piz749pEYw9QcraiOOV0Rx2/t6yZNNG/jvOq4410pPQg4WKAUIADb/hkg?=
 =?us-ascii?Q?fIGrzNDY2hA1zhKIycHmyDX76OTZgYzNdugEAKidewDlv4qfACLdbQzlxX5D?=
 =?us-ascii?Q?XX13drleKRPRA4rjEl6GZ3loVM/ojehs0Laf8Zu9MAVkJ2Pvb+fzTrAB1uj9?=
 =?us-ascii?Q?yc8zOeJ+rQfV4hVCtb7/GfeIXfEG8x8LOv6DQRGxSKYOWSzQGiMmD0uofkpk?=
 =?us-ascii?Q?l/bosaVUR6rRUx9yA4D29l5mA1lGcgGJ/NAOR3bwcwLqEhFY3dz4PPejLPCL?=
 =?us-ascii?Q?/qX9IQAk7/Qkd3Ohu7tW4XdfqApKwtXNBMVLab2N8fXLrh+25JvHPByH0kfH?=
 =?us-ascii?Q?fjzTV5+642A5CBB/oCQtMJMhA3DFrFLfzyyv6J0XY1q/FbOmCgCvUXp5otoF?=
 =?us-ascii?Q?vj4O+fapsGBXT5kV2M83w4mAg5KQAKGfNmeUbeHs2GEVFPboIIOi2otJFeDC?=
 =?us-ascii?Q?mDgTxsc+FxwDjVa1AdowIjov+HY5JExZJlsNP6tJsrfAhPAHdJcw1UR4Ag6m?=
 =?us-ascii?Q?HWJZIOoVrZaJ/rX/BRK7GiD7+ViILQdwH/GKfyBCc1PkjEhQIclAGvII0uBb?=
 =?us-ascii?Q?c0lDoX1Gm8m565S7U+rKVz9JlEW+8Yg8NVD21u+Vw66sGFbpZakYAD1nb4Fm?=
 =?us-ascii?Q?aXTZly0tIdZ6oe2LmrKmECOOUSPhgIJlmNzZDJ9ihVwx7EzeN0qx0nIAsg1B?=
 =?us-ascii?Q?r6H1uIDAQdEbjtYmr6vwZ4nc9kIhutrD9ddNoBNPGpkhoWCdaTk4jg3iz9OK?=
 =?us-ascii?Q?pzkA6JbnvOzBUf+jmNklWpDLG3agx5ZzBdbmwzh5PCrYjb6MJRz5vF62wnNu?=
 =?us-ascii?Q?3OFOOyOVPzU1uRrAh/Ell5fKLehu3B8IBl3FMWkSCjTiWnx2UZQ7uEpp6xho?=
 =?us-ascii?Q?+iDtUESD2wNpliyOTlB1aerUPSODt7Y6An38Vlsq9Zok7zSf584E1dgLj+pa?=
 =?us-ascii?Q?MRvodxuWNvv1LQfxX6oPMOClpVGSrqKLvHdUCn8DouTZw2vqABeDwJrcpzkm?=
 =?us-ascii?Q?w0HZ0v72sWArocj1lUoGJZaLN3wfOcBW8PDLiTvmGkZdz9IDrrShG8svoVnn?=
 =?us-ascii?Q?JRPMf2t+OzuqkVjk3lP5foWYjvxJAurC8D7aL4eGWhqhUbckn3kpwlvqa0A5?=
 =?us-ascii?Q?a2PmmfdjW6NUSZ9DnuzKJpDsWEddvoPy6jOjMuMDUcq1ElBkudzf63heXXK/?=
 =?us-ascii?Q?7kgyJoqxFiStq9h3ZCXDtiEaWr3X/I2u0A5HIpmssUYV9S09Tydz+MKy6Jlk?=
 =?us-ascii?Q?OD+EB+3Jrg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4003f64d-f258-40b5-0702-08de62d21c70
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7055.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 03:12:49.6732
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SZkaKZ7knD3G3BUNQalgme+C/R/4XXP2zQ+YVC6geaOQaQSHDOF1nDsqStO/NGtwHJo6FcrJTGBCY7/yMjezlQ==
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
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-16530-lists,linuxppc-dev=lfdr.de];
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
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,nxp.com:email,nxp.com:dkim,nxp.com:mid]
X-Rspamd-Queue-Id: 27C6BD4026
X-Rspamd-Action: no action

Add new compatible string 'fsl,imx952-asrc' for i.MX952 platform,
below are the differences that make this ASRC not fallback compatible
with other platforms.

1) There is a power domain on i.MX952 for the wakeupmix system where
ASRC is in. But it is enabled by default, ASRC device don't need
to enable it, so it is optional for i.MX952.
2) The clock sources of ASRC are different on i.MX952.
3) There is a limitation on i.MX952 that DMA request is not cleared at the
end of conversion with dma slave mode. Which causes sample is dropped from
the input fifo on the second time if DMA is triggered before the client
device and DMA may copy wrong data from output fifo as the output fifo is
not ready in the beginning. So there is specially handling in the driver.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 Documentation/devicetree/bindings/sound/fsl,imx-asrc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/fsl,imx-asrc.yaml b/Documentation/devicetree/bindings/sound/fsl,imx-asrc.yaml
index c9152bac7421..608defc93c1e 100644
--- a/Documentation/devicetree/bindings/sound/fsl,imx-asrc.yaml
+++ b/Documentation/devicetree/bindings/sound/fsl,imx-asrc.yaml
@@ -25,6 +25,7 @@ properties:
           - fsl,imx53-asrc
           - fsl,imx8qm-asrc
           - fsl,imx8qxp-asrc
+          - fsl,imx952-asrc
       - items:
           - enum:
               - fsl,imx6sx-asrc
-- 
2.34.1


