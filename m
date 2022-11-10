Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3949462491A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Nov 2022 19:09:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N7VGL0GDYz3f50
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Nov 2022 05:09:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=P7QJDLBU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=P7QJDLBU;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N7VCH6JQ5z3cB8
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Nov 2022 05:06:35 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2AAGL0nG029537;
	Thu, 10 Nov 2022 18:06:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=x9qGOFXLRv+uNhIKAtTPNY7eA9HL4PsoZn3ZoDOZtmc=;
 b=P7QJDLBUTHyO2UG5q42yrD5YlRcaPfb5XoitdtYpkCHHZr/4ZO7UnOcPgGybUcQqxorv
 4S1/bb4AA4FEwxCoG7Ph8sWWw/99qiXrQaMD55kKTz5GutHy1GTD+DhKBkEffZ9bEfqS
 Y95LyXh3Ah2jxWq7vXdez+pRaDXw8+Bjg9yZeJ2lV3KuPaMSkEfNMokBeZbnXpbAXPi2
 wytGaztF7SjvlHGloZIyH6y0o/jBzZDiE9k2DhRdi6qeaXVfu17oTBHlsgwhwzTAUjiL
 IFv27ESBFKCiXAqcNETl3C5aIIS17Ei89IfDvAgzupsbA87zUbVBn2S9qWYtchVcfru3 hQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ks4r9kevv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Nov 2022 18:06:26 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2AAHxovq004044;
	Thu, 10 Nov 2022 18:06:26 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ks4r9keuj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Nov 2022 18:06:26 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AAI6N2M018071;
	Thu, 10 Nov 2022 18:06:23 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
	by ppma06ams.nl.ibm.com with ESMTP id 3kngncfnex-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Nov 2022 18:06:23 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com [9.149.105.62])
	by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2AAI6LTI36569638
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 10 Nov 2022 18:06:21 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 888AEAE04D;
	Thu, 10 Nov 2022 18:06:21 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 35443AE045;
	Thu, 10 Nov 2022 18:06:21 +0000 (GMT)
Received: from pomme.tlslab.ibm.com (unknown [9.101.4.33])
	by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Thu, 10 Nov 2022 18:06:21 +0000 (GMT)
From: Laurent Dufour <ldufour@linux.ibm.com>
To: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu
Subject: [PATCH v2 0/2] Consider the size of the added CPU nodes in the kexec FDT
Date: Thu, 10 Nov 2022 19:06:17 +0100
Message-Id: <20221110180619.15796-1-ldufour@linux.ibm.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: zoVLFG3OJV6pHXkxWDfLyhBtQByd5MIx
X-Proofpoint-ORIG-GUID: zc8BYcdGoR9I64qUgwW1AI7Hpx_-H7et
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-10_12,2022-11-09_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 mlxlogscore=999
 suspectscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2210170000 definitions=main-2211100126
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

Changes in v2:
 - Fix build issue, moving definition in prom.h

Laurent Dufour (2):
  powerpc: export the CPU node count
  powerpc: Take in account addition CPU node when building kexec FDT

 arch/powerpc/include/asm/prom.h   |  1 +
 arch/powerpc/kernel/prom.c        |  3 ++
 arch/powerpc/kexec/file_load_64.c | 60 ++++++++++++++++++++++++++++++-
 3 files changed, 63 insertions(+), 1 deletion(-)

-- 
2.38.1

