Return-Path: <linuxppc-dev+bounces-5975-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B2CEA2D334
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Feb 2025 03:48:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YqZy83x3Zz30RG;
	Sat,  8 Feb 2025 13:47:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738982864;
	cv=none; b=TqD21xFPTXN+qGXLAGqkNOekIRCLxcSHcfP6KKnFjj2Uy2kjm4OECjYf2gOXWFSpWSbNYZa50t/VNvCDHoZ+feLYyvo9xCnk5Wg0N0BUadlH4lhDpDtTG2ajcCGUx10Kzo6GXwR4vdac2cirvJ4IP9CP9yPS5qc7Ru4GlhPDq/3EmZFFY4TXYJG6bX4V1XjVbesvvi6xntoT5YM+de9iloydP5ee+ODXaPdZkvjlRa9j+urGeurw7Uf0oec8l3E41YhkhvxhKUVtzBAYSsllyCUS3FB4zQ28Nv+9jAurLZNR9kkCg6NsfX41Jo6Z+KtLt0jlc5evCSu5NeAN3BKwYg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738982864; c=relaxed/relaxed;
	bh=K5Gc27nyOC83tvkbhKjuWGmJXC/joY2MwECSz7qPi18=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jFIC7alIBFHi2Ik/nHOn2Q/OIs2WvUI3f69RLkqle8tmn7tq+9KkGK/Fjmy4brk6xKyjbFZGKzMtGO3aiB/857Ta+JRoNytUAiPCh/SwFV6sjl4RO5/odMONAP5/btPl3mie/WuzQ+cJLgXmOioZkhmKpaf4GFSPC6LcSRg/kMha1AEvMJvsJY+Ztp+fSB9lPehkoYDymFTEA9DKzFHQ8KZLlUsz3WrQPm/NdYfS6h1Giq8SqfpFKv7VZlbQvsGjlOuo+IwFFOywJAUlGLCYdaHFkW1uaS9KpJfGyiN9dJKXi7sGdAEnVRxQG6VyZk/Y/mNm0Lktk44NyFH2SfB+Qw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IfQQgb/U; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IfQQgb/U;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YqZy744hDz30Vw
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Feb 2025 13:47:43 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5182I4oa007798;
	Sat, 8 Feb 2025 02:47:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=K5Gc27nyOC83tvkbh
	KjuWGmJXC/joY2MwECSz7qPi18=; b=IfQQgb/UinZbMqwOUlzlapvwXaCl+yqsv
	yi0hxMIqvlGNsLpLjMYFSOK7FlUhzL6YvC36RqcaN69Tyrk51L/kc5MYk/+NrCsi
	Fi9zUOAXgbBftL0W3c/KCo8TfTJJRG8I9st6kDKDKXtAq2PIJIBCJmY1gPeZ0lYp
	RGoW3N0rRTu5zOdQ26gqf8KZY7nb7Pq9CXUHLSRsjVRKjS8rn8PmxWykZqnfsvKu
	eQ9bH+HnrwVTShyCkoa8g6T85peUyib8Jg2rii+qRA8QAT14WHbKKLpqdnjQYQKG
	ZdOWncVP0TfdgF3z+iLjyAFsTyg19RcMEXYVD600uJzLKZ6EuqFcw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44nvpp0bds-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 08 Feb 2025 02:47:35 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5182lYJx029437;
	Sat, 8 Feb 2025 02:47:34 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44nvpp0bdn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 08 Feb 2025 02:47:34 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 517N7GsS024540;
	Sat, 8 Feb 2025 02:47:34 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([172.16.1.74])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 44hxxnpfw8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 08 Feb 2025 02:47:34 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5182lUWG14680676
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 8 Feb 2025 02:47:30 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 368A558051;
	Sat,  8 Feb 2025 02:47:30 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5C1E15805A;
	Sat,  8 Feb 2025 02:47:29 +0000 (GMT)
Received: from li-4910aacc-2eed-11b2-a85c-d93b702d4d28.ibm.com.com (unknown [9.61.139.242])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Sat,  8 Feb 2025 02:47:29 +0000 (GMT)
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        msuchanek@suse.de, mahesh@linux.ibm.com, tyreld@linux.ibm.com,
        hbabu@us.ibm.com, haren@linux.ibm.com
Subject: [PATCH v5 2/7] powerpc/pseries: Define papr_indices_io_block for papr-indices ioctls
Date: Fri,  7 Feb 2025 18:47:12 -0800
Message-ID: <20250208024719.8550-3-haren@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: ZtdxCm7QsqcBKuD0fEwGb_8ATjRvGHZ1
X-Proofpoint-GUID: 1mrn-yiDPMe48tqfg4xz2N54F9pbpcZc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-07_11,2025-02-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0 spamscore=0
 mlxlogscore=753 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502080017
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
 arch/powerpc/include/uapi/asm/papr-indices.h | 41 ++++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 arch/powerpc/include/uapi/asm/papr-indices.h

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


