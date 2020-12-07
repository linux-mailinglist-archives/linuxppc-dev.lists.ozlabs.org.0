Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 431102D1CB1
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Dec 2020 23:05:20 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cqcn94kS6zDqfd
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Dec 2020 09:05:17 +1100 (AEDT)
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
 header.s=pp1 header.b=Sa6Ojo+N; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CqcV06ysHzDqVK
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Dec 2020 08:52:08 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B7LeDlS130074
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 7 Dec 2020 16:52:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=qFAz7SoyfUY89c9/uHKqIGveXr2vCOTAg8aFxOtKyQ0=;
 b=Sa6Ojo+NfUkRWAslUkMUqGsy/KuacKxaF2tnZU80r/pQpzUd9QGPpotjQVo0ME276PEQ
 tO+F0hb7sGQLH4lgeedi22qb3NVKGcB0WxXtRBCqogT5nXhBfuVidoZ+KCXYwhR13qdz
 a/lzIXOBD/elnLm9QxEC/x3Wy7pZ6xuLx07Kkn5D8QBnGdgqjiens3qRu/yzDquACCHY
 4k1TpQPioBhneJQrOpPUwMWFSfNrqqSu41t+w10IWlS9zKa0KMupTjlZMZt3GQaWH6R9
 JqnE0MekaYNNfMUhnFLG5sBrQ9SaPjE28ZQg83dFUEda7bR442nJZ+4TXkuglSWSQHZ1 wA== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 359s0mxa0p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Dec 2020 16:52:06 -0500
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B7LmJnH024621
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 7 Dec 2020 21:52:06 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma03dal.us.ibm.com with ESMTP id 3581u8ymv6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Dec 2020 21:52:05 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B7Lq5qE17629906
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 7 Dec 2020 21:52:05 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0126CAC05B;
 Mon,  7 Dec 2020 21:52:05 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C7B0DAC059;
 Mon,  7 Dec 2020 21:52:04 +0000 (GMT)
Received: from localhost (unknown [9.160.57.67])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon,  7 Dec 2020 21:52:04 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 05/28] powerpc/rtas: add rtas_activate_firmware()
Date: Mon,  7 Dec 2020 15:51:37 -0600
Message-Id: <20201207215200.1785968-6-nathanl@linux.ibm.com>
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
 bulkscore=0 clxscore=1015
 mlxscore=0 mlxlogscore=999 lowpriorityscore=0 impostorscore=0 spamscore=0
 suspectscore=1 adultscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012070140
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

Provide a documented wrapper function for the ibm,activate-firmware
service, which must be called after a partition migration or
hibernation.

If the function is absent or the call fails, the OS will continue to
run normally with the current firmware, so there is no need to perform
any recovery. Just log it and continue.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/include/asm/rtas.h |  1 +
 arch/powerpc/kernel/rtas.c      | 30 ++++++++++++++++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/arch/powerpc/include/asm/rtas.h b/arch/powerpc/include/asm/rtas.h
index b43165fc6c2a..fdefe6a974eb 100644
--- a/arch/powerpc/include/asm/rtas.h
+++ b/arch/powerpc/include/asm/rtas.h
@@ -247,6 +247,7 @@ extern void __noreturn rtas_restart(char *cmd);
 extern void rtas_power_off(void);
 extern void __noreturn rtas_halt(void);
 extern void rtas_os_term(char *str);
+void rtas_activate_firmware(void);
 extern int rtas_get_sensor(int sensor, int index, int *state);
 extern int rtas_get_sensor_fast(int sensor, int index, int *state);
 extern int rtas_get_power_level(int powerdomain, int *level);
diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index 8a618a3c4beb..3a740ae933f8 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -798,6 +798,36 @@ void rtas_os_term(char *str)
 		printk(KERN_EMERG "ibm,os-term call failed %d\n", status);
 }
 
+/**
+ * rtas_activate_firmware() - Activate a new version of firmware.
+ *
+ * Activate a new version of partition firmware. The OS must call this
+ * after resuming from a partition hibernation or migration in order
+ * to maintain the ability to perform live firmware updates. It's not
+ * catastrophic for this method to be absent or to fail; just log the
+ * condition in that case.
+ *
+ * Context: This function may sleep.
+ */
+void rtas_activate_firmware(void)
+{
+	int token;
+	int fwrc;
+
+	token = rtas_token("ibm,activate-firmware");
+	if (token == RTAS_UNKNOWN_SERVICE) {
+		pr_notice("ibm,activate-firmware method unavailable\n");
+		return;
+	}
+
+	do {
+		fwrc = rtas_call(token, 0, 1, NULL);
+	} while (rtas_busy_delay(fwrc));
+
+	if (fwrc)
+		pr_err("ibm,activate-firmware failed (%i)\n", fwrc);
+}
+
 static int ibm_suspend_me_token = RTAS_UNKNOWN_SERVICE;
 #ifdef CONFIG_PPC_PSERIES
 static int __rtas_suspend_last_cpu(struct rtas_suspend_me_data *data, int wake_when_done)
-- 
2.28.0

