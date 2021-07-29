Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4A53D9D79
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jul 2021 08:10:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gb0Wj5nt5z3cTc
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jul 2021 16:10:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GxTAh6/b;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=GxTAh6/b; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gb0WB6SsKz2yWt
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Jul 2021 16:10:13 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16T64qrq124983; Thu, 29 Jul 2021 02:10:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=+fu5NVLKIUUtUesSbpvUO5iHMACogFmyw8JtLG6LDXI=;
 b=GxTAh6/bjdmm9Pwkk82z/X9hV2sDA3jQF2osvIRJPd0S0opnwVX07vNfadg0VJHwpUqH
 PYOk0ZHgCMXu0CeDgv5zH677CW885NYIrZVl7HgQzYNXkjtnQOYZu8ir3ur8aMQgbHNw
 6H+TcK+1UrfMoB+9JuEzFfmTtYl0HBw/zQb/833qM/TF/EFeCLjqmNrEqGycEOsVqXHF
 vRipXrNcsBr7vje9LSnMPOtXksBgthuY3A8nzbVJtqh4nhqmrWsM8H2kWBpV4MXDC8Wm
 kAeu0iqaUbgLns4bc9U9jMfmwTbeW2qGgxc1tTnxBSrK+vEFQNhW5P0HMJoNh9cmjJNg DA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3a3hm2ephq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Jul 2021 02:10:07 -0400
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16T64xem125463;
 Thu, 29 Jul 2021 02:10:06 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3a3hm2epf8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Jul 2021 02:10:06 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16T5wmSo026453;
 Thu, 29 Jul 2021 06:05:03 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06ams.nl.ibm.com with ESMTP id 3a235khg10-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Jul 2021 06:05:03 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16T651aD27525606
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 29 Jul 2021 06:05:01 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0B377A4065;
 Thu, 29 Jul 2021 06:05:01 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 11898A4040;
 Thu, 29 Jul 2021 06:04:59 +0000 (GMT)
Received: from saptagiri.in.ibm.com (unknown [9.199.57.178])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 29 Jul 2021 06:04:58 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] powerpc/pseries: Fix regression while building external
 modules
Date: Thu, 29 Jul 2021 11:34:49 +0530
Message-Id: <20210729060449.292780-1-srikar@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: mbXoikGB5PQ7IGzgF-CaRMNMfNIt2k3l
X-Proofpoint-GUID: BNWJRw2YuYXUo1DzMyGJSwb2KwZuMfxi
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-29_06:2021-07-27,
 2021-07-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 spamscore=0 mlxlogscore=999 clxscore=1015 priorityscore=1501
 impostorscore=0 suspectscore=0 bulkscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2107290041
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
Cc: Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>, marc.c.dionne@gmail.com,
 jforbes@redhat.com, yadayada@in.ibm.com,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

With Commit c9f3401313a5 ("powerpc: Always enable queued spinlocks for
64s, disable for others") CONFIG_PPC_QUEUED_SPINLOCKS is always
enabled on ppc64le, external modules that use spinlock APIs are
failing.

ERROR: modpost: GPL-incompatible module XXX.ko uses GPL-only symbol
'shared_processor'

Before the above commit, modules were able to build without any
issues. Also this problem is not seen on other architectures. This
problem can be workaround if CONFIG_UNINLINE_SPIN_UNLOCK is enabled in
the config. However CONFIG_UNINLINE_SPIN_UNLOCK is not enabled by
default and only enabled in certain conditions like
CONFIG_DEBUG_SPINLOCKS is set in the kernel config.

 #include <linux/module.h>
spinlock_t spLock;

static int __init spinlock_test_init(void)
{
        spin_lock_init(&spLock);
        spin_lock(&spLock);
        spin_unlock(&spLock);
        return 0;
}

static void __exit spinlock_test_exit(void)
{
	printk("spinlock_test unloaded\n");
}
module_init(spinlock_test_init);
module_exit(spinlock_test_exit);

MODULE_DESCRIPTION ("spinlock_test");
MODULE_LICENSE ("non-GPL");
MODULE_AUTHOR ("Srikar Dronamraju");

Given that spin locks are one of the basic facilities for module code,
this effectively makes it impossible to build/load almost any non GPL
modules on ppc64le.

This was first reported at https://github.com/openzfs/zfs/issues/11172

Currently shared_processor is exported as GPL only symbol.
Fix this for parity with other architectures by exposing
shared_processor to non-GPL modules too.

Fixes: 14c73bd344da ("powerpc/vcpu: Assume dedicated processors as non-preempt")
Fixes: c9f3401313a5 ("powerpc: Always enable queued spinlocks for 64s, disable for others")
Reported-by: marc.c.dionne@gmail.com
Cc: linuxppc-dev@lists.ozlabs.org
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: marc.c.dionne@gmail.com
Cc: jforbes@redhat.com
Cc: yadayada@in.ibm.com
Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
---
 arch/powerpc/platforms/pseries/setup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/pseries/setup.c b/arch/powerpc/platforms/pseries/setup.c
index 754e493b7c05..0338f481c12b 100644
--- a/arch/powerpc/platforms/pseries/setup.c
+++ b/arch/powerpc/platforms/pseries/setup.c
@@ -77,7 +77,7 @@
 #include "../../../../drivers/pci/pci.h"
 
 DEFINE_STATIC_KEY_FALSE(shared_processor);
-EXPORT_SYMBOL_GPL(shared_processor);
+EXPORT_SYMBOL(shared_processor);
 
 int CMO_PrPSP = -1;
 int CMO_SecPSP = -1;

base-commit: adf3c31e18b765ea24eba7b0c1efc076b8ee3d55
-- 
2.18.2

