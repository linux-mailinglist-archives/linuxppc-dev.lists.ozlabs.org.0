Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 557A829FA9E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Oct 2020 02:31:28 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CMlC113wJzDqcY
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Oct 2020 12:31:25 +1100 (AEDT)
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
 header.s=pp1 header.b=VJ2+CLcs; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CMkvq2kfSzDqkJ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Oct 2020 12:18:14 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09U16JSo063325
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Oct 2020 21:18:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=3MZzuV49/IY7tt4KcLahGlWn8f5KRc6K1pr9PHRLgd4=;
 b=VJ2+CLcsmfKTf8horsk77N4u+6wJaEWCusmgzok5zEowImjLco14JLCbGf56JIixN4jb
 0DECldQCoMBzf1fpJydPiCTztZl5uc+k1q0p79O5KZ1t3mUfz27ARqqohra0z8lZpusl
 bQIQSsjxwwMF0qCtsP6eB9voCGOGOX8iC9DpKrmWfBEATPSCHr3pFW+/QTKrauh9Endl
 9R9hmAOcEglhgzTMzkMpKoKLuF/PevZ/HxmY7Rmk/mxskA5pfXG3bRJozln67FO/ZbFk
 i2RQ952GgjbI9f7U0nuKLpLRmronSQzYCaZGT6TTpdr+etxyl20e0r3CPYcUTirOo3VW XA== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 34fwvf408f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Oct 2020 21:18:12 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09U1HFAh000733
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Oct 2020 01:18:10 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma02dal.us.ibm.com with ESMTP id 34e1gpc5ax-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Oct 2020 01:18:10 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 09U1IAWf51380644
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 30 Oct 2020 01:18:10 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 18295B2064;
 Fri, 30 Oct 2020 01:18:10 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DE7E5B205F;
 Fri, 30 Oct 2020 01:18:09 +0000 (GMT)
Received: from localhost (unknown [9.65.225.148])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 30 Oct 2020 01:18:09 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 05/29] powerpc/rtas: add rtas_ibm_suspend_me()
Date: Thu, 29 Oct 2020 20:17:41 -0500
Message-Id: <20201030011805.1224603-6-nathanl@linux.ibm.com>
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
 mlxscore=0 suspectscore=1
 mlxlogscore=999 bulkscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
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

Now that the name is available, provide a simple wrapper for
ibm,suspend-me which returns both a Linux errno and optionally the
actual RTAS status to the caller.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/include/asm/rtas.h |  1 +
 arch/powerpc/kernel/rtas.c      | 57 +++++++++++++++++++++++++++++++++
 2 files changed, 58 insertions(+)

diff --git a/arch/powerpc/include/asm/rtas.h b/arch/powerpc/include/asm/rtas.h
index 8436ed01567b..b43165fc6c2a 100644
--- a/arch/powerpc/include/asm/rtas.h
+++ b/arch/powerpc/include/asm/rtas.h
@@ -258,6 +258,7 @@ extern void rtas_progress(char *s, unsigned short hex);
 extern int rtas_suspend_cpu(struct rtas_suspend_me_data *data);
 extern int rtas_suspend_last_cpu(struct rtas_suspend_me_data *data);
 int rtas_ibm_suspend_me_unsafe(u64 handle);
+int rtas_ibm_suspend_me(int *fw_status);
 
 struct rtc_time;
 extern time64_t rtas_get_boot_time(void);
diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index 33adefa84a42..70c570269d7b 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -684,6 +684,63 @@ int rtas_set_indicator_fast(int indicator, int index, int new_value)
 	return rc;
 }
 
+/**
+ * rtas_ibm_suspend_me() - Call ibm,suspend-me to suspend the LPAR.
+ *
+ * @fw_status: RTAS call status will be placed here if not NULL.
+ *
+ * rtas_ibm_suspend_me() should be called only on a CPU which has
+ * received H_CONTINUE from the H_JOIN hcall. All other active CPUs
+ * should be waiting to return from H_JOIN.
+ *
+ * rtas_ibm_suspend_me() may suspend execution of the OS
+ * indefinitely. Callers should take appropriate measures upon return, such as
+ * resetting watchdog facilities.
+ *
+ * Callers may choose to retry this call if @fw_status is
+ * %RTAS_THREADS_ACTIVE.
+ *
+ * Return:
+ * 0          - The partition has resumed from suspend, possibly after
+ *              migration to a different host.
+ * -ECANCELED - The operation was aborted.
+ * -EAGAIN    - There were other CPUs not in H_JOIN at the time of the call.
+ * -EBUSY     - Some other condition prevented the suspend from succeeding.
+ * -EIO       - Hardware/platform error.
+ */
+int rtas_ibm_suspend_me(int *fw_status)
+{
+	int fwrc;
+	int ret;
+
+	fwrc = rtas_call(rtas_token("ibm,suspend-me"), 0, 1, NULL);
+
+	switch (fwrc) {
+	case 0:
+		ret = 0;
+		break;
+	case RTAS_SUSPEND_ABORTED:
+		ret = -ECANCELED;
+		break;
+	case RTAS_THREADS_ACTIVE:
+		ret = -EAGAIN;
+		break;
+	case RTAS_NOT_SUSPENDABLE:
+	case RTAS_OUTSTANDING_COPROC:
+		ret = -EBUSY;
+		break;
+	case -1:
+	default:
+		ret = -EIO;
+		break;
+	}
+
+	if (fw_status)
+		*fw_status = fwrc;
+
+	return ret;
+}
+
 void __noreturn rtas_restart(char *cmd)
 {
 	if (rtas_flash_term_hook)
-- 
2.25.4

