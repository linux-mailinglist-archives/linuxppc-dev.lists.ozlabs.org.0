Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2C923A072
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Aug 2020 09:42:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BKqbj19KVzDqVc
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Aug 2020 17:42:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sandipan@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BKqZ51RCTzDqBr
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Aug 2020 17:41:00 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0737UnYE014997; Mon, 3 Aug 2020 03:40:49 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32p7xy8cyu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Aug 2020 03:40:49 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0737atQl028676;
 Mon, 3 Aug 2020 07:40:47 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma06ams.nl.ibm.com with ESMTP id 32mynh1xfa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Aug 2020 07:40:47 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0737ejns33292626
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 3 Aug 2020 07:40:45 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 70C24A405C;
 Mon,  3 Aug 2020 07:40:45 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 92D7BA405B;
 Mon,  3 Aug 2020 07:40:44 +0000 (GMT)
Received: from fir03.in.ibm.com (unknown [9.121.59.65])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  3 Aug 2020 07:40:44 +0000 (GMT)
From: Sandipan Das <sandipan@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH] selftests/powerpc: Fix pkey syscall redefinitions
Date: Mon,  3 Aug 2020 13:10:43 +0530
Message-Id: <20200803074043.466809-1-sandipan@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-03_04:2020-07-31,
 2020-08-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 mlxscore=0 spamscore=0 mlxlogscore=780 impostorscore=0
 suspectscore=3 phishscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008030051
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
Cc: sachinp@linux.vnet.ibm.com, aneesh.kumar@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Some distros have the pkey syscall numbers defined under
unistd.h. This conflicts with the definitions in the pkeys
selftest header and causes build failures.

E.g. this works
  $ grep -nr "SYS_pkey" /usr/include/
  /usr/include/bits/syscall.h:1575:# define SYS_pkey_alloc __NR_pkey_alloc
  /usr/include/bits/syscall.h:1579:# define SYS_pkey_free __NR_pkey_free
  /usr/include/bits/syscall.h:1583:# define SYS_pkey_mprotect __NR_pkey_mprotect

While this does not
  $ grep -nr "SYS_pkey" /usr/include/
  /usr/include/bits/syscall.h:1575:# define SYS_pkey_alloc __NR_pkey_alloc
  /usr/include/bits/syscall.h:1579:# define SYS_pkey_free __NR_pkey_free
  /usr/include/bits/syscall.h:1583:# define SYS_pkey_mprotect __NR_pkey_mprotect
  /usr/include/asm-generic/unistd.h:728:__SYSCALL(__NR_pkey_mprotect, sys_pkey_mprotect)
  /usr/include/asm-generic/unistd.h:730:__SYSCALL(__NR_pkey_alloc,    sys_pkey_alloc)
  /usr/include/asm-generic/unistd.h:732:__SYSCALL(__NR_pkey_free,     sys_pkey_free)

Reported-by: Sachin Sant <sachinp@linux.vnet.ibm.com>
Signed-off-by: Sandipan Das <sandipan@linux.ibm.com>
---
 tools/testing/selftests/powerpc/include/pkeys.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tools/testing/selftests/powerpc/include/pkeys.h b/tools/testing/selftests/powerpc/include/pkeys.h
index 6ba95039a034..26eef5c1f8ea 100644
--- a/tools/testing/selftests/powerpc/include/pkeys.h
+++ b/tools/testing/selftests/powerpc/include/pkeys.h
@@ -31,8 +31,13 @@
 
 #define SI_PKEY_OFFSET	0x20
 
+#undef SYS_pkey_mprotect
 #define SYS_pkey_mprotect	386
+
+#undef SYS_pkey_alloc
 #define SYS_pkey_alloc		384
+
+#undef SYS_pkey_free
 #define SYS_pkey_free		385
 
 #define PKEY_BITS_PER_PKEY	2
-- 
2.25.1

