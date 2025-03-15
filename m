Return-Path: <linuxppc-dev+bounces-7083-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE93A62A0D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Mar 2025 10:28:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZFGBF3KQ5z3cbF;
	Sat, 15 Mar 2025 20:28:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742030901;
	cv=none; b=asXWr5EJddRsMuwvwy88lQt2EflpRPjKbW2OBMw64bSUdyXYt9sQyfTtt7nvHgkSabHq0tdZS7Nc3yH5y5BiSc2ysx/msMiTNYfIjuzzDeFzf9nh9ngvHDXihpfF3+OeNgqsYesISKzJC2EFVt/hO+Rc6kYH+/YeTUFx0oY8K/ozcmkX0pQTeSWRbwARHuJHgZcl+xvarYIR3vH7gtyMbICqpLM1TPoDfRIhV46M41II73krQYzM5IMwEO7nATo098iorWl/9ivFs8tdaUiB/C8TpaTlem1KEPdyaQAYsDm6G+kSZDWm+LPUc0t4Rrq1XhUZFODZtjZWlw6quJCM5A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742030901; c=relaxed/relaxed;
	bh=PN0dRpgUXpxeLbJJP4fV7ZQk/Z8UO5cVk0NXXSjNqf8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BjPLkfGwZiXbMcLZyI06NgehHpNOSpdgWxY9+zplXEwuYlJvgU95/urDkt7eKnwZy698+q9jlgFq8RZUwefssw/f4Z+X//45JNx6RQR1JVad68DxZ0k8mNOzeJ84fcqGzUDrYeKxzRB+s08oUaAfphG8oeVJhF1yhjQm+iwI5YjAY3qf/r2f3/c+lU81t0nVgqWnZk6OCYTsEohuATtLf9bmLRfOGx3z6A9dEPyUCSlbSjuRX7HpAk9K0k7fLgkpAddYL27K1PP2t+IsCV9JR6wKFRQjTr/Nk7foSVKQRN+MRhjQfXBBhWtjh5YXCoZ5fkDo8XGuO5GD9p+YX91TMA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=efACTwvu; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=efACTwvu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZFGBD1zMHz30Nl
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Mar 2025 20:28:19 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52F7Em79006195;
	Sat, 15 Mar 2025 09:28:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=PN0dRpgUXpxeLbJJP
	4fV7ZQk/Z8UO5cVk0NXXSjNqf8=; b=efACTwvuJ1PfNpsI9QeVzrhIK6BqBGmhA
	Tsen63vN35hN9+RexhViyI/Ilf/p+UDubRkd2uFO8TrF8oS+YOr7GI8peBjEa5Yi
	a2gZzCTG54+sV1dpfNZc+6rJVdhyPrXqUi89bvrqdnEFD61kJMZzIx+PYiXzyNhl
	kuh9JMnuVUxeBVqu6h4z/8iKcQpo27uEsREoWLIL9QLHpOu7dHYC5cT4Hrc6TIRt
	4n5vFUGBjsIlzTruYKvgkBSKtq6LmOBJoj6Xt/jIh149rqrnCGy0vCavRosTWOZE
	OEFiV+27IrA2VtwfBuzw/FTFlhbvmiVD6/TyIW4r+Meyxfw4xZpwA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45d1vwgwjh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 15 Mar 2025 09:28:12 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 52F9SBXJ019433;
	Sat, 15 Mar 2025 09:28:11 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45d1vwgwjf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 15 Mar 2025 09:28:11 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 52F8SfCd023525;
	Sat, 15 Mar 2025 09:28:10 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 45d1qj13t3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 15 Mar 2025 09:28:10 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 52F9S7TH32571950
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 15 Mar 2025 09:28:07 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7E18D5805A;
	Sat, 15 Mar 2025 09:28:07 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A5DB958056;
	Sat, 15 Mar 2025 09:28:06 +0000 (GMT)
Received: from li-4910aacc-2eed-11b2-a85c-d93b702d4d28.ibm.com.com (unknown [9.61.74.78])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Sat, 15 Mar 2025 09:28:06 +0000 (GMT)
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        msuchanek@suse.de, mahesh@linux.ibm.com, tyreld@linux.ibm.com,
        hbabu@us.ibm.com, haren@linux.ibm.com, sv@linux.ibm.com
Subject: [PATCH v9 2/7] powerpc/pseries: Define papr_indices_io_block for papr-indices ioctls
Date: Sat, 15 Mar 2025 02:27:50 -0700
Message-ID: <20250315092756.1031182-3-haren@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250315092756.1031182-1-haren@linux.ibm.com>
References: <20250315092756.1031182-1-haren@linux.ibm.com>
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
X-Proofpoint-GUID: IhKtZQMMVyc1HDxPYK2DIZLc2m3gjMpK
X-Proofpoint-ORIG-GUID: E6xxzPwXjmAy13JkGTUXnIQPz0BGmYhF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-15_03,2025-03-14_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 malwarescore=0
 mlxscore=0 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 spamscore=0 impostorscore=0 mlxlogscore=896 lowpriorityscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503150064
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


