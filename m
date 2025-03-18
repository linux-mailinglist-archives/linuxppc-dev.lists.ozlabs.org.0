Return-Path: <linuxppc-dev+bounces-7174-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF49A6711B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Mar 2025 11:21:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZH7DW3xymz2yrV;
	Tue, 18 Mar 2025 21:21:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2606::60a" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742293307;
	cv=pass; b=T/KXQjPtPe/o8slNcV+pVMpXSBlSonEB2mtU2Azk5otV2f/aedmvaOjNKd6VXTkauurN/5OxKuAKP93TBy01/ehBHLfCsM9J1DsOZyOs5QaAUI5vvA0AmcRa7l8JVKAOwooiocTeaVqcfLh8lw8M6iC/7stisFHccP2MEiKjvMBNSi1RDQQsv/K9FzhyvfMzDThETyNFftMKyA9QBWdBVg675O9CH16fF73ce7SDm3jtYBxA73JuWiH05DQ5XH/j2+S1sfwyB7XCLEvilyJq/6yMfVs2mqb+vBfO08lTw8XkWrV97l+QPIASpf/yBjY68qo+V2G7gBsVOK3hXWBFUQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742293307; c=relaxed/relaxed;
	bh=GJm8lvk7WJuZKz778VPLCkTZ5KlIf5HLVR8SSwtxBgc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=IUWDqtU/sLmSWZu/ETohRKWRYo9NGpv3dDzvFgK29xXyR6sC2lWtuY/mdG2Pl1QXr9e3maHt3ry3/DlmytT3k2+/uVEYfFl46N3MYjycYMYxqW0Lz5MPZEbbOed9ec4DLir4MyxCi3w5acGmBNzwoyUQ5sumyzYzsT3kFD7hNpaDdo3fsdFUWAgrPSyMwp/hhoyYDHIjtGc8nvMMPI2AaZ8QS56s2SVhF/WiZvs8TTh6y89Ee+e4x7EGyvujNExtu944pq+BbqqtT/SG8LkuBiUa2NMwtp8o1eTAlJObc12VAEQbExNsHBhTZdWpkCGmJ3zNustSiCn0IqcYb8wuAg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=XhSEwsdQ; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2606::60a; helo=eur02-am0-obe.outbound.protection.outlook.com; envelope-from=vladimir.oltean@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=XhSEwsdQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2606::60a; helo=eur02-am0-obe.outbound.protection.outlook.com; envelope-from=vladimir.oltean@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2060a.outbound.protection.outlook.com [IPv6:2a01:111:f403:2606::60a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZH7DV0yXzz2yrR
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Mar 2025 21:21:45 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ttAAkm9JWep1uv7U0OFeF/92jD2M/d4TdWhDpIegh9b0To2jBokEPSdnhUaJiUFdUD49LehIFxTcgOUG6n+yo4sPxn2svxTaXx1YM7vKUhoAueRloH5dmua8DMWADtd44jKugZpmlItVGFjxILaAu+mpIRwusQxdq8HNHvmZPgbPC6b8i3uJVLLXbk0utaghwrsDeYbff5oUF6AK3C00rjtyKJyO5LezgFSFn9t/nlVr6eNoJQ5TasZROmGMPWI8yhg1yOsyP3wqB1Gb+LRMtGY1zGc50RStsA1y/0Wpv/gJKIJPNm3kyf+ttazyUpGhfuvvnWYiD+b31bt40tUNSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GJm8lvk7WJuZKz778VPLCkTZ5KlIf5HLVR8SSwtxBgc=;
 b=WYJQqFVt7k9/0KpJ4zXWkRnRG4gTjjXQLbtuZEOwfIW6NPSwZbuhx3cJH7s6hUzFrehDoSxFKHKKECZCEpWbnR29DxxY0xgyYCzSdcNbL47oAPg3eDR+j8eoATYj8ajf/z3/tlG46GSHEBVQ1l/vyK3Jzg24mhVrA2cch77tzaB/bO/2iZ67qoT3i/DokXjYcwrLExYmittO2Q2D07rJIbTdwI5EHULfrHQ/ZYfjw0AUGZIsC7hWYoykLUOP98zSodWUc5Em72UaKaPpEYpxFEu+KXdrjyV2ePfC6iF1M2w+Yjk2ZWBLBtJK4f1XLdw/z1Bgam9RmKMQ2VQhJxw1Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GJm8lvk7WJuZKz778VPLCkTZ5KlIf5HLVR8SSwtxBgc=;
 b=XhSEwsdQUpB+q2TBzdJ3kNzxRAVDTzEV28Sq0opE/PXv73AeOIAtdDmbdd4pue0U3kqxA9d8KWtZQCXaAiD77ZxcI3NprWEcoJmEDbPVf6gMMas1MZOb3M9Dt+XfcwsfrWAm4YaL2VXMjmViJicxkd9yDsevnCz+w66rN59NEem/UwtC0Yc1+Q5KK07/K1+iCgO2bwJVVb//EjBt1LL6vUz1OMpwZHUOWrnHQTVR8nIfSunjd649kkRNU5YiEXXoRXi2Rs6DtGTzyqqZmDGlX0AF6KKBEy4Hl2FI8SAeTPPKcLjxk4F+V/4RToPSwFX1o+GEmypY2FQSF0AGlQogpw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com (2603:10a6:20b:24b::14)
 by VI1PR04MB7037.eurprd04.prod.outlook.com (2603:10a6:800:125::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Tue, 18 Mar
 2025 10:21:25 +0000
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2]) by AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2%6]) with mapi id 15.20.8534.031; Tue, 18 Mar 2025
 10:21:25 +0000
Date: Tue, 18 Mar 2025 12:21:21 +0200
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: Wei Fang <wei.fang@nxp.com>
Cc: claudiu.manoil@nxp.com, xiaoning.wang@nxp.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, christophe.leroy@csgroup.eu,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 net-next 11/14] net: enetc: move generic VLAN hash
 filter functions to enetc_pf_common.c
Message-ID: <20250318102121.5vmv4x6qs32x2y5s@skbuf>
References: <20250311053830.1516523-1-wei.fang@nxp.com>
 <20250311053830.1516523-12-wei.fang@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250311053830.1516523-12-wei.fang@nxp.com>
X-ClientProxiedBy: VI1PR06CA0124.eurprd06.prod.outlook.com
 (2603:10a6:803:a0::17) To AM8PR04MB7779.eurprd04.prod.outlook.com
 (2603:10a6:20b:24b::14)
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
X-MS-TrafficTypeDiagnostic: AM8PR04MB7779:EE_|VI1PR04MB7037:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f0a5aef-ac87-4243-c1ab-08dd6606a2f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qxft1x2+IYbjxmR1/hJwIYaMLHnxqZivgFM8Gom2KwUmhucfpqoOsuSCSKWm?=
 =?us-ascii?Q?Jk42Uw1VXKNGuMF1MjxIw/jpZYaT7Z1JMP0fViu0IjsmMt8r+YPuqb+lhJwu?=
 =?us-ascii?Q?9JDTlDT6S4jIkxWvzlyMWrwRCJFLUw4gfE1ok1g1Db0Qptz0/9UHMv3ix3w5?=
 =?us-ascii?Q?eI/7QGTiy72gZRiKHH/i9JUDDfSt0w0Q+39Scss8uE62urxASQY2BYc4uj8I?=
 =?us-ascii?Q?hVaRejHJ9N1e9pMQgpiDXAtOpPZPdLK+Djvl779Hv44e4Ggbp9vAB83awPfQ?=
 =?us-ascii?Q?wfg3mCfnEMk5LNem40AO87dfNt9hRFab78v1YUA5NlvVolzx6RdZn5HM94Q9?=
 =?us-ascii?Q?RLQIpwppMMfvgd8DPIf8gZI6lenMu+zA1Ws4KkA2pNbumywSELQT8dIsOrs7?=
 =?us-ascii?Q?2Q8SugQl4cjS2QIShbnhzPCqKzcwEPzHIsFevtBYfjpBuaS841KdMwUnBs+L?=
 =?us-ascii?Q?GhT+LGm3cFYdRclflFpBtW7xEs+bhon9QyetAs4WjZea9fuaCeTGgK8sE0pv?=
 =?us-ascii?Q?9LrfDkc9W2GxLRouQxjulcQt28jNu3+QMmVRFYMoqt7i2+6R+Tne4kQindo2?=
 =?us-ascii?Q?amhUCbh4AGsxJ9PwiPqQLmGyN45VkDvaLRbMj8z7KeRUMHSEVluCATOhHn0X?=
 =?us-ascii?Q?gLdaWWCtRkdyPTBb7/5ADz59VUI9gusEC/CmiXWDR+kUSzOYcbLzUk4g0dM8?=
 =?us-ascii?Q?1gA2r9Z1+rdn01vU18gO0HWlkXsVxWv1ndxu7OSRLI4bDEoa7AAthJyk3BH/?=
 =?us-ascii?Q?Vo6JVI6P2m7GzFiTosRsI+QAQNMU/ydcYgmZXT8+N+rT/Is3H9lGDGWasq/0?=
 =?us-ascii?Q?4vETCye3A5a/pbkZAO9dKPjJCH+4xJ5gwmL0ikrfp2NiXnhNTNhVkzsKnrMB?=
 =?us-ascii?Q?OwIB+KVxpgoI79CpXxxsfeIyUYbRtVDiz/7r185L+aadwtM02BKBpPVip9ZQ?=
 =?us-ascii?Q?vAOrnMdFbBTrKywUPNdHL28aCMFZ+9M80QrxhnIff3SSuhncJ06vT9QhvKhW?=
 =?us-ascii?Q?VE380qHcKjBXggVFvSG6I5lWCR0i0ekA56dmjl9pS4og581vntdfzX7Pqand?=
 =?us-ascii?Q?ojdV5jodstKm41ad4iOoQn707kI4zFD6/CtPVS2JQQjBYl7WsHOV93DsWbeZ?=
 =?us-ascii?Q?UJQ4cQskd941JWIjqQF/mtSsmxtzT51M5jNAL8KLZ+r9GpIJRx+V2YNa631P?=
 =?us-ascii?Q?dq2HxWWGQfw2ZqU/OKJTgRcH1M/407irEPf9uqmTdmrwLAcST9qqcX9afkSz?=
 =?us-ascii?Q?saecp49KAXLyqRpwp7Ntf40hMsz0EBNFX3nDLeFLjAar1DFvLLknM1VOTs34?=
 =?us-ascii?Q?ZWoBfKOdmwLV3Qr1If6K3BzPQv8AwgfDOH3l3aiKz4GNZL/S5JxFWrKjC6jQ?=
 =?us-ascii?Q?0giDAmgpg0V7YHgK/Xd1xQA5h+sd?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7779.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hEYo+54PjY+45Bdpmp3HIZaliBLyHmWZ5eQBVe3Ug6bN8A14llYTN6fJSNwD?=
 =?us-ascii?Q?tozO9r3XaWB6PdS++f+mo0vIM3xkNAsUC80lPWMgs/8SPv5iD08A1z5vOf23?=
 =?us-ascii?Q?gnXCrd8zHNxpU95LjTQanU9FHxW8tdcggd/ButNd1zCb9irqiGFVxH+0sAvg?=
 =?us-ascii?Q?FHFV2rgD5zQyJsXsX4WUuj6prXZLHfq0VjpfbRpNi8FzSoqfp/dynWrFP4qv?=
 =?us-ascii?Q?oSqtt6wr1vf4DBpnHhNMIONFQ+M0xNqJw5WsHiFp3JYYfyCUVoIYBJe2XjPl?=
 =?us-ascii?Q?08juyXI8q6dfkqPCR2MhCS6rZTSMWkJ6dptjOUBGNmtct802MvoLwsS74F4j?=
 =?us-ascii?Q?uQ132fDPsrmLegwjut/SXa3/povkHyg91z+FcuhK6HLI4X/06M19ug3fTuBQ?=
 =?us-ascii?Q?h3totZCwjATSgcRiw9GRbh+tpAwdQbT10sCD0IblSsbrKJ2y+KyFPev3eLat?=
 =?us-ascii?Q?d4N55zkXCq2NGrH1rS/nDthvOP+pJT+A4CWiP6nR8XW50Jaw6JYytjA92sIK?=
 =?us-ascii?Q?DOVzT5dqjkPrnkmG8txkfffwcSbrzJQQgHVxXBVoy/f16C1U6hfxwaDvfbrA?=
 =?us-ascii?Q?pIxziQoSX9nz5PYtU4Fx0yBEAfk5iySlqG8mQ322g2+aqxDJJXvx6FWAGN+B?=
 =?us-ascii?Q?PUCY5sd3+FN8u62AJdjWSpRPXeAyWwy2CoJpn3DgiJ/jQwWzTiK6ROyfEj50?=
 =?us-ascii?Q?+VvrKkV4uCe/r8KAK5rhTHao8gxUcrWDM26VfOQSXnU1xLROY1A4xP+Wka9g?=
 =?us-ascii?Q?rpVTUjclzBRi7LIPY9z7eSl3yXY9I9FIY9V3lBe5frAo72C+OK/eH43wtL9a?=
 =?us-ascii?Q?IHRLp0Qm7RYpaW9Xo8+fl8fbj51FQ7uBjHcFKJZuPNboEuzrbQjWwRRXUq7B?=
 =?us-ascii?Q?ErFlnT6zecxY0LnNjYhV4sOxfB+hq/DIs+drLBII2DUQP3Op7CXz/AAHLdYi?=
 =?us-ascii?Q?iWFH307VRDWO12xEuIbVLoqzZdkOmTI6ZBmjTVYrwvLaPFvM7/9K9OhBSAkp?=
 =?us-ascii?Q?r5+H+Iml54vzoNHKjgQrphrl9tllOe/RR+0j0TIh+QvsBGuOIsyk99Z4IYm8?=
 =?us-ascii?Q?LIyrJH6mGwiomfkQ5mlcEhrEOWhAH9ea8njH20yh/I6mehpci1Y0OidYpMkW?=
 =?us-ascii?Q?MbxpLzmkoUAmKbJQmxYViCECUzK0l/SOJkKg3oSBnu2mUoQCj04M52xmNse/?=
 =?us-ascii?Q?82Q3SZEjFttGiq7DIDB9X/p/Mi3MVR6HBejDr+Ui0738vorjwbI69y1+ztBl?=
 =?us-ascii?Q?wTO4LuSjFC9N6ip3dExxLAxvQcGTJKXilbhOcMhDfH63SSV0v6+I5LWSBdMF?=
 =?us-ascii?Q?LbP8y7ZdB9Y2otZgrbajrJ/8vzMMY/kFCCUloZMTvL35rpK5FTfjqzVXuDKr?=
 =?us-ascii?Q?gPgqEcPvRXG/qBXfWOA/GPrfGjI/PyzWj7+/q4voNxC7M35AX/lAPGQXmkZa?=
 =?us-ascii?Q?WrIikeEOw1se2rbhFrs1iFCDrdMJpHGEaM7vxsM6zA4Dp6KB1GOFrifnv7hG?=
 =?us-ascii?Q?ZdY4ABNX6q/wcisMzPZ0L5ziFLXewwBmvqgzKqLZsFnkV2ib7Ech4iY1wh2r?=
 =?us-ascii?Q?36u/hkahVg5JVlQlwNrd5z2VJ0Gedw9ZM1x8lFKtfMzAR1NV2boAflSndrIo?=
 =?us-ascii?Q?qA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f0a5aef-ac87-4243-c1ab-08dd6606a2f8
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7779.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2025 10:21:25.0826
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HLblpVigx8tOeAKs4kVO5YpsH1dmUN+hse4RTjt/EaWxs24snmEPbDLVfksbHCKE5HOXJgXlhGP093+r0/c+Ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7037
X-Spam-Status: No, score=0.7 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Mar 11, 2025 at 01:38:27PM +0800, Wei Fang wrote:
> Since the VLAN hash filter of ENETC v1 and v4 is the basically same, the
> only difference is the offset of the VLAN hash filter registers. So, the
> .set_si_vlan_hash_filter() hook is added to struct enetc_pf_ops to set
> the registers of the corresponding platform.

For the RSS hash key register, you added a function which retrieves the
register base. For the VLAN hash filter, you add ops. Same problem,
different solutions?

