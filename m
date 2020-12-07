Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF1D2D1C63
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Dec 2020 22:54:20 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CqcXT22mJzDqWp
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Dec 2020 08:54:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=sSJotFc+; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CqcTz4cqQzDqVN
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Dec 2020 08:52:07 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B7LSML9191179
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 7 Dec 2020 16:52:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=sROf+MH4KM4VPNFfJOuFuWrrU1oEaD1t2oRHfGW7cH8=;
 b=sSJotFc+8YQeM78dNpd6Ak/EdL3WPjGA/FSf3iCmbpTmLrn2CNg5na+1mP/HNtWIl0dW
 UWmE5xhQG+AigJJekGIdpY+wyqUUSL1AcDJCYswhirivbAQ+4ist5uoBKTM+F+QEJe6V
 BTbT+cggVErpvJacJ90teduavLmmamjtGn0QFRuQFyz8i1jqtpwnEUkejjQnug7DpPy6
 S0UZ37RBdBO/TivPWREYnRyOb/oI3Nin9YoOW1mlCd82o6gPm6ppJriBd02iSsCiFD3n
 xlU1t/mkShRTn6h+6j+QQ/avRt5kAbccg4RJTzicuUYE38t2ZARyBs60n1L1AF2g5JD2 XA== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 359s42pd7y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Dec 2020 16:52:04 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B7LlxZ2031517
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 7 Dec 2020 21:52:03 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma02dal.us.ibm.com with ESMTP id 3581u9fq3p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Dec 2020 21:52:03 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B7Lq2fR26083716
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 7 Dec 2020 21:52:02 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4E917AC05B;
 Mon,  7 Dec 2020 21:52:02 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1EC30AC059;
 Mon,  7 Dec 2020 21:52:02 +0000 (GMT)
Received: from localhost (unknown [9.160.57.67])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon,  7 Dec 2020 21:52:01 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 01/28] powerpc/rtas: prevent suspend-related sys_rtas use
 on LE
Date: Mon,  7 Dec 2020 15:51:33 -0600
Message-Id: <20201207215200.1785968-2-nathanl@linux.ibm.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201207215200.1785968-1-nathanl@linux.ibm.com>
References: <20201207215200.1785968-1-nathanl@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-07_16:2020-12-04,
 2020-12-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0
 impostorscore=0 mlxlogscore=999 lowpriorityscore=0 phishscore=0
 priorityscore=1501 adultscore=0 mlxscore=0 bulkscore=0 suspectscore=1
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012070132
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
Cc: tyreld@linux.ibm.com, ajd@linux.ibm.com, mmc@linux.vnet.ibm.com,
 cforno12@linux.vnet.ibm.com, drt@linux.vnet.ibm.com, brking@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

While drmgr has had work in some areas to make its RTAS syscall
interactions endian-neutral, its code for performing partition
migration via the syscall has never worked on LE. While it is able to
complete ibm,suspend-me successfully, it crashes when attempting the
subsequent ibm,update-nodes call.

drmgr is the only known (or plausible) user of ibm,suspend-me,
ibm,update-nodes, and ibm,update-properties, so allow them only in
big-endian configurations.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/kernel/rtas.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index 954f41676f69..4ed64aba37d6 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -1050,9 +1050,11 @@ static struct rtas_filter rtas_filters[] __ro_after_init = {
 	{ "set-time-for-power-on", -1, -1, -1, -1, -1 },
 	{ "ibm,set-system-parameter", -1, 1, -1, -1, -1 },
 	{ "set-time-of-day", -1, -1, -1, -1, -1 },
+#ifdef CONFIG_CPU_BIG_ENDIAN
 	{ "ibm,suspend-me", -1, -1, -1, -1, -1 },
 	{ "ibm,update-nodes", -1, 0, -1, -1, -1, 4096 },
 	{ "ibm,update-properties", -1, 0, -1, -1, -1, 4096 },
+#endif
 	{ "ibm,physical-attestation", -1, 0, 1, -1, -1 },
 };
 
-- 
2.28.0

