Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F47546595
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jun 2022 13:31:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LKJgv2QyGz3f7Z
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jun 2022 21:31:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=belden.com header.i=@belden.com header.a=rsa-sha256 header.s=podpps1 header.b=ZGA7s3H9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=belden.com (client-ip=205.220.166.249; helo=mx0a-00015a02.pphosted.com; envelope-from=prvs=7160f83243=ariel.miculas@belden.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=belden.com header.i=@belden.com header.a=rsa-sha256 header.s=podpps1 header.b=ZGA7s3H9;
	dkim-atps=neutral
Received: from mx0a-00015a02.pphosted.com (mx0a-00015a02.pphosted.com [205.220.166.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LKHHn4pw6z3btD
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jun 2022 20:28:47 +1000 (AEST)
Received: from pps.filterd (m0264209.ppops.net [127.0.0.1])
	by mx0a-00015a02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25A09SmE021591;
	Fri, 10 Jun 2022 06:28:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=belden.com; h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=podpps1; bh=FBM65lOE0QCie1fmK0Dd5CZzENs7e6mZHCY1s9tNCus=;
 b=ZGA7s3H9zJPwI7CO3/4bdko1/pDUkWOnBK2Waapz/yUeGl6ZFWgMOxzCKOSCgMtgfJQ+
 seNd08KyJAtVS//jfuPPB5J4ug6p9wQ1BjPMKLC/roX/kXy7lk74pYsBABKIBxOik5Fn
 0xJKrj/0sElgRkwu81IeZACPLHmnLgq/s2aVun7TMlT4kR2MoV4zx0ssrxMVVkT+51UG
 xVqhmc7Xm9EXheWXOpvvtSv4Vy0GdoqBBe5FkIofPE1xDhXsO4+vN4/EDBbXusTWzJfJ
 ArX2xsTadAZZV7FZFtlLNVqR0nE7SH2ratsHtpAigVpVTvgeU77xxXPPGa3b+fYY6VTS MA== 
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2171.outbound.protection.outlook.com [104.47.56.171])
	by mx0a-00015a02.pphosted.com (PPS) with ESMTPS id 3gjqryrwvs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Jun 2022 06:28:40 -0400
Received: from PH0PR18MB5069.namprd18.prod.outlook.com (2603:10b6:510:169::8)
 by CO3PR18MB4974.namprd18.prod.outlook.com (2603:10b6:303:176::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Fri, 10 Jun
 2022 10:28:38 +0000
Received: from PH0PR18MB5069.namprd18.prod.outlook.com
 ([fe80::f5ab:d45e:69de:f99c]) by PH0PR18MB5069.namprd18.prod.outlook.com
 ([fe80::f5ab:d45e:69de:f99c%3]) with mapi id 15.20.5332.013; Fri, 10 Jun 2022
 10:28:37 +0000
From: Ariel Miculas <ariel.miculas@belden.com>
To: christophe.leroy@csgroup.eu
Subject: [PATCH] powerpc/32: Fix FPR index validation and fpscr access
Date: Fri, 10 Jun 2022 13:28:21 +0300
Message-Id: <20220610102821.252729-1-ariel.miculas@belden.com>
X-Mailer: git-send-email 2.36.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR0302CA0008.eurprd03.prod.outlook.com
 (2603:10a6:800:e9::18) To PH0PR18MB5069.namprd18.prod.outlook.com
 (2603:10b6:510:169::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0e0f14ba-7578-412f-62d0-08da4acbfae3
X-MS-TrafficTypeDiagnostic: CO3PR18MB4974:EE_
X-Microsoft-Antispam-PRVS: 	<CO3PR18MB49746BB70E2C9EA1CA3688BB80A69@CO3PR18MB4974.namprd18.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	8JKAupVtTEku6KFqkgZ+1+2WHLnJGta4R3QSa5wdm/DKtNw/OHZtoz58c2Uf0kTmzwW73MnMs3VkEF5qqbgRpBDCW3ZAenB3s3ut6pwUcfIaA9s71rNuMtvGYdCC/NoQuWaioAqxVP+aq6fINi9JFcjil5nbr1s+bqROkoxZlwLoXYGMtzfvngDES7ZOJGVi3L5CtLb8ob9b8ifN1M6oy8iKGdtN7KvicZAVYhRs5h1SWvxbPXLyGDzlSXFJKGvg8ZjJ4TCRoQllSRaVJuaaDchu5v5qBbD2/kcEhaWcJVCsKURbVfinYR1GYHgRkPZAFNWbGQUgbQhGDSpRB5im+KDcCIqbjVc02VqGPLL2VHI/J8blkcXCNH23lEQGCitH7zsdr/MRKJblBnG+ccjqEAe1zyfYcK4mQLfG/GO1KK+evhcCrK9dmNNsbU4+ZHCfpEyssJbz/20lAhYXD0pdDQFulEEL3oqjjxCzEKp2NxBAp0tHE982k1eLz5Okxp6FkzTON5PIj9Atedane8GnVE/SV0f0qHxezWcGiIiHnAzyxu7yjClQ/2Uc3rQN7mUgR5c8XxVVCOPp4rRyB+a/0f5ZU4Ana5ICJTp7zlcSF1TiAFoOuVgWJwB9XZRIYOJCt2XsHxNr6u8mq28vsJA0xw==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR18MB5069.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66946007)(508600001)(66556008)(2906002)(66476007)(4326008)(8676002)(5660300002)(6666004)(6486002)(8936002)(83380400001)(44832011)(186003)(1076003)(86362001)(316002)(107886003)(38100700002)(36756003)(2616005)(6916009)(6512007)(6506007)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?uBJHkrNWGqTR+GNzKm4YlryGwsNuzSXWsQvqxdCGY2oz6wJFcW50t7ONfxNy?=
 =?us-ascii?Q?twzdBCpNmrTnmEuzjMtsn+khks8lwoBJF6Haf6ZJXz+w5tn8ByUwjdtgve9f?=
 =?us-ascii?Q?eVHrHZTepJAzOGVXyfdgTPjK9Q4dLB5zzNJ5kjmoYVqLun6bLeD3KBNbC3gz?=
 =?us-ascii?Q?0p7OrhrEXRx7gRr/UyJVW/Kr1bO9CZWox2VEMGJI3tcB7B7wsC8M8K6d6q0U?=
 =?us-ascii?Q?DIg+Tc8yvQSlXe8XngWuBV4ixhD60MulgufOyjyNqNIWpG6MtDMRUbKw0Cjz?=
 =?us-ascii?Q?+/vKXmYwo1RuFAzz/Yeb27HsInLX5zRoGqdEAB1AWoK6XbdvsPUfCuog9lgl?=
 =?us-ascii?Q?jCkPG/yHhPv3bqdPr8KtAaiNKc78dqixB/dUqNsOQTdvZrgNJMcRU1OKIeUz?=
 =?us-ascii?Q?uzrlkIANLaSNjSWy6M2ZKgfD5bakOWi2d6GbHYSg9kkrIQ1BE2Cx54qmaZiL?=
 =?us-ascii?Q?/kMbwlBleBcY6GWDnn41sGJj5cO5IpIxrgl6m0siMQ61TGlCJA68LN2bhepm?=
 =?us-ascii?Q?ugJkrg8uc7ZaMoIusj6lyF9AWpAnWu4R/3nIUPo7643Pof+IKbhx86aP9SPX?=
 =?us-ascii?Q?SeUWS6dhbchTCaW2WyEcGcdl5bsg468i2Zl3I07s1jUr3wXPVB5qCmn21j6n?=
 =?us-ascii?Q?hgQpqOxHG4eecaO06OzXQH3snTMPt620r184yV7wCxM0aKFYbd6mOxExxb6F?=
 =?us-ascii?Q?ShIAHpCM1qg6eig/msSl47nFQ81BHj3e3E1q6a4k2X2+Vs4+vbE9xwZZnapY?=
 =?us-ascii?Q?9KgEOOosE4uFjS3tCyixdgh+iFQxTNkjDpRKcYVQyDn4pDZHQnOP6Ht8NEx/?=
 =?us-ascii?Q?YUjawFE9qgauaNlYw4u0AhNTuAsYzNNiTD2aWYeIYD+4PkR+bK86f+18062m?=
 =?us-ascii?Q?40CzfbuVmBAoQUVXLm6W8+sr5KjRdeLSFE171tYvK5Avo4Amz/KWcFBm8GmL?=
 =?us-ascii?Q?7O2S592wjHfIxq+odm5wdEr/wyA4ZrMPPexzRQtcXsirKGJk4WGADpZ2LtED?=
 =?us-ascii?Q?Y5PiOYnSa70LvvGOV5IZ7I+WN8YPKKOsYhDdNv0lc8f+Yc3EKSfb+T0yX5KS?=
 =?us-ascii?Q?zmbL1PBMlzjtEl2xBl+gO88i4JyBOEdNKsiqumJhug+jpGJJ2wP1CBWvlf+a?=
 =?us-ascii?Q?ZiMRSOvcOyH6E0NphvoGibq2bfNsFmgVfa5umPXDXDcgZARQ+Amn5Lemp8zv?=
 =?us-ascii?Q?lHZs58dysQXxAezfQE7pFSiYoztOcZKozsIlyenH9Z+NLBVVIWqINZju7yJy?=
 =?us-ascii?Q?GwYkzAtgBmj7r+DwmA+3LUfxg6dRKg30TGdHiCYSCZoChBsqrIM6f6wWlREU?=
 =?us-ascii?Q?SS71dmJjiP6lbe+b2tqaZD+kYLffi2sZApTl/bFBvOThpwYwjU05Y0XhWJw+?=
 =?us-ascii?Q?8rGGeJ9zse6dWPsRyh0jgKrPju1mRS2UGJKvxWnqHvjGhh/hRhd53pzsRNld?=
 =?us-ascii?Q?/1Dz/bp0a3rZEVh9ZfhqSZyKpD9lcozxZFA1+NvBjAJ0REhKCO5NKdd2h0qN?=
 =?us-ascii?Q?YivQORBrJi4+JDIB3LxoaVqZgR0xqbppoMG4QuUF0s9/q8Wz4ivbb9lP/VkY?=
 =?us-ascii?Q?iL8Pf4VMY6QPW35e3Qh3EXxbfqprk1RTl9KJqwBbyTi8kL5tjd45fHaxMEEq?=
 =?us-ascii?Q?0wMacheMu6I/EFdL/LJQ0otqAg6ts4M1NCL5yTIwGvejOEzgABQPPdMX9tzP?=
 =?us-ascii?Q?NG115IqEYAOiVOnNCczC+mQpui7Z0sz9shf7Lp37k1sd5QPaQWjHGwLbgLLV?=
 =?us-ascii?Q?EBuqKgmmHcUiiVabPdK4faxYygJ9xR3/0lJAlj91294pQAr/n+wbcIWR/HpO?=
X-MS-Exchange-AntiSpam-MessageData-1: EqoD4vt8DD4eYEUvm3JlsGmuCS2+tftitSg=
X-OriginatorOrg: belden.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e0f14ba-7578-412f-62d0-08da4acbfae3
X-MS-Exchange-CrossTenant-AuthSource: PH0PR18MB5069.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2022 10:28:37.6400
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0f7367b1-44f7-45a7-bb10-563965c5f2e5
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BFtZCP+cdf2CrZZyLW6MN1HlgF0HR2TBoDeiJTjc9FzewYsiGXoOP3Xx32N69V8r/KEQUPTbZe18ZFVp/cEqRdgvKUFyEXTQcFbVycTMDEs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO3PR18MB4974
X-Proofpoint-ORIG-GUID: XwypwcRcIO9qeot965_oVr_CJbrvMuzx
X-Proofpoint-GUID: XwypwcRcIO9qeot965_oVr_CJbrvMuzx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-10_04,2022-06-09_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 bulkscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 mlxlogscore=496 lowpriorityscore=0 spamscore=0 suspectscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206100039
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
Cc: Ariel Miculas <ariel.miculas@belden.com>, linuxppc-dev@lists.ozlabs.org
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

