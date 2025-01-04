Return-Path: <linuxppc-dev+bounces-4663-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E4776A016C9
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Jan 2025 21:48:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YQXZ85M82z30W6;
	Sun,  5 Jan 2025 07:47:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736023648;
	cv=none; b=Y2WB4rpgbusYNtakxEPi8UswMM0kT/Xk5ijbEiey8Lhv+g8apebF6g8pDzFi420dGuhpbZQKn/t1CobXUTq5FjtevXeT8+NH1TzinyO2m9YVKBxJqA0LG/4iQj7YyRMefHPNF0lH9LHb/y0IxZa+bXECU9rsEFnBYIo4FBKXXPp/0DjTc1sefTMKNPc68ZbKP7h11+tdIgC56k6EK7KndPKAkQot/pkEYZrp6vnXYEJKIfxoye//7Nma/NILNxPheT85YoWA1DR0hkz3GPu0xrxENwsUFUnMe8gNxTZj8BauI+Up6gve0dFs2ehci0rmKL0D/5/hgKoY8N9wvFR28A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736023648; c=relaxed/relaxed;
	bh=pEWb6LulazKFYWIeQv81Tl6r0XKE/Ti8AjTB/gEGJtU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HdZsGGs7RPjh7lGK9Ca5US6m/xXf+QSMUXI0owdXszTZ5vTiRhVF05Eeo5/3QeSkhQAeDXCERo5TXWXtb6mXEwYH44t0qpu55mJWLUBfN3mK7kTpeHRrycidl1/0bFhZ7FP1CnqPyq0nfrzH2tRIIcVwRQCj7mUb5yHggu1nxrmC6GFwMfRlpE6antZTIC8SST6/JvCYIf1Pj5A5EJZx3M5IvxG+I2cvZQm4+nTrb6sZPdVOPic8U8BhpdA0qbemEhlMbpMgPjiPlHOozkHkkw6r5Tdy3ZnmrHprtqJcp5NF91VoZ27zhd2vVItNAhjHjx+q4k6NTGfOBXa9nRQa+g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Tp+gXvkt; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Tp+gXvkt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YQXZ75h0mz2ynn
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  5 Jan 2025 07:47:27 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 504CvaY1004647;
	Sat, 4 Jan 2025 20:47:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=pEWb6LulazKFYWIeQ
	v81Tl6r0XKE/Ti8AjTB/gEGJtU=; b=Tp+gXvkt60ThAsH1a/lq2GtCQIPqeP6OH
	UrmMBhQCbhN9whBBy+WCP0Fjc5hJ8X+kkAdrHy3bW3sqeaP9E1CHqDe0/ib3FwOH
	RxgeJCz/3GJiJQHiF0Y4yeduoliLemXcYsw/d0DJC//BwOZNphHshIcCUvnQpbAs
	b0x2h+8VBwY1inVPddCsyx4g0U3vK0o5nMDFw9Nym8XxBq00QLq5QrTTb0V9rT8L
	w1VNJoEXCtnoRvVSGyYSQ/Qn0ipx1aUYSW0m4ZWzLTjzG3/0OPz1F5Vt49tGVXoy
	LIK+2VwxEmbbPIziGwFd/IA92ZlyQBSsJbdrE9q1xneMy4sgU7EgA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43xwfbadje-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 04 Jan 2025 20:47:21 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 504KlKR1007238;
	Sat, 4 Jan 2025 20:47:20 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43xwfbadja-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 04 Jan 2025 20:47:20 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 504K1RDS026999;
	Sat, 4 Jan 2025 20:47:19 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([172.16.1.71])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 43txc2bcvy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 04 Jan 2025 20:47:19 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com [10.39.53.230])
	by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 504KlGCS47579598
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 4 Jan 2025 20:47:16 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 51C715805A;
	Sat,  4 Jan 2025 20:47:16 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4029558054;
	Sat,  4 Jan 2025 20:47:15 +0000 (GMT)
Received: from li-4910aacc-2eed-11b2-a85c-d93b702d4d28.ibm.com.com (unknown [9.61.16.236])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Sat,  4 Jan 2025 20:47:15 +0000 (GMT)
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        msuchanek@suse.de, mahesh@linux.ibm.com, tyreld@linux.ibm.com,
        hbabu@us.ibm.com, haren@linux.ibm.com
Subject: [PATCH 5/6] powerpc/pseries: Add ibm,get-dynamic-sensor-state RTAS call support
Date: Sat,  4 Jan 2025 12:46:49 -0800
Message-ID: <20250104204652.388720-6-haren@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250104204652.388720-1-haren@linux.ibm.com>
References: <20250104204652.388720-1-haren@linux.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: SX1nCJma1vYYS2gM3G7BVewfo37-A8qa
X-Proofpoint-GUID: qR1FmBkGkEd1r5kqKd3QpxvAhpcEqMsN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 mlxlogscore=999 lowpriorityscore=0 impostorscore=0 suspectscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 spamscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501040181
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The RTAS call ibm,get-dynamic-sensor-state is used to get the
sensor state identified by the location code and the sensor
token. The librtas library provides an API
rtas_get_dynamic_sensor() which uses /dev/mem access for work
area allocation but is restricted under system lockdown.

This patch provides an interface with new ioctl
 PAPR_DYNAMIC_SENSOR_IOC_GET to the papr-indices character
driver which executes this HCALL and copies the sensor state
in the user specified ioctl buffer.

Refer PAPR 7.3.19 ibm,get-dynamic-sensor-state for more
information on this RTAS call.
- User input parameters to the RTAS call: location code string
  and the sensor token

Expose these interfaces to user space with a /dev/papr-indices
character device using the following programming model:
 int fd = open("/dev/papr-indices", O_RDWR);
 int ret = ioctl(fd, PAPR_DYNAMIC_SENSOR_IOC_GET,
		struct papr_indices_io_block)
  - The user space specifies input parameters in
    papr_indices_io_block struct
  - Returned state for the specified sensor is copied to
    papr_indices_io_block.dynamic_param.state

Signed-off-by: Haren Myneni <haren@linux.ibm.com>
---
 arch/powerpc/include/asm/rtas.h               |  1 +
 arch/powerpc/kernel/rtas.c                    |  2 +-
 arch/powerpc/platforms/pseries/papr-indices.c | 64 +++++++++++++++++++
 3 files changed, 66 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/rtas.h b/arch/powerpc/include/asm/rtas.h
index 2da52f59e4c6..fcd822f0e1d7 100644
--- a/arch/powerpc/include/asm/rtas.h
+++ b/arch/powerpc/include/asm/rtas.h
@@ -517,6 +517,7 @@ extern unsigned long rtas_rmo_buf;
 extern struct mutex rtas_ibm_get_vpd_lock;
 extern struct mutex rtas_ibm_get_indices_lock;
 extern struct mutex rtas_ibm_set_dynamic_indicator_lock;
+extern struct mutex rtas_ibm_get_dynamic_sensor_state_lock;
 
 #define GLOBAL_INTERRUPT_QUEUE 9005
 
diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index 88fa416730af..a4848e7f248e 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -92,12 +92,12 @@ struct rtas_function {
  * Per-function locks for sequence-based RTAS functions.
  */
 static DEFINE_MUTEX(rtas_ibm_activate_firmware_lock);
-static DEFINE_MUTEX(rtas_ibm_get_dynamic_sensor_state_lock);
 static DEFINE_MUTEX(rtas_ibm_lpar_perftools_lock);
 static DEFINE_MUTEX(rtas_ibm_physical_attestation_lock);
 DEFINE_MUTEX(rtas_ibm_get_vpd_lock);
 DEFINE_MUTEX(rtas_ibm_get_indices_lock);
 DEFINE_MUTEX(rtas_ibm_set_dynamic_indicator_lock);
+DEFINE_MUTEX(rtas_ibm_get_dynamic_sensor_state_lock);
 
 static struct rtas_function rtas_function_table[] __ro_after_init = {
 	[RTAS_FNIDX__CHECK_EXCEPTION] = {
diff --git a/arch/powerpc/platforms/pseries/papr-indices.c b/arch/powerpc/platforms/pseries/papr-indices.c
index 30dfd928d192..079e01d0427c 100644
--- a/arch/powerpc/platforms/pseries/papr-indices.c
+++ b/arch/powerpc/platforms/pseries/papr-indices.c
@@ -438,6 +438,64 @@ static long papr_dynamic_indicator_ioc_set(struct papr_indices_io_block __user *
 	return ret;
 }
 
+/**
+ * papr_dynamic_sensor_ioc_get - ibm,get-dynamic-sensor-state RTAS Call
+ * PAPR 2.13 7.3.19
+ *
+ * @ubuf: Input parameters to RTAS call such as sensor token
+ *        Copies the state in user space buffer.
+ *
+ *
+ * Returns success or -errno.
+ */
+
+static long papr_dynamic_sensor_ioc_get(struct papr_indices_io_block __user *ubuf)
+{
+	struct papr_indices_io_block kbuf;
+	struct rtas_work_area *work_area;
+	s32 fwrc, token, ret;
+	u32 rets;
+
+	token = rtas_function_token(RTAS_FN_IBM_GET_DYNAMIC_SENSOR_STATE);
+	if (token == RTAS_UNKNOWN_SERVICE)
+		return -ENOENT;
+
+	mutex_lock(&rtas_ibm_get_dynamic_sensor_state_lock);
+	work_area = papr_dynamic_indice_buf_from_user(ubuf, &kbuf);
+	if (IS_ERR(work_area))
+		return PTR_ERR(work_area);
+
+	do {
+		fwrc = rtas_call(token, 2, 2, &rets,
+				kbuf.dynamic_param.token,
+				rtas_work_area_phys(work_area));
+	} while (rtas_busy_delay(fwrc));
+
+	rtas_work_area_free(work_area);
+	mutex_unlock(&rtas_ibm_get_dynamic_sensor_state_lock);
+
+	switch (fwrc) {
+	case RTAS_IBM_DYNAMIC_INDICE_SUCCESS:
+		if (put_user(rets, &ubuf->dynamic_param.state))
+			ret = -EFAULT;
+		else
+			ret = 0;
+		break;
+	case RTAS_IBM_DYNAMIC_INDICE_NO_INDICATOR:	/* No such indicator */
+		ret = -EOPNOTSUPP;
+		break;
+	default:
+		pr_err("unexpected ibm,get-dynamic-sensor result %d\n",
+				fwrc);
+		fallthrough;
+	case RTAS_IBM_DYNAMIC_INDICE_HW_ERROR:	/* Hardware/platform error */
+		ret = -EIO;
+		break;
+	}
+
+	return ret;
+}
+
 /*
  * Top-level ioctl handler for /dev/papr-indices.
  */
@@ -451,6 +509,9 @@ static long papr_indices_dev_ioctl(struct file *filp, unsigned int ioctl,
 	case PAPR_INDICES_IOC_GET:
 		ret = papr_indices_create_handle(argp);
 		break;
+	case PAPR_DYNAMIC_SENSOR_IOC_GET:
+		ret = papr_dynamic_sensor_ioc_get(argp);
+		break;
 	case PAPR_DYNAMIC_INDICATOR_IOC_SET:
 		if (filp->f_mode & FMODE_WRITE)
 			ret = papr_dynamic_indicator_ioc_set(argp);
@@ -483,6 +544,9 @@ static __init int papr_indices_init(void)
 	if (!rtas_function_implemented(RTAS_FN_IBM_SET_DYNAMIC_INDICATOR))
 		return -ENODEV;
 
+	if (!rtas_function_implemented(RTAS_FN_IBM_GET_DYNAMIC_SENSOR_STATE))
+		return -ENODEV;
+
 	return misc_register(&papr_indices_dev);
 }
 machine_device_initcall(pseries, papr_indices_init);
-- 
2.43.5


