Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 142FA594F09
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Aug 2022 05:29:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M6GpL6bnnz3c4Q
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Aug 2022 13:28:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=R1ZDU7g7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ganeshgr@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=R1ZDU7g7;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M6Gmw1Fx2z2xGg
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Aug 2022 13:27:43 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27G3PCoh028804;
	Tue, 16 Aug 2022 03:27:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=naCE6F/ilUY/G9MiezgOjwJl3wZqE+vWsK7+KdWQHCI=;
 b=R1ZDU7g7ETUwHz++KXWPvaCbs9cHhz4mv9SMWUCn+ALs1ROPfD15wH0OkIvloRK0Y051
 12tEPoEqjFvbvl9SBuyOTqBK0wWlr/MBr710M4Z27nmzPK1NvYZ2p/I0ygV22zbbpBk1
 hv3f8eT14AS5OHHq3FCBNsq1plStD9XbN5MaorAU45Aw/K2agJfvBJm5B/e7ZUaQWsZg
 xo/J9J6P4EaH6NgUjd0YeuNw8KJNnKInyy6wsksNtt1ToEGlOQSzgZV9NxVW9wZ47oOI
 QHJLh99jXQA40oOrCGIcbhoAZq35wxp9XlfAHyv8qrtmJbFn54+ImBgT/MhWFfVStKrp zA== 
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com [159.122.73.70])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3j0079c1m1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Aug 2022 03:27:33 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
	by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27G3LXOB022984;
	Tue, 16 Aug 2022 03:27:32 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
	by ppma01fra.de.ibm.com with ESMTP id 3hx3k91xs1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Aug 2022 03:27:32 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com [9.149.105.62])
	by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 27G3OkDd23200064
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 16 Aug 2022 03:24:46 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BD0D6AE04D;
	Tue, 16 Aug 2022 03:27:28 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1F332AE045;
	Tue, 16 Aug 2022 03:27:27 +0000 (GMT)
Received: from li-c7b85bcc-2727-11b2-a85c-a9ba7f3a2193.ibm.com.domain.name (unknown [9.43.31.7])
	by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Tue, 16 Aug 2022 03:27:26 +0000 (GMT)
From: Ganesh Goudar <ganeshgr@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [RFC 0/3] Asynchronous EEH recovery
Date: Tue, 16 Aug 2022 08:57:13 +0530
Message-Id: <20220816032716.108297-1-ganeshgr@linux.ibm.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: foErwjTW7BS7XCitPk1t1b1wMFgv6k5M
X-Proofpoint-ORIG-GUID: foErwjTW7BS7XCitPk1t1b1wMFgv6k5M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-15_08,2022-08-15_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1011
 lowpriorityscore=0 malwarescore=0 adultscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 mlxlogscore=910
 impostorscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2207270000 definitions=main-2208160011
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
Cc: Ganesh Goudar <ganeshgr@linux.ibm.com>, mahesh@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

EEH reocvery is currently serialized and these patches shorten
the time taken for EEH recovery by making the recovery to run
in parallel. The original author of these patches is Sam Bobroff,
I have rebased and tested these patches.

On powervm with 64 VFs and I see approximately 48% reduction
in time taken in EEH recovery, Yet to be tested on powernv.

These patches were originally posted as separate RFCs, I think
posting them as single series would be more helpful, I know the
patches are too big, I will try to logically divide in next
iterations.

Thanks 

Ganesh Goudar (3):
  powerpc/eeh: Synchronization for safety
  powerpc/eeh: Provide a unique ID for each EEH recovery
  powerpc/eeh: Asynchronous recovery

 arch/powerpc/include/asm/eeh.h               |   7 +-
 arch/powerpc/include/asm/eeh_event.h         |  10 +-
 arch/powerpc/include/asm/pci-bridge.h        |   3 +
 arch/powerpc/include/asm/ppc-pci.h           |   2 +-
 arch/powerpc/kernel/eeh.c                    | 154 +++--
 arch/powerpc/kernel/eeh_driver.c             | 578 +++++++++++++++----
 arch/powerpc/kernel/eeh_event.c              |  71 ++-
 arch/powerpc/kernel/eeh_pe.c                 |  33 +-
 arch/powerpc/platforms/powernv/eeh-powernv.c |  12 +-
 arch/powerpc/platforms/pseries/eeh_pseries.c |   5 +-
 arch/powerpc/platforms/pseries/pci_dlpar.c   |   5 +-
 drivers/pci/hotplug/pnv_php.c                |   5 +-
 drivers/pci/hotplug/rpadlpar_core.c          |   2 +
 drivers/vfio/vfio_spapr_eeh.c                |  10 +-
 14 files changed, 685 insertions(+), 212 deletions(-)

-- 
2.37.1

