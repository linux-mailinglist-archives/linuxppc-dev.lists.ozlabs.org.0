Return-Path: <linuxppc-dev+bounces-4662-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08175A016C8
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Jan 2025 21:47:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YQXZ62QNJz30Gq;
	Sun,  5 Jan 2025 07:47:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736023646;
	cv=none; b=ff8cdrE8OG8y8wp75gsMv/mjoQoXPRksn01KZ9EP+Yd4fzkcPriSS+qBPgaF0Tv3ZKXZ41PZUYwrQZswoZMCZ+NGRPnS114V/vGpxlX5yBNcZQPpdIxDDXF5rtNtZgkqtE7t6G4BJqKU8L6SPYIDsLDJFc5xLfC9pLAO97K5nojX6ADrgAAYWA6cMle1B2pLEsCmisO0HijDRSBbZromR9FjW3Jg3IElXXpfalbc6ENUo59L7XLXuS/ggqnsrltLmnkZyemnoBbhzCsk3Yw2ceM+NCItMS3ESKQYC4ezYVF9HI8X3lxYOLq5/mkJjE4IkQLUbDFBs9iv71mtNV40ug==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736023646; c=relaxed/relaxed;
	bh=nYEu2SgD5cczr1D6JIJPJSbgbOPyYwUWKYidffD5E4Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KBSVV9lDUeldXIkCb5LapBKDFtfxSWq5H0KpTFVq+hYAdfdC4uP7YoVgKDGbXWtfEA4OOKCkpztEWR4B9bBYzYt/iWdbHgvYV/Sz6TcsD7TlZI8kiEEjbiaCdYXoLyqLmgthN3Jz291W39Mlqgr75JocmnZ/Hq1fXV6ibXHAdMK/kOExsv4y2VOSatW4jkHUpZ8hK5FdT9aW6KL7214+3pqzcDI0sIqmu1xlggqxAI/arfMqfEKNJxGs0+l/2JrNzeHGUc5fCQcHu5+yD9CcxzSqY94iTJ99CGTcrU9ai5wqVayfT7oickmB92bw0AmuKzeM1YVg/K7uk+sIBIGW7Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tAMW0po1; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tAMW0po1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YQXZ54cvyz2ynn
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  5 Jan 2025 07:47:25 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 504Eqhs1032102;
	Sat, 4 Jan 2025 20:47:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=nYEu2S
	gD5cczr1D6JIJPJSbgbOPyYwUWKYidffD5E4Q=; b=tAMW0po11vZS+Nn9wTmyUd
	wUsmVVqgREpNrfjQEZueh1kqQS9108cFDu+7G0MFFEf6hrrtjSS7rvqBNVTIjyVE
	/EJej2pIGzNfXjwaA5QwZSit/hOw/qmvAd/75oKKg5o8XOJbRKJ9jhSHiFOVAZGu
	vi06dQOL7QnhiaSo1ypcj4HgAuZr8TBGiFMtlPi7iqkccJE3UGi2bD+EPotEhvga
	sv1MqCa5l3ND2Dev9/werYm3hDh1ORD81KOu1xnajd2oqiRr2bnyZqX1tA9gPxSI
	8n/zPB+IePS4Tb0agWhZJIdbhEpDe/l1hvWVnouMf9me0GDW6M4mqPu1qBwgBkWg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43xwfgjdm4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 04 Jan 2025 20:47:18 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 504KlI3X030991;
	Sat, 4 Jan 2025 20:47:18 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43xwfgjdm0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 04 Jan 2025 20:47:18 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 504JAorM016708;
	Sat, 4 Jan 2025 20:47:17 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 43tw5kumd5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 04 Jan 2025 20:47:17 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com [10.39.53.230])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 504KlEcp56492300
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 4 Jan 2025 20:47:14 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 065855805A;
	Sat,  4 Jan 2025 20:47:14 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DBA2E58054;
	Sat,  4 Jan 2025 20:47:12 +0000 (GMT)
Received: from li-4910aacc-2eed-11b2-a85c-d93b702d4d28.ibm.com.com (unknown [9.61.16.236])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Sat,  4 Jan 2025 20:47:12 +0000 (GMT)
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        msuchanek@suse.de, mahesh@linux.ibm.com, tyreld@linux.ibm.com,
        hbabu@us.ibm.com, haren@linux.ibm.com
Subject: [PATCH 4/6] powerpc/pseries: Add ibm,set-dynamic-indicator RTAS call support
Date: Sat,  4 Jan 2025 12:46:48 -0800
Message-ID: <20250104204652.388720-5-haren@linux.ibm.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ag4-nQifXFyGAqh3YI2fg3a5R7PiS8GS
X-Proofpoint-ORIG-GUID: mshQXhv3mx1fFt4P8BaGOu2_87EuACJi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=999 adultscore=0 suspectscore=0 mlxscore=0
 phishscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501040181
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
 arch/powerpc/platforms/pseries/papr-indices.c | 119 ++++++++++++++++++
 3 files changed, 121 insertions(+), 1 deletion(-)

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
index d73aa329bd70..30dfd928d192 100644
--- a/arch/powerpc/platforms/pseries/papr-indices.c
+++ b/arch/powerpc/platforms/pseries/papr-indices.c
@@ -27,6 +27,15 @@
 #define RTAS_IBM_GET_INDICES_MORE_DATA   1 /* More data is available. */
 #define RTAS_IBM_GET_INDICES_START_OVER -4 /* Indices list changed, restart call sequence. */
 
+/*
+ * Function-specific return values for ibm,set-dynamic-indicator and
+ * ibm,get-dynamic-sensor-state RTAS calls, drived from PAPR+
+ * v2.13 7.3.18 and 7.3.19.
+ */
+#define RTAS_IBM_DYNAMIC_INDICE_SUCCESS		0
+#define RTAS_IBM_DYNAMIC_INDICE_HW_ERROR	-1
+#define RTAS_IBM_DYNAMIC_INDICE_NO_INDICATOR	-3
+
 /**
  * struct rtas_ibm_get_indices_params - Parameters (in and out) for
  *                                      ibm,get-indices.
@@ -328,6 +337,107 @@ static long papr_indices_create_handle(struct papr_indices_io_block __user *ubuf
 	return fd;
 }
 
+/**
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
+	if (IS_ERR(work_area))
+		return PTR_ERR(work_area);
+
+	do {
+		fwrc = rtas_call(token, 3, 1, NULL,
+				kbuf.dynamic_param.token,
+				kbuf.dynamic_param.state,
+				rtas_work_area_phys(work_area));
+	} while (rtas_busy_delay(fwrc));
+
+	rtas_work_area_free(work_area);
+	mutex_unlock(&rtas_ibm_set_dynamic_indicator_lock);
+
+	switch (fwrc) {
+	case RTAS_IBM_DYNAMIC_INDICE_SUCCESS:
+		ret = 0;
+		break;
+	case RTAS_IBM_DYNAMIC_INDICE_NO_INDICATOR:	/* No such indicator */
+		ret = -EOPNOTSUPP;
+		break;
+	default:
+		pr_err("unexpected ibm,set-dynamic-indicator result %d\n",
+			fwrc);
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
@@ -341,6 +451,12 @@ static long papr_indices_dev_ioctl(struct file *filp, unsigned int ioctl,
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
@@ -364,6 +480,9 @@ static __init int papr_indices_init(void)
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


