Return-Path: <linuxppc-dev+bounces-5385-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE89A16821
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jan 2025 09:21:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yc3FG0lZtz2yys;
	Mon, 20 Jan 2025 19:20:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2613::60d" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737361250;
	cv=pass; b=cL5GNhNONW2vEX8Hgw28WabAcvGob+1x961tjFnDTuj3Hcn3C7yPQPyqpxnJhVIRxGL29cxNbDzGv3KeBQkox1D30zaOYy6NvECC57zhIwgca7VfK6ZK6vKM10ZgUB5cHujtlf4qg3TvJJFeEMx4p72czoHZuLaO7bxggPZr4Kb/PFrzRbw+wrTM6SxzWsAa0Ui9Igq/u7DOVIBMZy222dx5v/uO+iu0S1kQth6B+anmZ+JcvUhDyJhvlMIU7JPZQ1jhxP/yUM6q9YBD64jZLTKdYUbmJiZJycHBGvTeQ5HSPlUGZYpDplOQg9Bc29mrYN9ogIfDjnFCQcV8+enuQA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737361250; c=relaxed/relaxed;
	bh=60PUvq+kqo8ZtB6HHCWWbhm607K49VvYrcNwSEFSI1c=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ex2VLGNPE9IoAtPyx8AgC9m+2rjw2rkt4vsASUFoJ3M8vbNk8PKXdr4ImFJuvZJkbmaZsoOm3HQfNVAT8/QwUCcVct2NWVbEE8UNTfw+tURkN+Rw26tS8RJLAZkwXvDU27O2/bJaTP+h9CiJzji4Csz1MBQdJskOQ8zDGcb7BfhI+DJhXG0EuieHKdeq6QZbEUezi0tyHG5mPhw9m5/4xcXycsV79F+5Yxym908EnN3ma2u+aQLTVfBH0j9fPedhjVaAP4GQ6PhmWwQ1ZR9weacAZ+pqcNStNgv1NIpEaTV/9i6qJD0kq7iV3vrWwwmmtBqFYEu5LKzBd4s7aqXFaA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=oAlFq53I; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2613::60d; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=oAlFq53I;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2613::60d; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2060d.outbound.protection.outlook.com [IPv6:2a01:111:f403:2613::60d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yc3FF2rgGz301B
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Jan 2025 19:20:49 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t1aZXda+Lx31iQ8spz6/QR0nZ43NNqkkFquYSv6cb5CtYm6GN/0H6LTmqZ+qqqBJcjWHl/dIzB7UVTm6aUbyAsgHGJyVAecb30gosXd+OM27lT6r10st7t0EpnYR+cX1VWMi0xShVJ4a/I/0B4ufqriS8SPqeyOCxtbh8048ndKtBvsr6cpgnWG0Sp4MfFZ98gI6uXpBm0iOvCXs3rxk73TOjx1sNjusw2TFE07wOEycPXVjEzDkvOjmj8nxw2dsuHSNksUgH9ySkSsck5+LcNUnA0PCiHU9fypVICHZij0zsvG9T3+xSIeBp+TdwwERDe9PIrz2Azxc3J5CHgzB9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=60PUvq+kqo8ZtB6HHCWWbhm607K49VvYrcNwSEFSI1c=;
 b=hLoQPdNCcyljK34bFeO3cVTZxqsg7hfjMER4lM/AWCdCEbJbckBPDTBCzUPIBvcyD88Q097FLDJeetJpYL3SGjqGEeyRtGWtlKrpuCOMeD5udRT1GTqVmSpPrwsSuNiESU9ox5VTH6ei8QOvAI5K2dT8g9ryZAtqSxBqwtvAC7u4Fpyp7OAlCL7yu1lKv3KCs3cU8whaQfFKl/NCVIs12qcoU7NgB9RLjNNW8Ga34UAK7R5p+dI6iEf/hFf5BoEsM7agg394KSOrXTmJ6VbpZnknNHr8h9zvQ2vyk7WOZNCDliScZ40vo0ktcvsnP1VSEwgXQNSACy+5V6Iicv5fVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=60PUvq+kqo8ZtB6HHCWWbhm607K49VvYrcNwSEFSI1c=;
 b=oAlFq53I1aZy5C4oKIPegUOlb5OObUzj2LpMZOb6pyOZsAGzA5lhgrHHmYS2UkCaTESZmmx6iYhQWIFlICurBwicxOINezUboVK73zWg9wriHohsYOIP8LxSehN9XYTuz0YK+N/jyEwDOGGL2nwQB4Dy+7oO9lOCfr41t8XfxLwyn3Q7Q18n2331zUtdV86wtFF/kL3rzTgEfxk34fFcq+pYqvKJHM/w05tOLVTfcRYhJvNBpj1Kk6jcj1BL+j5Pmvs7gSulzXiMnWnZP7MSAdoaCculwa9kQ1n0bsZUryGZI/BF4uzK/vbBgMD369QpVo3MO7eUC/WDVXwIVfKkMg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by DU2PR04MB8933.eurprd04.prod.outlook.com (2603:10a6:10:2e0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Mon, 20 Jan
 2025 08:20:32 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%3]) with mapi id 15.20.8356.020; Mon, 20 Jan 2025
 08:20:32 +0000
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
Subject: [PATCH 2/2] ASoC: fsl_asrc_m2m: return error value in asrc_m2m_device_run()
Date: Mon, 20 Jan 2025 16:19:38 +0800
Message-Id: <20250120081938.2501554-3-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20250120081938.2501554-1-shengjiu.wang@nxp.com>
References: <20250120081938.2501554-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0008.apcprd02.prod.outlook.com
 (2603:1096:4:194::12) To AM0PR04MB7044.eurprd04.prod.outlook.com
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
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|DU2PR04MB8933:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ea227c6-5e6c-435f-56f6-08dd392b4ea0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|52116014|376014|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dfUYdFVq8MoYczlOsfvKMNTBs3YwGlsOll1zz5txkddr2lhfkfLNnSLyjFjg?=
 =?us-ascii?Q?rEKHP5SUggYk/r7cOMup9T8GVSv/Lp9z5V9dF6XaX+19GHVyFGIQJMvnY0jw?=
 =?us-ascii?Q?UcYvtGjReqUTHAvF4nGQelKBQ2VPDOPT9Sw4BQVBigUYgm5qtfEKtbrQ6XGz?=
 =?us-ascii?Q?tHPl40kEatFFH6fuWSIAdGyl5bwJK4qWImXDZ30WdPiddRXepwwidbkHoGId?=
 =?us-ascii?Q?0IvZeW18T2KMM71FsKVBksl/OofTOgYZq/QFjt9cp41k+mQcpSS9Nx5EIjfE?=
 =?us-ascii?Q?1fav3cIMvpLzF8HOJyEENJRonwycrcnKK0/SDZc9Ir3nF5q3ZhfddGfhORoB?=
 =?us-ascii?Q?BVRduf8Cv5/otSMD1o7CHrGAkhhpo+2IefwatKaeAC3X7g2oCw8qPvX4hO6d?=
 =?us-ascii?Q?nqyg2kmFB2x/kFmZ/FO0PwzjDpySipQbqJQ/7Oc9odDbHJqlrx+s+cWdquaf?=
 =?us-ascii?Q?WgsMJpkiZIwFhBeggnAO/izzs90cFwm/tTKgNB0Or7/Wng84IhyI2G5L6VyM?=
 =?us-ascii?Q?jivTRh3pa4z2qvy0C7cMDxh6JK4CN3xpnzA6pQbCxTULhPfK8xgtbmV+fdMV?=
 =?us-ascii?Q?azusheFDq6/3UqY+3Z21var5rwgoLEKBVuawymZWmH/gGybB5q8Vf7pLwRxg?=
 =?us-ascii?Q?xz60y5iiS56bXG20LtkmoV5cOmWpdg9ifIKePQrL5pb7yHpD5GGSwybvfFcY?=
 =?us-ascii?Q?WWcfas5hTktZZU9j5BR/ePFX95zqrgZTRuJmMfQMZuXcs24f8X7nEAe03bq3?=
 =?us-ascii?Q?cnjeyfHV4wuCTg4by+jgSKqhYslKegSndxgxXHDh+1haFxCtlGCORcc/i+04?=
 =?us-ascii?Q?7eF17BgiWFQYOx09reUsaRP/8CkDQc+qrPhVVTllw+pan4qZZmEX0IjQpUbw?=
 =?us-ascii?Q?jcc+ICXoIePM+ttky2a0l08+Az2osnkODsti60a89uclsADfJhLhtXXEgXAi?=
 =?us-ascii?Q?/0HTiDlwB3TTbkvVCaGMp2Pz7r2l03k3hnRp65RMBng4aM5FNj00CoGHA0tm?=
 =?us-ascii?Q?5tu1kfy5b5Y8ZNO0NYBjJHNRDWQ3ft8VhMhphfS+QZSz3Em722i8wb9ZYhSL?=
 =?us-ascii?Q?nluL+JLZ8B5m6JCZII0uDfzg9l5CRJ0UirV1FOACLJ0LDM0Oa/gOARyXSg69?=
 =?us-ascii?Q?aeqH/5hy2y/8CadHZPd1qKd62A/lFTdJIUq6HpzaAmYBXoKz/uOj/w/ltv1I?=
 =?us-ascii?Q?L74tf5todjcA8yY3AYS26mkCWfKAk/lu9ce21qqeYTzjVJDRQRmydDhyZQ/e?=
 =?us-ascii?Q?Ir6oV4gzi8XVex0JQFK0rpvsVLFAFtXSS9Q1JkLSxkFKdB07SDx+Vbn2NkpA?=
 =?us-ascii?Q?Vky0EEHpzYWSbZ2cfZytN9mcF2llLaJsuuV9aKUURDfU6ZEQixwW2gP7EXPE?=
 =?us-ascii?Q?Ng5O0kKPT+er/anPwgq/W9uy79pMENC6x2ayh+ITOiAFf/r/E6q3bQEKNPL0?=
 =?us-ascii?Q?rdTo3r8oboLA7rYQHcyVoUsIVBSn5YMnn+hNCBApOLCFPk3DDWY3HA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(376014)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PjZ0zXNCPGZk2cmIMCW3eWk7NPF1hXo1tKNaFgM6F34SZeN5HVYD7dRIcInh?=
 =?us-ascii?Q?GWqrfAvEJ0uqyDayUCJ8VeigjcVLLVkbJFahvqhgbbg3SwA0pBaWjWUG34XE?=
 =?us-ascii?Q?KsnZzkvjeZYG25ulEOrQqPtpE+XsMecmIPUnfXv+VOJH6FgoIKhUYybhNWId?=
 =?us-ascii?Q?wdJ63fe+6+doSHiBgL79WFpRnioqJ2mJN0fx+zfLKgDif5OCVkOaMR3a9YME?=
 =?us-ascii?Q?2OYvWzEXZGvIP8V2tNgJ0+lwKuOU3NkhkZ9Yrc2yruKN6Kef5V9E9G5GtmfP?=
 =?us-ascii?Q?3ukJ/z3NGRRL0SX4zQYei30C5CF8FMZl9OK0LAuW9OkH28M5tCN1BoooS4PB?=
 =?us-ascii?Q?djo8TPuv8ppyR6IhKTGyqI4aW+KH8U0QfVl29HfiyOQMommTeglX6Zrfe0LA?=
 =?us-ascii?Q?5WzZpIDdJR5PHS381q3gGcA/+hEaaD0t2Ai13MADf5Y4WxrU9qMkqN+jEWC5?=
 =?us-ascii?Q?c3YCRf16AF7sRstzdSRaZZMfo8oaJd2RG/3WlTBNbHWZ+B8lPJGrEtdC38EL?=
 =?us-ascii?Q?O1bIEK8EYRUZGMRlao7LcGFB4NIreJE4TOiCOa0HViuptfNp/1DhU2MC1GlD?=
 =?us-ascii?Q?s0zMFC92NHlncbjgAIylGLDhrYyyCeA6XidrRC0kKh6Cs1ZWRu7toyC6vPbS?=
 =?us-ascii?Q?pK9kUWfzLq0XkcZxY4mBt7zWdbbDVZl7YDNqm2f5fK+3VaTcK6FCSXhheGX2?=
 =?us-ascii?Q?dYW/DKIt7KBkVAz6fZ18cKAUwxmbIVSoVDwZkAob7bIhaHj+BAXjCzhhYKEK?=
 =?us-ascii?Q?dWSYJTHyT7Eee70EwSVzs6YTeS7YFMHstdNBsQ82LqLsWKQ6eekiGNWi4COH?=
 =?us-ascii?Q?E6oWP67Vb3nTVX/CP0LNSXuHmTuh49OUgVgj+BKNWw2v8JCPfPMAxpCW0m96?=
 =?us-ascii?Q?q3a80NOjc4kwCVqy+4D0gkk0myDaBJEmsME1/q6fiu+wo0Co48g2M1+pk3Bb?=
 =?us-ascii?Q?bIuRQ9smoPjGLDNfM4JCHJtwjP0cbnl8VFKvLFvUt0hgvv8DiM1rKs2ISgYI?=
 =?us-ascii?Q?7cMO66/+PAxknrjuQkwOxmWpd5l9Y8l99cH5XbOIp2HaQZzIV+7QFQ5igiYQ?=
 =?us-ascii?Q?ypXSBWhrMW2dW1btBZfRwsv9D1li29bbJVpNkDQy2tt9S1BBdRXcig8FDtWr?=
 =?us-ascii?Q?Tmap5QGYJodqjFbj3jXIXk1uJnN2TcSFLp/7sJrJEZNEelzrKO2FPyFGgn0v?=
 =?us-ascii?Q?Ap223QF9G9Y4rFHn5MPIxjN+74xStvIfsHMWHyGUrLRgfRHr7A7nYNvzfVvO?=
 =?us-ascii?Q?xgfEh2hW8QymWbKcDOsUj7XPJyZB6Qum9SOQfqGcViJj10ciOCSwYwUQTTlw?=
 =?us-ascii?Q?aChs9Sj/xjl/EztEV4uPThmrHyslI00lh3WGv2vh/1E8PbMruB944FEAfAtk?=
 =?us-ascii?Q?As5jMg729/whA/XQlcmQ1iP9RgrQx+5SIcZ+5xIi1pITlZtA+0ZoRd/8cR+d?=
 =?us-ascii?Q?vI7PmG1VcqTgtqQ0LHL6raEzGYgt63Y7I02P5LV37SgG8snNPgO7opCngfD1?=
 =?us-ascii?Q?SOOoSTufez/oX/KvMYifPGEBPTB+Vv5GH8YJVkJeX9kPzEo/4zZk/fHJNhtQ?=
 =?us-ascii?Q?wn+x13BKNCIRdZyNCTW1NupROTgnD7mWevCRdFU3?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ea227c6-5e6c-435f-56f6-08dd392b4ea0
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2025 08:20:32.3827
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5i8Dg8RUge/1Thsi4OZrYyApCnO21gpkVzjn6/0kAdcxbbNK6rZkVc/yjxUzg4V+yiD5KzuIFIi2m6lYr4a8Mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8933
X-Spam-Status: No, score=0.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The asrc_m2m_device_run() function is the main process function
of converting, the error need to be returned to user, that user
can handle error case properly.

Fixes: 24a01710f627 ("ASoC: fsl_asrc_m2m: Add memory to memory function")
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_asrc_m2m.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/sound/soc/fsl/fsl_asrc_m2m.c b/sound/soc/fsl/fsl_asrc_m2m.c
index ab9033ccb01e..f46881f71e43 100644
--- a/sound/soc/fsl/fsl_asrc_m2m.c
+++ b/sound/soc/fsl/fsl_asrc_m2m.c
@@ -183,7 +183,7 @@ static int asrc_dmaconfig(struct fsl_asrc_pair *pair,
 }
 
 /* main function of converter */
-static void asrc_m2m_device_run(struct fsl_asrc_pair *pair, struct snd_compr_task_runtime *task)
+static int asrc_m2m_device_run(struct fsl_asrc_pair *pair, struct snd_compr_task_runtime *task)
 {
 	struct fsl_asrc *asrc = pair->asrc;
 	struct device *dev = &asrc->pdev->dev;
@@ -193,7 +193,7 @@ static void asrc_m2m_device_run(struct fsl_asrc_pair *pair, struct snd_compr_tas
 	unsigned int out_dma_len;
 	unsigned int width;
 	u32 fifo_addr;
-	int ret;
+	int ret = 0;
 
 	/* set ratio mod */
 	if (asrc->m2m_set_ratio_mod) {
@@ -215,6 +215,7 @@ static void asrc_m2m_device_run(struct fsl_asrc_pair *pair, struct snd_compr_tas
 	    in_buf_len > ASRC_M2M_BUFFER_SIZE ||
 	    in_buf_len % (width * pair->channels / 8)) {
 		dev_err(dev, "out buffer size is error: [%d]\n", in_buf_len);
+		ret = -EINVAL;
 		goto end;
 	}
 
@@ -245,6 +246,7 @@ static void asrc_m2m_device_run(struct fsl_asrc_pair *pair, struct snd_compr_tas
 		}
 	} else if (out_dma_len > ASRC_M2M_BUFFER_SIZE) {
 		dev_err(dev, "cap buffer size error\n");
+		ret = -EINVAL;
 		goto end;
 	}
 
@@ -263,12 +265,14 @@ static void asrc_m2m_device_run(struct fsl_asrc_pair *pair, struct snd_compr_tas
 
 	if (!wait_for_completion_interruptible_timeout(&pair->complete[IN], 10 * HZ)) {
 		dev_err(dev, "out DMA task timeout\n");
+		ret = -ETIMEDOUT;
 		goto end;
 	}
 
 	if (out_dma_len > 0) {
 		if (!wait_for_completion_interruptible_timeout(&pair->complete[OUT], 10 * HZ)) {
 			dev_err(dev, "cap DMA task timeout\n");
+			ret = -ETIMEDOUT;
 			goto end;
 		}
 	}
@@ -278,7 +282,7 @@ static void asrc_m2m_device_run(struct fsl_asrc_pair *pair, struct snd_compr_tas
 	/* update payload length for capture */
 	task->output_size = out_dma_len;
 end:
-	return;
+	return ret;
 }
 
 static int fsl_asrc_m2m_comp_open(struct snd_compr_stream *stream)
@@ -525,9 +529,7 @@ static int fsl_asrc_m2m_comp_task_start(struct snd_compr_stream *stream,
 	struct snd_compr_runtime *runtime = stream->runtime;
 	struct fsl_asrc_pair *pair = runtime->private_data;
 
-	asrc_m2m_device_run(pair, task);
-
-	return 0;
+	return asrc_m2m_device_run(pair, task);
 }
 
 static int fsl_asrc_m2m_comp_task_stop(struct snd_compr_stream *stream,
-- 
2.34.1


