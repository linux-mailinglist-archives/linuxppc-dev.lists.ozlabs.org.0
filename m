Return-Path: <linuxppc-dev+bounces-7210-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98497A68870
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Mar 2025 10:44:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZHkLY5pnTz2yrr;
	Wed, 19 Mar 2025 20:44:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2613::620" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742377445;
	cv=pass; b=ghixCyVsEV2CJdB2PsbKFk9oi37c7gVbVqmQ2JmUhN/lj9ASjDpKMmoAnjSkGw5XET8kmkC1IhCcbJ+0OIP+d+r4jlY6oP63uTdZ/sBKCfbdgfJ/rHvkG8HL7B/lxU2iSdGgBC+8bSGx4bQ+/HS5RKwpHh1q9eqNSdD1y6ciNe0NpjbXHJHY/JnESaQomKz+NX3IS9+zUAca1sXe0/foGDmxqdz7B2KWmj2O1i5yGFV8PHWq41Bt98236Qw1HkoPuDixFbmDtXwfHElVtQz4CAi02TauKQ2jRxZkeSDGO++xClkGgc++e72wEjpmulGcmhkGQywUChP7KuWWDYlk0A==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742377445; c=relaxed/relaxed;
	bh=lKBTT/4PeoEg+yRHRVPZyrWu/xb4H3Dzjjaj/EEOi3s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JlBCNmdFHUyGIiPwxpUddDcDV7HbN26fksGn8gnC/4GbWjQcnHerMabZ573bWcTnaqSxFFF9l4JaAPyZm0eK6XQ/8bdiYmWJ3p4Xd+czTRoZUtgtaeOaUmizifJmdl0R2hhqpmtGdeO78g26dZCMOTw9lpXn8Rb91woyG+Ko8Kvd4/7uc+9C7czPjE+nF9+xdMgDDs+lJvEoJcPWxNUl1W+dmsTuhczcl0dJeLZcEG+KFcGDJhvAFYIrKEX/2w3T7v35nzIp89GbbN3bwda7wAtzjAEie+GZ+oTPVeV1ND4+0RZpEnV4/Eu88FDWTexGOOEFW7kCs13ZjQtg+cZinQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=YSRuZEo0; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2613::620; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=ioana.ciornei@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=YSRuZEo0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2613::620; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=ioana.ciornei@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on20620.outbound.protection.outlook.com [IPv6:2a01:111:f403:2613::620])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZHkLY1zylz2ywR
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Mar 2025 20:44:05 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cJIsRDiYOsENVbg8C/RgZicsnBTmSuVB5jpO21a3mXo2fI9crwt6E6sxLZ1AFuabPVGOyaTebPA4ZFCp647nMzI9Ver83m/lWSLAPAs6QTmggPg84MGED4O6V0QTx4ht4++97sHvfzOFBUcJ4fH5INzbkAov8yQJV9Ny/j6KSZrzpHHDbt431Uyu752yz58No2S7XuKxVOrRwSpuY3grfmf9tEfIo5e1/CM/DNTr1m0JxE5eOS8/nDoHelO3mQHwgnTh2yyJ13Pvz/SHdW5y3lvXjIB/iTDdkhPf+Q+LGcrQtnq7MVmp3YdI6PSoMJRIyBqKnKPEzUSIkPb0h/FQ6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lKBTT/4PeoEg+yRHRVPZyrWu/xb4H3Dzjjaj/EEOi3s=;
 b=nwPgUEn19MxxRO9OqpNKoEl8qMGout9ly9YSsWArGZ3NBGkQl/jZwM9s538dX8sq1sZhjSPOQ5KBYv8F2jiut13Tlc5tIUjeYUxbL1qztyl/pGC0F6fitGYbJQGx5PjhWahA58hmIcTeDsRTMGXIeqsJBfeGnGNrL6i5PkXMKgOjapfCxw24y/BIkhU6f91brpmi/BR+8KscwqttOjD/0BEGF4/fPSaLUu1bXcvYqwPVdfirDvgBQ3+aAE5tP3jATy7pdtOLXqAHpC0ojedOrRzeCXpX/rXsp4Fk304qBK8gRX0Yz5df8uWKpKLRSY3xD370U02UNjZpULLLsLW1qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lKBTT/4PeoEg+yRHRVPZyrWu/xb4H3Dzjjaj/EEOi3s=;
 b=YSRuZEo09LHAsRkLsT2MiRJSUew7cJ7CYrp0NfQJYwrZpy1MCGLXJXYUpdS/uTE1qaHZXMb7TE3ySaG7TjSQqIatFcaIyxQ5ADb17dYoE4u6bUuQh+LlXYH0td0T6iZuyyCyCN+dDtmebKm/jroC69RFcdvp8fhWsWlA7+sgvEhjY3s1pnqLBwdd8EDAEgm704s2SnisC1sGoZFSYIWKAtJQKMgkYyn61keWZ3bsAExg88K3kduRXeXUIC9SnWGooCFSanKPpHF6tgnP+RKvnHyenmCJnRu5+dLzRj25svhI2IQ/PWqLbqg4BDdAVZR8P3wsquPqMtQX3uXSX92bZA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by AS1PR04MB9261.eurprd04.prod.outlook.com (2603:10a6:20b:4c7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Wed, 19 Mar
 2025 09:43:30 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e%5]) with mapi id 15.20.8534.034; Wed, 19 Mar 2025
 09:43:30 +0000
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
	Stuart Yoder <stuyoder@gmail.com>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 2/3] MAINTAINERS: fix nonexistent dtbinding file name
Date: Wed, 19 Mar 2025 11:43:10 +0200
Message-Id: <20250319094311.2966519-3-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250319094311.2966519-1-ioana.ciornei@nxp.com>
References: <20250319094311.2966519-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1P189CA0011.EURP189.PROD.OUTLOOK.COM (2603:10a6:7:53::24)
 To AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
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
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|AS1PR04MB9261:EE_
X-MS-Office365-Filtering-Correlation-Id: 24e54413-55a1-44b9-0dca-08dd66ca8180
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9A6IQnhnsUn+FGBp1O3Cvto0j/F3HfI78N2InEWNa6OjxjU8zISDPEf92S8t?=
 =?us-ascii?Q?X5w15BMS5FEHF/OvtfhWcIlhdvZESB29YRFgvmMuDGojpYUI4bG4zZ1U3hYE?=
 =?us-ascii?Q?5kt+7L3BQ4sMq7LTOmqin+Rfr3YDN/MeyBoAG03lePOiR7vbgDYS8cQpSuR7?=
 =?us-ascii?Q?OxoklTJjTv6k5z9cSXlpdub2Bwd9GldCCyjlPpfm13FQlP1eX36Brp8vC1Qc?=
 =?us-ascii?Q?k4P14S8rDVRPnZGPC9eSByvVvaENzplJaQnt0MqjSYzVTqHdlRUwHT2U83AL?=
 =?us-ascii?Q?MJOkUN2SlDMXFo2WD05iJv8xZA4+MWqlqzFgdsgNTNJ4bRTjS4mdiVZZixBP?=
 =?us-ascii?Q?bMB/GpYpLi6rMJL1JvY6icQ/6pNcQCqXfs7i6YOCUAjngP4ISVgtyCdVO1ki?=
 =?us-ascii?Q?0TNC0l0F54WUnBuDBcNCKjqqmKneMkTxV2kroJZ1I/Fw3ttEMHbknUKbPqPd?=
 =?us-ascii?Q?c+IP/ySLcFtygTrS1+g2zTKH0MF1la2bZnGSugfgF/JaL68nJrJs+2g8uVJ7?=
 =?us-ascii?Q?GN+1D32ugfZs/KCVKMnQUPovN6NszvIhsKi9fU7zPYZ2LITcheFGbyoG5ye1?=
 =?us-ascii?Q?eXvh1grMt5ig/WcSsS/HADEb1DBXbUrD1s9o2U86/EE1RvAUDuF/3UlQ/v59?=
 =?us-ascii?Q?1BoBxpZvtKiC0b1ZlNTV8eBG/Jmm5rrIe7P662eR6bUQXf0pUVPvh2NTvej8?=
 =?us-ascii?Q?59oIwHIqM7UtIJeG6fPjj+51bOd6tsAs/kCtDBuXk+i+9U6VyYkY1AoZkBj9?=
 =?us-ascii?Q?cmzXK9nbOnLanuq3E178UVnSd4XWTEyTjUaJQuZCcscVAtd3uY1OiRvG0/l0?=
 =?us-ascii?Q?cijV6ya0+B/k6iuhpZvhfQF7lFLnB6DFfdLgruSMgkR8wVJSQkxYAbY0i+Hc?=
 =?us-ascii?Q?kkLtxJ6A2mx0DmeJTl/PMtULFVeKa+Npy2Jkq/b2Nve6KErnftI4MRsu1/fs?=
 =?us-ascii?Q?qQqpuHURL5x14DVQL2SsgcPIQ0aHgXS7uJJA/12zO/X+Sqi1FTuAGj1IJ6ni?=
 =?us-ascii?Q?975iiZ/rAERBGwxesXZROoa8lNRRMc6eJIp9Luvcqq5sSUkKjB5jNqsXHvOm?=
 =?us-ascii?Q?XV1v+PTw3PMpfEduDfdxbnD17TyM3A2JAbfLpry+JXPVIWguqLC7o3BQKbph?=
 =?us-ascii?Q?rB0MPim7vP+A/WM5UA18ZS+P0JYEGQh67Lw0cdwYpdHuFCHy7Q9KB9egjZOQ?=
 =?us-ascii?Q?AvDUhrILxofWnXUmTkVV6OHFZxoWX5fmopSjW033t6f9jEA0odNgE3iPBjWf?=
 =?us-ascii?Q?KQkZXgBFQsF+a09mTgXG4cZqMRDHOu3Rq9A2cc/SBu9J6F/7GGTnJhPS5Dfa?=
 =?us-ascii?Q?QFEyWAHvgNtQyneBaMWJBG/7kLVlRxOkqP38TfOITueAE4ru4h9NjXAAMrCb?=
 =?us-ascii?Q?3E+wIm/uz1RBYAhJlM2tF/vOiuxy?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?f4qLF1C3flq31RA8Kvl0i2OZBBECO8dnov8Xcaod39mspJp6E4I0wa8enCX8?=
 =?us-ascii?Q?aPLMu17fdEI0XJVRJCJ1dztDFZhXNl6fBbzHMyaJlXU0tsyn75oITN3U48yj?=
 =?us-ascii?Q?bK4m5UU7/ApX6Zkmt0wdo+hodDdBV4wBnwf5KCe/2AvZxwDIhc6QErjiE4Pc?=
 =?us-ascii?Q?qTxmcHqvFQbA8Q1uzh7S60DQnjz9GFAekcgkaTdJunTjWxC7qCgVBaTuVHIl?=
 =?us-ascii?Q?Nb0RQ1sqaSQtOs6jISIpstxpl3NaDDI3scutEZ2Bt4JwXYyxoOMZBkrk9UCb?=
 =?us-ascii?Q?FyaLzF3UH+AqMkUwww1FmcA/epzOAL7Xo4+BZHL1wMufi06BhENL5guILxGM?=
 =?us-ascii?Q?s5U8gv571iqxN26v+pD1C8mFh+Wjduxi9t6chBzLMBDDLqeNnLif4+Vw+Nlk?=
 =?us-ascii?Q?yxbMBTZHLNeKKncAeLY05DS7TbXm2dWs4iRMD5YY1B1bBj6FpSTP9Pd8T9FQ?=
 =?us-ascii?Q?ukHpACviK6z8PKtFdoTZroCF9yBEeEMw2jFyqd4Dno8dp/fcblQkjyVvuPsa?=
 =?us-ascii?Q?dAlO1pWcDSKarMQ3+hThxFKVzvu5Apum0ZxKMhrnpnl9EjavVOUu6N9w9f+L?=
 =?us-ascii?Q?NRZF+u2zKJNnPAGjUWHemOfF6dddL5vALCnodgeNLUPFux/b5cVRSZ6yxw52?=
 =?us-ascii?Q?eCsUAV7wwGcvI7cHkHLk67PnqL6irQyH6yCiSQP4e6WpQJtJxLYlUJE6uoT9?=
 =?us-ascii?Q?7sNuvoqE6igLOh5Xtql5m/dpPW+kBYcLgOwY8Wm3+RwCMMoTAHJAYf3caGis?=
 =?us-ascii?Q?zdfinTbNua1eyZ3neZLS5QMQ/xNoR3v261vyJhB1pZHKO2JQkuzQWpvZLD4r?=
 =?us-ascii?Q?VqEGUZ1f4XV8Wor+quiBttR3NS6Tjwe6/TlUxNHArVjsC3p0ppZfiiaXoAPz?=
 =?us-ascii?Q?HWLMolcQ3aDp0V2GcLx42D3Xq6Rfhg1YYSFN2pq6BLwV2X8r+4YfZRy4zNo2?=
 =?us-ascii?Q?Es+TwHCH2fl4iHNZDyKRaU6+QKsSJnD603wQnm1hFxHp4pvNHcCOcxMCwtR1?=
 =?us-ascii?Q?Nk3upzv/dMa7j168JQwEadeO1IyNvp6rmmidQUnma0ySL5wIpc1sYHATUZ90?=
 =?us-ascii?Q?XNbq2ogrEIu6LyGYwIDLo0mZSEQQIE6/FcDfyTwdWimu8pNcE4Tq9MS8oavw?=
 =?us-ascii?Q?Cv7vhChlD0SPlkY/HEsq9RhcF4SwD45yUMvj4iCKUM62f62tg3mxJcKt7Bep?=
 =?us-ascii?Q?UiOSqZn/78DUCQ0VjDSTN+RcjD1u40snBCwofRrtUhFT4PS0GHJA66nTBYOP?=
 =?us-ascii?Q?mAxY+WhLeyA8ElS32HGSF79XHRdinI/MRYP1yMd423m1RftC6x/eTh1l2mTx?=
 =?us-ascii?Q?F6Y8iqPbhOW9kUqECB/J+pPn9ScHf7/kbGJLwP7RjsaZ9Y18yhBK3LanHfnP?=
 =?us-ascii?Q?Kz3O0sGGDVKwUTWIbxDxptLDGGaZRF2Rgag/6YUvMYwsFhtQ6l/JT5V5c0vW?=
 =?us-ascii?Q?GRqh36RZt8hQ0Dl9q81pKqILHLjTz095/BWan2kAQj4BQfz+yaxS2EaPffDy?=
 =?us-ascii?Q?jNzbpKzbKppoSOd5A5DRCy2jjhE2teG+ADsXjknPnubLYpqy7UibGU9sLaxR?=
 =?us-ascii?Q?rcH1BMn1rJIvCt39FxCvNA13t4Dgy3ImBsXHlwKK?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24e54413-55a1-44b9-0dca-08dd66ca8180
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2025 09:43:29.9442
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2G7VJQzeSlibFou1cyWnLvGi+TUYPlLuIy1VdH7N4y9yEfXs+VFiUiT/V7xRjLfHuReyCvewfnIXMeIc+qk/fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9261
X-Spam-Status: No, score=0.7 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The blamed commit converted the fsl,qoriq-mc.txt into fsl,qoriq-mc.yaml
but forgot to also update the MAINTAINERS file to reference the new
filename.

Fix this by using the corrent filename - fsl,qoriq-mc.yaml.

Fixes: bfb921b2a9d5 ("dt-bindings: misc: fsl,qoriq-mc: convert to yaml format")
Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 76b6db4074ce..1e6aac2962dd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19637,7 +19637,7 @@ M:	Ioana Ciornei <ioana.ciornei@nxp.com>
 L:	linux-kernel@vger.kernel.org
 S:	Maintained
 F:	Documentation/ABI/stable/sysfs-bus-fsl-mc
-F:	Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
+F:	Documentation/devicetree/bindings/misc/fsl,qoriq-mc.yaml
 F:	Documentation/networking/device_drivers/ethernet/freescale/dpaa2/overview.rst
 F:	drivers/bus/fsl-mc/
 F:	include/uapi/linux/fsl_mc.h
-- 
2.34.1


