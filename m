Return-Path: <linuxppc-dev+bounces-6917-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8483AA5D2B3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Mar 2025 23:51:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZC8BW4RHyz30dt;
	Wed, 12 Mar 2025 09:51:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741733475;
	cv=none; b=WMZ73u3B9frWze9TIzfjbWUT9QWjbD4yfHu2eXJpmo1qWiTQmT3xYnpyly6KbLwPhqM+PmCfA8BHTWC7V2bzljMVOCLMwAYssVYEllVA+vhgYounp7yGpnD3jDbjMEluC8mvNuxhMDO3hOMcqzpmmlQ9YRpa5py25MEwBCL2IVghBYiovvVqPhJIWjVrCqy30Z1nuHFNRdFNDIPd0U2K66mwiEsXkTfb/fwwz458VDHZARbk+BY76IXZCFE2E33gQA1psBwC0Vgk8+JuSeqgAYGMrRvKP991sDvLaga/seOiJjKKnwFlq21y/Jti2XHS3jQiFD9mMt7Ou4JVBx65rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741733475; c=relaxed/relaxed;
	bh=PN0dRpgUXpxeLbJJP4fV7ZQk/Z8UO5cVk0NXXSjNqf8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PypBLLdgLxns2QxaGe3tuuYEyfGYNol+3jwpm8TMVxEsJLr4tvc/zK0Q3zGq2qcFKa3ld2capyxSpwomTtsgdsgdv64UPxC0b9numKWa0/XZ4kK0K2rJJrrK+2MZfAUc/f2DSf+HKOvZqlt4n3P4u5yxodS+BUTJXYgEbOAVtnCrrX/3cth97RFQIno4qaYUKqe1B7J5WZdHVi+GMbpYkCkbzNwO4PeFGq17EgvbepoVPjprIqwDA32i6J0zG3s163fGGn9iyjROY2Yy5jp9zNhTflwP2rZWCI7fsJC2QW+LggcSVHUfuIk2sIr4fnunnUV7K8tFKQnmfgI1uyecJQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OEj7e0kn; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OEj7e0kn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZC8BV3wTzz3btX
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Mar 2025 09:51:14 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52BJRhQr021901;
	Tue, 11 Mar 2025 22:51:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=PN0dRpgUXpxeLbJJP
	4fV7ZQk/Z8UO5cVk0NXXSjNqf8=; b=OEj7e0kn/4fAZggpEMUs+3+7P5aJWm5+d
	EtmnxasySHDbhjofdDSVQkuZUOoYyqeiZXKaCFx2WsbqeXMU8wx3yJ0lWf1hv7Uv
	wf4ie9JBOGekVNhYHYpADXjyH6QCXvuVIrd+8WpiTDx1mdYX5O9pJYjsUMB5CTU8
	Ffov5OMCZvYaEAdS4okJHejWBR52N+V7e2pzw3a6GB6sJ7wvY9YRbL2bos9Q/CFG
	SydipbO+qXbBY8kJeYt64El+hzeQ2dfExKyr2hluj3nOR6NI5ddTVyuwF8AxuCrH
	TXRmEek69O98fFEueT1HWoS/nhsoC3sMpuTZMecUX+7LlWzOqd0cg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45aubp8v2h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Mar 2025 22:51:07 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 52BMp7r8021932;
	Tue, 11 Mar 2025 22:51:07 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45aubp8v2f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Mar 2025 22:51:07 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 52BMGE7j003141;
	Tue, 11 Mar 2025 22:51:06 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 45atsth05y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Mar 2025 22:51:06 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 52BMp2Qq23921356
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 11 Mar 2025 22:51:02 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 68B255805F;
	Tue, 11 Mar 2025 22:51:02 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1410A58058;
	Tue, 11 Mar 2025 22:51:01 +0000 (GMT)
Received: from li-4910aacc-2eed-11b2-a85c-d93b702d4d28.ibm.com.com (unknown [9.61.74.78])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 11 Mar 2025 22:51:00 +0000 (GMT)
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        msuchanek@suse.de, mahesh@linux.ibm.com, tyreld@linux.ibm.com,
        hbabu@us.ibm.com, haren@linux.ibm.com, sv@linux.ibm.com
Subject: [PATCH v8 2/7] powerpc/pseries: Define papr_indices_io_block for papr-indices ioctls
Date: Tue, 11 Mar 2025 15:50:43 -0700
Message-ID: <20250311225049.146783-3-haren@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250311225049.146783-1-haren@linux.ibm.com>
References: <20250311225049.146783-1-haren@linux.ibm.com>
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
X-Proofpoint-GUID: gNwWrIp-Vu38D8eUGcfXD3TQEbhqXkeE
X-Proofpoint-ORIG-GUID: yeHBw6fvxXWocjMfO2UcESHf76CGdVzm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-11_07,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 spamscore=0 priorityscore=1501 impostorscore=0 mlxscore=0 suspectscore=0
 adultscore=0 mlxlogscore=904 malwarescore=0 lowpriorityscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503110147
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

To issue ibm,get-indices, ibm,set-dynamic-indicator and
ibm,get-dynamic-sensor-state in the user space, the RMO buffer is
allocated for the work area which is restricted under system
lockdown. So instead of user space execution, the kernel will
provide /dev/papr-indices interface to execute these RTAS calls.

The user space assigns data in papr_indices_io_block struct
depends on the specific HCALL and passes to the following ioctls:

PAPR_INDICES_IOC_GET:		Use for ibm,get-indices. Returns a
				get-indices handle fd to read data.
PAPR_DYNAMIC_SENSOR_IOC_GET:	Use for  ibm,get-dynamic-sensor-state.
				Updates the sensor state in
				papr_indices_io_block.dynamic_param.state

PAPR_DYNAMIC_INDICATOR_IOC_SET:	Use for ibm,set-dynamic-indicator.
				Sets the new state for the input
				indicator.

Signed-off-by: Haren Myneni <haren@linux.ibm.com>
---
 .../userspace-api/ioctl/ioctl-number.rst      |  2 +
 arch/powerpc/include/uapi/asm/papr-indices.h  | 41 +++++++++++++++++++
 2 files changed, 43 insertions(+)
 create mode 100644 arch/powerpc/include/uapi/asm/papr-indices.h

diff --git a/Documentation/userspace-api/ioctl/ioctl-number.rst b/Documentation/userspace-api/ioctl/ioctl-number.rst
index 6d1465315df3..f9332b634116 100644
--- a/Documentation/userspace-api/ioctl/ioctl-number.rst
+++ b/Documentation/userspace-api/ioctl/ioctl-number.rst
@@ -363,6 +363,8 @@ Code  Seq#    Include File                                           Comments
                                                                      <mailto:linuxppc-dev>
 0xB2  01-02  arch/powerpc/include/uapi/asm/papr-sysparm.h            powerpc/pseries system parameter API
                                                                      <mailto:linuxppc-dev>
+0xB2  03-05 arch/powerpc/include/uapi/asm/papr-indices.h             powerpc/pseries indices API
+                                                                     <mailto:linuxppc-dev>
 0xB3  00     linux/mmc/ioctl.h
 0xB4  00-0F  linux/gpio.h                                            <mailto:linux-gpio@vger.kernel.org>
 0xB5  00-0F  uapi/linux/rpmsg.h                                      <mailto:linux-remoteproc@vger.kernel.org>
diff --git a/arch/powerpc/include/uapi/asm/papr-indices.h b/arch/powerpc/include/uapi/asm/papr-indices.h
new file mode 100644
index 000000000000..c2999d89d52a
--- /dev/null
+++ b/arch/powerpc/include/uapi/asm/papr-indices.h
@@ -0,0 +1,41 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+#ifndef _UAPI_PAPR_INDICES_H_
+#define _UAPI_PAPR_INDICES_H_
+
+#include <linux/types.h>
+#include <asm/ioctl.h>
+#include <asm/papr-miscdev.h>
+
+#define LOC_CODE_SIZE			80
+#define RTAS_GET_INDICES_BUF_SIZE	SZ_4K
+
+struct papr_indices_io_block {
+	union {
+		struct {
+			__u8 is_sensor; /* 0 for indicator and 1 for sensor */
+			__u32 indice_type;
+		} indices;
+		struct {
+			__u32 token; /* Sensor or indicator token */
+			__u32 state; /* get / set state */
+			/*
+			 * PAPR+ 12.3.2.4 Converged Location Code Rules - Length
+			 * Restrictions. 79 characters plus null.
+			 */
+			char location_code_str[LOC_CODE_SIZE]; /* location code */
+		} dynamic_param;
+	};
+};
+
+/*
+ * ioctls for /dev/papr-indices.
+ * PAPR_INDICES_IOC_GET: Returns a get-indices handle fd to read data
+ * PAPR_DYNAMIC_SENSOR_IOC_GET: Gets the state of the input sensor
+ * PAPR_DYNAMIC_INDICATOR_IOC_SET: Sets the new state for the input indicator
+ */
+#define PAPR_INDICES_IOC_GET		_IOW(PAPR_MISCDEV_IOC_ID, 3, struct papr_indices_io_block)
+#define PAPR_DYNAMIC_SENSOR_IOC_GET	_IOWR(PAPR_MISCDEV_IOC_ID, 4, struct papr_indices_io_block)
+#define PAPR_DYNAMIC_INDICATOR_IOC_SET	_IOW(PAPR_MISCDEV_IOC_ID, 5, struct papr_indices_io_block)
+
+
+#endif /* _UAPI_PAPR_INDICES_H_ */
-- 
2.43.5


