Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCDFC6116BC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Oct 2022 18:02:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MzS3W457Gz3cMY
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Oct 2022 03:01:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sclVKHF0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sclVKHF0;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MzS2V6sWSz3cFw
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Oct 2022 03:01:06 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29SFnm6s031754;
	Fri, 28 Oct 2022 16:00:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=nQq60V1oo5J1R3ASm51G6DPiVcrtmxiC1pICdKF43hg=;
 b=sclVKHF0y2hmKYrbhujVHiQSuTBhtWhVK5GLeFxJt5svHnwqmURbV9DHH0QaFZ2827kf
 qJHIIufLS6n4XnH+Z5Iz+6iTZvzQYvQtk8FzmJdiIdlRn+5Ip5N5yrtZsUPPqStNG9pd
 HpJ2Dv6wpW6hw4Kq7zOFMttKso3fKptFhpioYCRwCWu1IcPmmEB/TcMmyEt1j0YxSGzi
 TES0jX0FSFMl/EI8g7Y1rxHxX/upujC2KrnMrCVbuGQw14rpvbEGSAC//yGinmAWVwvO
 9gFh2F4V2XOjuOs19J89vhAdpxBd8ZgUSwQy6D1FYD3XBXwu9RLaZszhFJoRcMG1JRAo Hw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kgj2n8a8k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Oct 2022 16:00:40 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29SFobSS002110;
	Fri, 28 Oct 2022 16:00:40 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com [149.81.74.108])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kgj2n8a7k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Oct 2022 16:00:40 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
	by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29SFoZK3026796;
	Fri, 28 Oct 2022 16:00:38 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
	by ppma05fra.de.ibm.com with ESMTP id 3kfahd2u2g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Oct 2022 16:00:38 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 29SG0ZXc64553266
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 28 Oct 2022 16:00:35 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CADFE11C04C;
	Fri, 28 Oct 2022 16:00:35 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 85D4011C050;
	Fri, 28 Oct 2022 16:00:35 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.145.94.157])
	by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Fri, 28 Oct 2022 16:00:35 +0000 (GMT)
From: Laurent Dufour <ldufour@linux.ibm.com>
To: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu
Subject: [PATCH 0/2] Consider the size of the added CPU nodes in the kexec FDT
Date: Fri, 28 Oct 2022 18:00:32 +0200
Message-Id: <20221028160034.44400-1-ldufour@linux.ibm.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 3Pkl365ZxNgnF8-rgtoZ6S6KvVLjQLHX
X-Proofpoint-GUID: AvFhshpIl_JIZaWRakBzBdxt3W0jsZ_0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-28_07,2022-10-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=945
 impostorscore=0 spamscore=0 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1011 adultscore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2210280097
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When adding CPUs to an already big system (test show it seems to start with
more than 256 CPUs), the kernel is showing error messages when building the
FDT for the kexec kernel (kdump or kexec).

It's worth to mention that the kdump kernel is reloaded after a CPU add
operation.

The messages look like (property's name may vary):
10175.025675] Unable to add 32-64-bridge property: FDT_ERR_NOSPACE

This happens because the size of the FDT is computed based on the size of
the FDT the kernel received at boot time. There is additional space added
in kexec_extra_fdt_size_ppc64() for the added memory but nothing is done
for the added CPUs.

This patch adds this feature so adding new CPUs will increase the size of
the FDT for the kexec kernel.

To compute the additional size required, the number of CPU nodes of the
initial FDT (the one the kernel receive at boot time) are recorded. When a
kexec FDT is created, the number of CPU nodes in the current FDT is used to
compute the additional size.

The first patch of this series is creating a variable provided by the boot
code when parsing the initial FDT at boot time.
The second patch is computing the required additional space.

This has been tested on a PowerVM LPAR running with than 256 CPUs in shared
mode, adding 320 CPUs to this LPAR.

Laurent Dufour (2):
  powerpc: export the CPU node count
  powerpc: Take in account addition CPU node when building kexec FDT

 arch/powerpc/include/asm/kexec_ranges.h |  2 +
 arch/powerpc/kernel/prom.c              |  4 ++
 arch/powerpc/kexec/file_load_64.c       | 59 ++++++++++++++++++++++++-
 3 files changed, 64 insertions(+), 1 deletion(-)

-- 
2.38.1

