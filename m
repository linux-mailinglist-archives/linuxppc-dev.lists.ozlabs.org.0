Return-Path: <linuxppc-dev+bounces-7061-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ABDAA6117C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Mar 2025 13:37:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZDkRB5yR4z3cYY;
	Fri, 14 Mar 2025 23:37:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2614::610" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741955862;
	cv=pass; b=LP4AdhmUqtFNZiwE67puliEWU6awdJXOCEWjnduzyH2n7yA1nN+tXBqj3WUFBGklVnq3ijBy1z0YqWB8RpgpL+gl83Fg2BuG9fRJWvBtNXHHW4ALwF/Bppo3ttDr3L+AD4QrDIiBmduqddliNFcHVJc0IUtq8j+5ySShE7N+YPKUmKaTNEwkr/apfTQpKdLxBcfziln7ol1cIFE53yUbxZ+C+LSIXCaJRpJbQe97RxjYD2OPwhWV6003yCafoXmBNVvIz19Gc0oRpzvurYkRTMitUHzrcIEukqyNHALF4gyeJZO1CgSoTuEoaJFUpa2i+SOmwdNVSs55ACNpGkG19w==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741955862; c=relaxed/relaxed;
	bh=lOSoqEpE4bSpPQPM1JJfSNYcOB+2utP2qfIuoP2ODfk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=YmpwBfXq1GXu8BOCifgBux40Gq/OJk7MxaGwKAm93cePWHuRVbVmIFp/UA07/MaBpUxmZ459C5/ktDsKW8SOAxiVnev6qNsoNRxdMRhy8QoqNSntVGm8gQuDvduSYjxf7umTnd0fEbo8KQ/l7riuLmRKIYEPwjlHrCQm3nST/5KhhHKQk0aqhIZeUlR5DcU/1Ne1xn697gKgqWbQvZVRVrHwVGbdmy7ftrrhZH+z7iqNUcAibs4mWEDTc5Y1ZfeBqaXJK10N2MwOxEeY9rWjcKdQIxD6jJQ/Izmh0ee2Vp7RtXP3XCuALcy7ZenqPZP5mvFxyNP7CFzdEdYQXTkCsA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=Cpm85Rk9; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2614::610; helo=eur05-db8-obe.outbound.protection.outlook.com; envelope-from=vladimir.oltean@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=Cpm85Rk9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2614::610; helo=eur05-db8-obe.outbound.protection.outlook.com; envelope-from=vladimir.oltean@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on20610.outbound.protection.outlook.com [IPv6:2a01:111:f403:2614::610])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZDkR86z0Nz3cYN
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Mar 2025 23:37:40 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZjPI0itc6qAmOFGiBDJ+V5O1kY5YZ9qD/2ANaFIVRqypVTmPt0aDWf95bJCAJqinRVrd2mhmx2dPnVEJK/CcuiRq6flRdXOH8QlCLBKnEHzr7x2s5CI8gMTBTrZTtBxrNOQCJ7vDiAPPUjFdKWnTbB4i1fajSzA7Y/AZ5EUvuiI82juYoqyWmWRN1Zt+RJXCiuce1QWZDBtryYraBnON9vJ66VhRhy7qW6RSmZs31DQj66TumhKzkwgjY34qSW5Rf4136J55lSlS8WTBJ/ooy/WM+spoaycSiI9l/BRh69xIdjXNzENgZZM33HtwZ+7+Kb9y/+qjDeXOC+6/eq6xbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lOSoqEpE4bSpPQPM1JJfSNYcOB+2utP2qfIuoP2ODfk=;
 b=WkzI1Vs9CMkZuRHOBfXYjkwp2kLLw/zDDVN6GTFB603xOB3SuKxooo0I9KRQsPO3iWMCPtLMBnuMn4Al13jqNXJPM2dnsRIit+OYPr0bdwoDPPE5w264i6e0kvSTpQOZTVjrSqH3uibNv5x/76X42mx8xRO6rWuzh2MumBF+x9Sw1sBaTQ0kkYmVpLgitDX1nN/GTxP5mRRz2nOIdcO9gaBKSajeVUQlmlOOBHK+1gyQ9qLbUTpDVyRqm97o4GQ/hiCVKb9FY8pHIwBJwIcRQeSeyCY1c3h2T8vmFnsRgf3YNAR3Eti8aquq2I+nKjTvRMnegb1pBE9GwmuC+VULKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lOSoqEpE4bSpPQPM1JJfSNYcOB+2utP2qfIuoP2ODfk=;
 b=Cpm85Rk9hA1kAbejIjPqB+LdjfHy8KXKUbii2YAL5Ty73BpkPjtlxLIj8IUpP/od6yJW3u4rW6eszivEKBl4nsq7iJ5W+1pKZxE+K0IgSGhyoXP0xr2aiS80EOHPe2AbT+acUc8K3d87i8vVEunkY/nn1KyiBqhRyKP2fvHjCNsFQ6orZEpwSyWgyi+qMnOniHYQ1265VYe7PDvwY9kZZwR5XPVINuQEJEryXYgJbRpQee1Aik4jjLYlR/BWf3hhyYWbyYGY5IgAmK9rAvoEmMU+xGhhSF+dxGmv2ky9t+puk49vXhiCDlu3e/WpH/SKJHGSSB0j7vmcm6I1aMhEiQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com (2603:10a6:20b:24b::14)
 by GVXPR04MB10272.eurprd04.prod.outlook.com (2603:10a6:150:1bc::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.28; Fri, 14 Mar
 2025 12:37:20 +0000
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2]) by AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2%6]) with mapi id 15.20.8534.027; Fri, 14 Mar 2025
 12:37:19 +0000
Date: Fri, 14 Mar 2025 14:37:15 +0200
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: Wei Fang <wei.fang@nxp.com>
Cc: Claudiu Manoil <claudiu.manoil@nxp.com>,
	Clark Wang <xiaoning.wang@nxp.com>,
	"andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"edumazet@google.com" <edumazet@google.com>,
	"kuba@kernel.org" <kuba@kernel.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>,
	"christophe.leroy@csgroup.eu" <christophe.leroy@csgroup.eu>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v4 net-next 01/14] net: enetc: add initial netc-lib
 driver to support NTMP
Message-ID: <20250314123715.fivq2cbczd4khxkk@skbuf>
References: <20250311053830.1516523-1-wei.fang@nxp.com>
 <20250311053830.1516523-2-wei.fang@nxp.com>
 <20250313163526.pqwp2wsfvio7avs6@skbuf>
 <PAXPR04MB8510327277CFEAC750FE49F888D22@PAXPR04MB8510.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB8510327277CFEAC750FE49F888D22@PAXPR04MB8510.eurprd04.prod.outlook.com>
X-ClientProxiedBy: VI1PR09CA0154.eurprd09.prod.outlook.com
 (2603:10a6:803:12c::38) To AM8PR04MB7779.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: AM8PR04MB7779:EE_|GVXPR04MB10272:EE_
X-MS-Office365-Filtering-Correlation-Id: a2dd4292-c49d-4d6b-8b32-08dd62f4f5ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TKQ6P0uY6kqLszr2mM58XO931ztbAhtx6zV7XNTe9vRZ7+ZbvnfxgRKtE8Eh?=
 =?us-ascii?Q?l3Xt0sJGTBYFe+iRHYJXXfX7QS0Hx+hwmmC4GAYg7uduefQbHMDMT0sAFmYN?=
 =?us-ascii?Q?4jqi9XQwbudaSf27Ke72iG+HsfbL7DnN0p/5Z743KkiJYqqTwTapSChLiViX?=
 =?us-ascii?Q?dVZ0sWqHHj2bQiIP5Fe/ygDVlSNYEyZDzLugkiXv8xVbumIvBJnUMAJmXlP7?=
 =?us-ascii?Q?ui3OHuGAPGoA/sfv5ulKX5ho5+fRIFQIt0ynmDxC/Sdg+yNY1xSFc7kEsHz8?=
 =?us-ascii?Q?UYfm84C1xAQ9fseHP6jGBA1wZ6EAQqZ09OnsXpdZjeEs4AL1HWFc4UQlOrI3?=
 =?us-ascii?Q?BwS6reVmNw/f37AAJbPwAV/7v/xwFdTZUJD+ZSQO+ydeOBohX/zmqPyB4Xa1?=
 =?us-ascii?Q?lR+F1FogJ3NSwk8t3BRXR603+F5FzPjGMmyTENE8+yRS0N6steENXfWo3cxb?=
 =?us-ascii?Q?9Q+tHS6MFhEEeUsPlTB8yB7xcqVPKYS2srbd9V2vkfIEqzG4/ryYXtLSLmTP?=
 =?us-ascii?Q?KMkjp4xFqq0XD8EX042dQjZik6j6MlEXIvBMyhISplvT1GtvmegbqM86eMEB?=
 =?us-ascii?Q?SUnpVKQoCxw+2o9M2/fTIvm6cZuGKsGl2tNWlri/gCHGQYNqiLgRYJf89Fay?=
 =?us-ascii?Q?fO0UWbd26+R1RiRMKvCDFDQM9UP0HuUGIdaXVEEvL/aHmbzPKRedkED+xfLT?=
 =?us-ascii?Q?/arehRx4BWcUUDpY7okwWc4I1pph0/Pr4Z78W0BcS6NgQLzOFkM4Xfrx00fE?=
 =?us-ascii?Q?vhDEJa+oYLwXHf7moBQ3fBibhaxRkKJvcpvIiRncuMQ5LCl+beVpMfo4+rxd?=
 =?us-ascii?Q?PwgJenJMNVwWX+fpvHLiCrAAp406DoUsml7dXyRv8MKxxDx+Vd0ZECAuQUzZ?=
 =?us-ascii?Q?ZNMEmlLYWe6VKLNOJ/GftzLSsRo/CKonMkIvCHN6xpZVlVpJZ/QYhV0dBJKe?=
 =?us-ascii?Q?a0/LdSqmcAJx4idyXhhHtaJjnAXUyShPTKI1MM4twNxtGo4/Ixm3m2a3W6NZ?=
 =?us-ascii?Q?3yLzdrUq+EfhEsxqNaoRy58kZQgcsAJ0HU5Hf3sXC1HQ8TcU0+doynTSDsZy?=
 =?us-ascii?Q?ZpBGMnotGJ2YWHbDlx0tKIaKsoyclqFSzKAuylXie7CYeTQKTNnQoj26yB2E?=
 =?us-ascii?Q?PfMFRDdLmMSTdweWd9s7eTZwNZIyA71X8w4GgcqDrGXgK/HngTla+FeoZ2l5?=
 =?us-ascii?Q?YJp1kLYx1TnU/qGYftV9CAFYlV0oz5KFNnxaEFFUPVqMwllTVAGy7dhRhYGn?=
 =?us-ascii?Q?vvZXE8DuKAD7WVegHOjTyH26Gyrw2RbiIp4LCbswetiNPX9Yd7vYjIKW1KKN?=
 =?us-ascii?Q?kCrD7T0cIB3LsISIerXJLS/sIa/X/f7hftHOZMDLIqsd3II5gefJi7n90rbZ?=
 =?us-ascii?Q?GqQ2nEKCNfPURbcWs2UVTq5Xx5os?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7779.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4bWL9TOCc3XAyOzBt1Rocm3LGmqLBxDA2/2q9tIH473bm85EUebW62f6Mgsc?=
 =?us-ascii?Q?UCZQiwbMpnDLCxah3Mt+r0DIL7xJbRiVnY2mGBYDh+ZKayz2DmsxYmT5+Nos?=
 =?us-ascii?Q?nkjYcMGja66/FERFTvDAC7wYcDSxwIJwPba2/kBKS9xPErXai2jfJzfxxkEh?=
 =?us-ascii?Q?SZymzsqH2KTP46vyUhT/BFyREq4sDoqdj4WZi+rXBJigVzPh4TXPDPQKrM1g?=
 =?us-ascii?Q?QRIS2LX7iwHUIBgPesDkcDTVwXTuwsj1LPRsE4/yTOs2K/RrCagp+kYTmtz0?=
 =?us-ascii?Q?oZ5+bXTG7LjabVsTJ+oNTWqTxJHKGlgHBTokG9CWYdy6XiBP5Qhi9y99MakO?=
 =?us-ascii?Q?eM1wEeDvb1FSrR0SQvOAs8s0aex9D4jaRj3qVjLFsFnKNttibPISDIJiZcCB?=
 =?us-ascii?Q?nbcwE5gX/66bn2aPZtR4Kfv2tjSPXs0/ADF+jrF1tKK7OSYiikAWmHIuH5tA?=
 =?us-ascii?Q?dkhng5P7UQm/5ji3XHnnh/4TagBjIQtGZKaEgbv8WXj1FovFyBS0nbxpspP1?=
 =?us-ascii?Q?dsiAamreL2oVgPKOtgNqN6m8GiZuE5xJZGuAPlsBDyVEIhvloj3haSozW/mz?=
 =?us-ascii?Q?xs17mDmTswSCyzskZC+iMQ3eXFL4j87CDTPwGhmNotffaurbQh2ZybWv4JuR?=
 =?us-ascii?Q?zojRFjf6o3sAneaSoMe3MZaTv2OR6cqlUL4D83jSn0ECH7CnzLUOFD9djP76?=
 =?us-ascii?Q?ynHyaQPS4awal/B+uZMaxDPouH3DzyTw+rFNzafKkTH3x1qdTuDpXsf7KoSS?=
 =?us-ascii?Q?daLl1YRNfEMdiyoTH76xBJx6MPM8pek+Ztk90b4MSG/djkXTiA6fu0gey2W0?=
 =?us-ascii?Q?UnaXcfh+/FZGI9gTPLJLOtkkphF1zfwqrg397aWNrBfDEKMOleysc9sGc6Ov?=
 =?us-ascii?Q?UhLYbFYAlff2bolmhKQRUIf1qedCwVXmK+z0tP90gsh4Dg4v/pq1WtVp0U7n?=
 =?us-ascii?Q?jFymoQsJEc3m7pOpIZVMRc9laO4VvE0C2GTHJpuvi56sB2VerzaQRGGDSr25?=
 =?us-ascii?Q?/7NUM/MwIjO8LlGnMs+qxYa+x+IlhXpvSPX8rLTqQRgNtU4zRr9BaSSwP0tF?=
 =?us-ascii?Q?FDJleDC/FgpVUE2sRgRpwr1Vt5UfnoCZ/y4QIZxJdG1VMkL1gm+59ghBPuaI?=
 =?us-ascii?Q?uEpMHyFGQAp4I3ELKWh8gE4qHZl08dU5djx3JxojpVriCTfRwX8KKHtuwAZX?=
 =?us-ascii?Q?XIGwM0U+AcPXM+baNXNTw+hqIgCE+6xH22/5KN+wp6WuattF1mCX52nxhxrH?=
 =?us-ascii?Q?rwg66AQXHKNCIZgM+UInwUoXi9yhgOfJXIimBXOyil8JTUKBfvcT+aYzdPKB?=
 =?us-ascii?Q?/8WD2GfRj1AgRZhUqNSdjmxuewOEQ2yVGEze8aU7RAwCwoJC32yWhhx15kmg?=
 =?us-ascii?Q?C885lQI29ub6CxU4FiFvZR6nBZBisN6aXTNASUcgCBnJc9bUZPtH1jSBbZen?=
 =?us-ascii?Q?5ctWT7c9G5qF+s9jpL8tckKPqKydhMSQTgOhn9kInAYhboT4ZUKrKFVR1xGX?=
 =?us-ascii?Q?kwCBnVBpUPXrUdzPrwFiR6vHSbdgQK6IpxYJL2KTJuhpD1b4EEYKta35ftiX?=
 =?us-ascii?Q?OblEF0Ai+oM7zwNpZ0NfUzEO8keWsF/A9wCbkB7xHxnAlrZJFKjYe56XU6rp?=
 =?us-ascii?Q?1g=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2dd4292-c49d-4d6b-8b32-08dd62f4f5ff
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7779.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2025 12:37:19.7696
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IJ+7A5Q6dBWP0xWuqb+XgTd9Ih9E64ELOECMoMXHrot570nsLzZIp8LHo1yO5b29EKqSBLJNgosiR5pY9zRuBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10272
X-Spam-Status: No, score=0.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, Mar 14, 2025 at 05:38:18AM +0200, Wei Fang wrote:
> > > +	__le16 update_act;
> > > +	u8 dbg_opt;
> > > +	u8 tblv_qact;
> > > +#define NTMP_QUERY_ACT		GENMASK(3, 0)
> > > +#define NTMP_TBL_VER		GENMASK(7, 0)
> > > +#define NTMP_TBLV_QACT(v, a)	(FIELD_PREP(NTMP_TBL_VER, (v)) | \
> > > +				 ((a) & NTMP_QUERY_ACT))
> > 
> > Can you please move #define macros out of structure definitions?
> 
> No, I think these macros in the structure can better reflect the specific
> meaning of these members. We can intuitively see what the bits of
> these members represent, rather than finding the definition of these
> bits in RM or elsewhere.

I mean, I was just suggesting to group the macros with the macros, and
the struct fields with the struct fields. Mixing them together looks a
bit messy to me. Even worse in the definition of "union netc_cbd" which
IMO needs to be reconsidered a bit (a hint given below).

But you mention "intuitive" definitions without having to go to the RM.
If I look just at the definitions, I see that NTMP_QUERY_ACT and NTMP_TBL_VER
overlap, and that NTMP_TBLV_QACT() just ORs them together. How does that work?
Shouldn't NTMP_TBL_VER() have been GENMASK(7, 4)? If I do open the RM
and go to the "Generic NTMP Request Data Buffer Format" section, that
table does seem to agree with me.

The "normal" way to give more meaning to struct fields is to define them
as enum values. That doesn't work with "packed" field definitions as you
have here, which I agree is a challenge. But it is one of the reasons
why I tried to develop an API together with Jacob Keller which tries to
address this, by allowing you to define the structures in an "unpacked"
format, and have a separate data structure which informs the CPU how
that structure maps over the buffer layout.

Below is an example to illustrate this for the case of NTMP request buffers.
Note that the example is incomplete and doesn't even compile, because I
haven't even converted all ntmp_fill_crd_eid() callers - I don't want to
waste too much time doing that in case you disagree, but it's still
enough to show what I'm talking about. Disclaimer: I didn't even _try_
to compile it - it may contain bugs.

-- >8 --
diff --git a/drivers/net/ethernet/freescale/enetc/Kconfig b/drivers/net/ethernet/freescale/enetc/Kconfig
index c8efbb6f2055..35d5cf21f6f4 100644
--- a/drivers/net/ethernet/freescale/enetc/Kconfig
+++ b/drivers/net/ethernet/freescale/enetc/Kconfig
@@ -17,6 +17,7 @@ config NXP_ENETC_PF_COMMON
 
 config NXP_NETC_LIB
 	tristate
+	select PACKING
 	help
 	  This module provides common functionalities for both ENETC and NETC
 	  Switch, such as NETC Table Management Protocol (NTMP) 2.0, common tc
diff --git a/drivers/net/ethernet/freescale/enetc/ntmp.c b/drivers/net/ethernet/freescale/enetc/ntmp.c
index df10f2f310c1..f96cfca92a1c 100644
--- a/drivers/net/ethernet/freescale/enetc/ntmp.c
+++ b/drivers/net/ethernet/freescale/enetc/ntmp.c
@@ -180,7 +180,7 @@ static int netc_xmit_ntmp_cmd(struct netc_cbdrs *cbdrs, union netc_cbd *cbd)
 	return err;
 }
 
-static int ntmp_alloc_data_mem(struct ntmp_dma_buf *data, void **buf_align)
+static int ntmp_alloc_data_mem(struct ntmp_dma_buf *data, ntmp_common_req_msg_data_buf *buf_align)
 {
 	void *buf;
 
@@ -221,18 +221,24 @@ static void ntmp_fill_request_headr(union netc_cbd *cbd, dma_addr_t dma,
 	cbd->req_hdr.npf = cpu_to_le32(NTMP_NPF);
 }
 
-static void ntmp_fill_crd(struct common_req_data *crd,
-			  u8 tblv, u8 qa, u16 ua)
+static const struct packed_field_u8 ntmp_common_req_fields[] = {
+	PACKED_FIELD(31, 28, struct ntmp_common_req_data, table_version),
+	PACKED_FIELD(27, 24, struct ntmp_common_req_data, query_actions),
+	PACKED_FIELD(15, 0, struct ntmp_common_req_data, update_actions),
+};
+
+static void ntmp_fill_crd(ntmp_common_req_msg_data_buf *buf,
+			  const struct common_req_data *crd)
 {
-	crd->update_act = cpu_to_le16(ua);
-	crd->tblv_qact = NTMP_TBLV_QACT(tblv, qa);
+	pack_fields(buf, sizeof(*buf), crd, ntmp_common_req_fields,
+		    QUIRK_LITTLE_ENDIAN);
 }
 
-static void ntmp_fill_crd_eid(struct ntmp_req_by_eid *rbe, u8 tblv,
-			      u8 qa, u16 ua, u32 entry_id)
+static void ntmp_fill_crd_eid(struct ntmp_common_req_msg_data_buf *buf,
+			      const struct ntmp_req_by_eid *rbe)
 {
-	ntmp_fill_crd(&rbe->crd, tblv, qa, ua);
-	rbe->entry_id = cpu_to_le32(entry_id);
+	ntmp_fill_crd(buf, &rbe->crd);
+	pack(buf + 1, rbe->entry_id, 31, 0);
 }
 
 static int ntmp_delete_entry_by_id(struct netc_cbdrs *cbdrs, int tbl_id,
@@ -240,7 +246,13 @@ static int ntmp_delete_entry_by_id(struct netc_cbdrs *cbdrs, int tbl_id,
 				   u32 resp_len)
 {
 	struct ntmp_dma_buf data = {.dev = cbdrs->dma_dev};
-	struct ntmp_req_by_eid *req;
+	struct ntmp_req_by_eid req = {
+		.crd = {
+			.table_version = tbl_ver,
+		},
+		.entry_id = entry_id,
+	};
+	ntmp_common_req_msg_data_buf buf;
 	union netc_cbd cbd;
 	u32 len;
 	int err;
@@ -255,7 +267,7 @@ static int ntmp_delete_entry_by_id(struct netc_cbdrs *cbdrs, int tbl_id,
 		req_len = sizeof(*req);
 
 	data.size = req_len >= resp_len ? req_len : resp_len;
-	err = ntmp_alloc_data_mem(&data, (void **)&req);
+	err = ntmp_alloc_data_mem(&data, &buf);
 	if (err)
 		return err;
 
diff --git a/drivers/net/ethernet/freescale/enetc/ntmp_private.h b/drivers/net/ethernet/freescale/enetc/ntmp_private.h
index 45e4d083ab0a..e68b2a060176 100644
--- a/drivers/net/ethernet/freescale/enetc/ntmp_private.h
+++ b/drivers/net/ethernet/freescale/enetc/ntmp_private.h
@@ -16,14 +16,14 @@ struct ntmp_dma_buf {
 	dma_addr_t dma;
 };
 
-struct common_req_data {
-	__le16 update_act;
-	u8 dbg_opt;
-	u8 tblv_qact;
-#define NTMP_QUERY_ACT		GENMASK(3, 0)
-#define NTMP_TBL_VER		GENMASK(7, 0)
-#define NTMP_TBLV_QACT(v, a)	(FIELD_PREP(NTMP_TBL_VER, (v)) | \
-				 ((a) & NTMP_QUERY_ACT))
+#define NTMP_COMMON_REQ_MSG_DATA_BUFSZ	4
+
+typedef struct __packed { u8 buf[NTMP_COMMON_REQ_MSG_DATA_BUFSZ]; } ntmp_common_req_msg_data_buf;
+
+struct ntmp_common_req_data {
+	u16 update_actions;
+	u8 query_actions;
+	u8 table_version;
 };
 
 struct common_resp_query {
@@ -36,8 +36,8 @@ struct common_resp_nq {
 
 /* Generic structure for request data by entry ID  */
 struct ntmp_req_by_eid {
-	struct common_req_data crd;
-	__le32 entry_id;
+	struct ntmp_common_req_data crd;
+	u32 entry_id;
 };
 
 /* MAC Address Filter Table Request Data Buffer Format of Add action */
-- >8 --

Some remarks:
 - The fact that struct ntmp_common_req_data is an unpacked structure
   now means that the layout of fields is completely decoupled from the
   layout of the data buffer. You can make each field an enum type if
   you want, which I didn't do here.
 - You don't have to access its fields with le32_to_cpu() and friends,
   it's implicitly in CPU endianness.
 - The API is tolerant of the case where the CPU is in a different
   endianness from ENETC.
 - The API protects you against overlapping PACKED_FIELD() definitions,
   and gives a compile-time error if it detects an overlap.
 - The API allows you to define buffers of any size you want, and the
   bit field ranges vary according to the buffer size you chose. Notice
   how you are grouping two fields within the "u8 tblv_qact" field, and
   their offsets are 7-4 and 3-0, respectively, within that u8, but in
   the PACKED_FIELD() definition you can make them 31-28 and 27-24, just
   like in the RM.
 - struct ntmp_req_by_eid and struct ntmp_common_req_data don't have to
   be distinct structures. You can call pack_fields() and pack only a
   subset of the fields of an unpacked structure. Then pack the rest
   with explicit pack() calls, or not pack them at all.

I just want to present this alternative because I believe it offers some
distinct advantages which may be useful here. But note that just
"QUIRK_LITTLE_ENDIAN" may be wrong for NTMP. You need to see whether you
also need QUIRK_LSW32_IS_FIRST or not. For buffers up to 32 bits,
QUIRK_LSW32_IS_FIRST makes no difference, only for buffers larger than that.

> > The question pertains to everything else that is exported to
> > include/linux/fsl/ntmp.h - what the API consumer sees. Is there a real
> > reason to export it? For many structures and macros, the answer seems no.
> > 
> > Even for cases like struct maft_keye_data which are only used by debugfs,
> > it still seems preferable to keep data encapsulation and offer a helper
> > function to retrieve a pointer to the MAC address from the MAFT entry.
> > Then, "struct maft_keye_data;" can simply be declared, without exposing
> > its full definition.
> 
> ntmp_private.h is only used for ntmp driver, I don't want it to be included
> by any enetc files. ntmp.h is used for both enetc and switch drivers, so we
> need to add full definitions of the table data.

And I agree with you, I also don't want ntmp_private.h to be exposed to
the NTMP API consumers, and I wasn't suggesting that. I just want the
NTMP API to spare consumer drivers of the gory details, like for example
the buffer layout of a MAC filtering entry, reserved fields, things like
that. What I was saying is to keep the buffer layout private to
ntmp_private.h, and expose a more abstract data structure to API
consumers.

> > > +struct ntmp_priv {
> > 
> > Would it be better to name this "struct ntmp_client"? I don't really
> > understand the way in which it is "private".
> 
> It refers to some private data of NTMP of different devices (enetc or
> switches). Since the current patch is only a small part of NTMP, many
> members have not been added to the structure. The following is the
> definition in our downstream.
> 
> struct ntmp_priv {
> 	enum netc_dev_type dev_type;
> 	struct netc_cbdrs cbdrs;
> 	u32 errata;
> 
> 	struct ntmp_caps caps;
> 	/* bitmap of table entry ID */
> 	unsigned long *ist_eid_bitmap;
> 	unsigned long *rpt_eid_bitmap;
> 	unsigned long *sgit_eid_bitmap;
> 	unsigned long *isct_eid_bitmap;
> 	unsigned long *sgclt_word_bitmap;
> 	unsigned long *ett_eid_bitmap;
> 	unsigned long *ect_eid_bitmap;
> 	u32 ett_bitmap_size;
> 	u32 ect_bitmap_size;
> 
> 	struct hlist_head flower_list;
> 	struct mutex flower_lock; /* flower_list lock */
> 
> 	u64 (*adjust_base_time)(struct ntmp_priv *priv, u64 bt, u32 ct);
> 	u32 (*get_tgst_free_words)(struct ntmp_priv *priv);
> };

Thank you for posting the downstream layout of struct ntmp_priv which I
was already aware of. What I was saying is that the word "private" means
an aspect of the implementation which is hidden from other code layers.
There's nothing "private" here if the NTMP layer has access to the
definition of this structure. I was asking whether you agree that it's
more adequate to name this structure "ntmp_client", since it represents
the data associated with a consumer of the NTMP API - a NETC SI or (in
the future) the switch. Or some other name. But the word "private" seems
misused.

> > What's the idea with the null entry ID? Why special-case it?
> > 
> 
> Some functions are configured by multiple tables. If a table is
> not needed in the current configuration, we may set its entry
> id to NTMP_NULL_ENTRY_ID, indicating that the table is bypassed.
> For the current patch, this condition can be removed.

Ok, thank you.

> > > +	return &cbdrs->ring[smp_processor_id() % cbdrs->cbdr_num];
> > 
> > I think you need to be in a "preemption disabled" / "migration disable"
> > calling context for smp_processor_id() to be reliable. Otherwise, the
> > task can migrate to another CPU as soon as this function returns.
> > 
> 
> It does not matter, we just want to select a command BD ring when all
> command BD rings are busy. So smp_processor_id() is just a parameter,
> we can also use a random number.

Ok.

> > Can you place this dma_wmb() right next to the "*cur_cbd = *cbd" line,
> > to make it obvious that updating the producer index has nothing to do
> > with it? Or is there another reason for this ordering?
> > 
> 
> No special reason for this ordering, I will move it after "*cur_cbd = *cbd".

Thanks, I appreciate it.

