Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 375DC546591
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jun 2022 13:29:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LKJdp14WWz3dQ5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jun 2022 21:29:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=belden.com header.i=@belden.com header.a=rsa-sha256 header.s=podpps1 header.b=2zMJGYYz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=belden.com (client-ip=205.220.166.249; helo=mx0a-00015a02.pphosted.com; envelope-from=prvs=7160f83243=ariel.miculas@belden.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=belden.com header.i=@belden.com header.a=rsa-sha256 header.s=podpps1 header.b=2zMJGYYz;
	dkim-atps=neutral
Received: from mx0a-00015a02.pphosted.com (mx0a-00015a02.pphosted.com [205.220.166.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LKGdZ3Tdlz3bqd
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jun 2022 19:59:05 +1000 (AEST)
Received: from pps.filterd (m0264209.ppops.net [127.0.0.1])
	by mx0a-00015a02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25A0Ybvt021592
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jun 2022 05:59:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=belden.com; h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=podpps1; bh=FBM65lOE0QCie1fmK0Dd5CZzENs7e6mZHCY1s9tNCus=;
 b=2zMJGYYznbH/02Fuon8Pi6os2wrL+6qbrcxovHEJSEhxk/vp0z7tl/KV0CtDtOYz+fPZ
 IKiqvcW+r4L2qkxsiZlZLasflmoeezIeiYV/6kkzPzFN/IB4GCfotU50u2/PjDq3BcGM
 Cvwm4qMvpatRaUr/7rSfxoxF8J1oT71tgFMRSu40w9SdXyjLC59nPWP0wDiPZ1/KeRSd
 u7W/sM3h0NIe1iaKYNnj4Tu1J9RB3bRTf4wh4fguj+aRSns8K6qnmaKWOMopT43P1qAg
 CmOu305NgAEQY+/MqAoOB/UA0dD8U5RKC8YKV03j6wbbdGbELCoiXFa2mVavex2gXxQf 1w== 
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2174.outbound.protection.outlook.com [104.47.56.174])
	by mx0a-00015a02.pphosted.com (PPS) with ESMTPS id 3gjqryru9s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jun 2022 05:59:02 -0400
Received: from PH0PR18MB5069.namprd18.prod.outlook.com (2603:10b6:510:169::8)
 by MN2PR18MB3215.namprd18.prod.outlook.com (2603:10b6:208:167::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.19; Fri, 10 Jun
 2022 09:58:58 +0000
Received: from PH0PR18MB5069.namprd18.prod.outlook.com
 ([fe80::f5ab:d45e:69de:f99c]) by PH0PR18MB5069.namprd18.prod.outlook.com
 ([fe80::f5ab:d45e:69de:f99c%3]) with mapi id 15.20.5332.013; Fri, 10 Jun 2022
 09:58:58 +0000
From: Ariel Miculas <ariel.miculas@belden.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/32: Fix FPR index validation and fpscr access
Date: Fri, 10 Jun 2022 12:58:24 +0300
Message-Id: <20220610095824.234551-1-ariel.miculas@belden.com>
X-Mailer: git-send-email 2.36.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR10CA0048.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:150::28) To PH0PR18MB5069.namprd18.prod.outlook.com
 (2603:10b6:510:169::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7664994b-80ec-466a-cd69-08da4ac7d645
X-MS-TrafficTypeDiagnostic: MN2PR18MB3215:EE_
X-Microsoft-Antispam-PRVS: 	<MN2PR18MB3215D33E2550713277C4129D80A69@MN2PR18MB3215.namprd18.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	59R3SGhnaFYNcmonnEgfKckCqQREEdEbfnbc72Dmc5lqo9ktRRQq2v+nwtPXYdHIxgEsmFbV04J3GymlibFjG6yLruAmARM+g53yPrrZAWXvqgnLtAEmjQ54X8KHz62gaDMVaNwCr1yGHQDN8APyhIXc1mMIZc1gLnED+oreJ0ohFpXkID8bxpEzSdekBu//CnrU+aAXybp7rDN87k3bJWv0vQ0SHX9IGjVs2yFiW1fEw4dzvXoyZgO4pU5Lbp9oeYRjCDKdQ27IZDrBiEYwN9ta7iTbfcEzZQihADa+vkwtnyaGxSGFcfkgpcBrzpf/4Wyva+G0BPqqzoHrmZ577GVGXN3GXvSqUqwc5jACDWrVA6WNTUFsJcIgvWROc6gpIdcid1+yhlM8xjIpCIAiRcxUvwCpZs4r8DC2/AN2HaFXyOaXpYLpk7VKypx5q8/nkHH8ZXiNOR0F02BCYwbo0M8PR4K9VgPGHRvaXTfORBmf5ZK2IzaFIC2oYgodnH1/6DC855qLG63dnBG+1wD6AAG2otVCb0rSuWfe/kivB1VqIIQRQePko+C4b7hwN6cT7q1Rbj/B5IJmEQGuXEmpp4lnKxBFqPk4Dc1PNtLnmTed74P4c4I0wuBOfx+a8WH8Fav0WOyU85XI3AXCTOB+3g==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR18MB5069.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66556008)(107886003)(6486002)(6916009)(66476007)(2906002)(66946007)(316002)(6512007)(83380400001)(36756003)(44832011)(5660300002)(8936002)(6506007)(8676002)(86362001)(2616005)(4326008)(508600001)(52116002)(38100700002)(6666004)(186003)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?LNBwCQsX3LyfDtls/vTcx3/h3k7dIVV91usranA5aiEqof59YWvfCytS4Xc2?=
 =?us-ascii?Q?MQwcjjN0y5VRe8V0vgmLmrbwo2CRj9cxUkSPJWPw987543DAG430KV4wP/rf?=
 =?us-ascii?Q?3y1UEnrsVWjcXfTQEKTpB9AHwAyGCVG3rf0fouJDJEM0L+oBG4ymOwZD6S5z?=
 =?us-ascii?Q?7Wa5gb8a8JbuzA9knVc2vclpG4QBvDHBvpu7Nv6kOn16n8u56jxyYrW8g34N?=
 =?us-ascii?Q?6QUdfUudyRWTiqvGNg9qUQehubvXy37j2mXo0HRl+MvlEpUpFt/FDcJxbzKk?=
 =?us-ascii?Q?3Qgi9a2FznQczNdUUWv+MHIZ1sgoiBkD1QPx+5G+R2UW/BB1xMPyqZTp8mzX?=
 =?us-ascii?Q?wtBk0mnaR1zZU7qPj6xYd8IaD+Tw7GmGjcs8h0DW2vN5F5Y5PjHsDWS+xxSE?=
 =?us-ascii?Q?z/Tavt8/fWQ+Rj7y2nPBmNxs4TcSrIQUG/o6p7hDmuOdSXvAuT5473nPoKeg?=
 =?us-ascii?Q?Ezo/8yTwrBcSw0agC8RhX9HCWOzUfBaJtpAx4gV6FCE5aBHciEbREYGGN+dy?=
 =?us-ascii?Q?5KydSLPcaR60eZElZrzGAzZCUWeqISDvWCfwCk32Ys739jd1S32g88grf5mO?=
 =?us-ascii?Q?2LPPJ6rXZDzekuJl6EiIfhP8xFRolH23z4v2Kp0bawwZQCsJLwygt1AD7nCA?=
 =?us-ascii?Q?0133FeyGoNiw6w7UQfJRsd4U3jWtW++B+CfHvl37OAx/Vc8ylzNYAI3wBG3d?=
 =?us-ascii?Q?BSIpv/6Dav9VZ2Tk670K1orBBuOMZmdrZlR99ufhCZC127sslsDbcQl0bnDr?=
 =?us-ascii?Q?lv/92SHdNV7EuXyVQyzhqLgblCzKigqr1vdSh9nFkUl5KwzlRXA1aV6Vb4An?=
 =?us-ascii?Q?PnLgRNYZElW/A7fqVc2lCtoZLvM6bMbgvvz+P4uytULRcvUOSwshTH5rhFp2?=
 =?us-ascii?Q?+dME6VTchu3fEF+24XRGucxfuQWruJPwDM8Hncrmyl04XiXbkdHFmFWzWYVN?=
 =?us-ascii?Q?2O+a64493dQEjeMsXLZ7dKA+Jc5KRjTWFKWFT0OaD/dBj8ori6V3bMWzZGUF?=
 =?us-ascii?Q?BYI8Dr8eDqbcMrSVyxG0QzWDYOtGRCtlRSqZB3KQXN4wLt0rxRGzdai520PP?=
 =?us-ascii?Q?1qitgUSCh0sYvkb+1TNK7TwlXlDdOpYQnZBhu7byoh8tjOe+FkdmuQsVhe/g?=
 =?us-ascii?Q?+ZSogqXCtmEtTjLyDBg76spiMq3A475UiKJ6QtHn/ra9BMzAhDyN0e3oUJSK?=
 =?us-ascii?Q?WwNTvQiPj+kuYUAGOBKlkpg37ujHbUj8CADrDpFy6sLbTTElw/cvCmPYdNsu?=
 =?us-ascii?Q?TdcABdNDzF5UFbvzMTHNlXFs3bvWHzFtks5yEpewuv4oSfwxsRi2Ryl/OKxH?=
 =?us-ascii?Q?b5jropeCEein1PLaFJLTJUiK4oA16UIcQpyqz+BzHNRXJXPqDF47/Aykb+Zd?=
 =?us-ascii?Q?b+P88jwDDRSOkY++isD4iTS2dOqi1FUDfpakzrPzyLsMhu7fAEZ23kBh73oJ?=
 =?us-ascii?Q?gEu3O2Gz4Kir8n3F0u/DoSZ12qxQwzrHQK2dKbrA9/nHDjJPojpx2YIdOLFt?=
 =?us-ascii?Q?SUQpDjA3BYalU3m/Q29lFhcDk4pD8SfeCmcU60BNHt8u5irSD/okAqgUCun2?=
 =?us-ascii?Q?/q0dleDhQbAeoxF8y+8gAJ2qTaGWK3OUQreMOdnR/MYMq3Or42EKRqTkOis6?=
 =?us-ascii?Q?ZR1lqfcOj3ufCyYQw1U1EvkC80XRw3hyKN9F8Mr5cV9Znfy3DZ0tsESRlJR4?=
 =?us-ascii?Q?fTwgY2B4BJUi918/xZTFydxoad1R2LxdnFUwoBIHX+FmCFjIvPeA/wHcB2ak?=
 =?us-ascii?Q?J5qVw/T/JZTDZ3+ZpktzGKFfHe0u7tO54WfejihD11qgRKS1PuCqCeh32pMD?=
X-MS-Exchange-AntiSpam-MessageData-1: MiwV7/w8x3JPtKwbadvwPXsS0M3gLiR+vM0=
X-OriginatorOrg: belden.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7664994b-80ec-466a-cd69-08da4ac7d645
X-MS-Exchange-CrossTenant-AuthSource: PH0PR18MB5069.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2022 09:58:58.1598
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0f7367b1-44f7-45a7-bb10-563965c5f2e5
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hhQSrEuxUOQEXDFN0k+qZDQL1j//GsjO7C+B54T6xIwrbJ4hnaGEv6GBlVh2aoJh40PK4SgZ8SpGkB0k17N+wlfq9C2IjvX29OUsEDHyN4E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR18MB3215
X-Proofpoint-ORIG-GUID: Hf8-9shor96AAZ5qTGn7ZNUiCJCuYmSQ
X-Proofpoint-GUID: Hf8-9shor96AAZ5qTGn7ZNUiCJCuYmSQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-10_04,2022-06-09_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 bulkscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 mlxlogscore=489 lowpriorityscore=0 spamscore=0 suspectscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206100037
X-Proofpoint-TriggeredRule: module.spam.rule.outbound_notspam
X-Mailman-Approved-At: Fri, 10 Jun 2022 21:09:20 +1000
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
Cc: Ariel Miculas <ariel.miculas@belden.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On PPC32, there are two indexes used for each FPR.

The last two indexes into the imaginary address space "USER area" are
used to access fpscr instead of the FPR registers. Fix the validation
condition so that the access of the FPR array doesn't overflow into
fpscr.  Also split the access of fpscr into high part and low part.

Signed-off-by: Ariel Miculas <ariel.miculas@belden.com>
---
 arch/powerpc/kernel/ptrace/ptrace-fpu.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/kernel/ptrace/ptrace-fpu.c b/arch/powerpc/kernel/ptrace/ptrace-fpu.c
index 09c49632bfe5..eabc05b439f1 100644
--- a/arch/powerpc/kernel/ptrace/ptrace-fpu.c
+++ b/arch/powerpc/kernel/ptrace/ptrace-fpu.c
@@ -17,14 +17,18 @@ int ptrace_get_fpr(struct task_struct *child, int index, unsigned long *data)
 
 #ifdef CONFIG_PPC_FPU_REGS
 	flush_fp_to_thread(child);
-	if (fpidx < (PT_FPSCR - PT_FPR0)) {
-		if (IS_ENABLED(CONFIG_PPC32))
+	if (IS_ENABLED(CONFIG_PPC32)) {
+		if ((fpidx >> 1) < (PT_FPSCR - PT_FPR0) >> 1)
 			// On 32-bit the index we are passed refers to 32-bit words
 			*data = ((u32 *)child->thread.fp_state.fpr)[fpidx];
 		else
+			*data = ((u32 *)&child->thread.fp_state.fpscr)[fpidx & 1];
+	} else {
+		if (fpidx < (PT_FPSCR - PT_FPR0))
 			memcpy(data, &child->thread.TS_FPR(fpidx), sizeof(long));
-	} else
-		*data = child->thread.fp_state.fpscr;
+		else
+			*data = child->thread.fp_state.fpscr;
+	}
 #else
 	*data = 0;
 #endif
@@ -43,14 +47,18 @@ int ptrace_put_fpr(struct task_struct *child, int index, unsigned long data)
 
 #ifdef CONFIG_PPC_FPU_REGS
 	flush_fp_to_thread(child);
-	if (fpidx < (PT_FPSCR - PT_FPR0)) {
-		if (IS_ENABLED(CONFIG_PPC32))
+	if (IS_ENABLED(CONFIG_PPC32)) {
+		if ((fpidx >> 1) < (PT_FPSCR - PT_FPR0) >> 1)
 			// On 32-bit the index we are passed refers to 32-bit words
 			((u32 *)child->thread.fp_state.fpr)[fpidx] = data;
 		else
+			((u32 *)&child->thread.fp_state.fpscr)[fpidx & 1] = data;
+	} else {
+		if (fpidx < (PT_FPSCR - PT_FPR0))
 			memcpy(&child->thread.TS_FPR(fpidx), &data, sizeof(long));
-	} else
-		child->thread.fp_state.fpscr = data;
+		else
+			child->thread.fp_state.fpscr = data;
+	}
 #endif
 
 	return 0;
-- 
2.36.1

