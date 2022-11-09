Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40DDB62233D
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Nov 2022 05:53:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N6Xfh0QZZz3chb
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Nov 2022 15:53:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KMYxfPCR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KMYxfPCR;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N6Xch3ldTz3byZ
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Nov 2022 15:51:47 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2A94E19a004787;
	Wed, 9 Nov 2022 04:51:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=9Wq5dNpVJhwS+HNpgaT6lHxe/m2alTwvNttDGXLJZO8=;
 b=KMYxfPCRN3hEwUK0Pp5Ol1Kyqug9Tdr3QfzSEO2X25sYwByfKETbLjODJPOzSspa/Wvi
 EQbKsnw5sU9G+kdsJa4Y/Z4XWVqQZnzCAlrBtYHBwETk39WRTwZKB9aTH/BohKyYUFXZ
 t6WoOyRD04VuGfkyG2dO3mj2tIHaDdtYs5yc/czvgkcueOv15NvajMW6uOaGIZlbJGaI
 OHm5fZctPHsu0Nyl6hdsQcXneRUHVpisbVOvNOjz8wQjL0hZP6Ma8gzMZZzYt2QRw7Dz
 dfEAeJ0H6V7K5FE5FG2NxL5AN9COgzRPFQVVN4OlDDcqc8jf3w07+CZ5TUzCF6FbACI+ Hg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3kr50csk0b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Nov 2022 04:51:35 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2A94Fvem011132;
	Wed, 9 Nov 2022 04:51:35 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3kr50csjyb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Nov 2022 04:51:35 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2A94o7F3001005;
	Wed, 9 Nov 2022 04:51:33 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
	by ppma03ams.nl.ibm.com with ESMTP id 3kngqgd332-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Nov 2022 04:51:33 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com [9.149.105.58])
	by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2A94jk0J50004252
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 9 Nov 2022 04:45:46 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0B3FD4C044;
	Wed,  9 Nov 2022 04:51:31 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A9EC44C040;
	Wed,  9 Nov 2022 04:51:30 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Wed,  9 Nov 2022 04:51:30 +0000 (GMT)
Received: from li-0d7fa1cc-2c9d-11b2-a85c-aed20764436d.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id C8993602FC;
	Wed,  9 Nov 2022 15:51:28 +1100 (AEDT)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v10 2/9] powerpc/code-patching: Use WARN_ON and fix check in poking_init
Date: Wed,  9 Nov 2022 15:51:05 +1100
Message-Id: <20221109045112.187069-3-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221109045112.187069-1-bgray@linux.ibm.com>
References: <20221109045112.187069-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: YgfbHTA8fbJv1TMU2XChynadPwDG9GmK
X-Proofpoint-ORIG-GUID: sOQqZMFy9ZKBLPlrgCLWfaEL79iQ3g9U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-09_01,2022-11-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 impostorscore=0 phishscore=0
 mlxlogscore=999 mlxscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2211090032
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

BUG_ON() when failing to initialise the code patching window is
unnecessary, and use of BUG_ON is discouraged. We don't set
poking_init_done in this case, so failure to init the boot CPU will
result in a strict RWX error when a following patch_instruction uses
raw_patch_instruction. If it only fails for later CPUs, they won't be
onlined in the first place.

The return value of cpuhp_setup_state() is also >= 0 on success,
so check for < 0.

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
---
v10:	* Don't mention caller recovery
	* Don't set poking_init_done on failure
	* Add setup return code comment from later patch
	* Reviewed-by not applied because of above changes
v9:	* Reword commit message to explain why init failure is not fatal
---
 arch/powerpc/lib/code-patching.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
index ad0cf3108dd0..3055eef7dcdc 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/code-patching.c
@@ -81,16 +81,17 @@ static int text_area_cpu_down(unsigned int cpu)
 
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
+	int ret = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
+				    "powerpc/text_poke:online",
+				    text_area_cpu_up,
+				    text_area_cpu_down);
+
+	/* cpuhp_setup_state returns >= 0 on success */
+	if (WARN_ON(ret < 0))
+		return;
+
 	static_branch_enable(&poking_init_done);
 }
 
-- 
2.38.1

