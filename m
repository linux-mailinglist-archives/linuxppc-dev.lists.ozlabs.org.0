Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C032606F68
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Oct 2022 07:27:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MttJ40HDlz3dwM
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Oct 2022 16:27:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=P97+UCxH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=P97+UCxH;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MttF41SrZz3c5v
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Oct 2022 16:24:24 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29L57FtV026989;
	Fri, 21 Oct 2022 05:24:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=H3Ff8+4vOgEaHot+i+nLa1kVslHhbZbgIbJsxtA5Z2Q=;
 b=P97+UCxH/t0RInpXsHh9qSHB4z6dMPp6slneFuWYuHm03qOAJlWEozK/wy2WrSKK6eKm
 4WcUOVfSlZZ2zNqNpdzpDzqjoCrN51tACSDDgac13VxyXcHIxs5i7BcsaVCQrDn4NoBA
 oFMzTOwv6t3okoHp6WNyEQPuG6etA7L7i6g9QrHh90VNcPE+BFDi9ECjiu7yEJtSXWCz
 AdVuxmZ42F6xlNNpVNtc9Rk02HP8ULnqMyLSlBBrl/j6fx6GjDY63rYD+AKBOc/JXxnT
 Zb6+YSJlbz4vT7wHBijdPKTKAE38rPgSdWcBHLfOBUkYZsvlW94GvSr/ihIWGYmXSHHE fg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kbma5sn60-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Oct 2022 05:24:13 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29L57Joi027824;
	Fri, 21 Oct 2022 05:24:12 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com [159.122.73.72])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kbma5sn5e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Oct 2022 05:24:12 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
	by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29L5M2GI010258;
	Fri, 21 Oct 2022 05:24:10 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
	by ppma06fra.de.ibm.com with ESMTP id 3k7m4jfhmx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Oct 2022 05:24:10 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
	by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 29L5Of8p52363754
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 21 Oct 2022 05:24:41 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E8A91A404D;
	Fri, 21 Oct 2022 05:24:07 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 926AEA4040;
	Fri, 21 Oct 2022 05:24:07 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Fri, 21 Oct 2022 05:24:07 +0000 (GMT)
Received: from li-0d7fa1cc-2c9d-11b2-a85c-aed20764436d.ibm.com (unknown [9.177.89.220])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id E316E60153;
	Fri, 21 Oct 2022 16:24:01 +1100 (AEDT)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v8 2/6] powerpc/code-patching: Use WARN_ON and fix check in poking_init
Date: Fri, 21 Oct 2022 16:22:34 +1100
Message-Id: <20221021052238.580986-3-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221021052238.580986-1-bgray@linux.ibm.com>
References: <20221021052238.580986-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Dt2KvXRtKJ9e2NziI_zjz4oF4gNib6Hj
X-Proofpoint-ORIG-GUID: VjYu-hCS7AARbx4qi3DiCE_K2PTOBVA-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-20_13,2022-10-20_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015 adultscore=0
 impostorscore=0 phishscore=0 priorityscore=1501 mlxscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210210029
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
Cc: ajd@linux.ibm.com, jniethe5@gmail.com, Benjamin Gray <bgray@linux.ibm.com>, npiggin@gmail.com, cmr@bluescreens.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: "Christopher M. Riedl" <cmr@bluescreens.de>

The latest kernel docs list BUG_ON() as 'deprecated' and that they
should be replaced with WARN_ON() (or pr_warn()) when possible. The
BUG_ON() in poking_init() warrants a WARN_ON() rather than a pr_warn()
since the error condition is deemed "unreachable".

Also take this opportunity to fix the failure check in the WARN_ON():
cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, ...) returns a positive integer
on success and a negative integer on failure.

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
---
 arch/powerpc/lib/code-patching.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
index ad0cf3108dd0..34fc7ac34d91 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/code-patching.c
@@ -81,16 +81,13 @@ static int text_area_cpu_down(unsigned int cpu)
 
 static __ro_after_init DEFINE_STATIC_KEY_FALSE(poking_init_done);
 
-/*
- * Although BUG_ON() is rude, in this case it should only happen if ENOMEM, and
- * we judge it as being preferable to a kernel that will crash later when
- * someone tries to use patch_instruction().
- */
 void __init poking_init(void)
 {
-	BUG_ON(!cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
-		"powerpc/text_poke:online", text_area_cpu_up,
-		text_area_cpu_down));
+	WARN_ON(cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
+				  "powerpc/text_poke:online",
+				  text_area_cpu_up,
+				  text_area_cpu_down) < 0);
+
 	static_branch_enable(&poking_init_done);
 }
 
-- 
2.37.3

