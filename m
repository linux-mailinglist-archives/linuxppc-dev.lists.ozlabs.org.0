Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E9CDD5EA6F1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 15:18:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MbjxK5qpyz3cJC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 23:18:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=R7dwZWzQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=R7dwZWzQ;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mbjvx6G5wz30MT
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Sep 2022 23:17:01 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28QBgMoQ004765;
	Mon, 26 Sep 2022 13:16:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=yzaBqGlmr9z0WILYDL7+0YEOCV7bF7YOavzmZIkGJY4=;
 b=R7dwZWzQ7S04vsq2rMwvlqaCZJ3qehDbobZjTzkGRyid769mtos/MPmqZP2A9OlHDzLa
 iemmjpskP53nbwmab/oKH5OD88k3MeeeKd5mvfDtDTqxoWRkUfV7n8iNvCWZFlUUhSfy
 Lz2rgYVi52u27lzU4ixJ21N+K0tNJz/b0M/AIPQ31YRHoK2mtXhd5T0c/fv/NUHVtgFQ
 KvQ+tFOKq2/J6Dq8nK2HrccrnlmvFv2Qst2lzOhQPKP+CETyovdswLGb6jkwoIe7Q7Pq
 +aZbDGDr35+AhBd19aDrJPWjJ6variJazsPbwkybd1CWRaRQs66QQwaoGLyyrkYJvh8g nA== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com [169.55.85.253])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3ju8kh782t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Sep 2022 13:16:45 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
	by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28QD6CtU011689;
	Mon, 26 Sep 2022 13:16:44 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
	by ppma01wdc.us.ibm.com with ESMTP id 3jt40rk43w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Sep 2022 13:16:44 +0000
Received: from smtpav01.dal12v.mail.ibm.com ([9.208.128.133])
	by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28QDGh7P12911048
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 26 Sep 2022 13:16:43 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6C48758057;
	Mon, 26 Sep 2022 13:16:43 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 512CA58059;
	Mon, 26 Sep 2022 13:16:43 +0000 (GMT)
Received: from localhost (unknown [9.163.91.170])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 26 Sep 2022 13:16:43 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-security-module@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] powerpc/pseries: restrict error injection and DT changes when locked down
Date: Mon, 26 Sep 2022 08:16:41 -0500
Message-Id: <20220926131643.146502-1-nathanl@linux.ibm.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 1bov1B5pxHJJ6EuhXp0wwiyMVTePjLRe
X-Proofpoint-ORIG-GUID: 1bov1B5pxHJJ6EuhXp0wwiyMVTePjLRe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-26_08,2022-09-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxscore=0
 malwarescore=0 impostorscore=0 adultscore=0 mlxlogscore=863 phishscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209260083
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: ajd@linux.ibm.com, nayna@linux.ibm.com, jmorris@namei.org, paul@paul-moore.com, gcwilson@linux.ibm.com, serge@hallyn.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add two new lockdown reasons for use in powerpc's pseries platform
code.

The pseries platform allows hardware-level error injection via certain
calls to the RTAS (Run Time Abstraction Services) firmware. ACPI-based
error injection is already restricted in lockdown; this facility
should be restricted for the same reasons.

pseries also allows nearly arbitrary device tree changes via
/proc/powerpc/ofdt. Just as overriding ACPI tables is not allowed
while locked down, so should this facility be restricted.

Changes since v1:
* Move LOCKDOWN_DEVICE_TREE next to LOCKDOWN_ACPI_TABLES.

Nathan Lynch (2):
  powerpc/pseries: block untrusted device tree changes when locked down
  powerpc/rtas: block error injection when locked down

 arch/powerpc/kernel/rtas.c                | 25 ++++++++++++++++++++++-
 arch/powerpc/platforms/pseries/reconfig.c |  5 +++++
 include/linux/security.h                  |  2 ++
 security/security.c                       |  2 ++
 4 files changed, 33 insertions(+), 1 deletion(-)

-- 
2.37.3

