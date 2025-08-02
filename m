Return-Path: <linuxppc-dev+bounces-10520-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF6BB18A72
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Aug 2025 04:41:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bv6XZ4dc8z30T9;
	Sat,  2 Aug 2025 12:41:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754102510;
	cv=none; b=FgZkoxVQhc9ltOUeGRd/RV7/4mL1jLNjYrWDmXjlJ1Yb3EA4hz9BCUgeVUzay/y7UrCSVaCuzo3ZaBBXllKxpZXXCc8oQHByseLFTp9tOI6uktVaYfT9Cs3cW6yZP7vZj/77Dni8+2qapkxbBgWeyB70ThsbJ+/iqdW+JCn2/UeYGIrHFyDfYJIFi4e8K52pVNYqqPOEjUJ3d6PpVazhBw/9NZNfpVw4MbjVXoELlUI4LhTZdaGauJ+F7MnKqO2TC7xTavIjeLhg+hMGTaEjFYpo5d3Au+8xFhk3ovbx6uMUBWMFUl5fCoO+fwDissjhjfQH4VCQ5WNCQLeLMKFIBw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754102510; c=relaxed/relaxed;
	bh=W68NnLMr3Sy3cnwlboBjj3eARQAOJs/7n98ZhuKP6Eg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PnO3MbK2y912QBssuDAdHtOnvxOQdezzguz5hZliFb0dNrLkdGVvyzWoPszKfkiG7OyrKWdz3b0UfDHHx8NN9/VOCp/uJscIqfEVmc/cMcb4wUTQRQ9KqJfrJl3bWhqLLr9iNbK/M44+WyFEkzsHQ6cqT3RkG7tRgWd6LzlDQ8BCz1LCfJZT57oFBC14KdF7UC9T53RES70izhNh7Gorujxnek+z0JqRvQtamjiq/cSx2+Kr2S2dW0uB9iqShwwz5//2gSOzFkCLbRbTobVfgiA1xXsNLNsTPxUR1zbTuys6WPI9ncNcVJh7iuYQvVQNm83R9ztTf7J9wR8AAIBzwA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=L0dYXwut; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=L0dYXwut;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bv6XY2Rntz2xHY
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Aug 2025 12:41:48 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5721m6fj013381;
	Sat, 2 Aug 2025 02:41:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=W68NnLMr3Sy3cnwlb
	oBjj3eARQAOJs/7n98ZhuKP6Eg=; b=L0dYXwutTQxaKq6Y73vHkKOJwNxmz0UQo
	pqJ8rlDnpfvnzw+f31oSxrX34F8Gn+Ft0O8c4sjwxYYzrR8E183c/YyJPETtObvO
	VhBeuKNgU7Vr0xI6K1t1F1N6OWF+97GdCQE3CwbIlU1qH4od9R1wvhZBHyGcwbwz
	sqVqMqlTPtD54ihmHcSeUkDDx9IgsjYuW1iNo6MXUbaGGAzTVJn3eomfs88Wkig+
	mIblMnkx7gq4OpC+eBvunRDqxR6QSNBmyPJAQhClIyE/ULO7OtsUS+otZs7CwpV7
	i79yy5/ibXaQBUX02KaPVW4H/sW2E4Tnf1hzE1QTWDLuNf/fwc4Vw==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4864k8c9r3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 02 Aug 2025 02:41:39 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5722XX6T018307;
	Sat, 2 Aug 2025 02:41:38 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 485abpm2x2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 02 Aug 2025 02:41:38 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5722faVY32375452
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 2 Aug 2025 02:41:36 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0BB3758055;
	Sat,  2 Aug 2025 02:41:36 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2127E5804B;
	Sat,  2 Aug 2025 02:41:35 +0000 (GMT)
Received: from li-4910aacc-2eed-11b2-a85c-d93b702d4d28.ibm.com.com (unknown [9.61.171.135])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Sat,  2 Aug 2025 02:41:34 +0000 (GMT)
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, msuchanek@suse.de,
        mahesh@linux.ibm.com, tyreld@linux.ibm.com, hbabu@us.ibm.com,
        haren@linux.ibm.com
Subject: [PATCH 1/9] powerpc/pseries: Define papr-hvpipe ioctl
Date: Fri,  1 Aug 2025 19:41:11 -0700
Message-ID: <20250802024121.955274-2-haren@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250802024121.955274-1-haren@linux.ibm.com>
References: <20250802024121.955274-1-haren@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: 87k6n9Y1KC_nmQ5UA2dbfqEMGgQFrB6H
X-Proofpoint-GUID: 87k6n9Y1KC_nmQ5UA2dbfqEMGgQFrB6H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAyMDAxOCBTYWx0ZWRfX0GUfIJmdeBlk
 j0liZHI5hbqdWtfTUF4Zz5lSbUW4h0fG3yg6t9ERD36plG4AaEyhHH5Q8SAJI30ep3J7G7uHTZC
 cpbXqcsD4wRpfVIJ+4YurKGe49UTtTJyHrmONP2BU04KcyX1U+aLZINsWl4S4Gzgo7vuLcriaQU
 jGojosl9rYTErMW4ygewx7iCDUI5JWg2uIz+OvJvgbj/7j+vyNzhLb/3U6jQFhg9lnHk9Sz5meI
 /4hACIUrM/78jER02/yklX1LdQp/6aypkLViqkL3VCC2EiLAeNd3XEkR2V7yHeLqZcpCb3iSPia
 0jDSLgu2LjSMzKBrVNZqwqDXHOMnlv6fa/9j1pP+181yw1iLpWqU8ZoO/AV8ogZZmqSjB0hwplq
 XsLdOwn3bRB9W+FbhEfm2Oo4ErGOVS5d1XCdrvETbqswd/Wid6kD5mn0NzB3YLF4CdVo8txT
X-Authority-Analysis: v=2.4 cv=ZoDtK87G c=1 sm=1 tr=0 ts=688d7ae3 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=2OwXVqhp2XgA:10 a=VnNF1IyMAAAA:8 a=VwQbUJbxAAAA:8 a=hCPc-vyYqU3GlDZ_-9gA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_08,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 mlxscore=0 clxscore=1015
 adultscore=0 impostorscore=0 mlxlogscore=462 bulkscore=0 phishscore=0
 suspectscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508020018
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
index 4f1532a251d2..ff5827b074e1 100644
--- a/Documentation/userspace-api/ioctl/ioctl-number.rst
+++ b/Documentation/userspace-api/ioctl/ioctl-number.rst
@@ -370,6 +370,8 @@ Code  Seq#    Include File                                           Comments
                                                                      <mailto:linuxppc-dev>
 0xB2  08     powerpc/include/uapi/asm/papr-physical-attestation.h    powerpc/pseries Physical Attestation API
                                                                      <mailto:linuxppc-dev>
+0xB2  09     arch/powerpc/include/uapi/asm/papr-hvpipe.h             powerpc/pseries HVPIPE API
+                                                                     <mailto:linuxppc-dev>
 0xB3  00     linux/mmc/ioctl.h
 0xB4  00-0F  linux/gpio.h                                            <mailto:linux-gpio@vger.kernel.org>
 0xB5  00-0F  uapi/linux/rpmsg.h                                      <mailto:linux-remoteproc@vger.kernel.org>
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


