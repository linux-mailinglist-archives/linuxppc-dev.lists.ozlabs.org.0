Return-Path: <linuxppc-dev+bounces-10053-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D0CD5AF64E1
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Jul 2025 00:15:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bXZ2d2PBQz2xKd;
	Thu,  3 Jul 2025 08:15:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751494505;
	cv=none; b=F5lTcWl32LQ6D1nmOqSHr7h7RDvUbEzPt6fD70I1ow9fGzykMzyO8eNJq7N9jADLf/B3vNPoqbw6YFJbudlqvSa2s6aLN2BtiHOCTxpQCSyC3EBOFyi5oNgQy3jgW2IkEFXoPf+oJL44MBM1OW4db1iq1EXjCu66RZrk2Tg5xgoSG0y4JY5ssFClemNVqLhAqh3KsCexWEnFu1m5YpnZm2PybcmkRbNIUpAyP8T36+lk9xytso6QtP1t16iXWMsoQDDAmD4wywd0qmJ9zpV03YBWxfsdZn6C6jrqiKR+FBnZxHwzEymhjw6P/Dmj5tkHcj7xEgB96Ej3tblkTRfFvA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751494505; c=relaxed/relaxed;
	bh=A8ZaqqcrTmnWWjF2pw8PsRBdZoRhvHkC9GaCo4BHiho=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zd+BLgk+GEeMEyEPILuW3cYpf0FWYNKcs/FMTduEHoLzzTWdsvpoyJ5JqccCE4s3GopNwz3XEvNeVbDTEWCyo18hfzDFsfVuFDkbyXkuNpsxrPbh/GVo1cGl1xuoIDrUrj29x/GoFo5jhiAz0M0M/Mg3Hj4lc80IwzXnlc5UAn/GnI07HBOMZ++HvOyuT/PUWrh956jtENZv7Z/Q1R8dyF5Q/fPNmFRtVNitcCmwj3y4gU44Xa7nii9dYl74xOLZdwrFui8kSLeYNvIRhcnhLfAmOO1ED/+dcrN8O5YtWn+bM/bWjXLpWSFh46WdC+a7piNa38Ct99fXXN5v12JjyQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=piqHj+gQ; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=piqHj+gQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bXZ2b5lL4z2xHZ
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Jul 2025 08:15:02 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 562IxJYl010048;
	Wed, 2 Jul 2025 22:14:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=A8ZaqqcrTmnWWjF2p
	w8PsRBdZoRhvHkC9GaCo4BHiho=; b=piqHj+gQPOJ/iM4WoyxPJx6+85bLTYl8q
	UbOMfAGyx+9DuiOOhXsKsIAEZyUd770VxDMa2kZqk+w1GPyPBoSt0gopfiBc3bcF
	oErCvXyZU1RLZCKfB/MlQ9Nhxc17+LE3KgwppmVsId9KY4A2hbBLuo83gLoIzSXt
	wjhD0zsDdVmIj+/MYONyMEuTYtGLPNP5ECkA8gpS0wvxBT33y4HHWYY0sHA+aAiO
	gIbO/1aQ+/36SoHUXqZQFd2qWPMT1FQIvmt+QkucNhwfrTLsCh8MF1VOR7une2Wj
	Xwc6GlvM1eX/Fd8sq+1ESYHJmgdc5Yi2YtVMvV8QMlQqXX3mEnpqw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47j83107e0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Jul 2025 22:14:54 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 562MEscK025787;
	Wed, 2 Jul 2025 22:14:54 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47j83107dw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Jul 2025 22:14:53 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 562Kq93d032151;
	Wed, 2 Jul 2025 22:14:52 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([172.16.1.73])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 47ju40sx9d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Jul 2025 22:14:52 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 562MEoWt26018454
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 2 Jul 2025 22:14:50 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0A99C58060;
	Wed,  2 Jul 2025 22:14:50 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 52BB558056;
	Wed,  2 Jul 2025 22:14:49 +0000 (GMT)
Received: from li-4910aacc-2eed-11b2-a85c-d93b702d4d28.ibm.com.com (unknown [9.61.17.45])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  2 Jul 2025 22:14:49 +0000 (GMT)
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        msuchanek@suse.de, mahesh@linux.ibm.com, tyreld@linux.ibm.com,
        hbabu@us.ibm.com, haren@linux.ibm.com
Subject: [PATCH RFC 1/9] powerpc/pseries: Define papr-hvpipe ioctl
Date: Wed,  2 Jul 2025 15:14:35 -0700
Message-ID: <20250702221444.879256-2-haren@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250702221444.879256-1-haren@linux.ibm.com>
References: <20250702221444.879256-1-haren@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: gobjhdlCSzBt4V0ltny8d_DKMLWb5tA-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDE4MSBTYWx0ZWRfX1ymOYQ2SPRNo 7D99LEXQL+w6jGncHOcKnBlTBGnNBWbDtSvsMjNIeqJMAO+PKHVdQu+xVDXKwjW2+M5s7vcYms9 Wpjs+bM8cDzKJFQjQumDphLFsxVmt+Q/Ry+pZOVqQVpnEysEHH4F92VunMuLpgQ2PZAO+fmm/BW
 yBqdizwnV7mWcmnI4uxj0FbdlXH3OQNXnuLyQ9yzocBETcDXFg+V66D8Vqpjm8nDLFjY/XlDUKM 7c+OkDQPGat4J2a9/oVw7x4nRWzKUdtSwBvhVfg0hN08Wrro5ZMoKZNLVNbnw9SUvnW1fD0NdlW Sh1n+XmGbgbbpFhSkdHcgsD8+0cVaQ8iYpx/++l15qzT40KuRXK/ESK7ZLYWoUwpTj7kwJBhlaV
 uw8dCsUnJ3h1qvUzcnK4en7/h7v6r4bGln7R6ofG5X5YU3Vd432mEQwLamf+889BOktYV5pW
X-Authority-Analysis: v=2.4 cv=MOlgmNZl c=1 sm=1 tr=0 ts=6865af5e cx=c_pps a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17 a=Wb1JkmetP80A:10 a=VnNF1IyMAAAA:8 a=VwQbUJbxAAAA:8 a=ysA9tXLOT5IESSMkrKYA:9
X-Proofpoint-GUID: ha61ZA4TJBmp-P7B4FsuyAfmafTiwJoC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_04,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 adultscore=0 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 mlxlogscore=487 spamscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507020181
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
index bc91756bde73..8ed8eb54cb7d 100644
--- a/Documentation/userspace-api/ioctl/ioctl-number.rst
+++ b/Documentation/userspace-api/ioctl/ioctl-number.rst
@@ -371,6 +371,8 @@ Code  Seq#    Include File                                           Comments
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


