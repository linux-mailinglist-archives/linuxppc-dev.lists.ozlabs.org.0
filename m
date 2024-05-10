Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2547D8C21FF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 May 2024 12:23:36 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sN7FaBVL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VbQ2Y4thcz3fmP
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 May 2024 20:23:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sN7FaBVL;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VbQ1n2RQVz3fQj
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 May 2024 20:22:53 +1000 (AEST)
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4VbQ1n1VX3z4x2g
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 May 2024 20:22:53 +1000 (AEST)
Received: by gandalf.ozlabs.org (Postfix)
	id 4VbQ1n1DP2z4x2d; Fri, 10 May 2024 20:22:53 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sN7FaBVL;
	dkim-atps=neutral
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4VbQ1m4pXGz4wc7;
	Fri, 10 May 2024 20:22:52 +1000 (AEST)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44AAHQiC025196;
	Fri, 10 May 2024 10:22:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=RQY9xdSDULm7ThP7RW+sY3PMWk7KpJpK2GmRpQtVWpw=;
 b=sN7FaBVLKLf8550QGoc9952ljFHzY4ylE3Iu0jjyYg75euSg6osKOJPDZEXxp37nzJ27
 LU29AGfZ17o6QJR1KsBcuyxSvknoACY47OcHWqOfWeqDPVISlsW/ZRkyu55kDUnuBEsM
 hYVJkxgqm1dcft9VWmIzpAZ59tDr44FkEcZTthAAeyGTQ/7JPQZlCuIsVisfHKJGs5sm
 91hRZWoURn9+kfM7O85SxX4VLjljK9fMoV+RBNbmwFdXkhdpuv+2CKymWz1H24l2MFbr
 EQY9EqJU59HNAwV4zdHRADLY5ym373bJMug52Xgb18bOx0PMvU/7Hx4DEt/ECx03Dhg1 XQ== 
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y1hpmr0bj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 May 2024 10:22:49 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44A79L6x017557;
	Fri, 10 May 2024 10:22:49 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3xysht8kvs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 May 2024 10:22:48 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44AAMhKE49086858
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 May 2024 10:22:45 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2091B20043;
	Fri, 10 May 2024 10:22:43 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 272DD20040;
	Fri, 10 May 2024 10:22:40 +0000 (GMT)
Received: from li-4f5ba44c-27d4-11b2-a85c-a08f5b49eada.ibm.com.com (unknown [9.43.57.122])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 10 May 2024 10:22:39 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH v2 0/2] powerpc: kexec fixes
Date: Fri, 10 May 2024 15:52:33 +0530
Message-ID: <20240510102235.2269496-1-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.44.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: kmgkAfgjdi0qQj7WLhtoJDwRW4EOQqwz
X-Proofpoint-ORIG-GUID: kmgkAfgjdi0qQj7WLhtoJDwRW4EOQqwz
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-10_07,2024-05-10_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 mlxscore=0 malwarescore=0 mlxlogscore=630 spamscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2405100074
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
Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>, Sourabh Jain <sourabhjain@linux.ibm.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Aditya Gupta <adityag@linux.ibm.com>, Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Patch series fixes two kexec issues.

01/02: Update extra size calculation for kexec FDT to avoid kexec load
failure due to FDT_ERR_NOSPACE while including CPU nodes added post
boot and reserved memory ranges.

02/02: Fix update_cpus_node/core_64.c function to include missing device
nodes under /cpus node with device_type != "cpu".

Note: this patch series is rebased on top of the linux-next/master,
tag: next-20240509 to avoid the conflict with the below patch series:
https://lore.kernel.org/all/171509287314.62008.11812494124513471250.b4-ty@ellerman.id.au/

Changelog:
==========

v2:
  - Initialize local variable `cpu_nodes` before using it. 01/02
  - Rebased on top of linux-next/mater tag: next-20240509.

v1:
  - https://lore.kernel.org/all/20240508130558.1939304-1-sourabhjain@linux.ibm.com/


Cc: Aditya Gupta <adityag@linux.ibm.com>
Cc: Hari Bathini <hbathini@linux.ibm.com>
Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>

Sourabh Jain (2):
  powerpc/kexec_file: fix extra size calculation for kexec FDT
  powerpc/kexec_file: fix cpus node update to FDT

 arch/powerpc/include/asm/kexec.h  |  6 ++--
 arch/powerpc/kexec/core_64.c      | 53 +++++++++++++++++++++----------
 arch/powerpc/kexec/elf_64.c       | 12 +++++--
 arch/powerpc/kexec/file_load_64.c | 53 +++++++++++++------------------
 4 files changed, 70 insertions(+), 54 deletions(-)

-- 
2.44.0

