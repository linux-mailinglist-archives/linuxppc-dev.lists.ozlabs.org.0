Return-Path: <linuxppc-dev+bounces-7597-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 92454A8564D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Apr 2025 10:15:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZYqHq5zcNz3c6q;
	Fri, 11 Apr 2025 18:15:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=205.220.178.238 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744354209;
	cv=pass; b=o0MmXzVXupRa82u3DOIGNoCuFZtD0zkIOKvca6G5ANq9AvKuKnBViYZV/9wf/YibUGGJrycwx4lQ+uP1NXCQMKOnMnLsa20X9xvr7X9qWFnUmgxYA0HJyQTxDsU3qpJPmrStfZGSr05P56BX2ybUSzLautrgyXrOtFfBGTADepcWfjB5W7vegIxyHRX1PYUsECZQJOI1MCiyrrx5kw9vYGl/jX1qgl6WWpQParQDJuh124lqpc4zgCkhQ9X4zBGbylmHBH8BBTVTY3EGN5L9oisbpCpW5VR56DCAVfZdn1/TWVZ5GX2Q3z3it/oq6Gwbl8vdxwH7gYRBqRYNuNAc8A==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744354209; c=relaxed/relaxed;
	bh=POMOYbiLClxhy26wYRoqiGYxObN0qHJ7+IGCsMN98GU=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=WLrRpC7EOZK+5XDkE6bt/9HLdRlfG5k4Xb/NNqFOOAWAG5UkgtqZuLSsZjLDWqoKLjgFeEyZnszKob2aFCcXGbERlLJX686ehusjMuQ1icXQlL4abC43sGJiVqLlJ1zS5qlLElJu1B82j4mR90X0wlAs6/1HZcpHdRorTZslZrV1jqutXE+ishDpNIyU91fdl3Lse+qMrelF/SgM/qCKI8TypXKUHNuFyIKjrUKtNlrASXvHbkJB0qv3hBOi6Rqa0xpDphgkOHhIEhDIyMIbE909UhJ9v+7I7f7lNNInAaCTTw5xBiDeN503xKgEsTwSpBterm+2pyImvwDN4oq2Dg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass (client-ip=205.220.178.238; helo=mx0b-0064b401.pphosted.com; envelope-from=prvs=61962bd2bb=donghua.liu@windriver.com; receiver=lists.ozlabs.org) smtp.mailfrom=windriver.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=windriver.com (client-ip=205.220.178.238; helo=mx0b-0064b401.pphosted.com; envelope-from=prvs=61962bd2bb=donghua.liu@windriver.com; receiver=lists.ozlabs.org)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZYnPF10Hvz2yfx
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Apr 2025 16:50:07 +1000 (AEST)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53B5GMn1005535;
	Fri, 11 Apr 2025 06:49:50 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2043.outbound.protection.outlook.com [104.47.56.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45tug8qxhn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Apr 2025 06:49:50 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JeJ4aV5OuffsiYTh0e+7Pq4DuP/qkueF2zCwyYk40IJmH+FUruD1NmrtRBwHbGzTHOB+mj5qAduAAQP5//dv3O/cbjokOIVHJitJ69f3YxY5e/BR/D93U8GBc4h5xhlYdegQ9kCcvapQAQoz3jqbFtzhRbQybBU3As1Te+8nMiVgWCHKNLussiY/YSpKmSf/nBVhhcrEVGbZ2GY+2nzUviCcGaYf1ssVcKWDjeg6CMTic/Rg+qw75EmB1Yhi8gYxWbnQ0q30JSirBeNIIDxxQ9zYo2MMa+k/lA6QUTTZg99RAm1yabbECcnN/VLipMSdueIthh3O0wBXtCmfrvcl1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=POMOYbiLClxhy26wYRoqiGYxObN0qHJ7+IGCsMN98GU=;
 b=iwyRE79JMXownifLBBE8i+w8XRLa56RM1Yi+GrubG7kFvh6qLzyNjScurZPAR9r/ZYjcXFWZz3aEzidLCZULMVBxuLQqhQnyu6mh5IL7zf+T1AxhPTUafTm3LWBmGaM5ZAfomplTsHLN6w6Bc1dSgj5NAFlSaBi3smkmb6WypWjPNoMKy7AbPeHnd+egaAp24loDxb/J3hm+UnSdZMtSqWnZr7XRPb8xLJuWqXZWi3p6M2QzmB+sIKCtt9NTCXYvw8WZabT8p5aLQIZzRValCpZRIUI3TXIFDLVRKvBPIN2YselfKek6UqnjFvvr3ijMdm/2+r1nlxO6MmLsL5jBsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CY8PR11MB7012.namprd11.prod.outlook.com (2603:10b6:930:54::6)
 by SA2PR11MB5161.namprd11.prod.outlook.com (2603:10b6:806:fa::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.25; Fri, 11 Apr
 2025 06:49:48 +0000
Received: from CY8PR11MB7012.namprd11.prod.outlook.com
 ([fe80::83d5:946f:3692:8c0d]) by CY8PR11MB7012.namprd11.prod.outlook.com
 ([fe80::83d5:946f:3692:8c0d%4]) with mapi id 15.20.8606.033; Fri, 11 Apr 2025
 06:49:48 +0000
From: Cliff Liu <donghua.liu@windriver.com>
To: stable@vger.kernel.org
Cc: mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org,
        donghua.liu@windriver.com, leitao@debian.org, nathanl@linux.ibm.com,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        Zhe.He@windriver.com
Subject: [PATCH 5.15.y] powerpc/rtas: Prevent Spectre v1 gadget construction in sys_rtas()
Date: Fri, 11 Apr 2025 14:49:37 +0800
Message-Id: <20250411064937.3662385-1-donghua.liu@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0122.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::11) To CY8PR11MB7012.namprd11.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 1ca68110-db13-4d7e-7583-08dd78c50d4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Ht74ORMSIfnvAUSvHbRBsYVSBq41DePvB2f/DUDKrFbAiC/1MDU+Yka3Cdij?=
 =?us-ascii?Q?Tl42oCYvoiQAQ1/xhLoUhLjRhjsic42QFBvHyw7e46IQ4ABKZ630PDA7eRL1?=
 =?us-ascii?Q?xpDlI+fLDi6kFHA/t8Juv7GOINhQd9b9+ESmuyKdkwLGQ3tYf4gDrx9cJzzC?=
 =?us-ascii?Q?3nMB1oPcSZIkDNWhqFvDDy9uY2nbihhxscFTg1VDoTr1UeUT1z5VWFg+i6BW?=
 =?us-ascii?Q?D2t2lp5eVQoE686zxe6oYx2pqfJ/oZhTE5J/ODq90NdYyfvQ6dDfGuiqM2Z7?=
 =?us-ascii?Q?EwqNPZq00adtSSceFrXdcmggpspkWrnN8vZ9tM9DGWWvCDI+yfW0rG20HvzY?=
 =?us-ascii?Q?/+s3InMrpgDgZlYbDETfmftUiy5/lT9WGtiLWpGc/eJSgozEkTJ0dBZ/WwCz?=
 =?us-ascii?Q?HCv6gT5+H++Q+osN3/xyfTJGsZbCH/IFBBTxFxBWibqKodJsQrjwgDqFY3fu?=
 =?us-ascii?Q?lRw2x3c2+kOxCSl5qLO1zJl1ke2sRMxm52efEeeXl825nLAF/2+EdL0xk1Bt?=
 =?us-ascii?Q?ZqsTrhg/XhCZmEQwni4Oz7cxDMBao30Ou1Td4ve6G+Tk3kKGznXig7/aKHSB?=
 =?us-ascii?Q?LYRHKcoDvrmQIbmCtHkJquZHviCN1IfoeiYUwkdne7/aoo1M8OtYDNQzVf96?=
 =?us-ascii?Q?iqzGBnR/PLBbrhIPT6er5E+PzkWLQ0zCv2SBX7YGn8r3WhafJzQeJ/Qbv2ca?=
 =?us-ascii?Q?3lM8ytb42Jyoe4KS85qO/4nVB12B0eYSqVUOUZec/mO8xBIIsC3BVibvW15C?=
 =?us-ascii?Q?76CmIkVMpZ8MyE4f8hmUD2a5YBQbZC5pTsiVTLtJgTyOkDyST3dzjtnoposX?=
 =?us-ascii?Q?l46y0D57Ptwzv53fAv5jiK9FHDc+NN42+xRIjbgKBXVSqu7k4tnLOMNHLRxu?=
 =?us-ascii?Q?ODX6U6pC8Brko4Mt7ls78I5pfzsKPcRQox2VTOMbh83SxrEN5UWZ9ssiEnuN?=
 =?us-ascii?Q?W/uL7a7JOkebv2gDiEqhL1UTb0hm5un5SBysHYpgR5Y3EMXAiyaAQ4LnBsaK?=
 =?us-ascii?Q?D3Vty3Byyv1I4zy50riYKyhrCL+N2qaM6LJHLEQ7WqJzZUhEIcww4ccACgMZ?=
 =?us-ascii?Q?/PlUC3T6bCrUKue7Ui+eOavfM1qcn5roMU4KxJ1Hmsx/fJbqodBQnMyaKvTO?=
 =?us-ascii?Q?rf23YNH51dEwUYfcrN+RGXLxp+tE6HBwuhJA6bh/MBhnfXZRXxoGepwjpBw6?=
 =?us-ascii?Q?qPdyoOsnU7FAFH65hRn6hiLXyyo+sX/mzlQhZoajjy3m92mq7Ln2LvXNwxgT?=
 =?us-ascii?Q?yD/7XkdwQ4Eke9AmhGUEVTTDP4noW7sqv+UhbFWPgXj3dd82ri8bav/66Nux?=
 =?us-ascii?Q?O7xDELBiPS+FXftlLwYs9hWtENLwHPxpfLrj6hDSr1oKpU+sATa2vI39FTvv?=
 =?us-ascii?Q?VIOd2PnRJaOvYQ+qyvJXp4OeWY0sYAvB+FaLuLX59Wk8zjjbkzq/GifXXMF1?=
 =?us-ascii?Q?tWnlxfM9S2k=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR11MB7012.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ORi8d6+QgHGcFCg3Im1VbqkEZXTdY7erfR2bZUXV/L8ff0c0MJXeS2sKIbMi?=
 =?us-ascii?Q?2nQClqOSUOobmetXCtiwor1WLzSzUTynS/TaDLsqRVmQAzRiICQzifmjCEti?=
 =?us-ascii?Q?Y74uCCCJcDlMwjpLLzxCW407qOnOG/3n1krE1jufL+Zd5nJrkikOTHMGLXeQ?=
 =?us-ascii?Q?SrZLUXMb4fGHvAfPNFagI9lwSaO6Uhr3TA3uTQ+k7y3i0rB0ieTGBZskrWsF?=
 =?us-ascii?Q?LcEbye5WV0dTJ36sjklFEOACRZgSwmV/YV08B90fj9z26EBpNhMlgQbH9mcE?=
 =?us-ascii?Q?IrfnIUpzo/2XMlusinbEFYCkW7C+NaihSIv+sdZmHIfkr3IjX9JhYe8rYsTb?=
 =?us-ascii?Q?4GeJuLV1CiGydhUlsSVUlnJj1g8hQRxgueNRXQzB4mYVFfnTfQv81DhXuNcA?=
 =?us-ascii?Q?J57lW2JhCE+MdtmE49g4aRsdp3jMNb1uM5+tMlyGoT5pyKFOBH5pvxiCoz+E?=
 =?us-ascii?Q?8678qkAbayrThj7R1PgvMLp4LS/tbxC4AHqLiLU948n5VVFyF8wf1gNT2BlD?=
 =?us-ascii?Q?TIa2S7V+LVknaKxMce1IZPvJDz5IoADG84n2O694wIt60nblb2j4XrMcyCYA?=
 =?us-ascii?Q?wxl0OehBAQsOAeRWvu9le6cvRpYCricmGyyKb+mym4sl8C1zzmhh9l+JCMWi?=
 =?us-ascii?Q?xzz/8M2v07lAmd5v51Ucav72uje7t6CGywH3skXoFiytaR9jkxnkZgk8oXiO?=
 =?us-ascii?Q?/N90U9WFECL/zokYbEhtkSwq+d4hnR2/FP4sc4qIKAKNAXu8frUtZpqYdwl8?=
 =?us-ascii?Q?Ovol9QbHGw8OIoxMjrQeaHeAD7ImNKy2wa22PE0eqxEUnybDxHu4CgN21zGL?=
 =?us-ascii?Q?OACoYJKJI3To/3P6Ft678vCXg6gWe//pecb0RsC2xUkU5eUNsUWE/esTow9b?=
 =?us-ascii?Q?P360TOpl1qznxSjbTR3YiuoruCaFYD/dkaVkegpljqvR/sSSj6mlL6RPyTb1?=
 =?us-ascii?Q?3RPUUFNwwp40ToThbCs7DorsavrPONZ2hmeW8kOkPoaKG3giSli+eFF4I3xq?=
 =?us-ascii?Q?0EwK6vCQlN3jZ8g2UpHBTtbtmUr8WJ7sSw2N3yJSwO1AODJHD+LVw4oWkb33?=
 =?us-ascii?Q?iy3aXIAMByGJRcKupmch9qgf50kyti42aFVZbsY4VoIpK1TUKdVdj/7fFypD?=
 =?us-ascii?Q?YAc1tqwrJgcvYltsO39TCfGKXN28hcVif5K6InNLxHUoiL9GeRt8mHFEBNPA?=
 =?us-ascii?Q?LHJFJ2+0938Cvf3tsgzHOoTNYyNccA2NFtAwEGwo8hmPV1GubIPfT1xAQoyV?=
 =?us-ascii?Q?IHEhUGhmK6zWG4q0OubXk5Ekfb0ReSClMCCl42Drf68Z63Eb1KpH57EolHoN?=
 =?us-ascii?Q?4yLdi8WzIYR91rI//PIVx4V4PPdfn3j7gtE5N7jBwf8s1lUbtvd34zYUwGlE?=
 =?us-ascii?Q?iHWGdAEwRC1v0GbVTCrI7GYM5eLaoxAyMHjCiG/uyrjjxYPcWHLKvhKOKEd7?=
 =?us-ascii?Q?CmxcYsZfn6559vBdT2T6ABmy7mwflOZWhy+GLnxiGWCkbLqtIAI1vcO1c9gE?=
 =?us-ascii?Q?tkdvqPQPMeglj2ZRqSaKO/unux/D15buzN1Cdj98Mui9oF4S7/CrDCmB/7DH?=
 =?us-ascii?Q?uv6I7EUrws3OAKNT7qRipUKaGPdOpiWr+GMzvx8+JbMVtAAWohSTIa8nVDXH?=
 =?us-ascii?Q?bA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ca68110-db13-4d7e-7583-08dd78c50d4b
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7012.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 06:49:48.5091
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qWjfVjAj2TyHtNh6bgU3S3pkqKLAlPm6HLCe58rIsPQyu5OJuT7BQb8dlbCt25qo5PeQ30n9zvBZLK0jLbTABuNpZvbFfIr2NYNqC5cK/Yc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5161
X-Proofpoint-GUID: H1qDoR9faxTMXt9p5cMDJyLzFbJaUbbK
X-Authority-Analysis: v=2.4 cv=YJefyQGx c=1 sm=1 tr=0 ts=67f8bb8e cx=c_pps a=QfxD4CzqCnNUzUqh5S/TIg==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=bC-a23v3AAAA:8 a=VnNF1IyMAAAA:8 a=xNf9USuDAAAA:8 a=t7CeM3EgAAAA:8 a=u2LiicgN0kIDZIMe9SoA:9 a=-FEs8UIgK8oA:10 a=FO4_E8m0qiDe52t0p3_H:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: H1qDoR9faxTMXt9p5cMDJyLzFbJaUbbK
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_02,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 bulkscore=0 mlxlogscore=999 adultscore=0 lowpriorityscore=0
 mlxscore=0 clxscore=1015 impostorscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504110047
X-Spam-Status: No, score=-1.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
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
index d01a0ad57e38..f2378f51cbed 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -16,6 +16,7 @@
 #include <linux/capability.h>
 #include <linux/delay.h>
 #include <linux/cpu.h>
+#include <linux/nospec.h>
 #include <linux/sched.h>
 #include <linux/smp.h>
 #include <linux/completion.h>
@@ -1076,6 +1077,9 @@ SYSCALL_DEFINE1(rtas, struct rtas_args __user *, uargs)
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


