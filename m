Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D432541162C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Sep 2021 15:57:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HCmMd4mwvz3c5h
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Sep 2021 23:57:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=m0bypu0t;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=m0bypu0t; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HCmKH0PdLz2yN4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Sep 2021 23:55:14 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18KDD4Lr011828; 
 Mon, 20 Sep 2021 09:55:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=P9KsvdI6M6kCK21HPQzDwSKW3TJaM4UKnDYfVv8p1Mg=;
 b=m0bypu0tiFboQxWhIlH3u6+46nha10XWFKWq7r/dNPErqOVXPemhdazIs+znFPp8tSKg
 KH827tMq1GFzYB1LHHJzLk5c2PomxRbZMkdFODZXLIZwHYcg1C9Ths+6ISZhQ+VaTOAe
 MAQD1wiTfaoD2+Ue3wl/pX6tgWTTNHusximf3R6mZ6yBBWYG2fSjzb1caau++D4Wg7Jw
 FZ1smnbwbVPbOQIs0ftEtmuavK7DvvYJzHSAEZpd0QwQe99nDptvp+vt53iLNcwBU1od
 toIFNU2g/dZI0xn68x7nAKXwOMCXKRatZOfaf2SejfRs3RlFybX0A7cE/zvTu3R2vpIL HA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3b5w3fuhhu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Sep 2021 09:55:09 -0400
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 18KDUAsN005492;
 Mon, 20 Sep 2021 09:55:09 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3b5w3fuhhh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Sep 2021 09:55:09 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 18KDq6K4023167;
 Mon, 20 Sep 2021 13:55:08 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma02dal.us.ibm.com with ESMTP id 3b57r9ydvc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Sep 2021 13:55:08 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 18KDt7JG18940302
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 20 Sep 2021 13:55:07 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 173D76E04E;
 Mon, 20 Sep 2021 13:55:07 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EDFE26E05E;
 Mon, 20 Sep 2021 13:55:06 +0000 (GMT)
Received: from localhost (unknown [9.211.63.177])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 20 Sep 2021 13:55:06 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/3] powerpc/cpuhp: BUG -> WARN conversion in offline path
Date: Mon, 20 Sep 2021 08:55:03 -0500
Message-Id: <20210920135504.1792219-3-nathanl@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210920135504.1792219-1-nathanl@linux.ibm.com>
References: <20210920135504.1792219-1-nathanl@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: YdtkvLUx_LxCipDaKXVccn-wWiVoIDNK
X-Proofpoint-GUID: yww6PrIahiJvezoiOxzxBci-HlEWuZwD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-20_07,2021-09-20_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0
 mlxscore=0 bulkscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1011 adultscore=0 malwarescore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109200086
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

