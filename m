Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2E72D1C8D
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Dec 2020 23:00:35 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cqcgg1yrbzDqXZ
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Dec 2020 09:00:31 +1100 (AEDT)
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
 header.s=pp1 header.b=fHvRfHFh; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CqcV022DPzDqVQ
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Dec 2020 08:52:07 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B7LXJnV101209
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 7 Dec 2020 16:52:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=vt058YBFY9RDTvLMihUhZuo1iX5XtEBZDt9iZKRlwSo=;
 b=fHvRfHFhiHO0srQLWHV5KN7JZZYDtkRjC079+o1BNWba6mdhBt/LmeLFhilMnhunlQlF
 KBHKq9VLf+IB0APJYeprVSY9ffzh6patZeR2KKM7LoG6o/Xp14F7TJ06JuF+mXL4tUfn
 CQwXKnFWPdMdSsXBHknYeGiZK0PuY53DYWIoWhVSvrZc+z8m26myII6nrcwy9kUXmwQe
 2plaRXm8z+EHSzrgCdGqJZSUJIX7fW+YlS+c0Yq9ZuBSu/FB/YVkazSRu6wv20j0KKNE
 DmQGyHMihqxmD0VHN9rZUu3Bd3DNwMcc/cP90xS/xyDZiQuW6Q1GJ6ehwEpvZCXkVN+6 RA== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 359s0me1ma-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Dec 2020 16:52:06 -0500
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B7LliPw000924
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 7 Dec 2020 21:52:05 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma04wdc.us.ibm.com with ESMTP id 3581u92xyw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Dec 2020 21:52:04 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B7Lq4kQ34538216
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 7 Dec 2020 21:52:04 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 59759AC05B;
 Mon,  7 Dec 2020 21:52:04 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 29ECAAC059;
 Mon,  7 Dec 2020 21:52:04 +0000 (GMT)
Received: from localhost (unknown [9.160.57.67])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon,  7 Dec 2020 21:52:04 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 04/28] powerpc/rtas: add rtas_ibm_suspend_me()
Date: Mon,  7 Dec 2020 15:51:36 -0600
Message-Id: <20201207215200.1785968-5-nathanl@linux.ibm.com>
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
 spamscore=0 mlxscore=0
 bulkscore=0 adultscore=0 phishscore=0 priorityscore=1501 mlxlogscore=999
 clxscore=1015 malwarescore=0 impostorscore=0 suspectscore=1
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012070140
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
index 0a8e5dc2c108..8a618a3c4beb 100644
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
2.28.0

