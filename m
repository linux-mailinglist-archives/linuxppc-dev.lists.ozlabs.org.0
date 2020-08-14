Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C748B24445A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Aug 2020 06:42:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BSW4Y4g9wzDqjc
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Aug 2020 14:42:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bala24@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=IxJPaqUw; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BSW2Y090gzDqLM
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Aug 2020 14:40:20 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07E4X0DX091937; Fri, 14 Aug 2020 00:40:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=PK+K/zrJwJJiiva50zj5pMJeHrNKrjTAzX2kE46/Fok=;
 b=IxJPaqUwjz9jAMZiSo77I6WE5ukfn20oBRPVRs7HJQP3g8xV0O5lAQfdc7PY+p3hOua4
 2DycNsHmd2Pj0594BwUAMAbSVSCphpwHqQQM97pEK+WocxAUqV2VD9TC5ruiNksXz7Fw
 EfqhKRjaGFWgzBSqMtxpQNaMAbaOwVlohCBkx2lyYSDxjp2u/VEQEZxRIn3PlsEBQvm1
 6ekSft8vHXBqbaMjG5JZciOe0RhQzpUHKoXsTTOKTPXiRH/yaijhGaB0zBE/049h8+0j
 b4FEQJD4FNOlH9wotAW4u5MqHHEaP97V3inRvvpbKpLF5hS8/kegYhr/EfXpCG4VB8oU Ww== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32vqcqf3pr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Aug 2020 00:40:15 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07E4Z4Us029896;
 Fri, 14 Aug 2020 04:40:13 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03ams.nl.ibm.com with ESMTP id 32skp8e7ct-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Aug 2020 04:40:12 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 07E4eAms63570192
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 14 Aug 2020 04:40:10 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ED3A54C04E;
 Fri, 14 Aug 2020 04:40:09 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 651544C05C;
 Fri, 14 Aug 2020 04:40:08 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.77.194.231])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 14 Aug 2020 04:40:08 +0000 (GMT)
From: Balamuruhan S <bala24@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH] kernel/watchdog: fix warning -Wunused-variable for
 watchdog_allowed_mask in ppc64
Date: Fri, 14 Aug 2020 10:09:51 +0530
Message-Id: <20200814043951.199192-1-bala24@linux.ibm.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-14_01:2020-08-13,
 2020-08-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 spamscore=0 impostorscore=0 mlxscore=0 phishscore=0 suspectscore=1
 lowpriorityscore=0 mlxlogscore=999 clxscore=1015 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008140036
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
Cc: ravi.bangoria@linux.ibm.com, naveen.n.rao@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, sandipan@linux.ibm.com,
 Balamuruhan S <bala24@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In ppc64 config if `CONFIG_SOFTLOCKUP_DETECTOR` is not set then it
warns for unused declaration of `watchdog_allowed_mask` while building,
move the declaration inside ifdef later in the code.

```
kernel/watchdog.c:47:23: warning: ‘watchdog_allowed_mask’ defined but not used [-Wunused-variable]
 static struct cpumask watchdog_allowed_mask __read_mostly;
```

Signed-off-by: Balamuruhan S <bala24@linux.ibm.com>
---
 kernel/watchdog.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/watchdog.c b/kernel/watchdog.c
index 5abb5b22ad13..33c9b8a3d51b 100644
--- a/kernel/watchdog.c
+++ b/kernel/watchdog.c
@@ -44,7 +44,6 @@ int __read_mostly soft_watchdog_user_enabled = 1;
 int __read_mostly watchdog_thresh = 10;
 static int __read_mostly nmi_watchdog_available;
 
-static struct cpumask watchdog_allowed_mask __read_mostly;
 
 struct cpumask watchdog_cpumask __read_mostly;
 unsigned long *watchdog_cpumask_bits = cpumask_bits(&watchdog_cpumask);
@@ -166,6 +165,7 @@ int __read_mostly sysctl_softlockup_all_cpu_backtrace;
 unsigned int __read_mostly softlockup_panic =
 			CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC_VALUE;
 
+static struct cpumask watchdog_allowed_mask __read_mostly;
 static bool softlockup_initialized __read_mostly;
 static u64 __read_mostly sample_period;
 

base-commit: a3a28c4451dff698d0c7ef5a3e80423aa5774e2b
-- 
2.24.1

