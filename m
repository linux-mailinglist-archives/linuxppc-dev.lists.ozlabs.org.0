Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21182431261
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Oct 2021 10:45:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HXr6w5gPQz3c5N
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Oct 2021 19:45:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TgXu+c7A;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HXr6741Tcz2yPq
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Oct 2021 19:44:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=TgXu+c7A; dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4HXr664gPQz4xd8
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Oct 2021 19:44:46 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
 id 4HXr664by0z4xbb; Mon, 18 Oct 2021 19:44:46 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=TgXu+c7A; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by gandalf.ozlabs.org (Postfix) with ESMTPS id 4HXr660V4xz4xbT;
 Mon, 18 Oct 2021 19:44:45 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19I8iNPb021733; 
 Mon, 18 Oct 2021 04:44:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=oCFVbVPbWa+H/yj5zSiC4ZnkxcsYYfw0QUg9L6H7zTI=;
 b=TgXu+c7AKKWEzlBHntP5TD4UguV+MGSX4VSPCztkepaS8JLfx61lPzHmT5kwqK2x9n3S
 +k7BkotFcmtFmvA/MhXMY6cVZv33AjNbbr4py+wW3MHuiXDTaMo6gQ75SZCdTThzmEMg
 eA5l1vgELo8XYA/E+cd80rGuiPOgLHOHloU6ygaDKLoYA4iw15e787o/DAl4wIPlcZfS
 GjWe4OsD3QKCzbEIKBKkORYIP1QPNXexhL2pj3E1I3Iw3ZwGmepiJNY3U5jxeiuKGBw1
 Q84JUySLa4MZm4px7PAhex1k77GuFJwQ/NHkz3a/D8LbwIlEc4etqOdQAzWerlgDblYL QA== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bs4wc12fv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Oct 2021 04:44:43 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19I8bv6X010133;
 Mon, 18 Oct 2021 08:44:41 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma02fra.de.ibm.com with ESMTP id 3bqpc9awwj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Oct 2021 08:44:40 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 19I8ibt551118560
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 18 Oct 2021 08:44:37 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6C40911C052;
 Mon, 18 Oct 2021 08:44:37 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DD90911C058;
 Mon, 18 Oct 2021 08:44:35 +0000 (GMT)
Received: from sjain014.ibmuc.com (unknown [9.43.54.237])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 18 Oct 2021 08:44:35 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@ozlabs.org
Subject: [RESEND PATCH v2 0/3] Update crashkernel offset to allow kernel to
 boot on large config LPARs
Date: Mon, 18 Oct 2021 14:14:31 +0530
Message-Id: <20211018084434.217772-1-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 7dT0LxXulpPk6TUmxQXnebMBqTTGmr50
X-Proofpoint-GUID: 7dT0LxXulpPk6TUmxQXnebMBqTTGmr50
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-18_02,2021-10-14_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 lowpriorityscore=0 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0
 mlxlogscore=999 phishscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110180052
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
Cc: aneesh.kumar@linux.ibm.com, hbathini@linux.ibm.com,
 mahesh@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

As the crashkernel reserve memory at 128MB offset in the first memory
block, it leaves less than 128MB memory to accommodate other essential
system resources that need memory reservation in the same block. This
creates kernel boot failure on large config LPARs having core count
greater than 192.

Setting the crashkernel to mid of RMA size which can be 512MB or more
instead of capping it to 128MB by default leaves enough space to allocate
memory to another system resource in the first memory block.

Now keeping the crashkernel at mid of RMA size works fine for the primary
kernel but creates boot failure for the kdump kernel when the crashekernel
reservation start offset crosses 256MB. The reason is, in the early boot
MMU feature of 1T segments support is not detected which restricts the paca
allocation for boot CPU below 256MB. When the crashkernel itself is
starting at 256MB offset, attempt to allocate paca below 256MB leads to the
kdump kernel boot failure.

Moving the detection of segment sizes before identifying the boot CPU
removes the restriction of 256MB limit for boot CPU paca allocation
which allows the kdump kernel to successfully boot and capture vmcore.

While allocating paca for boot CPU we found that there is a small window
during kernel boot where early_radix_enabled returns True even though
the radix is disabled using command-line. This leads to an invalid bolated
size calculation on which paca limit of boot CPU is dependent. Patch 0001
closes that window that by fixing the radix bit in mmu_feature.

changes in v2:
	0001: Rename the function name to update_cpu_features() as per
	      the review comment.
	0002: Fixed compilation error reported by kernel test robot.
	0003: Added comment and updated commit message

Resending:
	forgot to add version tag last time
	forgot to CCed PowerPC maintainer

Mahesh Salgaonkar (2):
  fixup mmu_features immediately after getting cpu pa features.
  Remove 256MB limit restriction for boot cpu paca allocation

Sourabh Jain (1):
  powerpc: Set crashkernel offset to mid of RMA region

 arch/powerpc/include/asm/book3s/64/mmu.h |  2 ++
 arch/powerpc/include/asm/mmu.h           |  1 +
 arch/powerpc/kernel/prom.c               |  8 ++++++++
 arch/powerpc/kernel/rtas.c               |  4 ++++
 arch/powerpc/kexec/core.c                | 15 +++++++++++----
 arch/powerpc/mm/book3s64/hash_utils.c    |  5 ++++-
 arch/powerpc/mm/init_64.c                |  5 ++++-
 7 files changed, 34 insertions(+), 6 deletions(-)

-- 
2.31.1

