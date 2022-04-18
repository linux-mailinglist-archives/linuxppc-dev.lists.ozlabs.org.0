Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 855B2505687
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Apr 2022 15:38:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Khp0d35GHz3bqX
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Apr 2022 23:38:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=windriver.com header.i=@windriver.com header.a=rsa-sha256 header.s=PPS06212021 header.b=lxDlMZFR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=windriver.com (client-ip=205.220.166.238;
 helo=mx0a-0064b401.pphosted.com;
 envelope-from=prvs=1107a9ca43=zhe.he@windriver.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=windriver.com header.i=@windriver.com
 header.a=rsa-sha256 header.s=PPS06212021 header.b=lxDlMZFR; 
 dkim-atps=neutral
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KhnyB4RL6z2yb7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Apr 2022 23:36:01 +1000 (AEST)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23ICBBTB014126;
 Mon, 18 Apr 2022 06:23:03 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=ri8NbMErtUsmIwZuPVcvvPn+8AwVXaNNfl5A5CVR35w=;
 b=lxDlMZFRz5HYi7JHEC5ub3JgynobxfsZLAAuzt4w2h7XfPqwQCGfjNRjy+Wq7lsKznHO
 vyKQ1NWCthctZoOJpsTHJNQ8EagempC00KiZheJYGKZHRqe3Qgh+MM6udijMqfFoudLh
 eI6mtPzKX03PgZj8TBUcs6ylbwuT52om2FJ6A3TgrhRoeC1xAGQwvl+001ExsTVr8u9Y
 4160tEiqwfnlyb11T05PySTeY3m8/lFgJ6MqBpw4dckfiNEdUJSof5+Mtzt/vrQLaeNk
 EDkzb9G1Zwfa+7pRnYsmxxOFdNpIo5xxeOFoanzID9KGTdIijWk4N6is48W1E6Fw6kfo UQ== 
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam07lp2047.outbound.protection.outlook.com [104.47.56.47])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ffwah150s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Apr 2022 06:23:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E5vYZsMq9+zKGI4vMTSzF3ijW2Ri3x4mdbVD3FMQGM6eOIEpK++PEEXtguqfuve8wogvpExNHLWgThmfNI+sUrx7/oAnFyTZOdOqHQA4O+bBB0qE++3XYhZwRusaEJi/gU4XzY7Rm+KIiLm9eG2yywRshejPVIeg9cmz4boBrrTY2haZhtdVX26IlR/UUQSm0qgoAoVofRvrfIvooAcIRcDxhSL/5gR9A902bCDelh2fzzwNEUhuz2ihUtnV4qMpIc/V5eEsBbju8GqFj6/MxjrfCT23VJm3jxPiDtASKikPAL0iLhSvXItCmaC8ZQRs0AH8Y2xqbG6rD46h6ke0Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ri8NbMErtUsmIwZuPVcvvPn+8AwVXaNNfl5A5CVR35w=;
 b=B757VIUv5BtKqNkgirBKryovwveKkghjpzly7GPt7IPWbGE2c88qFwMEG5aZ4gksvUorGQ/uGd8lM8ON++xKhxFS6k0Ul3VMWYILWfzu+VBUL95/JU4JI9bIeasRQNXSKoETkuWxqiyIv1NyG4bn3N1GayFmvOYeQCJEOD11wGc7uYsjyO+UQwnB/84UCaoKAwGGVhXHR+A5Wfa3BPEsZvVQHvDyyG83J2H6VaLkj0Q3PAGvKdAFLLU34JotkZ4JQUUDK8i/eaVRHHUTObDx4SJq/z7qGdpkYNjeLC6V5bIeDQicd2zeFOY/RsOkiVIS8MoGAkAILhVs5D+DEmiHKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MWHPR11MB1358.namprd11.prod.outlook.com (2603:10b6:300:23::8)
 by DM6PR11MB2857.namprd11.prod.outlook.com (2603:10b6:5:cb::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Mon, 18 Apr
 2022 13:23:01 +0000
Received: from MWHPR11MB1358.namprd11.prod.outlook.com
 ([fe80::1cd4:125:344:9fc]) by MWHPR11MB1358.namprd11.prod.outlook.com
 ([fe80::1cd4:125:344:9fc%7]) with mapi id 15.20.5164.025; Mon, 18 Apr 2022
 13:23:01 +0000
From: He Zhe <zhe.he@windriver.com>
To: catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com,
 tglx@linutronix.de, bp@alien8.de, dave.hansen@linux.intel.com,
 keescook@chromium.org, alexander.shishkin@linux.intel.com,
 jolsa@kernel.org, namhyung@kernel.org, benh@kernel.crashing.org,
 paulus@samba.org, borntraeger@linux.ibm.com, svens@linux.ibm.com,
 hpa@zytor.com
Subject: [PATCH RFC 5/8] riscv: stacktrace: Make callbacks use new prototype
 with frame info
Date: Mon, 18 Apr 2022 21:22:14 +0800
Message-Id: <20220418132217.1573072-6-zhe.he@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: 33923727-9cb3-4956-9125-08da213e9022
X-MS-TrafficTypeDiagnostic: DM6PR11MB2857:EE_
X-Microsoft-Antispam-PRVS: <DM6PR11MB285775ADDFB93E8CA0E44CC48FF39@DM6PR11MB2857.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: U1snG/qP8BEe2R6G9vcemDhtS38JSN4LEAtxjAy/cJ/YnLdm4iw1ZZslb3Y/T8UL3Hy1iW7uqOy15ezuhVvK9F2ySDvnE9f6Oe4iajP4/1eDIqj0F+q8O5IVk/t3VN741f3+ojRk3EJ3M/Ri+aDj1c0OmYUXdlV/Y3nWrzO5fvyCCeIC8zMAkbWfbDEEbxeHw6C0st2mbUhVC9oUTtseUFz9IY4ng/XUUgWmf3/8FIN5jPv2OcbBOxW+bQfUu4JyiBxtl2guHjEqTfHkFSUNndKvKs+rbdVlkJv+IhWHMkaoXNyIfNKz56ZIbjieSUJo+ADfuHF/D6PojMWmtN6Kw7NolgJXzZYyQvZGDfLJyif1KLiFOy0em01Td6gFWCXkOaw5RPgl+VquaNaSkROGujr1zkf3i7rr6yfdL1VRyNmX+TqqaefymH3GwqV72IsiPZ/yzCDhjodV/8+Y14V0nnp/UX/zjFkSfJjV2zy/i9Fpzai9rqqeRqH4gBSeAMwQ2aZ/48TfMeZhCBogCKFqQkY5/627Zzl2rmGF/k77bq/3dhHusTaabXYidzrpJX0XYM7lu2k+U+YmrvXeZFD555i9TlaZgGL/iAxYK/YBflRWVBUINhgiuMZlEFQYyw6J6pVi6Vps2NtAo6Uv6nH7Ig3svebCN/aq/QWxAwprtmTg3vb9SVuLEZ4jAQLimWF/b2Q4A4tokQKhXbW+F7EFDcgV6Hyc1QTX/65CBb0YOis=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1358.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66556008)(2616005)(186003)(86362001)(83380400001)(1076003)(38100700002)(66946007)(316002)(66476007)(7416002)(107886003)(8936002)(2906002)(4326008)(6506007)(38350700002)(5660300002)(508600001)(36756003)(52116002)(8676002)(26005)(6486002)(921005)(6512007)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0D2Nh60ZK0WbyVdl8tFNkd1FehpnekWO1HsUqM3vFift6JwoA00nfHEGD4GV?=
 =?us-ascii?Q?vRGOfMjmYqun6za+KsLDAZ4PwO3yDPRbBdXtdJOD+9T+nF1/OmvdUmSHFBYO?=
 =?us-ascii?Q?6Q2/o51m+IGvQMe+lLCHf1sc+/JflT858QuoFywkENmBH0hNpO7aPt32gPLK?=
 =?us-ascii?Q?c7cpl/aQjVhwjxa0804sQ1IAoP2ecZapxwTmcF4t6ai+2fIPZA2XPXZBD0ly?=
 =?us-ascii?Q?xrYi++NHHt1TSX/jp2iqu5KNmJLEttTixScru0sfsLHn51GbWIFeM0BjDB73?=
 =?us-ascii?Q?lq4fRzdH5FjHbG1Ze8yce8jUhhlpewixfoRJ6jAOR4L7dfxwlEnPWig48bEn?=
 =?us-ascii?Q?6pXxAeWmdRqyDpIvXZs+tHWIBfOV/KKsAatV7mLqXBTeTnaUKnIqGe8eI6V9?=
 =?us-ascii?Q?uAC4Li1DE8kSBT+j+DUrZYMyLzveI8H2wwXsaEnK2tiAnVgjcrztxnOwjZ7s?=
 =?us-ascii?Q?PLhAdLnvunBLAl6CC7fkO+uPYRDmRc1wVtIMcdhcsYJdZD8wglluOgVXcoc3?=
 =?us-ascii?Q?PHSouXzhdM24J55d4CVtBKwr++qqjQ/P/q+VfeG+fAHDZACGAnFVwnqfGqsP?=
 =?us-ascii?Q?m2pzRpUcozIcaJxy3W2PkPd3rBDeV+y1n6V3HQy2qSa4n1M8/tajEhdj/zjg?=
 =?us-ascii?Q?SN1nPRryu2YmlT3sk036adW4W4sbpPBwVSwG309///rsLMrmnEM9Njc7PGZG?=
 =?us-ascii?Q?DgVjyfe8pD7aNjm7mNiyus0YiR96R07rvyaUZvCEffuQsZXvTGCYhr06+53x?=
 =?us-ascii?Q?7SWvIBq38/XtLUx+nDwaT2XTK/YBGpvLh0RC0XK9Otzq0u3oLsXh6Z06fs6g?=
 =?us-ascii?Q?962pZdmAKTGIwQ51Sz//yZi2q6aNFiLXy6RbuJvKBjxVZEp6EA7BSEzMKmnp?=
 =?us-ascii?Q?BkdHQxGNlsJFWv3URFlWm0Xa6qwVqQ6dDvWymeSOmiJJC2GXjZiDu+62whG8?=
 =?us-ascii?Q?Wyb5KgUBmqHDP4tLHZtmJVZmh+a2bk74LpD8UGtjrIAsH8obHkS/19YILEfA?=
 =?us-ascii?Q?7CcUzBoI1tUdisDttXunA4vTXut8PGik/+3wljFPOZGDqanBmjinpLZKoLFQ?=
 =?us-ascii?Q?7Nn8vnlyicWDgoJOtNQNr4IH4Sh2YtVI04Eh6uX587eAXNnQJPOHz9Vkd4fB?=
 =?us-ascii?Q?j9HsWeWrgEeDlBziAhGhTFDWNWisb/vBBDFENUlO7WXhrtPuCy5n2bxrvK4n?=
 =?us-ascii?Q?bT4BLJa0832p1T33TjDW+f//dzZGmNyEdFepwLpa2Im+AHfPmbsDwR++za9u?=
 =?us-ascii?Q?ADo07M0DM06tl6UAJymvS37Mo1xgBVdQtGLFnjbJWO+hy5bXma2dVRK0YDWN?=
 =?us-ascii?Q?IUguhQdc5oD4cRnvvb60qT2z1pmxM2ehL+a5Pkx4jzXszfyclevfidemXqnh?=
 =?us-ascii?Q?QtEX35g50UYSWh4Wo0ENWKGT0TEtywVZSMBD9nKZ2QfABTa+EOB52i783NH3?=
 =?us-ascii?Q?Q9ctA4yJ5Unt759yEkN3Z7aNX95qRA1HBbugD1MKR5NADwlfrTaw+fz8KUGO?=
 =?us-ascii?Q?LLUngKtk/AqBzAx6lpvhghP7wcywSiWAxqXJWitpgPobEvnZmZrzQOYE8mXa?=
 =?us-ascii?Q?CeC9w0Tvmf2RLbLqebffAeNUz3yUEEABG5cmlDuvH1V6lPTXhbntKbtaxsbC?=
 =?us-ascii?Q?xLa6hqhTza9e8ODVZVvFka+Pasks5QF/hFUV+y4hjEMsLoxAGejJKsBDyti0?=
 =?us-ascii?Q?LxKem7dnRiJpRhyQu3d4IzP/Mn+8STwO4mFUR9zdInTTWP85iyMdUIqAWu+a?=
 =?us-ascii?Q?bFqBZiEMvQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33923727-9cb3-4956-9125-08da213e9022
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2022 13:23:01.7469 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oJurLbPzfQMbpwhQJv4oULxunsiuwEatCMQTq8cQ8SD9v64QM/Do8zLtADiNgHJSls/JNLsDp1p+3Z2RIZsBgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2857
X-Proofpoint-ORIG-GUID: Aod_roRjV79KpNthk3_U2ND7CEqM04FS
X-Proofpoint-GUID: Aod_roRjV79KpNthk3_U2ND7CEqM04FS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-18_02,2022-04-15_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0
 mlxlogscore=736 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2204180078
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
 arch/riscv/include/asm/stacktrace.h |  2 +-
 arch/riscv/kernel/perf_callchain.c  |  4 ++--
 arch/riscv/kernel/stacktrace.c      | 22 +++++++++++++---------
 3 files changed, 16 insertions(+), 12 deletions(-)

diff --git a/arch/riscv/include/asm/stacktrace.h b/arch/riscv/include/asm/stacktrace.h
index 3450c1912afd..486ed6a96b89 100644
--- a/arch/riscv/include/asm/stacktrace.h
+++ b/arch/riscv/include/asm/stacktrace.h
@@ -12,7 +12,7 @@ struct stackframe {
 };
 
 extern void notrace walk_stackframe(struct task_struct *task, struct pt_regs *regs,
-				    bool (*fn)(void *, unsigned long), void *arg);
+				    stack_trace_consume_fn fn, void *arg);
 extern void dump_backtrace(struct pt_regs *regs, struct task_struct *task,
 			   const char *loglvl);
 
diff --git a/arch/riscv/kernel/perf_callchain.c b/arch/riscv/kernel/perf_callchain.c
index 3348a61de7d9..413abf094818 100644
--- a/arch/riscv/kernel/perf_callchain.c
+++ b/arch/riscv/kernel/perf_callchain.c
@@ -66,9 +66,9 @@ void perf_callchain_user(struct perf_callchain_entry_ctx *entry,
 		fp = user_backtrace(entry, fp, 0);
 }
 
-static bool fill_callchain(void *entry, unsigned long pc)
+static bool fill_callchain(void *entry, struct frame_info *fi)
 {
-	return perf_callchain_store(entry, pc) == 0;
+	return perf_callchain_store(entry, fi->pc) == 0;
 }
 
 void perf_callchain_kernel(struct perf_callchain_entry_ctx *entry,
diff --git a/arch/riscv/kernel/stacktrace.c b/arch/riscv/kernel/stacktrace.c
index 08d11a53f39e..9cc5013a5ea4 100644
--- a/arch/riscv/kernel/stacktrace.c
+++ b/arch/riscv/kernel/stacktrace.c
@@ -17,10 +17,11 @@
 #ifdef CONFIG_FRAME_POINTER
 
 void notrace walk_stackframe(struct task_struct *task, struct pt_regs *regs,
-			     bool (*fn)(void *, unsigned long), void *arg)
+			     stack_trace_consume_fn fn, void *arg)
 {
 	unsigned long fp, sp, pc;
 	int level = 0;
+	struct frame_info fi;
 
 	if (regs) {
 		fp = frame_pointer(regs);
@@ -41,7 +42,8 @@ void notrace walk_stackframe(struct task_struct *task, struct pt_regs *regs,
 		unsigned long low, high;
 		struct stackframe *frame;
 
-		if (unlikely(!__kernel_text_address(pc) || (level++ >= 1 && !fn(arg, pc))))
+		fi.pc = pc;
+		if (unlikely(!__kernel_text_address(pc) || (level++ >= 1 && !fn(arg, &fi))))
 			break;
 
 		/* Validate frame pointer */
@@ -67,10 +69,11 @@ void notrace walk_stackframe(struct task_struct *task, struct pt_regs *regs,
 #else /* !CONFIG_FRAME_POINTER */
 
 void notrace walk_stackframe(struct task_struct *task,
-	struct pt_regs *regs, bool (*fn)(void *, unsigned long), void *arg)
+	struct pt_regs *regs, stack_trace_consume_fn fn, void *arg)
 {
 	unsigned long sp, pc;
 	unsigned long *ksp;
+	struct frame_info fi;
 
 	if (regs) {
 		sp = user_stack_pointer(regs);
@@ -89,7 +92,8 @@ void notrace walk_stackframe(struct task_struct *task,
 
 	ksp = (unsigned long *)sp;
 	while (!kstack_end(ksp)) {
-		if (__kernel_text_address(pc) && unlikely(!fn(arg, pc)))
+		fi.pc = pc;
+		if (__kernel_text_address(pc) && unlikely(!fn(arg, &fi)))
 			break;
 		pc = (*ksp++) - 0x4;
 	}
@@ -97,11 +101,11 @@ void notrace walk_stackframe(struct task_struct *task,
 
 #endif /* CONFIG_FRAME_POINTER */
 
-static bool print_trace_address(void *arg, unsigned long pc)
+static bool print_trace_address(void *arg, struct frame_info *fi)
 {
 	const char *loglvl = arg;
 
-	print_ip_sym(loglvl, pc);
+	print_ip_sym(loglvl, fi->pc);
 	return true;
 }
 
@@ -117,11 +121,11 @@ void show_stack(struct task_struct *task, unsigned long *sp, const char *loglvl)
 	dump_backtrace(NULL, task, loglvl);
 }
 
-static bool save_wchan(void *arg, unsigned long pc)
+static bool save_wchan(void *arg, struct frame_info *fi)
 {
-	if (!in_sched_functions(pc)) {
+	if (!in_sched_functions(fi->pc)) {
 		unsigned long *p = arg;
-		*p = pc;
+		*p = fi->pc;
 		return false;
 	}
 	return true;
-- 
2.25.1

