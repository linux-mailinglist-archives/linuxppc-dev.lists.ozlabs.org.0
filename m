Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE3229FA8A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Oct 2020 02:26:32 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CMl5K6GP8zDqp7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Oct 2020 12:26:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=jlcHuR95; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CMkvp4rCJzDqkG
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Oct 2020 12:18:14 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09U11wk5186017
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Oct 2020 21:18:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=kdxMNhRM3CjJdy6bNjAWx/svIOiAO3K1UKWXPpdKYfA=;
 b=jlcHuR95kEuEGnZUdT2e+QT9BGRGCgmU8LXUEJS8se2vLbLjrmFeqJ5jatV2eYuiKDi9
 dJnzrZr7W96oPO5T8VROSER/LdbQGZR8/VY2J1/j3O0Qa46lSXJD4lxuDgfGQY9tyMrR
 /ThBrc5JxnHr9DNXiDVEbyGozs+WsBR3UtLBb0t5jUYLRyu8/kOVO7sI98otE7WtEW7p
 OZpZ10h9+mX1qRQuytWlRETBwYaCT8LG5mmWbcneK08wMebYdhblJuuhUskZCccupCdI
 SRosPjMkAmPCrR8FVv75pmDDU6eg4dhO0Ep/OKTJp6v1vIJVR5G6N0jhqQZOX9u4pMoq rA== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34fyxshxn8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Oct 2020 21:18:12 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09U1HG4U000763
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Oct 2020 01:18:11 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma02dal.us.ibm.com with ESMTP id 34e1gpc5b0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Oct 2020 01:18:11 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 09U1IAlE44564904
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 30 Oct 2020 01:18:10 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C6A54112063;
 Fri, 30 Oct 2020 01:18:10 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8EC38112062;
 Fri, 30 Oct 2020 01:18:10 +0000 (GMT)
Received: from localhost (unknown [9.65.225.148])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 30 Oct 2020 01:18:10 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 06/29] powerpc/rtas: add rtas_activate_firmware()
Date: Thu, 29 Oct 2020 20:17:42 -0500
Message-Id: <20201030011805.1224603-7-nathanl@linux.ibm.com>
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
 lowpriorityscore=0
 suspectscore=1 phishscore=0 clxscore=1015 impostorscore=0 adultscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 mlxlogscore=887
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
index 70c570269d7b..58bbd69a233f 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -961,6 +961,36 @@ int rtas_ibm_suspend_me_unsafe(u64 handle)
 }
 #endif
 
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
 /**
  * rtas_call_reentrant() - Used for reentrant rtas calls
  * @token:	Token for desired reentrant RTAS call
-- 
2.25.4

