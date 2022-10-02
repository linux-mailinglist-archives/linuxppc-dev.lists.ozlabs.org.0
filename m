Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB4A65F237D
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 Oct 2022 16:08:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MgQmD4lksz3c4x
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Oct 2022 01:08:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=Pw4gPoF2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=outlook.com (client-ip=40.92.15.28; helo=nam02-bn1-obe.outbound.protection.outlook.com; envelope-from=arminders208@outlook.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=Pw4gPoF2;
	dkim-atps=neutral
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam07olkn2028.outbound.protection.outlook.com [40.92.15.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MgQlV06Zdz3bVt
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Oct 2022 01:07:32 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aXRsph2NtmVXUa/koWRVZsLMMBL1Q5ITAehm1tAn+DgGxhnGN6kYhR/8LrMmN8Bsit+sRAbcVMSikSY4HkntEJ3ZBo20iSFyxGroLL9LMYmg047B336JohuACNUS3MOp7uyO2KpHvi4KlD/cQteue/yvNiZ/XfIiy2X1oKbI/seiqQufVFcEGe2AUkbS+JToMDi9YnwCsUOAer2gWVWbnU8MPuQyBiHvl897JEM1uc7LvOVg9ACq1uYnQ9s8PAnKYkOV1XmmcUI7QYmQXcECL/A2GXtQxBt9KHJGswfgzIbexrbEy3u9awbaQ1L/oohPxmjI+88L4wRt3zmv/G+pGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/D5xl303EL0HbIL7etvawYRskurBl6MSU3A0PXAZzYo=;
 b=HHV10+kaoYTanPsgeYuXkWKz3z75pKHUdDwDHtQCCtZTUtl6cPsZLpWCdzebpRO0CBLfoSaakMs8jGA9TmfkML8oh00HCD+JCFyQB3POAp/oyxuYV7wINTjvXcpaBy/OkEF+hjwbfkZU4kObyjOZnphYJhhAOjeGQLvQ4KBEQfdAp5OgPcrZ0SX4zpdOnhwrQcW7RNTSeRynbOMotzXyI3INSiASmU4LEne4jFajcEyMp1pPcPMr6SdMLiffEzsFQB1PXA5ftRRNeTpjHZReDY2qyvh1x+Jd+o22+JQu76BcNsNoMCMDN5zQbvAZcuHUMKuW2GdI//k2iMMYA/b4NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/D5xl303EL0HbIL7etvawYRskurBl6MSU3A0PXAZzYo=;
 b=Pw4gPoF2eWsq44S5KEQ+z1sQCpNDXF//ef9VF3QsmgA1NanBUEUow0vVrkP054zsHb4R3apstp7EYO/owcb1mTGkUBEB3vvee94/5qYbQO1te1f8BSW/YpBSh3yv2qe2gBPXLymvisSkJ9lxC+dy5yWAs3I7qzAZ+BH/jbmmRa/oaOEMjRwy4ttZs2DL5UNdNhl9a3bA5WjmrJViL7ZuXeDyiB61MwUpW/okwDTAFKzRT1/QnP+/dKbksPkT9F5r/RHLh2IkWzOl+T7CqqFUdedCTT2WZ+lC6Fuxnr+Gk9n49nvTSZy6vY345bFX2TsxNtfT7aIDBemZmOIziqeIdw==
Received: from MN2PR01MB5358.prod.exchangelabs.com (2603:10b6:208:117::26) by
 SA0PR01MB6188.prod.exchangelabs.com (2603:10b6:806:da::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5676.17; Sun, 2 Oct 2022 14:07:13 +0000
Received: from MN2PR01MB5358.prod.exchangelabs.com
 ([fe80::3c11:1e6d:4c2b:c8c7]) by MN2PR01MB5358.prod.exchangelabs.com
 ([fe80::3c11:1e6d:4c2b:c8c7%6]) with mapi id 15.20.5676.028; Sun, 2 Oct 2022
 14:07:12 +0000
From: Arminder Singh <arminders208@outlook.com>
To: wsa@kernel.org
Subject: Re: [PATCH v2] i2c-pasemi: PASemi I2C controller IRQ enablement
Date: Sun,  2 Oct 2022 10:07:06 -0400
Message-ID:  <MN2PR01MB5358FB185A18D2E6C22A45FE9F589@MN2PR01MB5358.prod.exchangelabs.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <Yzl16W6+poH8/8h4@shikoro>
References: <Yzl16W6+poH8/8h4@shikoro>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [9KxWHeWqI6chxxLtZtsB+njbTObPlx1Lr0CqowDc+LbBepkHpIk1UXFM3d79VwK4]
X-ClientProxiedBy: MN2PR19CA0027.namprd19.prod.outlook.com
 (2603:10b6:208:178::40) To MN2PR01MB5358.prod.exchangelabs.com
 (2603:10b6:208:117::26)
X-Microsoft-Original-Message-ID:  <20221002140706.967711-1-arminders208@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR01MB5358:EE_|SA0PR01MB6188:EE_
X-MS-Office365-Filtering-Correlation-Id: c2ca80c8-fcc0-4fcf-39ec-08daa47f6726
X-MS-Exchange-SLBlob-MailProps: 	YfhX3sd/0TVe5bVfS5Sv6w9/LBWDHjHOEXyhyzvk5VuQ7Rt22h/iNMd4FyhXYhREmWREvMapogTC6/LAC76PZemqtfubG5cmrtsMeZaRJCsVoS19aaOTIIqWmnqI6WAj4fpXM0qKDAFBS8xtJFRHyOR2W//vCaB3cmTPVRuldsGH+pL+civgeUpRxr3r9uyf7VgorK4R9GWDRDieKBiCTXCNR2K/eEjzbXFV2cABJQ/hCIzNqkaah/oYHdUX3lEskwQaL+E0YBg07F4gr1NJADdaagXPsZwNT5+HrqIH5sTJoN3jONDpLWowyfTuQp7Gs07+Vzd2N6VXUKDWQmWEx5qyyaDcxbQafzpud8nRywM3435eX8cjBe1tKKCf5R8dTt1qjEtR5koFTTkeZT3aauDJRgF7cT/KCs1XXvunvHP/CNNQeoDhJX+Uf9uKkyjfOJxsdH4AY26KP3H744djq5VghccvEmZaOYcEy/zmMMRAxfgRXNViHYK6Fk8aoGYSYGSU+kzg6r9PnuELZQheo9g1n0rQsFYonrkY8qXzw34VwiciVe5MaUw2uiP3PWBgM8mm2WoOwaP+bAohPjGJf+xEiaXJnHugZo6JIr2G8QxuhNbsWELNE2vHS3oSlCiw/Qv/lixNqRfJJbtUT+wWZjM8O+VsvyrHQIBV7z+Fm/AjwTHy0rq8NWR4K2unD1uXaSSRU850fos7POdz7hVARLFAK0zEYuAbL9VZO+5VewD0+c+2rc8LI2PNdHcs6t36/N6zmiSenw0s5FkX12lXIFvZkpyocMIHNSER6nQWwvs=
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	otsf82Vx297MCX5izw8OVcZW8HGK8+omFb4s/mqXd4TUoRxStqjGPO/qf6JS3RvbuPeG6o0WSLvPp+A2iTeTQWDJNu2YktPxgz3tuA6QHVvfDtRcXVNDZqTF340Expl383vH3uWUW1EJFw6xsXdoa70Gov7yaqvM7oas0wUm60mmZin+M2mbQEYQdBi9V+NpIp30ICv+3Qk32V31zodXrQjPqWgHisB+pp0GvthudSWvZLwBG+PFJb4AlmmZRTrCm/qnvVaaqhU9xQrkuXH6FRfx0MX06XnbXNdbZnJ6AHzaO7/yllHMHHR5JXab8VBDqShOXwVbYOMe4th/aJbijWZULiwDHhId/as76AriK+hccgT/gtjmyXBmJDog34n1KIOJqgJPmoGGcWFtFOCX5bSR97//er1I7+pQT+0nr2JHB60dcBos5RVWZ2MR2vP73TxDhiezxl2uFvOSkayUzUbj9we6Q5pM0ZR6jWqd35hsl4JGVUm1F5rVPBaG1WugBTnzwDfrDlr1K7LHg1WfUEsLxrBTBrqDYFYyqCAdjSHuWAMza8kDG4angCidhCmOooSEUqjN1Znk2WREPIeVmoRQnEpXsYXRDuJbscsl4qzJQ5Wz/Hh1s63NycqgPi4YY3Ch7CPsiSuBZ1QVyYSt4ZL3xX/fxzvVkCUWMyLCaOxYWXkAnl8HDvYtOoKl2NUdrY/uz+EYniShYV/i/8/rGLOzN47GIBfboY70vEYXtY0=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?DTmr9nslFzbP2oBjnR5vHwGNx+uTOZmg8Y09HW0DVQPwJesmXWa5qTBsFEFI?=
 =?us-ascii?Q?PrpMj+e9ko7mQMZETI+moPnpFgejFnwfViYBDPyrCbfJQBl2W5m533Vo2xWY?=
 =?us-ascii?Q?yv+GQqGRX92TT4LxCED4Jy7HQAWFZjNDSgXxSr/A4UptDv1BJxIXC09uO0ud?=
 =?us-ascii?Q?8VRijufHExzY5h5t6KMQF3fhwVUCaRWx4C6oajO+uHsbD0m0qYiEB/OndPPJ?=
 =?us-ascii?Q?Fr91xtz/1Dt9QXZ+t6L2yYoHR5k4/644oEitmikv16sXhjeYIxTkmMpSNyJr?=
 =?us-ascii?Q?R832r/Mp1A6FFAJHgukSG9/gVEtj8BiX/WVi/bEi3UQCUHy0EUsyB5pFkaRx?=
 =?us-ascii?Q?4tSdC5jCb4IVbbkWc/TA2v12+v0ycy39gegPhrWtJqMODShvJbW9iPlnbO1l?=
 =?us-ascii?Q?2cJYrM7/KcTrvgt0Spu+MlGPi/p0XyFW6Gm6Piz5x4naHyxRXMrySgTK1Wgb?=
 =?us-ascii?Q?Lj1w29pqhHj6g3KtMhl+QGaO0JVjVsbx0R+b42bL+UgMGw+pBtOXRp/IdOqT?=
 =?us-ascii?Q?VifhhnDoJyQq+cWMAaCiNsRHdbLRbj15QUiyRv6k2RHdYGtl+hnt+zmTtc+8?=
 =?us-ascii?Q?wSpBKEUgTq7OK/spI01c4GwTJLHef0zc1q4nA5BNPe9HRhqhQJC1+XoYonP3?=
 =?us-ascii?Q?XHUSuQP4ulI3id5xW0p2lrxuVKdb+B1utTpoHKalSk1guSEVYbFFVtgTqriS?=
 =?us-ascii?Q?Onom56F1s+gb4Ds0bYcReJ5mF5yhAb8DToldDyc0ZoM8TVTuu7WGxhFghFFF?=
 =?us-ascii?Q?lgK0vNX4xbeEPITEItrFgyX9ab3+iBh7KgETmS/alek4nz494mf9zeOjYux2?=
 =?us-ascii?Q?WFiAIc8paSEuA/k42N9X96QVSExw8Umcw9KKw+A6Tyu34Sx+ocIoDF3SaGJq?=
 =?us-ascii?Q?0eFNwtO1g0MIUN88hgGAvNFdoFLhZ2p5D6jhr1aWr1UWuO7cthkPJBKPT6pv?=
 =?us-ascii?Q?aOay/mjt5jNdR3su0G7nYNF5UWrs9/s5HnzQ4HOzSCIvUZ2yxVXnVc8Vprga?=
 =?us-ascii?Q?o09nxe/kYLCcRKQ+uHrrRmZdiEcxy2voyBf/+FAgKL2T5l8+OjbAIW8+jwgh?=
 =?us-ascii?Q?tNhSHeZlZgHB0BMCQxjXHvnBfzYBQdWBkwq+FF2sIDSTwpKp81UDsmrcDsYI?=
 =?us-ascii?Q?CalCkbkqvw0b8cfe5BP4GlaOyqGO/IserjzeOgbl64XcPFQZRi+87si3W8mc?=
 =?us-ascii?Q?W9x/0o+FfrKSv5WOCADMmB0qkkYL13vmM3Vj6FGmFwUkcLa/nohsEtO1tdBG?=
 =?us-ascii?Q?cELVpWx18rWFMT8i8x0NR2iWrhRX5CO7rd9oZXX4L2xT9ImQ3Naid7lLbK1g?=
 =?us-ascii?Q?2Txn8rz9fI+xATCSUHV1RemWuXH70+L7ut4RLwUwNv+7Ow=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2ca80c8-fcc0-4fcf-39ec-08daa47f6726
X-MS-Exchange-CrossTenant-AuthSource: MN2PR01MB5358.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2022 14:07:12.9081
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR01MB6188
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: linux-arm-kernel@lists.infradead.org, darren@stevens-zone.net, sven@svenpeter.dev, marcan@marcan.st, linux-kernel@vger.kernel.org, arminders208@outlook.com, paulus@samba.org, asahi@lists.linux.dev, chzigotzky@xenosoft.de, linuxppc-dev@lists.ozlabs.org, alyssa@rosenzweig.io, linux-i2c@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

>  #define REG_MTXFIFO	0x00
>  #define REG_MRXFIFO	0x04
>  #define REG_SMSTA	0x14
> +#define REG_IMASK   0x18

> This doesn't seem to be aligned correctly, this file seems to use a tab
> to separate the register name and the offset and you used spaces here.

> @@ -15,7 +16,11 @@ struct pasemi_smbus {
>  	struct i2c_adapter	 adapter;
>  	void __iomem		*ioaddr;
>  	unsigned int		 clk_div;
> -	int			 hw_rev;
> +	int			         hw_rev;
> +	int                  use_irq;
> +	struct completion    irq_completion;

> This doesn't seem to be aligned correctly and the hw_rev line
> doesn't have to be changed.

I'm sorry for the alignment issues in the patch, I genuinely didn't notice
them as from the perspective of my primary editor (Visual Studio Code)
the entries were aligned. I just saw them when opening the files in
nano.

Does fixing the alignment issues and the commit description justify a v3
of the patch or should the minor fixes go out as a "resend"? Just not sure
in this particular case as the fixes seem to be very minor ones.

Thanks,
Arminder
