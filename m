Return-Path: <linuxppc-dev+bounces-6127-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C06A32A71
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Feb 2025 16:48:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YtN4Z1PP9z30CD;
	Thu, 13 Feb 2025 02:47:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2606::612" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739375278;
	cv=pass; b=FEbSfggVwFFVnA++EOrcwvfQuwdxBXjKG8FccbJuaSQ5XdUrG7GKXB9b0Wa182PIwRR4DLt9tYj6PDCVvwlhXSs6GgOFubSsRK/O84pW36ya5qMHuikiRLPkZbthxIQJdOQdbTE9xzZf2WmJ3H0y5ja1/Z830X61xKZbPsvP3FXZ6x1pv71AJSQjUaUxWZU6mpyeKcmIh/BhRfQyV4P2Uk9kThmgzEnA1EJd9bIuQahAzO0/y7trSslL6w9b8ckp7dXpwPcMdlGjaprvDKVDm3BIQZ6F8WhCI0k2qizk1kfflhkkZxBstW51+LUoOaQpp2N7FOrM8uVQrUEH9307FA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739375278; c=relaxed/relaxed;
	bh=0Nem88b8qmvxPwwrv866nL0iyBq3IdKeXoRuK8nU3xY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=EL8oCbPHMGT9iLR91dxWTAEvQiDjOSCJaGTnbdcWLwyyU2L9JlIzLDIyNDCtrAoZTy7xir35qfRcGtSa5/p7iMRe51qnS8v/diojDGsygp4Gnh0GtbfmuRDOzRQ+Mdk8VS6EYe4yEZLw+wbX1WyANn6fZQv0KlBw+ZAJf2iGjxnUpUX0dy+Roe9ls3fLzhW/5Of0MB5p5ZjgkfJNSklZVeCnuMLaJ/Th+UwSnlZaaqlVyHyZzHmAjtBaBxqM4/C+00vOmIKJP0dR7oCA3RjiV87gI5PsKoTleLHcGLQlIPJ7LxqqbdlASlkMS2M6DUgQx+qo69hlyV46HLUouY/hqQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=Ciz7kOn0; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2606::612; helo=eur02-am0-obe.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=Ciz7kOn0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2606::612; helo=eur02-am0-obe.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on20612.outbound.protection.outlook.com [IPv6:2a01:111:f403:2606::612])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YtN4X5VLcz2yDD
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Feb 2025 02:47:56 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JCGx6yYQmjNowstW6lw7+IyiK6UyVkARzkXYevdHdseNAjGm3IyIigOzuXy1oDTeeefgGaoAwlLmI6AwUNle+2eXEu28O4mntbXqk6Qtw8GiS6kd0G5nLLHGIbu3ltDDHbn12+3SNxILrw7tDzhj89VuANwRY0nkH5U+rahIRykHfnRL0YJ0UwY8/hAHFyj1qpNZSRLhsPpFNADCwvZFuIaJaReKY8qGNAhLFwYh0tZxUYL6m6ydZwYaY28rfsRWtREexyMY8OLh9GdjVX9Fy8aVSkaC58SE6W/E2tDMxsCog+Uo41Ln8grwtD5PpWTPQW7CnLbePmO3jiTRWpvKSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Nem88b8qmvxPwwrv866nL0iyBq3IdKeXoRuK8nU3xY=;
 b=Esfp9oAB3AofkfllUWmZjIETyWWwSI1J+0ZEZXlxe4Tkr2OldLwT244rmLXYN71eoosfAphJ32QfnjsFsDxDv5Ryhkg40qc7BQBfyiBeomkxJqU/prrBPSXkdTunH4s6Na8nKw3pj1Cc9a+LS37BQue7ZZDOW2Wxb1EepzCR2jFQuNN/P96bLsGYNyvBAdnjqE8YETZhrwSv/gD4gv24uI51Vd9lXaOyY5ydV7Em5a6aR2ozadX9KJYEismTFW5Z6uvUjTEBR/7sci2NlZ71oKzHywkfuN+h4BQQYb8ZgwnCo8HdWpfxUUe/YtiZQVH/Uf1XyPw7aRpQdBKpHCyECA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Nem88b8qmvxPwwrv866nL0iyBq3IdKeXoRuK8nU3xY=;
 b=Ciz7kOn09Cr5qpU+D6anHlDu5Vzz20UCqrz+Il6TDzYVzCEvDxZGeWPT1O2b4U2BgPKqZ0sskH3UG4I+KZLiyFm/f6eSUeZI+qOBEMh/EpCtkjdJ1NRWwmSofcimkWD0OZ0oxmgBcb3ZJ0vsnNGYP9FqHK4MsHFhQ2Te/q2fDk5QaFJ9nY1d5IOd39pZhl7O1f5xCX4KqxGLg18EXP8D24SCCyqWNW4SqNdkmvsquh/D9mKTch0kWsb5YMyL5ZNjesRUQedkWjO2taWyicIrb6EeKJIPXf6qxdg+91CLxtqT9lh12nlF6fXQ8ZQMADlZp3QXWgkq9g10WQnswvbfAA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by GV1PR04MB10846.eurprd04.prod.outlook.com (2603:10a6:150:210::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.12; Wed, 12 Feb
 2025 15:47:35 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8422.012; Wed, 12 Feb 2025
 15:47:35 +0000
Date: Wed, 12 Feb 2025 10:47:25 -0500
From: Frank Li <Frank.li@nxp.com>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, Xiubo.Lee@gmail.com,
	festevam@gmail.com, nicoleotsuka@gmail.com, lgirdwood@gmail.com,
	broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] ASoC: imx-card: Add playback_only or capture_only
 support
Message-ID: <Z6zCjXr6vsVF/6Ag@lizhi-Precision-Tower-5810>
References: <20250211035737.3886974-1-shengjiu.wang@nxp.com>
 <20250211035737.3886974-3-shengjiu.wang@nxp.com>
 <Z6tuFp9nZFMJMgDa@lizhi-Precision-Tower-5810>
 <CAA+D8AMyXVdAWOTGHtrOyXjSLiMioAhZ1awepX3nproom87azQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAA+D8AMyXVdAWOTGHtrOyXjSLiMioAhZ1awepX3nproom87azQ@mail.gmail.com>
X-ClientProxiedBy: SJ0PR03CA0276.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::11) To PAXPR04MB9642.eurprd04.prod.outlook.com
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
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|GV1PR04MB10846:EE_
X-MS-Office365-Filtering-Correlation-Id: b516fcea-7eca-4b5a-e31b-08dd4b7c91da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|376014|7416014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SnZmenFCQkNzVnhzT0F3RlFndzNFZWZKM2h5aDlZdmFwNi9JQWhHSTVtMnFD?=
 =?utf-8?B?SXRYbS9XVFRzZUE2SDE5aGZ1K3ZuUU84eGJJOTZNQ3U1Q0RTbnphazJmZlhn?=
 =?utf-8?B?QnJiWUhUdHRZMTRQS0M2YnZYQ3R3cDJ3bm5xclBqWUowTTJPejNrZi80czdm?=
 =?utf-8?B?T0trL0d6ckcwVTZiWUpVMDJaMkZrRU05d0I0NzF2eDVPVFZWN1F5bXpRcVR6?=
 =?utf-8?B?c1EyNFgrejRFL3M2cytWMzJBa3pEVndNOU03eW5JdEkrdndMRzQzVEV2WTBX?=
 =?utf-8?B?N1BNMGk0NHVOT1lmOWtoWlg1MWltWC9ncVpkNmRDRTFiYTdvQWR2dmNEQWxj?=
 =?utf-8?B?NUNaQS9SNzExVHRQQkdCN0VtVXlIRjhmQTJCMURXaWtpeHlSRDhTUnB1RHF0?=
 =?utf-8?B?c1h4Sk5PK0RjaWZHUUw3YzRzeGpBdWxtOFZWYmQ0c3dKTWdJK2w1ZEU0QzN1?=
 =?utf-8?B?a0lEeU41Q2Uvdm9mVG13UXh4MDVLaWNTMHArWjgrazRHZDJUVDJXRm00azRF?=
 =?utf-8?B?eHlOWllsQlprOStPblJkY252WHowRE1WZ1RuT3hTaG11UEtDaWM4TVEweGpn?=
 =?utf-8?B?ZDFhYW1Oa0VOR3V4ZENqZ0FnblVHOG1uKzNyRUwxNU1IMjdpU21mRGVqeFRI?=
 =?utf-8?B?S2paRDE4OU8wTjc2MHRRVzB0NjFqc1l1clZJSDdWZmRxVStLTXZaSHBPb1dp?=
 =?utf-8?B?WTI0RHlGVXhBa1NSMllIT2NNRTdwM1dJTEFuM2YrRmRHUDFoK3BKRVoreEJE?=
 =?utf-8?B?dEZoeWJrUjN6UFZuSThnRnJrc0VjREpYZHZVTm1sTnFSTjdGandWOWwyWllR?=
 =?utf-8?B?TDlybTFvKzFaeUZTa3VjL3FuL1krM215b3piZXh0RlcxR0pkSHh4YWs5dTJC?=
 =?utf-8?B?NE12UkhBaEh2a2dSQkNrbXV2enJSWE9JQjdGSk5MVXBqU3doTWJIeVJjRDda?=
 =?utf-8?B?dGlGQXhlN2dPMUx6aVU2SXZuY0FMMjYzb3NuVEtwZGxDbEowcTZqYWZOZ1ZJ?=
 =?utf-8?B?U3MrVlJyc3VvZ0JaV1djclNkQ3lmQ0ZRd0dDMVdCT3hVdE9ua3lKMXpvTndR?=
 =?utf-8?B?MVVjc3RwcnY2RnhXdzl3N2RTblJGVWlTMEUydGwxQTFhUnFPTVNyb3M1d24v?=
 =?utf-8?B?Qi95UFRTanlZVE5OU0VuY1h4Y3d6enZJTWYxaUJINWJnQmF4NjBONm1WeVBr?=
 =?utf-8?B?d3VvT1FHajBYenh4d2FuZ2JnOERFcEFBcFBpeFFIY2FnNVVlc0dpSisySDNW?=
 =?utf-8?B?Z0FYWmt5YnNpdXlmNG1DdEtndXVpYkVhajI4NWJabU1veXNkNWVzMFlhVG1t?=
 =?utf-8?B?NzBnN1RFRjVVMUp2QktwRGdEcVBLOEd5WUhzYk9rWGlXaXAwYkRWNEJJTG52?=
 =?utf-8?B?NEJRaEFRVnI4Y0tkcStzM1hYM1NRandNNjcvd3VjcnRCbGxqOWJoWUh3N3Y1?=
 =?utf-8?B?Q2luMG1jKzhFSHVsdGRsejh4QzhKMWF1Q2FGQkRZcGxlR2tzYVlmTWFtVWRE?=
 =?utf-8?B?cjdhVFN0VjQxRUQvMmZQanhSejMxVWF2aU8xd3VWR3haK3V6WllQQ3F1eURC?=
 =?utf-8?B?WGIweWo5MUlWSXV1NDI5ZVJFNmlUcVdyWEJ2a0ZtbjRYcnZyVXNkd0tTcHRX?=
 =?utf-8?B?Y2QzRDFZdFdpSldoY1RoOGpkY21sa3hFbEFvQ1N4d0k1TTBNMHRhZUI0ZkFC?=
 =?utf-8?B?T0JVdkdxbG53T1NqOFdsZFNMdUR2L2QwUUF5YkpoOVU5LzlkakFDSjNBMHQy?=
 =?utf-8?B?UVk0cUVXOHB6WGN1NWN5MDk3RkJjSWFyMWdlTFdOQ3BVRVB6VFRicko0bFM1?=
 =?utf-8?B?NEpGaTc1ZzJLZ2VoTExtSzd2SGlUazBaaUpjME43RmhCSnV0YldmbVpwYUdr?=
 =?utf-8?B?Zk1RTWtZdWFxWUIzZU8vZTd6c1poZUliL3FLOUVWcUJkOG5xaDJ6TkwwWFkr?=
 =?utf-8?Q?M1H3LBuEXqssBKnIk0Kg+v/xfZ8keRIy?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(7416014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dkFLbHlkUEt0b0lLMC92bDc1YU0zby8yMmwzQ3hmbEZ5bU51Rk1tem9BZHRk?=
 =?utf-8?B?cEFTZ05iZkl4NlBjeGxiZ1hyWVVuU1pyMTBVMnFqRllSblQ1RHV1OGlCdmVk?=
 =?utf-8?B?QmhCUkZCczVDSEc0S0FTUERtNVA4Mmk0TnBuOWFqYVZRWng1VHlaQlpTMSsx?=
 =?utf-8?B?Rkl2dWorZzRScTFYelR1cEtZanYyV2pBNENaL1JBRzVJdTlZMldhVUNmWHBE?=
 =?utf-8?B?aktWZ0pRVkE2Y3FvRWtweHoyOTFpM0FUc2hRTjQwSDg1R0J1bmRpTTRVRmg2?=
 =?utf-8?B?WUNZYlFUSmlzM01PMGZkRXZpZEhqZTlsbXIxeFFEWUJZYlRrMncwNE84dnVV?=
 =?utf-8?B?SnhldXJBSEFDQ1VySW9kK244WkVhaEJKMndYd0FyRDkvTXBEb05rcHlJc2pt?=
 =?utf-8?B?VWlmUUQ4UXR3ZExacEVrUFZjK3Rrckp5V3FKY2F1WHgvamdwTjdaakdpTzgy?=
 =?utf-8?B?bEZ6c1c3eWpNWWhBM2V4ZmNNUHNqMFE3djFZbkdmUnl3R1gvQjVaL2x2d2Fp?=
 =?utf-8?B?UEZneVIvYS9MYlM5ZkdPVDFrTjVFVFRDbVpDRmJPZ21DcEZpM0dmVGdNTTc3?=
 =?utf-8?B?OHBPdi8vQ254czRmL0Jac055NjdGUVhLZDJRZVNpSzdFWXloU25ZUnhBQmdF?=
 =?utf-8?B?ZkR6OVZRWTlkRnpNd2xhY2hMZytSZTZaSnlMZkdwVFJqNWdFRzFlVmRqU05D?=
 =?utf-8?B?dldueEtJaktvdldZVmhMR2NuZmc2eGlSK0RMVVFoekdLM0hhY0dUbXhpNDhk?=
 =?utf-8?B?Y0xoc1d1Rm5nSzFDNlZLTlpGNitNTWVBc1BUQ2FRbm5DMEdYNitVajhLREgw?=
 =?utf-8?B?NTlyblVXL3JoQWYrV3pLeXltSTViSkNQbHg3TUVabWFlaVVSQ2IrZFRxbUVv?=
 =?utf-8?B?OVlSRHBXODBCMFcwbUZHdlRtRzROQVZtcDRBcG5FNXJ5MU5KWGV2bnhKVFVq?=
 =?utf-8?B?ZlRid01ETjlGcFlNTElMQXg0b21ZaU9EM0x6c0tRaUYvbm04azZ6bTd1WmlT?=
 =?utf-8?B?bjJBRkJXL245cTFxeDlHaGRqWGhRbmtyOXhha1pSTUUyc2RIRkVOTktNMGdv?=
 =?utf-8?B?czBzK2NQQitQZmo5aTVweE03VWJFWGNlaDJGb3pQdVFyMHk1KzBzU05DdUZE?=
 =?utf-8?B?YTFNeGxYZ0hrVThiMHI0SXlRdzRMOERtL1hvYUdEMEZRa1hNdXhqMEUzaksz?=
 =?utf-8?B?Y0FOVi9xbjB4RDFqTDZENlE4eXJIWFQ5amNXTVVJL20zNW1KRGJwaHVOTndm?=
 =?utf-8?B?TEduUXJJenAweCt1VnVpdERuTWFsS3MrRW1hYm5WZ1VHM0JCZ1dGMGQ2Uno0?=
 =?utf-8?B?UDU0ODdGMUdsMSs0Tm5aYkNtcmhJUHZjQlc2ZWhSaEtBUUNkVTk0dkJINEh1?=
 =?utf-8?B?N1MrRWhpZFZDMkZ6TGRoOHFMZGk1NE0vaDE1TW5qejcrMWxwTGJUK1pIOEhM?=
 =?utf-8?B?aVFHQjhzL0ZXaHR6a1cyZHQrVHhWZmt3R1psRGxYRVB1MmZQY3E5K1JvVkQ0?=
 =?utf-8?B?Q0xrVHRyWEQ2SjliQ3I0NVVXMCtScEVIZlhMcTYyblB2bWlMSHNKT0FZbEp1?=
 =?utf-8?B?MWZudEphVTg4Y3FXRG5uVCtFSnVabER5MWRNNmxGaUlJRkNNZ0E1VzArTk9K?=
 =?utf-8?B?czlHb2RqZ08rby9BbmpvZVczcmw3amJNTUhnZUpTWm5oVkxWeHBJaXd5Ui9Q?=
 =?utf-8?B?bjhpL01EZU1zZytnWVU0WGhsMEF1OUdYQmRJSUo0N3Q2VXhtMXJaSlB6eWhR?=
 =?utf-8?B?ZzJQaEV2SndNOWlpV3RyOURoVkswNVlYMVExZERQWW9zZysrM2VIRmlGSEpX?=
 =?utf-8?B?NjJRaWtocEdBN0hoZW1VMWh4NWhOay9rLzM4eXNtZlh3S3UxYXlnRDhMNFlB?=
 =?utf-8?B?Z1lSNUdpaE1Ta1hKNEtVc0JXRlJQdTMvaTQ1Z1ZBR0tZTEQ3bUxqUzBCdFpP?=
 =?utf-8?B?b0c5M2hheGtXSitic0RpbXhsc1k2SVpTZFhUU0JwMW9qOWt2VXVvcEZka3dE?=
 =?utf-8?B?QUx1Wk9Ea2VqbjF3QkRHUWhVZzdGNmFYazRFUDRmTDVPcVk1NGlMUVZRc3hR?=
 =?utf-8?B?V3J4OEY0WTJZTWJRUW5RZURrZjFVeXB6aUFqNVBsT29DZDFUNDdGMHdJcm5G?=
 =?utf-8?Q?MYZ/AKj7xhw1IrmpJULjQ0tmI?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b516fcea-7eca-4b5a-e31b-08dd4b7c91da
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2025 15:47:35.3473
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +HDbjKmvxS/wyHC7ovVr/c25t9OxdCKU1IP8ID/2IySsdPyShtKfisg3qlvz8uU1SLtYjTIHgFlmfMdkLeSA3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10846
X-Spam-Status: No, score=0.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Feb 12, 2025 at 11:48:43AM +0800, Shengjiu Wang wrote:
> On Tue, Feb 11, 2025 at 11:34 PM Frank Li <Frank.li@nxp.com> wrote:
> >
> > On Tue, Feb 11, 2025 at 11:57:37AM +0800, Shengjiu Wang wrote:
> > > With the DPCM case, the backend only support capture or
> > > playback, then the linked frontend can only support
> > > capture or playback, but frontend can't automatically
> > > enable only capture or playback, it needs the input
> > > from dt-binding.
> >
> > wrap at 75 chars
>
> On my side, there are in 75 chars...
>
> >
> > >
> > > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > > ---
> > >  sound/soc/fsl/imx-card.c | 5 +++++
> > >  1 file changed, 5 insertions(+)
> > >
> > > diff --git a/sound/soc/fsl/imx-card.c b/sound/soc/fsl/imx-card.c
> > > index ac043ad367ac..905294682996 100644
> > > --- a/sound/soc/fsl/imx-card.c
> > > +++ b/sound/soc/fsl/imx-card.c
> > > @@ -518,6 +518,7 @@ static int imx_card_parse_of(struct imx_card_data *data)
> > >       struct snd_soc_dai_link *link;
> > >       struct dai_link_data *link_data;
> > >       struct of_phandle_args args;
> > > +     bool playback_only, capture_only;
> > >       int ret, num_links;
> > >       u32 asrc_fmt = 0;
> > >       u32 width;
> > > @@ -679,6 +680,10 @@ static int imx_card_parse_of(struct imx_card_data *data)
> > >                       link->ops = &imx_aif_ops;
> > >               }
> > >
> > > +             graph_util_parse_link_direction(np, &playback_only, &capture_only);
> > > +             link->playback_only = playback_only;
> > > +             link->capture_only = capture_only;
> > > +
> >
> > if only use once, needn't local variable.
> >
> > graph_util_parse_link_direction(np, &link->playback_only, &link->capture_only)
>
> sound/soc/fsl/imx-card.c:683:53: error: cannot take address of
> bit-field ‘playback_only’
>   683 |                 graph_util_parse_link_direction(np,
> &link->playback_only, &link->capture_only);
>       |                                                     ^
> sound/soc/fsl/imx-card.c:683:75: error: cannot take address of
> bit-field ‘capture_only’
>   683 |                 graph_util_parse_link_direction(np,
> &link->playback_only, &link->capture_only);
>
> There are errors with it.

Okay, it should be fine.

Frank

>
> best regards
> Shengjiu Wang
> >
> > Frank
> >
> > >               /* Get dai fmt */
> > >               ret = simple_util_parse_daifmt(dev, np, codec,
> > >                                              NULL, &link->dai_fmt);
> > > --
> > > 2.34.1
> > >

