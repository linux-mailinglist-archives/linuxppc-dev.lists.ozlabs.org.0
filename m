Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D05D941A00F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Sep 2021 22:23:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HJDbb5Tl1z3bnq
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Sep 2021 06:23:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=K4VQj+z3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=K4VQj+z3; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HJDWl30csz2yLm
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Sep 2021 06:19:46 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18RIojZG026801; 
 Mon, 27 Sep 2021 16:19:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=hbeA20nIDugP74s5Js7fYS7YbgB4kmXI+0qplx/QsUs=;
 b=K4VQj+z3G5UOztMCE6GdlvsHknIuOFp+hxcfHaQD++H/soxpKOuMpdxjoZZjnus0THcZ
 A1SPCOY3JJxjEw0hog+x0We01bvjgIvT1taTmTbXmQOX63l15+1a0keShmEf8fW4b961
 QoIPsvWYGGfW7cj+J5kOIJWbDHLq304Xt6WjAylA0H7dzfkTUHj7F97Tkv6a/ejOn56I
 zaD4VFfWBlFG4IOnKIJisGX57kj3B/FOCHInHUTecq0iWKFXoHIRREc5x8BGWLX6fdwc
 hizypTosdnPyuzlBuQY29PwJdRDhODe3taqL8HxQe3VhckOVx8QlhV5iJ9CsPyQ9s4dY Ew== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bagx55gbf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Sep 2021 16:19:41 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 18RKJbNn015122;
 Mon, 27 Sep 2021 16:19:40 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bagx55gb6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Sep 2021 16:19:40 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 18RKHkc4026831;
 Mon, 27 Sep 2021 20:19:40 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma03dal.us.ibm.com with ESMTP id 3b9udaevcr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Sep 2021 20:19:40 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 18RKJcfX30409042
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Sep 2021 20:19:38 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6C207BE05D;
 Mon, 27 Sep 2021 20:19:38 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5752CBE059;
 Mon, 27 Sep 2021 20:19:38 +0000 (GMT)
Received: from localhost (unknown [9.211.96.63])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 27 Sep 2021 20:19:38 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 2/4] powerpc/cpuhp: BUG -> WARN conversion in offline path
Date: Mon, 27 Sep 2021 15:19:31 -0500
Message-Id: <20210927201933.76786-3-nathanl@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210927201933.76786-1-nathanl@linux.ibm.com>
References: <20210927201933.76786-1-nathanl@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: pbY_4XodWYcU5UuIsIRe6y0rZWXhVkNN
X-Proofpoint-ORIG-GUID: KAJSxIeGh8p5al9RSDkNdi7ylrAtSE00
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-27_07,2021-09-24_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 spamscore=0
 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 bulkscore=0 clxscore=1015 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2109270135
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
Cc: tyreld@linux.ibm.com, ldufour@linux.ibm.com, aneesh.kumar@linux.ibm.com,
 danielhb413@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

If, due to bugs elsewhere, we get into unregister_cpu_online() with a CPU
that isn't marked hotpluggable, we can emit a warning and return an
appropriate error instead of crashing.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 arch/powerpc/kernel/sysfs.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/sysfs.c b/arch/powerpc/kernel/sysfs.c
index defecb3b1b15..08d8072d6e7a 100644
--- a/arch/powerpc/kernel/sysfs.c
+++ b/arch/powerpc/kernel/sysfs.c
@@ -928,7 +928,8 @@ static int unregister_cpu_online(unsigned int cpu)
 	struct device_attribute *attrs, *pmc_attrs;
 	int i, nattrs;
 
-	BUG_ON(!c->hotpluggable);
+	if (WARN_RATELIMIT(!c->hotpluggable, "cpu %d can't be offlined\n", cpu))
+		return -EBUSY;
 
 #ifdef CONFIG_PPC64
 	if (cpu_has_feature(CPU_FTR_SMT))
-- 
2.31.1

