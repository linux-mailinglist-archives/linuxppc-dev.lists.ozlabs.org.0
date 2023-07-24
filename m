Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B96E175EC20
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jul 2023 09:01:30 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VFOLgo5S;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R8WKh4wDnz3bX6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jul 2023 17:01:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VFOLgo5S;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ganeshgr@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R8WJm5mkVz2yGL
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jul 2023 17:00:40 +1000 (AEST)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36O5Kewh031198;
	Mon, 24 Jul 2023 07:00:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=Tx91P87gl40WoMd2sg2aHu1iS/9y8C4FzzT675u9MVM=;
 b=VFOLgo5SRR/pFBdKmY2j2IfbNxjujPblgPE4dG7Mb+7xs4m67OM7bc83Hg9BOAQu7oBW
 cH+qvrFiqSXxC2XP40noIY8IMsQs6rK80co1Umqp3i/X8paBl5lf+PhSMIGtReQecnTN
 0H9X87lGgiaAUerXiDtT24o5DTLv61w2F0LZLdFv+Di3I6rJi31EvP1QC7VjEXNuMc2a
 ZvoQr4Se1RguGZeiwW98k11FpuNcHB05T+jRenyMeCq1A/yXkAHuH8Jv51I/J096x7uk
 J2U39/79/zyaMipDOHLWgWY//92mfJisyRaEtUaXvJu88yzUcOpQouIP41CeWA7y8iMB kg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s1h6gctj9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Jul 2023 07:00:32 +0000
Received: from m0353728.ppops.net (m0353728.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 36O6iUFQ020026;
	Mon, 24 Jul 2023 07:00:32 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s1h6gcthj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Jul 2023 07:00:32 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36O5XKFq014406;
	Mon, 24 Jul 2023 07:00:31 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3s0stxh9dy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Jul 2023 07:00:31 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 36O70SLv27722306
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 24 Jul 2023 07:00:28 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id ED37D2004E;
	Mon, 24 Jul 2023 07:00:27 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CE6F020043;
	Mon, 24 Jul 2023 07:00:25 +0000 (GMT)
Received: from li-79f82dcc-27d1-11b2-a85c-9579c2333295.ibm.com.domain.name (unknown [9.43.30.11])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 24 Jul 2023 07:00:25 +0000 (GMT)
From: Ganesh Goudar <ganeshgr@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [RFC PATCH v2 0/3] Asynchronous EEH recovery
Date: Mon, 24 Jul 2023 12:30:17 +0530
Message-Id: <20230724070020.239173-1-ganeshgr@linux.ibm.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: x_K4D-zuFCRs4usIEsGgYPKSS2HUqu2D
X-Proofpoint-ORIG-GUID: 5NKcVA90FX1kTkao-D9MSakhrn6XInTv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-24_04,2023-07-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 spamscore=0 suspectscore=0 clxscore=1015 malwarescore=0 mlxlogscore=969
 bulkscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307240060
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
Cc: Ganesh Goudar <ganeshgr@linux.ibm.com>, oohall@gmail.com, mahesh@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

EEH recovery is currently serialized and these patches shorten
the time taken for EEH recovery by making the recovery to run
in parallel. The original author of these patches is Sam Bobroff,
I have rebased and tested these patches.

On powervm with 64 VFs from same PHB,  I see approximately 48%
reduction in time taken in EEH recovery.

On powernv with 9 network cards, Where 2 cards installed on one
PHB and 1 card on each of the rest of the PHBs, Providing 20 PFs
in total. I see approximately 33% reduction in time taken in EEH
recovery.

These patches were originally posted as separate RFCs by Sam, And
I rebased and posted these patches almost a year back, I stopped
pursuing these patches as I was not able test this on powernv, Due
to the issues in drivers of cards I was testing this on, Which are
now resolved. Since I am re-posting this after long time, Posting
this as a fresh RFC, Please comment.

Thanks.

V2:
 * Since we now have event list per phb, Have per phb event list lock.
 * Appropriate names given to the locks.
 * Remove stale comments (few more to be removed).
 * Initialize event_id to 0 instead of 1.
 * And some cosmetic changes.

Ganesh Goudar (3):
  powerpc/eeh: Synchronization for safety
  powerpc/eeh: Provide a unique ID for each EEH recovery
  powerpc/eeh: Asynchronous recovery

 arch/powerpc/include/asm/eeh.h               |  13 +-
 arch/powerpc/include/asm/eeh_event.h         |  10 +-
 arch/powerpc/include/asm/pci-bridge.h        |   4 +
 arch/powerpc/include/asm/ppc-pci.h           |   2 +-
 arch/powerpc/kernel/eeh.c                    | 159 +++--
 arch/powerpc/kernel/eeh_driver.c             | 580 +++++++++++++++----
 arch/powerpc/kernel/eeh_event.c              |  75 ++-
 arch/powerpc/kernel/eeh_pe.c                 |  34 +-
 arch/powerpc/platforms/powernv/eeh-powernv.c |  12 +-
 arch/powerpc/platforms/pseries/eeh_pseries.c |   5 +-
 arch/powerpc/platforms/pseries/pci_dlpar.c   |   5 +-
 drivers/pci/hotplug/pnv_php.c                |   5 +-
 drivers/pci/hotplug/rpadlpar_core.c          |   2 +
 drivers/vfio/vfio_iommu_spapr_tce.c          |  10 +-
 include/linux/mmzone.h                       |   2 +-
 15 files changed, 693 insertions(+), 225 deletions(-)

-- 
2.40.1

