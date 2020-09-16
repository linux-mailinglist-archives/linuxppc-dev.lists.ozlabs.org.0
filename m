Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A1DAB26D07C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Sep 2020 03:18:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BsJxT6ypPzF0Qb
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Sep 2020 11:18:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ganeshgr@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=AsF9MuJ3; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BsJ6z2Md5zDqrW
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Sep 2020 10:41:15 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08GH69Gj040810; Wed, 16 Sep 2020 13:22:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=PRlLK6/lXD7kmtA9Vv3PUEZdkGjTR9B8VTmzuLifbQs=;
 b=AsF9MuJ3lDSLOuj5cE22tL1POHxXVZX+FwT7CKZ8TJdnz6tlg9YUjIW+29aNPqiZS9+A
 +7qCclBFvnzfrPIcvC9LKykjF2SF2eTeLB1Agd5zSePmkN4Um8hHq/uPhCl/Q9k9ytJr
 HutCq+FffQ2uMuhsIos3/V36zjQ3g47pKuxvyLaHTpS0rmUvxaNUXPZHPMCRhncoKQBD
 EpfxIeQLh22Pv32tTwCTOsC9zFpmu3v2GepsjnprN1xQ40TiIecXB9Vddkvb1P9tDiQh
 VjxM0gxzILwSsBVgL3q3zUroU++GViqRXKgtt8y3XSQ74huvXmJ6dm2AF14a5wgjDbjB yg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 33kpfdgyna-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Sep 2020 13:22:50 -0400
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 08GH8Phr048941;
 Wed, 16 Sep 2020 13:22:50 -0400
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0b-001b2d01.pphosted.com with ESMTP id 33kpfdgymn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Sep 2020 13:22:50 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 08GH3oJ3024926;
 Wed, 16 Sep 2020 17:22:48 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03fra.de.ibm.com with ESMTP id 33k65v0f6j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Sep 2020 17:22:48 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 08GHMkEL27853200
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Sep 2020 17:22:46 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E7F4B42041;
 Wed, 16 Sep 2020 17:22:45 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 23F274203F;
 Wed, 16 Sep 2020 17:22:44 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.102.2.13])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 16 Sep 2020 17:22:43 +0000 (GMT)
From: Ganesh Goudar <ganeshgr@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH 0/3] powerpc/mce: Fix mce handler and add selftest
Date: Wed, 16 Sep 2020 22:52:25 +0530
Message-Id: <20200916172228.83271-1-ganeshgr@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-16_11:2020-09-16,
 2020-09-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 bulkscore=0
 adultscore=0 spamscore=0 phishscore=0 mlxlogscore=616 malwarescore=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009160118
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
Cc: mahesh@linux.vnet.ibm.com, msuchanek@suse.de,
 Ganesh Goudar <ganeshgr@linux.ibm.com>, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This patch series fixes mce handling for pseries, provides debugfs
interface for mce injection and adds selftest to test mce handling
on pseries/powernv machines running in hash mmu mode.
debugfs interface and sleftest are added only for slb multihit
injection, We can add other tests in future if possible.

Ganesh Goudar (3):
  powerpc/mce: remove nmi_enter/exit from real mode handler
  powerpc/mce: Add debugfs interface to inject MCE
  selftest/powerpc: Add slb multihit selftest

 arch/powerpc/Kconfig.debug                    |   9 ++
 arch/powerpc/kernel/mce.c                     |   7 +-
 arch/powerpc/sysdev/Makefile                  |   2 +
 arch/powerpc/sysdev/mce_error_inject.c        | 149 ++++++++++++++++++
 tools/testing/selftests/powerpc/Makefile      |   3 +-
 tools/testing/selftests/powerpc/mces/Makefile |   6 +
 .../selftests/powerpc/mces/slb_multihit.sh    |   9 ++
 7 files changed, 183 insertions(+), 2 deletions(-)
 create mode 100644 arch/powerpc/sysdev/mce_error_inject.c
 create mode 100644 tools/testing/selftests/powerpc/mces/Makefile
 create mode 100755 tools/testing/selftests/powerpc/mces/slb_multihit.sh

-- 
2.26.2

