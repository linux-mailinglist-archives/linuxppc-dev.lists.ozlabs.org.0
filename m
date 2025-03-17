Return-Path: <linuxppc-dev+bounces-7156-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA5FA65985
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Mar 2025 18:05:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZGhF01g6Hz2yr2;
	Tue, 18 Mar 2025 04:05:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c20a::7" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742231140;
	cv=pass; b=nzaGfNOWk12N26AUGou/h/F9Sy10kiVGV9Z555QraDj9v1e5i9gPwPPOrheYRdNLMcnwz5+zhOTYGM7PUyLh1U5k0Ffnos7eI1wKuSp/qeBbkUVjv2LK+rvLEj4q33gFYq4aCppOyri5bg0YY9TuPQDcs3SWuKzTEh2KaD65cDN2hMTxZWZvbt6v0mogNicHRAtUQPPH3+CAcpFMN0tWwWlqzbC5EO7H7GWTGBuIDQBHRfrqCc2OUCyF8+qU8oy+9pDuN7+u3V91852ChwZpYSqwukyeMqzcsF/2SzEn5JdIN9T0e1yf2Zzjll9UWf+YfoTvZ+WotB1etUueR1UJLA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742231140; c=relaxed/relaxed;
	bh=7oiZHaycKfefRGUy8dFL2MGzVcybPR9nl4NBZbQbXzE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=IhxzxlkeGsPEtABWJ7Ta2RiIkILG+oinimXtn6Dj0BWu+5vD+9QXGvOZxw9nedO6Zd9OvCGSjqT5159SaKn9uhMfzH2tbAskXgr20pGf+fldq9V+F1MsLjPL3gPgQIQTE0h+nkfF+ITjxBoS/H5w73AaEc9RAPgmzhgDu35LIlIq02aRyKu6ICm5LkdruLGGv7LX4HNmu32SG+/954gZhW3fjwz6JOvaUYhblRfPDhDJTgnjthep+Uf63Tl1qmOqj7K48kyr9slDDBQMDunF827Pn3wLaQ3gO4cJixOQCNoFEublVpFDUZad/X9N+4jhooI0fgG4GYqzceeUJLaFIQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=dngOUl7r; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c20a::7; helo=pa4pr04cu001.outbound.protection.outlook.com; envelope-from=vladimir.oltean@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=dngOUl7r;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c20a::7; helo=pa4pr04cu001.outbound.protection.outlook.com; envelope-from=vladimir.oltean@nxp.com; receiver=lists.ozlabs.org)
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazlp170130007.outbound.protection.outlook.com [IPv6:2a01:111:f403:c20a::7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZGhDy1h7Zz2yr1
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Mar 2025 04:05:37 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KFCnGkcKQmpC1JpafBDMmmgnoY9W1eP1ul2jMTOS/hzrQ5TCqCgD069p+rj5Opwb10klGqko0PmWIAanyWZdbf8odui9AxYzXhxhxJyDwEEuLpcLsbBYixOLSRhuRArIvLLZpyFLy9gCtCmfaL4lf+L4HweuGoOmqy6Y9BnNoS3lXZlsJZwwSeyxV6F1Bz7NCJ0GH7irYkVcCI++hvAJuznFl1d7juVbtqlOBIZJJzxWQ24UaszwQ4Ie3vGJzHQ8kOpwq58AVj35Y+lqTI38qFzmcNxgieK9F1vmZRKdICGKpdRb1EMiqEddhaHdFLY882/MAtwPLeblNNYT01c7Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7oiZHaycKfefRGUy8dFL2MGzVcybPR9nl4NBZbQbXzE=;
 b=PVW4Q9IbpBqmW1fVkIIhbrdTwWvJ7bT+k6/UCcHlmfw0sG6APYHKfZUFTjA04MOPbW5wWJYbyn/CFY9mzMaO2qFXFsQ+RuxVg8rZn8HIkf8XrgFm//jO1w1RmVatQ7Z/TrIJMn18O1N4wP/tCgYeH0ZAOzqqnbxV9aX9uCKnETO5D+kCTtFPe1qAuhS9XaywAQ6L+6Q0S7+vpa+mf5RNH9JO9rx6KsM+z+3s2929XywKnzgAaP7JwIEhTS4o9OwGv96M7fEDfG659T/hgWY0ap81EDn9T4SWyyOYc4WLX1+aZJYtc28rNwiu76wqTq/DEJ25wnKEV18rUSsROfYVZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7oiZHaycKfefRGUy8dFL2MGzVcybPR9nl4NBZbQbXzE=;
 b=dngOUl7rSSFqufU0RsgQDK2AT4B16O1b7683sSWfdXpsVYgKjs+BG3uFDsRFP41/1HNAPswGk73XcK1xeJmUAxHeAUjTcrtH0xOVGMWkaq6HyZQxg7CQhFblKEg4ALbk8rAPRljCIhgJhx7VyGNPXJRRjNV5eDLy5p4HEHhQ2xuvOuuUJixDoK2xjNq+gceKr/lxZWlEQk1tlR1ZkqHJj2tAFRh9CwVhe37WhFfxW3TnHYajJ0emc5uCXn1LH5Q38WzrMxoEGl0sGh4G5UqOCvLPE3N+A5qS/eawk4k+xbGDNnH/xyUs4Iva9P5z0m5HuUEN2LcF9sFCEAMDT9aGJQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com (2603:10a6:20b:24b::14)
 by DU0PR04MB9299.eurprd04.prod.outlook.com (2603:10a6:10:356::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Mon, 17 Mar
 2025 17:05:14 +0000
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2]) by AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2%6]) with mapi id 15.20.8534.031; Mon, 17 Mar 2025
 17:05:14 +0000
Date: Mon, 17 Mar 2025 19:05:11 +0200
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: Wei Fang <wei.fang@nxp.com>
Cc: claudiu.manoil@nxp.com, xiaoning.wang@nxp.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, christophe.leroy@csgroup.eu,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 net-next 10/14] net: enetc: move generic VLAN filter
 interfaces to enetc-core
Message-ID: <20250317170511.u7kfzmqafznovpoy@skbuf>
References: <20250311053830.1516523-1-wei.fang@nxp.com>
 <20250311053830.1516523-1-wei.fang@nxp.com>
 <20250311053830.1516523-11-wei.fang@nxp.com>
 <20250311053830.1516523-11-wei.fang@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250311053830.1516523-11-wei.fang@nxp.com>
 <20250311053830.1516523-11-wei.fang@nxp.com>
X-ClientProxiedBy: VI1P194CA0060.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:803:3c::49) To AM8PR04MB7779.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: AM8PR04MB7779:EE_|DU0PR04MB9299:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e717907-bb8f-4686-ad59-08dd6575e262
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hXmSL2Muno26e5lsQRQESYcA+QKyibOvaPu5ezanWg+NzfFPtdB2CYkr/5Je?=
 =?us-ascii?Q?Z8PD6HOK/Cwf7WZZms5XwAA1H5Q0AO/fFPsamHdHrqhWErNJ5Sp4qMrlaG8i?=
 =?us-ascii?Q?O33l0IJIe+CONlIBYSo9kIBceGfHsNTHc3den4jtvWWOL/tHXFJ9hc84xj8A?=
 =?us-ascii?Q?857jwHPvh/oAaRrnLpk+yprl04IZ277hMlmh+pQyKRn61gCxwU69cbTKXJIr?=
 =?us-ascii?Q?lutj2WM+II4k+VsFztFObSLqxkih00oIuzcfq71ZRHoBBTmwABUNM2w7EjHt?=
 =?us-ascii?Q?uugod1wWLlvZ+55+YjZJHXTB5c7vCyF6nqXZH9TAMRA7kCNqyPmcaKV3voLs?=
 =?us-ascii?Q?dZ7rpIdrMp82pSItAqo0Esod+uVEA3GimKeKLvFjnVQkahly+WoS+xErPKap?=
 =?us-ascii?Q?57t0g+wVYJS/PFPPftS3lFrSTfeSHMqVzm768Rv2rymF/vbiTHp+DTOSQlEu?=
 =?us-ascii?Q?GTVREP9GztTJhLxg/FIv3zCQLAUHIHT44OtztNO/mUJiKy0/ZJtYq+DTmi1u?=
 =?us-ascii?Q?H57bOH7sIlee2GeWqJqIs1ij86f/hcWrvb8s3Q/D8JhWKrwHkDO0mwpGhd16?=
 =?us-ascii?Q?Xzzp9NcPp2ZtuS2nz5sg01WDL6htuX961mIYUIemAL+84uZhPE/DvnZ3lgxL?=
 =?us-ascii?Q?K0FkR238++AHgZ5HdGBdZpwsnpH9XlDwbQFmHKu0BJyXS3DVmE0F5+TWVuVd?=
 =?us-ascii?Q?HG/yvSUOr+wda1qXKLf4gvFzmuR0hVjfFztpl7xhzfQpFXOAbQvJEQ9xPIgS?=
 =?us-ascii?Q?AZfJU8AD9faI+N6IIry6BntWxmAEMIhXWz8dovxqOtAbHvPTXiwYZYbOTs4H?=
 =?us-ascii?Q?ATkrD4+3w6RFL/NOlyF0kzGfGhm7/Ma8GujB+VJ3GM9qfJ748FL3hjQzZBxK?=
 =?us-ascii?Q?MnsPbteJUfMAiR9HgQ5vDVwkCVDjJTorI5uB37HVP574AuRAecjVJh2sDkoI?=
 =?us-ascii?Q?rELCD8AtHsHOgELL9Y2QKmGjCOQ1C/yYz80i/X7fC2v1mw7SHKECeCZUeqpk?=
 =?us-ascii?Q?FQQI5z5BEQj7GsZLmOOUJ1zBrBhyRzA681xOW49Ad7INu3mgjtF58oNTZWPv?=
 =?us-ascii?Q?NB8b2JI29RfWXvoOAQUldMqKsio51WsrMW1RYetEPM8uwmPszLI/v3AYQDJr?=
 =?us-ascii?Q?OCGoxc3vE8a4l2PQb+uMwLfUoynomHB223hBnN1KvbqpboDdlJxePU30taIT?=
 =?us-ascii?Q?fgFw55vkjivT/CAW9DgHiFfGpXRh8qZ18wU5YhZwINnTMbe5P7LNkbORiB+0?=
 =?us-ascii?Q?xk0dp9Ic9qpvsqn+M8uO1WQurZTIQw2BnWMKnJggZlC07dCMoE0xsZh2moGZ?=
 =?us-ascii?Q?pj80y4hpgIC7lvpaCeeOKLVqHhSslPC3rWtiAt3nk1UG5RgoD70kmjQWiIYH?=
 =?us-ascii?Q?VPx8dkIwVIsigu5pIWaaG8w3g3++?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7779.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lRKtgAsEnAbfFlJkVzgBwR084bADbWnl2NLve3+RjB+jWQdut1cmDIxHq6LZ?=
 =?us-ascii?Q?HpMJtuahY/APa5SjkgOUWq39Au6Sz0AQovSJx/5Q7y4vLyPhsuBDQy/6SBIo?=
 =?us-ascii?Q?l2Ct5/mMFFBcs7LeJtjTIidjDn9BwVxPamUqnZhGAfOt5o9JWwb2cv31lbGb?=
 =?us-ascii?Q?ePxTuU0Ub8jg/m3btr0/H2jDdpoMeG39CnzioKN2WyFobStOROjZvWw74cF3?=
 =?us-ascii?Q?Mfr6DgDMaNR/qw0PongY9/VrQkmyVoeIKqPDoJUT0NuCaQ5nikSAkXgUzkBs?=
 =?us-ascii?Q?qU3gISn1e2/hQ+eNYQVVknze0b3yWb8UItQT8DkQVH+1WrFZcDPq5+pyE3kx?=
 =?us-ascii?Q?A9LhY0Gspg01YdAbamrIGiUjZWToR1LqPLIkMr57JOFUn80EuajGA9tfHdJR?=
 =?us-ascii?Q?NXJ6ZXffvzRxTmAt0yDvzNB+8chUkXhNj28E6pJKu8zLlUo+Kwdg7yuIAC5t?=
 =?us-ascii?Q?yq6NWlG53Mzs4Hib2/0JYbfV0pPqUyi7qAK7kKqCj1+QfEgO8dsiKEFqvNoW?=
 =?us-ascii?Q?QhmbxVPKZAqehcQ2m9Uq/kV4ZZC/PW8A8PC3EgiObvht71JHqAIGQB6qpeC+?=
 =?us-ascii?Q?Bwi1x4epOf4a5POsniyKA7VV3YdqM0+dR97i1bZbwHvWQm5k8DhpHRdazxcs?=
 =?us-ascii?Q?knEIu9c6yXqJUNJWkaIugSdoQDb5DumeRiHoi5uiQQ31kCldCKmPBPa5wVCJ?=
 =?us-ascii?Q?55HoxYbx4nIP87nnwlNtSCMwFk2x1Kfrlv7Z1HqXmKp/+adqF0xrkiV1KMmJ?=
 =?us-ascii?Q?z48v4z2+oX6cz57wWoG7B01VXYX3HAPFlCeu9ulVpPMBNq7QnrfldQy6jPr1?=
 =?us-ascii?Q?zAQZAGI4DfBTsAJe11dYQ6IOHxOcday0V7gsH6DaWAVqIS6PD5siX9ClIUTi?=
 =?us-ascii?Q?tth2icM0E6nAyazakJR8qug/ki/a31OAC57bx4B9IUI/HNyTPJYvLTKalG8N?=
 =?us-ascii?Q?4ml3VgSnu+wip1MLt4Uf+iYzjBeaYJnIkhSEJ2Y5O/BFang1mUu0nv1s920d?=
 =?us-ascii?Q?WQKh6+XGtbZ2HdNtzQDfgYaEt0AtB2Yv57bkFnKROk2lcMBDfYMMKSjvSnlL?=
 =?us-ascii?Q?FsP16W9EM5ng7eLCqzwOzCkW4YMImRgCGhWawESt+ifLE9PvQk9H7ja4XcQV?=
 =?us-ascii?Q?RaF+DZRT1sbQHmJJX/KqABUUPx7Dv1lgF6+knqv9aNLPueLEe9C1oWcYN+sK?=
 =?us-ascii?Q?7hlvagCeFkD4lzQu1MqKzT2UBlN2zIZ3iN5RRDjr8ITdoxJlcUVYnI1Y+PZM?=
 =?us-ascii?Q?VNgjX7r0hrxG1cyyOu5f+n3uMVnNIh8F3J5UddoX9OKLlJqVcUP00Ulc9MfQ?=
 =?us-ascii?Q?LxXWj38puZqzxBExBMBO4g+WFfvWt07HNm0QN9qwbxuO0zOsL2vK2I5fbrAj?=
 =?us-ascii?Q?v01sb2mX2k1wm5aduzWejxv891CxI1jBzCCcWaT3yNrcUyUbLJ0/8OnmJJFP?=
 =?us-ascii?Q?EiGqlTUAYDrl8zUTJl/G3fmU8tE7cl9QqiGAoZuBPGTnSXt2km+45AsOCki+?=
 =?us-ascii?Q?p8AV/pZUlikzeHfKKhkcM1iZS2tGtoaogGeWTDk5LQUa1ydhSFwot+39vkpT?=
 =?us-ascii?Q?zn8/ifQGrH1fPX0H7xQkrlDqSM4HC4Afg66mOJ4/uQZ9v9by8bp86q6u75fa?=
 =?us-ascii?Q?aw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e717907-bb8f-4686-ad59-08dd6575e262
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7779.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2025 17:05:14.1982
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qZ22zV+CwDdEXsmAi/RStn0jZGoFWxnr46AyuuG0W521VOdznWhSaFA4GH5tQfIWPoJ/7v2Yv5GdVHPxYKAa6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9299
X-Spam-Status: No, score=-0.3 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
	T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Mar 11, 2025 at 01:38:26PM +0800, Wei Fang wrote:
> For ENETC, each SI has a corresponding VLAN hash table. That is to say,
> both PF and VFs can support VLAN filter. However, currently only ENETC v1
> PF driver supports VLAN filter. In order to make i.MX95 ENETC (v4) PF and
> VF drivers also support VLAN filter, some related macros are moved from
> enetc_pf.h to enetc.h, and the related structure variables are moved from
> enetc_pf to enetc_si.
> 
> Besides, enetc_vid_hash_idx() as a generic function is moved to enetc.c.
> Extract enetc_refresh_vlan_ht_filter() from enetc_sync_vlan_ht_filter()
> so that it can be shared by PF and VF drivers. This will make it easier
> to add VLAN filter support for i.MX95 ENETC later.
> 
> Signed-off-by: Wei Fang <wei.fang@nxp.com>
> ---

In this and the next patch, can you please separate the code movement
from the logical changes? It makes review much more difficult. With the
similar observation that, as in the case of MAC filtering, VSIs don't
yet support VLAN filtering, so the movement of the hash table structures
from per-PF to per-SI is currently premature. So I expect to see that
part removed from the next revision.

