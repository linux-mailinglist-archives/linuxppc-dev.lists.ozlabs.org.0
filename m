Return-Path: <linuxppc-dev+bounces-11823-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 234A9B472EC
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Sep 2025 17:53:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cJyRq4qs4z3cZ0;
	Sun,  7 Sep 2025 01:53:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757174007;
	cv=none; b=b5qC4T+sa/cJk3RRS+qUl76V5IUL8TF8KaVTbGk92xLLtVu6qU1rMVyJBeaMQ8YRbiLwJPHR4Ecx8QbBK9h/wMbsK1+hLR9t1FHAZCYopfmcmONNnqWbbzSlPhD4wBPWEXpr3Dqy3JSskqeekLlpra2jsxWztv6/DVGBVRKhoNp0vE5P6UvBBtuzAwRV/Oz+6aR+PBzhAkx37Lf2ZLRDWFYr7eNst4qef3acYJCfoyTCqre/UqBKDNf27ITbZldwlCumkaef2F5gyoMOqWwQ+nZ7HwSW/+G5sa844QAbEeANzRF5nDghanzfBlFDoUHp1vzb7iBDEhxA/QzhdoMFrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757174007; c=relaxed/relaxed;
	bh=TSf4LdcuccY15AWDqLOy/deU51v50DfUIpULSVx41Mc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EREx0T9t+EGoEJgWculExjHoFkkFB3AUQxnjQIR5/ISMq6hVQ+4A0lCkmz0W2sjzvelrZFcbz5GxCzNYT9OI/rHvq7yN/nH5Nq1Zx7y66eEAGVZGrMlRu1SoJ5ddrK+8aWnJWBofZt5ar70+Rn8tOTaxJEeBvmgIQT80BZncSaMgXHG7pdcZzDdzZAP6sPQLEWsyZM9+x44t+gcMKeadxvzCrCuh5edE9oDIJgB+dn/YIYWLfbgQ2MsFwcDLXmbz2DbtquBMyUqrKkiT78zZnrG/eMOucxlql/kvFmOSsDtGzSWVPcugeBSBerhRNkUolyalKCQtWJ4Vvt8mRXs9vA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KnOGDu6N; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KnOGDu6N;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cJyRp4zQrz2yrp
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  7 Sep 2025 01:53:26 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 586CU93x012929;
	Sat, 6 Sep 2025 15:53:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=TSf4LdcuccY15AWDq
	LOy/deU51v50DfUIpULSVx41Mc=; b=KnOGDu6N7wAVTp9LeZkB+Jz7l3f/vzdRh
	kO9JqnklhgWzJd5CTZe4oqCEO7j+K238QPDJbhXIKpEpVBnoqIiVtj5co/eFLR4Y
	/IDy7/tW8P2xOQFnT6eQd/+usm7CaZX1nY8sbYkLsvwvCwJDHW6xah/e13VWhNMS
	8CnXUut68ZVgqUkVUzpxuaiD9Ijgb56A/Zxut9CUUsjtj+ogfostaBoUZabJSXRN
	vIWNDWQC0FOqFyuZf3am/QC+qFFderP+f5U16qd5gKBE1xE0x127oJtRBp/oRQqv
	ToKqqIlyS/HBfTWDjB3UPzYVfNR4ZxDoe4Y/e/EgwXnWV9l/KNObg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490acqj518-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 06 Sep 2025 15:53:17 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 586FrHT3017308;
	Sat, 6 Sep 2025 15:53:17 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490acqj515-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 06 Sep 2025 15:53:17 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 586FmJBR014052;
	Sat, 6 Sep 2025 15:53:16 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([172.16.1.73])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 48veb3wytn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 06 Sep 2025 15:53:16 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 586FrDFZ31458032
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 6 Sep 2025 15:53:13 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 137F25803F;
	Sat,  6 Sep 2025 15:53:13 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2FE5E5805A;
	Sat,  6 Sep 2025 15:53:12 +0000 (GMT)
Received: from li-4c4c4544-0038-3410-8038-c4c04f423534.ibm.com (unknown [9.61.139.105])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Sat,  6 Sep 2025 15:53:12 +0000 (GMT)
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        msuchanek@suse.de, mahesh@linux.ibm.com, tyreld@linux.ibm.com,
        hbabu@us.ibm.com, haren@linux.ibm.com, shashank.gowda@in.ibm.com,
        bjking1@linux.ibm.com
Subject: [PATCH v5 1/9] powerpc/pseries: Define papr-hvpipe ioctl
Date: Sat,  6 Sep 2025 08:52:59 -0700
Message-ID: <20250906155308.705926-2-haren@linux.ibm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250906155308.705926-1-haren@linux.ibm.com>
References: <20250906155308.705926-1-haren@linux.ibm.com>
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
X-Proofpoint-GUID: Mn3r9DirRLdA-BhUW1D_zAdwUn1Fq-p7
X-Authority-Analysis: v=2.4 cv=Mp1S63ae c=1 sm=1 tr=0 ts=68bc58ed cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=yJojWOMRYYMA:10 a=VnNF1IyMAAAA:8 a=voM4FWlXAAAA:8 a=VwQbUJbxAAAA:8
 a=GD8v1-097_rLXb-cXwoA:9 a=IC2XNlieTeVoXbcui8wp:22
X-Proofpoint-ORIG-GUID: 1DUApjXhA3QGFhLfJSoRZl2_u-EX_dcO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAwMCBTYWx0ZWRfX/jsunEFt3hIZ
 S3sYNYCyzufZ/fWyOUHN7NXWW62AIwRC43Qs3gO9lVE0Z0zQUYBN0VuQ8h5BubO33arAZrzmFBw
 zNT1rMJkb6mymjo2bOKE7SxkepKHHVuirkbpltOKpS4mtbmNbYC7FEUJYL1FDOylUR/SOT5PcFo
 odkU3XP3qRF4wnwG6Rn+6Sg3QPEhaPHo0XGGSG2Xx+ZKSwhU3MwCsxmHBiqadjFGk+iMYN9mjRT
 XpLc9vuebWDh48NbM93/GOtm8q7gkKxe2s2DD+MyQH7bLWxaW0gVz0KtPIan3r6bV6N3ivY/ACl
 oCjwpf8Dm4aiUgJIzDCCS3oWChJMuOCmGi79uAMpK1zM+Bqh+RVzkN9H91lfyrOrk9LJJtfGW7Q
 PUfZmN7A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-06_05,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 phishscore=0 spamscore=0
 adultscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060000
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
Reviewed-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Reviewed-by: Tyrel Datwyler <tyreld@linux.ibm.com>
Tested-by: Shashank MS <shashank.gowda@in.ibm.com>
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
2.50.1


