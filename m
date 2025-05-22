Return-Path: <linuxppc-dev+bounces-8877-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA0FAC15F8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 May 2025 23:40:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b3MCd457Yz2yqy;
	Fri, 23 May 2025 07:40:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:260e::627" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747950029;
	cv=pass; b=mQ21N8LyEWcbUra8Fs1yFh9CFlBackrfJBrYhM+dB18UAo8nEnPCCCn4MawJHKy3RbKKJLGUzoSxviDMFFjHzJ0mHl8M04nG4XuteKOBcQgFoAVuRVLup2C/S5MKPY9ckk/5Vrx+Yrxz+pwvGg6N33wVWIF9rXdltXxGxoEMP0tDlamD2jaZzx6PCE9+caH7L6XqXYbtrJ316gpTkQftzVZ1vEOVjgZIZuvLLen5x8xoOM1Jg275p545uMKeTdPxc2Nd40H34uIelBEPbNIwbkKun1yed6V+dOAYht2HPMrDpVln2V7iS1LTIysJMXbPuxD6/rBd2MQfG7Etkpe5Ig==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747950029; c=relaxed/relaxed;
	bh=/oNutAxfbWY+KuC1i5OY9ah8WT3qfASDBeUMTwlm7kY=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=dHJGq1zUkHXfel9glPXg+7mVPcG6zBS5Irfk3ozzII9r/IfGdwjIMAd3i76TzcFkbVfLasQuOAabrEKDV4pzYH858eEyOwLrQxxqsZKHh0hXc1iAzODHZAD5WKQ40jZrGzkAB6xt2Qxk1tqfa97+4rDNB56NCcj3s+nQtCTH74cKBYaasMvgi4eaL4jyAWYVhFytSCmmSu7WvRb1nibrp7uHg3AQjfabRRTN+MmA0WNPBGc+8HoHNHaOcNmo5xXRAjDVhyfcCAzcu4eySyAkTOIbDp1/HsrRhMKWttrv4m/NQJGjPAe/TIupnrp7YXqAP5aHmMK8UCHbMk+yaK9hQA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=GOL6UWxY; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:260e::627; helo=eur03-am7-obe.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=GOL6UWxY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:260e::627; helo=eur03-am7-obe.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on20627.outbound.protection.outlook.com [IPv6:2a01:111:f403:260e::627])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b3MCb6BVWz2yr4
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 May 2025 07:40:27 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C2TIziRbxcUWbE4s75W+Xar2kS702tMiNLPR/LSSgvpqpB5TJ4DL4lCiWCYSc6qJWJ1ZaVVLia1u+H4nmyt24NtbHTiQgh4oHzD/qLL3gp9jH0E7opzLi2RF5yGFvjAzL3N/IT5E/NYPklcbXpVA5Y+wSxgj+opUT4OGYxHi4NbXBfQ2XX2fZhI24glNGFyZqMcXJhZBDOmuYCWRaPtm4UPcubceNffFkiNDJi/7iFpfDft5APtumozSRmVwPEG37upyIY2MJbegpM+puxbjPc9lwB5dYCZjI9eOkwC/xbct86iXOI5NE2FPBEITB3vwfVzfl0BVKaiQLV+4X00M5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/oNutAxfbWY+KuC1i5OY9ah8WT3qfASDBeUMTwlm7kY=;
 b=MXCKa/PDh6f4SFXf+TCpMrp9xHF69J2Nf1IgnQ1mzu4cNAjZK/8vF0JKBvhGb0uegKnjjxCb8niRNtTlXEWcLPw3sh9bxPC48laj8uAPmAnkYpEWTNw6nxrgTDSXVqtGPQEU+xKXKExsY2fmR7ljPGfYsduhtpsMHh3h8Mv3f7b+ZI5/yVy5SGezZjss5w37FhBps943zbakX9pRt4ySXw46QcaLDEMsPEMvtnhadBI7UgKMqdD1+/rmzudGCLkSyWxH8L4OLQ+ylZ3/zu44Sl4JR1z2eX7rhuu6Z6PVYto+bT9umRytI9aUGFFJ3bjdihAtMS+IvltMa9HJ3/VpcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/oNutAxfbWY+KuC1i5OY9ah8WT3qfASDBeUMTwlm7kY=;
 b=GOL6UWxYyviV3Lsopn0iIIMN/2wl093z/eEqmF51bnywrtDj0qbpgbPLxWkyZGjfi9rRt+Iu3+1SE5oIP1GlRSzg0PXqFsdf0xpb2pzzcLa8dFP7jS7B2FyuZHLa64qh0Ktt5xhfX/4z6796QVvxJiLH8gsNfRLNuQAQRA+jt1Ko2L2zpkTtqQokPFdcKJpKTlA4rFfZB2yaQM8cFZazZnsKOmyb1tZqvSiLcsNj/ebmKhEWH6DmCu5y/2KIxpihzcZn5KMP3IgHgznEN/PkyITvtfJyHwejK8fBw0dxukJ4RIs0np+lWm0sbSojnQrYCfwt4gCnjoYKibKbstJxmg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM9PR04MB7587.eurprd04.prod.outlook.com (2603:10a6:20b:2d4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Thu, 22 May
 2025 21:40:06 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8746.030; Thu, 22 May 2025
 21:40:06 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linuxppc-dev@lists.ozlabs.org (open list:FREESCALE SOC DRIVERS),
	linux-arm-kernel@lists.infradead.org (moderated list:FREESCALE SOC DRIVERS),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH 1/1] dt-bindings: soc: add vf610 reset controller
Date: Thu, 22 May 2025 17:39:50 -0400
Message-Id: <20250522213951.506019-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH7P220CA0146.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:327::32) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM9PR04MB7587:EE_
X-MS-Office365-Filtering-Correlation-Id: f8b9ecd4-45d0-47e7-4a00-08dd997937c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CqseKHmJUs8mTVAUJ346SOX/KQS9DRwsgUhCzwKTp9AJ2HIAHteDgiWI1qkQ?=
 =?us-ascii?Q?hpiuAEsJX9UGNv2YXeeH5n+tjWB4tNKNhfRyM+2fjF+mq4xgSTrs86tBlkhy?=
 =?us-ascii?Q?3eKjHdkJ32riPhkep5Txi4HVUeeBfjFlRxO4Y39fxn9uXi+OliYfTVj/2uu2?=
 =?us-ascii?Q?siT/Aey4r2h1GcUsdAg2G1Iu6DHQmBxff8OfSbTBroZNqv9Efi7ResuYNIMl?=
 =?us-ascii?Q?o0G7fAr9+btN2WqU6DkvGAKgAwuQzQTHvqeK5Fs4TXLSP03WaXYpHpWS8mlI?=
 =?us-ascii?Q?0BuZgYZtbwMz3ykTwSguYx5vsskXYi9jHRV+28p5AoTxEaVnEdAy7QCIewTX?=
 =?us-ascii?Q?PGhn45nP8nDWozaaGv1xICcRyDlpf/Q5ZIo0WhKRBjacL1D26thOQBKMK0LW?=
 =?us-ascii?Q?/6V/Qp63VDlmcIMFLaN0LODqrxE3rGNLp4eXJbO4U08hqdigfXsg+Z3k/Qa7?=
 =?us-ascii?Q?J9wqmQJ+zLdQcbEnkbwpF1h65B4N2tvMPD7u1gEWrsYCOINYwSypWwBuoGfR?=
 =?us-ascii?Q?3Tke6psFTWV/zCF1ooIHha1D/71ydLWKEv3eVa6u44vzuRjf8O16pJFVVmx+?=
 =?us-ascii?Q?RAQkpHdcKn53AY+XY4AXtTmCeGoEAAu455avlzIwmaY8qh/Iq5wX4VcHy1vY?=
 =?us-ascii?Q?kZEdwtRvVhngoLjENnfF/zZ/Ee/DoXpqdgT3WbiV6CuFf980+xRTylBbxX+X?=
 =?us-ascii?Q?saajhbTKdvCSzk50Wtlwjdp4X8aNKSNZ3KTtfiCHwXdBUJ+KALHC6Tu9XlhV?=
 =?us-ascii?Q?yl0cXCaVJuM9xqY8MUEAk8WCcaCczhWIipfQNN/t3enppl6tFcZmAEgnUppt?=
 =?us-ascii?Q?pS822y2WAou7SG/jyu+uJGUNK+V//an84cCyqW2xqWbccNKjmx5suw5ItA2Y?=
 =?us-ascii?Q?t0BAvwSWQQflk/4d3uEi4036eREwNyMQZryMEQS4iMQso7htq09AiBNMa6hw?=
 =?us-ascii?Q?0Otd1IZtO3i/bjy5IkMzwKjXnpPtsMAu/k4mlyfQHGpqIZb5iikkCB7tHBcH?=
 =?us-ascii?Q?w+Piv9NyaJCkq2JkqSe4O8Zqpr45+wrSvsAyMFY4XtlPRjvO6j0is1RSR1Z/?=
 =?us-ascii?Q?OB9OhfJHiQ7GKpTmltcdj2PFHsPx2JAxaxP8wtZrEpD1U8lc6NLiVYUbkFVb?=
 =?us-ascii?Q?0kRSxeY+5VBvC7HqT6wJzfkRg670fGoFJGZAvMAE0PTkWJzEfHayl9iE32bn?=
 =?us-ascii?Q?B4bxINdNKFMF3TDTRf9avSh4K9R6oSBr7GiR8NeSeAE1rf6rJQ7ABJPSJ+9x?=
 =?us-ascii?Q?U56xfh7Pn7uHt1CoTama93CeQ2BECb8biffYS0t75seHKXJgQtgU1HUwGk7p?=
 =?us-ascii?Q?d+cspLLx3B8Hy9GVELSH500UHAVN3s+Zw2idfDSDqVHEt9lDQpmymai5TxJ4?=
 =?us-ascii?Q?5mQmHT3OYZezxy2t3NEWq9pr7gwqrtKKZ+/OhFdFUTn1SSk/fAcyBTHDOCtL?=
 =?us-ascii?Q?TDTvTLiwuoo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HE1kA8bHlrR1WqzK6ZdDM02VY39xa/sjihzYVtwpNNVjNS2U/BZeSy41IuB+?=
 =?us-ascii?Q?oAllUHLsQoixmuIFIlNXUjGWNF3XYU3h0YMHf/WQ78h1yGoPV7GQntSTx+wQ?=
 =?us-ascii?Q?8POUMRuTNI8ecCyEdAqF8Af7Rp4OvjTl0LQTBQo5KW9ZHAsVEsxFvcPlanTx?=
 =?us-ascii?Q?177epHnGV/mVSvTGJ0ATWlUfqa+jpFUWHqcckFghEOBVuFiuQeWD7OkciGT2?=
 =?us-ascii?Q?jYsgdAiG9WigSqN+shxs/f3vAJVG8g4/G17JewY8ighP+6dnt4Zheri+go+E?=
 =?us-ascii?Q?VIi9D4tKXtbqAlKfzZivhKSkzH815JLKiFl4YllKGryI+W7Vd9ybR7+PWOKd?=
 =?us-ascii?Q?gv/wUcvK2gJuHKF1ZuQazgz1eHV4vNr2nMt4DDbB2v7TrQEn3IvfYhjcFmMB?=
 =?us-ascii?Q?nJDuVp5UvXyaQ5ZgPbz84UamBu24SGKDVtOqSq+k1TR1PtIyHVY+Hjgwl/fM?=
 =?us-ascii?Q?LISldkMPoQkhw21m98T40rHjAVtSNHPmMTyz8PSt4RKHolcmDuU04COKPx8n?=
 =?us-ascii?Q?lxU9YGwaI0oo/zXPqmmMaM+lQiM8rxgKLBsx+4UVHzteSM0yG1PkNKTaIwcD?=
 =?us-ascii?Q?0OXl8KqIl8n1Zin//k+BB7scViGxr+rFT3R1Ls/Ae3XdkOlzVpI/mvALPoYb?=
 =?us-ascii?Q?v89f8bOuto1gmv7TtlJwZ4Ga8zAjy03S7HUMc+a/1BC+kEkm+/1VCwBq0DEy?=
 =?us-ascii?Q?EJ6kdbWd7olG9mZqSAat1yMKBCiiE3dn28AROSzQEw7mHyXC+X6HQk5mqX8V?=
 =?us-ascii?Q?eFE0/hlJmeLkI7b0LAdqHg6diVoTKy67G6bileAeVh045Eab1pxfuj/2a2qQ?=
 =?us-ascii?Q?zbfxoVke7O5I07TfA09gi4pWGgQWf1UL+gQbxXo9Xj6uu8gFHYepHwS3RCqc?=
 =?us-ascii?Q?mPBi8yFZlOTk8MRRrMCQPR7Q+jpiEXCMi36esDfUtt5nusK9J2U2FmZDYeKP?=
 =?us-ascii?Q?EetL+4+XYSYscBxatyKFSCKj1UwGW/QzeD4mismhMtMxvp06GanvWxE5Wqu9?=
 =?us-ascii?Q?DZ7jbMiNpAi/v43bOvKeD0Z1Xe5RDMMfaw0Qv4IwXC6EdqDpYiOPsTlYIoDJ?=
 =?us-ascii?Q?NxqyPqRKQtBfpBTCWyUlZx4yJQqivtjnXL8i7lkFnqQdcJdcxC29FUN+40Io?=
 =?us-ascii?Q?N6SJj0P+Fxri6S4zeALVVuSvcDRGkxEZ2mtahTetUsd1rSsGxiEObX0WTFC/?=
 =?us-ascii?Q?T5/JvgQPDJuhkRlC99Z/6PtkMpNFgqHYZbxpkgycAzBTWjbaAnl3SrpS4p2R?=
 =?us-ascii?Q?Mss7kTzxs5jFj/kpytQncWD0DZe13sF/lbMrWFu8dET5YGQXqEwZB8zUE7fl?=
 =?us-ascii?Q?zCLPHcQ3H/9gMKT4+IRtWM76LZlP/ebkZk8C6eGcVpqKLNcp48Z78bCGc2gb?=
 =?us-ascii?Q?CPBBI8f2A7TDGHmHsTN6zhe/jHOjk5Qdq3uyiyeR2uWmjDoqFSaKG7y6NUB5?=
 =?us-ascii?Q?2wx0jw15KdxdyfoYfNbvrZg3rfW7wvOwfchTgASX746LgmDTt9HB1jcz9JYK?=
 =?us-ascii?Q?4VxMbfHjUK+oD54tJ1iVxJNLlUCy++7VwWUDKL6828B9W4R5O1bvsZ9COqOs?=
 =?us-ascii?Q?EX+BmqvYy/F23KGiFXQ=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8b9ecd4-45d0-47e7-4a00-08dd997937c8
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 21:40:06.6957
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c1BQR8V5t7isRhgtrCtnC5esUebcPfutbZAsxjJhtEVZzFvESIkuMhnlcZ4Dd7zRxVx3EqOE9bdHaAamRRLK8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7587
X-Spam-Status: No, score=0.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Add vf610 reset controller, which used to reboot system to fix below
CHECK_DTB warnings:

arch/arm/boot/dts/nxp/vf/vf610-bk4.dtb: /soc/bus@40000000/src@4006e000:
    failed to match any schema with compatible: ['fsl,vf610-src', 'syscon']

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../bindings/soc/fsl/fsl,vf610-src.yaml       | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/fsl/fsl,vf610-src.yaml

diff --git a/Documentation/devicetree/bindings/soc/fsl/fsl,vf610-src.yaml b/Documentation/devicetree/bindings/soc/fsl/fsl,vf610-src.yaml
new file mode 100644
index 0000000000000..4c92a5e4892bf
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/fsl/fsl,vf610-src.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas//soc/fsl/fsl,vf610-src.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale vf610 System Reset Controller
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+description:
+  The System Reset Controller (SRC) generates the resets for the device. The
+  functional reset sources are programmable as either reset or interrupt. The
+  block also generates interrupts for various device events.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - fsl,vf610-src
+      - const: syscon
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    reset@4006e000 {
+        compatible = "fsl,vf610-src", "syscon";
+        reg = <0x4006e000 0x1000>;
+        interrupts = <96 IRQ_TYPE_LEVEL_HIGH>;
+    };
+
-- 
2.34.1


