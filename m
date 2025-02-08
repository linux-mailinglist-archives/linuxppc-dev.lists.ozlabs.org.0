Return-Path: <linuxppc-dev+bounces-5978-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE215A2D337
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Feb 2025 03:48:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YqZyC2J0vz30Wj;
	Sat,  8 Feb 2025 13:47:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738982867;
	cv=none; b=F5/E04L4CZoQJL2X05H5OUNPfVZkjWeZyfFLmqxvB2l4yvKgkf+rxKwE/c79Q2KiS/kCGwGzEMogRSmwEAtlfz4evYqrP3dAQ4hGHWQLasVMcPcyb1E0FuhjXL3808R7Yb2gRw5CJF+t0NOpk6aE+9t9BVTCSJ9TSvu7jvX/5ZAIjAuHdPdx3sO/MDXKLr7VEbh2otTBdk8RRI3LvkW7K6V7wBMAXbZUKOrylrXJB2zZ6bo+GqPvcb/kEki1oRZJ9heBUYvQ4+gDCY/ua1jc0nw020/6uHWrpt5j87zYU2Ep5PVIDq3g74yqkaiZ3+cCNRvWGgc1Lc8u23LxB/RmgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738982867; c=relaxed/relaxed;
	bh=S9Z8n3RDZQm4wgocsWNQbKrGLiFfaRYR1UbG2LnIppI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ViVQ67WhXoGAT5R/ucDGzdOBnBZUthZ7jKY4c6xgVz2DIB5lR80T2cHa9dBy2Bquh5G0JNqATdKh+GplXf4yFDD4HdVcJ6Rf/rg0lIbolisycaq4lDyVm/NaX0Iqirj74OVDGrwT8FkXSqkbQKqmM5HeGAXT2pw//EFgvOB432IMH0/LAYQQMCPyqdK81+o4IS3Adcd/XVAGi0IbyQz8msJnvg4QBVV8cOnVC8MilWbuiKTFSLFPmtx3xg/9bZjNksN7dF2xXv+BiaB9EqSMLafTP7Td3zEjMrGpY5+0XsGoXX8+4e0eFK5FHSlC4szzebPl2UOF1fTyuFoT3FRFYg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mkSb0Amw; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mkSb0Amw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YqZyB5RRwz2ypW
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Feb 2025 13:47:46 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5182kuF7003498;
	Sat, 8 Feb 2025 02:47:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=S9Z8n3RDZQm4wgocs
	WNQbKrGLiFfaRYR1UbG2LnIppI=; b=mkSb0AmwD3YGhWuOa+UWA3fHBSSxYsFMx
	/bOt0Xc+OVYA6id4RQoJg9Pnp2qnE6UliqwQB28IQdx9/IU2iiiWv5WKVpdXCKLw
	S2mJchSa6Ywrk1uaBoaHO6vi8ciMEC39Ljzj4pYcnPMVW+qKOVyDY8mV1+oGaHGU
	NErBkqU+VU/EnOLCQCG4zJ7NN5jrZN7nGx3qpYK1iyPJjTIAIcdYPbnaO9tJGT8w
	uYDNbBgWV48JyDwq2fzAllYhr3R9pdzGeXQaAua+J57LtTA3HD7kROhPIRcU1ZGS
	I6weQHMcF9+2pDH/gd3f68Vb7UK3ijUIJAHORccQhNN5of2kQwwYQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44nxs7804e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 08 Feb 2025 02:47:40 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5182ld7I005078;
	Sat, 8 Feb 2025 02:47:39 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44nxs7804a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 08 Feb 2025 02:47:39 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5181KDgq021489;
	Sat, 8 Feb 2025 02:47:38 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 44j0n1x5dr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 08 Feb 2025 02:47:38 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5182lZWN26280528
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 8 Feb 2025 02:47:35 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 11D3D5805A;
	Sat,  8 Feb 2025 02:47:35 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 43DE958051;
	Sat,  8 Feb 2025 02:47:34 +0000 (GMT)
Received: from li-4910aacc-2eed-11b2-a85c-d93b702d4d28.ibm.com.com (unknown [9.61.139.242])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Sat,  8 Feb 2025 02:47:34 +0000 (GMT)
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        msuchanek@suse.de, mahesh@linux.ibm.com, tyreld@linux.ibm.com,
        hbabu@us.ibm.com, haren@linux.ibm.com
Subject: [PATCH v5 5/7] powerpc/pseries: Add ibm,get-dynamic-sensor-state RTAS call support
Date: Fri,  7 Feb 2025 18:47:15 -0800
Message-ID: <20250208024719.8550-6-haren@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250208024719.8550-1-haren@linux.ibm.com>
References: <20250208024719.8550-1-haren@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: pHEt3BEJgdxPBbqcKiT-5WQAxBMybhqx
X-Proofpoint-GUID: uaA4C9RsUK6h77gPqQ6m7Uc3_6AkRcbu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-07_11,2025-02-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 malwarescore=0 mlxlogscore=999
 impostorscore=0 adultscore=0 mlxscore=0 bulkscore=0 lowpriorityscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502080017
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
index a2003d8c710f..a2544f0b60fe 100644
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


