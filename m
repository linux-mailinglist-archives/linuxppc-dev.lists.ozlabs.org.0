Return-Path: <linuxppc-dev+bounces-6835-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 58130A5888D
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Mar 2025 22:40:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z9tht4q2Hz2yN2;
	Mon, 10 Mar 2025 08:39:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741556382;
	cv=none; b=LxD0mpezpsH4WxlLmdZpLxbw8rkw7YD+1RhpL3xU8OE2pJhimdxvQaX4Hwpfr6hrMrdgD8qL056lV4ux3Ysnjs2RWJSB6fGe33x/yNeihMlKzUPeFD3tpiACf7a1y3g13pTvcGvvBAnKPWjwmi0ustNBpuvzAX2no1jWXOtUKO4QZk1y4MsgiNEsLMhDiOprvUZGwuiWhtGLgZFgZVDkt/XzlSUM/UYadqjNJVI9h9qNZ6ncqlbzJAssBMzZTH1+qgvCnhsXyNHNVmoY6/zKyHgi8iWVM8qDUr72E+f30u5pi/BCAO4ug4bc2cNtAZqyEGiXt5EIsqtG3Mm2a2IJ8w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741556382; c=relaxed/relaxed;
	bh=3/jEEohws/beUp57mkOSHpsdiC1CHE/97immht4jGbE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KiaTjou9g0JiY8a8TItjFBPw5nC6A3sZFj6UOYTlmNy8tFbCyhIdusMsKE/PeXVEyjrDKpVyOM2Gtk0TZaAwsV4s26rw+YekrAhjEaRZATSOFZShwlNvdhhKByrVnxOu0R1VCAjchU0rV99Pla+6dYpAc1rpKBq6ZS7wfGQ0+FB3W78IH7XZTmrxiGEEy7lxvwmrWhgeIHUvXA6G8odHLDULlMXiqVsaMy1nfS5R8WrWSNyGIxhKxBFgtoYxPoQeWcc3qdIRohxUFH6k3ZHaRD7w3qQGccUvqCtxnkWpSOGDkPJ1nDowKL3p0TFsio0uXPLBJyD+0D7+2BtY07VCVA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CBfEigg2; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CBfEigg2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z9ths5YmHz30Vw
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Mar 2025 08:39:41 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 529Kdr0v018882;
	Sun, 9 Mar 2025 21:39:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=3/jEEohws/beUp57m
	kOSHpsdiC1CHE/97immht4jGbE=; b=CBfEigg2482q+tgi5Ch2kYUweJweG4Bvw
	8VRql6HIzfJ2znVaZYa7Smzv1Z2fl0lNOEdlUoJ/YvoIINeu63O7TQohexkNojNR
	Ksamairg4wWKnOQ7hXPA4Tz3nuIuXaeXktw7BAIeFKng0j9mMV7xyOEGB4kc6QHX
	Aori/RQdbt4RaEP++h19Wg2tA1a5999xiFZHeMtX8R18dPgjBwQo5f/HPy8mTBRA
	QgmFu5MF+SYDFEfGOznortONM9pFfkU2dmVQXaCMT5HomAtXEzZ9bAeJ5qcbu1GM
	g4qU3mTiBzr1X05AO6IkSYCFxFW5L9gAizrRY95lj78QsG05pHaIQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 459j6yg49g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 09 Mar 2025 21:39:34 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 529LdX8h013565;
	Sun, 9 Mar 2025 21:39:33 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 459j6yg49d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 09 Mar 2025 21:39:33 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 529L1YvB022294;
	Sun, 9 Mar 2025 21:39:33 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([172.16.1.74])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 45917n3mj3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 09 Mar 2025 21:39:33 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 529LdU8l26084072
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 9 Mar 2025 21:39:30 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5B1DF58056;
	Sun,  9 Mar 2025 21:39:30 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 840B35803F;
	Sun,  9 Mar 2025 21:39:29 +0000 (GMT)
Received: from li-4910aacc-2eed-11b2-a85c-d93b702d4d28.ibm.com.com (unknown [9.61.54.66])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Sun,  9 Mar 2025 21:39:29 +0000 (GMT)
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        msuchanek@suse.de, mahesh@linux.ibm.com, tyreld@linux.ibm.com,
        hbabu@us.ibm.com, haren@linux.ibm.com, sv@linux.ibm.com
Subject: [PATCH v7 5/7] powerpc/pseries: Add ibm,get-dynamic-sensor-state RTAS call support
Date: Sun,  9 Mar 2025 14:39:13 -0700
Message-ID: <20250309213916.762116-6-haren@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250309213916.762116-1-haren@linux.ibm.com>
References: <20250309213916.762116-1-haren@linux.ibm.com>
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
X-Proofpoint-GUID: co16eU4SoAZGl9fqK5hsxKVDeNYX5SWI
X-Proofpoint-ORIG-GUID: _yT2lX9ohu18bI-5GWFfkkrFyXZGaKn6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-09_08,2025-03-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 mlxscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2503090171
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
index a5f344cc2e53..fb4586bf3c69 100644
--- a/arch/powerpc/platforms/pseries/papr-indices.c
+++ b/arch/powerpc/platforms/pseries/papr-indices.c
@@ -372,6 +372,67 @@ static long papr_dynamic_indicator_ioc_set(struct papr_indices_io_block __user *
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
@@ -385,6 +446,9 @@ static long papr_indices_dev_ioctl(struct file *filp, unsigned int ioctl,
 	case PAPR_INDICES_IOC_GET:
 		ret = papr_indices_create_handle(argp);
 		break;
+	case PAPR_DYNAMIC_SENSOR_IOC_GET:
+		ret = papr_dynamic_sensor_ioc_get(argp);
+		break;
 	case PAPR_DYNAMIC_INDICATOR_IOC_SET:
 		if (filp->f_mode & FMODE_WRITE)
 			ret = papr_dynamic_indicator_ioc_set(argp);
@@ -417,6 +481,9 @@ static __init int papr_indices_init(void)
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


