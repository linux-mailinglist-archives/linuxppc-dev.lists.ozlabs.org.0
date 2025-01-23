Return-Path: <linuxppc-dev+bounces-5505-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E0AA1A350
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jan 2025 12:43:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YdzbN2dZbz304Z;
	Thu, 23 Jan 2025 22:43:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737632592;
	cv=none; b=VX/9eJSF/8Wbm4LNFBytZz+90KO48QMDTO3ozPklfnqgzWaAi4qNLXYLEA7dgpAXN16Z5XQNg/2vstSVfqHhECnkx4GjjAsa+WgYy7iF9sgIAdiLZXeEUbkWiRNWngu064SuJTQ/D+5HMytOgARIin45G3TT1I5gwUzuf69CgjTVuOQ+HufzSOl2wnA2kgctTDJ5Z+78xa3E/liTLRlZg+aHKJyELQNafWxIkNaI6iKBgIN96fEtXlbMyI3oUXXFnPNSEA2yaQmf2Q2HRN3KoLgiPGikxDS74xnMZ8CtC0J2WIVSxn6A1b7BocuoLSC+BD3rLU75BPWEo+DsS9ooqA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737632592; c=relaxed/relaxed;
	bh=SkD4Cu+2FxpsUv1muMIrFGtikfbYKiUj/BMohe2/CB8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Fryu1JqmP5PVHTWu8ggP9K57GqkxELiV1/vfx8K4fv3IA633l6pBOKjaXow1r1StPpNIPri7GPpdHbWuPnO4yFjicSinpaYfzEtg+CPHWGhyh0iYE65M9e5B0JJn29RQRwF4TuSAQ0ME7+bjnAhUCPAFXogdCfLFvT4TILxW6sPbxV1a67EJXB/bknAZEH/DjmupKm6o16SeHA1Qu6DRHZhiJ7NtBQV7DaL8JMTrChibJMbUorqlzfQ/BIEh8ZHN/6XpHFcO43LBFVAb9y58bd4tPj9yN2aNhx3jchKl0LnzUsiQPB0U/9JmDt1F6O6Dxc9ydoSqg/G4c/YoqOHk7w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=s+XRxBL3; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=s+XRxBL3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YdzbM4WK3z304C
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jan 2025 22:43:11 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50N184jH022435;
	Thu, 23 Jan 2025 11:43:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=SkD4Cu+2FxpsUv1muMIrFGtikfbYKiUj/BMohe2/C
	B8=; b=s+XRxBL31xmbLapvuljtjVw5WsEsBfO0u2bHeLRd+hZZFx1Y9Mjo19CsL
	l6tmTyKa88dH9hx0u7L+HsaAERHfEB+AEt5tLNr7PoN0tltEns0jN7t+LWlfcoDA
	XnSgss+397dg2VKaaE8H0T4zQMWpDMO5fjYxwMEOaM/s9Fo9Gv81D8fE0aqxyGuY
	e9u/jrc4+Kk72FxCRM1v68ctnKn/2XFyUAsDQen6EH+oJM6mFUlNk3qIht6Jyf80
	JeQoWPHNfM6laE0SQQSAIpktylY23bbv/jhFDfY/XcYwCe/OIAEeG7pBDukIq84h
	cyePvdTgLqZUs2x25c9uMbJN1FPmQ==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44bbu9am61-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jan 2025 11:43:03 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50NBBTZd022449;
	Thu, 23 Jan 2025 11:43:02 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 448r4kd750-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jan 2025 11:43:02 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50NBgwpI61538708
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 23 Jan 2025 11:42:58 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7B73720043;
	Thu, 23 Jan 2025 11:42:58 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 622FE20040;
	Thu, 23 Jan 2025 11:42:56 +0000 (GMT)
Received: from li-4f5ba44c-27d4-11b2-a85c-a08f5b49eada.in.ibm.com (unknown [9.109.204.94])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 23 Jan 2025 11:42:56 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>,
        Avnish Chouhan <avnish@linux.ibm.com>,
        Brian King <brking@linux.ibm.com>,
        Hari Bathini <hbathini@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Mahesh Salgaonkar <mahesh@linux.ibm.com>
Subject: [PATCH v3 0/4] powerpc: increase MIN RMA size for CAS negotiation
Date: Thu, 23 Jan 2025 17:12:50 +0530
Message-ID: <20250123114254.200527-1-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.48.1
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
X-Proofpoint-GUID: _Xcp8WwX6Mw9lso2FpmfS91yvj96GC74
X-Proofpoint-ORIG-GUID: _Xcp8WwX6Mw9lso2FpmfS91yvj96GC74
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-23_05,2025-01-22_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 priorityscore=1501 clxscore=1015 adultscore=0 bulkscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501230087
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Change RMA size from 512 MB to 768 MB which will result
in more RMA at boot time for PowerPC. When PowerPC LPAR use/uses vTPM,
Secure Boot or FADump, the 512 MB RMA memory is not sufficient for
booting. With this 512 MB RMA, GRUB2 run out of memory and unable to
load the necessary. Sometimes even usage of CDROM which requires more
memory for installation along with the options mentioned above troubles
the boot memory and result in boot failures. Increasing the RMA size
will resolves multiple out of memory issues observed in PowerPC.

Due to the change in the MIN_RMA size, there is an impact on the
additional parameter for the FADump feature in HASH MMU. The first two
patches in this series update the memory allocation policy for the
additional parameter in FADump for HASH MMU to mitigate that impact.

Patch 01/04: Exports the `MIN_RMA` so that the FADump code can access
             it.
Patch 02/04: Changes the memory reservation policy for the FADump
             additional parameter in HASH MMU.
Patch 03/04: Change MIN_RMA to 768MB
Patch 04/04: Update fadump document to include details about the
             additional parameter feature

Note: This policy change does not impact the RADIX MMU additional
      parameter for the FADump feature.

Testing Done:  
=============
The patch series has been tested with the following four scenarios, and
both the production kernel and FADump kernel boot successfully.  

- Distro: RHEL 9.6

1. Production Kernel: RADIX MMU
   FADump Kernel:     RADIX MMU
   - MIN_RMA: 768 MB
   - RMA:     1 GB
     - a. crashkernel: 4 GB
     - b. crashkernel: 1 GB

2. Production Kernel: HASH MMU
   FADump Kernel:   HASH MMU
   - MIN_RMA: 768 MB
   - RMA:     1 GB
     - a. crashkernel: 768 MB
     - b. crashkernel: 1 GB


Changelog:
==========

MIN RMA change
---------------
v1: https://lore.kernel.org/all/20241205101045.27069-1-avnish@linux.ibm.com/

v2: https://lore.kernel.org/all/20241206065545.14815-1-avnish@linux.ibm.com/
 - Added GRUB2 debug logs and Kernel traces.

Fadump Fixes
-------------
v1:
To address the FADump issue introduced due to the change in MIN_RMA, patches were sent:
https://lore.kernel.org/all/20250120173501.1147236-1-sourabhjain@linux.ibm.com/

Based on the comments on the FADump fixes patch series above, it was
suggested that it would be better to fix the FADump issue before
making the MIN_RMA change.

Merged the FADump fixes and MIN_RMA change into a single patch series.
-----------------------------------------------------------------------
v3:
 - This avoids the impact on FADump caused by the MIN_RMA change.
 - Since the policy for FADump memory reservation for the additional
   parameter is changing for HASH MMU, the corresponding FADump
   documentation is also updated to reflect this change in patch 04/04.
 - Add Reviewed-by tag

Cc: Avnish Chouhan <avnish@linux.ibm.com>
Cc: Brian King <brking@linux.ibm.com>
Cc: Hari Bathini <hbathini@linux.ibm.com>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>

Avnish Chouhan (1):
  powerpc: increase MIN RMA size for CAS negotiation

Sourabh Jain (3):
  powerpc: export MIN RMA size
  powerpc/fadump: fix additional param memory reservation for HASH MMU
  Documentation/powerpc/fadump: add additional parameter feature details

 Documentation/ABI/testing/sysfs-kernel-fadump |  3 ++-
 .../arch/powerpc/firmware-assisted-dump.rst   | 22 +++++++++++++++++++
 arch/powerpc/include/asm/prom.h               |  2 ++
 arch/powerpc/kernel/fadump.c                  | 21 +++++++++---------
 arch/powerpc/kernel/prom_init.c               |  2 +-
 5 files changed, 38 insertions(+), 12 deletions(-)

-- 
2.48.1


