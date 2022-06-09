Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B11D546546
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jun 2022 13:14:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LKJJW0Hgcz3f7v
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jun 2022 21:14:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=belden.com header.i=@belden.com header.a=rsa-sha256 header.s=podpps1 header.b=q0tizpIe;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=belden.com (client-ip=205.220.178.250; helo=mx0b-00015a02.pphosted.com; envelope-from=prvs=7159c858d4=ariel.miculas@belden.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=belden.com header.i=@belden.com header.a=rsa-sha256 header.s=podpps1 header.b=q0tizpIe;
	dkim-atps=neutral
X-Greylist: delayed 859 seconds by postgrey-1.36 at boromir; Thu, 09 Jun 2022 20:11:02 AEST
Received: from mx0b-00015a02.pphosted.com (mx0b-00015a02.pphosted.com [205.220.178.250])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LJfxf6kMFz3blW
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jun 2022 20:10:56 +1000 (AEST)
Received: from pps.filterd (m0264210.ppops.net [127.0.0.1])
	by mx0a-00015a02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2598qmLj025059
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 9 Jun 2022 04:56:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=belden.com; h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=podpps1; bh=WFpyIfR/JFvLg7ap/w5QXz8ahJGkfTDNeujkdOlJpFE=;
 b=q0tizpIeYL0jTTvxkD4XbLItuketVrAlxpvbgCmtqqCm6JRuteNF6MVCv+pry1UhGmL6
 ekibkRnQLaodcuIS+kv87bALAh7v0ZMy1mtbjVF6Il5EoqIIIcNBdYxUwn9qIN0gGDMN
 wLqMUTHmVrIQ8/eOAfY8RgI7fCGhKEdPujx4d1VHBYBtFOPeMQeNb55HSq5N8dwLqC0F
 D9CGOO9bXhr2wRxzwCaT+i3RrunagTTX41Jqv5JFbqtexes4W9YmG3UHw/xDb170rmSy
 1rKoRn5T4sSlTa7GoBJGwNyQ6lEsvJLXyRfI16b65c6GP7Tiqo70vUY1MqeaWp3hxm0B ow== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2175.outbound.protection.outlook.com [104.47.58.175])
	by mx0a-00015a02.pphosted.com (PPS) with ESMTPS id 3gjuft3mhe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 Jun 2022 04:56:34 -0500
Received: from PH0PR18MB5069.namprd18.prod.outlook.com (2603:10b6:510:169::8)
 by CY4PR1801MB1992.namprd18.prod.outlook.com (2603:10b6:910:78::36) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.19; Thu, 9 Jun
 2022 09:53:01 +0000
Received: from PH0PR18MB5069.namprd18.prod.outlook.com
 ([fe80::f5ab:d45e:69de:f99c]) by PH0PR18MB5069.namprd18.prod.outlook.com
 ([fe80::f5ab:d45e:69de:f99c%3]) with mapi id 15.20.5332.013; Thu, 9 Jun 2022
 09:53:01 +0000
From: Ariel Miculas <ariel.miculas@belden.com>
To: linuxppc-dev@lists.ozlabs.org, christian.johannes@belden.com
Subject: [PATCH] powerpc/ptrace: Fix buffer overflow when handling PTRACE_PEEKUSER and PTRACE_POKEUSER
Date: Thu,  9 Jun 2022 12:52:35 +0300
Message-Id: <20220609095235.37863-1-ariel.miculas@belden.com>
X-Mailer: git-send-email 2.36.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR09CA0079.eurprd09.prod.outlook.com
 (2603:10a6:802:29::23) To PH0PR18MB5069.namprd18.prod.outlook.com
 (2603:10b6:510:169::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c4af59e0-d7ed-48ac-0335-08da49fdd71c
X-MS-TrafficTypeDiagnostic: CY4PR1801MB1992:EE_
X-Microsoft-Antispam-PRVS: 	<CY4PR1801MB19927EF244C34FB19BE0E5AE80A79@CY4PR1801MB1992.namprd18.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	KFYk2m0J5O5//E/0yLPDjUT9MB7WvGIerIlPAj+Oe2kH8PRVB5UQD35gJWOsMThVwLOljQCXGSMP20I1jj5asvnPiH4Gq1Qqd1EIGAJOat0WWMPT2Eipbd7IR8UWXAEkwu5RYSlhZU+ok5wcy7yFtNyV5ghS/Q9UhP7lauxZI/fN5PVFH6cqPYOadnhhLktIjKgqgiMSFowSIG/WiGPx9l1XXyML3+wSCVloVKAM9xdDt17Y8KPz4aDbkfey3rEOLcnuxgt/W5+o9HdttEi3ibLkOQ3BIy2+vu+5GiA4MUqFbR2P0xreOB6eCisVGlS6K1+zdeUyvQK4pUn6fO0TeNp2CN35uCfkDzJVcEhXvC5xGUvFxgCUkfBy6kbxU8ZggRVdkMLigFKhA3VnLjcEJuGnaHDTpLiPlo0W3UqHBdyDw0SO1lcKs1/Xznc3waVAOJzfYKM/5atFloY+a/spQIB4akKVrw0XHxcOP8FXShFTwmHVLsteZ53DbP9DXXIy9eZul+He3NEAvI9Iq1Vlx9dO1/NQMKZqsYVUf+iQrIDh/x1lBrpFl2fDLV7oDJmbgJLKYweSnsducpSwWyw7/sRs2LBjNUHi/FWD2fwoQQ/TxvUOjcv7KEM/+Jt9Kj0qYPE6vNh9VQxA5dqCcTbL2PYzE4OMSJarx/SFx7+nDuF/nszU3txhK78Wjx1al+fEyNbEHd0kRaw/c8q0hzTvt+HNdHQ9MJ69JI9aYez5exA=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR18MB5069.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66946007)(966005)(6486002)(186003)(66556008)(5660300002)(508600001)(4326008)(66476007)(2616005)(8676002)(107886003)(1076003)(2906002)(52116002)(8936002)(6666004)(6636002)(316002)(86362001)(83380400001)(36756003)(44832011)(6512007)(6506007)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?cXFkStdnL/xcWRspjSrRZk3cg50bJQ3035NM0wLYv4pE4faqHeTcg8z2PBd/?=
 =?us-ascii?Q?ssTUKEEQGq9S7p1xvZTZ5KCr9RNIP5OIbbMHaUhCRTDxmFv7jO/16L98Kc6V?=
 =?us-ascii?Q?ZfyEo2zBqHbcFRMkZ0Whd4NPV3SzooSglGKeI+YbVF9kUQ1GwPmjVk6nXK4f?=
 =?us-ascii?Q?lZ4hHE6mBkRw7x0lBpK7AxXg9miZP7OGzCBoh6TYRKHhlL+ohE14LVn5m3HV?=
 =?us-ascii?Q?Gvzx11lEwCXc68TdMUncd5qJXuhAv90RIECb2chnXeDlsyzB/P274IBYLe3q?=
 =?us-ascii?Q?HmLhhqFx25/y73Uhx66e39EWBHetszL6TI/PBYtCLUoHkRRUVeG3Ky/lGe7Y?=
 =?us-ascii?Q?ZA/MvADAOTynbIct/s/i+j9wkihf+bIAGJ7nozbsu4zAcexWkLrHMYCwqwoe?=
 =?us-ascii?Q?lFWS98Yl0AwIFd3Vlg1Prx+jqZhfb3IJF1q3BGcwF1T6gjCTqtI/dgDqC/Tb?=
 =?us-ascii?Q?LMj+K9i6kpVmDIT9n1ad78tocoFzKPHvXi/e742KmktqRoUDKjijmZ3Y/9v2?=
 =?us-ascii?Q?Mla2CEFPb9XQftD5/Gy6LTWD9YSi+z0sY+MKqGdHyqsEJnoQqpS+LuIJkTGV?=
 =?us-ascii?Q?iOkANZM/BMrwSrZjSdx3zCzfi70fYxtj+v+0UOlVJTA3jETp+VwGAQr9pIsp?=
 =?us-ascii?Q?fdhqX3pLppQSANz5k0ukOOmbzDYRpfLMxYhuVfXSCBo2b/IyzfeuhQ/s8JbZ?=
 =?us-ascii?Q?xWSbyR6O3TwqOE7id30zTjkH+xn4uZnlfGvqLVXn1hqa1hCljcmvmVsDh8V9?=
 =?us-ascii?Q?7Mw2eJYYOKmsx37yJBVqFmiIxd/kuLDcchsbZc+hMue6OiTK+6pvp1OhC4Wu?=
 =?us-ascii?Q?lzbdU52f2ndjtwORNuoQJPBtQ2sXdjwO4dlmcc9OzljhV2LNOx+LWnPTetrr?=
 =?us-ascii?Q?iDfxtQUTJq026ixbAx+DT+J5o/zpA+jlnU/jONvmMw8Lg3qLsA3jIGmxei7S?=
 =?us-ascii?Q?riJ87qU5BSZEzZuQwD8u5jvk3RwiPZYYN4JkraQqiUtg5JEzL16mqWvT5l88?=
 =?us-ascii?Q?3tdvQ1Qa4Al9VQNZ5Vgm/kst0m/T3Kmf0+UGQPFF1GEujGHlw/TN15ZpfxyB?=
 =?us-ascii?Q?/rPG9mUn0HO+eKCAo3xvU6fkI0bsXWcojsCDmZo6FMvs277ivdBqEJEdBE/S?=
 =?us-ascii?Q?PHNd35CEbprHGLrxRugUIvjDLaBN5u3EtySNypmLfgkxvuz8gkN6ej96P/pp?=
 =?us-ascii?Q?dZiXK+m+p39TWVMgtK7DT7mmEhQ6CgKIHCWCsdye+8+znZwWbr2DYqMecZ65?=
 =?us-ascii?Q?QMaEpJPvwHvvOtHnycoeShUVIF5xZmYuxZwTT5DeiShvMLM9BZ4t8i/zQ2Tu?=
 =?us-ascii?Q?9RXDffuoYAsNbGZ0AFpf/EYNGdJyTB1VjW8EVbHgwpdwRKbCvi79dxq/mDR9?=
 =?us-ascii?Q?u1EaQfUanONPpqA+A3tg5vi6DXL7x+SschilnIn6GcLrNX3+XT8TOGa2alPF?=
 =?us-ascii?Q?+93+UZDveXqUokqss2USSRblSfRoKiTnXWtcwEEUZOUharb3Ei7z/F16yje/?=
 =?us-ascii?Q?souerHK1+uZ9aBrQVwRNd+X+kIgI4bHmYEcw8oWfXV49VdsRHZnqv5m2uqEZ?=
 =?us-ascii?Q?OYG9g6mOSCdv3ha+3kKA4w431+y0FMZTQv0zBmKHFmKbgeP5CMixxHmvl4kK?=
 =?us-ascii?Q?GA13957pH5yvt4RNuvXCyYK5bgXDsI9M4Rba8uB3fbz1Nhs/H369N+/aflz5?=
 =?us-ascii?Q?I5x6y91/cSLCvJ8+wDysZE7f9PskEYaKFi6bY6aDoQuHzTId71gYyX43EJNc?=
 =?us-ascii?Q?HoavGU1e/7nvhrLiibSvrJm9YOTuTUFRn2dYXHHOTaL2nuv3vlMEa2GjCFkp?=
X-MS-Exchange-AntiSpam-MessageData-1: lniP5uw6C8ftRzxYISK4x66iZpPCQVWd/LQ=
X-OriginatorOrg: belden.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4af59e0-d7ed-48ac-0335-08da49fdd71c
X-MS-Exchange-CrossTenant-AuthSource: PH0PR18MB5069.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2022 09:53:01.2868
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0f7367b1-44f7-45a7-bb10-563965c5f2e5
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 38AB/tNOdZfkC8mCfyc2YjXYQoUEQJMOt9E85IJZ1hJQhUmfdnRyPuQdVIAvrHt5NhNd6ijnQZ3za2mmV0iE2FhQGU9Pjg5lzQ1pDtejwXI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1801MB1992
X-Proofpoint-GUID: 4DpmvFxzoGB_H_qySdgU3-2fOQkshwsN
X-Proofpoint-ORIG-GUID: 4DpmvFxzoGB_H_qySdgU3-2fOQkshwsN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-09_08,2022-06-07_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=575 clxscore=1011 spamscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 phishscore=0 suspectscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206090040
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

This fixes the gdbserver issue on PPC32 described here:
Link: https://linuxppc-dev.ozlabs.narkive.com/C46DRek4/debug-problems-on-ppc-83xx-target-due-to-changed-struct-task-struct

On PPC32, the user space code considers the floating point to be an
array of unsigned int (32 bits) - the index passed in is based on
this assumption.

fp_state is a matrix consisting of 32 lines
/* FP and VSX 0-31 register set /
struct thread_fp_state {
u64 fpr[32][TS_FPRWIDTH] attribute((aligned(16)));
u64 fpscr; / Floating point status */
};

On PPC32, PT_FPSCR is defined as: (PT_FPR0 + 2*32 + 1)

This means the fpr index validation allows a range from 0 to 65, leading
to out-of-bounds array access. This ends up corrupting
threads_struct->state, which holds the state of the task. Thus, threads
incorrectly transition from a running state to a traced state and get
stuck in that state.

On PPC32 it's ok to assume that TS_FPRWIDTH is 1 because CONFIG_VSX is
PPC64 specific. TS_FPROFFSET can be safely ignored, thus the assumption
that fpr is an array of 32 elements of type u64 holds true.

Solution taken from arch/powerpc/kernel/ptrace32.c

Signed-off-by: Ariel Miculas <ariel.miculas@belden.com>
---
 arch/powerpc/kernel/ptrace/ptrace-fpu.c | 31 +++++++++++++++++++++++--
 1 file changed, 29 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/ptrace/ptrace-fpu.c b/arch/powerpc/kernel/ptrace/ptrace-fpu.c
index 5dca19361316..93695abbbdfb 100644
--- a/arch/powerpc/kernel/ptrace/ptrace-fpu.c
+++ b/arch/powerpc/kernel/ptrace/ptrace-fpu.c
@@ -6,9 +6,16 @@
 
 #include "ptrace-decl.h"
 
+#ifdef CONFIG_PPC32
+/* Macros to workout the correct index for the FPR in the thread struct */
+#define FPRNUMBER(i) (((i) - PT_FPR0) >> 1)
+#define FPRHALF(i) (((i) - PT_FPR0) & 1)
+#define FPRINDEX(i) TS_FPRWIDTH * FPRNUMBER(i) * 2 + FPRHALF(i)
+#endif
+
 int ptrace_get_fpr(struct task_struct *child, int index, unsigned long *data)
 {
-#ifdef CONFIG_PPC_FPU_REGS
+#if defined(CONFIG_PPC_FPU_REGS) && !defined(CONFIG_PPC32)
 	unsigned int fpidx = index - PT_FPR0;
 #endif
 
@@ -17,10 +24,20 @@ int ptrace_get_fpr(struct task_struct *child, int index, unsigned long *data)
 
 #ifdef CONFIG_PPC_FPU_REGS
 	flush_fp_to_thread(child);
+#ifdef CONFIG_PPC32
+	/*
+	 * the user space code considers the floating point
+	 * to be an array of unsigned int (32 bits) - the
+	 * index passed in is based on this assumption.
+	 */
+	*data = ((unsigned int *)child->thread.fp_state.fpr)
+		[FPRINDEX(index)];
+#else
 	if (fpidx < (PT_FPSCR - PT_FPR0))
 		memcpy(data, &child->thread.TS_FPR(fpidx), sizeof(long));
 	else
 		*data = child->thread.fp_state.fpscr;
+#endif
 #else
 	*data = 0;
 #endif
@@ -30,7 +47,7 @@ int ptrace_get_fpr(struct task_struct *child, int index, unsigned long *data)
 
 int ptrace_put_fpr(struct task_struct *child, int index, unsigned long data)
 {
-#ifdef CONFIG_PPC_FPU_REGS
+#if defined(CONFIG_PPC_FPU_REGS) && !defined(CONFIG_PPC32)
 	unsigned int fpidx = index - PT_FPR0;
 #endif
 
@@ -39,10 +56,20 @@ int ptrace_put_fpr(struct task_struct *child, int index, unsigned long data)
 
 #ifdef CONFIG_PPC_FPU_REGS
 	flush_fp_to_thread(child);
+#ifdef CONFIG_PPC32
+	/*
+	 * the user space code considers the floating point
+	 * to be an array of unsigned int (32 bits) - the
+	 * index passed in is based on this assumption.
+	 */
+	((unsigned int *)child->thread.fp_state.fpr)
+		[FPRINDEX(index)] = data;
+#else
 	if (fpidx < (PT_FPSCR - PT_FPR0))
 		memcpy(&child->thread.TS_FPR(fpidx), &data, sizeof(long));
 	else
 		child->thread.fp_state.fpscr = data;
+#endif
 #endif
 
 	return 0;
-- 
2.36.1

