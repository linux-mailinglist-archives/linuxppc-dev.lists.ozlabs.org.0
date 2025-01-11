Return-Path: <linuxppc-dev+bounces-5052-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 942F0A09F53
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jan 2025 01:30:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YVKDn2LhSz3cjr;
	Sat, 11 Jan 2025 11:30:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736555433;
	cv=none; b=HoQHXG0/UiLp3JslBIVZr5dCCevjNud2hP4uE0SqwEOqStPGh7eksOGQAgKLBxZcfw+ZSKmLFG9tlCBTG3CkGa2vv3hX/buz2DMdQUlN4lbqQbssdC6z2caUVf+OFOEYxpFcX/K0ZPOaAPznOpjtq26AsVZJGcMC5qX4ULLOdCOeWEHEfAELp2sT2UqQ40mqoPVXgV0T87x3OhwUnZNKOyI0wDB6oVVtxfPL1Qq5gefBuZTLRIR9xdsdi5EsGp/Xm0+cEaR3WMDn/wEwavYZF490cWSFbcx7IVw5rxUvmqYRUGhjEwSESBaDgE1tGxlkQtlCApnw1Hj2MhB303iLxg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736555433; c=relaxed/relaxed;
	bh=X3/EY7Fj12EUkZmzCuPqXuf6QfNN71OJdTE2O73Wgcg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZyEY6FDosRK0tO2HmjABZ8Yx9ZlEq3ccBlsnT4TtUm/k8mrJeTG0SkwSeDTc3SBp0rfOriinxRWIAMIB1DDrnoUoO4JmaWYW04YDgIA4Yv9duixyP7O0PD0ypn5hOGFejMcXo01wVtaa48J4b6zq0yVaFbDPzcq8kg1gTgTJH/fc6jc78F+I8FNZsHw1yRtdCeo7fAmRypimYvlMlkZIBRtP1b7tf0rzhT4KkD7mJYvN0dD7as3IjpDwWh2XA4/XlLQ49Ta/KFYewF0GoIv0/FEfAo1y8oMz/Pn/I5beg6Oi94Rexj6mL2PEmf8Iw/YiHJurJalf8zpxYAATt2B8yQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AILSW/ca; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AILSW/ca;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YVKDm23pgz3cmp
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Jan 2025 11:30:31 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50AH2RDi005768;
	Sat, 11 Jan 2025 00:30:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=X3/EY7Fj12EUkZmzC
	uPqXuf6QfNN71OJdTE2O73Wgcg=; b=AILSW/cayK7sUJ7eVhdoL+mlgz6R+YoTX
	Z/9YFkvLC5zfVuYz+LwS5xqFcWfTD/5FQXCjVN6uFeCgf/qF2N+0NP5yLIbzsuWE
	HkimLonGRNg5DDMuRNSONb9+pmdlEw8EwcRfSbfK2JHZ+QvmmKSrexefkWrFcHmS
	VqtErn6/kWNQV0coVJQfUHNPbUJIcs2QYUD6mfyh7h16vKg2QpMFvpYNAwQJOnz5
	nKGUcrXlq2LxvpIKDHBYyBNOewFEKKe7mjAG0em4aB5Q+RzFrHbe8AyRjXnbW0Jj
	VBIABpj8cs/wfaq7nB99mmvwnfNAUqEAPNJBBF2+JGAOg77if+TuQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 442yr2us1u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 11 Jan 2025 00:30:23 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 50B0UNm0022704;
	Sat, 11 Jan 2025 00:30:23 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 442yr2us1s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 11 Jan 2025 00:30:23 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50B0CxUl003601;
	Sat, 11 Jan 2025 00:30:22 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 43yfatn1db-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 11 Jan 2025 00:30:22 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50B0UJTT30343786
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 11 Jan 2025 00:30:19 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A37415805B;
	Sat, 11 Jan 2025 00:30:19 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8FC2C58059;
	Sat, 11 Jan 2025 00:30:18 +0000 (GMT)
Received: from li-4910aacc-2eed-11b2-a85c-d93b702d4d28.ibm.com.com (unknown [9.61.28.150])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Sat, 11 Jan 2025 00:30:18 +0000 (GMT)
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        msuchanek@suse.de, mahesh@linux.ibm.com, tyreld@linux.ibm.com,
        hbabu@us.ibm.com, haren@linux.ibm.com
Subject: [PATCH v2 2/6] powerpc/pseries: Define papr_indices_io_block for papr-indices ioctls
Date: Fri, 10 Jan 2025 16:30:04 -0800
Message-ID: <20250111003010.2147021-3-haren@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250111003010.2147021-1-haren@linux.ibm.com>
References: <20250111003010.2147021-1-haren@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: wymgn3Fgq4Uszvs2wnbFPV4tKsWh_H3T
X-Proofpoint-GUID: -RdmS3absMFu-MF2HlUYz_cd2U1eV0Nm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 impostorscore=0 lowpriorityscore=0 mlxlogscore=767 phishscore=0
 suspectscore=0 malwarescore=0 mlxscore=0 priorityscore=1501 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501110002
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
index 000000000000..c580025fe201
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
+ * PAPR_INDICES_IOC_GET:	Returns a get-indices handle fd to read data
+ * PAPR_DYNAMIC_SENSOR_IOC_GET:	Gets the state of the input sensor
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


