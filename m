Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D3355056CF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Apr 2022 15:38:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Khp1S1clfz3bdy
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Apr 2022 23:38:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=windriver.com header.i=@windriver.com header.a=rsa-sha256 header.s=PPS06212021 header.b=giPM6ZZt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=windriver.com (client-ip=205.220.166.238;
 helo=mx0a-0064b401.pphosted.com;
 envelope-from=prvs=1107a9ca43=zhe.he@windriver.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=windriver.com header.i=@windriver.com
 header.a=rsa-sha256 header.s=PPS06212021 header.b=giPM6ZZt; 
 dkim-atps=neutral
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KhnyC3PSXz2yfm
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Apr 2022 23:36:03 +1000 (AEST)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23IBQZXI006105;
 Mon, 18 Apr 2022 06:23:14 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=4T4k7AJWg1onXCT+MoZl7G9b+vfHIAVH1rxxfvWk87k=;
 b=giPM6ZZtzgANB9pFB9v9ABtn0lS2U/zAQYksYR6RcwPN2rVD6sk6BKfMj5ev6VV5nAzO
 XJKwigiahgZNKtn2xMxeOujWapxDGT3IgQgAE6knBBkM1nsDF7X4kloJCQ0dWoBmAyIU
 xcnwdvnNUptM1NtWM/VGbFvIaumefBQ1estl/zEo1Wdrsr09ueHfJfj36FHgTA0AG4BW
 cUTiGSvhffaTWvOR62t0ekVYxy5S1z7ZOd0e1dTC9qNtXGwwfyegGKH6/9tuhYHYKiWo
 D4Xotr2x4mtYQTLK4Bbja58GdjzKpggvO10j6TzjB4zj0xEk7A1brzXOJUY1CGq0RBj6 CA== 
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam08lp2048.outbound.protection.outlook.com [104.47.74.48])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ffwah150u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Apr 2022 06:23:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GYqmvbibddXACk90k/Q10banTuCOLBhgEg1r8klN7jX1g6IXvVo0YPOP13p/a6BYdtxavOiis7D7CkLB2/zWUzsBZOLt0HWXHJs57CE1zpmFGF22yaWPh4n4cIYe9HT4heB9jGXtHfC4IkhHF3IG9xj5y9n75qlNPWoGhJ+jtMwHXqU0TJeN8ae7DFBS8i4drSmZpI8wHFU3U6ZUp5pq/AxF+fxL7XbtyCEdBBAB94LOI/SOdYapi4NpApvMSr1mqiXw1MWB6AQx+GY03/d6/g9O9HUKrXXoErE5dtmP6oruVjwHNLhgjtOijXLADkFvJnBJZB/zYMOq9junhLuurw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4T4k7AJWg1onXCT+MoZl7G9b+vfHIAVH1rxxfvWk87k=;
 b=lNHuQKvpOTekG+Q9/oQB5QLpkArn1Y3uIF+PqRlo8u9TA4RPzJtQB0ttluCKofLfODfjriMSUE1B8bzS+kFaZ9s/ty8pUwTh/haeVP4dyCyFqBIYd9KmxvZGHuHNvjqVWZmZ4/wvpcqm50vGGUzBgL+F00zmjEWd61lhjN8XqoXLyBUR4UVrH+UNNBOUypUNxviEXXAKzXadNlpjAFG/Y+stXMTQuH9kjw6KkEwl+L6JloqOYQr3cfpXL5JU72PvanGkE8w8hOypRrdnenE2LP80/UpYfBv3xk0vz4MVaMgqrBLU/17dZLgATefjNC6aM2gxBWZW7XCVvDaxHe6mjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MWHPR11MB1358.namprd11.prod.outlook.com (2603:10b6:300:23::8)
 by BN6PR11MB1473.namprd11.prod.outlook.com (2603:10b6:405:a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.18; Mon, 18 Apr
 2022 13:23:11 +0000
Received: from MWHPR11MB1358.namprd11.prod.outlook.com
 ([fe80::1cd4:125:344:9fc]) by MWHPR11MB1358.namprd11.prod.outlook.com
 ([fe80::1cd4:125:344:9fc%7]) with mapi id 15.20.5164.025; Mon, 18 Apr 2022
 13:23:11 +0000
From: He Zhe <zhe.he@windriver.com>
To: catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com,
 tglx@linutronix.de, bp@alien8.de, dave.hansen@linux.intel.com,
 keescook@chromium.org, alexander.shishkin@linux.intel.com,
 jolsa@kernel.org, namhyung@kernel.org, benh@kernel.crashing.org,
 paulus@samba.org, borntraeger@linux.ibm.com, svens@linux.ibm.com,
 hpa@zytor.com
Subject: [PATCH RFC 7/8] x86: stacktrace: Make callbacks use new prototype
 with frame info
Date: Mon, 18 Apr 2022 21:22:16 +0800
Message-Id: <20220418132217.1573072-8-zhe.he@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: eaefada3-48a3-4032-b805-08da213e961a
X-MS-TrafficTypeDiagnostic: BN6PR11MB1473:EE_
X-Microsoft-Antispam-PRVS: <BN6PR11MB14732F8CA43CCE53C0FD5F6B8FF39@BN6PR11MB1473.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: d+Q8QSz/HWcG/dliv4pKuUgzf6IHcUNEk1JJ+UAGiWn3ZvJPgTr3BgUWo6/5VgWTpIEG97dnDJPJNBHH54dp3dnaxZAEaWl0WTPxPMxor7eDs9G0TwONZF/rQF1kTQJvfrd1Toy7py1H/UXsxLAAsl4q4ps+ZKyzTLEFgDlI+9E+CUYC7mKa/GYsNZR3gAcIkaH+kG7IlG1E7cEIZXHluopfot/2/7zuTB4oZR9EadNoaGRT8y0rgF5O5uYKY2gf4pSoOpB4GUhnlHiwvCLQwjhtmVZ89IQCpDXutlpRkp/d/kxz3RX6OfRHPua78G+R610aJZH7Ni7C7Eq3T2bkwkMce8t14gIxsnA0G1ht5WFVnhi5Ln7X7fgm5wp7KOYzvOvX2EzpN7VAn4yzRwQjXzEeYB1Aji5thAOBmBom3y5bo4bdXLDQg8Dp9A5T7yJIeYArll9AFTgLAD//xqlnBcdjAe5OBr6C6TQ3RSUkpGNH/r5/75+JZ9wU+wZaPeBOHkFBEP+IvJJCACxtdJXOySIECotUm8fnNtiHYatFg1wq1DfVZLtGWM/Lq73HGv7VrAjB0sPGmSkmWrHdUJQPSeRQeL1aOKDX4lszxbA5nXOpmRcBHsuIjm5QLlNwuscW6Np5QTKnbfhOT85ZC3b1BWv5/D9BmfHye0qfOzdRZQgBOBtZtEZXfsK2nA7gUmOcKGjjyx8XC19XHIgiicnGomCt/jdVz/pH5fRNS+vMP/A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1358.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(86362001)(5660300002)(83380400001)(52116002)(26005)(6506007)(6512007)(8936002)(1076003)(107886003)(2616005)(38350700002)(38100700002)(186003)(2906002)(7416002)(508600001)(36756003)(921005)(6486002)(316002)(66946007)(66556008)(66476007)(4326008)(8676002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Z6bkF825XZRbVG8kepe279GOl41l0xkH9o5ZKj5nZ/GZjrm+t18RnKCmweKR?=
 =?us-ascii?Q?vLnTmswTQYVj76PhJnjm0QrD1Uaf3JCHkGODcPPL1Ek9xrTl+LxNeRPqthJc?=
 =?us-ascii?Q?yHsLkPZVk4Fwhl8NMWeboQr4zHAgChH4rWpAA3GSesg9yTY9iwwhlytsvHFy?=
 =?us-ascii?Q?73GW8WGXOthKp1HRV0Uy96v65uBnJM8UgZgF1OKk18O7sgoBTBH2uBnjEuuJ?=
 =?us-ascii?Q?ygA9LX/g/4BCcSGkBdYfyWU1D4ZGRetpgz6ZSBDg6uXotOmivNpoJMMRFaEl?=
 =?us-ascii?Q?2MPTWbRcJGCYRE6Y5r5dvTj0Fu7N6axaCq0dpKfI5SxvZ1BWlszvlOf0VoBO?=
 =?us-ascii?Q?L+KZYLv5XQc3Bn8q0slCpSCewZfO6rMKWUYsHvUWNkJo1mcWP5J+JGohyzbs?=
 =?us-ascii?Q?yYL4/CE4erSCWyUNtRhGsHxgNC7okTfTcfmHQsa6f4/QTeHCZMK+lZ2ZroGl?=
 =?us-ascii?Q?G8DfOH6/jUzwSlahBp7LSymhRPiwIfKI3eVoY/AEeCATeIGA4A46GvImOAjQ?=
 =?us-ascii?Q?DqIdK7l5ZdyAr/pikJgQLD8a5lgmwvqUfw6E+lTJVr/ebQatljqVjrVL9R8A?=
 =?us-ascii?Q?D5kpDJe3ZhI42HyKUx1zdnTBSfzDqCKO9idMFlw5cpL2caiMWJeYgXYuLQl9?=
 =?us-ascii?Q?zm3nCXkt2WjRpO6OgHlzm9oen0TgcGVqiJCixGP7KMq/xv7KnUf3v4CzOJcN?=
 =?us-ascii?Q?0s2Rtuj1K6F/oZajy17qG0tTo9C1406AU8vAw7PpSHnSt8YNvT25/ssRBr13?=
 =?us-ascii?Q?k/1o12ZzY0s5RGbl6c7uCvCRxClYQJ+LlsRwzNOu0jEvpaJXdoZZGnqSnsec?=
 =?us-ascii?Q?jT4WB9JF7zxWXNwMVumjFHVF64LVvqs9toqWp/rXCa1x/fwJ0X0iaTBYQsp3?=
 =?us-ascii?Q?KoK5N+PEFYPWvnetKACDx304hsS++/0YXWTb5kmpQdIsxvnniXiSClXZhvr3?=
 =?us-ascii?Q?y5MjjSa4WNSU7CLjlx1vdvItsSclNp2Uxml9inzd+GkP10b/jMStwED+m3GB?=
 =?us-ascii?Q?+tGj43STRL8OnD5gXeE9MuZZe9Yd+koklvfLmH8QLN1/6SKiEx4BbDO8Fu7t?=
 =?us-ascii?Q?RJU62c+39MKGP21q/J5JYZA2L60iM8S15C9NJZRlm6bOXcIOSZes0plShneJ?=
 =?us-ascii?Q?/0JYO0xRhzn4oNVsoaFJ98+4PLki7tThMtPviKgTdCfIzfhx/uvDgkc8ZOrE?=
 =?us-ascii?Q?7umV84tnP9y7XfI4oxM0XBg9YcY5Ez3OD1ArEe6Zw8leWYfCH2NVI1YksfjY?=
 =?us-ascii?Q?odgpFu70xQmkGoDxpgtTt8yD2/OnzqqTfF6+OyZB5RlHw/PiIVyRReKlsbd1?=
 =?us-ascii?Q?fRqrmW3FXClHllL1biLdahR7fWCKwB9MGew4Rvmmq5oUeglCEciK+jtDtOjO?=
 =?us-ascii?Q?cCuGMGvkKdCOzvE9FpL4HOTJsUMB1JUhYmuu1Ut/3/EJvtN9dpGdJAWUC4Yz?=
 =?us-ascii?Q?OuJ9Nk38kVORPokmHqnL2CvtwEPhZoFmIKXNj3TyY8SpeOKLzS02QQJF/Ogf?=
 =?us-ascii?Q?bzuANk1qm7fsHqqA83tcQ4s1XdgGGxzPXhndXzSOh7BENmxcJTm34fXIGPPw?=
 =?us-ascii?Q?IWF3h4N2mNDpzjMMDKJUaPB6JmrGOpM0g4l/FqUewzbfQgvu7qU9h/OZME1a?=
 =?us-ascii?Q?8sfrwY4lRkP2FSsYlLIv0BOlE+OGocjGphOpWdtKLtpCOYvEfASBsp187KpY?=
 =?us-ascii?Q?nX751dIykeh5eHuzgBeam1TsIAEGP7xEYixGs/GxYrx1XY4R75nngnQOwT+Q?=
 =?us-ascii?Q?46IoXf2qMQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eaefada3-48a3-4032-b805-08da213e961a
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2022 13:23:11.7618 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QHl/7ZXaMtJW3Ru3c5CDGsxc5u3mlO4FUaPoSsJ6xxxAcUrTXBQKPf9om8+ghL6xmvzqTRPjI5Sk1zWMJgZXxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1473
X-Proofpoint-ORIG-GUID: gq7Q_ToLEqTuYqJWrR4GtxPdVbJYAin0
X-Proofpoint-GUID: gq7Q_ToLEqTuYqJWrR4GtxPdVbJYAin0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-18_02,2022-04-15_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0
 mlxlogscore=559 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
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
 arch/x86/kernel/stacktrace.c | 28 +++++++++++++++++-----------
 1 file changed, 17 insertions(+), 11 deletions(-)

diff --git a/arch/x86/kernel/stacktrace.c b/arch/x86/kernel/stacktrace.c
index ee117fcf46ed..c88bfbb5f157 100644
--- a/arch/x86/kernel/stacktrace.c
+++ b/arch/x86/kernel/stacktrace.c
@@ -16,15 +16,18 @@ void arch_stack_walk(stack_trace_consume_fn consume_entry, void *cookie,
 		     struct task_struct *task, struct pt_regs *regs)
 {
 	struct unwind_state state;
-	unsigned long addr;
+	struct frame_info fi;
 
-	if (regs && !consume_entry(cookie, regs->ip))
-		return;
+	if (regs) {
+		fi.pc = regs->ip;
+		if (!consume_entry(cookie, &fi))
+			return;
+	}
 
 	for (unwind_start(&state, task, regs, NULL); !unwind_done(&state);
 	     unwind_next_frame(&state)) {
-		addr = unwind_get_return_address(&state);
-		if (!addr || !consume_entry(cookie, addr))
+		fi.pc = unwind_get_return_address(&state);
+		if (!fi.pc || !consume_entry(cookie, &fi))
 			break;
 	}
 }
@@ -34,7 +37,7 @@ int arch_stack_walk_reliable(stack_trace_consume_fn consume_entry,
 {
 	struct unwind_state state;
 	struct pt_regs *regs;
-	unsigned long addr;
+	struct frame_info fi;
 
 	for (unwind_start(&state, task, NULL, NULL);
 	     !unwind_done(&state) && !unwind_error(&state);
@@ -56,17 +59,17 @@ int arch_stack_walk_reliable(stack_trace_consume_fn consume_entry,
 				return -EINVAL;
 		}
 
-		addr = unwind_get_return_address(&state);
+		fi.pc = unwind_get_return_address(&state);
 
 		/*
 		 * A NULL or invalid return address probably means there's some
 		 * generated code which __kernel_text_address() doesn't know
 		 * about.
 		 */
-		if (!addr)
+		if (!fi.pc)
 			return -EINVAL;
 
-		if (!consume_entry(cookie, addr))
+		if (!consume_entry(cookie, &fi))
 			return -EINVAL;
 	}
 
@@ -107,8 +110,10 @@ void arch_stack_walk_user(stack_trace_consume_fn consume_entry, void *cookie,
 			  const struct pt_regs *regs)
 {
 	const void __user *fp = (const void __user *)regs->bp;
+	struct frame_info fi;
 
-	if (!consume_entry(cookie, regs->ip))
+	fi.pc = regs->ip;
+	if (!consume_entry(cookie, &fi))
 		return;
 
 	while (1) {
@@ -122,7 +127,8 @@ void arch_stack_walk_user(stack_trace_consume_fn consume_entry, void *cookie,
 			break;
 		if (!frame.ret_addr)
 			break;
-		if (!consume_entry(cookie, frame.ret_addr))
+		fi.pc = frame.ret_addr;
+		if (!consume_entry(cookie, &fi))
 			break;
 		fp = frame.next_fp;
 	}
-- 
2.25.1

