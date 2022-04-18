Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E628E5056D4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Apr 2022 15:42:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Khp5s6gjDz3dPW
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Apr 2022 23:42:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=windriver.com header.i=@windriver.com header.a=rsa-sha256 header.s=PPS06212021 header.b=Uq7P3lxI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=windriver.com (client-ip=205.220.178.238;
 helo=mx0b-0064b401.pphosted.com;
 envelope-from=prvs=1107a9ca43=zhe.he@windriver.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=windriver.com header.i=@windriver.com
 header.a=rsa-sha256 header.s=PPS06212021 header.b=Uq7P3lxI; 
 dkim-atps=neutral
X-Greylist: delayed 766 seconds by postgrey-1.36 at boromir;
 Mon, 18 Apr 2022 23:36:20 AEST
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KhnyX2mlNz3bcV
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Apr 2022 23:36:19 +1000 (AEST)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23ICwbRE025232;
 Mon, 18 Apr 2022 13:22:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=ftnAEPg6j9NnJafF63j580R9jqMTcER28Lpds1cKwVc=;
 b=Uq7P3lxIaXU02QF3STbt8YyXPx1kVZclZjwrdCxriEcSjHM1fULlBvgCEGx+ZmadsCJr
 yEJLuvWQEVTSlfnAcFH+1dh33MbP9HxhBYiO1OXJjpjpQUxf55EXxgnGiUvukqWOyE6a
 R7nCzF4oVDOiYv84l7A01T58BS9Znb2UtfD4H0ielWBdvJqCY0Pg6h0Rc/+S8mT2m6to
 oJ2vSLbPvvuQGtLO3hevonY5lBf3D24zETnT0GvM57qvUkNofu5goLA+zXB+7ipYeC5P
 I3A1DyAOuEr1pcKULhD4JriEmt0zmN3rb16zhyGGP1Yz3gckBZ09xyKjNlRYhOf890/W bw== 
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam07lp2047.outbound.protection.outlook.com [104.47.56.47])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ffpj2sav6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Apr 2022 13:22:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U3L4cn8/iN76FQZOLZhfMj/RQSFAXMLNNYTXbKP8f3m1FVKf7DriTWRrbMXmHtInHNgGDewWXlhcOW1nDlargKFPxIhV+0vU8k0qrkKKZ/jkjUIjpsb41s5vbo0flVJOsTn+ARicGjV735tg5YZ9Ean80sEeMDr17GlcfL8jxqvqIAcIK0yIybTt52zSAGy/QYxDoLgy49OgaPM3hMVilpPO5YtmGhgMGQrLyTkVMEm28CfZd+44NSYAcDTNKaV+eluN9OZzbkw0d0Ofr5eXmFFjULPyEwuhwqQL5tldyZ4VQMlGgVjtnDt/ROhpnJfjtDDiw4OZLwX4MrczD5ZOGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ftnAEPg6j9NnJafF63j580R9jqMTcER28Lpds1cKwVc=;
 b=Kq1LlS1bSXArds7+KXWKJOWW4j/PtwFrT63szOjiyMcGKIK6H7UqrPcbCdMOJr5gDjyaATK+stA4w6upFxjWBHFkvghASGFxPYkT50v/VAQTMnFRxU+K8N1cvptJpSZ/seGy81zV5qViQRsje8H2mFpBJg3SqEXffbdT5UlFADancfVwbzY3Hc5y9gCmqKmKaW43ZAa89FG3eWJRTSKWvm0c+aZlhwvuRHzcq7ILlJmeAIDL6JHaiMCpn3p23Tt4G+4Nu9Pnok5QcNnmqFXOSkyiOp5S7pivozSQ2+NueQb92zNQKqwDvYWlUPgFGpLWGLr0N2qNzlDeJF1XDz56xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MWHPR11MB1358.namprd11.prod.outlook.com (2603:10b6:300:23::8)
 by DM6PR11MB2857.namprd11.prod.outlook.com (2603:10b6:5:cb::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Mon, 18 Apr
 2022 13:22:41 +0000
Received: from MWHPR11MB1358.namprd11.prod.outlook.com
 ([fe80::1cd4:125:344:9fc]) by MWHPR11MB1358.namprd11.prod.outlook.com
 ([fe80::1cd4:125:344:9fc%7]) with mapi id 15.20.5164.025; Mon, 18 Apr 2022
 13:22:41 +0000
From: He Zhe <zhe.he@windriver.com>
To: catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com,
 tglx@linutronix.de, bp@alien8.de, dave.hansen@linux.intel.com,
 keescook@chromium.org, alexander.shishkin@linux.intel.com,
 jolsa@kernel.org, namhyung@kernel.org, benh@kernel.crashing.org,
 paulus@samba.org, borntraeger@linux.ibm.com, svens@linux.ibm.com,
 hpa@zytor.com
Subject: [PATCH RFC 1/8] stacktrace: Change callback prototype to pass more
 information
Date: Mon, 18 Apr 2022 21:22:10 +0800
Message-Id: <20220418132217.1573072-2-zhe.he@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: 8e16a17b-10ad-4b7b-2073-08da213e83ed
X-MS-TrafficTypeDiagnostic: DM6PR11MB2857:EE_
X-Microsoft-Antispam-PRVS: <DM6PR11MB2857495DED66E1143723EE278FF39@DM6PR11MB2857.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VAPL1TNZfmyLt15PqYvr9hk9MmZhq9HfJBfQDmFmBagLDKTqMhlYYp7xKNEUFYJG8gxbyRx0jH4IayMYGesaGf4Ki8y6fROeY9kolB3p/63FbqKIzOKt1GGLvlqNANpJjL0DwDjYXA3tEoB97afDMarrWc5xIdBiEAQQ7tf9NeeU4ktgHELi9dPdfkWqHVtC7VEX05ZwzOONvZyc9HJHbGplLk3AywN54PlfV/X0lccSyphes1ze8IytFJ8G2baphWUW0ZZjdaX/OQkl04iQN9l76/TyRM4+3debSKPW8IpT9d4XCOEdUBbwzwbAZnQ09H7mr61kvk7pR08QXKGF+o21NJltyNEBwk3UTUMz6HIrW3konV/Soh60Ig2mOKIjZ1Ba0hlBBKtpOd6UgRz9JhX3XQstd1re40d+n4ENKRdnYsaTUYm61cJE6GAwGDMVELIEjQUJ2mj6AP7EukfQ1bYKwBjRu9Gv6F77iIKi6WjlAbyJUk6jQpZ5cYt7b6kCelK2FOIuk6X6PEqJuA4EdDfAxwfl3agGn+UUwLB2qaPWdBwIVtT4KFy5h3mVnPw85Cgg31YM7Qct8LBJV8iGwawtQzfzYygtDj9tkLrdk4mw7ihbaam5PVKnEaXnlsoCTgfL3vqgGGuXGWRQ0Vb20FXj531HZdsz7XR+QJsotUjqUi6K/yFjO7HbrwT9kANIAns7ZTWUsdZ0XawaLnuQAE4Zt1ZsPzecwSwXrNC8VB0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1358.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66556008)(2616005)(186003)(86362001)(83380400001)(1076003)(38100700002)(66946007)(316002)(66476007)(7416002)(107886003)(8936002)(2906002)(4326008)(6506007)(38350700002)(5660300002)(508600001)(36756003)(52116002)(8676002)(26005)(6486002)(921005)(6512007)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1G5vd0Ybv8HM3FCPYqjd9mXiVer/C+fKv23CbNha6wgswBx2dhFPDYVhM5dE?=
 =?us-ascii?Q?PTrwnx11XiSvy9GIBxthzV8A13e0FI+HnDYIp0U9fQbY8Z9pozkAQQlE36eM?=
 =?us-ascii?Q?5LFV9+TYkY5HyHh/dA4SWUzEdHQ6nmK6idP0aaVh19ipjaYuPDiz99T/YO4H?=
 =?us-ascii?Q?2tDWbZ/iVVFY7WohVwVH0aSPVaSlBQIEvZSxola3Fze70s6wyXvlwqYrvhsZ?=
 =?us-ascii?Q?eDfqbFN396OyfqjZe2uV1azSW4RtZaHKahdSiB34TkidvAIQgJz6RtoHg2Bk?=
 =?us-ascii?Q?AisFTQOTERGYWb3SsuoeMcDnKIEojaeoXoJqL7m46rt7zzahLqTeIHsgT4Hr?=
 =?us-ascii?Q?Q2b3reMBOir9usPJ6uRluAWoN1ZZ63nz7txidDifkFSJ+D88m6CkQylPOq+l?=
 =?us-ascii?Q?cpU3jQZdNz44K6CUpxRstoGJDo1U7CiWEr0Wkgh5qoLoXeL4QhKFswwV4AI+?=
 =?us-ascii?Q?VpY57tDQk9SYMkapd0fRXg8i4TdqJGBx5rtqEisGvZioz25XcLXbG6vmFIFx?=
 =?us-ascii?Q?cS3DYvIitYLFGSR1AhZhc/uzf3poM9LUjFjo6Va8kDTiS2RnLnPEjfgxjFQL?=
 =?us-ascii?Q?ljlOxC/IxHKmKyIqmEAuvwOyNYyYQB04vzy3C1SlDxpqEnR3PsWWz7OSJmGp?=
 =?us-ascii?Q?lVyeOGnAs3djdQgWi5utP7g48dtPNiLXL2jQ55pnoxoEu1HnFrNu6uDotJxv?=
 =?us-ascii?Q?U5SadwYdhDdm2dVdw7Mk3Mj+/7zRoeBA9pIz5NPornzYJ0lmtBi4pnNcdwaA?=
 =?us-ascii?Q?Oe3hc4CFhVzlVHprL7ptfam684doBv8/MrBmYSlrCHVouWxR5D4B4fNLcxg/?=
 =?us-ascii?Q?NXFE1Tukh3cxQanAMN0nNNtF/tCSeGJJjyKDqqyRj27csw4sRdYbswu40fX+?=
 =?us-ascii?Q?17QW1EWQ4p2Hv6DQBQIle4SdPVcXTbdFiT2xvAuIMsmnGHy4ZnM8FuzxumCb?=
 =?us-ascii?Q?mFyka8DpIEbpOXA/b6yqZx0n2VLAL0jJUjRvxieqTNbt0WVdkh2BRUoVM5Xa?=
 =?us-ascii?Q?MKnBEI/nQ6k/fYpryGjE7kJi+wd+oFr0cY9em4ntk5pDst5PWo5NfKduS5Bj?=
 =?us-ascii?Q?8urjf049BRGMKhARPnbtRZvFas7+d/q3MOO7g4bbevOic0TFQZc8UR4a6r67?=
 =?us-ascii?Q?WOSQx/Z97dwR/oLXRWk/72VBWoKoEatBX9kP+Qp7M1SHOLhyvWgJqIh2HQDE?=
 =?us-ascii?Q?dxxcQxgTtfJbzxj/cejN/jjQwyGFDJEmewkx8LuL8td3jcW8S3AzzZl/WjEj?=
 =?us-ascii?Q?7e0NIt/9lNnyyft0AxVEexMu+Uktw7eNHHo4EHABs+dnaMUQkF8E/Ysz00Xm?=
 =?us-ascii?Q?a6vElLNvuIRmchW4mwW3nNhXwgOescuYzKvfJRMvRDO9oNcNMUy/aB/2ClSZ?=
 =?us-ascii?Q?5+cuO8ixdF+iX+Dg6nHwqlFS8+jrYX8jfkAP+S8NL3uLW/WVNfj36sQt1f6G?=
 =?us-ascii?Q?BQUQX6wb0Hv+aXT/NEjZjhn+1oeka1SEPPGe7ygOEpHfH1BMoebbJ1imjlgT?=
 =?us-ascii?Q?Q23zusfwFKuQ9lIu3d335n9UDbWrVxu+GcLiR87W/XSLp2XzN9joL6+jBpT0?=
 =?us-ascii?Q?FGLKsUvjXNgYo2XhP/B135cX+NHAVFFNuAcC6Yi8S6cZwASGmOkyqQvvpg0S?=
 =?us-ascii?Q?Pwxnx07irWiL0aoWzXifSHnSt56vDxVjRT3ROLxOjNS6fhi/nyNPmE74Eve0?=
 =?us-ascii?Q?3NBxaugq9RVXjLN9ft7H9ZB9gs563MvMOhJR2G/BMq+2Li65Pg2vS9rzW+In?=
 =?us-ascii?Q?Neb3G9WRpQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e16a17b-10ad-4b7b-2073-08da213e83ed
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2022 13:22:41.2797 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +lstCnSzfGIOGe6KYoiIR1ao/Ad0x2Ed4qqeFO//mtX0/f+P2UccQL8rsfVQTW8WyIc+xSV1tt8KYutGX5mSgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2857
X-Proofpoint-ORIG-GUID: SIdr9PT7NXeP8IqkC7E_0A_OlAie3zR2
X-Proofpoint-GUID: SIdr9PT7NXeP8IqkC7E_0A_OlAie3zR2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-18_02,2022-04-15_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=0 bulkscore=0 spamscore=0 mlxscore=0 malwarescore=0
 mlxlogscore=984 clxscore=1015 phishscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204180078
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

Currently stack_trace_consume_fn can only have pc of each frame of the
stack. Copying-beyond-the-frame-detection also needs fp of current and
previous frame. Other detection algorithm in the future may need more
information of the frame.

We define a frame_info to include them all.


Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 include/linux/stacktrace.h |  9 ++++++++-
 kernel/stacktrace.c        | 10 +++++-----
 2 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/include/linux/stacktrace.h b/include/linux/stacktrace.h
index 97455880ac41..5a61bfafe6f0 100644
--- a/include/linux/stacktrace.h
+++ b/include/linux/stacktrace.h
@@ -10,15 +10,22 @@ struct pt_regs;
 
 #ifdef CONFIG_ARCH_STACKWALK
 
+struct frame_info {
+	unsigned long pc;
+	unsigned long fp;
+	unsigned long prev_fp;
+};
+
 /**
  * stack_trace_consume_fn - Callback for arch_stack_walk()
  * @cookie:	Caller supplied pointer handed back by arch_stack_walk()
  * @addr:	The stack entry address to consume
+ * @fi:	The frame information to consume
  *
  * Return:	True, if the entry was consumed or skipped
  *		False, if there is no space left to store
  */
-typedef bool (*stack_trace_consume_fn)(void *cookie, unsigned long addr);
+typedef bool (*stack_trace_consume_fn)(void *cookie, struct frame_info *fi);
 /**
  * arch_stack_walk - Architecture specific function to walk the stack
  * @consume_entry:	Callback which is invoked by the architecture code for
diff --git a/kernel/stacktrace.c b/kernel/stacktrace.c
index 9ed5ce989415..2d0a2812e92b 100644
--- a/kernel/stacktrace.c
+++ b/kernel/stacktrace.c
@@ -79,7 +79,7 @@ struct stacktrace_cookie {
 	unsigned int	len;
 };
 
-static bool stack_trace_consume_entry(void *cookie, unsigned long addr)
+static bool stack_trace_consume_entry(void *cookie, struct frame_info *fi)
 {
 	struct stacktrace_cookie *c = cookie;
 
@@ -90,15 +90,15 @@ static bool stack_trace_consume_entry(void *cookie, unsigned long addr)
 		c->skip--;
 		return true;
 	}
-	c->store[c->len++] = addr;
+	c->store[c->len++] = fi->pc;
 	return c->len < c->size;
 }
 
-static bool stack_trace_consume_entry_nosched(void *cookie, unsigned long addr)
+static bool stack_trace_consume_entry_nosched(void *cookie, struct frame_info *fi)
 {
-	if (in_sched_functions(addr))
+	if (in_sched_functions(fi->pc))
 		return true;
-	return stack_trace_consume_entry(cookie, addr);
+	return stack_trace_consume_entry(cookie, fi);
 }
 
 /**
-- 
2.25.1

