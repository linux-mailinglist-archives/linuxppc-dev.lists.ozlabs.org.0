Return-Path: <linuxppc-dev+bounces-6832-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E84A5888A
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Mar 2025 22:39:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z9thr1KFcz30Sv;
	Mon, 10 Mar 2025 08:39:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741556380;
	cv=none; b=Nu8UFqXSPIu2TIVs1noj1OoJ73w9+xWnVoDbeZ6G2oxL7mNXGG7LpI9guVQTMFPOf2XIPR6MAGfpLWPOhJFp3UqpZubsY6jLYxBCRpSKGc1Oqz1U0lfANUF6p/PD8ynNZVnr83yTYqHcjPJnjR0tjKf2Mh5M9UWzC58zORWNI8u0SBXVYG1GcwX9a6eW3r1a77Q7Q+Y4bpuM9iuJwk1OyJxwpEEB6UcAsE8tpHXbgTceRxdguVeEV2KNBGPvQnX/zdZ6Tz4sst9DtAor0HPE159DSPoKHfckibNw5Ze4xhE2HvCvUJ6cWaiMMiXcn+An6GydIOoXiKHaZvZURrupMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741556380; c=relaxed/relaxed;
	bh=PN0dRpgUXpxeLbJJP4fV7ZQk/Z8UO5cVk0NXXSjNqf8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iCWWfOwmoco2+dEtDmmwpjwy4M6s10xLqBYc0+fyScZWm6eUaP+yFx+min0Z0B2/u9vzEAH3T3YBe2NLcC0pPSzPiznO8ZxDyi5JOpbfNgMhAZ3DnXXCHH/+wkhG/z3EjV+TFGy7uC+wvnRGJLZtIQrL3c4NAbriaHjr0FR9CCzwsRKW3atf8LhypSqYsvBxJGj+M6OGcbdr1i57wJbNBJ7St6+jj40P8DcBgC+eRvNB7dFKoKVBLmBb2f293bVtTBPKQYUfGTesfvdtSKaNzWd0qf061NyHlH2op3ayzSzsHZs+FPEKqYyBo5yuM8QrO0M69VBH7Tip95l0o/DqVw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TgDsTzcf; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TgDsTzcf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z9thq0GxMz2yN2
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Mar 2025 08:39:38 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 529Ke0Ul018965;
	Sun, 9 Mar 2025 21:39:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=PN0dRpgUXpxeLbJJP
	4fV7ZQk/Z8UO5cVk0NXXSjNqf8=; b=TgDsTzcfte42rQCgNZbTUmAL2p2c1DA7f
	7wnMUpTDH7pZqrhac6settDYJ2k1tF7ocCW0sclNpp47JMhFFKxul7U89fO4ONdw
	XLiQxepkjb/Y1SEf96gduy3P+TPbLfSreD6pazeQiKRScr48lj81lco5rH9EBglR
	LiTcjH4YQp3/yHaujavdy6CO1KON6pdEGuTi0V5hzSk/UPTwtVT74U6PB0RMIkvB
	aXnatr+/MwDW0kzgIG3i2ldPvZAj9sZXTtkTGrTzjVCVrHur5hK0/+5AIa3ELgzJ
	pzrT9YMJRKyBnaqkqOwX29SFiwGvgeYl0j+G3OFBH6ExbPSdqr68w==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 459j6yg49c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 09 Mar 2025 21:39:30 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 529LdUEh013337;
	Sun, 9 Mar 2025 21:39:30 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 459j6yg49a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 09 Mar 2025 21:39:29 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 529I4iLJ014083;
	Sun, 9 Mar 2025 21:39:29 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4592x1k7rk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 09 Mar 2025 21:39:29 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 529LdPLc7078430
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 9 Mar 2025 21:39:25 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7C1A858056;
	Sun,  9 Mar 2025 21:39:25 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 85A6B5803F;
	Sun,  9 Mar 2025 21:39:24 +0000 (GMT)
Received: from li-4910aacc-2eed-11b2-a85c-d93b702d4d28.ibm.com.com (unknown [9.61.54.66])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Sun,  9 Mar 2025 21:39:24 +0000 (GMT)
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        msuchanek@suse.de, mahesh@linux.ibm.com, tyreld@linux.ibm.com,
        hbabu@us.ibm.com, haren@linux.ibm.com, sv@linux.ibm.com
Subject: [PATCH v7 2/7] powerpc/pseries: Define papr_indices_io_block for papr-indices ioctls
Date: Sun,  9 Mar 2025 14:39:10 -0700
Message-ID: <20250309213916.762116-3-haren@linux.ibm.com>
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
X-Proofpoint-GUID: ujrcVkITKDFMB7nKNJL67LzhplVifGsK
X-Proofpoint-ORIG-GUID: mHvbzgkyP1T0G2bgWuS7Y43wvN19C29a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-09_08,2025-03-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 mlxscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015 mlxlogscore=905
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2503090171
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


