Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A3F02FD825
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jan 2021 19:20:59 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DLYjz014TzDqM3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Jan 2021 05:20:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=farosas@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=TBL+qljY; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DLYgl374GzDqGg
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Jan 2021 05:18:59 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10KID5jh138865; Wed, 20 Jan 2021 13:18:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=xm2qHCGKB6oGgObMlO2WWKExHfccVXPVsFOAxu08Noo=;
 b=TBL+qljYdV36Jy2yXOL0MELTU4SzhbD+vhWeJA84Dv0QdrRwK5owDawzlBI2c3pULT0X
 dkWljVzrHLEl2lVzgTjSgafkkIDAr+cayxrcI7+UZ8ce9R5y0qz7OY8oN0ChF4bj9/6C
 HgNAb6pmOT4LJUf3VWpi5SgMyBGxBwo40w/Hka9Ebf8GxShObGEfW8uNFC6cmC49TgLj
 hEyYwxSrDMPjAqQWv7wesMrCHJseBSs5JlrKZpz32f30qv3Rl7WYF6PjQZN2Z7bEQ0n6
 RrKVFZj/KJPgTzo3sIWKMwYdMUkuAiYpT9CmzzMdezX7V8//LJ6CpjkD6awXnE+E0n4D 5w== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 366sknr482-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Jan 2021 13:18:53 -0500
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10KI84s4023604;
 Wed, 20 Jan 2021 18:18:52 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma01wdc.us.ibm.com with ESMTP id 3668s766pd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Jan 2021 18:18:52 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10KIIpVJ13697412
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 Jan 2021 18:18:51 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 62F72BE05B;
 Wed, 20 Jan 2021 18:18:51 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 99689BE058;
 Wed, 20 Jan 2021 18:18:50 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.163.16.99])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 20 Jan 2021 18:18:50 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc: Fix debug print in smp_setup_cpu_maps
Date: Wed, 20 Jan 2021 15:18:47 -0300
Message-Id: <20210120181847.952106-1-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-20_10:2021-01-20,
 2021-01-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 mlxscore=0
 phishscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101200102
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When figuring out the number of threads, the debug message prints "1
thread" for the first iteration of the loop, instead of the actual
number of threads calculated from the length of the
"ibm,ppc-interrupt-server#s" property.

  * /cpus/PowerPC,POWER8@20...
    ibm,ppc-interrupt-server#s -> 1 threads <--- WRONG
    thread 0 -> cpu 0 (hard id 32)
    thread 1 -> cpu 1 (hard id 33)
    thread 2 -> cpu 2 (hard id 34)
    thread 3 -> cpu 3 (hard id 35)
    thread 4 -> cpu 4 (hard id 36)
    thread 5 -> cpu 5 (hard id 37)
    thread 6 -> cpu 6 (hard id 38)
    thread 7 -> cpu 7 (hard id 39)
  * /cpus/PowerPC,POWER8@28...
    ibm,ppc-interrupt-server#s -> 8 threads
    thread 0 -> cpu 8 (hard id 40)
    thread 1 -> cpu 9 (hard id 41)
    thread 2 -> cpu 10 (hard id 42)
    thread 3 -> cpu 11 (hard id 43)
    thread 4 -> cpu 12 (hard id 44)
    thread 5 -> cpu 13 (hard id 45)
    thread 6 -> cpu 14 (hard id 46)
    thread 7 -> cpu 15 (hard id 47)
(...)

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 arch/powerpc/kernel/setup-common.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/setup-common.c b/arch/powerpc/kernel/setup-common.c
index 71f38e9248be..46481ea96c88 100644
--- a/arch/powerpc/kernel/setup-common.c
+++ b/arch/powerpc/kernel/setup-common.c
@@ -462,8 +462,8 @@ void __init smp_setup_cpu_maps(void)
 		intserv = of_get_property(dn, "ibm,ppc-interrupt-server#s",
 				&len);
 		if (intserv) {
-			DBG("    ibm,ppc-interrupt-server#s -> %d threads\n",
-			    nthreads);
+			DBG("    ibm,ppc-interrupt-server#s -> %lu threads\n",
+			    (len / sizeof(int)));
 		} else {
 			DBG("    no ibm,ppc-interrupt-server#s -> 1 thread\n");
 			intserv = of_get_property(dn, "reg", &len);
-- 
2.29.2

