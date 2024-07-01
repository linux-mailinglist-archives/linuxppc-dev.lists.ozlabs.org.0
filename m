Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E124F91D954
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jul 2024 09:46:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YqimNCMk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WCJ5B5X9cz3dDJ
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jul 2024 17:46:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YqimNCMk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=krishnak@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WCJ4T314Sz30N8
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Jul 2024 17:45:44 +1000 (AEST)
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4616vbr8026439;
	Mon, 1 Jul 2024 07:45:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from
	:to:cc:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding; s=pp1; bh=FWoeNMZQPLBkcZRCgl3BOuc33C
	p02Ni4pfnKSygfc1Y=; b=YqimNCMkVUzOmPMPAyAJZgsKVyi9BudVdhq+iZQO74
	bTycYvNHj9G4JNDde5H3p67Gds/ptm/Ew/aQVaTdakJxB5+XlpgtUFsgoh26/mtB
	1f4gn0VjXIfBK62OqdczkzSidINyzwe+vkB1qbbIsXWB21fz4hlG+NuDjWUUYEbW
	u48klgr0qBbRooPHeS+hkId7+5ciMxyaRq0oR1Zw/PbwXYxcL+8aZZCtaKSkUB7b
	DPjHXBpdhPW/cA0trwHmODFqudwCyzP+GTKXuEX+HkWBOOCcBWWjmP8NU6sg0zY0
	MR0Rz/7Tuz0vRBuVRMEJFtoCzn5nXHd/34KwItz4vbxw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 403pb98atx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Jul 2024 07:45:34 +0000 (GMT)
Received: from m0353723.ppops.net (m0353723.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4617jXKx005181;
	Mon, 1 Jul 2024 07:45:33 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 403pb98ats-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Jul 2024 07:45:33 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 4614OH7o026393;
	Mon, 1 Jul 2024 07:45:33 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 402wkpp2dq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Jul 2024 07:45:32 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4617jRID54919554
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 1 Jul 2024 07:45:29 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0726320040;
	Mon,  1 Jul 2024 07:45:27 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 26F0520065;
	Mon,  1 Jul 2024 07:45:24 +0000 (GMT)
Received: from li-a50b8fcc-3415-11b2-a85c-f1daa4f09788.in.ibm.com (unknown [9.109.241.85])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  1 Jul 2024 07:45:23 +0000 (GMT)
From: Krishna Kumar <krishnak@linux.ibm.com>
To: mpe@ellerman.id.au, npiggin@gmail.com
Subject: [PATCH v4 0/2] PCI hotplug driver fixes
Date: Mon,  1 Jul 2024 13:15:05 +0530
Message-ID: <20240701074513.94873-1-krishnak@linux.ibm.com>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: EP7C88KX-ne3bnHVgQuhZpqrInvQmTAr
X-Proofpoint-ORIG-GUID: ebs-TKkZrF5wIylgeNE7eDxCepnX2wDK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-01_05,2024-06-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 suspectscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 spamscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407010051
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
Cc: nathanl@linux.ibm.com, aneesh.kumar@kernel.org, linux-pci@vger.kernel.org, Krishna Kumar <krishnak@linux.ibm.com>, linux-kernel@vger.kernel.org, christophe.leroy@csgroup.eu, gbatra@linux.ibm.com, bhelgaas@google.com, tpearson@raptorengineering.com, oohall@gmail.com, brking@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The fix of Powerpc hotplug driver (drivers/pci/hotplug/pnv_php.c)
addresses below two issues.

1. Kernel Crash during hot unplug of bridge/switch slot.

2. Bridge Support Enablement - Previously, when we do a hot-unplug
operation on a bridge slot, all the ports and devices behind the
bridge-ports would be hot-unplugged/offline, but when we do a hot-plug
operation on the same bridge slot, all the ports and devices behind the
bridge would not get hot-plugged/online. In this case, Only the first
port of the bridge gets enabled and the remaining port/devices remain
unplugged/offline.  After the fix, The hot-unplug and hot-plug
operations on the slot associated with the bridge started behaving
correctly and became in sync. Now, after the hot plug operation on the
same slot, all the bridge ports and devices behind the bridge become
hot-plugged/online/restored in the same manner as it was before the
hot-unplug operation.



Krishna Kumar (2):
  pci/hotplug/pnv_php: Fix hotplug driver crash on Powernv
  powerpc: hotplug driver bridge support

 arch/powerpc/include/asm/ppc-pci.h |  4 ++++
 arch/powerpc/kernel/pci-hotplug.c  |  5 ++---
 arch/powerpc/kernel/pci_dn.c       | 32 ++++++++++++++++++++++++++++++
 drivers/pci/hotplug/pnv_php.c      |  3 +--
 4 files changed, 39 insertions(+), 5 deletions(-)

Changelog:
==========

v4: 1st July 2024
  - Changed the description and corrected the typo in patch1
  - Added Acked-by and Tested-by tag in patch1
  - Added Tested-by tag in patch2

v3: 24 June 2024
  - Removed the DPC keyword from description in cover letter and
    patch2

v2: 14 May 2024
  - Used of_property_read_u32() in place of of_get_property() and
    of_read_number(). [patch2]
  - Removed some unnecessary variable and changed the function return
    type from void* to void. [patch2]
  - Removed the export declaration of
    pci_traverse_sibling_nodes_and_scan_slot() as its not needed.
    [patch2]


-- 
2.45.0

