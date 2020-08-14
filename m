Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CF415244A82
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Aug 2020 15:37:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BSky23BCnzDql2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Aug 2020 23:37:14 +1000 (AEST)
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
 header.s=pp1 header.b=HpL1ED54; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BSktz0VQ8zDqkw
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Aug 2020 23:34:34 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07EDXQ1S042718; Fri, 14 Aug 2020 09:34:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=PK+K/zrJwJJiiva50zj5pMJeHrNKrjTAzX2kE46/Fok=;
 b=HpL1ED54G7rpWyxM115TzOJNoxoCePA6dglz6kH3tG20LR8sMssoHAiZrVHeR0R/NVPZ
 eY53RfrmfkEfFUmI0mSn2R8YOnArHUyOREBlpnUc0Jku/yBKGhVCqZVelkdlRFWZa61E
 xT0hXio9W5V4bedORHGNZc0Dj5OJhgCEqdEiHAhXj3UND4V/KIgwJZO/6j8KhYqYHRUu
 Ydw41u4B0ISDLlQUswPrMfC11/K37y2aeI9/5/Qt95aB6+Ftq630rIC1YxG/vlmgOwOM
 X9YvEeC2FTgpJSQGGTo3y4fvL+4EzFYlUQr+fh5qNjtzF4u35/NQ+5EfUMI+d3GHZX7/ rA== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32srauuxgh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Aug 2020 09:34:10 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07EDLdOD032624;
 Fri, 14 Aug 2020 13:34:06 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06ams.nl.ibm.com with ESMTP id 32skahenw5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Aug 2020 13:34:05 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07EDY2GB21758434
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 14 Aug 2020 13:34:02 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BE7D352050;
 Fri, 14 Aug 2020 13:34:02 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.79.212.27])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 5C78352051;
 Fri, 14 Aug 2020 13:33:58 +0000 (GMT)
From: Balamuruhan S <bala24@linux.ibm.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] kernel/watchdog: fix warning -Wunused-variable for
 watchdog_allowed_mask in ppc64
Date: Fri, 14 Aug 2020 19:03:30 +0530
Message-Id: <20200814133330.210093-1-bala24@linux.ibm.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-14_07:2020-08-14,
 2020-08-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 phishscore=0
 suspectscore=1 priorityscore=1501 impostorscore=0 bulkscore=0 adultscore=0
 malwarescore=0 spamscore=0 mlxscore=0 lowpriorityscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2008140099
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
Cc: pmladek@suse.com, ravi.bangoria@linux.ibm.com, peterz@infradead.org,
 gpiccoli@canonical.com, rdna@fb.com, Balamuruhan S <bala24@linux.ibm.com>,
 Jisheng.Zhang@synaptics.com, viro@zeniv.linux.org.uk, tglx@linutronix.de,
 linuxppc-dev@lists.ozlabs.org, naveen.n.rao@linux.vnet.ibm.com,
 sandipan@linux.ibm.com
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

