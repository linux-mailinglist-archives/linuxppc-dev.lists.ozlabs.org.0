Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DC12429FA8F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Oct 2020 02:28:00 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CMl720XmnzDqmJ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Oct 2020 12:27:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=AgYyrcaa; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CMkvp1qgzzDqkD
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Oct 2020 12:18:13 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09U0kCrD167831
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Oct 2020 21:18:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=mIPBrNhjaI/MT+da97W2cvJW3P49B4M4M9415JcsVLU=;
 b=AgYyrcaav60MGrGbG+QS2KCFlN2SEaRsdEXIWNfOYKdiaggCVNovWnQ0oYOiNTT/HOgw
 pVlm6DgSX7ExMKcG7z9PXhu+LesBWYuLa8vJnAnqkbo3M2Z8kmd13RUQ151Y0TATcAkn
 cJ0Kn5cfv13UnqQw/SFMrCO5pLGS98kpI1mcbKNjfcj63sAr7h7NDuQlR7Qc88qNpj/q
 Uz7MnlgAPbFn8ggvmfQhXRo6D0eMsJ1Lpm1FN12mDaGhT58hmsQ/yq6HOmedCOvUJdlw
 GQvXhusEZDQmGfsLOIsWTWw4OwQV7k7Sju8cNV5jQW6HFbr+HoQKZwjqoh+zhOWBKFmm eA== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 34g15gxpu2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Oct 2020 21:18:10 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09U1GnoR027929
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Oct 2020 01:18:10 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma03dal.us.ibm.com with ESMTP id 34etf9fq5v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Oct 2020 01:18:10 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 09U1I9Zv49742206
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 30 Oct 2020 01:18:09 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 75C6C124053;
 Fri, 30 Oct 2020 01:18:09 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3AC7F124052;
 Fri, 30 Oct 2020 01:18:09 +0000 (GMT)
Received: from localhost (unknown [9.65.225.148])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 30 Oct 2020 01:18:09 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 04/29] powerpc/rtas: rtas_ibm_suspend_me ->
 rtas_ibm_suspend_me_unsafe
Date: Thu, 29 Oct 2020 20:17:40 -0500
Message-Id: <20201030011805.1224603-5-nathanl@linux.ibm.com>
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
 phishscore=0 mlxlogscore=747
 priorityscore=1501 suspectscore=3 bulkscore=0 adultscore=0 mlxscore=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
index 132b2ae39009..33adefa84a42 100644
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
@@ -898,7 +898,7 @@ int rtas_ibm_suspend_me(u64 handle)
 	return atomic_read(&data.error);
 }
 #else /* CONFIG_PPC_PSERIES */
-int rtas_ibm_suspend_me(u64 handle)
+int rtas_ibm_suspend_me_unsafe(u64 handle)
 {
 	return -ENOSYS;
 }
@@ -1184,7 +1184,7 @@ SYSCALL_DEFINE1(rtas, struct rtas_args __user *, uargs)
 		int rc = 0;
 		u64 handle = ((u64)be32_to_cpu(args.args[0]) << 32)
 		              | be32_to_cpu(args.args[1]);
-		rc = rtas_ibm_suspend_me(handle);
+		rc = rtas_ibm_suspend_me_unsafe(handle);
 		if (rc == -EAGAIN)
 			args.rets[0] = cpu_to_be32(RTAS_NOT_SUSPENDABLE);
 		else if (rc == -EIO)
diff --git a/arch/powerpc/platforms/pseries/mobility.c b/arch/powerpc/platforms/pseries/mobility.c
index d6f4162478a5..b6de65cbfcd9 100644
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
2.25.4

