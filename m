Return-Path: <linuxppc-dev+bounces-5384-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB459A1681F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jan 2025 09:20:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yc3FF0vwcz2ykc;
	Mon, 20 Jan 2025 19:20:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2613::60d" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737361249;
	cv=pass; b=I7jFIrJqATQCkuou1qZFNE6+DjJS4FiSDHNLFmnKDYFsq9D57XobWU0yoQU8G+jLL6tfbmMO2BPv4uOfU8+GHOEsOwSQi5mHUpiy6BttY1O7pBO05kjdhqMWA/UU7bM0zsBEJEUYaZOqsuMhx1droRbTWzZIBbv7gtQov2i2YI9M5fAt1mT7nkvUvKJeZYpwKid/6TSTD//a2v4UdKRtCkwlQmTRlXRX2Pq5A7WwUfqO+EUfza7u8QhLjz8f1+D6Q8DODD/btvBzMgW++/RhZCSs5OIhAz95CUN+xbco9uDAOiypeXDULz8MNNq78B3vOK7XlVKMcV0+KKlw5nov3A==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737361249; c=relaxed/relaxed;
	bh=dEed6f5VWQ8whxmtMEO4DotocEYWMDYrVgkprB6uXxA=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WtVZ++fVkP5+RFvVUelMrWIrqUuBSCww9p24BsvHjIHzQl3/qkPWL3jHVcCzMSMLyD4gsj1w9gYUonmWk9JlWioubuIQXPI+vKvAghPEFYjE2A/b1lV4zQSR+3Z+DvOd8rtTJGmfHIQ4MyuQOsLTqJglydWapwolTUycqA9/1n+YSXnsh3PBvrMZgGHrcx5J3zfWajtbLkTb+VA+IOqiS8lL9YLicLee12DuGG3JrP1JRGjmhReCiIHA7aggCItKvEsBWLVOdaCdS+On/CetOg9Izd9HQaPjmoj5EeAbJ8hsP65/7/WN9jf17a2Yr7ZwvV9/PiV0rZuZjqfQ7oiTHQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=WWDsvpi5; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2613::60d; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=WWDsvpi5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2613::60d; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2060d.outbound.protection.outlook.com [IPv6:2a01:111:f403:2613::60d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yc3FD2LJLz2yys
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Jan 2025 19:20:48 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vdbXa8DVHLVLyLH4oOAGII5TqIEmBwajPQ20QlAM90uE4B+/LCeTN+OUpYfMi5Mtl6AJxD4RfoE1A6G1qinnOuh1b0yp7n0cr8bqgXaYsFMG5c2IlHw9NfY61KCcxSHIzCtxfi1zTXVy8GOaJvSoODBEpJbNJNrigvuN7OYmrS8Nl1zsclw5FfnGj94w1r6utAFske7zzlWgn97dw3GgJr64t5pOs7xjCbYbX03gP0Daoy9EuZ3pubZCR5dm/aDkMiYOhLhmXog4mybsHrQQtK3ZcpQpe++kemjP7A6bsH2LcSspphjmJJjX8PNRDjPhWbYiVi/WbARySVrhofe0Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dEed6f5VWQ8whxmtMEO4DotocEYWMDYrVgkprB6uXxA=;
 b=oIw9RayblbgYK0P25PEoiAmks8LldKdhN3NtytA1pidxYESQLlEX7KfZXYt9cx0FcgvHvUDX4obeKjbu+eNimTGr4wN0LsdbPwKuH3WikgbTdRAOuueoiF6aYtPXJSEuCRCcV2W1AdC76kJwhLAqvZBEIl3IIy1CuvXO1NuDlofqteEeWwjvtG1D31PC0XE0CjZY6qrDFi/tHozHKvMUoroc54NRpx5XyfRBAAW5X0ePu7iHQw4M9s7aYNO8y5q7cuOHirj2vrtOHKb59ovGAyTFcdea21kAv8+twd75FygHFCPpOZNCiZr5wb2Pv5m6O4bYn+Mrn34AebvssQK+jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dEed6f5VWQ8whxmtMEO4DotocEYWMDYrVgkprB6uXxA=;
 b=WWDsvpi5WIHfaAXNmhZYn1pcH8bbcr3OjkXcLc/t/uJiPvfl3at1Z+TzjDCXSRsUSP80W9WCFuxjr9TGzANoEpcs/p+mCVpXsIDhlCKzU0BJcNIsrK7lQstA2VvnBWx1k2wQySflipMm8ieG3wjHiZDqU2dZEEsf/DYMptz/fbU3k3RpCacWWNolixF4vTAbiLKTxHYkS5QtONgErLpVnqj3nHCJ7sRSwGt6gsC13zdurGuOCthOf3FFv7h0s1vX7I4ZrEafIXQYpQpBMqpnqJQfWnG5v0fgevlzwB8TjyFsoVOMq2OZ1QcVKcpq8TFnQX1vCx3iMh1q/3u+kvRCMA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by DU2PR04MB8933.eurprd04.prod.outlook.com (2603:10a6:10:2e0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Mon, 20 Jan
 2025 08:20:28 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%3]) with mapi id 15.20.8356.020; Mon, 20 Jan 2025
 08:20:28 +0000
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
Subject: [PATCH 1/2] ASoC: fsl_asrc_m2m: only handle pairs for m2m in the suspend
Date: Mon, 20 Jan 2025 16:19:37 +0800
Message-Id: <20250120081938.2501554-2-shengjiu.wang@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: daa3a390-1f9e-4df2-3a5b-08dd392b4c66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|52116014|376014|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TuEf8i7IzLxoEjx64HMKRW6aJB7RMaFpY5E8iCZSPCngyYUGOioiiHL/srcx?=
 =?us-ascii?Q?w1bOcffi8bao2NNutQNYkRqi4cpBxe1lUaDMY/uF9T9WbiqPLk5YL0nsWP0S?=
 =?us-ascii?Q?G+bk5A656oHNkgTzJx5wfepMYWqqH7EAkYdpaCU0LmDVy41X26HxHaWWbzio?=
 =?us-ascii?Q?7OB5/4iZuBiv+MdqTt3Tprprhm4aVEv1dZvYtL98Xgbq82FZ0R8PMtjl8Nk2?=
 =?us-ascii?Q?gFkX10JTKTT0GA7RncOQujsmlvCkaT/CAI73myhBT8h1IuuKj5T4pRgLqgm/?=
 =?us-ascii?Q?RDgGWFqYz6lUPncsaYSPC4AX+8GHdoniQjGhk5ZkVtKeEV36tOY6eJ1HlfNf?=
 =?us-ascii?Q?NWjA/W/J61jO7Ynq/RhuwdAhgCZTxHylH8f96dop90/eqtookFVH1yCAFfTu?=
 =?us-ascii?Q?vAjqwXytbQSGbONIZmTqkkWSbPb9VED8U8yeoKh8gmt8Yfib2a1i4iM64Son?=
 =?us-ascii?Q?zeeR4cYnmCsPwFOVHiQ+b1z0IxadZ99nmz8Mi/zlfBkFaSdGmFtVLbnY17QZ?=
 =?us-ascii?Q?0z7xLT4mRhYvSrGGapUBrCTuN/cjVupGmF6tlr8KYTTHhsehFbE88FcYaBPV?=
 =?us-ascii?Q?plUXvm2q/XKcCXU399ubZgqyuSb3snGm59Hu8Nsx7ZR6NMtJKnfqzP1AsWle?=
 =?us-ascii?Q?RAKoMJo4SxV1UHyhhMiV4rMLHaH1WknpokpMwEp4Bldz5fLKGfkRN1ftwWEN?=
 =?us-ascii?Q?ajPipXEBJCkWhuCticFzgSqa+iuXtQGGFhCBf0kYB38NqRPmjBhmCAcSrfua?=
 =?us-ascii?Q?NdDkQ1xdiEEDbHtL/GtQm+7oMZ82kCAvYPNXcZhwt7hiu/zQF9BiSXiCvLgv?=
 =?us-ascii?Q?pmrGSZHVc+8ti9G1LTNmiouJnI4BDJ0PWcO+waLweAMI/lOKeEALOc61kxca?=
 =?us-ascii?Q?4i3/eBeHAcusf8Hrzfpw/empiPpEdjzniPc9ZbR4clnTSzGp5/o+F9cxoAHo?=
 =?us-ascii?Q?0N9ApMKg+L3RdzLMSR+8bvy7o8gbcVDrFGTv0JPM4Fy9HpkGCFBybbQ/NFgq?=
 =?us-ascii?Q?NKm8f3qr4vYkOXwxMz+jCti9H3MeP3HSyBstgEA/zSvsFLyRuEabjC9ghlSc?=
 =?us-ascii?Q?Iv2mCUvaKFyLNrCfCLPwOZtXt0b6D7lxUlh01V5A+AkSqxfjOWWxKqnNc83f?=
 =?us-ascii?Q?RiOZ+7O6prl4A4qt3bypfETbQMY4LgGpq1mGQ2XrvADCJr7X/QIGZdO8NYIQ?=
 =?us-ascii?Q?B+259X2kwTbUhNqmRxL7rM81VcXiougc4EZsCa+BUohAlSxagqZu08QHN67y?=
 =?us-ascii?Q?xrsFph9FaEu+lX+vV5MmM5B9BnbdTZjfE+LzkgyWRt3m8rU8WNQ1mi1I0vDG?=
 =?us-ascii?Q?eD306uDUSJpPZ2SvQxQpTRGCMwpTdJPEJwPQUjuJt+i8oEIahDvdFJ+mv7VI?=
 =?us-ascii?Q?g+8C2z3OIyXYNbPCQ+Q1QcXZRccYZOKoJUGfU4DV9q2SCMvHsG4AjtNRzLT0?=
 =?us-ascii?Q?6rln2+YYRPkG0fx7g1SbiE7A783krTqNLRje2dpMnXqT1ghp3V05wQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(376014)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uyPEkBjOoDkZbo/hFhQOM+M9zbj347JYYAxtXqIN+HzDbzfGRg53WyC2KfD6?=
 =?us-ascii?Q?02fkk5MhZPy7RaFA5pZEdnD2iHV2bHwx0mXNgP1clhXOETLfNQVGVNokb6Kh?=
 =?us-ascii?Q?sioKu4KV+/zCDBBfVQI4/tRRmkrEGRIdcgmDeSAiQIXIcDuk75SxLCK2wGgW?=
 =?us-ascii?Q?cyhmOJMO+X52O+9MDEPVlMU2o+k5N9qijnN06DcAe02EGCWEAxCG24gG2T6s?=
 =?us-ascii?Q?+jTdmQBx8dFFLDlL3Y25R2OVH1+WFbJEkKPVmA/zHQu6KfOE9V/ua6gMOrI9?=
 =?us-ascii?Q?gCNLSKAcrxQ7TmyjyUyaJtNB6pcAVfa3zio0dXz7HaLvrNLd3tlkmDSnIul4?=
 =?us-ascii?Q?dLzGX6ogHBcwzGz85rHq1GZ9wjGYTeU8XNUP5y3luliTfcYMNF2s80+c75ad?=
 =?us-ascii?Q?u6HrTkiTNA1h8S0IXEW4qsfk8PgnNuwy1D4h60/n69LVYPsySvb8D6EdFOGt?=
 =?us-ascii?Q?1Ws9czxQT7DjFReg4G2huI2Szrg4lhV9tLLZjdLLHqET5FqVxFVrRpLWfxxZ?=
 =?us-ascii?Q?+qnV0qiJ9UyQUPw1kbRV0cpXwG5QxWSycMAPutWyuCcktw71WejF7YI0iY+g?=
 =?us-ascii?Q?OoCwOitl3b3ZgrvQbRkaLpj0DvJDgJQvw3gHily8m9ct+eEzVgrFZMNgiJGj?=
 =?us-ascii?Q?0cX7nEHid3ZdVQXCbIwACjrRBjQF7yjmE+yTJ8aipLJlb5M6YRCl/NVvpCDq?=
 =?us-ascii?Q?oFWIyGNebImB8WRS3R+VzFf5BCEX87/TEQEz/x5LdT88PoyExD+D+8qOME4L?=
 =?us-ascii?Q?5Q6M2dLbU8VLF+a9yjtKlrRgKG1q66yiR4QyImPFhfmd3JlTxL9ngt0wLcyf?=
 =?us-ascii?Q?gsmapkagx5NsrgoJDrKk+OFqXvPMdySMO+QxkzlSMUY9UMRmItNht3r7tmss?=
 =?us-ascii?Q?CbwuxNkXGM7dV5ehKiiv/aGNwJbtgVU6LpkQme1aY8IKdWHdv3igAT3aw1+2?=
 =?us-ascii?Q?n2DzseMPv3ywgiFf0SKRAy4ksPbt+K6YhEXsp+prj45gDOCBNtbFsGCetlyM?=
 =?us-ascii?Q?GgLqsXXhxTOuBtMhurdE5tUZXgm6qu3hkPJaw55PpqcglH8izAL3vPXZsbvG?=
 =?us-ascii?Q?9PL0/9io+O4473jNPD0kfrdf3g92k1fsp/vKrB1BkiiYzsgIP5TGqCpFomM/?=
 =?us-ascii?Q?IOZwpPRbvkEA9bo1/ETNvPpm3/LrSKtyDRGoxSLhyuN03T7swECaat7bCMZD?=
 =?us-ascii?Q?gbWk7bKOpcQ9aQjA6QK4ZeuPniRomthh+ygbvvbxZEg9INJ3CHj4by/8MNBi?=
 =?us-ascii?Q?59HFTl2JzMddEIvd/Gjyv5dzw2Vv53EaO9ExOQ82wPyyZF6PW63zByk4zw2X?=
 =?us-ascii?Q?nxlmCfgaQwrutRRnXVX/wT51lpF6oQgqWK0sPwvTSNgJI5+CBAo31Y4GbKmG?=
 =?us-ascii?Q?opeSMf3IMDDmx3HjJPm5iS8k1Dy3CJlQuJaZCXBiaaIWQ+Z3P3DEA5TyG8/o?=
 =?us-ascii?Q?ocv8VWHWf7CkuREFrFFw7B6wMAHCCj2N6bHIGUUgPg7eDK0FOSs5HdjtCGTi?=
 =?us-ascii?Q?fXU8XSqOfC3rUVffuepr8o72hWlO1GYIO08ZSZXdAeA0KVaKPrtWHRaLc4h9?=
 =?us-ascii?Q?vBCUZKWfnKaWGCIeqb0iYk+h8g9FmlMEfepdDIZ2?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: daa3a390-1f9e-4df2-3a5b-08dd392b4c66
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2025 08:20:28.8192
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5q8MyU/pB7f7aaR8tmg6Uh2MaRTCqSsHXQaNPSkTE59teHPMCTpjA5TzLHRsS+cSO99fGAegLr7QN5n0is61+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8933
X-Spam-Status: No, score=0.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

ASRC memory to memory cases and memory to peripheral cases are
sharing the same pair pools, the pairs got for m2m suspend
function may be used for memory to peripheral, which is handled
memory to peripheral driver and can't be handled in
memory to memory suspend function.

Use the "pair->dma_buffer" as a flag for memory to memory case,
when it is allocated, handle the suspend operation for the related
pairs.

Fixes: 24a01710f627 ("ASoC: fsl_asrc_m2m: Add memory to memory function")
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_asrc_m2m.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/fsl/fsl_asrc_m2m.c b/sound/soc/fsl/fsl_asrc_m2m.c
index 4906843e2a8f..ab9033ccb01e 100644
--- a/sound/soc/fsl/fsl_asrc_m2m.c
+++ b/sound/soc/fsl/fsl_asrc_m2m.c
@@ -633,7 +633,7 @@ int fsl_asrc_m2m_suspend(struct fsl_asrc *asrc)
 
 	for (i = 0; i < PAIR_CTX_NUM; i++) {
 		pair = asrc->pair[i];
-		if (!pair)
+		if (!pair || !pair->dma_buffer[IN].area || !pair->dma_buffer[OUT].area)
 			continue;
 		if (!completion_done(&pair->complete[IN])) {
 			if (pair->dma_chan[IN])
-- 
2.34.1


