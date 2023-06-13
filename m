Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7B072D71F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jun 2023 03:51:34 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sJbFCmep;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QgBP05Wtzz30Pv
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jun 2023 11:51:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sJbFCmep;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ganeshgr@linux.ibm.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 395 seconds by postgrey-1.37 at boromir; Tue, 13 Jun 2023 11:50:46 AEST
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QgBN66Vzyz305g
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jun 2023 11:50:46 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35D1Htfm013482;
	Tue, 13 Jun 2023 01:44:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=MMy9iGhdhekziGzmm/AEVd9xX+Boqq0YC5DOL2tNwFk=;
 b=sJbFCmep/KA1SUbrhHtBoFFCUAGbql9UA+o5xtDnbpkZxk6bJWBSbIIPpoDgGjsNyH6B
 lELMnacnJ+12E4QE1bFLyccr4NIgbSIxjmbmDYLNpSCH+q2Cj5gklkOSlULISY3MQDZg
 WldUljHm8bA1Jv8o1TZUovWMrkeXgtPDOTt2XLGiO7BZ04ErlzMJbYfOiQwvQTWdhRev
 EuVlUHBzEZ0++8GpGgeVdxF+zMCwkTUb9N6qReEQf50oL/lvQl/n5f5EUi1mNo3ZkEnO
 Y7YbcjXmLUzFYKuxjU/quJFiXrfrnUn6Rf5u8Th9d55W6g/KVOHB6+XQ9MJulpLxh2DY cw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r6enprg7e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Jun 2023 01:44:02 +0000
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 35D1WPcE027643;
	Tue, 13 Jun 2023 01:44:01 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r6enprg6n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Jun 2023 01:44:01 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 35D1QJsY008529;
	Tue, 13 Jun 2023 01:44:00 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3r4gee1u9j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Jun 2023 01:43:59 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 35D1hubM22479594
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 13 Jun 2023 01:43:56 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5944020043;
	Tue, 13 Jun 2023 01:43:56 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CA28320040;
	Tue, 13 Jun 2023 01:43:54 +0000 (GMT)
Received: from li-79f82dcc-27d1-11b2-a85c-9579c2333295.ibm.com.domain.name (unknown [9.43.75.50])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 13 Jun 2023 01:43:54 +0000 (GMT)
From: Ganesh Goudar <ganeshgr@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [RFC 0/3] Asynchronous EEH recovery
Date: Tue, 13 Jun 2023 07:13:34 +0530
Message-Id: <20230613014337.286222-1-ganeshgr@linux.ibm.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: bvTiK_ZxxVe_CTixWXUNsw3hUguX45dL
X-Proofpoint-GUID: D0HgXrU6C4QHoppMMCcUYJXiQkl5s2jd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-12_18,2023-06-12_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 clxscore=1011 lowpriorityscore=0 spamscore=0
 mlxlogscore=999 malwarescore=0 suspectscore=0 mlxscore=0 phishscore=0
 bulkscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2305260000 definitions=main-2306130012
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

Ganesh Goudar (3):
  powerpc/eeh: Synchronization for safety
  powerpc/eeh: Provide a unique ID for each EEH recovery
  powerpc/eeh: Asynchronous recovery

 arch/powerpc/include/asm/eeh.h               |   7 +-
 arch/powerpc/include/asm/eeh_event.h         |  10 +-
 arch/powerpc/include/asm/pci-bridge.h        |   3 +
 arch/powerpc/include/asm/ppc-pci.h           |   2 +-
 arch/powerpc/kernel/eeh.c                    | 154 +++--
 arch/powerpc/kernel/eeh_driver.c             | 580 +++++++++++++++----
 arch/powerpc/kernel/eeh_event.c              |  71 ++-
 arch/powerpc/kernel/eeh_pe.c                 |  33 +-
 arch/powerpc/platforms/powernv/eeh-powernv.c |  12 +-
 arch/powerpc/platforms/pseries/eeh_pseries.c |   5 +-
 arch/powerpc/platforms/pseries/pci_dlpar.c   |   5 +-
 drivers/pci/hotplug/pnv_php.c                |   5 +-
 drivers/pci/hotplug/rpadlpar_core.c          |   2 +
 drivers/vfio/vfio_iommu_spapr_tce.c          |  10 +-
 include/linux/mmzone.h                       |   2 +-
 15 files changed, 687 insertions(+), 214 deletions(-)

-- 
2.40.1

