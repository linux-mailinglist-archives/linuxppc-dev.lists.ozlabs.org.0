Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B95350567B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Apr 2022 15:36:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Khnz107Jbz3bg2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Apr 2022 23:36:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=windriver.com header.i=@windriver.com header.a=rsa-sha256 header.s=PPS06212021 header.b=Qo6H6/tr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=windriver.com (client-ip=205.220.166.238;
 helo=mx0a-0064b401.pphosted.com;
 envelope-from=prvs=1107a9ca43=zhe.he@windriver.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=windriver.com header.i=@windriver.com
 header.a=rsa-sha256 header.s=PPS06212021 header.b=Qo6H6/tr; 
 dkim-atps=neutral
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KhnyC3MLLz2yfZ
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Apr 2022 23:36:03 +1000 (AEST)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23ICBnc3014635;
 Mon, 18 Apr 2022 06:22:58 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=nnChPSqJXpUTi6zekwIMRyrlocC10UkdDcqufEsb44w=;
 b=Qo6H6/trWCLSLXZKyBZa4d3WirD2S0Ch7QM+t6fWvy+EPbRdBmHwmK+H4GVTbJJQNKI3
 RD9oPh0uap2IfIe0robdfuKteUFc0B2M7ym2jmInh1UuV9fKqEPDuGCbRDxVF5hDOkuB
 cPK42OWTT49Pd2kvWgJNTDvT02HYZeFFYwwBUgJr5Vd6Hn3wmEM/IEPs4A1xuYEGwIYu
 X4Tke1UqsM6cUBzCPAA9dQ8U+umUuX068eW+uXmlb+WCkmqr2YrKppaOdAZ1DEdmX0ru
 5+SYpzODssiSbehXNazKKNJnoMey78F7f9i37OkH9Kp0AyzxRy5n2zYx0xZ/aAp7wmWT bw== 
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam07lp2048.outbound.protection.outlook.com [104.47.56.48])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ffwah150p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Apr 2022 06:22:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pvk4wjTHAXItKiubxoVELZYLZus3YgY4kUPvMIKiNrW8IMuJDrOP2YPA5D+o9/XBsYfVdiSGV12Hd9MNvKenE9CeDXR5xMkB0fI2PsN08IPZ3Iuc41Wj5CHKu2bWTSquYn2mD8uezf2r6MeF/tuniROGpGaLEHYJjcprBognVV/+x4MkrBBqoDwxVtyDIY4VRjLZLmjeBz28OjJLHEn5qGJdrPHJfX8cRjy6QQ7jZsKKgRn7ena8XNONw9zwD8Mia3vLLevQa6NygtJeuqS4Rw6IkmySY3jDlc4ry6TMMzudN6q33AS6KJWxVVy4TNG+MZV9CA503F+dsIp9YbG6pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nnChPSqJXpUTi6zekwIMRyrlocC10UkdDcqufEsb44w=;
 b=PEFsoz7kmPuHp/1Fe32FHNnLcNPGswiIl08gtrJNwaHLr77nYzuwevoKiuOWZFSJ3Q55Qdvx+BExyBf0EXGxB7LoYIWIoIuWKs2fVKPGOV8zkC2ZRGRJg2fFFQJGaf6U6bdu+kQscPwdN4rCx5hWAEuObWZd+OUDOlGK90TOhFlyz4jjHIH1EKCU800S4gHXYX5fBSa4D5NLtaWqxDprgTQX/+CaO4uxnRmVBFSpYKVPDzP+zqj1IKNucuiJquQ63jFo45w5nepwLWa7/iH+OnvOVlWwnNPOM0NWOgt4KtdlODWo0xhjTVD8JhaZZ+UfHKS7KlT5gY2Duk3AWnlwgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MWHPR11MB1358.namprd11.prod.outlook.com (2603:10b6:300:23::8)
 by DM6PR11MB2857.namprd11.prod.outlook.com (2603:10b6:5:cb::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Mon, 18 Apr
 2022 13:22:56 +0000
Received: from MWHPR11MB1358.namprd11.prod.outlook.com
 ([fe80::1cd4:125:344:9fc]) by MWHPR11MB1358.namprd11.prod.outlook.com
 ([fe80::1cd4:125:344:9fc%7]) with mapi id 15.20.5164.025; Mon, 18 Apr 2022
 13:22:56 +0000
From: He Zhe <zhe.he@windriver.com>
To: catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com,
 tglx@linutronix.de, bp@alien8.de, dave.hansen@linux.intel.com,
 keescook@chromium.org, alexander.shishkin@linux.intel.com,
 jolsa@kernel.org, namhyung@kernel.org, benh@kernel.crashing.org,
 paulus@samba.org, borntraeger@linux.ibm.com, svens@linux.ibm.com,
 hpa@zytor.com
Subject: [PATCH RFC 4/8] powerpc: stacktrace: Make callbacks use new prototype
 with frame info
Date: Mon, 18 Apr 2022 21:22:13 +0800
Message-Id: <20220418132217.1573072-5-zhe.he@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: 99599bfd-ae8b-48dd-c355-08da213e8d1b
X-MS-TrafficTypeDiagnostic: DM6PR11MB2857:EE_
X-Microsoft-Antispam-PRVS: <DM6PR11MB285705CF8C9F8C3C635184008FF39@DM6PR11MB2857.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Tq3U57KdIFMlbl8ue0MywnQFRK/3rPd30+fZeCPH/iaxGXfAThGMFPg4bHWSIO9V4uk+KRtYZ126GDfac8blLbqjePWPJ4dCu2VX/Fbz+NcUHJXVNhjmiZGT22vgYT0aFnCcl3xNUhKIfMm72cea+sijm3osto7HCKmqbLD/1NihjeZuTPj4W1UQ1Ku/pHUDZf5xbl8WvlUt3BYlEWtQ3kErdKqq3jLDPelytKW3el/mKPA5sbCCTCDdHgJwHEfteNtSjFrp2MGVVlR6q+DpyXMugyr+Yl/7FelOEv8o0MGAnoTN71jD8Gs6WfSCnraHZkiOleTvDOlY0LK9AgvQnBwnjtWZoXx2Lm/XidTIwsa1zyReKSrD8KtC1vHbPcBGedGZzE9kTDjYTN1fIaDPaRi8h/RWgAeRMcKVLmEu9PnMwOkd2iBePvceESZzz+4PET0/8JsvaMioe4bzROBKlyVW5Mvt0xu1lzKu5KZqRzboygbMw2Xz6hfSn8FBArW3mGMc8M0Srk2thBBR9+duydOOE6m/gCaeiLAPIxwN59ytU303zUnkKRdVE53WB2fq/ds5dmr4pxOV9GTbOLMOYB+7QYUdpm3KfoUkQ1K5Focpt66eL3nyQfp3fEwjU6RI1b/60aSlq0hb6n0X6fyXGBtqdVtbO2F0fMGAH2cjNtw8O814URh0BkGuk6sCOq3OiKvXc1HDhItN1lguBHBM9ZvW6zq5csKyqvtK+v3f62E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1358.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66556008)(2616005)(186003)(86362001)(83380400001)(1076003)(38100700002)(66946007)(316002)(66476007)(7416002)(107886003)(8936002)(2906002)(4326008)(6506007)(38350700002)(5660300002)(508600001)(36756003)(52116002)(8676002)(26005)(6486002)(921005)(6512007)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EMneee429EMJNL1cg+AD+ytfgDz+cxg6LiqjTBkL4v4x45Zjc3T2tpvSR3tB?=
 =?us-ascii?Q?0snds8dQxaP/OpARzYUOSajoB1e6kf85kprsJl6AjI/XBOx/XJSUpkwDNpub?=
 =?us-ascii?Q?iZj/iAVnKxDkiYVtKyMpsezPpuETLRxwSFliADnm6UEttldHpBIC/psCqCg+?=
 =?us-ascii?Q?/rq57nDXJRro4XbFhjJaSY251a7sYCY7UodDZJc0NWtskm6woWdLaukzntTa?=
 =?us-ascii?Q?dVMV0ruqEg62QJk55tyfYmWdbracd6hkmvbQP9aYUk2Cwp5g6kDUM1Il9WBY?=
 =?us-ascii?Q?aWSDafMDvG4UOEVI9PQthmoPrT6go0mgEpCsqSjWVHseMHkSQ3oXZqr6Faqg?=
 =?us-ascii?Q?js6OtaxDEbKlbLAWnqHzyib9qpR5IqkSxzhDmKTn88qiIwg3+QUSe2MMQHBY?=
 =?us-ascii?Q?UpLm6do0eeQ741Ipyqbbh/FxL1tA0Uzd+Fyzb2FhEG6gxKueq8jq7anhuYqn?=
 =?us-ascii?Q?bMx5jlq4vLarEhauRfSHLwBdd4ROBeTqzc8Ho3TpSgi6HQo1G+xmpsZq5Z7N?=
 =?us-ascii?Q?Zd0xmmRrY1HKrD21SXHFi0OR4ZkZzYBtWLehTxOQ7v/5Ff8N3wfHFVjyyE+v?=
 =?us-ascii?Q?Rj51tjHHEk5Rp76aRrv4UX926EafqwgFsRpS5hrh41HbsEO7gXEU7GMMCL4n?=
 =?us-ascii?Q?6lU1S4QiNladvijpT8RPn1yWoyiOGOP358pdvlgQBPcX2BFFsLSkwqbcg4ju?=
 =?us-ascii?Q?L1zRoXlSLbNXbQJO4IUxyIQnfTLFDAwSveN4XLNXNQ92MNuQ/r9hLk90MMwf?=
 =?us-ascii?Q?wK/mmLbbBLQ5MR2TM2bV1wJDHFxaAofqJtvCD8WFe3bF/TrcS+irxoLeVEvW?=
 =?us-ascii?Q?M8FgtWzxcD1Z5X1UFkKl04avZBcsB73KDk2pr1eezyonUguShN4wqC6AHjfV?=
 =?us-ascii?Q?Bo7xOHKf2hJo94fuIj9cv44kfnJ4Oswabk1/s893i+qPGGoLLNZoZJuaHzpH?=
 =?us-ascii?Q?tvOOw0Vt7hjr6I5wcLBLsq4racLvlkUZRIk13wrD5jiC4w1DgPvt3zl+fJeg?=
 =?us-ascii?Q?e7mlufy3DDQckXallDGigP0CXQ88Dr4perj73MhAeEh/gbcr1/9bziyFFAsM?=
 =?us-ascii?Q?D3Xo1I5DgT79Iem9U2OF4mM4rxFIxZqP04P51mXQ4+fwqa5QXRt3YWSuwD2N?=
 =?us-ascii?Q?i0ceqXayJDdZHXqf2+ONtCfiC/WS0cO/7kDHIKxsDSUZvp1ec6KXirmxgW/+?=
 =?us-ascii?Q?/ATcW4U6fORUparBE44toxWT1CqeTTeTRUCwf/q1STzzbkaYazT+qJ1X2bDR?=
 =?us-ascii?Q?aDG4KHemS9o1ywIgGwqaG7bFXZo1oLVu2bRGM47qX4Y2ktBH8tFz7BmZxWUC?=
 =?us-ascii?Q?P/ly811ZQmQMLc1g6Jmb1DdqtPMT18JuNcGLzYOucjJifAjWi3Dw8pfsA/uw?=
 =?us-ascii?Q?78RbyEJXNWdmpOKVq3kiCThUydcIPFvq0RWckbTREH/DK86u5nmZ36j5E50E?=
 =?us-ascii?Q?CbeyY7qev21ek89Vsy5U+QCJDydRCSz/gb+C7NDck3Xy24oua5oExrQ3IdTr?=
 =?us-ascii?Q?E/NKSE0t9uWTArEVenXzAU9S+v9gICJrqzEf3R1GehmK/P7X/oj7HH/ElNl0?=
 =?us-ascii?Q?Wxa+66pYrqNRjA/lk6p/xk9Wr2V6x+4JouRmlnKifGE7phVLwQSl/35c7V2Y?=
 =?us-ascii?Q?lLZR6K0gHErTagwBXZupcjSn6l9h5yP11zuBbjyeVpGyXQmkCFPd70bQg02c?=
 =?us-ascii?Q?ubz73cU0U4ExLbAL06XJ66Th2XjC1mtDyCwvF75grVdTnCQdpnv1MKalxAhI?=
 =?us-ascii?Q?LTTXPe4QOw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99599bfd-ae8b-48dd-c355-08da213e8d1b
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2022 13:22:56.7004 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SgqWfGxXAtBIAy+cVXXJZTRz4gwknKCsyPADuFg+VgxWRE4vD81EJUwYVCYvNaMMkfxRTDZBMXafQ9MT+y3JzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2857
X-Proofpoint-ORIG-GUID: DPEj9QxHWeM-U3XqjFdxjg-BG26mSCZo
X-Proofpoint-GUID: DPEj9QxHWeM-U3XqjFdxjg-BG26mSCZo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-18_02,2022-04-15_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0
 mlxlogscore=468 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
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
 arch/powerpc/kernel/stacktrace.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/kernel/stacktrace.c b/arch/powerpc/kernel/stacktrace.c
index a2443d61728e..8640e9acfa29 100644
--- a/arch/powerpc/kernel/stacktrace.c
+++ b/arch/powerpc/kernel/stacktrace.c
@@ -28,9 +28,13 @@ void __no_sanitize_address arch_stack_walk(stack_trace_consume_fn consume_entry,
 					   struct task_struct *task, struct pt_regs *regs)
 {
 	unsigned long sp;
+	struct frame_info fi;
 
-	if (regs && !consume_entry(cookie, regs->nip))
-		return;
+	if (regs) {
+		fi.pc = regs->nip;
+		if (!consume_entry(cookie, &fi))
+			return;
+	}
 
 	if (regs)
 		sp = regs->gpr[1];
@@ -41,15 +45,15 @@ void __no_sanitize_address arch_stack_walk(stack_trace_consume_fn consume_entry,
 
 	for (;;) {
 		unsigned long *stack = (unsigned long *) sp;
-		unsigned long newsp, ip;
+		unsigned long newsp;
 
 		if (!validate_sp(sp, task, STACK_FRAME_OVERHEAD))
 			return;
 
 		newsp = stack[0];
-		ip = stack[STACK_FRAME_LR_SAVE];
+		fi.pc = stack[STACK_FRAME_LR_SAVE];
 
-		if (!consume_entry(cookie, ip))
+		if (!consume_entry(cookie, &fi))
 			return;
 
 		sp = newsp;
@@ -71,6 +75,7 @@ int __no_sanitize_address arch_stack_walk_reliable(stack_trace_consume_fn consum
 	unsigned long stack_end;
 	int graph_idx = 0;
 	bool firstframe;
+	struct frame_info fi;
 
 	stack_end = stack_page + THREAD_SIZE;
 	if (!is_idle_task(task)) {
@@ -159,7 +164,8 @@ int __no_sanitize_address arch_stack_walk_reliable(stack_trace_consume_fn consum
 			return -EINVAL;
 #endif
 
-		if (!consume_entry(cookie, ip))
+		fi.pc = ip;
+		if (!consume_entry(cookie, &fi))
 			return -EINVAL;
 	}
 	return 0;
-- 
2.25.1

