Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC46A5056D1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Apr 2022 15:40:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Khp331w9Pz3cLw
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Apr 2022 23:40:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=windriver.com header.i=@windriver.com header.a=rsa-sha256 header.s=PPS06212021 header.b=Ch0ah0hq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=windriver.com (client-ip=205.220.166.238;
 helo=mx0a-0064b401.pphosted.com;
 envelope-from=prvs=1107a9ca43=zhe.he@windriver.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=windriver.com header.i=@windriver.com
 header.a=rsa-sha256 header.s=PPS06212021 header.b=Ch0ah0hq; 
 dkim-atps=neutral
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KhnyL2DWwz2yh9
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Apr 2022 23:36:09 +1000 (AEST)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23IDA5an010696;
 Mon, 18 Apr 2022 06:22:48 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=k/NQfZS4NJCNCzJzOq5gcpOFjgri9NwJbvn+CXXa+Ps=;
 b=Ch0ah0hqbV0q8DS2UrmGk3ov8fToeA739c05vyClXJeYkgKyYi2NQEUNbJZ3Oel/bzil
 iIokmhEKDBqZMNXhn8/WUXkHmU153Ddc2qR8j6/6CetOxfHPS/x4Aqs6OQjAA2QkxJ3K
 VL7567OeWcsUPr9WPQpwVqENPTcyJm7sWxRC8pXfxuXKlNDezAObTQA6phjkJdZMPf5A
 LmwiYgEKIOdvc8LXtkmCkUnGZiJMR87BE94pgTug1yFgae5WeNn7bH8SSwaoMfdhjvDV
 V+Qr/EwXo25UwRm3BpxriFhhp0eZgMAciJUzawcVjcd6LaDD7O39lQCmpsBMeuMHPsjZ Wg== 
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam07lp2042.outbound.protection.outlook.com [104.47.56.42])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ffs3118r0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Apr 2022 06:22:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ogipQrW1wyyCC3sYu6LD+jazraozzCmVLaj9Y/oyFrJgfRjz5o1yg2aSjy9NDkLQC1EHSJglJYxI440rS7DFRXTx4P0FUJOPjtGE0FSj863w7IAmhrj/vdgHNmv0wC+TjTeaOdyoOmH2XMIxTrQ8yaLcbEfQIgYH60T43WTVqaWApa2mJg9+flJ5uRZtxUwUQ0cK6Yo3/Vbw89TyG7IVPkySnzA46XNpMm/XT3JzqVnTbnNfMpV2qlaTTBCmcNr8TZypInP5GBY3YIm01XEZH6bC2AiJeUTeFP2B3HbnRglz29Xfy64a+4Ww0r2V7V0ZGf8lXNCOCnBISkzvUaxy+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k/NQfZS4NJCNCzJzOq5gcpOFjgri9NwJbvn+CXXa+Ps=;
 b=FbsjgynPymMeaXjV0kKQaeXnJTCgqRXSg2cMkzGOXu6DYndQE3zb+oYd2rxGHJly1Pbi+WLCON/p9COCMFVGXG9VrueqCPBcmPeKJjfKSVgBrZAVqdqy6pROVAtraW2G/X6GUB+ojcF/jOpsvUgFrGekF/NaQHNcgZs9e0bibUdLZqYXDYC0U1kZ7ddJ/4xuRbUUHJvKqOUOOh/9p03tjqDBkzlpW4QCcTrVbxaH7PqPs0/bYDQMQBf7m8Q2ZtSBOnV8FespnevMl2yzQwcOQXjkWzT3WuDnxOz12epDcp4plnreu/r65JLeahwNx1Wb2ykkz2cqK8ohJNGnKawejg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MWHPR11MB1358.namprd11.prod.outlook.com (2603:10b6:300:23::8)
 by DM6PR11MB2857.namprd11.prod.outlook.com (2603:10b6:5:cb::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Mon, 18 Apr
 2022 13:22:46 +0000
Received: from MWHPR11MB1358.namprd11.prod.outlook.com
 ([fe80::1cd4:125:344:9fc]) by MWHPR11MB1358.namprd11.prod.outlook.com
 ([fe80::1cd4:125:344:9fc%7]) with mapi id 15.20.5164.025; Mon, 18 Apr 2022
 13:22:46 +0000
From: He Zhe <zhe.he@windriver.com>
To: catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com,
 tglx@linutronix.de, bp@alien8.de, dave.hansen@linux.intel.com,
 keescook@chromium.org, alexander.shishkin@linux.intel.com,
 jolsa@kernel.org, namhyung@kernel.org, benh@kernel.crashing.org,
 paulus@samba.org, borntraeger@linux.ibm.com, svens@linux.ibm.com,
 hpa@zytor.com
Subject: [PATCH RFC 2/8] arm64: stacktrace: Add arch_within_stack_frames
Date: Mon, 18 Apr 2022 21:22:11 +0800
Message-Id: <20220418132217.1573072-3-zhe.he@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: b7b7c11b-d83b-4079-650d-08da213e86ea
X-MS-TrafficTypeDiagnostic: DM6PR11MB2857:EE_
X-Microsoft-Antispam-PRVS: <DM6PR11MB285741F28DADD5F31CE506F98FF39@DM6PR11MB2857.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UBwWdgNkXaFT+EExp710LA0Xz/Ktn1dTrkz92/dXZ/Kv9B9E1NQVoTd45/pIS/ntADGXrDgvLwYIP+Ca/IJu8Iq+g9TMJl17c/M86aLC/WQa76/I2e2exzYnK+P6Y0q7+ydjmSd/njjK6B9vEmALtvVozU/kIi/eqe4Ld14lSFB/u+xu6zsOfYGqcC54mudbUl1mFbqZRAHUzXSp9McpiHTQbEatsF697XX4kfTC8BSoFJScw0IXIZTgZT3KlsasPzo44cu0Xa3YKGbKtVRNP+MabnKMlh+ris+ubeU8Ciwa05uIlq+I9wn6rrxlbjzXUvfZCRA0aEVwcHqYLYYt6aW1ClZVZxWBr+E3df8pKwTVrKdth9LHw2sh7gqZIewE8a1p/X5xKIfjoDTrf+EijTaeOz2kSfBZjCuugAhyX7hh8naEAc0Z8INhRJHKh4ujt3zwNhvJpW2vmmNfnqINEpjUNbjKH9oFjUiOSUa0Ee7XAQwQfjeMdyi3HxdtZLBU63x3D9RZV558fTPSkpDosnd76R2S1UT2yxC7dNZEwTjkvqZ55t6WlkU19zvXCHk+ndWjWQcyxrBJXL4Iy39RVrFDSvciLbub1EYIfEUsPD4ywul2gZe+Oe4wyaMbKEAO2N79eeQNcYcbYzo4mxVCVfD9iacIJHZOSRHPoDde75KXRCE8Jbu8Fi67UfhJuzVh/FImn0Owy5tmTVPNCPmfSpIl5ZHDHvrd7UcU/N2zv0w=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1358.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66556008)(2616005)(186003)(86362001)(83380400001)(1076003)(38100700002)(66946007)(316002)(66476007)(7416002)(107886003)(8936002)(2906002)(4326008)(6506007)(38350700002)(5660300002)(508600001)(36756003)(52116002)(8676002)(26005)(6486002)(921005)(6512007)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cI5QHA39fhqVvKLCszKi+qlJwj8q3cmRp3l8DIX/186Zgu0pPeAZaFzJM6jm?=
 =?us-ascii?Q?ipk3bxZXuErq02ZNi4rYDh/ZhC1vLg6iUSK+MG+Lbi2lmQYQxOrai5+J2uGD?=
 =?us-ascii?Q?qzACC0dRDnFwlfdeJHbg7yFuF5MJf7gYgT3WEf28TlIcyKdwGsv64gt+lKYf?=
 =?us-ascii?Q?GidUf+GzgJDuPFIkFIOoolu2ordERw+BUJSfB+94PI2fZ6Gssm12ESpCa74t?=
 =?us-ascii?Q?zAPiX6lC/JfgNwzZzHL+T1JvHAYYPzq4+oEWwYYUA/SCu7c+f20GsuXK96MZ?=
 =?us-ascii?Q?RV80b3cAaz0oByduV341hf0OR/19Td6nxBnpqaOravvJZ4kgKTdlbvEbMU2i?=
 =?us-ascii?Q?BGLB1AXNH5FVzbmm8AygkCt3lPpaP7V1fcU6JyxJp61xiLVDPdZuo3u7+zbp?=
 =?us-ascii?Q?d2L9bkfIMPfSxcNNVU3irH4LJIsRC2eC55LSJbAP7SNOqcDWUzLTngogCRRO?=
 =?us-ascii?Q?vVtLWG/cg/i021WRfC465fRoNAF0+p1zd/zB1zCtnqNbHVE1HeV5pzrpugqv?=
 =?us-ascii?Q?vkpewDRy2FbrX71PUkhJ9Ci/Rlc2Lge7H2p0UhA0iQYgG4I++igrdDSPhwKK?=
 =?us-ascii?Q?qC+pT8H05z7y1iX7c0LOfxzaDNBhRalWLGZquTRLe7/mYh6eGUceJLvNI9zI?=
 =?us-ascii?Q?WGpwVr62xZ9KnvwWqa1z6B3WfPlbnNPwt8AfWO841LQwjGpOMAayZ1yCLCvO?=
 =?us-ascii?Q?RF7dbg3RsBboe7MQEaNGI1zI4vtKj/CsHpBHrNXT1WNe65McZXahT09VR+/R?=
 =?us-ascii?Q?uBjz8yTBCPoriZWR6w8d+OFbLfc2qYoyuNf1G6DtqIY+VOXONA57ky/TMwET?=
 =?us-ascii?Q?Pn17/QZXzgKBJ6giSGYjP/s5SQbojMVmrNyUqj0tamxWKgmLmnW2ziy135nP?=
 =?us-ascii?Q?rQ8lL8JR5YQ4rAigKbJBCA4MFKtksfKuKKXIhHz+WTMYhyXIVgQ6SfHy5GWm?=
 =?us-ascii?Q?t0zI5qQ+JqFliECZiok9rlq2QMmK5rfKc7IqMc8xcZUYk381EREANdooaDNL?=
 =?us-ascii?Q?R4LWs8PSJGt3mLHKTopc5nhYb5HgGgM8pa29gEalTSphgsXEn29ucqe74aTE?=
 =?us-ascii?Q?esGnQC4EXq7WcnPaXuTyuZJRs8IZNi8l7hIZW43uNGHogyoNAakRKZtSDYQf?=
 =?us-ascii?Q?oP4VwgxeD1rrkRGQuP3i4JIrzoa6g8TJ08XzArKoBVRsg9nrpKz/HPBCMMrv?=
 =?us-ascii?Q?uGkAEeCV09kEpzc2rH4TwIlA69QMPwWTA5IpCohszGfE04EABxaTReLe4jq2?=
 =?us-ascii?Q?AFUgxjXPW6UyYrp5cirvUEjGcE9icnYiclmHg9XkDwvQ6LGgYzKHSc5b/iV8?=
 =?us-ascii?Q?DVjgffwhpecdm8f52aUiJVySPUoRzQwa55TM0dzD+d+2x/RH4OEtdqwSkZ2F?=
 =?us-ascii?Q?nRh3ZZ3LsTKgnlO5RsPQTtf5P0ijRyhds3rdB8tM2m5yXijGxGfiAmFASrTN?=
 =?us-ascii?Q?h58b2hzkpTGiJMN5StgLsoAlso8Z53tEajIRQiv4Ny9SOgQWAwWurOkKE3aK?=
 =?us-ascii?Q?Tz6bjKUEKRpvI19bF/gYSr6V9mxj4rBuW3T5ybxR7VlkrLjBL1caHQwhLfvk?=
 =?us-ascii?Q?xgzNJuFh5KpqB1qijqtvE4iGaVR5HG4wyJFfcv13DliJxv8ZQXxURiCLD0xa?=
 =?us-ascii?Q?Ei7XKBX8KXYhv+sJ2XthfTBAoZemrxVI/rjYAafO1A4RpjF+C7GrTeX5OfsV?=
 =?us-ascii?Q?0jYtqdrafmAnlLQUS9jcMnDUxIosx9w0GYyOvE1XKEzjQsWfdvOxWETgZ6zo?=
 =?us-ascii?Q?zrX+U274qA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7b7c11b-d83b-4079-650d-08da213e86ea
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2022 13:22:46.2949 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mqZakgqwmB0vyn3TSYwVBu/RdMvbUtJEdh5LqaXDM8AXaG51Awzks5M2DUdPScwZqkUHQcROsRkgkZE2w8xchw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2857
X-Proofpoint-ORIG-GUID: 0mf7eftsbD7ZzuPT20UYBMvG8hI8wZ4M
X-Proofpoint-GUID: 0mf7eftsbD7ZzuPT20UYBMvG8hI8wZ4M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-18_02,2022-04-15_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 mlxlogscore=999 mlxscore=0
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

This function checks if the given address range crosses frame boundary.
It is based on the existing x86 algorithm, but implemented via stacktrace.
This can be tested by USERCOPY_STACK_FRAME_FROM and
USERCOPY_STACK_FRAME_TO in lkdtm.

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 arch/arm64/Kconfig                   |  1 +
 arch/arm64/include/asm/thread_info.h | 12 +++++
 arch/arm64/kernel/stacktrace.c       | 76 ++++++++++++++++++++++++++--
 3 files changed, 85 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 57c4c995965f..0f52a83d7771 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -165,6 +165,7 @@ config ARM64
 	select HAVE_ARCH_TRACEHOOK
 	select HAVE_ARCH_TRANSPARENT_HUGEPAGE
 	select HAVE_ARCH_VMAP_STACK
+	select HAVE_ARCH_WITHIN_STACK_FRAMES
 	select HAVE_ARM_SMCCC
 	select HAVE_ASM_MODVERSIONS
 	select HAVE_EBPF_JIT
diff --git a/arch/arm64/include/asm/thread_info.h b/arch/arm64/include/asm/thread_info.h
index e1317b7c4525..b839ad9f2248 100644
--- a/arch/arm64/include/asm/thread_info.h
+++ b/arch/arm64/include/asm/thread_info.h
@@ -58,6 +58,18 @@ void arch_setup_new_exec(void);
 void arch_release_task_struct(struct task_struct *tsk);
 int arch_dup_task_struct(struct task_struct *dst,
 				struct task_struct *src);
+/*
+ * Walks up the stack frames to make sure that the specified object is
+ * entirely contained by a single stack frame.
+ *
+ * Returns:
+ *	GOOD_FRAME	if within a frame
+ *	BAD_STACK	if placed across a frame boundary (or outside stack)
+ *	NOT_STACK	unable to determine (no frame pointers, etc)
+ */
+int arch_within_stack_frames(const void * const stack,
+		const void * const stackend,
+		const void *obj, unsigned long len);
 
 #endif
 
diff --git a/arch/arm64/kernel/stacktrace.c b/arch/arm64/kernel/stacktrace.c
index e4103e085681..219b90c1de12 100644
--- a/arch/arm64/kernel/stacktrace.c
+++ b/arch/arm64/kernel/stacktrace.c
@@ -145,12 +145,17 @@ NOKPROBE_SYMBOL(unwind_frame);
 
 static void notrace walk_stackframe(struct task_struct *tsk,
 				    struct stackframe *frame,
-				    bool (*fn)(void *, unsigned long), void *data)
+				    stack_trace_consume_fn fn, void *data)
 {
+	struct frame_info fi;
+
 	while (1) {
 		int ret;
 
-		if (!fn(data, frame->pc))
+		fi.pc = frame->pc;
+		fi.fp = frame->fp;
+		fi.prev_fp = frame->prev_fp;
+		if (!fn(data, &fi))
 			break;
 		ret = unwind_frame(tsk, frame);
 		if (ret < 0)
@@ -159,10 +164,10 @@ static void notrace walk_stackframe(struct task_struct *tsk,
 }
 NOKPROBE_SYMBOL(walk_stackframe);
 
-static bool dump_backtrace_entry(void *arg, unsigned long where)
+static bool dump_backtrace_entry(void *arg, struct frame_info *fi)
 {
 	char *loglvl = arg;
-	printk("%s %pSb\n", loglvl, (void *)where);
+	printk("%s %pSb\n", loglvl, (void *)fi->pc);
 	return true;
 }
 
@@ -210,3 +215,66 @@ noinline notrace void arch_stack_walk(stack_trace_consume_fn consume_entry,
 
 	walk_stackframe(task, &frame, consume_entry, cookie);
 }
+
+struct arch_stack_object {
+	unsigned long start;
+	unsigned long len;
+	int flag;
+};
+
+static bool arch_stack_object_check(void *data, struct frame_info *fi)
+{
+	struct arch_stack_object *obj = (struct arch_stack_object *)data;
+
+	/* Skip the frame of arch_within_stack_frames itself */
+	if (fi->prev_fp == 0)
+		return true;
+
+	/*
+	 * low ----------------------------------------------> high
+	 * [saved bp][saved ip][args][local vars][saved bp][saved ip]
+	 *                     ^----------------^
+	 *               allow copies only within here
+	 */
+	if (obj->start + obj->len <= fi->fp) {
+		obj->flag = obj->start >=
+			fi->prev_fp + 2 * sizeof(void *) ?
+			GOOD_FRAME : BAD_STACK;
+		return false;
+	} else
+		return true;
+}
+
+/*
+ * Walks up the stack frames to make sure that the specified object is
+ * entirely contained by a single stack frame.
+ *
+ * Returns:
+ *	GOOD_FRAME	if within a frame
+ *	BAD_STACK	if placed across a frame boundary (or outside stack)
+ *	NOT_STACK	unable to determine (no frame pointers, etc)
+ */
+int arch_within_stack_frames(const void * const stack,
+		const void * const stackend,
+		const void *obj, unsigned long len)
+{
+#if defined(CONFIG_FRAME_POINTER)
+	struct arch_stack_object object;
+	struct pt_regs regs;
+
+	if (__builtin_frame_address(1) == 0)
+		return NOT_STACK;
+
+	object.start = (unsigned long)obj;
+	object.len = len;
+	object.flag = NOT_STACK;
+
+	regs.regs[29] = (u64)__builtin_frame_address(1);
+
+	arch_stack_walk(arch_stack_object_check, (void *)&object, NULL, &regs);
+
+	return object.flag;
+#else
+	return NOT_STACK;
+#endif
+}
-- 
2.25.1

