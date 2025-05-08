Return-Path: <linuxppc-dev+bounces-8443-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E44BCAAFB63
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 May 2025 15:32:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZtY334KNJz30Wn;
	Thu,  8 May 2025 23:32:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c201::1" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746709624;
	cv=pass; b=CHlQgXpvSPC2k/Llhg4Rm9VyuHGh+doskCuPeHYYZZO0qzpwWO2vkkopzh6VhNdrksczWPeE1nlnnLVWPPssEYZ7Obhym+XeN9yS+bKU3RBHj/MFQZHxx3ZFsLf/jrAwBtC33ZxAGIV1MSNN1Ovn0Q5otFJG/2uG1Pf9mbiq5jQOsIcclzj8KXoM6vgQCLCVDAkBpTe9Vc2AsvdV4iTGn16WUrEtakIxREEUPsNAFbDuiSz6hX2+DD9rsWxMyr97d8/hVlnM7+mduSWDIxW/U1OIElq4DQeE6epSvggjuY4kkaq+AhAKnL5/9Ijoe3+t5+yckDxh1rBtfcEiN66A1A==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746709624; c=relaxed/relaxed;
	bh=yP1+b4a/jprhbCwiHbwvZ/V/bgapdxOebcr2yuOU10s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eEgFioKGwKHiGFAX4zP5OLalJaVui3NG6kgUfbmKipq81H1wSGVq7/Y3X/inStGafDsPgyU2RpAIzjvfFg5ZKKGo+tGU/f+pwxjEccNW/H/4wwrFTpkeg8DdhqwtdLYmrBY1TZ4+VZGumkJNgr8pMsV91My7y/EPtmnjKN1GsqPPcUE50UUQzo53S3spTALNq7Sx4EDLgJqqx+kkyn1GI6yQVJKlDI2OrEB7a7g0SHCJ7r+eQzp0XVU7sn6X8wzbjqALuA+pMTBBsKjIAHxb8gLoLjo8Jd919NdrNdHzc2rMkZn9pT3D6XbRYSBdo2tEKStwAcq7RujWbTWX/ysOKA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=mt.com; dkim=pass (2048-bit key; unprotected) header.d=mt.com header.i=@mt.com header.a=rsa-sha256 header.s=selector2 header.b=bK4JCmUd; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c201::1; helo=am0pr83cu005.outbound.protection.outlook.com; envelope-from=markus.burri@mt.com; receiver=lists.ozlabs.org) smtp.mailfrom=mt.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=mt.com header.i=@mt.com header.a=rsa-sha256 header.s=selector2 header.b=bK4JCmUd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=mt.com (client-ip=2a01:111:f403:c201::1; helo=am0pr83cu005.outbound.protection.outlook.com; envelope-from=markus.burri@mt.com; receiver=lists.ozlabs.org)
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazlp170100001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c201::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZtXTh0vtCz307K
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 May 2025 23:07:04 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QJPde4QvM8ENV1ym6i8ETnl8WMdGqyyejpoDWYpZzpkuj5j5/BjSy00RCoLo3g9zEDTgyb45IxS2RQ8Q6Li69lednXtCIXt1Nw1TPx058ldqecSKBkP2v1tCsnihwQfBif68sXg9hrMahNCxGEFlJU66lAzpFt4N9HjYkQNRQ1sOJzFcsr4YQjFXbtnztox4vXR9WntSNPPf90hTWyj9DgJ/CnodKHpPzE4Fmv7CsYvAV5AsvunSHsowZVpgns1byW5jmO4kcR1gGWwSEDDkNaJvjFY2SXxCRRqzsAHysiFYLzOyDubGI7yyjtvyAGh+C41BsU4IzT+dZL/HJJ7QCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yP1+b4a/jprhbCwiHbwvZ/V/bgapdxOebcr2yuOU10s=;
 b=dOnCfnSYxajX92CeRnRR+eLAjNLqR+ZLKhjCNe2lbGbEwiCDve7UkngRr3VUQy4Sgx5vBLXat0oCAaDZ3VJfiFqZJef02qi3zShSyRvnNVdfsB79MLVI3EHi6EJtCM5ZNHLb4nqI/+xWlevT5be7HYwfuArb+tCA1JTmP7JtLbGAwxSMHhaucquNV2XO0w75NuLaPUs6CxVvCr8u8EN0Z9AfsnXFFofDo2vzFOo/c5pBzXNIRW2vq0oLryduwsAwEJhoFo+cpKA+HzFjAZsrvJbolPgssnG53JcTtM2cBcKQXJnuar9JMjRW9mDL9GFA5yTRpiVgiWejRW4CvXt7pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yP1+b4a/jprhbCwiHbwvZ/V/bgapdxOebcr2yuOU10s=;
 b=bK4JCmUdwJVHAq5YOKyguMfiVYTggJLltbA7MbTwDlXEx5finKD5a70oCYL3X5Z0C9j6w4VJcaWixjhwoP07DRsf+veGRPlanTvKde7Oap6geqmA+46KEzHoV5bQzLBL9mvpIqQtA17amW+OgG1LmQcBoNZrjgOiH8Ck76DuV5vlyyeP26anDq13jo0Un2EMNcVh9kDHv/C56LoouJ557wZJyPjnJ2pMlul+1U6e1VdhlHytTNchMtzg/fObvx7eNGKvxhNg+oC8SNDJPtBHv4oAH7i6eCmuCcOm8whgVL4D0TH7sDtzrA6BHiH+zdRde7+8CJbT00v2CtCfT/kEEg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DB6PR03MB3062.eurprd03.prod.outlook.com (2603:10a6:6:36::19) by
 DBAPR03MB6439.eurprd03.prod.outlook.com (2603:10a6:10:199::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.21; Thu, 8 May 2025 13:06:39 +0000
Received: from DB6PR03MB3062.eurprd03.prod.outlook.com
 ([fe80::b201:e423:f29:53b]) by DB6PR03MB3062.eurprd03.prod.outlook.com
 ([fe80::b201:e423:f29:53b%4]) with mapi id 15.20.8678.033; Thu, 8 May 2025
 13:06:39 +0000
From: Markus Burri <markus.burri@mt.com>
To: linux-kernel@vger.kernel.org
Cc: Markus Burri <markus.burri@mt.com>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	"Oliver O'Halloran" <oohall@gmail.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
	Maciej Falkowski <maciej.falkowski@linux.intel.com>,
	Oded Gabbay <ogabbay@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Nuno Sa <nuno.sa@analog.com>,
	Olivier Moysan <olivier.moysan@foss.st.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	linuxppc-dev@lists.ozlabs.org,
	dri-devel@lists.freedesktop.org,
	linux-gpio@vger.kernel.org,
	linux-iio@vger.kernel.org,
	Markus Burri <markus.burri@bbv.ch>
Subject: [PATCH v4 1/6] iio: backend: fix out-of-bound write
Date: Thu,  8 May 2025 15:06:07 +0200
Message-Id: <20250508130612.82270-2-markus.burri@mt.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250508130612.82270-1-markus.burri@mt.com>
References: <20250508130612.82270-1-markus.burri@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0057.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:21::8) To DB6PR03MB3062.eurprd03.prod.outlook.com
 (2603:10a6:6:36::19)
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
X-MS-TrafficTypeDiagnostic: DB6PR03MB3062:EE_|DBAPR03MB6439:EE_
X-MS-Office365-Filtering-Correlation-Id: f45ad1aa-8e33-4d12-3f7e-08dd8e312bbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4g41KD/BF1zGc9DaCRQo0rmIo330lcFNUi5soR97oISUrBbJO83bWn5qDhdo?=
 =?us-ascii?Q?aig04D4w6jvnsDXyiB1vASF6WeQyUXXu/sGjMh1fJgnRsWkXUtF2FHj/NH9j?=
 =?us-ascii?Q?DGzuYh1zJWbxbiBZQzVzq5r36PwH3YXEaCQghA4pooV41puaNmtA7d22vER9?=
 =?us-ascii?Q?8SNnP/q3Ouk9psrZHLdvSba5b0z3+enNsFJ/wJov6NX4gOk2EDQWLmURFe9y?=
 =?us-ascii?Q?RHUvllyKhfl3ikl+BFvtWGi/g/Zu1UFcVWVGCVDyzoPypL0mQLlJ9GhIb+0G?=
 =?us-ascii?Q?XEq/YYJeQw+bI3KGeKEI2byik66Rv/ly0ciAKJTi+ZS2ywTf+6a50siOnslf?=
 =?us-ascii?Q?t1rfI5y9kProh9yl64TENwo0B3mWtk/GpB40Skw9clBlvct1m711eWHXyj3V?=
 =?us-ascii?Q?whCzr1jXwUsmZv84KPk37sNrJyvgMqrbB1lm3McudQBYTiuJ78t7cULOD4NV?=
 =?us-ascii?Q?hUVa8FxdP6YXufLOH/NxjkCSjAs3uuw6wdRLTEWr5Hti+miFKUUJZudIRJgi?=
 =?us-ascii?Q?IAd1ZIT+l++WNGzUP+RUZfxIm6wF4kkVKRs/JQlT/5YdudSVTGuAAHUjk3Kd?=
 =?us-ascii?Q?X66G7O5eYRXXRXAMnWwvXPbxq9RuDlSMBjQE/3HKB3zEx6N6lQIJbFlYFb++?=
 =?us-ascii?Q?5rln8n52E+9eEtT/+pYxawtRCh2U+sFCvTB5QlU+GyBCbwkQZ753YcuW+oW1?=
 =?us-ascii?Q?puH54z8uZ+tnlZhb4wHHeh70OFVHOjKiFY9bBIP9COFftdWh3ik2w0cyqPGu?=
 =?us-ascii?Q?ypByPa6+EVfCqY7HoKPvSuFGI1AaQYGVv3qVUxV8T0Vj3AwrvhSXGeSHB9F0?=
 =?us-ascii?Q?arVv+0/2nKjqQY/iw3oDQVkEPQ21H3ssDyrZ/NxczYljs0ivgpMTX73BA1e5?=
 =?us-ascii?Q?FNDQyGmlt83Za32yanlJB+ezSma0aOxtzbh0ELQwQ36JQ3nXN4nnh5pNaN5A?=
 =?us-ascii?Q?qQ4EZDa5WSKUuc4FQLiqy0RZucDC38hDkSeoh8F0k3yvPtgKMI882dTV2r+N?=
 =?us-ascii?Q?mcwDfe9LA5/peGUJDTsQeia9c2qQ1WaboI1NfeuTACxuaUCf6qHdCQrSx/UB?=
 =?us-ascii?Q?JoLRRC6fyhTsWpZz2594nZeNUIwXOZdSlIQLrxbAGFGYwNEjbeGNk0ByihEf?=
 =?us-ascii?Q?L4R8KYtGDgYjy74KAaP7iitY3tf2jTXzSfd3S+3aIX+1lL5gem4B9jbiaHaN?=
 =?us-ascii?Q?fHNDQseHwqnhpamIyptw8fHO3e/HEQwKOZB3iM7DeufdnikkUrWoS/VQuNYf?=
 =?us-ascii?Q?2xPIvhiaN+lxmWJdMcpLnS5Yzgv4obzJ9cB3llmzibEnyVragQW/L0SMkCm9?=
 =?us-ascii?Q?VOnlAfsu63r3GhikfbQbL6wFrIrUHwAgzM2knBv0Gy+3lJoljeEbANS2ErRY?=
 =?us-ascii?Q?qLuOE+ArQMwQJUwJJWRzyUczjZ4yahJIN9GbQqU7aSpycq34wX8yj/IaWe8j?=
 =?us-ascii?Q?oD0WVIiw3Yo6It2p6NedSpvaI3ibu5N/TA/PoRywRTqWkDJzxHfjag=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR03MB3062.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wcd1Nps0LT9CQu2M341ZLDlp6TBWPhfTaQ3GTBsNOrIMU88ZEnOhnaILtzZo?=
 =?us-ascii?Q?PSgiOdB42rD2G3Xpbhqwcs10OQH2um1JeIbOsYrhPMxTzXpg4YZHJMs5svAt?=
 =?us-ascii?Q?F6APvxpWuLfBY2PqNjtb4e/+FQ5dqImy06H7Mp4sbkWnfFHLVfTvuaZMqq0O?=
 =?us-ascii?Q?DKEVzNGLHJcxuclXcSOWejpuvgf9KXRRRl1QgMRfepatuHsaGnpnN8A1UvNz?=
 =?us-ascii?Q?V859SAooaYE0tjgZCVbBE0up2NEOvtVBPufSt66MZ+1zDIzKPGryoJS19J9S?=
 =?us-ascii?Q?xAiPQdNBmfqsYWYQhDP4jrF58ZMP6lsjqjE4NnkHqAhlLp98+me8yje6PUyy?=
 =?us-ascii?Q?LKIbWCuw/a4fBmAduK83sbmupVR2QxjP/bFUIGbeOEmoIMfILNo4m1Oo1X/G?=
 =?us-ascii?Q?8DJzIfWZLMlkumq1d1/AxoRCy5fHCjL1JM8I9NYa68r99hZmWNy9FECjRw5p?=
 =?us-ascii?Q?oSE4L83+oZXSgaj9e+WyrW1hu7opEdliN2zJWXj7gmD9Fu4KpW1YPuipBGP+?=
 =?us-ascii?Q?J4saLS8LkRoujbif1edb46tch6XayG2lIGpofxsZ7FvOt4pFJAgf/HA/KvU6?=
 =?us-ascii?Q?ZVVt0KINzivIRpjfrJsIH9VE6NVC6/n4bbGfM72Jr1EHZaDPz753PG56ymav?=
 =?us-ascii?Q?X+WNXlUTpGRh1O3FkJv2GSdRTsSkMmL8xsRiAFY1+Aybi8NUATyZc9+bxBXI?=
 =?us-ascii?Q?Sod23c5sApvp/7/abagL98HfQF6ycJgONildI9UwNDwc9zJzumuFctPvr8Ix?=
 =?us-ascii?Q?zAcI3iDYdl0NnbgSDVNQN17ZCrGu6CWgqXg8xslFPLeomdffX0L6Y65DAcWz?=
 =?us-ascii?Q?wcHCSvUdliQpMlAcW8SOgmLb/2YUJE+Gj1N8Gq1fXjar3oGf0lomzc7FGi7k?=
 =?us-ascii?Q?wL1J71lq/AzTgw+eb8/dwmN46UA4UrSwZhFvR2RNX2BMDFl2qXHQvcQifFQm?=
 =?us-ascii?Q?6X3Wk2xjGR/o3nlbYI4LJNmnjroK40wZDf2gFAPS973TrdCRFHtOOhemddCx?=
 =?us-ascii?Q?7NiFQbS+P+gidg1LKrc1uaVhsma0UYauBCVZZT2OPLOZl+s0b/EjEDa7t3bM?=
 =?us-ascii?Q?+80IMkF+buHLXRVo+V01QtDTtn3qj3JxrT7kQhJE6AoE28gZphynCku3T5Us?=
 =?us-ascii?Q?pZAFyLVo5h0GPGg7lCzSv2gKa8lsv7r7oC6VptQttiLWIL3cKAsHHS2jtcn9?=
 =?us-ascii?Q?WpbQlkmSdxCJaWA4uvTfBtkGot1aVkDbZ9i+4z04haEcIV+5JA0fKul9NHVb?=
 =?us-ascii?Q?xHuW5TdMmkyG43pxkmvzqmDbNkMeoIhuqCifzrVfBYcRH3CV29qR7mpYIGB3?=
 =?us-ascii?Q?6SOdbjGcqB3tEMem2Nh+BbShaT9STVirgFLDrGBfnOhGITj1sizsfPOH/+/M?=
 =?us-ascii?Q?R7167k2F4/eulV6IH/Ly/V2u46JPpYqRSWFPH7mPQuarwMnUHlpoL1YU5dXy?=
 =?us-ascii?Q?I2vG7lMeOdCURm6C7/av0bxb20k5BeJ7YGOL0fiKOUATpFork2ec1sp2t5dg?=
 =?us-ascii?Q?ilXS4LVfBFOMMD/sa8+6+9cLJY4jh6p+Nv/BumHNMpO9DJDTr5AJzhGP+9Mc?=
 =?us-ascii?Q?9no4TBwqoq1yB2wBdvcn0f0+KebvI1iiJ4VXrQcP?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f45ad1aa-8e33-4d12-3f7e-08dd8e312bbb
X-MS-Exchange-CrossTenant-AuthSource: DB6PR03MB3062.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2025 13:06:39.6591
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: glK84L5gfgYhCrvlnnvmVZ4Oq0OK22CGzEffkaMO+ezr/VGuCH4fohYe0u49iWdnoMEt9aOub0HzgDBi3UiqBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR03MB6439
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The buffer is set to 80 character. If a caller write more characters,
count is truncated to the max available space in "simple_write_to_buffer".
But afterwards a string terminator is written to the buffer at offset count
without boundary check. The zero termination is written OUT-OF-BOUND.

Add a check that the given buffer is smaller then the buffer to prevent.

Fixes: 035b4989211d ("iio: backend: make sure to NULL terminate stack buffer")
Signed-off-by: Markus Burri <markus.burri@mt.com>
---
 drivers/iio/industrialio-backend.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/industrialio-backend.c b/drivers/iio/industrialio-backend.c
index a43c8d1bb3d0..31fe793e345e 100644
--- a/drivers/iio/industrialio-backend.c
+++ b/drivers/iio/industrialio-backend.c
@@ -155,11 +155,14 @@ static ssize_t iio_backend_debugfs_write_reg(struct file *file,
 	ssize_t rc;
 	int ret;
 
+	if (count >= sizeof(buf))
+		return -ENOSPC;
+
 	rc = simple_write_to_buffer(buf, sizeof(buf) - 1, ppos, userbuf, count);
 	if (rc < 0)
 		return rc;
 
-	buf[count] = '\0';
+	buf[rc] = '\0';
 
 	ret = sscanf(buf, "%i %i", &back->cached_reg_addr, &val);
 
-- 
2.39.5


