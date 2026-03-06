Return-Path: <linuxppc-dev+bounces-17794-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KLGZKL6gqmlLUgEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17794-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Mar 2026 10:39:10 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A58DA21E14A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Mar 2026 10:39:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fS1Z75Pgcz3cDt;
	Fri, 06 Mar 2026 20:38:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c201::3" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772789935;
	cv=pass; b=Np4LVUull/O2DK/dSuAQ2m1kcrtcx2rtyneCj+3yYOakfeTdGHr2xxXw+VkSD8k9Zu/gamVrSmsCk0dfQuOJkp5HPe/hWcbLww1Es4UkEFT+SJHoJ9EMMy6wT2i7ETeO3sQxzcOhpQluE6co8WB3r+ImPACM/LwFiGkX971l+HWTfdIHGvmXbbvnqYzt5UtMWsx66uTnnoP3nI3HfNMQXd2lsExSN7GrtZaDee9BqTTapHFWuQdjl287+uDIbxwLvA4mVCK2f1kjCpDoExNCOGKKB+VO38qwcdtKitbKMAuEPkoF1/uPtIKJGUOE+8zGdzhDYsx9L3lIFPAlEFohKw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772789935; c=relaxed/relaxed;
	bh=RBwQGeMBF3fJZE/VCEBVajJFXCLIy9W3IaOdwEAOhXc=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Hx3ttC3NvFbC0YHxqHu6ZlEMfyS/SU2RXrbi276g3ymVuznJlXsFe+OYvEURkTfoeOThWmxqFsUjcaWWkFPd2dxpSKUjQW/Aga42kHkaDFg6TQkY3kqt/FdNQEDMfQ/rM2JUY46htV/++lKw49nYntmP9vVeMNuPdEG1L58NgPvTbslTo8g0OnD+221K1ej4SyrJYBkf5G6sQv+vx1gg38Gs62hQLXKqE4MZDWC6Ij2nG076syuYE3aBNhMdkJUCwnRSkhNKHnldbpYpqb+DPfC6JDsXSRK19issF7emz8JCNZfrQtoKE5KXeM/nFLuxxrkvsjH5YFN21q3LyfCFMg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=UU2g53Xf; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c201::3; helo=as8pr04cu009.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=UU2g53Xf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c201::3; helo=as8pr04cu009.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazlp170110003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c201::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fS1Z701SFz3cCh
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Mar 2026 20:38:54 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aC+quHvkyo4CiO5rW3hvTHn6H2Cyy1NphIKAQFhNlVvev8UBDeGI6v3QmaOijXM78HvwSpT8cC9Ifiki2L+1vb+iyJmJur3K5PFj8NQPMMZKBPsQmzBSI7EqbPRA3HoYq457M59Dcf20cctyOlvlycDyQpEmLFu8BITb3hZkV+sIwM73Itz2r6EtqxnnelPEdps48iHFcQE4WcFSNkUXUVEFMq20647mqydFje/IzbT8RhUxs8aOCL6PZUmNq1lPjIxYdxSiQXVwAz1aMjYDR4G9Bjm9+uqk0sPvvRNfV89kSTxN7gRE/03cmjQ8kyjaVdhg8Bc8M9PjIePugiVLuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RBwQGeMBF3fJZE/VCEBVajJFXCLIy9W3IaOdwEAOhXc=;
 b=XkI1KvA9gTyOv1884sPRyi+zdE9fQG700ykXZZgG8SQQXnotL+8czd7KtGsGBcSw6/hJYSq7pJFkXVm2ccSET2TfhwxFXL19IbTBDK8+S4EHI6uwfejBqUhPgTxU4xM5WiEcIQxlEkMx3C8HLjDfjNsfxymQmPVi0vtnwi3BeMf37C7GTlAYqA3pT8TsrZakyVDO1lPb4LEDgyIrBLiF/mMxCtfyIVYReDmWqM9l9O4EKHfE1fbyDHc7ycDmRz/5ccyVS/q2MlF9IgF/u1cMmcv6RAMY3x4qTBtNRhmAVNYbX+wHJ/Y+Zf5H5A7J1ypsb7h72wDxfSq6jNNuVhCqGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RBwQGeMBF3fJZE/VCEBVajJFXCLIy9W3IaOdwEAOhXc=;
 b=UU2g53XfMtG9Vq6a4Em4GUULK+FbRyr0h0G6C/zIxg3mnXxH/Y6+0qRjw/y0g+qdB8R3oXrRBEq33nWfzrnk6gtidHWmH6+gHtinZJTmf4mEjgQLaEd3RN9RK3f2XTkMU0O02bVZug5Zm3QE5Vm+dDjnd+sVNojk5LNsB2YIdbac00sZhj1/fyB+Ufq9v1RayOxvaeBHX+mSiVoNm3q8JNo3uJaA01+CpsFJb9YjoIo402IHLCz6d0JSZ/Y2ww9r+97gOyegrCohkG+codmQ1dKvqAxbepXSuXMw9NtdcLheOXoAjUu5scEuVNO2nCVG6qs9uRt2zNX01Lq3Fya9Sg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by DB8PR04MB7001.eurprd04.prod.outlook.com (2603:10a6:10:11f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.19; Fri, 6 Mar
 2026 09:38:33 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b%3]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 09:38:33 +0000
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
Subject: [PATCH v4 2/3] ASoC: fsl_sai: add bitcount and timestamp controls
Date: Fri,  6 Mar 2026 17:39:48 +0800
Message-Id: <20260306093949.1647452-3-shengjiu.wang@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 008b7e61-08c3-44e3-c7f6-08de7b64223d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|7416014|19092799006|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	isQpvDAkdi3hcfZY6aphtMA2TH57BdjR4m+1WfvKOGquxuIGkU9IeOMMQMaVjC59otSgDRyvcFuON4o7o54AkJmUbeQEjC8+X2BorsHBCU8mU4iHDmVj+Uj/P7UnwDJG7FSp7I2gohE5YK8ViGLPyeu4cPNY1JbkviaHhEDTtTikC1OB2RPJtCAdg2iW45a9dhdk55SBoH4onVIlSOekDiBoG2gIxUEYysO854EROQkME9nDBL6yPjoECPdIvMmxkHz//2u7GHCSE7sQKL2+Dxgz4F2PNKb+k/bmA3KJHh2uwcoZtVgw/et4KurfiH8j+W5L6YIeuTqa0bC21rqFQ2VzTSjLNjqgyKFnz2x4SzdL/Ao8FMY0JFcHl51B/lwNOlIuqQp3Wc+JHzF73WBQVrbnRP3lEcawyzpM0DeW8TPB8TvkiUylo1grCRMUHg4yN9HhUd7hwk6PSmXf1niilZM8KsXaDwNegxAt50JfjgVoDeWZaOHBu/Jp1SuPZfz4VQywEyJbTQD8mwKkfzvH8upz3GebccxFr6krLRE/L0Q0ZBo6BB7iKMWyf2U8zz2sPiX4DjX9eKh20Xe7128QvYwXbsutmEXlfnbLiQABdInU1XMLXrOTSAaWJT5d+7RxdAGm/FyfsGHrRkYB1d3SoOehv7oKbmXvVACq+qcFtyKe0WzK5RAADulhzvFXRbBxTAZH8pl1IaNYD7Yaf+BGfLZqNRZiPMvKqdAJAyZ7FufPDF4z7adk06N1wyl5JDwEXwWa+q3oLjpasJoEpAeL4YZk0c9+A6e8UP7LLyxaHYD+7Lha1PrhzcQJSGejpI/u
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(7416014)(19092799006)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?z1gXet+a6naH1ufRt6Yk0ndfHumujALpi5DH0c9hUV9vi/JieIC8GFYJeZGc?=
 =?us-ascii?Q?n1RD+3TjhcVX+v9LYkyNQLz01y60xsN+9c11ahyEEyVnVZo5CLPQBOUEYrT5?=
 =?us-ascii?Q?KvSn9jEgopgHtrFuZHbYhoepkuXkB011UWFuEq+874MZEAIsDtbMYMFuNy4B?=
 =?us-ascii?Q?glgC5UgUaE6NcPNVFmK2oMqeyQmikdtfxwxElzfmUSsoiF+jXLEzkGo5wsYe?=
 =?us-ascii?Q?KoPX9dcGdl50Fc7jrqVuLoiOvfvtp1h+6Svipd8H+1Nwk+f/9EzDoanDnDkp?=
 =?us-ascii?Q?hfN8X/yZrQKfEXL12ygln9PY18CrTxNgEyU3M+z2td8zygcnfG6ZUgoSWJ6t?=
 =?us-ascii?Q?OdZ9LEe6vJRrXhveMdWzQyxXtTHq/G9Mekihd08yP1d3cUP5jYQhZ96w866Y?=
 =?us-ascii?Q?RkJ+0XeRxFyUVu8Aovf362t3XDjCEDvHJgcfcfaOMe2cqjObNvybCVRNbxe/?=
 =?us-ascii?Q?6kVWtNAytQ6omYgbgO3ti3NR7Esi1wPAY3Mfh7/Bec3ICuppeyOdEQkTgJkz?=
 =?us-ascii?Q?rVr9J4C08YueboLAWtIGJlXG0MyFffQiiWOgyHFTf8WpojLiv5nvivXeq5XK?=
 =?us-ascii?Q?p33A1Pfs7RW+LROJwZHoFDjDprMPE7oXAvIyjK2RS4Sh2DvOfQK4bNMxgW01?=
 =?us-ascii?Q?qlvcdObpULU/6lc4a6SmlcO+PUVOrpuRNu13jfQLql0Gjy7vKps7des2y6nU?=
 =?us-ascii?Q?uIn0obbqRntohpENBljbKmeYMaOXYqpTTlvmO5ev2auFVgP8wVDlskajiUcI?=
 =?us-ascii?Q?wL01YVWYhCLKGWhH3aXlJiMzmZdW4qLPnr94J5jNXJNfXkU19ja4o+m4GfGg?=
 =?us-ascii?Q?yvfVRiW3s+RpT/IXdGB+sKK/BPvl7VVLTvj4UqhA00Hg88GPe7b30EXpLkgI?=
 =?us-ascii?Q?4SdqbWekvm+GZHX1qgIbG1Te0HrEAx6xixx3fON7WjVdm65sXjHY7WxWwgCy?=
 =?us-ascii?Q?ostQ3tG/GGizJBICo/UxOgx5SVoFxhU7BQcqjJ/ckuM2/HCVlT48ABz5pbGg?=
 =?us-ascii?Q?opaOMxiFLA4ol65GkiSo8xHHAXW6hVY+QIjEEaqkgHtJsNAB/s9PN+8D6uId?=
 =?us-ascii?Q?bHY6V+8E7vY9zWwqpNSMGQ6IAVEl+X1u9zfGk3Buk3IumPTurjRvLEmvTKjN?=
 =?us-ascii?Q?/EPKkiJFaQOv82y3EVbL/GJ6TpV7DuZ7cQhYu5zCGIPz85ene+gn6aijl2bZ?=
 =?us-ascii?Q?o7KCQtJ6RM+pHJf83rLJ625PxcayPP5YSCJ3lSeaYm4taf3kbcsEY8n2r3LN?=
 =?us-ascii?Q?6o5/h2LLImwa5biR0RAbfM1WWYteHFjhjCDnkme91VfFeXLxhmLjM0CW6G9v?=
 =?us-ascii?Q?bUkfhqb6RMDm1cf8GqMpqRZ/CojPEXj4ZRhzQnYLRh9zPyGerVqX250rofI9?=
 =?us-ascii?Q?AP9zLNC+Anyqgfgpy0DznmQac95uEBLHmJtv/B5wiIH3unJib3KzOobB4euD?=
 =?us-ascii?Q?e4Ig/kXwINl+nl4x9K5CgRfBt/pZWzNKT19i5Pbp95JPW6RmFk0g3Q6a7eao?=
 =?us-ascii?Q?Boz927PZTlDK+tCkPxOYKIi6XuppHzbaIFivIz9EwHn85bdjLr3xVDw/k2vZ?=
 =?us-ascii?Q?WZyni9w74HCDZKn7xOYyWEkNehXVn7phbuRgnvVCGp2li/kxVh2umQIqSEzm?=
 =?us-ascii?Q?N20u0yfj6GwtOCCRTRLAiP1JNmKxV1R1JBBYkgk74QxwjWEP3WZFvfQWRMPk?=
 =?us-ascii?Q?VII8yPRElnBi1NftuOtwfMEzeDkhTyIIUz/tPysdN0CmKkCkYEM0b6MY6rXP?=
 =?us-ascii?Q?1Yl/otMmqw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 008b7e61-08c3-44e3-c7f6-08de7b64223d
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 09:38:33.5531
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MlanTKgov5x079g4RajrXw1Y8na09RIjxnqcvXynjvUt+6POSzqZYhRGDirfz0CxEdxxEIN34M3g3KIjmCiA4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7001
X-Spam-Status: No, score=0.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: A58DA21E14A
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
	TAGGED_FROM(0.00)[bounces-17794-lists,linuxppc-dev=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:rdns,lists.ozlabs.org:helo]
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

These bitcount and timestamp registers are volatile, and supported when
the module has timestamp features.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_sai.c | 62 +++++++++++++++++++++++++++++++++++++++++
 sound/soc/fsl/fsl_sai.h |  4 +++
 2 files changed, 66 insertions(+)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index 148e09e58dfa..aebb5278cea7 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -41,6 +41,48 @@ static const struct snd_pcm_hw_constraint_list fsl_sai_rate_constraints = {
 	.list = fsl_sai_rates,
 };
 
+static const char * const inc_mode[] = {
+	"On enabled and bitcount increment", "On enabled"
+};
+
+static SOC_ENUM_SINGLE_DECL(transmit_tstmp_enum,
+			    FSL_SAI_TTCTL, FSL_SAI_xTCTL_TSINC_SHIFT, inc_mode);
+static SOC_ENUM_SINGLE_DECL(receive_tstmp_enum,
+			    FSL_SAI_RTCTL, FSL_SAI_xTCTL_TSINC_SHIFT, inc_mode);
+
+static const struct snd_kcontrol_new fsl_sai_timestamp_ctrls[] = {
+	SOC_SINGLE_EXT("Transmit Timestamp Control Switch", FSL_SAI_TTCTL,
+		       FSL_SAI_xTCTL_TSEN_SHIFT, 1, 0,
+		       fsl_asoc_get_volsw, fsl_asoc_put_volsw),
+	SOC_ENUM_EXT("Transmit Timestamp Increment", transmit_tstmp_enum,
+		     fsl_asoc_get_enum_double, fsl_asoc_put_enum_double),
+	SOC_SINGLE_EXT("Transmit Timestamp Reset", FSL_SAI_TTCTL, FSL_SAI_xTCTL_RTSC_SHIFT, 1, 0,
+		       fsl_asoc_get_volsw, fsl_asoc_put_volsw),
+	SOC_SINGLE_EXT("Transmit Bit Counter Reset", FSL_SAI_TTCTL, FSL_SAI_xTCTL_RBC_SHIFT, 1, 0,
+		       fsl_asoc_get_volsw, fsl_asoc_put_volsw),
+	FSL_ASOC_SINGLE_XR_SX_EXT_RO("Transmit Timestamp Counter", FSL_SAI_TTCTN,
+				     1, 32, 0, 0xffffffff, 0, fsl_asoc_get_xr_sx),
+	FSL_ASOC_SINGLE_XR_SX_EXT_RO("Transmit Bit Counter", FSL_SAI_TBCTN,
+				     1, 32, 0, 0xffffffff, 0, fsl_asoc_get_xr_sx),
+	FSL_ASOC_SINGLE_XR_SX_EXT_RO("Transmit Latched Timestamp Counter", FSL_SAI_TTCAP,
+				     1, 32, 0, 0xffffffff, 0, fsl_asoc_get_xr_sx),
+	SOC_SINGLE_EXT("Receive Timestamp Control Switch", FSL_SAI_RTCTL,
+		       FSL_SAI_xTCTL_TSEN_SHIFT, 1, 0,
+		       fsl_asoc_get_volsw, fsl_asoc_put_volsw),
+	SOC_ENUM_EXT("Receive Timestamp Increment", receive_tstmp_enum,
+		     fsl_asoc_get_enum_double, fsl_asoc_put_enum_double),
+	SOC_SINGLE_EXT("Receive Timestamp Reset", FSL_SAI_RTCTL, FSL_SAI_xTCTL_RTSC_SHIFT, 1, 0,
+		       fsl_asoc_get_volsw, fsl_asoc_put_volsw),
+	SOC_SINGLE_EXT("Receive Bit Counter Reset", FSL_SAI_RTCTL, FSL_SAI_xTCTL_RBC_SHIFT, 1, 0,
+		       fsl_asoc_get_volsw, fsl_asoc_put_volsw),
+	FSL_ASOC_SINGLE_XR_SX_EXT_RO("Receive Timestamp Counter", FSL_SAI_RTCTN,
+				     1, 32, 0, 0xffffffff, 0, fsl_asoc_get_xr_sx),
+	FSL_ASOC_SINGLE_XR_SX_EXT_RO("Receive Bit Counter", FSL_SAI_RBCTN,
+				     1, 32, 0, 0xffffffff, 0, fsl_asoc_get_xr_sx),
+	FSL_ASOC_SINGLE_XR_SX_EXT_RO("Receive Latched Timestamp Counter", FSL_SAI_RTCAP,
+				     1, 32, 0, 0xffffffff, 0, fsl_asoc_get_xr_sx),
+};
+
 /**
  * fsl_sai_dir_is_synced - Check if stream is synced by the opposite stream
  *
@@ -1010,6 +1052,17 @@ static int fsl_sai_dai_resume(struct snd_soc_component *component)
 	return 0;
 }
 
+static int fsl_sai_component_probe(struct snd_soc_component *component)
+{
+	struct fsl_sai *sai = snd_soc_component_get_drvdata(component);
+
+	if (sai->verid.feature & FSL_SAI_VERID_TSTMP_EN)
+		snd_soc_add_component_controls(component, fsl_sai_timestamp_ctrls,
+					       ARRAY_SIZE(fsl_sai_timestamp_ctrls));
+
+	return 0;
+}
+
 static struct snd_soc_dai_driver fsl_sai_dai_template[] = {
 	{
 		.name = "sai-tx-rx",
@@ -1063,6 +1116,7 @@ static struct snd_soc_dai_driver fsl_sai_dai_template[] = {
 
 static const struct snd_soc_component_driver fsl_component = {
 	.name			= "fsl-sai",
+	.probe			= fsl_sai_component_probe,
 	.resume			= fsl_sai_dai_resume,
 	.legacy_dai_naming	= 1,
 };
@@ -1211,6 +1265,14 @@ static bool fsl_sai_volatile_reg(struct device *dev, unsigned int reg)
 	case FSL_SAI_RDR5:
 	case FSL_SAI_RDR6:
 	case FSL_SAI_RDR7:
+	case FSL_SAI_TTCTN:
+	case FSL_SAI_RTCTN:
+	case FSL_SAI_TTCTL:
+	case FSL_SAI_TBCTN:
+	case FSL_SAI_TTCAP:
+	case FSL_SAI_RTCTL:
+	case FSL_SAI_RBCTN:
+	case FSL_SAI_RTCAP:
 		return true;
 	default:
 		return false;
diff --git a/sound/soc/fsl/fsl_sai.h b/sound/soc/fsl/fsl_sai.h
index 7605cbaca3d8..af967833b6ed 100644
--- a/sound/soc/fsl/fsl_sai.h
+++ b/sound/soc/fsl/fsl_sai.h
@@ -196,9 +196,13 @@
 #define FSL_SAI_MDIV_MASK	    0xFFFFF
 
 /* SAI timestamp and bitcounter */
+#define FSL_SAI_xTCTL_TSEN_SHIFT   0
 #define FSL_SAI_xTCTL_TSEN         BIT(0)
+#define FSL_SAI_xTCTL_TSINC_SHIFT  1
 #define FSL_SAI_xTCTL_TSINC        BIT(1)
+#define FSL_SAI_xTCTL_RTSC_SHIFT   8
 #define FSL_SAI_xTCTL_RTSC         BIT(8)
+#define FSL_SAI_xTCTL_RBC_SHIFT    9
 #define FSL_SAI_xTCTL_RBC          BIT(9)
 
 /* SAI type */
-- 
2.34.1


