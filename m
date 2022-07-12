Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C09571CC4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Jul 2022 16:33:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lj3CQ5wNHz3c9K
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Jul 2022 00:33:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RMtp6Nlt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RMtp6Nlt;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lj39y4kHrz3bx3
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Jul 2022 00:32:22 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26CDma9B004466;
	Tue, 12 Jul 2022 14:32:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=h1BR0t+GW1FabNOu8DeCdTYCLSEeOu2dr7VoXB7G/5k=;
 b=RMtp6NltEQ/oJ0a/xnrieRN7TwVIZcaAKBNKbjqH/bZdn7kzuva5pHDTmLTCgvWEMNdA
 D6dyAehOGALwubHc8XwMRCTShB6vRH1cWP419CLv5gZo75iif2dQVKc8al0gDD1bDG3R
 Xdag0zrxGiJ7qbvDi88FzpbJE3j0wlT058N78ggCrO1ukmL1DMj5yyPUvsbUM1vWSMBw
 GWcVtmv43umcPA1pT0UjQpKwQ2nZetgD1VfuzVQ7dSbPjYnYPKroftARKuTkFpw/5RTf
 yqwrhMgEr0C0uqKEE+DdY7ivDnvCjiwnlAvDMxedBKSA9SBLtZHpmJc4AUUll8mgM6Lv 3Q== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3h9a5vs821-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Jul 2022 14:32:07 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26CDnTjF008428;
	Tue, 12 Jul 2022 14:32:07 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3h9a5vs819-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Jul 2022 14:32:07 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26CELkKr027662;
	Tue, 12 Jul 2022 14:32:05 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
	by ppma04ams.nl.ibm.com with ESMTP id 3h8rrn17jq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Jul 2022 14:32:05 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 26CEW3qX15335740
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 12 Jul 2022 14:32:03 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2A28CA4054;
	Tue, 12 Jul 2022 14:32:03 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9AFB5A405B;
	Tue, 12 Jul 2022 14:32:02 +0000 (GMT)
Received: from pomme.tlslab.ibm.com (unknown [9.101.4.33])
	by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Tue, 12 Jul 2022 14:32:02 +0000 (GMT)
From: Laurent Dufour <ldufour@linux.ibm.com>
To: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        wim@linux-watchdog.org, linux@roeck-us.net, nathanl@linux.ibm.com
Subject: [PATCH v4 0/4] Extending NMI watchdog during LPM
Date: Tue, 12 Jul 2022 16:31:58 +0200
Message-Id: <20220712143202.23144-1-ldufour@linux.ibm.com>
X-Mailer: git-send-email 2.37.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: N7AHu3hsE37M-VEPRTo0ViCcX-XjZ2s4
X-Proofpoint-GUID: PeLenaXmoPxOwkOxTHIgyjFrY_3D_XvQ
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-12_08,2022-07-12_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 mlxlogscore=938 priorityscore=1501 phishscore=0 adultscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207120055
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
Cc: hch@infradead.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, haren@linux.vnet.ibm.com, linux-watchdog@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When a partition is transferred, once it arrives at the destination node,
the partition is active but much of its memory must be transferred from the
start node.

It depends on the activity in the partition, but the more CPU the partition
has, the more memory to be transferred is likely to be. This causes latency
when accessing pages that need to be transferred, and often, for large
partitions, it triggers the NMI watchdog.

The NMI watchdog causes the CPU stack to dump where it appears to be
stuck. In this case, it does not bring much information since it can happen
during any memory access of the kernel.

In addition, the NMI interrupt mechanism is not secure and can generate a
dump system in the event that the interruption is taken while MSR[RI]=0.

Depending on the LPAR size and load, it may be interesting to extend the
NMI watchdog timer during the LPM.

That's configurable through sysctl with the new introduced variable
(specific to powerpc) nmi_watchdog_factor. This value represents the
percentage added to watchdog_tresh to set the NMI watchdog timeout during a
LPM.

Changes in v4 (no functional changes in this version):
 - Patch 1/4 :fix typo and add a comment in pseries_migrate_partition()
 - Patch 3/4: rename new variables and functions as Nick requested.
 - Patch 4/4: rename the called new function

v2:
https://lore.kernel.org/linuxppc-dev/121217bb-6a34-8ccb-9819-f82806d6f47c@linux.ibm.com/

Laurent Dufour (4):
  powerpc/mobility: wait for memory transfer to complete
  watchdog: export lockup_detector_reconfigure
  powerpc/watchdog: introduce a NMI watchdog's factor
  pseries/mobility: set NMI watchdog factor during LPM

 Documentation/admin-guide/sysctl/kernel.rst | 12 +++
 arch/powerpc/include/asm/nmi.h              |  2 +
 arch/powerpc/kernel/watchdog.c              | 21 ++++-
 arch/powerpc/platforms/pseries/mobility.c   | 91 ++++++++++++++++++++-
 include/linux/nmi.h                         |  2 +
 kernel/watchdog.c                           | 21 +++--
 6 files changed, 141 insertions(+), 8 deletions(-)

-- 
2.37.0

