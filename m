Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 974D154658D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jun 2022 13:28:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LKJcD31jZz3gH9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jun 2022 21:28:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=belden.com header.i=@belden.com header.a=rsa-sha256 header.s=podpps1 header.b=5skRgTQw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=belden.com (client-ip=205.220.166.249; helo=mx0a-00015a02.pphosted.com; envelope-from=prvs=7160f83243=ariel.miculas@belden.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=belden.com header.i=@belden.com header.a=rsa-sha256 header.s=podpps1 header.b=5skRgTQw;
	dkim-atps=neutral
Received: from mx0a-00015a02.pphosted.com (mx0a-00015a02.pphosted.com [205.220.166.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LKDZm40M4z3bXR
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jun 2022 18:26:33 +1000 (AEST)
Received: from pps.filterd (m0264209.ppops.net [127.0.0.1])
	by mx0a-00015a02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25A4f9ap024575
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jun 2022 03:16:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=belden.com; h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=podpps1; bh=FBM65lOE0QCie1fmK0Dd5CZzENs7e6mZHCY1s9tNCus=;
 b=5skRgTQwMRsECgcVb8cnOu6WKhyBHdyWO9XW22CZSqa3Ldvl66utYjIKl6DtsHYQaNho
 NZPHGnbRt18r6COfWtWCn/yb3uLGkiTkTr/TzzO73jXFdjVRmqtIeL9xQC6q9TmI8bYZ
 CrejYtAi15j9qwe8sqqUWoxh9hA6cRfCLYTzXMRd6Xmc1EuUl5P69YcSaax+dO8/o0dp
 0H+cHZc7VYxAib5ZPf1vzW36w6l+99arnNqk/16Ne2LGkusnWFACBtPyO8uMYF/fEwlX
 G3+KTQyLPOhggevNZ3N/IJiRqsNeARM2bi/wHCh00MuaSo47gjNLJYYS/SSm9IHzS1mn Aw== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2170.outbound.protection.outlook.com [104.47.55.170])
	by mx0a-00015a02.pphosted.com (PPS) with ESMTPS id 3gjqryrda4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jun 2022 03:16:25 -0400
Received: from PH0PR18MB5069.namprd18.prod.outlook.com (2603:10b6:510:169::8)
 by SA0PR18MB3616.namprd18.prod.outlook.com (2603:10b6:806:72::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Fri, 10 Jun
 2022 07:16:21 +0000
Received: from PH0PR18MB5069.namprd18.prod.outlook.com
 ([fe80::f5ab:d45e:69de:f99c]) by PH0PR18MB5069.namprd18.prod.outlook.com
 ([fe80::f5ab:d45e:69de:f99c%3]) with mapi id 15.20.5332.013; Fri, 10 Jun 2022
 07:16:21 +0000
From: Ariel Miculas <ariel.miculas@belden.com>
To: linuxppc-dev@lists.ozlabs.org, christian.johannes@belden.com
Subject: [PATCH] powerpc/32: Fix FPR index validation and fpscr access
Date: Fri, 10 Jun 2022 10:15:49 +0300
Message-Id: <20220610071549.160798-1-ariel.miculas@belden.com>
X-Mailer: git-send-email 2.36.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR08CA0090.eurprd08.prod.outlook.com
 (2603:10a6:800:d3::16) To PH0PR18MB5069.namprd18.prod.outlook.com
 (2603:10b6:510:169::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: af7c90fe-ca3a-4b56-e7d3-08da4ab11ee2
X-MS-TrafficTypeDiagnostic: SA0PR18MB3616:EE_
X-Microsoft-Antispam-PRVS: 	<SA0PR18MB3616D39E72E0607EED615BB680A69@SA0PR18MB3616.namprd18.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	Uz9OVnF16RrczrLFHY5MoLitAM+YV2EccMAHOisythOUNMYO587xk8Xy5Mo6xVyU5SxGES1qyN6Baez+uhETRBOgWZmB1/5rXWB67UxPoFzkGzent+wiepbGLB6aq0MjKH59exHU1CGtaVuTRHdLNWibQn7U2oyPGqGvGBYzc11vOF9ecMQnfqlVIYl0C6RotH3BuQaJCCSaZ6lfMV0+t2CuECMZSU8CWqrghj9Auss0nwVrfm2sVmYbzOy3WBfDjE37+5MPJv2FP8yv6WYaX2quIJIBityHVf06IPc7yRRa+YatUjHOFA0Y6UMzOxd38Dd7jHwAFf53eeew4aj0m8BA71Dw9FEnFiklSNjMjejyuRmjDnM2BPY6lKS5kbQ5Ax9Pj8Qqw/2C5L3E0RPiAvvv/ZUOXgQz59TIPAqQY/ZadqcDlkfWGEfxGVrF71OB1eN/Zfzu9CvSRwGY1cUdaMYCdRZLQxA+9dgJCtfZroggGZuI0i7kZDZ2vb5g1Ruqri6R/nYUtpoOkUrEWDF0bsqT2pkRS0heJoUa5sL64/JMEOG7n4ttVfd+3J4Zwc8pXs3X8xPdp7bvhWtGmouLoQts35yO6En2CXeB+3nKiJX4C6+IFea6V/DwVEhFlYBAyFMWuVIgTQic7iLJOLB7LA==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR18MB5069.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(83380400001)(316002)(6486002)(2906002)(8676002)(66946007)(66556008)(66476007)(5660300002)(4326008)(44832011)(36756003)(6666004)(52116002)(6512007)(86362001)(6506007)(186003)(2616005)(508600001)(107886003)(1076003)(8936002)(6636002)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?vQYzQCL4j+OsbY38jBsMlR2k6o1ZPrsXZGnDjMPv5CVyN+HNOd03hKpFy5N5?=
 =?us-ascii?Q?//+sHP6E7w3HXdzamshJI6SdAInYXGNVyGv3L7TbN+lv4oSEdNfKVeSlIlvE?=
 =?us-ascii?Q?BNmIfKhU86cUd8qp3PIevEv3RrSYt3PSoBz86so+FnIW6iarhi5kkXwBUV25?=
 =?us-ascii?Q?cPjP2n6TGzS3sMcL7yEsZPXuIemrj/k3r4QW6lbui+1iUVPTBz+5D98ZMO1p?=
 =?us-ascii?Q?2pU7wVUw20ujv0s4/qUt1K3V/DRVcyVwyLcig64BzOmDUYxB2Kl1JrsRuO3Q?=
 =?us-ascii?Q?g62auIWPJSb9ARQVYdcD2zq+liNPBzyESsZlmNqmpoXri73F1F8exP6HIsvQ?=
 =?us-ascii?Q?ZjAfxMRw0bgK8f4CeVtAVbDeQhlKKGqC25CBfSqmi9IzSHUbMYxsc8L3CSeh?=
 =?us-ascii?Q?LioC7vIRuNk7SLVcDhzrlPGT+8nbqd5Yl26HPVtZGA1bWp/kXOw619WjlOc7?=
 =?us-ascii?Q?V8OULyvx+pFo1nNcLIDcFT4j+nE3fiGfq3C60SKCpFPgaUtMrCtBlWxfLB82?=
 =?us-ascii?Q?jOuqd8LYsObuFaweaHlj285oRd407zqoJ4u2AqQYHbtuAWMjQtJcCU5yKUEv?=
 =?us-ascii?Q?E2P7zE/BLcFaZBkwpiL84D0xJYPwETd1BzDSBMqAkDg/BEv8MSolMsPF+EF6?=
 =?us-ascii?Q?f8MthxOEglYSBehMtElAh3VAjtdbObji3aM7k82VnZvz3vB1Sa2fgvq8ti1i?=
 =?us-ascii?Q?2BKSw/IqyclJ2MEkMq9a78Rs9h0QyO8+L8YzST4WqyBAnot9UyewTHaUXK5w?=
 =?us-ascii?Q?JY6VMveuGf9MSfii0G9AVmytjTcem6Zm8GhzW4AEIP4P8huHAKWoUb3ll7LY?=
 =?us-ascii?Q?auWmteuJTeXZHzudoG9BGld4pOar+tJeLR6h95u1y05y1nY+hnORHifhYybE?=
 =?us-ascii?Q?WFrzvhY6sjG93+SpRilocmA/Y0ll0oVDtglfgkM1P/gOA1YnCfRc5lm2SOgJ?=
 =?us-ascii?Q?5KSWlXB9GbpAAXwskrCqW/GsAlLywQeBIeJ4p+4vZpxm5UAkdyuQ+TL0IsmW?=
 =?us-ascii?Q?Z9W/WHzfmIKbkktfAlhNuCiOEuwosuoRlWnZR83hj62TFY+9+0rOETxmnIQn?=
 =?us-ascii?Q?285jMvTC1RnKTxXKzM6VD0Cu454K8wpRXjBgo+Z5iBNvim5tIziELXg+qO+x?=
 =?us-ascii?Q?1mGc7dXSkm8Vl0Beuj+9IK6d2HJGGplHnryQ3bd5rw1mAAgY8OMx7tcsRXty?=
 =?us-ascii?Q?JTZsAluMoQgHlA8kWgydBaHxXmUMrXZ/IqWkbGA8oG8VYmxwblzmXqxGSkov?=
 =?us-ascii?Q?5QNiM9LQyXIsLqIg+yqhCCZ/FqCERCNWm5QW0QLObH6dN2tzRxx9F0PM8tg8?=
 =?us-ascii?Q?xu8KuAC5E+YHMQXmna7M54M8XWVb6/rrdQ1zBi6TD4eKlhuhNIZsfXiQKmbo?=
 =?us-ascii?Q?eQqY862zscp6VTLn8SnqCQ5Mvzk5Vv4Gds4i5QYnGwR/LKXAcPU9weXnaNj4?=
 =?us-ascii?Q?QE7q8xhUOvPzZnpJgH1amzpiywesvMH+UEcX7KsO7tb229JNPEv4TR6ImBrr?=
 =?us-ascii?Q?LMgGJEGhunjHtMwcdJ33xwNykEQkioQ8QPjCvWtULLcElqMaX8phhURpggLs?=
 =?us-ascii?Q?692oXi9XeJcz/MUI2+aSmjnZAkI9RTQZJih0ct+eA53HQeL7b4hwHKxKdQRA?=
 =?us-ascii?Q?JKSgKI43N6VKrYQ02UaeamyoGuhd1iw5jqWGEXk6SjidLXQK1NsqXUZQnPhr?=
 =?us-ascii?Q?RQ5j0ul2XPqtGKwVe4WKnNG5IAfeBFNvbpB9sNCpiNe1vqtnoTbWrneuwbwS?=
 =?us-ascii?Q?8ohEaH4YfS/yne283nlmdfBtHbw/yJNHNKus5mIIpWgHLhIN7ybdBJ8bVVxk?=
X-MS-Exchange-AntiSpam-MessageData-1: 40Q031qKnYTEto5jmkZt3mcXGMZ8JJOWWTk=
X-OriginatorOrg: belden.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af7c90fe-ca3a-4b56-e7d3-08da4ab11ee2
X-MS-Exchange-CrossTenant-AuthSource: PH0PR18MB5069.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2022 07:16:21.6386
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0f7367b1-44f7-45a7-bb10-563965c5f2e5
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LsOGGErJtWgKen+moe955KLVcRaS+VgABYiU+6YSAV9rL+/c9FjO60zX7jBesdTE7P1v9jE4ZJEDRT4WcDNHcqfPlkfCL3q3kecZxRGi1FM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR18MB3616
X-Proofpoint-ORIG-GUID: NfX7ysAn7xj_uYDO73X7U6FnNYZmj2if
X-Proofpoint-GUID: NfX7ysAn7xj_uYDO73X7U6FnNYZmj2if
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-10_02,2022-06-09_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 bulkscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 mlxlogscore=516 lowpriorityscore=0 spamscore=0 suspectscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206100025
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

