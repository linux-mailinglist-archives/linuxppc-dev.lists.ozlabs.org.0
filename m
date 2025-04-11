Return-Path: <linuxppc-dev+bounces-7596-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E60A8564F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Apr 2025 10:15:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZYqHb6RWfz3bw9;
	Fri, 11 Apr 2025 18:15:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=205.220.166.238 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744354081;
	cv=pass; b=ADbhngd/7Yyxmf0p9R2Lw723BMBASwJMOqa6/3bRMumIpmc8SvYjATgGe5PHCo2W3khmfJUsbK2iDKbPKk23IDaQwtEZtaWgow+a30Ga2n8zTV2WLxfHjWg6WogV5ASU/+lPjDQbykODb8D1cT79NLUxqNCKdRX+p9qe159/ovMulU9xA32BKiNg6DHNtHoPcFJgWKFtVGr+mOCo+M2qs6vvLzPZL1sOp7vnTWWUP09Yd8DHWpKYQ5tqAgG2i4lb8711N3X72xYxvkLjdaFOOePzAiX8IxS2AR75jY3OJyF4DweiFYJeTW0IvGMIV1E9eQ7qPsFc+Y+OABwT548nXA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744354081; c=relaxed/relaxed;
	bh=tene+uVPQQUNudrCLR4yr7PBpTmNpCXpUJ10UlLgBW4=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=MTDsmRYlCNV5TrRWG0GSxBbYvwt4oh3gQdZy3Hg1GU8URWDWR1AQBC9bA7L8kGmt06pMBIrLt9HAVLLvDqeB7cqIo7JpOXvv9g/RlQNZcmJbdK+9GwLT8axP/xTmzxNtUz0Y8g2OW1bf9awA6N5DFBYQslaA1idHjGJWUAyWJuB8OYUlM/6qRpAqA8IpOurNGltbSsdNIQA6woaAo3brRIKxSqrCXu8e0EfMedfvrB+qE5OPAsQVQGyaskBRHK7iVCl8bCYJWluxeUvj1hWI+M4aBX/e7kJMHNz+5/H0+NLazH0srii1HY90MqScpUDLB1t/XV7++5QCfE+QmlEOow==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass (client-ip=205.220.166.238; helo=mx0a-0064b401.pphosted.com; envelope-from=prvs=61962bd2bb=donghua.liu@windriver.com; receiver=lists.ozlabs.org) smtp.mailfrom=windriver.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=windriver.com (client-ip=205.220.166.238; helo=mx0a-0064b401.pphosted.com; envelope-from=prvs=61962bd2bb=donghua.liu@windriver.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 301 seconds by postgrey-1.37 at boromir; Fri, 11 Apr 2025 16:48:00 AEST
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZYnLm2vKgz3btP
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Apr 2025 16:47:59 +1000 (AEST)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53B4wwJv005403;
	Thu, 10 Apr 2025 23:47:42 -0700
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2042.outbound.protection.outlook.com [104.47.66.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45u41m7fmn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Apr 2025 23:47:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BqLRNlu4CGzM4jzmTePUFVZJ3pzeDHRBwHsS2FDcba6sMaclyZOtYzDOcQbPnCHxUpLlb3sFmaF+ArBbWzRVJQ7aT/uAoS3utDsY0ZJu0g5EABazwdIAov+TxRNCenjLcDrkBH8Q+NyTAKEpHu8ZXDhx4mWifTbiqgp1toI7CtI4MSfGvn0UtL2/eell7eYt9XXO9L5DWB7797Bsxtqr3EsTemapBUPZbBlxgS2QCL+UlpbHnbmVlr+i4sWOPzxdR80U2ej8M5w8U+OhaphFqNlTZK0JTp8rvji1vB2JZFZW/YRN86Lf2Ib6hcInU6Ct9tDmcMFlBi55YZxd2I6aHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tene+uVPQQUNudrCLR4yr7PBpTmNpCXpUJ10UlLgBW4=;
 b=GINBuKTyxwkUeLmw9pb7FRWaQBSsEenDLWC6sVjcv2tdZd+XGJSwDGozwCWP5JYJtOAmR/s3m9C9kPPoGP6JXz9uJPZohZOQRfrDc9WBfEG2DBTZbnq5TnBQo6oTsd3naeEfUmzzWJmBIs4x9aerwXVJa53AIWEPOfOBQJyPFMVlc/vP2m1O+kzW0kJ/4P5Tfb/NtfqqGs3iU3wmX6vmidl1u935FdewSF+WNWNXiHIBAb//EAYm/DCvC+dW1qg78UC9rxEfv2mKotU1ip8phGkz8MCoNCn0V5rZOIp3Ee09Hjttw+yLa9558F43QhchN2wtw69lpG6qPwMW1GSKOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CY8PR11MB7012.namprd11.prod.outlook.com (2603:10b6:930:54::6)
 by SA2PR11MB5161.namprd11.prod.outlook.com (2603:10b6:806:fa::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.25; Fri, 11 Apr
 2025 06:47:39 +0000
Received: from CY8PR11MB7012.namprd11.prod.outlook.com
 ([fe80::83d5:946f:3692:8c0d]) by CY8PR11MB7012.namprd11.prod.outlook.com
 ([fe80::83d5:946f:3692:8c0d%4]) with mapi id 15.20.8606.033; Fri, 11 Apr 2025
 06:47:39 +0000
From: Cliff Liu <donghua.liu@windriver.com>
To: stable@vger.kernel.org
Cc: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        donghua.liu@windriver.com, nathanl@linux.ibm.com, leitao@debian.org,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        Zhe.He@windriver.com
Subject: [PATCH 6.1.y] powerpc/rtas: Prevent Spectre v1 gadget construction in sys_rtas()
Date: Fri, 11 Apr 2025 14:47:27 +0800
Message-Id: <20250411064727.3654037-1-donghua.liu@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0126.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b6::10) To CY8PR11MB7012.namprd11.prod.outlook.com
 (2603:10b6:930:54::6)
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
X-MS-TrafficTypeDiagnostic: CY8PR11MB7012:EE_|SA2PR11MB5161:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a568b5b-e6c0-4ff2-bcef-08dd78c4c046
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NvksYIcZWaYLcvtNERfNfRwgwxRaqJ2zTswvN1J8BqBO2WE25uHXECMWReL7?=
 =?us-ascii?Q?R9vZxaFpGRpE1eoYeSrLIKU7nKgHY5xvydyx+15Ie5hzJYDLW53bzpWk9Hoo?=
 =?us-ascii?Q?tow6PssyKAyeKZoeDzz+rkZAkNK9ZU3wVwqIx/t9LSnj4MZwoBTGMtiE1Z/0?=
 =?us-ascii?Q?DnO1zXNB0Khv0sr/Iy6UTFT5l2QeK+zNhmMlPXQrMyO5Qi7FCWLf/StF0/Sh?=
 =?us-ascii?Q?xWikyYYy78ewjAvT8ZSd+2QBX1dseiUjf5aY/3ioPk2kNTXyrLPIdI4YswNb?=
 =?us-ascii?Q?Iu38l4Ch0M1hvBXe/tL1A3c6Wu5RwCbiYPLhybdL9jcHlfNXeb1SmNvIra10?=
 =?us-ascii?Q?Yfi8nAwkQSn7XaWrn3ZvrfMBXzGn3/0hnKo1n8Dz8HG3jJNkbHNMWxE4qbqs?=
 =?us-ascii?Q?mXQyG4FDnZk13KyYC5W/SZ/5kxOeYp3NpuowmwpclKVKOiA9QqV8WP4V1zPY?=
 =?us-ascii?Q?j8k5Jz+TIxwnSPCQ/GQdm15kLwC8w/lsbo/x2Aa3xsSJFjhHy87L7ish/opE?=
 =?us-ascii?Q?O/pWWpBZ1BlJ10ilmmY9y88mfBt/emrQ/XioLpXJF+Z9DJSJio+bKV1DGrt9?=
 =?us-ascii?Q?nkl2cy5p/8Z921lq0JCO+qML8c0RHkYdOQADwkeT4FXvokcwrk26u2jL5DFf?=
 =?us-ascii?Q?VmuCQNX1+F81uQrbwA/bieD92SpS9jtv6PPUM2ZqAV9xp42rgeAMsY9sepSb?=
 =?us-ascii?Q?FuPYPB+5+FI1Z2yzW5gNTCMJOJplDwD/iwoJgJhtpjy05WPUoDpzqJ1sWK96?=
 =?us-ascii?Q?R+i+/32dc7qMb2HyYLJd4trJMVA75V6g5U/nXkow5m04S3Xdp0hb6oe32mlI?=
 =?us-ascii?Q?ywgFWYzHXRStzaHJjnw+wzC6oWvkS7Bw62pEENOAfKW4C4aqYdxxv6cDslKE?=
 =?us-ascii?Q?podGpoiO2e4nP8uMQXYj7bviaD1YBB2daL3jN0UptcQedqECXVHPjDMaKfWt?=
 =?us-ascii?Q?StW5xsVVXA0wMSVeINh7aAAHssMB8Uzl3usJYzAP8cc0gA4nujGw6yK/rZah?=
 =?us-ascii?Q?9r995u9wMF6UlwF/Yf3JKfhspyNeWVvEgpUWtv3T3r6IPAjiUutIHU6XEZs2?=
 =?us-ascii?Q?630pEDHXtM9MExnRNaXL85hfJN/MANO9XGTEsgrDAqXDsQ3ZyhYwkcJDu5ky?=
 =?us-ascii?Q?rrOURYa0MT/yxE6CgncTpXdMqfM5G14PZWHaEMbmQTlCffPzP0GdJ0+iBPsJ?=
 =?us-ascii?Q?ciNhH7UqCZDpciEABoZmgwC/uRt64I7BsGnIaYhzkkN5T4AdRrQrXmAOd6ih?=
 =?us-ascii?Q?ermSXUapoUSu/u19ZWUSGTypSlAxrfS9FwkzVBzNDEecx/WTFLlYfgsh/8+R?=
 =?us-ascii?Q?AOO1psTQoEOmv2HEANBWVbU98dTPvtok1VCVg8ISkupN/eMa0UMFtk7+U9kv?=
 =?us-ascii?Q?VdGfu68ftRR+7diW/f8MnKD3kao/TgE9P/a57rSkla9JwRjnzdWFTK3JH9u/?=
 =?us-ascii?Q?HhX+mEkkE+I=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR11MB7012.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VPeovPHBWA6rfpd2F54mNIihOgvn+/p729a52JGkiVBPC7AlKtkknTqibH41?=
 =?us-ascii?Q?aakFDAA7sIMVQbPyNNrTtukoXie7/rxx5YBjE5resj2cdA3vBUclfGFOLaf5?=
 =?us-ascii?Q?h5FPlTrcr64Pi49d4GrnVR/sk/g9gJ7N+UKzws2C+awbTiKVEd79Fiz9gORz?=
 =?us-ascii?Q?zv/ju4nU/BBB1I4IViqpiVFgLXs4Mad4QyAEfrpuaf+Jhz9BVTtnOj/L0s6b?=
 =?us-ascii?Q?JcBQmk+2QeY5v0ZTy726GNYVZWkysXMpaWsuGqw/MPnOOm9MdFaMBLLHAwKp?=
 =?us-ascii?Q?n2mx2knNp00nVqPdNmulSCdyFhnqXvFhreZ+4s+E5Vb7eALM9XsgaDhR7Ff7?=
 =?us-ascii?Q?6FoqXBB/1ixsWwmBaz4B3aH4VxXgR65PHB6LZ2gDdrujQJF3EVHFeo/ZBSaI?=
 =?us-ascii?Q?e1HESpyGWDvcyjp908wbftfcVRO8AkvczapCQVVjLnL6AIGSheSNBTh7Yle4?=
 =?us-ascii?Q?Cy3+KccQcLnHE6DoMLMqB619Xvn6PXZk8YQ/FUMWrYb74bds+EigHM5gGJ7d?=
 =?us-ascii?Q?GeQMKF3x7457YTjG8pueX2fq3Q62LtU15mkVw30rRvdqK4lHdvtrHM8DmZcn?=
 =?us-ascii?Q?rEb/EP0GytioJAuqdLZqoyDQJ8ZDEHibsF8WERZiftRLlEGmDulD8iINK1St?=
 =?us-ascii?Q?GP2cs2vfCovsIIhUXgAbRddpwL73nN5z4/a38Rwg7uvwYzA5CWPSiK3oxB2t?=
 =?us-ascii?Q?DG1038N6i9S/g70muTmpMjCe+ij8FHyy3/VIn5GV6M8PCGwmxRkH4pKqyckR?=
 =?us-ascii?Q?ovJgUyr2jb2qVjylp+2GslJRpMxDRTduCh/8/B94qjwrNTTQ0YzS2s1dnwd6?=
 =?us-ascii?Q?kyY1cAAhfUc7n11yiBjl21bEKt15LHmMIifvj6vDByDlQ2iFAIR8AIDEyD8m?=
 =?us-ascii?Q?k8siwWj0auKDWD2205bTwKR3GBHsdeCYyyxDH+QpGLTF/7gHSVGGDTRW1BcI?=
 =?us-ascii?Q?OZVtxDw58TKBdQsYMz2XCz01Sd8UOvFW078Objf0bE2EKGN7OfwDyoUMgNQm?=
 =?us-ascii?Q?U5NpAEcG8Qa2llKHklYka5ULScP/zlAkToEq9bEEGntdTcZUHKGQmUlqAjAF?=
 =?us-ascii?Q?npCHbLL0XbP3PDJvC3lvwUvw6IUFTBZqOQnKdggz55khFUxLckcrI3fDtNjI?=
 =?us-ascii?Q?7tuNYOgenoUv7USDX2zEa4sIBWTSdqqQkIDu/V6dDlBqTEk4ABnrnJXVolO8?=
 =?us-ascii?Q?KuX5Ry7q56oHeb1LGgqigEVn1hDa8ArKbknJfYqd5I2cfESC5pQB7NLWcjgc?=
 =?us-ascii?Q?164C8y6rZPXvllAzkqMoNCQwEshjbTXFJPRXGVwYbQcZottpDJwG+jR7+28w?=
 =?us-ascii?Q?SRYT+7qy0SMmP1NhhzY/OKjQ7E239y67eSNfY6viDQzQQJMMIe+7Hujvx+sh?=
 =?us-ascii?Q?aiE0noTKlFEOJtccc2hNT8aTrgwroMdD9FhOMyq+pjdb+XeztJYvFEiNaKc1?=
 =?us-ascii?Q?0cVPFg1ywX+g74AFBzRaxSvgxqwCOSNQeeXJq1cpbU8S/xW9NtoTfMEgvkP2?=
 =?us-ascii?Q?rvZooWmrfH9gA7FMhwvrPGrdfFIjPmvn3ZEfCU1GG6inS5y/kj50BjZgF6mU?=
 =?us-ascii?Q?WBEAUiLuzJByABV++Nf0naCLvQ9KXj+yEAqUWHb37RQt9kw/vlu0jOrSB8q1?=
 =?us-ascii?Q?Ag=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a568b5b-e6c0-4ff2-bcef-08dd78c4c046
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7012.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 06:47:39.2951
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yPfCbgGlMVTkFA5IbsXDphptTeyITBXi/xrlgJ7MuIhtUksmblQI8Gaxywjh62CzzEQqxVi5oaMYH5cHijNZjikBdHZ1iQbIuN6HYnHHk8c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5161
X-Proofpoint-GUID: g34A48K9pZhvBrdrAcc3ySWiaPWPDAcw
X-Proofpoint-ORIG-GUID: g34A48K9pZhvBrdrAcc3ySWiaPWPDAcw
X-Authority-Analysis: v=2.4 cv=QOZoRhLL c=1 sm=1 tr=0 ts=67f8bb0e cx=c_pps a=ZuQraZtzrhlqXEa35WAx3g==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=bC-a23v3AAAA:8 a=VnNF1IyMAAAA:8 a=xNf9USuDAAAA:8 a=t7CeM3EgAAAA:8 a=u2LiicgN0kIDZIMe9SoA:9 a=-FEs8UIgK8oA:10 a=FO4_E8m0qiDe52t0p3_H:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_02,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=990 bulkscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 spamscore=0 mlxscore=0
 malwarescore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504110047
X-Spam-Status: No, score=-0.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Nathan Lynch <nathanl@linux.ibm.com>

[ Upstream commit 0974d03eb479384466d828d65637814bee6b26d7 ]

Smatch warns:

  arch/powerpc/kernel/rtas.c:1932 __do_sys_rtas() warn: potential
  spectre issue 'args.args' [r] (local cap)

The 'nargs' and 'nret' locals come directly from a user-supplied
buffer and are used as indexes into a small stack-based array and as
inputs to copy_to_user() after they are subject to bounds checks.

Use array_index_nospec() after the bounds checks to clamp these values
for speculative execution.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
Reported-by: Breno Leitao <leitao@debian.org>
Reviewed-by: Breno Leitao <leitao@debian.org>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://msgid.link/20240530-sys_rtas-nargs-nret-v1-1-129acddd4d89@linux.ibm.com
[Minor context change fixed]
Signed-off-by: Cliff Liu <donghua.liu@windriver.com>
Signed-off-by: He Zhe <Zhe.He@windriver.com>
---
Verified the powerpc build test.
---
 arch/powerpc/kernel/rtas.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index f8d3caad4cf3..3c06c8389e05 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -25,6 +25,7 @@
 #include <linux/reboot.h>
 #include <linux/security.h>
 #include <linux/syscalls.h>
+#include <linux/nospec.h>
 #include <linux/of.h>
 #include <linux/of_fdt.h>
 
@@ -1178,6 +1179,9 @@ SYSCALL_DEFINE1(rtas, struct rtas_args __user *, uargs)
 	    || nargs + nret > ARRAY_SIZE(args.args))
 		return -EINVAL;
 
+	nargs = array_index_nospec(nargs, ARRAY_SIZE(args.args));
+	nret = array_index_nospec(nret, ARRAY_SIZE(args.args) - nargs);
+
 	/* Copy in args. */
 	if (copy_from_user(args.args, uargs->args,
 			   nargs * sizeof(rtas_arg_t)) != 0)
-- 
2.34.1


