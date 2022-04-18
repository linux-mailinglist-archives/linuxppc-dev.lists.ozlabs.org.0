Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A63B5056D3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Apr 2022 15:41:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Khp4g0dqZz3cgP
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Apr 2022 23:41:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=windriver.com header.i=@windriver.com header.a=rsa-sha256 header.s=PPS06212021 header.b=GnoF1GZS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=windriver.com (client-ip=205.220.166.238;
 helo=mx0a-0064b401.pphosted.com;
 envelope-from=prvs=1107a9ca43=zhe.he@windriver.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=windriver.com header.i=@windriver.com
 header.a=rsa-sha256 header.s=PPS06212021 header.b=GnoF1GZS; 
 dkim-atps=neutral
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KhnyM1Fm2z2yn2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Apr 2022 23:36:10 +1000 (AEST)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23ICpX2o007677;
 Mon, 18 Apr 2022 06:23:10 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=+ZlBGbmmFuH0EnsblfGqUbucFTvETbcXmwFeuOEOMkU=;
 b=GnoF1GZSc42SUp2R2+eM0qX5TZzwqiEFt3azsmsE9SlfiGba0YNDv53rX4VKgmsNmYrM
 h8+pKZCv6BSr/yIIwGVH9yKnLqP9GT8yJKpdc3z2kCcf7YZ2GQ6BmEtutO8DaeKuIPo/
 qQlSD6Kgvg6j32Dr51WtKcHPq9h5osYQXZOiKd4aSVc03C5q4a3Nm26gImZ+7KX+tz6r
 QAoo5qoGBRAcjU6K7KVl7Ub21w2WQAzGYK192aUlezhBCMFm3wM+kyzmE3Pp1Jcalwgt
 kla+R3ahG/D1eX7i/fQ5KC2f1wuQRazHOlq5+CQbhYNO+j6qq0OUQCFXemjN/v3froFj 6A== 
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam08lp2041.outbound.protection.outlook.com [104.47.74.41])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ffs3118r9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Apr 2022 06:23:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S+NQy8ZXT4CVp3bQBw3ehPG4rtu11IDJ2LI6L6Gf+T/8PPxmmaTVIIbJCt8SAjv1erbJbu4AX0SiuSFFPHKFF4ijCHwOTbcZR1m33t87AtL+d/pUX83cPfgEZhPwIE0e2V82r4AqF77X4/fG7mafzSuCPoayZIcxXdmA5mBiOeUQ7tNJQKCsTGxYNYAvBJYK8zlKZ8Yess7UapYjyzohhBAbUQw78lz7l1filpwSvi65v25VgOu8hSIUxsBadVBIe7gWlPkco88Xq9l8qunrV3rfz1FiAMI9cej1a9jQkLIxMjV8enVkFLqlwu67H8TpPvnU7swcqu+VB2iDSg/wCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+ZlBGbmmFuH0EnsblfGqUbucFTvETbcXmwFeuOEOMkU=;
 b=jeyXHRPsQUK+uIBWBz3ODTQgnj36mKLZLXwzHAFJ6Be5w9Y3MOTKOgE/0cf/lbxzy+AN3IUbCeNButH/JxeZWTDrGUwl5V4v0J2GJL3HxiB7JiBeAhauVf7A6J1M3U8rUV+Jgt/b/WQZdgC474j/VagP6xpCBPmVXLIcX1j7TihEGffTkpXgXVkQwORN9f1uZY0BZrZIepPVISY7UYSpbl2XD3rZbpUSM3CCPsvmu9y6stjuM2FFP4jDgMh3tE30nl23lZCfniz62wAfSxrijfuE6Pxmn/3Iavkwwj0AVmx5nvG/PAHlIKXsiZLGLh67cBUqJqTKsXbEpjkshG1r5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MWHPR11MB1358.namprd11.prod.outlook.com (2603:10b6:300:23::8)
 by BN6PR11MB1473.namprd11.prod.outlook.com (2603:10b6:405:a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.18; Mon, 18 Apr
 2022 13:23:07 +0000
Received: from MWHPR11MB1358.namprd11.prod.outlook.com
 ([fe80::1cd4:125:344:9fc]) by MWHPR11MB1358.namprd11.prod.outlook.com
 ([fe80::1cd4:125:344:9fc%7]) with mapi id 15.20.5164.025; Mon, 18 Apr 2022
 13:23:06 +0000
From: He Zhe <zhe.he@windriver.com>
To: catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com,
 tglx@linutronix.de, bp@alien8.de, dave.hansen@linux.intel.com,
 keescook@chromium.org, alexander.shishkin@linux.intel.com,
 jolsa@kernel.org, namhyung@kernel.org, benh@kernel.crashing.org,
 paulus@samba.org, borntraeger@linux.ibm.com, svens@linux.ibm.com,
 hpa@zytor.com
Subject: [PATCH RFC 6/8] s390: stacktrace: Make callbacks use new prototype
 with frame info
Date: Mon, 18 Apr 2022 21:22:15 +0800
Message-Id: <20220418132217.1573072-7-zhe.he@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220418132217.1573072-1-zhe.he@windriver.com>
References: <20220418132217.1573072-1-zhe.he@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0133.apcprd02.prod.outlook.com
 (2603:1096:202:16::17) To MWHPR11MB1358.namprd11.prod.outlook.com
 (2603:10b6:300:23::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cb629049-01cc-414e-111d-08da213e931b
X-MS-TrafficTypeDiagnostic: BN6PR11MB1473:EE_
X-Microsoft-Antispam-PRVS: <BN6PR11MB14732523EE0DAD869401768A8FF39@BN6PR11MB1473.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nYHQPLbE2qMzo0bog1p+QqBu+aoUoFBh6D1wWKJ9rLtI0VzQdVErZtCXiEmJvYVD0DOTPm3vO4WNLTeul8PahplGMeCxWRoVPknJ3ImuL9eP0dX6b4pxuK/qGzMBUOB8WGbDgX99l20Zqyx9/S3UTxGrnSulAxFwGBLeEdixJMHRKeLrFz6A5INxo00C54+LSyzsT2TJdETNh4BbWLl9kjnnI8wxa+MaELrThRfUDrRLkp6HQL3+Z8GSJRiMYciEwtBCeqW7hYNZl2Mfubr4FqLLOuHArXh+2oBzIy4ChJe0FX1LOFIcpGmf2FbBH7kvGAKQrM5bPfq83w3x1DJ1eFWCwSGqOngkCv7/pG1M599puPw4UlRwPXROANI8kXDWyAOH5NYbLQMuslR7dkmYNlDXKuER1Aeokcwc67e74yzlmMmq7rIuYxTcNjwevNJQGYFFGvzooUDb6LWIcC77VW9ni/8Crxd5NeewlNI/QZ4Fg+busg/ug3n4Q0xCTGOET0MoiCFB/QNa0dwrIBFgpO4Bkfrvyx5qFjfuaRVdxoDKm5FSIeWF35JSdC9YkdzL9VLTMjbnjxSDftkMDDhXzIBzfcfAqzszRpJMYpWnJ+6WQRK9y3Qe0a4irAbvBshFALgbkQWLdiAkzeo8r04GFGoZLko1d41/V+nuYuA79v48I0L+90c7SeSjV5+ZYEtL7lvGUBTU0vvZcvMhsj0ASww4aiGjQ7+atcUU/eUjQNM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1358.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(86362001)(5660300002)(83380400001)(52116002)(26005)(6506007)(6512007)(8936002)(1076003)(107886003)(2616005)(38350700002)(38100700002)(186003)(2906002)(7416002)(508600001)(36756003)(921005)(6666004)(6486002)(316002)(66946007)(66556008)(66476007)(4326008)(8676002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NOIxFjHCwuZ5kpb1Yz7IzQZEt47p3HN5QHFw8/Hts8AoSarh2PppAqpbomKA?=
 =?us-ascii?Q?rafp72MnGyE9VGJV2Z1KsM1TuKmb7Lp6UKNYq6PGZgoO0F2YyVf8kAX+qbqZ?=
 =?us-ascii?Q?eLoh/A4VUVqlerV8/sI5K8Lm5Mv7uG0HAF+dGkX/CMC4ZEJFTGPYSr9uGKoZ?=
 =?us-ascii?Q?PJL9rYwqfCYYxnRgMzhLU1DFZrI3WDKMKz1a78q4KomP1XZeDy11aX8C+GqF?=
 =?us-ascii?Q?2J1h7hZf0DDeWHpLBVjDbwK8/CDiHbXuGlr77EwDAeAZeFCQv+/CwvUqWEX5?=
 =?us-ascii?Q?4e81z1W03IYcOgevGgTwFhMCTpQWoZRMC3nUfSJOeXni+TJTsBipO4lZjzPv?=
 =?us-ascii?Q?5oKbbC+Fd6rvanP/tmYf3h+TBQIBQvBDwhJWFlHGcgAVj6AbMQpg/CromGtd?=
 =?us-ascii?Q?jyE0kpVgKdc5xKmoT7qWLTB+z3iZ6P5PQLICHgdAgAUlo5f53Xd/AiEUYYzJ?=
 =?us-ascii?Q?tr9u5bDdTaW7ddk21J3nc3KDXAka+MFdhQHr5fCGxKe7gUf6RziV2zqj87q/?=
 =?us-ascii?Q?SsYTdotO6k/Bch0ukMP0Y+VTVGNkn0cWep8+x4NaNC4ekSZK+YIoQqFkvexJ?=
 =?us-ascii?Q?DYPxAi/a5DZ/UC4H7clx7KIc5GX2GIA7i2cVIYBNg6DomMwwsnyZadS1m0hF?=
 =?us-ascii?Q?j799nH7yuv+p9LEpm7bxgGqk7wQU92RdJ7PeXoHBGPvJbffNudEHiYEY+akh?=
 =?us-ascii?Q?+hydweD35z/S5RgBNTowtm0lvxrzfPtlGwEEp1ZutQqWUC31b5Dd8/PONRkC?=
 =?us-ascii?Q?VBPxWIw48aoecz1IBpxDkIWm/J1xpeO+Wr/7uSIXpOb59RqIkWMSg01JX46F?=
 =?us-ascii?Q?kUWzyuAXtdkIx1vkpvRRcNyW63JijeqtOfDq7jSHsZIMT7KE3u4qZjLPg+8c?=
 =?us-ascii?Q?FthfqKGZv9tY3SDDvh844rCuVTofEBVnALvmncvclbrRH1n77hXXz4akOXk+?=
 =?us-ascii?Q?QwVVYYbgYuyUB6WamiRp7WFvK2ktxuvxv/KEd0scPEG1/wAHGHdQRkNMgHVz?=
 =?us-ascii?Q?1LVV1c+h3SN4+qqL19538WhPl1lIQW19wTM/fseT3uHIxNJw73W3dswI9sM1?=
 =?us-ascii?Q?Tl3awc93tSOzKOOGoa6nmfZAQU1NOBKlTp0xhEd8myWQEVByMOp4dXB8PYSp?=
 =?us-ascii?Q?P5PNpz20HiGQKT84PDvXw/BSxRt4OCnpqjEtEKGYHETrZKJY79Xcra5l476f?=
 =?us-ascii?Q?aBXDfDAFfvY5BgHNrNlWWYwjCKoLkEoGrm/lsk/8GvhQ6EMva0DDhHcEd9H0?=
 =?us-ascii?Q?nhuPGMl6GHWlou/4dTRHvGRyF/Fo7XRqY7SgBiwjLwxbbkSRN+3Xkg+B3m4P?=
 =?us-ascii?Q?lbdcu4YBSFjCa3/NW17vdYDJrA243Krhxhv/p4pGTl4Ng76r61KYI7FtyLqG?=
 =?us-ascii?Q?ZMGGZNBZhSFzfBcgZfXPfFPv5Zv1bpT0i+BCVfXK0V1f+btZRFxMGH7/D5Ao?=
 =?us-ascii?Q?RbQ6EXnNJXwHmoZBGSbfeyKGW72CCyEe4uCtcg2rilZqUWm74pIVqPqRmYK0?=
 =?us-ascii?Q?P4vjfF4eSGYC5rDbgqSP3HGIXcJ/I0ZcqIIRkotqk9/JHRM2uzn1L9Stu9b6?=
 =?us-ascii?Q?I4WXfRdLEo1jMkpNjNb1JWCYiht48fIjMcPJi+47r0sQTcvtKu3eXXZnbUI7?=
 =?us-ascii?Q?l0bvInXzQ+UwuqXyOfVvuXACNdYrQgUK2r2D+1izpRZY11d3lIjxjMueh6IE?=
 =?us-ascii?Q?PmbMjcnUCaMlqeiqyVCm2LAZNI9aeDBOWKzpH0+on2A0V2PjlKxhQzEwr6Vw?=
 =?us-ascii?Q?OaR1lnmvzQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb629049-01cc-414e-111d-08da213e931b
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2022 13:23:06.7466 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VoYCIAxzwI9rBjncuFQNduLOburjZpVxN5hmb7dRDU/W4kHgMY9R4ka2wLG5PZQKHt8YRcy+I7OdsnhYJPBGnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1473
X-Proofpoint-ORIG-GUID: fl8Os_InqEnXl8h61EvDV0gQnr-XMSCN
X-Proofpoint-GUID: fl8Os_InqEnXl8h61EvDV0gQnr-XMSCN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-18_02,2022-04-15_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 mlxlogscore=573 mlxscore=0
 adultscore=0 clxscore=1015 spamscore=0 bulkscore=0 malwarescore=0
 impostorscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2202240000 definitions=main-2204180078
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
Cc: linux-s390@vger.kernel.org, zhe.he@windriver.com, x86@kernel.org,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

stack_trace_consume_fn has been changed to
bool (*stack_trace_consume_fn)(void *cookie, struct frame_info *fi);
to be able to pass more information.

Turn to use pc in struct frame_info in arch_stack_walk callbacks without
functinoal change.

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 arch/s390/kernel/stacktrace.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/s390/kernel/stacktrace.c b/arch/s390/kernel/stacktrace.c
index 7ee455e8e3d5..66aa7da0d974 100644
--- a/arch/s390/kernel/stacktrace.c
+++ b/arch/s390/kernel/stacktrace.c
@@ -14,11 +14,11 @@ void arch_stack_walk(stack_trace_consume_fn consume_entry, void *cookie,
 		     struct task_struct *task, struct pt_regs *regs)
 {
 	struct unwind_state state;
-	unsigned long addr;
+	struct frame_info fi;
 
 	unwind_for_each_frame(&state, task, regs, 0) {
-		addr = unwind_get_return_address(&state);
-		if (!addr || !consume_entry(cookie, addr))
+		fi.pc = unwind_get_return_address(&state);
+		if (!fi.pc || !consume_entry(cookie, &fi))
 			break;
 	}
 }
@@ -27,7 +27,7 @@ int arch_stack_walk_reliable(stack_trace_consume_fn consume_entry,
 			     void *cookie, struct task_struct *task)
 {
 	struct unwind_state state;
-	unsigned long addr;
+	struct frame_info fi;
 
 	unwind_for_each_frame(&state, task, NULL, 0) {
 		if (state.stack_info.type != STACK_TYPE_TASK)
@@ -36,8 +36,8 @@ int arch_stack_walk_reliable(stack_trace_consume_fn consume_entry,
 		if (state.regs)
 			return -EINVAL;
 
-		addr = unwind_get_return_address(&state);
-		if (!addr)
+		fi.pc = unwind_get_return_address(&state);
+		if (!fi.pc)
 			return -EINVAL;
 
 #ifdef CONFIG_KPROBES
@@ -49,7 +49,7 @@ int arch_stack_walk_reliable(stack_trace_consume_fn consume_entry,
 			return -EINVAL;
 #endif
 
-		if (!consume_entry(cookie, addr))
+		if (!consume_entry(cookie, &fi))
 			return -EINVAL;
 	}
 
-- 
2.25.1

