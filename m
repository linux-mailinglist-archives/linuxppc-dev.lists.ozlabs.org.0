Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D53595056D2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Apr 2022 15:40:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Khp3s65M3z3cdQ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Apr 2022 23:40:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=windriver.com header.i=@windriver.com header.a=rsa-sha256 header.s=PPS06212021 header.b=li90JFSz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=windriver.com (client-ip=205.220.166.238;
 helo=mx0a-0064b401.pphosted.com;
 envelope-from=prvs=1107a9ca43=zhe.he@windriver.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=windriver.com header.i=@windriver.com
 header.a=rsa-sha256 header.s=PPS06212021 header.b=li90JFSz; 
 dkim-atps=neutral
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KhnyL1zcDz2yg3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Apr 2022 23:36:09 +1000 (AEST)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23IC03fF017303;
 Mon, 18 Apr 2022 06:22:53 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=zbDgblK7RewJFoMTrbxTkPOFdnN0ql1h+vVBC3YB56s=;
 b=li90JFSz9j8n4ca65kS5PF7ENAFQkXf37M4gcYUV72uiskH4cnK/UreWqsDCF2bAZssI
 KoxKZuwG1A97q25TBl1SgHsxRSiVX+DI3USvkr5rL2MChcAfu3uOio8Op2KJeCLn1a2b
 aMxi6bv9sj8UTclFbj85xu6YG5FSQ4PTZJ+yjDEVq0EMFj6SEotGHDncvX5b5D7KseSZ
 cNQAr5kcBU8LlfXQ71nMa/G37ZTVOA/d3RyLu09aga3ZJiSiEH0dTE0wUAXQHNy7bNiC
 iJnlpUdqvaX/3VIPl1Bp7hY9rZ+X1jvuMq2DpwRpWvmkTC6g+Jx8c/bLtFV4eesVtkAH xQ== 
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam07lp2048.outbound.protection.outlook.com [104.47.56.48])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ffs3118r4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Apr 2022 06:22:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M8C3puzHERKphpID9gcNtI7rr3TqCG1JeGDvmQBHg+RoSI02gZQ3FbwSOp7GILjkgcobeHkuQi9inox6//Tig47yM2PODi1Zh8lVVNEMwtMOjJnkRhGNdUQcmbxc5rTjDjb5vUVLyvODfuPFNOIJf2QT3HztIbDxZWe18LZn3zAVYV6WZZakoCtUCS/wIBgxqBNVfSrQPxVApBOuv20AcRpHX1nzRSWCjYLiOaedO2NfEORE8w7CDtKFW/UvbI+IDjl8cdbg+kKJCoOP2UwoC9WVTEPO2ndizDuW8wzpYiqUeZ2qBVDB5IIfKGInPjVLUfhm231nCeBEWfwlPHGcmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zbDgblK7RewJFoMTrbxTkPOFdnN0ql1h+vVBC3YB56s=;
 b=J5y/kZGvJq/O6IeWfsqlX5IWDF+PGmniftC4Tt1sn6DXvNT19U5OYY6fTQwEY8Cq3mhLVK22I7qWNr1lyLjsy/o50xqQCAggi0NZKu3VqP8nBkOTu7+Ms+rh3UP58Vj0AphfRIf6h8DCEjpoGDAOSqH+1kbype6lkfoWmjAfi9jn+l9vZU/HnGbGOsCTpcKIbUkKkFLpkxHoNtsNb/Vqc5q5XydRPwze7oaOSESlSkk7G8VTzTuIm0DC7i9l6wqEAwN0dWj6QQ5tUdjHMevyNUdWsQJuS6Dhu4cGhaLyEWOyg2HAfpJFdSaj4o3LkatdnRm6xzqJk9nUpUz24/AQ3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MWHPR11MB1358.namprd11.prod.outlook.com (2603:10b6:300:23::8)
 by DM6PR11MB2857.namprd11.prod.outlook.com (2603:10b6:5:cb::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Mon, 18 Apr
 2022 13:22:51 +0000
Received: from MWHPR11MB1358.namprd11.prod.outlook.com
 ([fe80::1cd4:125:344:9fc]) by MWHPR11MB1358.namprd11.prod.outlook.com
 ([fe80::1cd4:125:344:9fc%7]) with mapi id 15.20.5164.025; Mon, 18 Apr 2022
 13:22:51 +0000
From: He Zhe <zhe.he@windriver.com>
To: catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com,
 tglx@linutronix.de, bp@alien8.de, dave.hansen@linux.intel.com,
 keescook@chromium.org, alexander.shishkin@linux.intel.com,
 jolsa@kernel.org, namhyung@kernel.org, benh@kernel.crashing.org,
 paulus@samba.org, borntraeger@linux.ibm.com, svens@linux.ibm.com,
 hpa@zytor.com
Subject: [PATCH RFC 3/8] arm64: stacktrace: Make callbacks use new prototype
 with frame info
Date: Mon, 18 Apr 2022 21:22:12 +0800
Message-Id: <20220418132217.1573072-4-zhe.he@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: d60d8851-3b6b-4b3d-a9a4-08da213e89e7
X-MS-TrafficTypeDiagnostic: DM6PR11MB2857:EE_
X-Microsoft-Antispam-PRVS: <DM6PR11MB28570142CD083BA66C461DB18FF39@DM6PR11MB2857.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R2OomJ1ud8x1JfD/EgMKQOtn0GBgI7M1gxYnmAtJZp3eDOWcyQFsWEUzkRdtlFqHTn0TRtih3ykpmsHqFCwaWPEdNZmMyjZ+Yg6xVlTInwIOYoeZRESxqaZfLT8ABZ6mXDJRn/sY/erzVAey6Ild7z/61Mv26EMMB5P/OMshd5LdkPffT3VatpPy1Jy8oGeEwONKBZcSWOJphRIJ6dbUfGURCv9lyKcdvc/yv+vtUkxqvZ2FnV9yI/LCqmzc+mxJ4v6ai/37A/817MuYIc2F2yGFMTCvMEIzMlnm1IUvLxRoF5c6959/P1znVF2JluAYdUMzje3neALwIZ/09SjRnYZV962LOAnVyO0L/oz4frXFpb4V4QZ0Ll99YcT8llYN81FKll+puYvE7bMOaSGPK2bFWSlqx7rpL9zbb++A4yum8nYtetvhmUQkITXS1kO5BDWc8Yp8M+Ng9h1OIGl6rRTlLIIna2XdUTiApIm73g+lH2yxtTNkO6kyKKw2VqETUP9WzHNAeN+hWQ5TLSjoPpkafQtsNHj7s7aWXUeQejfHmOdKedmWI+ToBmfR+Qgq8y9zxjH60rNJaHA7IWU+ZlpvFJoWTMeS+XQG5ZD3iskVTXsDB2M/re+eNnUOz5FzQFZR9gSO2d4wx7Ir+LfguoSAo3+A9f5ItgW3Po8O/PYZNH1iwIbAhZQ5PSRHfpaBd5WYdZMv/yV1AJd43z0h8AVY3NFj0lptredcBb67l6s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1358.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66556008)(2616005)(186003)(86362001)(83380400001)(1076003)(38100700002)(66946007)(316002)(66476007)(7416002)(107886003)(8936002)(2906002)(4326008)(6506007)(38350700002)(5660300002)(508600001)(36756003)(52116002)(8676002)(26005)(6486002)(921005)(6512007)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ibstF8u78mMOLkjC+DkMbtk6BeGVIf2sN4/j11j5t9C07J8ntkXQNdwmng22?=
 =?us-ascii?Q?9DnBAV5IWnDMfoqQkSSEC8uHaK/9kJjR0tpGrP8aViDjMsAbrmPOMTc59anO?=
 =?us-ascii?Q?O1jS0NBNpwilMQZIUJCdJyWzT5htH/81jkty/zBVwDMz1V3GrIayD3QWCiO+?=
 =?us-ascii?Q?X9gFBhdeFi2UbH5GGfm3YJsLaw5BdePN9XhVOqZXo+hvQkq2WY0Zll3JHXqR?=
 =?us-ascii?Q?LCWWk3Sr/XMZMMoYEd+nprSvmVuMfr1R6BIxinMvkMcgpFcSq1/FiEfkMMU0?=
 =?us-ascii?Q?37EmsZbG3gdG2DS3rqJ2RmTBi2zRJFWsCCw/TyDBu1wdNyswPRen6A6jbUsU?=
 =?us-ascii?Q?7WDXIyDGL4XHDB1lhzmc/dcJfC5zhQShHRNrEGd6v1xtpeAB3qtAHBA7/Yug?=
 =?us-ascii?Q?EHBYvRc1tps18LV6TopqTtVI6juRv1TvXTA2mmwHPUrAtVi3nyVpL5GLcb0u?=
 =?us-ascii?Q?FoqJzHZvJAW/REZAxx/eYTqE/jQI7oi7L5GMSp7Ij3GoSw5dNSTWPg0bzRCJ?=
 =?us-ascii?Q?6s6QRGQeBgrwTYnMT+7UEFuR1vW9LY9bIjLCfdD5fj/Zjc2T/dJ7qCBJX/dT?=
 =?us-ascii?Q?D5oyULXCjLjFLkB2cYCj3G0mbINKet13c5ma9g7c4b5lSGOZ/mE4SX4FxiWP?=
 =?us-ascii?Q?MxMc86P35lVanGri/LDnPgcfgxOIbDEmRpaRMlnFpldxnybIXbkrqpFelOt8?=
 =?us-ascii?Q?c8sqzvxmZrCWw2MIg429izz2Bv1mEfIxQGSrpxwHLd+dR0P14dFs+k/R0EiR?=
 =?us-ascii?Q?XSrD0wbYewpQYwwvtwQf2RcQp/0so3cMl3ye/PDUVG1qYqYWJ5lSuJHt6ldg?=
 =?us-ascii?Q?HsnGvgV6fv+5yt8LVTTn86IAZlBywbbtY3ZSQowdEJyjuU5fNWEoErmTYCTM?=
 =?us-ascii?Q?AS4ZJhUFfIJ7BbuL5Duj3Mq6TUz3knsWd8qcH7HhAoRq8XWT1NWT/aTHwE5M?=
 =?us-ascii?Q?xEWK1aNeC9wAhplvRJsgTQc/pDE31oGPw0XEC44J7njhreTU4+K0HYdny9P7?=
 =?us-ascii?Q?xylx2haCRAIWkVOKM0alzjKhevlBTwOBhtxIye9DDgZqog6QWv+rm+w9BX79?=
 =?us-ascii?Q?e3baZJgF0C2qAL7PYrF3n0gNO3IMaNlGqAwGFLY2nOdiki21KZ96EoDoXQt3?=
 =?us-ascii?Q?eAlJuUUVbackzHrKtXeHr05r1iaF1hq6j2vKCg31Hd4rVH4WTPnRJ7WqxkBS?=
 =?us-ascii?Q?YWb+VeqUrr7kVGMGpFqah9EKx39RBKifffkuqPzNpe+9q7Xq0hR3HkX4U+Lm?=
 =?us-ascii?Q?JpI+y98o+6BQm1n+l6iZ/RtTGDlfaCSviEAmMvsrXtqbEBBBLtvF5gIHCvtA?=
 =?us-ascii?Q?Jl2ESLO2JfZcR681l7poou7w4xN/YAqMkobb9zL+vt59CBp8t1PLpRnXLN3E?=
 =?us-ascii?Q?ZqPkGuEcnqF0STt6DvO03XNKE4wPPM74/LgVy7dZWtc0N6yJoHgpzDEtz6A9?=
 =?us-ascii?Q?WaOzSsmxAFDdwhFQJ2wCHjmJcuza2h1E0W8fmulWWUAuGfMl9oL3uH56N4S+?=
 =?us-ascii?Q?9Hlq2rxsWvvbdRzg50ejLz4cyhhrxP5zQLr4QrjqvrgUaMVVkacisxAYrwCv?=
 =?us-ascii?Q?sYn5yEdrZqjIcXSO0jEyVTnWIraqy3q67sSlah6U1Wq/msR7ATZ+wWzm5Ui1?=
 =?us-ascii?Q?sfe0FD1BTU4bmsNV1hwqWC0rzYaAmnxPoIpS6z+8SJYQy3yzWR8Vb27DfN8E?=
 =?us-ascii?Q?qdrO6Dqf5iS4C1Jj20p96av7PKf/+qYdsyxZ5pPqhkf07UQnObvpriXv3KF3?=
 =?us-ascii?Q?QGlZtV2vwA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d60d8851-3b6b-4b3d-a9a4-08da213e89e7
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2022 13:22:51.2789 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5AM5bRFD8rqvRXLZ7tVS2yBZbLqXJMSQywW/01BsmIw3f7qLzsRtbDgsYtppCpm+bTtovIYSWNYU7gazJIHSVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2857
X-Proofpoint-ORIG-GUID: A3MrDu8cp4c8-4S824gXgQ6jMmsr-U6w
X-Proofpoint-GUID: A3MrDu8cp4c8-4S824gXgQ6jMmsr-U6w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-18_02,2022-04-15_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 mlxlogscore=795 mlxscore=0
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
 arch/arm64/kernel/perf_callchain.c | 4 ++--
 arch/arm64/kernel/process.c        | 6 +++---
 arch/arm64/kernel/return_address.c | 4 ++--
 arch/arm64/kernel/time.c           | 6 +++---
 4 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/kernel/perf_callchain.c b/arch/arm64/kernel/perf_callchain.c
index 65b196e3ca6c..d32918b34c0c 100644
--- a/arch/arm64/kernel/perf_callchain.c
+++ b/arch/arm64/kernel/perf_callchain.c
@@ -132,10 +132,10 @@ void perf_callchain_user(struct perf_callchain_entry_ctx *entry,
 	}
 }
 
-static bool callchain_trace(void *data, unsigned long pc)
+static bool callchain_trace(void *data, struct frame_info *fi)
 {
 	struct perf_callchain_entry_ctx *entry = data;
-	return perf_callchain_store(entry, pc) == 0;
+	return perf_callchain_store(entry, fi->pc) == 0;
 }
 
 void perf_callchain_kernel(struct perf_callchain_entry_ctx *entry,
diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
index 7fa97df55e3a..e96a8a614a1a 100644
--- a/arch/arm64/kernel/process.c
+++ b/arch/arm64/kernel/process.c
@@ -527,12 +527,12 @@ struct wchan_info {
 	int		count;
 };
 
-static bool get_wchan_cb(void *arg, unsigned long pc)
+static bool get_wchan_cb(void *arg, struct frame_info *fi)
 {
 	struct wchan_info *wchan_info = arg;
 
-	if (!in_sched_functions(pc)) {
-		wchan_info->pc = pc;
+	if (!in_sched_functions(fi->pc)) {
+		wchan_info->pc = fi->pc;
 		return false;
 	}
 	return wchan_info->count++ < 16;
diff --git a/arch/arm64/kernel/return_address.c b/arch/arm64/kernel/return_address.c
index 68330017d04f..ec9be91623c4 100644
--- a/arch/arm64/kernel/return_address.c
+++ b/arch/arm64/kernel/return_address.c
@@ -18,12 +18,12 @@ struct return_address_data {
 	void *addr;
 };
 
-static bool save_return_addr(void *d, unsigned long pc)
+static bool save_return_addr(void *d, struct frame_info *fi)
 {
 	struct return_address_data *data = d;
 
 	if (!data->level) {
-		data->addr = (void *)pc;
+		data->addr = (void *)fi->pc;
 		return false;
 	} else {
 		--data->level;
diff --git a/arch/arm64/kernel/time.c b/arch/arm64/kernel/time.c
index b5855eb7435d..6b1a9de7c852 100644
--- a/arch/arm64/kernel/time.c
+++ b/arch/arm64/kernel/time.c
@@ -32,13 +32,13 @@
 #include <asm/thread_info.h>
 #include <asm/paravirt.h>
 
-static bool profile_pc_cb(void *arg, unsigned long pc)
+static bool profile_pc_cb(void *arg, struct frame_info *fi)
 {
 	unsigned long *prof_pc = arg;
 
-	if (in_lock_functions(pc))
+	if (in_lock_functions(fi->pc))
 		return true;
-	*prof_pc = pc;
+	*prof_pc = fi->pc;
 	return false;
 }
 
-- 
2.25.1

