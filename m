Return-Path: <linuxppc-dev+bounces-17795-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yCtQIMWgqmlLUgEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17795-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Mar 2026 10:39:17 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA0A21E158
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Mar 2026 10:39:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fS1Z84vDgz3cGD;
	Fri, 06 Mar 2026 20:38:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c201::3" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772789936;
	cv=pass; b=ST+xfsZbPGIODt+KYrlWh7pmWDgE8n+c8jOUxFXAIs3fKm59KjuZWOztEXgPtM75m31sWENxSmg2YT4NrnZuXg9ID+78E+d4EmuM1fV/h617MnOKL5AGOx5QpWf3XyGpmp9NHUFqvYw068vKcXFkzVRojOSW7ggkPs3+wc4GQ5Ep+fXiDzNn3L1lWRv9RcIDiLBS27OP+TFRzjzp3GPtw5tl4iDO/ABT0ysUsg64LoshlagGbylzM5qiVE+B2vwq02S9LBRxZYvyUaQcuHkZ16Hclpo37gIRlrS0+qdixCvrCky7ETxqkd2Dk+h4Rf9djJAhGgdybcqzQ9NI3g3WDQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772789936; c=relaxed/relaxed;
	bh=lNLCAJkY5y9KOlMh40hJZdodo8zWnpYY02Zu6ZApTd4=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ILNwjXIYwgbBgw3+eaquWE86e3cqEkFICFTyZy0FMpz0gys/CKm0WGbI1ioo856r/XWXWN6Qam258F/6anNUrnEJjY0jxTY4SUBJowY5pLNYdJMU9aGrChCNdocaRg2TqfLRgVwrP2evTN7R/pr6TUOxzL1s0DbR986zuqyGCfM5ODuLTywfMxz1TDmPkzQLFBL52I+yneRkx9LLXfklSaNoY4eLxxSJdydOe7w0btPsJM5VcDYyB4q8MFdP8TtZH6FCnLubTCE1bhAUHm+omyiQAeDG+uYvqhGEU9JKksCVMxbtDHwxvQs7wlHBwU1f87ZGTQmkYdNHCFR1NGvpwg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=MYQGeyE9; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c201::3; helo=as8pr04cu009.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=MYQGeyE9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c201::3; helo=as8pr04cu009.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazlp170110003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c201::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fS1Z76ykgz3cF6
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Mar 2026 20:38:55 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y56ugGRaMW/SIubdfZmdmRzLdz0EA6UQNKAGHXwI6RFLVLzUSH9N5Bu+IsfX4wa13L1X84uuJEXeDe/tFZMq9chUrvH1+END5YP44UcWIi6D34wviu5uXtedJlBHqOwYEMPZucctkdQgpJgD4g9WWGKWM4fDT3An9nlHf5pQUbe1tZwOYrtaUi1CumLpEfvhs0whUPZZpNkL9iAPHNpy9t9qPm8SxfEvBp8A+pOVczn/pOuQeq6y6VTNQGG5SqZnpTebkqyRRIr9kuJMBnvqBroUZIF5OFoV5/19OgFMpwkhIurKnyecNF+QJTd8jgA6t9Q/ZPokIkZs3zK57T9tBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lNLCAJkY5y9KOlMh40hJZdodo8zWnpYY02Zu6ZApTd4=;
 b=BDtiw9bDj+hjYr9jiW1ZjByU6VbcGKzSRl7GjYDt5fDGO3rWFB87TH/L0MCjmowwhgoOgPPRCUiJA6r9OYUf/d68GeoAGuum1SKe4I2AAljn0inilKC6s0hdw8a1lBea3lIJbzbTqq7zE7sz+XApIid/ZOgDqsNwrYdUHbbiceywspIVoe+tPb3AaPy4ual8fjPG61+8Nse2XoZAm5lNFHP7b8SZ3jeSFPFYyFVHNO0S7bkO+Y1i1m6tA2ou9PM8BnXFhaFW2nWxTv/sZs14WlIuUltEVzjkSy1ALEneGdL5e88jqOsK35jeCE+LTgzquk4ZssGZg/XSNxaS8GFC+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lNLCAJkY5y9KOlMh40hJZdodo8zWnpYY02Zu6ZApTd4=;
 b=MYQGeyE9ETw4GKYVa+/10hxx/SL9nw3pVVDt2L3izwVbr4zkqy1F9rdLkcqibHgtzz3yZOnaX7xyTJ9WWXq55Gpn/AQ0RN2y2tlTuob2Fn6bIDvq0pOWdSfotRVQq6YRKXKuxYBnNzooaw+Vm2Zih2CHunFz5tzM5x0ybOpOOeCqyHfH6F46n2pL7YSJaWfru9idEM/01mCOHkJVWQY/eNY7QmhzDyeXJUdatvfUBhvZA9jXOz0Y6kl3c3KilO9yFmYBP4Wc4ksFm6y2ZVVtAPF1vwSysG2+WpmkeCYbU5/ngpXs9j7q6XfUkvqd+kY5JPWYhDhzx10kujLTjJmRng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by DB8PR04MB7001.eurprd04.prod.outlook.com (2603:10a6:10:11f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.19; Fri, 6 Mar
 2026 09:38:37 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b%3]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 09:38:37 +0000
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
Subject: [PATCH v4 3/3] ASoC: fsl_xcvr: add bitcount and timestamp controls
Date: Fri,  6 Mar 2026 17:39:49 +0800
Message-Id: <20260306093949.1647452-4-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260306093949.1647452-1-shengjiu.wang@nxp.com>
References: <20260306093949.1647452-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0006.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::11) To AM0PR04MB7044.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|DB8PR04MB7001:EE_
X-MS-Office365-Filtering-Correlation-Id: 339edbca-1a77-438a-0ced-08de7b642474
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|7416014|19092799006|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	0aJfMaqMBoPebbJHkHFUp6nKYo6RmR7SqZmP7bqbGNaRXWBDDMkAdvvIQrT9MrifFiO10HvRwOxE+31jmPlD0nFzrd778AqkRoEnNcPNyqTvNFTKIxdvMYl2SAecJoToWRpu24IdhO0m4PD+zmEjnrPkCXKCtcY7Sm2XhiS7oBmWshNL1gOeAnGm7BCDDF3Xg4qfxpGcXgiV+sMPjBNjfGDSw7MeTOsZ9KirOvNAqH5lkC28ENX0eVvDl8nSkVARhKoRH57kCp8k3dnoWzFBXlxjq3JW+MCfKGZ9QVnPCAdjawZ9FW6eT94Oz5GZ/TwR680rRzI+TrYPKlG8hSZNVVDkwzpxNRRKZe3I8sOKslaYHCDk0u9UTOXfov98B0rK1rNH0nV67lRVi5RDnqfsPDWkqcOsNvB/oQjYDJTFw0HyK+En9XZB7fEJMwu+67IigIkaJu1SGSUD1uQuBm0PH+F/5F8+nOWP+C39NpQlmhNqTRJBVNoSGhFkL664t2kVWJUXiNUtyyClBY4xefRuPlKm8kdsMshz6f+FAPVyXAoHRUqcNil2S+KYK8DIOdCKfv/0NKUP/TNobF62riMgUYQb4U9FIlsBzxA41SYfNfw8Dn1SUXJm4BWb2edUuB1HTo5C8ltT3VomPtXXwCrtyVGdf65EmUKw9aljKPPu3G1bFWX3tGJ3XDYALx+IA3c0jiW1Ja8N+ICzGhQ7DXEp/Yx0zsNXYe5mAh/FXG1ch2nXO9p+kR1A5Y2bPGdTDo8R0/RYBE3UPBwdc9bEJnuuBpM65ORQWmBOdARktibPegjpKVIz9XWPF4JuEVmqoQPC
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(7416014)(19092799006)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zPk2p9hTmyMBFcZI8uV8QhuT2vtVVPBhLCh2Qa2beKF4SGPvS3pooaLCEmRj?=
 =?us-ascii?Q?rdkFxplg1j1ZefbvWsFphFwvDQFrxoeRXLmKd4S7CtuORO6HNLkkTUOT5qtB?=
 =?us-ascii?Q?Av80yqcW2t1e9+YyTI02cCaS4oSoYpeaCBpurV1mfpeCDo2GPmuzfxbMu/84?=
 =?us-ascii?Q?UagzvESHDykjXcfOcIgzYrKXtN+i1uIQr7T5YCE3xlXe9liD9mv4tYezNKCO?=
 =?us-ascii?Q?YVzv8AT8uxMw7jAeXWOv/hA2i+z3kt0OfYekqoi6hAj1c6skUGatuS3Y+VTl?=
 =?us-ascii?Q?oa+Zv4opLTFkVr+BamXBlV5uBW3poN6T/qjTM6Yl2dU4mvEc+BfjPlt37d35?=
 =?us-ascii?Q?9oKew5zlj3Y2/ya9j5r+KwEfrQK0LaWRQ1RYduMPh/bJnG84BJFCBy1knv5Z?=
 =?us-ascii?Q?dQ5g4st85IbiCZxC7MtkiXN8h5RmTsHMwdQdzwFJjYhy3P2BQJ1jHHjVQNt+?=
 =?us-ascii?Q?hjpdF1p2wC+XkQO26X32ukQkQZQmOcUiejBXU0qZuSITova7A+owP2cXdFvW?=
 =?us-ascii?Q?P/krjVve8TZle+IfRmmLeSetXOuH1bBTeKz5pqepa45yzznHLjEkDfkIzSYM?=
 =?us-ascii?Q?9cD1L3OK0B6K8jbjAVebafocFQNIHtdSY5AgyoVvat98IyR0Jk9Y7/VQzykT?=
 =?us-ascii?Q?b4EnTvs6VRVqX66EOxHw3Al66600na4JTBG8rQmi/IvSktoa6UTwkJc9fGFe?=
 =?us-ascii?Q?fWVsmZ2wlEVWEjNl918PoqMt+yhp6guhrCvBwZSXIjKHjHgoQmsKUAowq/aa?=
 =?us-ascii?Q?1bsGRHnWfxbYbQ0E3SoaT4XV46lqy8jqqy4eldEB4Mjj8q3eC9CVjDuAkziJ?=
 =?us-ascii?Q?yCzaBaMP65UOiooXzalFSJlSG6sPW5BgEKziiXDM6NcHzmuNxeChbN3VzQls?=
 =?us-ascii?Q?J4Kh1hYNkoxpy7DWrDzDJ50AYVyW9I22kTDgLc3Uz9dpoJlHK5WEBOyZGU5q?=
 =?us-ascii?Q?Utq51gQvywZRAYMqNQdzHrFxqdA9gV8SnAlM5LxTHskSQ7Yjbadxw37/bAxy?=
 =?us-ascii?Q?Lep5FbYQZ+8VcXkD3D9zo66+wLbFBbvyjOLzpBjXEjy8JHlRXHoghQsHwgt6?=
 =?us-ascii?Q?V1qxGFypNRNATAgsTQwI4wd7h15lgMlUL0dOmUKDkvYFb/FWt6sgp3ISQj3E?=
 =?us-ascii?Q?hgEnPG/VLlF24Vvl3ocrKF4V5Vjmb3ah8y6ZiE0BkinV3sZogDCbt8Kxyv12?=
 =?us-ascii?Q?IDRELaDkx5s7UFfXJsdhzlHfEqhEX8RanTdKkUqUq3X7vf09KJ6HwOehsxpf?=
 =?us-ascii?Q?nb9l86azPoJFSZVA5p9WBPQ1yZpxo66cjdsxBG4rSjMbF9ZXdN2avWcyVPDI?=
 =?us-ascii?Q?J/BA1oivp48+s0P3opW1fY6/1lqc2rhLFwrk9lRXhK5UlvqO1Jh/3tM6Jevd?=
 =?us-ascii?Q?uEVfliPlEMzk/MX4moilsVXClNyGXD/mxDJL8g+JmPxTt6DLPqaucF5JHpRP?=
 =?us-ascii?Q?ydD6emzf/+zQ3KV77Se2ippqDJ2aWbEChMSxFTqgs2E0osz2DCjSR9g/u7p5?=
 =?us-ascii?Q?seLt36fycOkthLjyoHCteW7dfEz/fkOUC1jHGsNKvlj/yjQ6fMQOvJntSc0X?=
 =?us-ascii?Q?CK+yBvkUlHhsW7CsMv2dKadXRBhbe6uN941HRo/T4y5x8hGDKnVqx+RcFDma?=
 =?us-ascii?Q?dzfe2xWRi8Pe80Y+peSkQTTwoeDOFA9cChIa0cUejZzwfmjO1Pdkw9OGnRLE?=
 =?us-ascii?Q?Qgc+bmHUhUGi5BWWyWOiQemhk1JN6tN3h4OTJi72Z9nl6JXFDWaM8kXqiJDv?=
 =?us-ascii?Q?+8jBnmMU+A=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 339edbca-1a77-438a-0ced-08de7b642474
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 09:38:37.2706
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3q5/ySxDbyA2DPy0W1vcu0xYjGP3NY+mVf0VWU+N2QuGct7IwW7T5YEyR4XlJdAEku40sO+zsnm+nEEFoVjnIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7001
X-Spam-Status: No, score=0.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: AFA0A21E158
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
	TAGGED_FROM(0.00)[bounces-17795-lists,linuxppc-dev=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:rdns,lists.ozlabs.org:helo,nxp.com:dkim,nxp.com:email,nxp.com:mid]
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
 sound/soc/fsl/fsl_xcvr.c | 64 ++++++++++++++++++++++++++++++++++++++++
 sound/soc/fsl/fsl_xcvr.h | 18 +++++++++++
 2 files changed, 82 insertions(+)

diff --git a/sound/soc/fsl/fsl_xcvr.c b/sound/soc/fsl/fsl_xcvr.c
index a268fb81a2f8..a945defa8b3f 100644
--- a/sound/soc/fsl/fsl_xcvr.c
+++ b/sound/soc/fsl/fsl_xcvr.c
@@ -62,6 +62,58 @@ struct fsl_xcvr {
 	u32 spdif_constr_rates_list[SPDIF_NUM_RATES];
 };
 
+static const char * const inc_mode[] = {
+	"On enabled and bitcount increment", "On enabled"
+};
+
+static SOC_ENUM_SINGLE_DECL(transmit_tstmp_enum,
+			    FSL_XCVR_TX_DPTH_CNTR_CTRL,
+			    FSL_XCVR_TX_DPTH_CNTR_CTRL_TSINC_SHIFT, inc_mode);
+static SOC_ENUM_SINGLE_DECL(receive_tstmp_enum,
+			    FSL_XCVR_RX_DPTH_CNTR_CTRL,
+			    FSL_XCVR_RX_DPTH_CNTR_CTRL_TSINC_SHIFT, inc_mode);
+
+static const struct snd_kcontrol_new fsl_xcvr_timestamp_ctrls[] = {
+	SOC_SINGLE_EXT("Transmit Timestamp Control Switch", FSL_XCVR_TX_DPTH_CNTR_CTRL,
+		       FSL_XCVR_TX_DPTH_CNTR_CTRL_TSEN_SHIFT, 1, 0,
+		       fsl_asoc_get_volsw, fsl_asoc_put_volsw),
+	SOC_ENUM_EXT("Transmit Timestamp Increment", transmit_tstmp_enum,
+		     fsl_asoc_get_enum_double, fsl_asoc_put_enum_double),
+	SOC_SINGLE_EXT("Transmit Timestamp Reset", FSL_XCVR_TX_DPTH_CNTR_CTRL,
+		       FSL_XCVR_TX_DPTH_CNTR_CTRL_RTSC_SHIFT, 1, 0,
+		       fsl_asoc_get_volsw, fsl_asoc_put_volsw),
+	SOC_SINGLE_EXT("Transmit Bit Counter Reset", FSL_XCVR_TX_DPTH_CNTR_CTRL,
+		       FSL_XCVR_TX_DPTH_CNTR_CTRL_RBC_SHIFT, 1, 0,
+		       fsl_asoc_get_volsw, fsl_asoc_put_volsw),
+	FSL_ASOC_SINGLE_XR_SX_EXT_RO("Transmit Timestamp Counter", FSL_XCVR_TX_DPTH_TSCR,
+				     1, 32, 0, 0xffffffff, 0, fsl_asoc_get_xr_sx),
+	FSL_ASOC_SINGLE_XR_SX_EXT_RO("Transmit Bit Counter", FSL_XCVR_TX_DPTH_BCR,
+				     1, 32, 0, 0xffffffff, 0, fsl_asoc_get_xr_sx),
+	FSL_ASOC_SINGLE_XR_SX_EXT_RO("Transmit Bit Count Timestamp", FSL_XCVR_TX_DPTH_BCTR,
+				     1, 32, 0, 0xffffffff, 0, fsl_asoc_get_xr_sx),
+	FSL_ASOC_SINGLE_XR_SX_EXT_RO("Transmit Latched Timestamp Counter", FSL_XCVR_TX_DPTH_BCRR,
+				     1, 32, 0, 0xffffffff, 0, fsl_asoc_get_xr_sx),
+	SOC_SINGLE_EXT("Receive Timestamp Control Switch", FSL_XCVR_RX_DPTH_CNTR_CTRL,
+		       FSL_XCVR_RX_DPTH_CNTR_CTRL_TSEN_SHIFT, 1, 0,
+		       fsl_asoc_get_volsw, fsl_asoc_put_volsw),
+	SOC_ENUM_EXT("Receive Timestamp Increment", receive_tstmp_enum,
+		     fsl_asoc_get_enum_double, fsl_asoc_put_enum_double),
+	SOC_SINGLE_EXT("Receive Timestamp Reset", FSL_XCVR_RX_DPTH_CNTR_CTRL,
+		       FSL_XCVR_RX_DPTH_CNTR_CTRL_RTSC_SHIFT, 1, 0,
+		       fsl_asoc_get_volsw, fsl_asoc_put_volsw),
+	SOC_SINGLE_EXT("Receive Bit Counter Reset", FSL_XCVR_RX_DPTH_CNTR_CTRL,
+		       FSL_XCVR_RX_DPTH_CNTR_CTRL_RBC_SHIFT, 1, 0,
+		       fsl_asoc_get_volsw, fsl_asoc_put_volsw),
+	FSL_ASOC_SINGLE_XR_SX_EXT_RO("Receive Timestamp Counter", FSL_XCVR_RX_DPTH_TSCR,
+				     1, 32, 0, 0xffffffff, 0, fsl_asoc_get_xr_sx),
+	FSL_ASOC_SINGLE_XR_SX_EXT_RO("Receive Bit Counter", FSL_XCVR_RX_DPTH_BCR,
+				     1, 32, 0, 0xffffffff, 0, fsl_asoc_get_xr_sx),
+	FSL_ASOC_SINGLE_XR_SX_EXT_RO("Receive Bit Count Timestamp", FSL_XCVR_RX_DPTH_BCTR,
+				     1, 32, 0, 0xffffffff, 0, fsl_asoc_get_xr_sx),
+	FSL_ASOC_SINGLE_XR_SX_EXT_RO("Receive Latched Timestamp Counter", FSL_XCVR_RX_DPTH_BCRR,
+				     1, 32, 0, 0xffffffff, 0, fsl_asoc_get_xr_sx),
+};
+
 static const struct fsl_xcvr_pll_conf {
 	u8 mfi;   /* min=0x18, max=0x38 */
 	u32 mfn;  /* signed int, 2's compl., min=0x3FFF0000, max=0x00010000 */
@@ -1070,8 +1122,20 @@ static struct snd_soc_dai_driver fsl_xcvr_dai = {
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
index dade3945cc0c..0cc7945b1d9f 100644
--- a/sound/soc/fsl/fsl_xcvr.h
+++ b/sound/soc/fsl/fsl_xcvr.h
@@ -233,6 +233,24 @@
 #define FSL_XCVR_TX_DPTH_CTRL_CLK_RATIO		BIT(29)
 #define FSL_XCVR_TX_DPTH_CTRL_TM_NO_PRE_BME	GENMASK(31, 30)
 
+#define FSL_XCVR_RX_DPTH_CNTR_CTRL_TSEN_SHIFT	0
+#define FSL_XCVR_RX_DPTH_CNTR_CTRL_TSEN		BIT(0)
+#define FSL_XCVR_RX_DPTH_CNTR_CTRL_TSINC_SHIFT	1
+#define FSL_XCVR_RX_DPTH_CNTR_CTRL_TSINC	BIT(1)
+#define FSL_XCVR_RX_DPTH_CNTR_CTRL_RBC_SHIFT	8
+#define FSL_XCVR_RX_DPTH_CNTR_CTRL_RBC		BIT(8)
+#define FSL_XCVR_RX_DPTH_CNTR_CTRL_RTSC_SHIFT	9
+#define FSL_XCVR_RX_DPTH_CNTR_CTRL_RTSC		BIT(9)
+
+#define FSL_XCVR_TX_DPTH_CNTR_CTRL_TSEN_SHIFT	0
+#define FSL_XCVR_TX_DPTH_CNTR_CTRL_TSEN		BIT(0)
+#define FSL_XCVR_TX_DPTH_CNTR_CTRL_TSINC_SHIFT	1
+#define FSL_XCVR_TX_DPTH_CNTR_CTRL_TSINC	BIT(1)
+#define FSL_XCVR_TX_DPTH_CNTR_CTRL_RBC_SHIFT	8
+#define FSL_XCVR_TX_DPTH_CNTR_CTRL_RBC		BIT(8)
+#define FSL_XCVR_TX_DPTH_CNTR_CTRL_RTSC_SHIFT	9
+#define FSL_XCVR_TX_DPTH_CNTR_CTRL_RTSC		BIT(9)
+
 #define FSL_XCVR_PHY_AI_CTRL_AI_RESETN		BIT(15)
 #define FSL_XCVR_PHY_AI_CTRL_AI_RWB		BIT(31)
 
-- 
2.34.1


