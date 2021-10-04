Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F92421264
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Oct 2021 17:12:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HNPN03sg1z2ynG
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Oct 2021 02:12:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dOHSy1Er;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HNPMG3pHbz2yJM
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Oct 2021 02:11:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=dOHSy1Er; dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4HNPMG372rz4xbV
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Oct 2021 02:11:54 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
 id 4HNPMG3536z4xbR; Tue,  5 Oct 2021 02:11:54 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=dOHSy1Er; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by gandalf.ozlabs.org (Postfix) with ESMTPS id 4HNPMG061nz4xb9;
 Tue,  5 Oct 2021 02:11:53 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 194EslAb013231; 
 Mon, 4 Oct 2021 11:11:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=/pED2LQC9LqzPJIxtOTF67GmisCBvq2p2EFye0bxS+g=;
 b=dOHSy1ErN0zyIJDbW/JODWeaoLyGqrVeXVe/bgBll9a599vaxXAP73RFBxGabeoIbQud
 N+1GC3wAvj5ZXbBzkqsU6o1KMYGm2i6j+FxTCCIHqUF5i63UPCgzPAtIdaICwbEpSx/l
 AQbPJJralGVaxgLq8PmhrjplqpOkihxFyME1QFjODf2CjRWqZ9wyOEwLRZif4Smk0xF6
 9MRQ7HScU1nXpmZ0aS0TGC3ohNCYGnq0mTyuP5d7P8TJjxUUKwWLvmyL2DHSZme7kHz+
 sKkd2Ffj1evPqV2VgYhgd8jSQNgNCsHCu8L/d5+ONtTLrAfUQ4uCydDqD0KruDc9kJIE aw== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3bg35qhra3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Oct 2021 11:11:50 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 194F962A004392;
 Mon, 4 Oct 2021 15:11:48 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03ams.nl.ibm.com with ESMTP id 3bef29rq9u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Oct 2021 15:11:48 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 194FBin83539496
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 4 Oct 2021 15:11:44 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CC65211C04C;
 Mon,  4 Oct 2021 15:11:44 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1729B11C07A;
 Mon,  4 Oct 2021 15:11:43 +0000 (GMT)
Received: from sjain014.ibmuc.com (unknown [9.43.74.5])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  4 Oct 2021 15:11:42 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH 0/3] Update crashkernel offset to allow kernel to boot on
 large config LPARs
Date: Mon,  4 Oct 2021 20:41:39 +0530
Message-Id: <20211004151142.256251-1-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: iNvzv-4BJDcjOxbAUGQX5Q8cRZgEYe-D
X-Proofpoint-ORIG-GUID: iNvzv-4BJDcjOxbAUGQX5Q8cRZgEYe-D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-04_04,2021-10-04_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1011
 priorityscore=1501 impostorscore=0 mlxscore=0 lowpriorityscore=0
 spamscore=0 adultscore=0 phishscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110040104
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
Cc: mahesh@linux.vnet.ibm.com, aneesh.kumar@linux.ibm.com,
 linux-kernel@vger.kernel.org, hbathini@linux.ibm.com, linuxppc-dev@ozlabs.org
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

Mahesh Salgaonkar (2):
  fixup mmu_features immediately after getting cpu pa features.
  Remove 256MB limit restriction for boot cpu paca allocation

Sourabh Jain (1):
  powerpc: Set crashkernel offset to mid of RMA region

 arch/powerpc/include/asm/book3s/64/mmu.h |  2 ++
 arch/powerpc/include/asm/mmu.h           |  1 +
 arch/powerpc/kernel/prom.c               |  5 +++++
 arch/powerpc/kernel/rtas.c               |  3 +++
 arch/powerpc/kexec/core.c                | 13 +++++++++----
 arch/powerpc/mm/book3s64/hash_utils.c    |  5 ++++-
 arch/powerpc/mm/init_64.c                |  5 ++++-
 7 files changed, 28 insertions(+), 6 deletions(-)

-- 
2.31.1

