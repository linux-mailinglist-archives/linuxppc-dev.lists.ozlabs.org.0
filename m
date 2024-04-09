Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C68689D0E4
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Apr 2024 05:17:13 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bBOnTa7r;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VDB2t5p6nz3vZ4
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Apr 2024 13:17:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bBOnTa7r;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VDB1R6dDSz3d2Y
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Apr 2024 13:15:55 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 43930UGZ016966;
	Tue, 9 Apr 2024 03:15:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=AJ/47AxKFINULQq5g+Io/je1XryZeopgfjhWG6Fa9EM=;
 b=bBOnTa7rFNkVfCqRn8s8oQ37WgyymuICTrnv6e49kJyTXkOjGvvK3r4eaLfXZ0c9U9Vm
 zgncjhL9H5yHX9zchoxX08k+dLuSthmJHKs8o3m1CUCSHWLlB5d1sy8c7wEyIbAkJzDm
 hGCnkCjLW0yVlZFw9ipnNtvfH5RXHKvagqhmPb/TUf1/ensQYTWPluR87SSdR8A4MUJ5
 4QFKCHvuOf+FMqzsTpM+KW0IysFc80fdwtqOnkEptIQTP0MSFvj4VEJxUGDk9P9sdHaE
 AligEdxVWAKP7nfYsYaBxlTosNUvkjdhFyShh0KeWoqg0HkQx9TueauMMMoqzgJGp7jy Ow== 
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xcwba00s5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Apr 2024 03:15:52 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 43925Sth029889;
	Tue, 9 Apr 2024 03:15:51 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3xbj7m3ppp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Apr 2024 03:15:50 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4393FkLj34734696
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 9 Apr 2024 03:15:49 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D493D20043;
	Tue,  9 Apr 2024 03:15:46 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6BF6120040;
	Tue,  9 Apr 2024 03:15:46 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  9 Apr 2024 03:15:46 +0000 (GMT)
Received: from jarvis.ozlabs.ibm.com.com (unknown [9.36.30.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id DF8DF61085;
	Tue,  9 Apr 2024 13:15:42 +1000 (AEST)
From: Andrew Donnellan <ajd@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org
Subject: [PATCH 2/2] MAINTAINERS: Make cxl obsolete
Date: Tue,  9 Apr 2024 13:10:27 +1000
Message-ID: <20240409031027.41587-2-ajd@linux.ibm.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240409031027.41587-1-ajd@linux.ibm.com>
References: <20240409031027.41587-1-ajd@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: SEueMfRQOtneXDwXmBxMq3ffRDha5uDB
X-Proofpoint-GUID: SEueMfRQOtneXDwXmBxMq3ffRDha5uDB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-08_19,2024-04-05_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0 mlxlogscore=650
 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2404010000
 definitions=main-2404090018
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
Cc: fbarrat@linux.ibm.com, ukrishn@linux.ibm.com, manoj@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The cxl driver is no longer actively maintained and we intend to remove it
in a future kernel release. Change its status to obsolete, and update the
sysfs ABI documentation accordingly.

Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
---
 Documentation/ABI/{testing => obsolete}/sysfs-class-cxl | 3 +++
 MAINTAINERS                                             | 4 ++--
 2 files changed, 5 insertions(+), 2 deletions(-)
 rename Documentation/ABI/{testing => obsolete}/sysfs-class-cxl (99%)

diff --git a/Documentation/ABI/testing/sysfs-class-cxl b/Documentation/ABI/obsolete/sysfs-class-cxl
similarity index 99%
rename from Documentation/ABI/testing/sysfs-class-cxl
rename to Documentation/ABI/obsolete/sysfs-class-cxl
index cfc48a87706b..8cba1b626985 100644
--- a/Documentation/ABI/testing/sysfs-class-cxl
+++ b/Documentation/ABI/obsolete/sysfs-class-cxl
@@ -1,3 +1,6 @@
+The cxl driver is no longer maintained, and will be removed from the kernel in
+the near future.
+
 Please note that attributes that are shared between devices are stored in
 the directory pointed to by the symlink device/.
 For example, the real path of the attribute /sys/class/cxl/afu0.0s/irqs_max is
diff --git a/MAINTAINERS b/MAINTAINERS
index 34f605498873..5eca2c23fb49 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5770,8 +5770,8 @@ CXL (IBM Coherent Accelerator Processor Interface CAPI) DRIVER
 M:	Frederic Barrat <fbarrat@linux.ibm.com>
 M:	Andrew Donnellan <ajd@linux.ibm.com>
 L:	linuxppc-dev@lists.ozlabs.org
-S:	Supported
-F:	Documentation/ABI/testing/sysfs-class-cxl
+S:	Obsolete
+F:	Documentation/ABI/obsolete/sysfs-class-cxl
 F:	Documentation/arch/powerpc/cxl.rst
 F:	arch/powerpc/platforms/powernv/pci-cxl.c
 F:	drivers/misc/cxl/
-- 
2.44.0

