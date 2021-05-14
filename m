Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D72E0380E1B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 May 2021 18:25:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FhYm55zM3z3btr
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 May 2021 02:25:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=A8r/JWDq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=A8r/JWDq; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FhYl60C2Xz308h
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 May 2021 02:24:33 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14EG5Ves160386; Fri, 14 May 2021 12:24:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=bYr6QF3voySYOmTdo7spaCnuNbBou+TZ5GERpGuCFqs=;
 b=A8r/JWDqxkdKOCiYFbYth71ZjL9y24dWvttRUBb85xILrcFXAww4y/MctbdybSoPXMFr
 +kkHs5w5iyhLpEUcXp858vE6ukgMtj6FncPGuz5TA9wAWVG7THeaWbh4iJg/5ZAwza6p
 zXYbSRTtbHwnmAHg3GA0z4Kxv8aQbpTsnj//izCroGKhnJcb3Ksbh2IxEy9VG2CSaAze
 XCx3/9NE+B1RI5lScbhgSpYxjCsXhaCXycNMJrulSeFlmy6az0s9r+0tb27lGfYmad5e
 jAE7qT1yKzMyFWE+Dc7ul/pQEsVjRD8FkeBbMxmbKPjByiz0sPsbVCwtit5gmrGGL1rs +Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38hvak0kfy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 May 2021 12:24:22 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 14EG626C165832;
 Fri, 14 May 2021 12:24:22 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38hvak0kfr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 May 2021 12:24:22 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 14EGNC53013159;
 Fri, 14 May 2021 16:24:21 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma03dal.us.ibm.com with ESMTP id 38hc766qpv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 May 2021 16:24:21 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14EGOKGI16187848
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 14 May 2021 16:24:20 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 937566A04F;
 Fri, 14 May 2021 16:24:20 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 791706A047;
 Fri, 14 May 2021 16:24:20 +0000 (GMT)
Received: from localhost (unknown [9.211.51.49])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 14 May 2021 16:24:20 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/xmon: make dumping log buffer contents more reliable
Date: Fri, 14 May 2021 11:24:20 -0500
Message-Id: <20210514162420.2911458-1-nathanl@linux.ibm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: nviCESeGlj_27nUoxkTuP6zQpoLjunmN
X-Proofpoint-ORIG-GUID: B6DPpIPNJL7fMjdP3VePrTKu3b1zXVEy
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-14_07:2021-05-12,
 2021-05-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0
 suspectscore=0 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 mlxlogscore=889 bulkscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105140127
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
Cc: paulus@samba.org, jniethe5@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Log buffer entries that are too long for dump_log_buf()'s small
local buffer are:

* silently discarded when a single-line entry is too long;
  kmsg_dump_get_line() returns true but sets &len to 0.
* silently truncated to the last fitting new line when a multi-line
  entry is too long, e.g. register dumps from __show_regs(); this
  seems undetectable via the kmsg_dump API.

xmon_printf()'s internal buffer is already 1KB; enlarge
dump_log_buf()'s own buffer to match and make it statically
allocated. Verified that this allows complete printing of register
dumps on ppc64le with both CONFIG_PRINTK_TIME=y and
CONFIG_PRINTK_CALLER=y.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/xmon/xmon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index c8173e92f19d..f73c10869e64 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -2975,7 +2975,7 @@ static void
 dump_log_buf(void)
 {
 	struct kmsg_dump_iter iter;
-	unsigned char buf[128];
+	static unsigned char buf[1024];
 	size_t len;
 
 	if (setjmp(bus_error_jmp) != 0) {
-- 
2.30.2

