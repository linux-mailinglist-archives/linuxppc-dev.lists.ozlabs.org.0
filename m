Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BB79992666D
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2024 18:52:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=rbgTWzmx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WDm693qrHz3dnN
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jul 2024 02:52:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=rbgTWzmx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2612::611; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on20611.outbound.protection.outlook.com [IPv6:2a01:111:f403:2612::611])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WDm401005z3cXM
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Jul 2024 02:50:24 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cMItv4Ekn8MHEme0WhPl2YP3LUgzWlZKf+OVN7lAOToRfpDhxMjBUsxVroWZ+WXTFlejzO+U2w7TmuwY9GpzQch9l71k9CHK5dE5FI40lUGCEKQYuYjdLHrMn3mVdOcLQWlwSsV1qGANx1v9OLHkz7WvIRJNFLCYfvK5KfzQWvIgUrj4pEDhGrZUQZLX8hvTEUfyfl8AqKfzISr6UBTQWyD1kO06dbZmCcjK29IAWaiYm2V2Us5yHmcV+JgKbvEEmrDkEVWC9RfSny3SfznVTGA04Y3wedfeQECitnaXb6O6UVesTivcjeNNAEH2wILHl7RCNKSynxvywvgL6Zlq0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dw+67fG3BihDeUp9JX05SFTNRFhuwfHJXo6H7JbWLRg=;
 b=G7qYyOgYgb19WNnzSRREnclJEvJLnpWAx264Jj5m0nXPjB/6CMnINcLLs1dp2Ir3pQM0ZlIYXIMaOz8Sp7v1toZaDLBHV2UBSXv54hFD808/U1nlR89nMr0DNUQMQWhXifT10rgtWXCQvS9MBXmc/duFKFjKbhh3pcqbkxIrWmTcnAcNLem65RN7an+fauFViCoM5USAHLVAQBJ89W/n5wpmFHSMBK3R9nYZCXV5DcBN2BeJwmaPIHqrjgPkvvFT00Ls07AOaPql2QLVm6anx0O3DXKccT9AfrZStZT0eMoAmJO6g/iAGSrwWlVDy/sXv0nNoZ3zWuzs5ZVM/irzYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dw+67fG3BihDeUp9JX05SFTNRFhuwfHJXo6H7JbWLRg=;
 b=rbgTWzmxubgDQTeqmAX1PmCmM/5DgmpKItfllcxrV2O3gj1fGMC4dfabUVa8wrKQxvY8Lu1XvFqrO7dTJcjI45br1srHU0khEQ6S1UQGdPWoP684amH9rppWmZdh4Mzdn2vnYIML8hZLunEWp+bd8HdIWsfE/xy9Bk+o0nKQvXI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA1PR04MB10628.eurprd04.prod.outlook.com (2603:10a6:102:490::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.25; Wed, 3 Jul
 2024 16:50:01 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.7719.029; Wed, 3 Jul 2024
 16:50:01 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Wed, 03 Jul 2024 12:49:40 -0400
Subject: [PATCH 2/2] arm64: dts: fsl-ls1043a: change uqe to uqe-bus and
 remove #address-cells
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240703-ls_qe_warning-v1-2-7fe4af5b0bb0@nxp.com>
References: <20240703-ls_qe_warning-v1-0-7fe4af5b0bb0@nxp.com>
In-Reply-To: <20240703-ls_qe_warning-v1-0-7fe4af5b0bb0@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720025393; l=3115;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=YNfDOgvKBz+51aRbHkJULurGisTUMUL2yWy5foIcNTg=;
 b=Cwzit/w7KI70nwSh4HWc6La8zLfBe7lJwNChNf61/dRD+iSFOHlZkQkWb/qZJEqCoBI+wJaTk
 PdjE9Cy0hCaA7Oy0oOLnciRuLUxxoGTT1wNkOJUGNngAPPKBptVObhr
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: BY5PR17CA0010.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::23) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA1PR04MB10628:EE_
X-MS-Office365-Filtering-Correlation-Id: d1259b94-1e4a-497b-47a0-08dc9b802e6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|52116014|1800799024|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 	=?utf-8?B?d1FSblJTR2VRK2xGbm03N3M0ak81cXRKQ2VGa2lyUFZOSW4wZzB0QkFZRXVQ?=
 =?utf-8?B?SmdiU1Ira3VuTU92TzhCMk0rQ2dXeG0vOU5XUi9xd2hYUlpGWE4xNThBZUFM?=
 =?utf-8?B?aDlnTFhUTSs1eVpNYWRnOXlaQ2EvVDVtcFhPcWNySlZ2QzRkaHlmR2VtaWRF?=
 =?utf-8?B?dU1KcXpINWhPQzlienhtU3N3K1VlOEtDQm10T1lDMTJxSDUydWUzUGYwTHd5?=
 =?utf-8?B?ejNxL0hOTEVxVCt4bER0OWd3MlJjWjVzSkplTlFjS0JzbkFUNXZIT2hydkxR?=
 =?utf-8?B?UFQyN2UveEo4N212TVh6ZTQ5VzNZNWo1R0N4Y2pzMnNXc3o5bEF6SnlZN09B?=
 =?utf-8?B?Q3hRQW4wV0xYV09ydHFSU1ljV1ArbjNpZ09vaStMeUtRa2puUFRWeFlVZERo?=
 =?utf-8?B?RU1DREZnUk82VWhKb2NOQ2hwT3phUWt6ekc4WW9idk1GRS9UKzU0dTNRNkdX?=
 =?utf-8?B?ckhXTVZKWXBaWFFoYmRCK0lUa081UkxYN2F2N3Axa2txYllrNTFLMFZlbFJK?=
 =?utf-8?B?ZTVOUDVGMjdjTDdOUHkxME96OUU4REpOQWE0YXVKd0FsbDFlMlp1Zk4xTXQy?=
 =?utf-8?B?ZithYXhUNzA0N1V6VVhtM0VhZzRKTDBZbnZ1WHN1dlJHbWZGdlh2b1NqUDht?=
 =?utf-8?B?OTl3d3JGR01wWFYrbG5YM20wbGhjTUZXMEJMZ3lPVDZaSTNPWTZVTkd0Tks0?=
 =?utf-8?B?bWx6NDB1NlN1S0V2MzFjelUwQzJaemc2NGhxVjRlN2hON0xyaVMyamlqc0FT?=
 =?utf-8?B?TGh5V2FNbFR4Zkd3K1dNODFyY3REM01rYmJtSEVGc3dUR2JnamV6djh2eUxW?=
 =?utf-8?B?dTRueGdoTG9oeld1eEI0eVd5VFd5cjB6K3VPQ0pGcFQ5cmtDR1N6Q3M5a3pR?=
 =?utf-8?B?UWFwak0zbzJzNXZCNHRmYjVVMTc3ci9KaEZrSEdLYnRnVGRzdlNPTU5UU2Rq?=
 =?utf-8?B?MFVzYXpZVkptcnpmVlZqcUdXSmx0TWk1RSs3aVdWY2JpUVNJdUZSdE5VWm5a?=
 =?utf-8?B?Zk1VS0hLN3l0Q1FMbVhVUGNwNVVuR3IwS0JydW1lYllxMG03OWpHZ2QyTVkx?=
 =?utf-8?B?QzU1NkU4aU8vdWhPUnV2WkdNaERqVEREQUd1cVlia1hyakloSXdibm1vemxx?=
 =?utf-8?B?ZGpzWHc2aGptRGdHZVRXVlFlSW5jNm1iSlZTNGo4RW5RZ0RMUFl3eURPTzF2?=
 =?utf-8?B?QlNxVUFhNVVodmQzMENBaisrU0NhRlM1cUNEWHpwNUtXU3lHa3hFR0tnZno2?=
 =?utf-8?B?T0JvVC9CekhsMDdudWhLcmpTM2ErM2txUnZmOU9iMWxiTmlMTEEvVUFHQmYv?=
 =?utf-8?B?V3BTRzRpQ0U0anpGeDdPb2s5V1htZ2ZtL0k0ZWZ3ZkEvSElQVDRYc0VKcHlE?=
 =?utf-8?B?cmR0WXdHOWxYRGF0N0g1MW5La2pveWxFWVZpMlhYbVFZV09aeVg0U1pXa2sx?=
 =?utf-8?B?dXEyVHdRTHExZ083UzdoN2JwR2JCblBoZEtqcXFzRTFLK1dHSjZ0T3VtZjgw?=
 =?utf-8?B?YXp4SEN6MGdtVDJ2Z0YyYnh4ZnczVldRbFhHMVZ2MUF6NXp6L29PR2o1MkNW?=
 =?utf-8?B?N2ZwZ1ptY0VkNHRLL0RYNWY1WENTbkZuSytWYXIwUTArclpvVmk3azVPaUp3?=
 =?utf-8?B?WjJwMmwwYllhbWpybnkzMEs1NHdZRmFBVHo3ZExLay91di9pWXlXcVNYWFdl?=
 =?utf-8?B?elpKMU9OaWU5RE1BRmpPK291VUJ6aEkyYU1DOEJrTkE0U1V5aG9YakQrYWli?=
 =?utf-8?B?Y2lQck1PV2NUSlVzUnBXTlBsTzl3YkpIMVZhMDZWLzZHY0JxQVFrQUU3UFdY?=
 =?utf-8?Q?F6tsqdbqaNatvuYVRUxpuDVyPrhmZiMrmGTC0=3D?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?ZThhcmZjQTBwOC9rVU9zaVRXaVdCaEtLWU5Pblpsbk9KRzQwUlRoUHFvSkpj?=
 =?utf-8?B?NXlJV2tSUHJ0T3Y4SE1SbWRWRkNMdWJyMXY1QVZYNFZkNXZrUTQvWCtnZ1NW?=
 =?utf-8?B?dFBpLy9EN1l1QnUxMzhaSGVoY3NPMlczVEdUV1J0ZllNbHo0NzR5RDQ2TkIr?=
 =?utf-8?B?d3VEck01RkJwdjBhbzhhU0NDUUFiYXU0UEQ1U0dTaW5mMERQQmpzd3BpaG90?=
 =?utf-8?B?S3YxWnROb3d2MGJCTUVmTHVpakVmTVlqVDdxTXNrV3R1WTN5azNJS3lDeVdy?=
 =?utf-8?B?WnZ6ZzRRbHZ5L3pxTkxKL0piK2orRW03cEQyUWpyM3FLSzZYd0J4UVl3YVBu?=
 =?utf-8?B?NWc0U1AxNC9kd3J2dFBTNUczaU05bnNraDJ0UkJkblJ1ak01MnpYZTNqRjVB?=
 =?utf-8?B?WGJOOWhtZUZGMUFQM2NsamdoV2hWc3R0T3Z0NHFtaTlQUUlVVTl5RVdjdjF4?=
 =?utf-8?B?RU5vbTRGeGpEcGpzS0VZSXN5UkI4NXhrVEZzR3FMSUw4emtUZkpqeEF0OG4z?=
 =?utf-8?B?d3R2R3R1S0V6VDd4TFpubGQvcjNEelR6OXFUUkI5OXJad2dZTXk4T0hieGcr?=
 =?utf-8?B?ZXUwK2htL3hXc2ZaZ1V0c2pxQWVmZ0Qvb29aY3I5UG5DZlpPWi84ODlxWU45?=
 =?utf-8?B?L1drMUlJTUMzVGl0NTZHcTNYN2t3TW1RSnBzUUpndlRWdEJHS3l1aTlBMHFT?=
 =?utf-8?B?b3J6Z25sT1N3bFNibDVwT0Z1R2VHTHRsYkRIb0dkWngrU2xPbndaSENBb3Vp?=
 =?utf-8?B?U2ZCVDZCcGwyMWFSeHhIa1k3R2hFcHlscHZXd2ttVUVQVjY5VnViQi9hSkNk?=
 =?utf-8?B?QlVVamRnWXJEdUN0VWJud1dDc2xvdWo3eTd1RVh6djZYcFFxRW5KWURLY09U?=
 =?utf-8?B?MjlDU1BPalFOcmJoVmR0T2ZuTlRzUFVuM0xIODg3U3B4WHo5L3J6NEdZNnJL?=
 =?utf-8?B?VzBieDl1RE9walVydldWRFhCYUZEZmFFQVE0MGtFTHlESkhBV3p0QWUwYU5K?=
 =?utf-8?B?ODJuMzBKbURoRzZ2dzh5WkVwSzVnU01WMkdpVktaRUZIS1pEWHZlaE9QZ3Qw?=
 =?utf-8?B?UHBHUE9jcGJyK1lBOW5mSzNpM2JsRXM4UTRNTm10VzMzek05NEZDTEk2Rmtl?=
 =?utf-8?B?ZEFqZCtDYzB6MzdLTWQwMklTMDVEb1I4UXVKdmJhZXJaZys5T0dWSGpENWcv?=
 =?utf-8?B?M1RsUmRUcmJYZjZoS0pjMWpYcVJRNjVKZXJuYU9jaEpFazN6ZUFkMnpHVkU1?=
 =?utf-8?B?eWJ3Skx4b1lVWHFKYVkwd0VyQ3YxR0x3akVWUWNlK1Fsc2k1V2RpTzBva1Ew?=
 =?utf-8?B?aTRUWUc0THBmc3NhOVNLYjUzb29HMGdXQVoyU2cvMUlDQVIzdE5YR0ErM3pK?=
 =?utf-8?B?YXp6dzFRUEMxNCtFaitiTjltZHI5Tm9peE1qNUR5bU5ZOWJRaDVuMjY3Z3FQ?=
 =?utf-8?B?b3hqNDQ2T29wSTJ0V1VHaUk1eEdvYnAxTGs3cTJLY3dIcmxSVDFUU0MxUXRX?=
 =?utf-8?B?a2M4ci9UMFlHRUpsMlRPSm9tK29JRDgvdEhsMTlQazJMUlRUVTZ3ZGdrVXFF?=
 =?utf-8?B?dmJad3dERzJ1VlpmY1VOV0ptSlZtZDJIaDJoU0t4YXFkbTlNcE5OSDhodlNZ?=
 =?utf-8?B?RjlGSVY0YlkvYTFJeTlKcW4yM2w1K09wemlIMVN2SzlmeGI0YTU5dHdVaFBX?=
 =?utf-8?B?cVlTempXRWlWZXBSdEs4Z1Qrd0FRZHArQyt3Q09XT2pUaDZtejNtalptVnpp?=
 =?utf-8?B?ZXp2YXpIRVgwcTU4N3RyVitpQmJVTzl6b3I0b2ZnQmo2dFY0b0RseERzVHVr?=
 =?utf-8?B?c1lKd2ZvenNwclpKMG1MN1p0S2VQejlLS3lIai8rRDdNK1VyQS9MZHI3dXdD?=
 =?utf-8?B?K0ZldVIzT1hUTjIvVHd1WUJFQnV0OGhEQ0hZWWpWb0pjZWxRazNPUUF2Mm5X?=
 =?utf-8?B?cmRuUkh1SWxWMTd1ZmkvaHhGU2wySUlmQ1UxWG1vRk1JWjdwYlpiQTh6SGQy?=
 =?utf-8?B?MHJhODFHVHI2eDExeTQvSzNUZ2F5SUJlMUNUWFoyMFI1REppZ2dzUGUyOCts?=
 =?utf-8?B?cmZmeG5paU5RUHVqaDVTNmRNV1Y5OXpGQitXYzJRNHZzRW0zS0F0OE43QjVq?=
 =?utf-8?Q?eEJfjRqNLI+6y3xGGMVPtUuBd?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1259b94-1e4a-497b-47a0-08dc9b802e6c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2024 16:50:01.7610
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YwBTVLCkpudygzg5YD5KMUYgTMO90qDn+hUhokXFq/R4dzDVZKd1EMsw6KR/mhtzWu2RTR6Lv1E+9wA+kh9CaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10628
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
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Change node name 'uqe' to 'uqe-bus'.
Remove #address-cells and #size-cells for nodes, which have not child node.

Fix below CHECK_DTBS warning:
arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: uqe@2400000: si@700: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: uqe@2400000: siram@1000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: uqe@2400000: $nodename:0: 'uqe@2400000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: uqe@2400000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'qeic@80', 'ucc@2000', 'ucc@2200' were unexpected)
	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: qeic@80: '#address-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe-ic.yaml#
arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: si@700: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe-si.yaml#
arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: siram@1000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe-siram.yaml#

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
index 17f4e31711209..c116a03fe872b 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
@@ -653,7 +653,7 @@ gpio4: gpio@2330000 {
 			#interrupt-cells = <2>;
 		};
 
-		uqe: uqe@2400000 {
+		uqe: uqe-bus@2400000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 			compatible = "fsl,qe", "simple-bus";
@@ -667,7 +667,6 @@ uqe: uqe@2400000 {
 			qeic: qeic@80 {
 				compatible = "fsl,qe-ic";
 				reg = <0x80 0x80>;
-				#address-cells = <0>;
 				interrupt-controller;
 				#interrupt-cells = <1>;
 				interrupts = <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>,
@@ -675,16 +674,12 @@ qeic: qeic@80 {
 			};
 
 			si1: si@700 {
-				#address-cells = <1>;
-				#size-cells = <0>;
 				compatible = "fsl,ls1043-qe-si",
 						"fsl,t1040-qe-si";
 				reg = <0x700 0x80>;
 			};
 
 			siram1: siram@1000 {
-				#address-cells = <1>;
-				#size-cells = <1>;
 				compatible = "fsl,ls1043-qe-siram",
 						"fsl,t1040-qe-siram";
 				reg = <0x1000 0x800>;

-- 
2.34.1

