Return-Path: <linuxppc-dev+bounces-10894-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0B6B23C18
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Aug 2025 00:57:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c1n2m31xpz2xQ1;
	Wed, 13 Aug 2025 08:57:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755039456;
	cv=none; b=MyB79BAe8ad/7D6GQeFEBxVV963IbYF2ePtO75pb4p+V8hoveU/ZYPCk3Bi++vAiWscqZvWze2saPJVfy3lISUVhWIBoRBWyLaW/tPchTkq7we1byxi3qOnLQPNoSehuXIkr1c2ieVlLmSjdI9eW/O1S853zczi+fzP094PIWdPT6z2ddwTYQwea7vK5n/c/x2HF4fAx9KgRGV4yoGjtBM/2eMPexkqEvl0HXpl1t7LSOacHgIrHFEwbLzlyF4g20FAUObyOuLcd60h881eYLx1A6Xlt/ZAFBERWrnUFXGdEASi8fkI3h/h9QDrO2uYFbcz10rQvmzGCIcO932k/7g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755039456; c=relaxed/relaxed;
	bh=xykkhj8oTh16uRtfbOQALEaLIkWhHXWSbz5WkUJpUZE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AghqOBrpjfIY3rkwttzYGvajRfX70pwKj+TxyX5xl8NHGET3gHucjC9B+0MbiajCPEZxtZyRbFOkqYgIz6dlZfaKzK2uOTUB4h0i/FIjPFE0JEa+Zu3/m5cjtZPG3FJTDNGKo+ruyiu1RsvqMxXUGqpXAbwsWbGqGc42YJwDI9tJ/6bLXIzVS+indlN37XdHV6PpxtUy4YXbGpTx8lKdU3gfNcshyKzVX0k+RGfSbPNhdJLY7o1EGvDjVDU9JcWjqnJb7CAmQsq6wfpUiIZBv/ed2r9NNoREayg9q2Cy6T5npGS0Mq2qCHTHwbpnIcs5XLJNIitwT0VNaOfhIQYVHA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XzHqprjZ; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XzHqprjZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c1n2k4gdSz2xHY
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Aug 2025 08:57:34 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57CILd2O022950;
	Tue, 12 Aug 2025 22:57:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=xykkhj8oTh16uRtfb
	OQALEaLIkWhHXWSbz5WkUJpUZE=; b=XzHqprjZGjJqWUZcrF0g3SXw2DSBfdMgR
	uq+ucMNu9fD07ib/hRi7WaypwzK86YGRRRnBzgGz/npn6Vb8aACe/LfljbCKfZ0z
	a4qO6IKUC+MLckxmHzPqTLGFgCt8ub6KV9xqqFPuuBFl42AnVRYGCitHu7RP4rtp
	BTpaYaU3HzFCqwfIlbvWVQX/fFdMuGBwjbJ8cdjNOVzAJeJxdB7imN2Em48i5RvC
	CjIkmMmJMrgvEKGX6qFpqKWY6IrS/K01xcUOfQZAfYN2RRrKGEueRNO+mX/YazZ2
	+hFzt+Y8epfiOa2N429JvBMLUn/MZ9vJb/fyVVmBGxU61hqBgzD3g==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48duru9bkp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Aug 2025 22:57:25 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 57CMvPWT018576;
	Tue, 12 Aug 2025 22:57:25 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48duru9bkk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Aug 2025 22:57:25 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 57CKZr0I026279;
	Tue, 12 Aug 2025 22:57:24 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([172.16.1.74])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 48eh214t58-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Aug 2025 22:57:24 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 57CMvLbj15598166
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 12 Aug 2025 22:57:21 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id ABD1A5805C;
	Tue, 12 Aug 2025 22:57:21 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7DA5F58058;
	Tue, 12 Aug 2025 22:57:20 +0000 (GMT)
Received: from li-4910aacc-2eed-11b2-a85c-d93b702d4d28.ibm.com.com (unknown [9.61.44.118])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 12 Aug 2025 22:57:20 +0000 (GMT)
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, msuchanek@suse.de,
        mahesh@linux.ibm.com, tyreld@linux.ibm.com, npiggin@gmail.com,
        bjking1@linux.ibm.com, hbabu@us.ibm.com, haren@linux.ibm.com
Subject: [PATCH v2 1/9] powerpc/pseries: Define papr-hvpipe ioctl
Date: Tue, 12 Aug 2025 15:57:05 -0700
Message-ID: <20250812225715.339225-2-haren@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250812225715.339225-1-haren@linux.ibm.com>
References: <20250812225715.339225-1-haren@linux.ibm.com>
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
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: PHJnZ3i7wiUllLQLqTCbqmQVhmAMevd5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEyMDIxOSBTYWx0ZWRfX8+VkWmMhZE0Y
 OnZXfYU2F8flye9WauFd8Z0Q1evFm4PRHVlFsOYRiT682XJT9STlBJvml23jYb0FdFceS62Z6Kw
 vxlwYZFPejxXUt9k2RmIG8fZLMd9p4qEQgHql+yA9d7OUlBk/x+HrbyqR/9ysg/7u+rh9BeFoi9
 YmV5B2O8CA3I9JPvkt4+BA4EVlXPAeEDnN5sEz9kjDMEcGY5lO6Id087DPtKFBOW2sFgdreD+f6
 ryjQVA2Ai/zpM+qozB/lxK8u/PycivMGwC9ifQNAf1DsfkHzluLJhTDkS8o8uZDfI8EJSS2iyCf
 id1Xrl6P/dTk3SEpVzw1kqwQJxcXHAWV3mBXHWnzVXyBGAT5RY4XmBTYwpkrVuAUvaoXnXDBv1c
 NADPo1wLQVyyT4jHkvbFlKaOf1QQHNmhJ1YBwQ8lrcWVf9wbJIywSdloZGjdrH57OKyIwsy0
X-Authority-Analysis: v=2.4 cv=QtNe3Uyd c=1 sm=1 tr=0 ts=689bc6d5 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=2OwXVqhp2XgA:10 a=VnNF1IyMAAAA:8 a=voM4FWlXAAAA:8 a=VwQbUJbxAAAA:8
 a=-HHcYlYmIqu4Uq_mt9oA:9 a=IC2XNlieTeVoXbcui8wp:22
X-Proofpoint-ORIG-GUID: iWXCfW2AC8tJ5KQeCKd6DYjYJp660eiE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_08,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 mlxlogscore=625 impostorscore=0 suspectscore=0 bulkscore=0 mlxscore=0
 phishscore=0 malwarescore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508120219
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

PowerPC FW introduced HVPIPE RTAS calls such as
ibm,send-hvpipe-msg and ibm,receive-hvpipe-msg for the user space
to exchange information with different sources such as Hardware
Management Consoles (HMC).

HVPIPE_IOC_CREATE_HANDLE is defined to use /dev/papr-hvpipe
interface for ibm,send-hvpipe-msg and ibm,receive-hvpipe-msg
RTAS calls.

Also defined papr_hvpipe_hdr which will added in the payload
that is passed between the kernel and the user space.

Signed-off-by: Haren Myneni <haren@linux.ibm.com>
---
 .../userspace-api/ioctl/ioctl-number.rst      |  2 ++
 arch/powerpc/include/uapi/asm/papr-hvpipe.h   | 33 +++++++++++++++++++
 2 files changed, 35 insertions(+)
 create mode 100644 arch/powerpc/include/uapi/asm/papr-hvpipe.h

diff --git a/Documentation/userspace-api/ioctl/ioctl-number.rst b/Documentation/userspace-api/ioctl/ioctl-number.rst
index 406a9f4d0869..7c527a01d1cf 100644
--- a/Documentation/userspace-api/ioctl/ioctl-number.rst
+++ b/Documentation/userspace-api/ioctl/ioctl-number.rst
@@ -374,6 +374,8 @@ Code  Seq#    Include File                                             Comments
                                                                        <mailto:linuxppc-dev@lists.ozlabs.org>
 0xB2  08     arch/powerpc/include/uapi/asm/papr-physical-attestation.h powerpc/pseries Physical Attestation API
                                                                        <mailto:linuxppc-dev@lists.ozlabs.org>
+0xB2  09     arch/powerpc/include/uapi/asm/papr-hvpipe.h               powerpc/pseries HVPIPE API
+                                                                       <mailto:linuxppc-dev@lists.ozlabs.org>
 0xB3  00     linux/mmc/ioctl.h
 0xB4  00-0F  linux/gpio.h                                              <mailto:linux-gpio@vger.kernel.org>
 0xB5  00-0F  uapi/linux/rpmsg.h                                        <mailto:linux-remoteproc@vger.kernel.org>
diff --git a/arch/powerpc/include/uapi/asm/papr-hvpipe.h b/arch/powerpc/include/uapi/asm/papr-hvpipe.h
new file mode 100644
index 000000000000..459a7bb0e6c9
--- /dev/null
+++ b/arch/powerpc/include/uapi/asm/papr-hvpipe.h
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+#ifndef _UAPI_PAPR_HVPIPE_H_
+#define _UAPI_PAPR_HVPIPE_H_
+
+#include <linux/types.h>
+#include <asm/ioctl.h>
+#include <asm/papr-miscdev.h>
+
+/*
+ * This header is included in payload between OS and the user
+ * space.
+ * flags: OS notifies the user space whether the hvpipe is
+ *        closed or the buffer has the payload.
+ */
+struct papr_hvpipe_hdr {
+	u8 version;
+	u8 reserved[3];
+	u32 flags;
+	u8 reserved2[40];
+};
+
+/*
+ * ioctl for /dev/papr-hvpipe
+ */
+#define PAPR_HVPIPE_IOC_CREATE_HANDLE	_IOW(PAPR_MISCDEV_IOC_ID, 9, __u32)
+
+/*
+ * hvpipe_hdr flags used for read()
+ */
+#define HVPIPE_MSG_AVAILABLE	0x01 /* Payload is available */
+#define HVPIPE_LOST_CONNECTION	0x02 /* Pipe connection is closed/unavailable */
+
+#endif /* _UAPI_PAPR_HVPIPE_H_ */
-- 
2.43.5


