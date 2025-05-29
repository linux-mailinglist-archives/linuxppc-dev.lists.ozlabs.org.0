Return-Path: <linuxppc-dev+bounces-9005-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57AEEAC7BDC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 May 2025 12:39:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b7NC55Q24z2yRD;
	Thu, 29 May 2025 20:38:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=67.231.152.168 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748515137;
	cv=pass; b=fyZpKMU9cDgRXh246+jYyuIEKNUnDY8hE5bdef27jdQkecD0IsCnbkm3YgEB0oq1BBeRY13PIEoP+TNs1P9k6D5568nRUgoJP3+GuUAPFBdjlrJI3AfMQWZvTjDYlxLfi55OHH3dbpBrOBFbSuRoO0YCk2ii9BA6K4KE35BaQtzGxj+Ddaeb/n+jDJxBnJK8VqDJVsRCrDTkHUQ8f4hO1pt9RrIIEV0G8Pj3LEmlaeht5iSL18Zwi8Pf3b6s/msAsauS3U6nQyEbdrvXDWSHqNaaBZkFRIlTLsFD8CNvr+uONsZgKE9DBTZoqq1zoAkT1df37sqZVgrMicwlzwIHxA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748515137; c=relaxed/relaxed;
	bh=0q1y9e6+UHj+7CTtMZ0feNgKxE2MNCdhaZj5JOyuHAQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VibbhPDJATKPk+3Iipsyr2uf8euQwb4iNPhjwqkvte0ZcgHzOA/9WtEwAePnZHiBUVBrWCdKv/pPlpAihOmPxi5mQM/oKPLQLXYBfXBi9AEhwBdI9EzWi+5S/oGeRnH37FjzC/Pp9sZ+VN4sfdrLUJsnbP3RXNrati2tGNVcEphQFVyEDGRvtpmecJ+CMnfsVnXgPCskmsRpW94RGAANgzISnzaViZiIHLTJaHdn2j2Pjx3hmz/Y2IQ1WxeObhbBm+HTMsxkH45FQLDVh8O850rVndBg9NZKsXfwTMXg4xOzD7j1UEkEac+zTZvE+Z1MFr4VP7V2ggasW2g/Lgg5cg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; dkim=pass (2048-bit key; unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=FPgsGZrt; dkim=pass (1024-bit key; unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=NfIhjeLj; dkim-atps=neutral; spf=pass (client-ip=67.231.152.168; helo=mx0b-001ae601.pphosted.com; envelope-from=prvs=5244c882e1=ckeepax@opensource.cirrus.com; receiver=lists.ozlabs.org) smtp.mailfrom=opensource.cirrus.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=FPgsGZrt;
	dkim=pass (1024-bit key; unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=NfIhjeLj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=opensource.cirrus.com (client-ip=67.231.152.168; helo=mx0b-001ae601.pphosted.com; envelope-from=prvs=5244c882e1=ckeepax@opensource.cirrus.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 1712 seconds by postgrey-1.37 at boromir; Thu, 29 May 2025 20:38:55 AEST
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b7NC35fQCz2yNG
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 May 2025 20:38:53 +1000 (AEST)
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54T4SGPC027414;
	Thu, 29 May 2025 05:10:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=0q1y9e6+UHj+7CTtMZ
	0feNgKxE2MNCdhaZj5JOyuHAQ=; b=FPgsGZrtPIwjjg0v+ZFT8SrdljLY5ruBZW
	I+fRe3tJv3kgOuuRghO9Vnx0RAo4EZGOlu1lEO4sM71YwTMfVWPrgEC8NFRu0Jxy
	VmVFhUwF7zG9kJPHRZftIqGweEez8Fb87Qx6Y68+zczlQGWwxBjyllpG8MWCA4ki
	IAf0LPbEcF/rs3k05ksrEWXrPn1oca9Xz67rAKqM2sX/SPYCuiu+TUTMRByn9ulD
	qHEgIzeNpGe79CcdrQTUOD7jo6Us67u3iA4PrsHNzrVsPLsbZ9srEwp00O5z9ojR
	x5B2azD3zKngK/28qOF3WBV++W0wjIouSORBW+V3n3TyBBbXU2ug==
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2120.outbound.protection.outlook.com [40.107.237.120])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 46wctdue1e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 May 2025 05:10:06 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S5uiCFzledjYo2dSGkLuOVI5WHcF6YAHTntJK5j81+wRCiZmQ1wBch8W3e810KIkOrz8B2rzDUqxU2ejGcKqeJ1/fozGfoO43UIsy96FgoIZV4hTjPDERsOS0+NpAARFRHMb7exr/3h+zGel8nMTC81x7Cf4YmiVb/gOMaM0ZHGKM2kBuzeskH7cotD1m8gLNHOb67hHNId9Dm/yKtcUk6kiVqJI3FUBxJLmOHnu81F5M1UAKeGP3zeBBbzSqqVW9Wckws/ZSzJkIp6pFic6rVe+xmMSky4HZBUZQlN3hw7MsLSB6S+mo2DHvQ2kOuG/Xkgac+fTOY9eDbqVaYozQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0q1y9e6+UHj+7CTtMZ0feNgKxE2MNCdhaZj5JOyuHAQ=;
 b=y3HXXJPl0iLNQutoA1verJRqZbdTiM+S4aSSz2WabAwQx0/1uSl7k1zkfymLqM3DV0fbOMyK1XAzZ2HIF4gTUnrA6uDyhybbIJ3y01ENmZB7ZZv2p2CS2EI2V5PunmdZpJGDIzxDHmcEZslUuiOwof9mwk0F3xl4YhkFCYZvgRT3K8iYx6PFDdSVnypHHic5P5OuTnhjzfJdQzTKchCJpxyxvP0hNXJmKASfg8YZmZ3jw9h4SBAoGSmUBXU1UVQyXnblZgn7Rf5uqnV9DbzirFsVMDcKb/WCZmR9h7u6w6ohgvZ2RnPQxI1hlBfC6byDnwPU0AfnbHwbYQXaVsAZFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0q1y9e6+UHj+7CTtMZ0feNgKxE2MNCdhaZj5JOyuHAQ=;
 b=NfIhjeLji8A/Xc7c5T0JJ9Thlj/Z66syefgjUBHEh/o/Jxd8oFi+Ip4hDvtBF0RUkFlj/nKTIMzUkgnrsh4xkr1isWAI0EHY9WqGgLcsOtuYQe1czlTUNiul0taDHwgdJqxq6zOElse5Uezg5v/BvjrZT24ms138oLvziWC3t4I=
Received: from BN0PR04CA0092.namprd04.prod.outlook.com (2603:10b6:408:ec::7)
 by LV3PR19MB8229.namprd19.prod.outlook.com (2603:10b6:408:199::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.27; Thu, 29 May
 2025 10:10:03 +0000
Received: from BL6PEPF00022572.namprd02.prod.outlook.com
 (2603:10b6:408:ec:cafe::7c) by BN0PR04CA0092.outlook.office365.com
 (2603:10b6:408:ec::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.24 via Frontend Transport; Thu,
 29 May 2025 10:10:02 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL6PEPF00022572.mail.protection.outlook.com (10.167.249.40) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18
 via Frontend Transport; Thu, 29 May 2025 10:10:02 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id C67B0406545;
	Thu, 29 May 2025 10:10:00 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id A72D7820258;
	Thu, 29 May 2025 10:10:00 +0000 (UTC)
Date: Thu, 29 May 2025 11:09:59 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Support Opensource <support.opensource@diasemi.com>,
        Oder Chiou <oder_chiou@realtek.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Shengjiu Wang <shengjiu.wang@gmail.com>,
        Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
        Nicolin Chen <nicoleotsuka@gmail.com>, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 1/8] ASoC: codecs: Constify regmap configuration static
 variables
Message-ID: <aDgyd2S/j3MW4JCg@opensource.cirrus.com>
References: <20250528-asoc-const-unused-v1-0-19a5d07b9d5c@linaro.org>
 <20250528-asoc-const-unused-v1-1-19a5d07b9d5c@linaro.org>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250528-asoc-const-unused-v1-1-19a5d07b9d5c@linaro.org>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022572:EE_|LV3PR19MB8229:EE_
X-MS-Office365-Filtering-Correlation-Id: 069c8f04-0efa-45a2-a31d-08dd9e98fa2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|36860700013|82310400026|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nCMheAgrEmZu5lS7NT/ElfzIImKACTGbCt35u380HJ4gFwxxNMh8E2kBOVLq?=
 =?us-ascii?Q?C+uhCUykQLxZxN2KrYE9RVXQ8U3/LfvbjUo58s3b7h5GQD56/gY1POMM4PuS?=
 =?us-ascii?Q?FtVVaJFQeR2nWxKqNNF83E32xoKDCLTx9fwMzE7gTFDHP30H0/HHZzHi63qi?=
 =?us-ascii?Q?BFEXMoztBxnTkgFT9Sh4l0lVmyVOmm8+lTZGx00SUpqF/WVtPG8mKTXwx3hN?=
 =?us-ascii?Q?ao5c/ait5/nBFwTc9hl4Ixiv8Fhh0odhGIU7WOR2CvMPJ/F6/rltWa8EgyRT?=
 =?us-ascii?Q?/3aV8bRTTQ2zlWXSdmT+ooJwbUEOJfY/AEaTArBn/gzrLNSoXsvj81uEJxoa?=
 =?us-ascii?Q?osh8JoOiF6DDJxzfZvF2Wh+C5rWud8EHgOYLDKbhLuw8rFKQNeByfVnEW0nv?=
 =?us-ascii?Q?kXHYJIc0BO3ggV0FHuTGRwfWEFu7rwGLkT78Hmn6unuhTC5aHtHah1awtsPG?=
 =?us-ascii?Q?nJDB2IGkm+2R88Be0SjF0QgmYGazpWiPwS8y0SHQkc0Xdfx4+uA+CbJZKWWo?=
 =?us-ascii?Q?xUhCuDLdqd9qVyWIqAMw3/VAKfGLlmm7/smYJZzuMr9TC/YRNWnTUP21rI+b?=
 =?us-ascii?Q?iyTRgwBsGHbTiQk1Rnbyh82+mgXv6glX0gpu2fbE3vU0EZT5vwTzYGjp0wBF?=
 =?us-ascii?Q?pZ7US0ea06BAaH3jhsB45IIISMxEC+z7XzMJsu34YMYvr/Z5Dr5eO9Pf24YS?=
 =?us-ascii?Q?NtgzumRo6hP4UdZkX2xGz/dXA7x302NtttGRg7KMTwcRmQVFJrrPgQDmyccp?=
 =?us-ascii?Q?jlgUGEtJbqHuzZYSBfOwXDBV0bW9m4hE3F7QwCbgGiw6EDkQulPiZz0AUavt?=
 =?us-ascii?Q?SIxP0ePa56giCY+A4E2CHRMXVrxd+qT4tq3TB5G3k/ENtcdZr7yOvlKKINL7?=
 =?us-ascii?Q?lwqx04i0jweeMFcz4Xnlct+0An1DwUkxhVP6yBDWZKr8Z0q1wYqIwz/Xzuku?=
 =?us-ascii?Q?oMyyN1JTwEFaHpTCYL3OL2RtsHJfSvc6JX/rv+XioOLdguKCPRTai2Rk1++P?=
 =?us-ascii?Q?JmZsYRdWQs8tybKFoG+ubu4j/iZkIRGJdbx3FNHxgiJLkHMbnbLP9N2BbROL?=
 =?us-ascii?Q?EXYuhXTRPtMCPgCDLOMFdrigBTEupxBIaDTCw6hygMBwWLGsX+v6Ygfj235l?=
 =?us-ascii?Q?zuKKAFzY6vKIUC17pqEEn27jgELGMTDNCOSBLF4jG8Z4JDZDN6nkxE555Ral?=
 =?us-ascii?Q?3LNrfdUtrhXQynWp0IzMtQ+jbuUInl9h23cyDPPVp0zobivhHQhV2m4PLTKz?=
 =?us-ascii?Q?R29tcpo84gzCISDpN+ZGV+KE6kGfkpkHdntYO/TKTnkpwPWLWI49033/mlfE?=
 =?us-ascii?Q?ms4myyDTQBxl3qPxZshoivcizTb0XBFKyDkffMO+Dh9aKT2H0C25CwXm/PUW?=
 =?us-ascii?Q?6KZ/bCD8100DmEDJSdx4fAe0GDm8ijKT/FKqXNSkSGPTR7rruqt61UlzfsDI?=
 =?us-ascii?Q?2mhbgcf9JPfMjaFYyT3Z4iTk+7G3Uhos/wsPrdL6LPHaj6XsTzBO0hnANta/?=
 =?us-ascii?Q?hlHVvH85oCOlcUz3CRcwziSZndTu0c5shOTc?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(36860700013)(82310400026)(7416014)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2025 10:10:02.3888
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 069c8f04-0efa-45a2-a31d-08dd9e98fa2d
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00022572.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR19MB8229
X-Proofpoint-ORIG-GUID: HDLPdEsRLfg-Kx18tgHuigpIC930nwB4
X-Authority-Analysis: v=2.4 cv=TJNFS0la c=1 sm=1 tr=0 ts=6838327e cx=c_pps a=56CGH170AzJgEbcpeZoSrg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=KKAkSRfTAAAA:8 a=w1d2syhTAAAA:8 a=vWK7KZ5A0L71aprG-uwA:9 a=CjuIK1q_8ugA:10 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: HDLPdEsRLfg-Kx18tgHuigpIC930nwB4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI5MDA5OCBTYWx0ZWRfXyhB8s9FR5K4D hfaHkaPZbhTg/Jj2FqIA+AaojMqlz7HBfnmb0iKDpGMOabuWyjltVv4eU+ku7UDLQgAduNidWG4 Vy1/K0TOQZmRhCONInHuYzpJbYWlvxMZcmAzUoHwrC9fhVxeIOTLpCrdd+X+If8t1vFUK9A9hEO
 oGfThLqh0bE33B+JnofXorrApK2p25cFnKIBjAQv7d/Jg+ecB2woAM/JI1CwOzEA2CCds+tv2Zl 0cokBK6+naRQDztDPDenz9kwPrKadxInY0IT41ZXFHukb5s3Dy1bqsmebGNhNTdPiroa+uV435i nwovgBzWI207xBS3xpdxDJ8jsgufH6NnAq2D0P9C1EbfwQhinmoJww9UvdrYgibw+qEBU4cLxTz
 8qcDp6I2N48wQJ+8Ny8MVwPCpN6m11s6IWK2XrPkEPeWpUB6okdKOrDYqiiokZo/UBy+3/5R
X-Proofpoint-Spam-Reason: safe
X-Spam-Status: No, score=-0.7 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, May 28, 2025 at 09:59:55PM +0200, Krzysztof Kozlowski wrote:
> Static arrays/structs for regmap configuration like 'struct
> reg_default', 'struct reg_sequence' and others are not modified so can
> be changed to const for more safety.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  sound/soc/codecs/cs35l36.c        | 2 +-
> 
> diff --git a/sound/soc/codecs/cs35l36.c b/sound/soc/codecs/cs35l36.c
> index b49c6905e8727d7c07fd10e668507ca07bf2cff5..b60697ff7a506dccf3dba1b01faa985761bbbc42 100644
> --- a/sound/soc/codecs/cs35l36.c
> +++ b/sound/soc/codecs/cs35l36.c
> -static struct reg_default cs35l36_reg[] = {
> +static const struct reg_default cs35l36_reg[] = {
>  	{CS35L36_TESTKEY_CTRL,			0x00000000},
>  	{CS35L36_USERKEY_CTL,			0x00000000},
>  	{CS35L36_OTP_CTRL1,			0x00002460},

For the cs35l56:

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles

