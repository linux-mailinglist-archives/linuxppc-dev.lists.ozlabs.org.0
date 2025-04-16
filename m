Return-Path: <linuxppc-dev+bounces-7719-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 01134A90F07
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Apr 2025 00:58:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZdGdw4Yvwz3c3K;
	Thu, 17 Apr 2025 08:58:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744844292;
	cv=none; b=cW27g/KsJu+tXjoJcSqcMooN2ugjZNsIVVW6b8G8E3n4TX6p+PA0CPTRAvV8zVNnukbm3kU+9wEC+jDcGIzzXM9hXLin0fUgeHzUYhNMWr+lpW2Mhu7tqXXSvrJ7+mEh11RSoDVqn5VB1DV+dtfxK8qWa274SqpXBBpfADLdfcG8BPZX2Clnvy/KeiWJjgm7wqF55fisBhs6Mgh/OWBIRZURcYigozJXD55CugV1yEuI5H0vRD24CIw5FpP6QtYX4OtzcrUpxfA0usgFmGIWYamj6nOaNWrRtinVsl3YY1yDRowS4RlcrwI6RnduY1qOoqqzqtqWLhP2UHbZ0ygrZg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744844292; c=relaxed/relaxed;
	bh=YHRigfLltT+bSaFg6++ia9EJ9e6MDcInI530A5FL07U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M2p5XktNnGYXTB05ZPwk9r1nZqof7aMVJ/Wgg0vdphYuYo+P3QUZl3cJpkH+curZVvGmPqso0GYRT63Wr+S4LLr4YqiGFTxiLkEn3JYkGINgv8cu6pzML20CJHBo2wkFxsZ1CSk50XdAD0BIAY0XFToMNcf0mEGxQukoE4Be2fpcZP6IpsVF+BUnJaDawe4pbqu7XPgStDSs6tCPNwiSJGJWsJ1AasBSW2RCRdzvRgX9H8ME7s/ar50XBsSd3fJHTScil+TDyRhQ+bMvFkx2cdERYW7NPnmJtR/UvWuIXfMhhiA9bHDTV84da1Q7eNzY+pNTMMcQALdVnnOENo8zxw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LnNR5/Ck; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LnNR5/Ck;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZdGdv5P8lz3c3H
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Apr 2025 08:58:11 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53GLW7lF018976;
	Wed, 16 Apr 2025 22:58:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=YHRigfLltT+bSaFg6
	++ia9EJ9e6MDcInI530A5FL07U=; b=LnNR5/CkvZZl8N2AuLWjMcy0ImBHwdYZq
	T8XVJsyhZ3vr5FE0Js6ykQibeVlUglFPWspW+pPFMyAyaYwcZaTWnb/ms0YBytR+
	SPFevJsAqd0Rvj36zP1bIdhhpeTHjJpfbmK6+gwsH7PHJEI7EalLDOhsXirpV/12
	oJl8YWsVUrZPuH7gOkZf0TB4nFCwwpUZ29mWIobYsMU9AGbvKNxDeU0gEQH+t+Yy
	0Lo6kwNWfaDK+i8aZPuq4d1lub+kWLmFpsxY7ak1rgq8jbe2dY0xis5sY/gQR4k0
	dOfwT4tG44DA4u+ZlQ5N2WxYpbRwd/7blqCdURKCg4i27ShLXxKww==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 462mhu08r9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Apr 2025 22:58:03 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53GMw3O4023835;
	Wed, 16 Apr 2025 22:58:03 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 462mhu08r5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Apr 2025 22:58:02 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53GMHRUP017204;
	Wed, 16 Apr 2025 22:58:01 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 46040m2khw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Apr 2025 22:58:01 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53GMvwTr12059344
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Apr 2025 22:57:59 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D536D58057;
	Wed, 16 Apr 2025 22:57:58 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EFDBB5805D;
	Wed, 16 Apr 2025 22:57:57 +0000 (GMT)
Received: from li-4910aacc-2eed-11b2-a85c-d93b702d4d28.ibm.com.com (unknown [9.61.110.97])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 16 Apr 2025 22:57:57 +0000 (GMT)
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        msuchanek@suse.de, mahesh@linux.ibm.com, tyreld@linux.ibm.com,
        hbabu@us.ibm.com, haren@linux.ibm.com, sv@linux.ibm.com
Subject: [PATCH v10 5/7] powerpc/pseries: Add ibm,get-dynamic-sensor-state RTAS call support
Date: Wed, 16 Apr 2025 15:57:40 -0700
Message-ID: <20250416225743.596462-6-haren@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250416225743.596462-1-haren@linux.ibm.com>
References: <20250416225743.596462-1-haren@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=Hvd2G1TS c=1 sm=1 tr=0 ts=680035fb cx=c_pps a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17 a=XR8D0OoHHMoA:10 a=VnNF1IyMAAAA:8 a=jcsyh7huxqttTu1n34cA:9
X-Proofpoint-ORIG-GUID: SofM7QnoRIRM95dQ-FqDnzQkYma-BaAD
X-Proofpoint-GUID: wH1Fnxxmo1C11L9LqHAFJDcik4lhOUbH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_09,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 spamscore=0 mlxlogscore=999 suspectscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 impostorscore=0 mlxscore=0
 phishscore=0 priorityscore=1501 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504160180
X-Spam-Status: No, score=-1.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

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
Tested-by: Sathvika Vasireddy <sv@linux.ibm.com>
---
 arch/powerpc/include/asm/rtas.h               |  1 +
 arch/powerpc/kernel/rtas.c                    |  2 +-
 arch/powerpc/platforms/pseries/papr-indices.c | 67 +++++++++++++++++++
 3 files changed, 69 insertions(+), 1 deletion(-)

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
index e497b3b95ef2..2aab71481da3 100644
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
index c46b728d5f47..3c7545591c45 100644
--- a/arch/powerpc/platforms/pseries/papr-indices.c
+++ b/arch/powerpc/platforms/pseries/papr-indices.c
@@ -371,6 +371,67 @@ static long papr_dynamic_indicator_ioc_set(struct papr_indices_io_block __user *
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
+	if (IS_ERR(work_area)) {
+		ret = PTR_ERR(work_area);
+		goto out;
+	}
+
+	do {
+		fwrc = rtas_call(token, 2, 2, &rets,
+				kbuf.dynamic_param.token,
+				rtas_work_area_phys(work_area));
+	} while (rtas_busy_delay(fwrc));
+
+	rtas_work_area_free(work_area);
+
+	switch (fwrc) {
+	case RTAS_SUCCESS:
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
+	case RTAS_HARDWARE_ERROR:	/* Hardware/platform error */
+		ret = -EIO;
+		break;
+	}
+
+out:
+	mutex_unlock(&rtas_ibm_get_dynamic_sensor_state_lock);
+	return ret;
+}
+
 /*
  * Top-level ioctl handler for /dev/papr-indices.
  */
@@ -384,6 +445,9 @@ static long papr_indices_dev_ioctl(struct file *filp, unsigned int ioctl,
 	case PAPR_INDICES_IOC_GET:
 		ret = papr_indices_create_handle(argp);
 		break;
+	case PAPR_DYNAMIC_SENSOR_IOC_GET:
+		ret = papr_dynamic_sensor_ioc_get(argp);
+		break;
 	case PAPR_DYNAMIC_INDICATOR_IOC_SET:
 		if (filp->f_mode & FMODE_WRITE)
 			ret = papr_dynamic_indicator_ioc_set(argp);
@@ -416,6 +480,9 @@ static __init int papr_indices_init(void)
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


