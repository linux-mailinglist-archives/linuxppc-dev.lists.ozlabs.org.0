Return-Path: <linuxppc-dev+bounces-11906-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A9DA5B4A5B6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Sep 2025 10:44:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cLcnK0zNdz30WY;
	Tue,  9 Sep 2025 18:44:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757407460;
	cv=none; b=EKXPyrz97dAvM02w5uyLXjlatq9+tPxlL6iH0lGSRA0K5j4u5BKAwxYjDr+6CaqqHL6Rpxfs0M7f6NgIEuiMW1ydBisdmWiKJhOvJlo7ANCCcead7eAATxBpZD9rc9dF+fCewQ6ZVlKfvmjeHuzen8NACyuRn2uLxlP60tyccn7Effe8CJFk2WPZWagq4Anj/qspRGXOjk9hyObxVTB7Ora8KmldPOeFPVR2yzf/w1IEJ4H8oxV9B4+JQvaev+r0RmcVut5I76NKO2eQz6P6BnQ+ZESbYYBhIQuZCUI87kzyqIBGKuxv4r7II/dhyIq+Us4I3mzMF2TKFHXcxIE1Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757407460; c=relaxed/relaxed;
	bh=TSf4LdcuccY15AWDqLOy/deU51v50DfUIpULSVx41Mc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=erENhTfu0WuaLmjZKOuzyZjq9DtR0lok0em5gFmJTp8PmQyPwXl2hcIrWn3ud84rOFugJADKTwnoMYlke4WDq4E8g1GznddZ90ji1piUzXzbYn0Go4KyVEKvVj3kx0XmztKv8IHW5TNdSAYMA5o9aYk0BcFK9jJXV+Uu8HgJPNYXLQxMrwcnPbVPVr/56NsvFS7GxP514ucQ22rGJVWW3hRkUrmMRg+yGJjiLeExyFcRXuZFpS9ehtomRg3znfdKjMZfjj/qifWraJKR/m1JxO9+PuZ92UEej5Gr7kyReCn70td1XcoAlD37CFk+Jqee1i4YKtIWUSPL/nlDfYBgWQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rn9dg2oh; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rn9dg2oh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cLcnJ0Slnz30V1
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Sep 2025 18:44:19 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 588MLHEv025033;
	Tue, 9 Sep 2025 08:44:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=TSf4LdcuccY15AWDq
	LOy/deU51v50DfUIpULSVx41Mc=; b=rn9dg2ohN43zjYHwiswiPwjR06U/VLlT4
	jamPqMXXbBNJuH8MNLPmeRKyufmSFGzCYxdQHi5OEkBb8L2siLtq/3LfF3IMLx9N
	gE+X8MQzmLQNDpjHq+WcyBHYi+m4m+nkrzOg7pGy0w8nbBXXlN8FkQh0XaQtT+d4
	LtPmDmlVZk+7OXULY/z4KgIVMwhDt3SujVWkGADcElnWZ2BtRpv2GmLXywBub4kY
	2QeCrYZhgDV6MVgUkP241FlhVSmcp/PQTMKpWb0nGPg+K3gRl1r7ZF+fW1pGfsog
	gjzhy1LN/CLWL5lDH9s6bojUBNCDZxy8ikXi/cgdcq6mDHI9huqDg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490xycueug-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Sep 2025 08:44:12 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5898ajtN002200;
	Tue, 9 Sep 2025 08:44:11 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490xycueua-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Sep 2025 08:44:11 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5896fDCm010671;
	Tue, 9 Sep 2025 08:44:10 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4910smt58c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Sep 2025 08:44:10 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5898i7t224511030
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 9 Sep 2025 08:44:08 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CD3C458064;
	Tue,  9 Sep 2025 08:44:07 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0892758059;
	Tue,  9 Sep 2025 08:44:07 +0000 (GMT)
Received: from li-4c4c4544-0038-3410-8038-c4c04f423534.ibm.com (unknown [9.61.139.105])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  9 Sep 2025 08:44:06 +0000 (GMT)
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        msuchanek@suse.de, mahesh@linux.ibm.com, tyreld@linux.ibm.com,
        hbabu@us.ibm.com, haren@linux.ibm.com, shashank.gowda@in.ibm.com,
        bjking1@linux.ibm.com
Subject: [PATCH v7 1/9] powerpc/pseries: Define papr-hvpipe ioctl
Date: Tue,  9 Sep 2025 01:43:53 -0700
Message-ID: <20250909084402.1488456-2-haren@linux.ibm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250909084402.1488456-1-haren@linux.ibm.com>
References: <20250909084402.1488456-1-haren@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: YArbGDo9pJO5xOTxV9o2AdfMHYvfxNLI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDIzNSBTYWx0ZWRfX32rkW6RzuktV
 L2u9aE3Zh3e2Wbm/+ly0FkIY2FD00C98FtURGcjyBFv8F3OEEYWuy6lPHxAtMwrXu5WH6eDpTcT
 skLUVIi9BsDqSVXZRGiA5CT8r+TmZBngBibiXC4K+piYzupfqCSK/lixnTjl7ma58bLf/dqeMl8
 UB4zIlVHLVX4pEAWA3DmGngRCvMVeT7ILzsJn1UBJDA/dHY1YPgsVEs4UtKogwM5PVhWmJEzUh9
 dKsRnKLcoyODp5TrvmO5yrmXSOvAFERQnoc5w5LuaeimrnwxYTUhmD0+gLlsUs/y32niBWxXi/W
 e8XcCqvx1osg55M3A5WwzOn18aGlIoomFv8M85T4kalbDrdEpP/KP8tfkFRM5Bfng8yRr2x9jfZ
 j70hFDrX
X-Proofpoint-GUID: umRwDztwqpLy1RnMbLYXuXjyJuR01PPW
X-Authority-Analysis: v=2.4 cv=F59XdrhN c=1 sm=1 tr=0 ts=68bfe8dc cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=yJojWOMRYYMA:10 a=VnNF1IyMAAAA:8 a=voM4FWlXAAAA:8 a=VwQbUJbxAAAA:8
 a=GD8v1-097_rLXb-cXwoA:9 a=IC2XNlieTeVoXbcui8wp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060235
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


