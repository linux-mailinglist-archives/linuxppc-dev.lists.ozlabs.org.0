Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E2F426E7F
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Oct 2021 18:16:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HQtcG2zqsz3bj3
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Oct 2021 03:16:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=E+bmCS4A;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HQtbW1Hztz2xt6
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Oct 2021 03:16:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=E+bmCS4A; dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4HQtbW0lzsz4xbZ
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Oct 2021 03:16:07 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
 id 4HQtbW0j3Pz4xbV; Sat,  9 Oct 2021 03:16:07 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=E+bmCS4A; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by gandalf.ozlabs.org (Postfix) with ESMTPS id 4HQtbV2pR2z4xbG;
 Sat,  9 Oct 2021 03:16:05 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 198G6LWC004266; 
 Fri, 8 Oct 2021 12:16:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=wHGCaMhzns6E4VpxqMZNr4VPru4hJijspVi1FBW2b7k=;
 b=E+bmCS4A/CySBgDtynWh9zQJ3aUltNyAEV24rNsp1gDY32+5G9kNjaurogMYM42Oqldx
 TJTJvFKUj5BRrCF70JdsGLlTf/t6xRM5fKJeWlJHfvfwdRubvf8BnyvuGTQ7kG5KmAqG
 dFScAdqxJaeHxVc26hbiLhB/DMR1S9lZvPtF9uYyrRO4yTNtINXnB+xiTQ/FoHQLcA39
 OzfTwSKm4JXGTZvE8UJiRfnhqjC6ZFsxrZ4/Kty99Wyg0JgQZHs9fjuI5EMR6VeEhGNc
 HrESdHGqCHcPjOl5rcgmktYVu5VthsRKNIi7LH3lXemOeAKJjjv2ujXby8QRiDDx578W gA== 
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bjhum3ra7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Oct 2021 12:16:03 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 198GCWji018814;
 Fri, 8 Oct 2021 16:16:00 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04fra.de.ibm.com with ESMTP id 3bef2b01vh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Oct 2021 16:16:00 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 198GFueG18678148
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 8 Oct 2021 16:15:56 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2F50AA4062;
 Fri,  8 Oct 2021 16:15:56 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1AA33A405C;
 Fri,  8 Oct 2021 16:15:54 +0000 (GMT)
Received: from sjain014.ibmuc.com (unknown [9.43.25.237])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  8 Oct 2021 16:15:53 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] Update crashkernel offset to allow kernel to boot on
 large config LPARs
Date: Fri,  8 Oct 2021 21:45:49 +0530
Message-Id: <20211008161552.211262-1-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: iotpZJQFMPk9RQJDUmAEw2R28iADHRqK
X-Proofpoint-GUID: iotpZJQFMPk9RQJDUmAEw2R28iADHRqK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-08_04,2021-10-07_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 mlxlogscore=999
 suspectscore=0 lowpriorityscore=0 spamscore=0 phishscore=0 clxscore=1015
 mlxscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110080092
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
Cc: linuxppc-dev@ozlabs.org, mahesh@linux.vnet.ibm.com,
 aneesh.kumar@linux.ibm.com, hbathini@linux.ibm.com
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

