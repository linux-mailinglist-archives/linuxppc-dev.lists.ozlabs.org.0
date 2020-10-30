Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E704C29FA88
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Oct 2020 02:24:50 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CMl3M3vz3zDqbl
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Oct 2020 12:24:47 +1100 (AEDT)
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
 header.s=pp1 header.b=P42Z7q1q; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CMkvn4hjjzDqk9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Oct 2020 12:18:12 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09U11oTW133703
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Oct 2020 21:18:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=HCvoRpLSY+9Ut+yT7ru/sQSoCClAGeaHw4pe/v2gJ30=;
 b=P42Z7q1qNGWKhYDBqqhGGfvNo3YmdiHS61NyJaK2461iVp6xC9GV6aOAgLRGF3uyqgIx
 yXK5jOdhbT/vKmyF9VY8pcOclpJRdNG6K93Y3AgQzRpflklPwf67YKWb45ruzxjMdg9t
 HJtnraENZUq7E9vUWkbqohhYh/3vrZIRwBXKh+hm3DtSB+0LMow286EfA2HPv55Rn1Gz
 /P4PnHaZ1ygrhbnmu5rvtZanVulyc5HtLh81OCHzx1wC47SRmbJV5rGUKlp+DWuGtP/W
 IgyIpQB0viwwCM7eXIBPdVSvOd2phHGIpp7RuqrLpEO4t7vk8oLM/gM5nw6oMl8AYG+z Fg== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34g6syb78k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Oct 2020 21:18:10 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09U1HV86000379
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Oct 2020 01:18:09 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma04dal.us.ibm.com with ESMTP id 34g1e1v86v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Oct 2020 01:18:09 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 09U1I8VW52363584
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 30 Oct 2020 01:18:08 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BEA9528059;
 Fri, 30 Oct 2020 01:18:08 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8FD3628058;
 Fri, 30 Oct 2020 01:18:08 +0000 (GMT)
Received: from localhost (unknown [9.65.225.148])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 30 Oct 2020 01:18:08 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 03/29] powerpc/rtas: complete ibm,suspend-me status codes
Date: Thu, 29 Oct 2020 20:17:39 -0500
Message-Id: <20201030011805.1224603-4-nathanl@linux.ibm.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20201030011805.1224603-1-nathanl@linux.ibm.com>
References: <20201030011805.1224603-1-nathanl@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-10-29_12:2020-10-29,
 2020-10-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 bulkscore=0 mlxlogscore=589 clxscore=1015 malwarescore=0 suspectscore=1
 impostorscore=0 mlxscore=0 spamscore=0 adultscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010300001
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

We don't completely account for the possible return codes for
ibm,suspend-me. Add definitions for these.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/include/asm/rtas.h | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/rtas.h b/arch/powerpc/include/asm/rtas.h
index 55f9a154c95d..f060181a0d32 100644
--- a/arch/powerpc/include/asm/rtas.h
+++ b/arch/powerpc/include/asm/rtas.h
@@ -23,11 +23,16 @@
 #define RTAS_RMOBUF_MAX (64 * 1024)
 
 /* RTAS return status codes */
-#define RTAS_NOT_SUSPENDABLE	-9004
 #define RTAS_BUSY		-2    /* RTAS Busy */
 #define RTAS_EXTENDED_DELAY_MIN	9900
 #define RTAS_EXTENDED_DELAY_MAX	9905
 
+/* statuses specific to ibm,suspend-me */
+#define RTAS_SUSPEND_ABORTED     9000 /* Suspension aborted */
+#define RTAS_NOT_SUSPENDABLE    -9004 /* Partition not suspendable */
+#define RTAS_THREADS_ACTIVE     -9005 /* Multiple processor threads active */
+#define RTAS_OUTSTANDING_COPROC -9006 /* Outstanding coprocessor operations */
+
 /*
  * In general to call RTAS use rtas_token("string") to lookup
  * an RTAS token for the given string (e.g. "event-scan").
-- 
2.25.4

