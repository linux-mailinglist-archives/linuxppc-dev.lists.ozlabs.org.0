Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 16AC92D1C67
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Dec 2020 22:56:23 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CqcZq4ZkczDqWw
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Dec 2020 08:56:19 +1100 (AEDT)
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
 header.s=pp1 header.b=MICbf3eA; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CqcTz4DNFzDqVL
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Dec 2020 08:52:07 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B7LRsH2118785
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 7 Dec 2020 16:52:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=hO283/Y9MLUpvSJqiirGHcvmU+xACNiFGgWUZ0Z8LPc=;
 b=MICbf3eAQ6U8r5gH/fHBMm0Aixp39QZsptC/NwLTKmK8eFF3FAPeBqvfQR8/vibjnsY1
 ZrpflA27adgP3uoFuy5r6q1bTMGcLNFAIOGc22eZak8Ga5GPut6t542EtaqP1ItdpBcU
 tpBONbI9110f1NQxcj6elihc0y1YpP3uZ9+nFs6nQzScsm6t0/Dy2Prbi0/34d7iaUfU
 6o3Rh75YGHrSkWY7kgP/itT9Vj52kv8BAu0dpZ2Zoi4LBMcqHFJ14Kczoy9D5IhFaUSc
 8Z5TglZibksXUERZ8O4VT/EWwqW30Q/aBcmwRpZCYWCdXe4IeDE1IpSzPR9f3i+lej+B xA== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 359s0h6byb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Dec 2020 16:52:05 -0500
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B7Llbmg010825
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 7 Dec 2020 21:52:04 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma03wdc.us.ibm.com with ESMTP id 3581u8u0cc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Dec 2020 21:52:04 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B7Lq3c221299458
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 7 Dec 2020 21:52:03 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A8264AC05E;
 Mon,  7 Dec 2020 21:52:03 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6AB02AC05F;
 Mon,  7 Dec 2020 21:52:03 +0000 (GMT)
Received: from localhost (unknown [9.160.57.67])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon,  7 Dec 2020 21:52:03 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 03/28] powerpc/rtas: rtas_ibm_suspend_me ->
 rtas_ibm_suspend_me_unsafe
Date: Mon,  7 Dec 2020 15:51:35 -0600
Message-Id: <20201207215200.1785968-4-nathanl@linux.ibm.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201207215200.1785968-1-nathanl@linux.ibm.com>
References: <20201207215200.1785968-1-nathanl@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-07_16:2020-12-04,
 2020-12-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=3 mlxlogscore=964 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012070132
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

The pseries partition suspend sequence requires that all active CPUs
call H_JOIN, which suspends all but one of them with interrupts
disabled. The "chosen" CPU is then to call ibm,suspend-me to complete
the suspend. Upon returning from ibm,suspend-me, the chosen CPU is to
use H_PROD to wake the joined CPUs.

Using on_each_cpu() for this, as rtas_ibm_suspend_me() does to
implement partition migration, is susceptible to deadlock with other
users of on_each_cpu() and with users of stop_machine APIs. The
callback passed to on_each_cpu() is not allowed to synchronize with
other CPUs in the way it is used here.

Complicating the fix is the fact that rtas_ibm_suspend_me() also
occupies the function name that should be used to provide a more
conventional wrapper for ibm,suspend-me. Rename rtas_ibm_suspend_me()
to rtas_ibm_suspend_me_unsafe() to free up the name and indicate that
it should not gain users.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/include/asm/rtas.h           | 2 +-
 arch/powerpc/kernel/rtas.c                | 6 +++---
 arch/powerpc/platforms/pseries/mobility.c | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/include/asm/rtas.h b/arch/powerpc/include/asm/rtas.h
index f060181a0d32..8436ed01567b 100644
--- a/arch/powerpc/include/asm/rtas.h
+++ b/arch/powerpc/include/asm/rtas.h
@@ -257,7 +257,7 @@ extern int rtas_set_indicator_fast(int indicator, int index, int new_value);
 extern void rtas_progress(char *s, unsigned short hex);
 extern int rtas_suspend_cpu(struct rtas_suspend_me_data *data);
 extern int rtas_suspend_last_cpu(struct rtas_suspend_me_data *data);
-extern int rtas_ibm_suspend_me(u64 handle);
+int rtas_ibm_suspend_me_unsafe(u64 handle);
 
 struct rtc_time;
 extern time64_t rtas_get_boot_time(void);
diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index 4ed64aba37d6..0a8e5dc2c108 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -843,7 +843,7 @@ static void rtas_percpu_suspend_me(void *info)
 	__rtas_suspend_cpu((struct rtas_suspend_me_data *)info, 1);
 }
 
-int rtas_ibm_suspend_me(u64 handle)
+int rtas_ibm_suspend_me_unsafe(u64 handle)
 {
 	long state;
 	long rc;
@@ -949,7 +949,7 @@ int rtas_call_reentrant(int token, int nargs, int nret, int *outputs, ...)
 }
 
 #else /* CONFIG_PPC_PSERIES */
-int rtas_ibm_suspend_me(u64 handle)
+int rtas_ibm_suspend_me_unsafe(u64 handle)
 {
 	return -ENOSYS;
 }
@@ -1185,7 +1185,7 @@ SYSCALL_DEFINE1(rtas, struct rtas_args __user *, uargs)
 		int rc = 0;
 		u64 handle = ((u64)be32_to_cpu(args.args[0]) << 32)
 		              | be32_to_cpu(args.args[1]);
-		rc = rtas_ibm_suspend_me(handle);
+		rc = rtas_ibm_suspend_me_unsafe(handle);
 		if (rc == -EAGAIN)
 			args.rets[0] = cpu_to_be32(RTAS_NOT_SUSPENDABLE);
 		else if (rc == -EIO)
diff --git a/arch/powerpc/platforms/pseries/mobility.c b/arch/powerpc/platforms/pseries/mobility.c
index 2f73cb5bf12d..6ff642e84c6a 100644
--- a/arch/powerpc/platforms/pseries/mobility.c
+++ b/arch/powerpc/platforms/pseries/mobility.c
@@ -370,7 +370,7 @@ static ssize_t migration_store(struct class *class,
 		return rc;
 
 	do {
-		rc = rtas_ibm_suspend_me(streamid);
+		rc = rtas_ibm_suspend_me_unsafe(streamid);
 		if (rc == -EAGAIN)
 			ssleep(1);
 	} while (rc == -EAGAIN);
-- 
2.28.0

