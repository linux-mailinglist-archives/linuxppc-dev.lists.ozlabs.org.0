Return-Path: <linuxppc-dev+bounces-6213-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF69A36C1A
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Feb 2025 06:14:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YvxsM0qsXz30Gq;
	Sat, 15 Feb 2025 16:13:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739596423;
	cv=none; b=SVCXMTN9gz+yAswFF6ghra4PEH0ziThVz0rE2G3zCrNbbIU6w5T78Ed7Dq5ynP26k+9ceQ5GLBmI1msz3DlRQNCZ/6pkaddLKv5iYtDK77k9PPW8HKG1TFYDazosZh+o/ZJrwrPlHizyz3Zzlfgt8dzvCk3si/5Jtc5cCjlM+effRkLVFRWbhyaTqGJ8aSDb5kgaN1LMsy0bmr+QyV6ZD+g/sVWlpYb0SfjCZKsSngZ+Vy/89o3qddfLjeKtAo6Bloamdy0tx0vLQ+s/gqP9xLAyD7vH+jPPxUt8fbhJJmdoi4Bj/mU0S4x8bSVy3XLyQMB7Uh7yleL9x5/DFU0DyA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739596423; c=relaxed/relaxed;
	bh=qf+GiXcS+H6spnP4Ee5W/euiIsd4BpwDjW/CZx9ZshY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JMzh9aU23Gd1T2tMG7NTN5ia0RvQKRop+kSbL8B4j7bJM5clmC/zdEl0urOknNzJWmsi57mgZF8vYhSNua5vcLrL4gkO19zYzviGdBNCoa9NZTiUxnbrdQabhT1UFUDnKqvg9gbZ0Nser/rxuRNaYQArDg0/fExu1Sx/2zjg91W6AVpeU9H4QcVHK6bj+xWW7vuAMro4bmxnoUc7Eva/9DfRgHdXID37LgdXTQY/fuS8FAGRy4w4nXZ8H4XNeSSBewOkJdyT7nkv83eXl90laWnPmj1eCCaCSOCt2GhAv5tdrn1g1ZgTa3Y8XcigFiqMdZ2tGg7CclJ+0KC9GXwJ+g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pvDcC8lR; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pvDcC8lR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YvxsL3C2Wz2xtK
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Feb 2025 16:13:42 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51F30wfX029662;
	Sat, 15 Feb 2025 05:13:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=qf+GiX
	cS+H6spnP4Ee5W/euiIsd4BpwDjW/CZx9ZshY=; b=pvDcC8lR3rW8WpnkyRkdH1
	p5faFJRYknidnkhIHAohO09lhgfdDGTBrAcav4RIcVKjkPyPvhXGmz3sqnNIBFql
	DLDjGBk2BQE5v4DxEnpme1SVOzdU0tAURoef25nFGEpSEZbfjmB1zh/2U5tDYodR
	oRj/5F7mRSmlN1x6lZr7NlRafv4wgO8wE/R5xU8WmjxVUrdG+sQEaWGhY0ZcCZkw
	VNIi/BpeTaW6K44vJFV4QcZ4vTjTv/Um7TgoCOXlyW0YI07yg5y8g0CXbTVN0WMk
	zqNbJSNwjvFvCuMulCtnGkrWBoTj9+VKqFqy4mG6LwlCXScHG4feyExNj3BUV6iQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44tjn8gcsp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 15 Feb 2025 05:13:35 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 51F5DZkn024985;
	Sat, 15 Feb 2025 05:13:35 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44tjn8gcsj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 15 Feb 2025 05:13:35 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 51F32fgF021894;
	Sat, 15 Feb 2025 05:13:34 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([172.16.1.74])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 44phkt797k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 15 Feb 2025 05:13:34 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 51F5DV4l13697542
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 15 Feb 2025 05:13:31 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F35F458057;
	Sat, 15 Feb 2025 05:13:30 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AF87158059;
	Sat, 15 Feb 2025 05:13:28 +0000 (GMT)
Received: from li-4910aacc-2eed-11b2-a85c-d93b702d4d28.ibm.com.com (unknown [9.61.107.186])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Sat, 15 Feb 2025 05:13:28 +0000 (GMT)
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        msuchanek@suse.de, mahesh@linux.ibm.com, tyreld@linux.ibm.com,
        hbabu@us.ibm.com, haren@linux.ibm.com
Subject: [PATCH v6 4/7] powerpc/pseries: Add ibm,set-dynamic-indicator RTAS call support
Date: Fri, 14 Feb 2025 21:13:06 -0800
Message-ID: <20250215051310.243099-5-haren@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250215051310.243099-1-haren@linux.ibm.com>
References: <20250215051310.243099-1-haren@linux.ibm.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: IM_KSSCVU-ORPglOP7tZwTiNRk2LR0bZ
X-Proofpoint-ORIG-GUID: pFJFPm7SQlmehsxCJxsC95M2xUOiuGIM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-15_01,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 suspectscore=0 adultscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 spamscore=0 bulkscore=0 mlxlogscore=999 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502150041
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The RTAS call ibm,set-dynamic-indicator is used to set the new
indicator state identified by a location code. The current
implementation uses rtas_set_dynamic_indicator() API provided by
librtas library which allocates RMO buffer and issue this RTAS
call in the user space. But /dev/mem access by the user space
is prohibited under system lockdown.

This patch provides an interface with new ioctl
PAPR_DYNAMIC_INDICATOR_IOC_SET to the papr-indices character
driver and expose this interface to the user space that is
compatible with lockdown.

Refer PAPR 7.3.18 ibm,set-dynamic-indicator for more
information on this RTAS call.
-  User input parameters to the RTAS call: location code
   string, indicator token and new state

Expose these interfaces to user space with a /dev/papr-indices
character device using the following programming model:
 int fd = open("/dev/papr-indices", O_RDWR);
 int ret = ioctl(fd, PAPR_DYNAMIC_INDICATOR_IOC_SET,
		struct papr_indices_io_block)
  - The user space passes input parameters in papr_indices_io_block
    struct

Signed-off-by: Haren Myneni <haren@linux.ibm.com>
---
 arch/powerpc/include/asm/rtas.h               |   1 +
 arch/powerpc/kernel/rtas.c                    |   2 +-
 arch/powerpc/platforms/pseries/papr-indices.c | 120 ++++++++++++++++++
 3 files changed, 122 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/rtas.h b/arch/powerpc/include/asm/rtas.h
index 7dc527a5aaac..2da52f59e4c6 100644
--- a/arch/powerpc/include/asm/rtas.h
+++ b/arch/powerpc/include/asm/rtas.h
@@ -516,6 +516,7 @@ extern unsigned long rtas_rmo_buf;
 
 extern struct mutex rtas_ibm_get_vpd_lock;
 extern struct mutex rtas_ibm_get_indices_lock;
+extern struct mutex rtas_ibm_set_dynamic_indicator_lock;
 
 #define GLOBAL_INTERRUPT_QUEUE 9005
 
diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index 76c634b92cb2..88fa416730af 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -95,9 +95,9 @@ static DEFINE_MUTEX(rtas_ibm_activate_firmware_lock);
 static DEFINE_MUTEX(rtas_ibm_get_dynamic_sensor_state_lock);
 static DEFINE_MUTEX(rtas_ibm_lpar_perftools_lock);
 static DEFINE_MUTEX(rtas_ibm_physical_attestation_lock);
-static DEFINE_MUTEX(rtas_ibm_set_dynamic_indicator_lock);
 DEFINE_MUTEX(rtas_ibm_get_vpd_lock);
 DEFINE_MUTEX(rtas_ibm_get_indices_lock);
+DEFINE_MUTEX(rtas_ibm_set_dynamic_indicator_lock);
 
 static struct rtas_function rtas_function_table[] __ro_after_init = {
 	[RTAS_FNIDX__CHECK_EXCEPTION] = {
diff --git a/arch/powerpc/platforms/pseries/papr-indices.c b/arch/powerpc/platforms/pseries/papr-indices.c
index a68bcffd1815..a2003d8c710f 100644
--- a/arch/powerpc/platforms/pseries/papr-indices.c
+++ b/arch/powerpc/platforms/pseries/papr-indices.c
@@ -20,6 +20,13 @@
 #include <uapi/asm/papr-indices.h>
 #include "papr-rtas-common.h"
 
+/*
+ * Function-specific return values for ibm,set-dynamic-indicator and
+ * ibm,get-dynamic-sensor-state RTAS calls.
+ * PAPR+ v2.13 7.3.18 and 7.3.19.
+ */
+#define RTAS_IBM_DYNAMIC_INDICE_NO_INDICATOR	-3
+
 /**
  * struct rtas_get_indices_params - Parameters (in and out) for
  *                                      ibm,get-indices.
@@ -260,6 +267,110 @@ static long papr_indices_create_handle(struct papr_indices_io_block __user *ubuf
 	return fd;
 }
 
+/*
+ * Create work area with the input parameters. This function is used
+ * for both ibm,set-dynamic-indicator and ibm,get-dynamic-sensor-state
+ * RTAS Calls.
+ */
+static struct rtas_work_area *
+papr_dynamic_indice_buf_from_user(struct papr_indices_io_block __user *ubuf,
+				struct papr_indices_io_block *kbuf)
+{
+	struct rtas_work_area *work_area;
+	u32 length;
+	__be32 len_be;
+
+	if (copy_from_user(kbuf, ubuf, sizeof(*kbuf)))
+		return ERR_PTR(-EFAULT);
+
+
+	if (!string_is_terminated(kbuf->dynamic_param.location_code_str,
+			ARRAY_SIZE(kbuf->dynamic_param.location_code_str)))
+		return ERR_PTR(-EINVAL);
+
+	/*
+	 * The input data in the work area should be as follows:
+	 * - 32-bit integer length of the location code string,
+	 *   including NULL.
+	 * - Location code string, NULL terminated, identifying the
+	 *   token (sensor or indicator).
+	 * PAPR 2.13 - R1–7.3.18–5 ibm,set-dynamic-indicator
+	 *           - R1–7.3.19–5 ibm,get-dynamic-sensor-state
+	 */
+	/*
+	 * Length that user space passed should also include NULL
+	 * terminator.
+	 */
+	length = strlen(kbuf->dynamic_param.location_code_str) + 1;
+	if (length > LOC_CODE_SIZE)
+		return ERR_PTR(-EINVAL);
+
+	len_be = cpu_to_be32(length);
+
+	work_area = rtas_work_area_alloc(LOC_CODE_SIZE + sizeof(u32));
+	memcpy(rtas_work_area_raw_buf(work_area), &len_be, sizeof(u32));
+	memcpy((rtas_work_area_raw_buf(work_area) + sizeof(u32)),
+			&kbuf->dynamic_param.location_code_str, length);
+
+	return work_area;
+}
+
+/**
+ * papr_dynamic_indicator_ioc_set - ibm,set-dynamic-indicator RTAS Call
+ * PAPR 2.13 7.3.18
+ *
+ * @ubuf: Input parameters to RTAS call such as indicator token and
+ *        new state.
+ *
+ * Returns success or -errno.
+ */
+static long papr_dynamic_indicator_ioc_set(struct papr_indices_io_block __user *ubuf)
+{
+	struct papr_indices_io_block kbuf;
+	struct rtas_work_area *work_area;
+	s32 fwrc, token, ret;
+
+	token = rtas_function_token(RTAS_FN_IBM_SET_DYNAMIC_INDICATOR);
+	if (token == RTAS_UNKNOWN_SERVICE)
+		return -ENOENT;
+
+	mutex_lock(&rtas_ibm_set_dynamic_indicator_lock);
+	work_area = papr_dynamic_indice_buf_from_user(ubuf, &kbuf);
+	if (IS_ERR(work_area)) {
+		ret = PTR_ERR(work_area);
+		goto out;
+	}
+
+	do {
+		fwrc = rtas_call(token, 3, 1, NULL,
+				kbuf.dynamic_param.token,
+				kbuf.dynamic_param.state,
+				rtas_work_area_phys(work_area));
+	} while (rtas_busy_delay(fwrc));
+
+	rtas_work_area_free(work_area);
+
+	switch (fwrc) {
+	case RTAS_SUCCESS:
+		ret = 0;
+		break;
+	case RTAS_IBM_DYNAMIC_INDICE_NO_INDICATOR:	/* No such indicator */
+		ret = -EOPNOTSUPP;
+		break;
+	default:
+		pr_err("unexpected ibm,set-dynamic-indicator result %d\n",
+			fwrc);
+		fallthrough;
+	case RTAS_HARDWARE_ERROR:	/* Hardware/platform error */
+		ret = -EIO;
+		break;
+	}
+
+out:
+	mutex_unlock(&rtas_ibm_set_dynamic_indicator_lock);
+	return ret;
+}
+
 /*
  * Top-level ioctl handler for /dev/papr-indices.
  */
@@ -273,6 +384,12 @@ static long papr_indices_dev_ioctl(struct file *filp, unsigned int ioctl,
 	case PAPR_INDICES_IOC_GET:
 		ret = papr_indices_create_handle(argp);
 		break;
+	case PAPR_DYNAMIC_INDICATOR_IOC_SET:
+		if (filp->f_mode & FMODE_WRITE)
+			ret = papr_dynamic_indicator_ioc_set(argp);
+		else
+			ret = -EBADF;
+		break;
 	default:
 		ret = -ENOIOCTLCMD;
 		break;
@@ -296,6 +413,9 @@ static __init int papr_indices_init(void)
 	if (!rtas_function_implemented(RTAS_FN_IBM_GET_INDICES))
 		return -ENODEV;
 
+	if (!rtas_function_implemented(RTAS_FN_IBM_SET_DYNAMIC_INDICATOR))
+		return -ENODEV;
+
 	return misc_register(&papr_indices_dev);
 }
 machine_device_initcall(pseries, papr_indices_init);
-- 
2.43.5


