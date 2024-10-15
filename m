Return-Path: <linuxppc-dev+bounces-2276-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ACEC99E4B7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Oct 2024 12:56:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XSWHq2WWjz3blN;
	Tue, 15 Oct 2024 21:56:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728989799;
	cv=none; b=KnbCwhOJe/i/iXxj0odWkOUAgjSxO2+YQOds3fPkhYP4Ddhnt91126a9q+rVH7CF4VAUg+6xi8cp4RCkfVHhBCqwNf7YACSAlcZRdZkD7xavaMsPTcDfMUI8x4P5cAQPJ5WW3w1llfZTKb7OrTQVQRO+fcEaoWyMbHJDIHAVjSjd2lRJHQ66TM6GWE8TNjzfVvmDePrxo1FdNpvwtFaf+56tSoQtbL/t+sh9oR2HnuGx60imtdIsdKSLureWUWR26n9RydeVADM9APp0LOiF1g72niroHTxI+ERtUlPhRVFCXnGqiHvkFkuwKEcJlk0tzyo8XOHAq+X0WsmxNBTj2g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728989799; c=relaxed/relaxed;
	bh=rNGwixYfUUPYg6NjjOEFj7h4gHe7G0ava0pIqhoYWcg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K2kSHMP/vU+whhMxVJzMg9SBeCY8mMdhiXAmzWSwibQV/iWKaU1AXsDH8GghR7+vabensNGQ4j1l7yOvd+VaBmR9vXz+5LmzBjuqjR+cG9tOtZn1Rz4lHueYCLsqt0S/c2zRyKrLehe40BNlgbLAWIuBL1aVos5tTOyl6CZZpGiazxFMMYfN1/wNrm8R8ZUwToH+O3huY0wOX5mUBciYaAgPmv8QoXGhJ9QgMgBnmHRKSu97ML7o6k4OKRNJ2sfQhfz38N1sfFyq18VHGyBUtUWW9ue5ETvlLZbq3W2x5z6CMQ3NkQTFgORyWoV18NW06DIhCtPGszUp6TgZSToNLg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=B5oBb7ET; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=vishalc@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=B5oBb7ET;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=vishalc@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XSWHn5f6yz3bkf
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Oct 2024 21:56:36 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49F8PHWh023761;
	Tue, 15 Oct 2024 10:56:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=rNGwixYfUUPYg6Njj
	OEFj7h4gHe7G0ava0pIqhoYWcg=; b=B5oBb7ETsejPWJsKqAEpV9r9EC6dzQmFo
	O/DqVIgLSmEoY9LIQdWeDFyiafImd1XW6B+Ma0z1BT32efgtLuHbWu93HlZ/Kpij
	+pMXnqodKvfE6WfeveOyvFtcHCBF2vQa3sAL48InlkvhbE5qIGy/voLPn4z2vKx1
	wyoAwsKMlo70i1BHqzulGlM2OFusCg0L/GB2N5QyWeSW00hM3gb8MjD1FMJCYolt
	nYRuHKLGpv6Zpv0o2QmeAvBWo80j/57XIOkIZEGx/+LKjoz0oIuYZSmvAUPpLuZH
	cKwPH9mo9/Rzx8cZY3iAm9bW38aSZQamii/mlZ+4f7rJjijVpax9w==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 429mv4rqkg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Oct 2024 10:56:26 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 49FAsZFP030322;
	Tue, 15 Oct 2024 10:56:25 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 429mv4rqkc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Oct 2024 10:56:25 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 49F7k1Fv001940;
	Tue, 15 Oct 2024 10:56:24 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4284emkc62-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Oct 2024 10:56:24 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 49FAuK3c54264082
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 15 Oct 2024 10:56:20 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 737412004B;
	Tue, 15 Oct 2024 10:56:20 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1124120040;
	Tue, 15 Oct 2024 10:56:18 +0000 (GMT)
Received: from vishalc-ibm.ibmuc.com (unknown [9.39.24.36])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 15 Oct 2024 10:56:17 +0000 (GMT)
From: Vishal Chourasia <vishalc@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, herbert@gondor.apana.org.au,
        davem@davemloft.net, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, naveen@kernel.org, maddy@linux.ibm.com,
        linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Vishal Chourasia <vishalc@linux.ibm.com>
Subject: [v2 PATCH 2/2] crypto/nx: Fix invalid wait context during kexec reboot
Date: Tue, 15 Oct 2024 16:25:52 +0530
Message-ID: <20241015105551.1817348-3-vishalc@linux.ibm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241015105551.1817348-2-vishalc@linux.ibm.com>
References: <20241015105551.1817348-2-vishalc@linux.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: g16Py42SK_L-rMj-yeOvDFUupNO8oXmW
X-Proofpoint-ORIG-GUID: fs1dDhFKwsuTRqwwm_EFPCJBgdaU9WZJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 mlxscore=0 suspectscore=0 phishscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 malwarescore=0 mlxlogscore=791
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410150072
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

nx842_remove() call of_reconfig_notifier_unregister while holding the
devdata_spinlock. This could lead to an invalid wait context error during
kexec reboot, as of_reconfig_notifier_unregister tries to acquire a read-write
semaphore (check logs) while holding a spinlock.

Move the of_reconfig_notifier_unregister() call before acquiring the
spinlock to prevent this race condition invalid wait contexts during system
shutdown or kexec operations.

Log:

[ BUG: Invalid wait context ]
6.11.0-test2-10547-g684a64bf32b6-dirty #79 Not tainted
-----------------------------
kexec/61926 is trying to lock:
c000000002d8b590 ((of_reconfig_chain).rwsem){++++}-{4:4}, at: blocking_notifier_chain_unregister+0x44/0xa0
other info that might help us debug this:
context-{5:5}
4 locks held by kexec/61926:
 #0: c000000002926c70 (system_transition_mutex){+.+.}-{4:4}, at: __do_sys_reboot+0xf8/0x2e0
 #1: c00000000291af30 (&dev->mutex){....}-{4:4}, at: device_shutdown+0x160/0x310
 #2: c000000051011938 (&dev->mutex){....}-{4:4}, at: device_shutdown+0x174/0x310
 #3: c000000002d88070 (devdata_mutex){....}-{3:3}, at: nx842_remove+0xac/0x1bc
stack backtrace:
CPU: 2 UID: 0 PID: 61926 Comm: kexec Not tainted 6.11.0-test2-10547-g684a64bf32b6-dirty #79
Hardware name: IBM,9080-HEX POWER10 (architected) 0x800200 0xf000006 of:IBM,FW1060.00 (NH1060_012) hv:phyp pSeries
Call Trace:
[c0000000bb577400] [c000000001239704] dump_stack_lvl+0xc8/0x130 (unreliable)
[c0000000bb577440] [c000000000248398] __lock_acquire+0xb68/0xf00
[c0000000bb577550] [c000000000248820] lock_acquire.part.0+0xf0/0x2a0
[c0000000bb577670] [c00000000127faa0] down_write+0x70/0x1e0
[c0000000bb5776b0] [c0000000001acea4] blocking_notifier_chain_unregister+0x44/0xa0
[c0000000bb5776e0] [c000000000e2312c] of_reconfig_notifier_unregister+0x2c/0x40
[c0000000bb577700] [c000000000ded24c] nx842_remove+0x148/0x1bc
[c0000000bb577790] [c00000000011a114] vio_bus_remove+0x54/0xc0
[c0000000bb5777c0] [c000000000c1a44c] device_shutdown+0x20c/0x310
[c0000000bb577850] [c0000000001b0ab4] kernel_restart_prepare+0x54/0x70
[c0000000bb577870] [c000000000308718] kernel_kexec+0xa8/0x110
[c0000000bb5778e0] [c0000000001b1144] __do_sys_reboot+0x214/0x2e0
[c0000000bb577a40] [c000000000032f98] system_call_exception+0x148/0x310
[c0000000bb577e50] [c00000000000cedc] system_call_vectored_common+0x15c/0x2ec
--- interrupt: 3000 at 0x7fffa07e7df8
NIP:  00007fffa07e7df8 LR: 00007fffa07e7df8 CTR: 0000000000000000
REGS: c0000000bb577e80 TRAP: 3000   Not tainted  (6.11.0-test2-10547-g684a64bf32b6-dirty)
MSR:  800000000280f033   CR: 48022484  XER: 00000000
IRQMASK: 0
GPR00: 0000000000000058 00007ffff961f1e0 00007fffa08f7100 fffffffffee1dead
GPR04: 0000000028121969 0000000045584543 0000000000000000 0000000000000003
GPR08: 0000000000000003 0000000000000000 0000000000000000 0000000000000000
GPR12: 0000000000000000 00007fffa0a9b360 ffffffffffffffff 0000000000000000
GPR16: 0000000000000001 0000000000000002 0000000000000001 0000000000000001
GPR20: 000000011710f520 0000000000000000 0000000000000000 0000000000000001
GPR24: 0000000129be0480 0000000000000003 0000000000000003 00007ffff961f2b0
GPR28: 00000001170f2d30 00000001170f2d28 00007fffa08f18d0 0000000129be04a0
NIP [00007fffa07e7df8] 0x7fffa07e7df8
LR [00007fffa07e7df8] 0x7fffa07e7df8
--- interrupt: 3000

Suggested-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Vishal Chourasia <vishalc@linux.ibm.com>
---
 drivers/crypto/nx/nx-common-pseries.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/crypto/nx/nx-common-pseries.c b/drivers/crypto/nx/nx-common-pseries.c
index a0eb900383af7..1660c5cf3641c 100644
--- a/drivers/crypto/nx/nx-common-pseries.c
+++ b/drivers/crypto/nx/nx-common-pseries.c
@@ -1122,10 +1122,11 @@ static void nx842_remove(struct vio_dev *viodev)
 
 	crypto_unregister_alg(&nx842_pseries_alg);
 
+	of_reconfig_notifier_unregister(&nx842_of_nb);
+
 	spin_lock_irqsave(&devdata_spinlock, flags);
 	old_devdata = rcu_dereference_check(devdata,
 			lockdep_is_held(&devdata_spinlock));
-	of_reconfig_notifier_unregister(&nx842_of_nb);
 	RCU_INIT_POINTER(devdata, NULL);
 	spin_unlock_irqrestore(&devdata_spinlock, flags);
 	synchronize_rcu();
-- 
2.47.0


