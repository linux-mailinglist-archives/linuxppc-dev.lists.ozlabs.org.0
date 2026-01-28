Return-Path: <linuxppc-dev+bounces-16347-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qJYjEZ+4eWl8ygEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16347-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jan 2026 08:19:59 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 821249DB1B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jan 2026 08:19:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f1DDj5zFrz30BR;
	Wed, 28 Jan 2026 18:19:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c200::3" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769584789;
	cv=pass; b=YjTSi/Xk9mUQXQFvo3O2J370zd8Ee6HleHRcewXVtF1BZDKWXBfeMOhxWEygqHmyngcwMEpn8PAQVE/ALQ8r1wEyoecdLz1irO97R35o437B6MwAZC2ApSYNkUARxsh5OmbwBvwawC/bbPEmAlToYc16wnwdjvN2MBAVxoGnN2A273qRXpQ+7o8Q1SipOssKBuoynp36KXawMptKaDM8SA4vdZiIycqdogsQ9edoGNtx9+cCH+BHsJsjgTmF5yGnimgtBaF0Bomv6/yXwsX+54frUdmqe2B3byRePshOlIYX/+JLTby8XUl6QVJcRMBc+1PiUER/wlac0O3vdeBmBQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769584789; c=relaxed/relaxed;
	bh=ScLasIxNu916sHMHMJqUaRXln4UOry745nyjVm//aC0=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=b0VN5XO7Gho7OWLlgChWQ43J2TV+LRFF2IY27Fxn3OIvdeeiAX+NB7qPaIjR8NlaRthBRDEytqg8bWRE3Qp4Xzwzts3Lh5oN2LYxRpUGnHOgMZ1YAUCj8UPLkWS6RBMaoip+gEJlOWB8hnUw04+/T27gnowQyQ9pd+VFqE9Fl1YkCYRcqhpb8VPK5OemhCFveE6C72YMOZ/qJ7+Li3C3dA6fjARPlLsE3vc0TiNAlrgOXMb5qDukixsQBNt5RPXZrYzX7H2YLgbIUQtCYV6N1HKJ6lhX1r3+gvsmOgvdaT7jOi3u++ueb6WrQ2SmLOD1sBB70B5Nys8uDkOvXbJRrQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=e+AbtIRE; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c200::3; helo=du2pr03cu002.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=e+AbtIRE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c200::3; helo=du2pr03cu002.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazlp170110003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c200::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f1DDh6tZNz2ydj
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Jan 2026 18:19:48 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vGZXDq4hol4zIwP09uxbq4O/QHLGNpJxcdpDIGxVW3UJdDAaTeotMPdKSZuJGPI7JU1eKQN07YR4kA0LU7laTm1CDdNqeE2ZOqxDIRRn1a9lTZA7oTHAnenPOYStxBjCZgwpDRx4b5tBlcA5chnwHf74aqFtCQv+Gq+HyhcUy+WlOcWHxJE1GO4HM0f3C/2avTTtSctfOHNGLWMuto/DrZ5njypwTjkEhFhxHz3SNdNFnGSDdY+E2sLIDXxq/TqDY0jKk03Bu/LKaAwUmq8af38NHeulIMblGecVyb9xO8ItXzXNQV36fNhsEtO3H06P5ZcNIqv9Mk+7ow9DLciLdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ScLasIxNu916sHMHMJqUaRXln4UOry745nyjVm//aC0=;
 b=FQ9Rsy8Hv9yTxTK95yQRW7vt6/QZ5hvpxisUqX8NYIlpNvf4s/P3tON2eAqI2ZfVPmow/xE8G5FHWw2+n411ibm7nL5Ev/yVyp6xBg554En1cEL82CleSqL3dtdrcYeZOKc3oS4M8EI/EY4pGvNpmCHiPv+dHN9E36XrKC00T2oCUdstoeX17NTpk9pGjGc+/ARO29bLltveoDZzrai/ciMXkDoe0HM3Kv6yZeew8iavCkoNF90hidRNWAvdDEm0i2HQiUUp4zR14YSzUhWHJoZPILatqafEcZyaPS4LJK2ukdeaE3EXmhUjFNjRutiV0smMtK2mH6463WGeZG7azQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ScLasIxNu916sHMHMJqUaRXln4UOry745nyjVm//aC0=;
 b=e+AbtIREWSMOb9EH92Ck494R7bX0h+QgutedMRChHTGsP/xMgYY99E+hnpa0RjU9xPUVukSoeDRjJvjsTXtK5OulMk8odu9UW44Vigh43fHt9XQiMO9lNkXGOYCSg9EVWewaM+AR1ISaTuEF0C20P+IbzCvp3yec+oGImFOkRlwHukKZGLDai7WrdTElwtV+e8ui7vFBlksM0VCEPwILRUMU1pTz5gWq4zktjzJafk5pL1jJV3LrON2g8KeEc1QTcJ3QNLFiiAeliNQpaDQnzygHzaJI2gyIszYGBSckaCrweHN+vWNb/slVQgn/uPYbETGiZzKk/dz+rumO2HJRKg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by PAXPR04MB8687.eurprd04.prod.outlook.com (2603:10a6:102:21e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Wed, 28 Jan
 2026 07:19:27 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b%7]) with mapi id 15.20.9542.010; Wed, 28 Jan 2026
 07:19:26 +0000
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
Subject: [PATCH 1/3] ASoC: dt-bindings: fsl,imx-asrc: Add support for i.MX952 platform
Date: Wed, 28 Jan 2026 15:18:51 +0800
Message-Id: <20260128071853.2602784-2-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260128071853.2602784-1-shengjiu.wang@nxp.com>
References: <20260128071853.2602784-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0026.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::16) To AM0PR04MB7044.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|PAXPR04MB8687:EE_
X-MS-Office365-Filtering-Correlation-Id: a5c5d938-d06e-4ac5-8887-08de5e3d91cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|7416014|19092799006|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NusZcDP8NHnXPTdGeY6iKgGfMPqSWiYlVLCx35wbJDBMiQCcVgzI2Ecb0yEv?=
 =?us-ascii?Q?xpBXnb8t6PdImLP8biSPCqxx9fsewAbpIuo952ZofmiZrIcM5gt3OmVExAdo?=
 =?us-ascii?Q?D2E+k81YScMB3cEaB3B7j2T2R6f07qtT9zlRX1YCX9b6Lr8taOlFZ1kJ+q+f?=
 =?us-ascii?Q?FgQG/E/O8qQV989sJV2Yym6T8WfWLUT3ELDfwsybJdc5X7tbwhM8Gllo+42V?=
 =?us-ascii?Q?cxxwhe6mYFjpzDP78a+npLH+z2ANAwWUl37sUPRLm8Gt0rWrGg8Dvkmf0d15?=
 =?us-ascii?Q?NqArqLp6zm6nuQpc/8Ta36IDyoqrrtIfgcmRrTbibAnNgbZIW4kA1iBuBVux?=
 =?us-ascii?Q?mXcsevefxRUmfUosYrwWG9fbn034VY4LnEsubcI7nP4uVvhnU/OPHut8ZkFX?=
 =?us-ascii?Q?pfpuTSG/PtL+JyGQisjyR0cgxRlAM26KsdqgFKNkZBSRCvamsIzYxdwbegaO?=
 =?us-ascii?Q?ejNOltj6lE3Eoi7UNpTfObv2xRt8teQ8mIewMQ24XAz2mcpt56EghkIdk6NO?=
 =?us-ascii?Q?sVXLRE8TjSuWNhR7hV2gH/HwJwgnoZt2AEkuD8Q2ITi/7q0QhR7Edno2o+Fm?=
 =?us-ascii?Q?Gd8+VjBPG+tQ9Fud3pmGcgO07E0v6+o32p2CWZ0TbjMziTI6rYJvSgHKQiZ5?=
 =?us-ascii?Q?hW/iY65aeNzWna8mYwX+kxSyfxVljsT1J9t6j1eS1cmxlkf1LALONtsRmDy7?=
 =?us-ascii?Q?8HLr8Y6OhW+MFIhKKPdKOjl7bnMJVTaBom+6DJd7lVwgS82adXe4JAq+/a93?=
 =?us-ascii?Q?TtYCYniK7hCYJgAwA7x2XBGdr+tYgpnacBWWliFmXO3tbqzRUdbFBT0frzHU?=
 =?us-ascii?Q?qGpVWzCoMHS9N+Z1gxFIkqhs34JQcxI5WNHXzYdlm/hJkfP0XhoPTqMIs5LC?=
 =?us-ascii?Q?AydYe+UdBzVbNUdfzB8stNgxcpeAnuX7uw5JI1Hn1hMwpduzi9WaoRfHq9bA?=
 =?us-ascii?Q?lj8gLpOPPyttrqfQdDbzaxNlAjAOdjD5Enqqh6KF/dU3k4We/w0IadM9pbEa?=
 =?us-ascii?Q?LJrDUoZelbD0BWa+yoziiogcKieaLMNoS63jxtj+T2lMV1HBcoJzBGYaABF/?=
 =?us-ascii?Q?PXA22xvLFoi/A+jbRcifvT0FMmvaa2WC51nOBIs/g07miGnpZOUyEicqBU68?=
 =?us-ascii?Q?CxU7MDdZXSh+mukGVidoJHrzKIGfrnGk86QUoVzyhdN8Y0chRA4Q3RA9+aEa?=
 =?us-ascii?Q?xxCW5LMPzsjyeNLL626iWoQblaP5m3UdlEgbmxHNe3J/BLQ20hOiVh0kF9kR?=
 =?us-ascii?Q?0rJSjpGjoSQdc+YPxvWeDJ1pTVAL3ik1yulphZmFYsO8FQujALeV4EDVHVwm?=
 =?us-ascii?Q?pkBayJsdKTM0XZmKP2KLnphM/co/wqXFD4MlhdWl4rxjNNkDXCD80oVyG8ZK?=
 =?us-ascii?Q?Ld8kpqOPo8joEqyuaIHe1J8dNoIb74gP+/IkBsDWIRiMwx/H6BcMknO9TlZH?=
 =?us-ascii?Q?ybON5CUKJ/Q6JRWo/vddaw+P1XBs16vEzA5POy+BGkb+Ay1d6oq4WQrR2uXh?=
 =?us-ascii?Q?AApCCVzXl4NoqxXtnPYQ5JQwF2ktLGUAd+9pkVXpSdfViRCiG6Kf3OZ5tFrl?=
 =?us-ascii?Q?ndgGOdKZ+5kk0rIiiQumft/dZTKeWc8bz21U2Vl1Fyw7bTdDU3PAVBFIvp8I?=
 =?us-ascii?Q?c4US4PwGy3wIEc405dV3QBzMVKunssDg6Ig0/Y4NgMSx?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(7416014)(19092799006)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5kV+oIEG3rn3aC9cT21pI0Tn9LHRLviuIakzjPMKhC3Y6qDBz1Puc1C1ZBZU?=
 =?us-ascii?Q?frznxVJi2TrARNM50uSeqBDO69bQH/A5gDwBuE9/n4K8lVfKiW6u16BJJH1h?=
 =?us-ascii?Q?6uBLe2Z+dXYhT66DXFEwU0kKr8LojdeZTbQ93i4n1mRGqHN7e2UobfnLVFnQ?=
 =?us-ascii?Q?2Xi1AuWVMl6X+okuKxJowiJApPzFAdmRkIPWWqrYZnU02c54B5+TWcxHorOi?=
 =?us-ascii?Q?VH8Nofd9332t+nzaHS52HQGLUpY1A3csgCDRCLtKUY0LMkjGSUttkfwoHZ6Q?=
 =?us-ascii?Q?UO7bor2p67uq6AwibbKhG2pkSheghz3NCYvprWf19vfqTv0S60/BozCsttdW?=
 =?us-ascii?Q?lXaPrZvSkRxLqcafgZki+lY4Hg3+E42Wj8f93aMxwtR7XoxRsUau1eMFCWds?=
 =?us-ascii?Q?s0teWhiPvMuzrBKV7LYM8qsJuScgSgupg803cAMjeC2g5me6HMgq+sJFmTIJ?=
 =?us-ascii?Q?QkzokCYMqeFL0dLWFRf0E8XSf1n6rBHFg9pmgCZQ3RZlgRga3aAnDH8nvODj?=
 =?us-ascii?Q?aXnyUZN3I3xtshoKBi2HX/wVbucF1Xl8TnPGdhx7MMTZpU9funDrxIgUskbN?=
 =?us-ascii?Q?sXDbr0wtGX/SPrardTPfUu9cUYmIr0IeoZ2NWXdVPsE4MoHzg50YbGsIwbvw?=
 =?us-ascii?Q?Mh+88BZgrK7xMhX0dD10UfIRTbx/sOQkfhN53yvoVHiqCmZ8zzAFeGGKN8HP?=
 =?us-ascii?Q?Z3fTn+IjT9Q2RfnU1+RRkiNXecJ7xgl/1s6JeqDFVlPdtGs1H4mIu6Wcf4wQ?=
 =?us-ascii?Q?ewvfdwJUOhl2eOdztMam01/i/Lz1UueBD27VXAPRac/WPWiRro6SzX82iogD?=
 =?us-ascii?Q?Nmu4ovnGwfTHTLvNsG2uXytJCcXYHXYu2Rbf/K1ojNJrSEsgK6F4RCVqHaeA?=
 =?us-ascii?Q?GpHVsNmJW7Blqs9xHgY7Kl0P3DToTy9kf3qfM9UsxN36XFVTh4BgY3fYSX+9?=
 =?us-ascii?Q?FRWkE33yOIQ0DBkE2T+G9+2ACoxUclLFi5iVEkV0aiyAxDh5jIfR/zVs4TDu?=
 =?us-ascii?Q?nZER7q43dotpAIqj9x2wMDbMFnirVly/+SyYU22sJtKuzlh4/yP+u7zXRVnM?=
 =?us-ascii?Q?tQQ6F9s0DF4Q5BarZ8x2LYhESYXLZOADVz7rJGB9//+M/xQq78Y6ykY+gXI8?=
 =?us-ascii?Q?w/iSjpJWcLXbf7jnWzbkq7jltomj6Di07w6k4oAij0HxfMLxKUd9YZpCuHm2?=
 =?us-ascii?Q?sWKjvongJknADo3Bz6SJ3jaVzU+4CQhBrxcGCmDl7e7QhbkS0AaE2q0JRxMP?=
 =?us-ascii?Q?6PFtvmjZSKRPNWVtTLq/W5WKHIeuTwSy6quf5KoA3WD3Ec6XhXARWRS9hUtg?=
 =?us-ascii?Q?TTvGAPw/P15QBmMu+MTu1dJ1YqLR43kFmp0ocyosUO3N20kaP8hd4/w8nxPc?=
 =?us-ascii?Q?wL2vqK0vjScMgzp39qdHF4kgPBJ/qTcGhhfH5Hq5Ys8XT55Er9je4NsKXqE1?=
 =?us-ascii?Q?ZT64ggcXLyTLa4P0cgJfOqidXiOlDNj9p48PKCMRUayZasxQUldIaOj6UARH?=
 =?us-ascii?Q?9YG3GWmNqN0U9FC5JOyhhbswHTBSf/osElDy9i1ZMHQa5eV3tu9t+nm3DYeU?=
 =?us-ascii?Q?XMNWfnZGhacjZwnivObSysdJEDrxIveLFM5zRbYzKVFM7FtDTVvmI2+a3XUn?=
 =?us-ascii?Q?99UHINKjuEVe4ZUV9KpspQuDhtb2FpjSYDHFMYesw41ukGZcj7vAcBeJbp5m?=
 =?us-ascii?Q?gwPWGejjVhW/66gC4LqbgB/ubVJTr7PyCxeX0rI7GziibjgeKPnlupbfsb1x?=
 =?us-ascii?Q?07CZYGhdRQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5c5d938-d06e-4ac5-8887-08de5e3d91cc
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 07:19:26.9019
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZCZkjxsvcV27epNF5+hg91LvwoM++lOqeqKu6fqoCSeV9lDsFHMTY+xYh4M1HC+8Ts5CkkiMFMhRhBJnYPh1FQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8687
X-Spam-Status: No, score=0.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
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
	TAGGED_FROM(0.00)[bounces-16347-lists,linuxppc-dev=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,pengutronix.de,vger.kernel.org,lists.linux.dev,lists.infradead.org,perex.cz,suse.com,lists.ozlabs.org];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER(0.00)[shengjiu.wang@nxp.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS(0.00)[m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:shengjiu.wang@gmail.com,m:Xiubo.Lee@gmail.com,m:nicoleotsuka@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:linuxppc-dev@lists.ozlabs.org,m:krzk@kernel.org,m:conor@kernel.org,m:shengjiuwang@gmail.com,m:XiuboLee@gmail.com,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengjiu.wang@nxp.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	TAGGED_RCPT(0.00)[linuxppc-dev,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,nxp.com:dkim,nxp.com:mid,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 821249DB1B
X-Rspamd-Action: no action

Add new compatible string 'fsl,imx952-asrc' for i.MX952 platform

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
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


