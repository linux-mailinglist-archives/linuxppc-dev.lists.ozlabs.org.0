Return-Path: <linuxppc-dev+bounces-7230-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D5CFA6A5B6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Mar 2025 13:04:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZJPPg4tXWz2ySW;
	Thu, 20 Mar 2025 23:04:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2613::627" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742472247;
	cv=pass; b=eh+3qhXME3sabourMHw9AstnClV0x1P8ygHNG3tRNLXW2KR2HYEiHmUTuc3K0jXsZ3mbGkGE5lgEDV5TFA6SPFQRGF19ASnEFg2E7oLAyHPwks14w3xb0JQ4VWKvX0Mg4j9flLVhTOy1yP6DEC2/U8JrM3DP6TzZ4oI31fd2fVKup5QDXAFJA5K/B7AM56K/ySMMSvJd2kvl85tWFH+q5mLrToCpxLeNs0zis50n6PLrMFEJP+dkSpxjVTPfWEZSRqIZ4kRpfxzbr65lAH6DcwLl39pd0B0NNqDQSI+5xvqnkoKiug09DeJ/rk4HuSWSOI5MuO8L8YzErEwTtVVDeQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742472247; c=relaxed/relaxed;
	bh=ezq2u8RK4tbhgzT5JP3/NkxqIL6TCRYzyDSa6DG7j2U=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=G3fpTBi+tNwPfMCeeyC8rY67ILqr/OBRja8bRHQ0SiQtSbiBeo6oXsHRCLMxAW1XHStW++UEDatH1eMUlWtTjpUj4E5tpGNd69b4b2i+84CMcYrc6Jf+cCAPuZp50yCNoMwVoOr7JgKuA0v0MTOB+fdvilruMxcjNvfSL+RVgDf4GQYJhBdmPIJo3bC+yflPxuOuZK6NctRTjklzAWyfQr63ZVBQ+1q+6DxQsYNbTMdH8UAjbWsXkwL76lj0vWUG0wjxliHuiUmLTC9CerMJ0wg6vn0j890rLls6toSedP8PCm9ggGv9Yr2eTgm6MOOcShXd7TdUDr5yG6NctaHprA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=kTz7MgY+; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2613::627; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=ioana.ciornei@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=kTz7MgY+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2613::627; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=ioana.ciornei@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on20627.outbound.protection.outlook.com [IPv6:2a01:111:f403:2613::627])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZJPPd71fkz2ySP
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Mar 2025 23:04:05 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PQsGyD6JeatklZfgoFJ2bD+Pqa2xqoMyX9zQ4clOHZdlH+4ckbcoLM6JvIlJZshN1qSOjH9V6aNnFhYwW5Qnb3FxARX+ZYQRVL558zJrKEXcu6drcI7UgWAQcVDDhOnoeYYjvjDGUkxTS6ahFUCfCBARDXeJf5dgiEcx4u35/WP7/p7T/uVvAP71K4MWBRIXBcE3ghPLsD6HnNComx0lXgZUObWLByz6PW/LPfdB3ZuI4Q+iy5d/dQ9ktseW+VOm2lpfj0ghlJsVemMazuH3TDVVWuxEino1gs+erdzXjeb0P+pmC5tbxh/7/WeWqKNFoz1FYjwB1mdcniwh/AZeuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ezq2u8RK4tbhgzT5JP3/NkxqIL6TCRYzyDSa6DG7j2U=;
 b=u5eExaEbV995SV993VCD68EdbWPxXRrYqVPfY4FhsaMLh1JMacar4gFY+JKkF+UyFM2KwTQj5TWydM9rDrqZleh3dO/UUr1AbT9zqVdbukfTZRRmHdy4cHbfqNUUNZLh8jG6F/8578mjh0pNksYUwYgTM8uhhqK5VVMI/s/idTdoVZ41rXXeKzubQUj/mUWahyd9kyW+wn8eTcPSewKUm58CVTanQL/JecuD809gTp7OUfop4T0VvjoQ+qEptyoMapjgg9GTskt7UuCnEX0ZvN4rkYag7pZOMIBAzatlwV4gea789Nx50DG15W06a1rgS21q+o92r7ufkh+og5w1mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ezq2u8RK4tbhgzT5JP3/NkxqIL6TCRYzyDSa6DG7j2U=;
 b=kTz7MgY+bV+jiLHJXz6msUA2TzIuVhYx1ITFIoSDFUcDhnKgR829OZN69WqRs3vKv5h7AG14pdaRb6wvOLE6vna7rFGcma5m8iOZNm5CQz0osHHM9QNf0om61x2WLoo+sAnG7GdGzy/0muL3NewwIZcGzcyTI45fi//NN2GNkTcvFHSWcKPxNpwqTBncOxG76jKTEcMKQN1kVwuvi9MyGhfafoSfSbiSF4r51HPVtK4F/k7Jnn70ne6PCt0OG2zn7rALUzp4AGhkfBCibCfeWFX6vqAsaazZxf/rf1CxM68AMgz9fMeYuezqsJyY8QKEphzlJxZGK5TiZ1bojH9eAg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by AM0PR04MB6929.eurprd04.prod.outlook.com (2603:10a6:208:181::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.35; Thu, 20 Mar
 2025 12:03:43 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e%5]) with mapi id 15.20.8534.034; Thu, 20 Mar 2025
 12:03:43 +0000
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
	Stuart Yoder <stuyoder@gmail.com>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v2 0/3] MAINTAINERS: updates for the fsl-mc bus entry
Date: Thu, 20 Mar 2025 14:03:16 +0200
Message-Id: <20250320120319.3520315-1-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: WA1P291CA0010.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::10) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
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
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|AM0PR04MB6929:EE_
X-MS-Office365-Filtering-Correlation-Id: 60d9703e-22c2-40d5-8758-08dd67a742be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fgNyTgpe1qYM3f4KUyvLmHNxFh53Oi8bJ48Tw7fRj2k0N2q2jnYzHU6OEGYH?=
 =?us-ascii?Q?FlxtwmSzHsjhcMdAdp17TGiXhcqCVdPO7VKjFISuG+pf5s6G4DdMYmTP/dYo?=
 =?us-ascii?Q?TjuJJwghl0LRPZISQU/D0tSlB9b1qjarphEq8sGE24TiZayN+5KgssQMDaEu?=
 =?us-ascii?Q?saa9QwBHcgJfQ0LIyVMVNF9frIFx2JcGesl5EsVXtel604qN+iIGtfy/ZPf+?=
 =?us-ascii?Q?mfo330hNtaYcXs9Cev540iQDkXIKjGAu8/Mp9vjRDfXc0t3gGdH08+/iavaE?=
 =?us-ascii?Q?hHyBofhfDyWnbU8i0oPXn5R5cg8JqVtNJ8Vaq1w5DErdIz7PjxczLJ7kVJhs?=
 =?us-ascii?Q?YqYpXBkBiv/EfLo6pGvSDGQzDpxifjxjRWcVw345xrJJfe3slP/U69OoRagE?=
 =?us-ascii?Q?UR6p+a2cHmLTUdy8a8QdF/Gj1uX4Txuk0A51alhtCz4+nTJC6XCCMk5b+pvt?=
 =?us-ascii?Q?Ypxqjc8E1ZWrbmF+rU4/3BVB7LalNiQ5IcJGAYnDMbOHRWAE/i3vRqqhDRTc?=
 =?us-ascii?Q?K9cxnn4PAxz/f3C962IqoPRA/1gjZOs41aWBsqwxUm838sHX0PhHcKc/WSdD?=
 =?us-ascii?Q?EgAV3ap7dCaI6GhWOqVVUASZs+vp+liigZ/XpakT1AvSI8viMqYF0GtppXkZ?=
 =?us-ascii?Q?Bgee6lHvxMn5zZe6mOTEqlxhBq+cszmHxMZQtSn8UVgcS1SHUbbFArHdeVHF?=
 =?us-ascii?Q?8P6Qu5vpesSRqw1Jq74n/A6D7BhnwBZnj75ZmNW4CxNI0wgMOpFu7qZG2mfd?=
 =?us-ascii?Q?DUTOYo1QV6M0EsuV+NVkQetDNrXcV425hD55iCzUFvwmD2hROLwMZUuKHtsc?=
 =?us-ascii?Q?gk2Z7WNP2HcyshE7U0ME1jk29it/BFgwSKqkz2iuMddBGaWdjJIb0/bewhLN?=
 =?us-ascii?Q?GAJgEpMyw4McFhvs0QhEOy0TYbGffyCIwrI6Mal3TvW53YQrENhi+Auckldv?=
 =?us-ascii?Q?q39YzQsL9PLyq4oLfd7CBpuEbyqH8nbUN3tmgYZo04R+pC2SmS8yaQjYBwrY?=
 =?us-ascii?Q?vxrBqbqX0R3At8Lgk/uNGSLZrhfAOh16YRUpXQGhjY8bHvr+cim3sHR+Mjck?=
 =?us-ascii?Q?zleUbavwi4BqoVukNOOgM/Cn90CMTdyoI6hFbtK3JD/XSN7IwGfn8TWcM09t?=
 =?us-ascii?Q?QzZ1Xwj49mNO2MyFAtURr/uOApvr8ffk9s+/wqCk67TAmyQHq6fyK7s4VIr7?=
 =?us-ascii?Q?FB26aobZS3reN8sdN4mCicXNICdjzOqU98EJuCtiBEv08swoJm3fKn+oJ6nQ?=
 =?us-ascii?Q?uUrVnaNIetRX5S2YvAz5i/RvMtWW1oNztt/b+hPiBYeoQXjcIRqCbvoPDQ3e?=
 =?us-ascii?Q?7KyVpvjf2dl7xpo5l1TCmjVm26VQWr8HD9EjpigaVTCC64RKW48CT0Nda5Ue?=
 =?us-ascii?Q?O5UjPcI1lEIZ0IfcIlboExOKocrz?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?H9xAvUSlObjhAbIcpsxcIn5tU/XiuiQtj5XhYYE12hNJDgJ6sx0Py7oHK9U5?=
 =?us-ascii?Q?4jmDSbma5Nz7IkK0xQGdR259aiSMRh9m40aEXswFZOaU36GbY5jDgJ+whU6e?=
 =?us-ascii?Q?V7HTwzVfKyCBUqhKTHAwLiDtV4I9dXWpxRmSncTRUdB/n9SDvmJn/DBPtbYx?=
 =?us-ascii?Q?tZS4kEX2VQ+uWuMh5dkHzNojsISNAtUA+nLbUe6Nhi1ZGUC/wge5APpazh0a?=
 =?us-ascii?Q?jjUcRrOGAzVTD+sPvAMS/bc43ApqNh9CJFFzNOId5IQfxCzi2dJoIfntjR77?=
 =?us-ascii?Q?SynlIENVD5q38YXD0PAv2lXMWf7WBpiI7LmnlegfFMOWWt87CF4KVSCPvgUJ?=
 =?us-ascii?Q?dsOPyp+CPloF970InGk/Ch1geV7t+0q9MMvIdiR4XF5zbLms1qBD69y3ajm8?=
 =?us-ascii?Q?SAyk3tbsy/ZLb0jqHxC1Bdn/LD7gmq+6dUA+v1lqaj6jWTNLUIve1g4CFOq5?=
 =?us-ascii?Q?iD4gW9eZDoG1gycHxqxNnyi1my5ATavj+Tq5kQOm6JmfkJdhkuopAxSLfrZG?=
 =?us-ascii?Q?j8UwxgC9dtPawGOhGpak2BsJwycQUuAebiUoaYMQim55vKzjbjEF6c/h9U9r?=
 =?us-ascii?Q?/rZHmqy2z0U1mvu6VmNv++f+HaTrR2oNvDHLNEpcjLfLrXRbrnhE9AFY9RY/?=
 =?us-ascii?Q?YPoZr4Qjknc7Mx/i17K/LvMuLQ8QEjvsDwuiGsJFRmlZ98aJPzy+n80hEPvO?=
 =?us-ascii?Q?YKyhYL3r1zHKz7kvkNaCGyj//LghlZw0VWccCB3lvEu00nGOoKx/hhNq520R?=
 =?us-ascii?Q?dMgzfobNQ5/V0Slh1jMTFJ7WjqIcuwj4XYAI1unhZ1bp1A3gNmB49PCWoEep?=
 =?us-ascii?Q?lBICqCBvP5C58rFNo/N307EtuVh1oCzM1jhQ5e47dpd0EiX3F49zVME+PiK8?=
 =?us-ascii?Q?L+j3gOc54skaXjDLsJ8ah5CO+SKl2NT3VJwEja5DSs3xx8zbP3LOKyyhKQDh?=
 =?us-ascii?Q?q5X9P8tyXvraH1+54p1RXQUwXpTtNuYM5TCOshXG9bjUBx57aD8qEhu16PH3?=
 =?us-ascii?Q?ut4kDxIj3x4j46lDwutA+i+6xnMNEO8/ACncVyRWnJdwL7dTDoENa8PsmKP1?=
 =?us-ascii?Q?I3zgbjVuG7rlVv9MgKGQuUhenhuLZsjlabkjmQHqwdv6I1r91YgXyQqkxo6L?=
 =?us-ascii?Q?yEPk8PF8MzyoJpDKVgL/xHZRulQoW7PXKNiT2XXdEpcEPDyYn9RXhMUra5ZZ?=
 =?us-ascii?Q?6Cgwei+9Kv89wHqjUXcbS6q5gEq4SyAKaZGeyJIkgNLraGY8wgMN6/Ay/WgI?=
 =?us-ascii?Q?VcJtU6amwR3xKlfkMO5iI9g9MJa5qfsjV+N6OYLGw3E5sfPnulnsMrJD/jeI?=
 =?us-ascii?Q?5S0pLa2IclRvieCkJv4vpaZXl/G5Cc/ZPpSEtLt/xszdrKUDatHiVIQur9sO?=
 =?us-ascii?Q?W/d6jl1t5/JMwRxOSY+ZjE4/qAG9kIbCB4J/WDne8HG5pI1dluskj0KCr7Jp?=
 =?us-ascii?Q?WDdQixZmilJCA6urRqgaVnC0VKgmn86OoGt7fwsAEqGI0CzTjwfZnyBHVEDu?=
 =?us-ascii?Q?GByN7j3PTeYMCOs1SeQpTIL19EiN9YUPtMAg+BQsgXOWCIgefPilv18AHZeN?=
 =?us-ascii?Q?WOGtbhd1LEvE+DIHaLkdFUwuXT4MeR6qAJWmFwpe?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60d9703e-22c2-40d5-8758-08dd67a742be
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2025 12:03:43.4553
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4tFLvBI9O0nuOsQHvS5dzZSNx/iyu6NRmjjFNAXkIcTPgLB6EHqtpNE8n96PmRvapCdrUC7UHXp0YU0esMBC1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6929
X-Spam-Status: No, score=0.7 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

This patch set updates the fsl-mc bus driver MAINTAINERS entry. Since
there are small separate changes, I put each of them into a separate
patch.

Changes in v2:
- 1/3: also removed Stuart from the MAINTAINERS file
https://lore.kernel.org/linuxppc-dev/CAEac7tYQE76z4pYminhvMJR6GZ66RPRv4PxM-U9VpGJjvn6APg@mail.gmail.com/

Ioana Ciornei (3):
  MAINTAINERS: add myself as maintainer for the fsl-mc bus
  MAINTAINERS: fix nonexistent dtbinding file name
  MAINTAINERS: add the linuppc-dev list to the fsl-mc bus entry

 MAINTAINERS | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

-- 
2.34.1


