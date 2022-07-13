Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5995573A94
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Jul 2022 17:51:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LjhtP5Zsvz3f4G
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Jul 2022 01:51:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=R3BBrbth;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=R3BBrbth;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ljhqx4jZHz3c6V
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Jul 2022 01:49:01 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26DFAs6B020872;
	Wed, 13 Jul 2022 15:48:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=8Wtv2Y2VDCXvSiMs1ltGIZdqOrW6KsqABRXv3kKfOdI=;
 b=R3BBrbthYXM1X5PpDorFb3wGrY7bpg6iFkVA6WRFR1JCJ9kgSUQMzCt7xogjlTVQSVod
 NTpjtqPnNrQ0jis8x8ObjCQKNAIaNbozvInIMcdUoZSnpEY0/6f2v0071ZW2hHnZ1F4j
 jZwHCYcJzcmi+Y0q2msJyMgU9uGYX6yWTmK8Ltbdp1VtdGGbnuKnOBcoEk61uOxL5si6
 dhsikJtWPEvvgU6rO8ibkmWzRKRt4ajCAxaawjGoPHtx9/bl4fhvPn0K4wJKSQi6cjhP
 ITe2meoLWsIGl/bOGwtnL9ppsTUadzruhjTtRK93KHEPMUh4gTObH/x7Bgh1ese/B0/f ug== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3ha02xt5v1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Jul 2022 15:48:51 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26DFB0dt021637;
	Wed, 13 Jul 2022 15:48:51 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com [159.122.73.72])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3ha02xt5u5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Jul 2022 15:48:50 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
	by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26DFOB3I012348;
	Wed, 13 Jul 2022 15:48:49 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
	by ppma06fra.de.ibm.com with ESMTP id 3h8ncngwqa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Jul 2022 15:48:48 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com [9.149.105.62])
	by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 26DFlUHT16056742
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 13 Jul 2022 15:47:31 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DAE45AE04D;
	Wed, 13 Jul 2022 15:47:30 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 644BBAE045;
	Wed, 13 Jul 2022 15:47:30 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.145.2.121])
	by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Wed, 13 Jul 2022 15:47:30 +0000 (GMT)
From: Laurent Dufour <ldufour@linux.ibm.com>
To: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        wim@linux-watchdog.org, linux@roeck-us.net, nathanl@linux.ibm.com,
        rdunlap@infradead.org
Subject: [PATCH v5 0/4] Extending NMI watchdog during LPM
Date: Wed, 13 Jul 2022 17:47:25 +0200
Message-Id: <20220713154729.80789-1-ldufour@linux.ibm.com>
X-Mailer: git-send-email 2.37.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: oSgccMwIG4ltZLGGkNxZPOsA0Fsy0VW6
X-Proofpoint-ORIG-GUID: 4Smr9flRzGEVClPhms9PKy8xXpfy8KZR
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-13_05,2022-07-13_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 mlxscore=0 priorityscore=1501 adultscore=0 phishscore=0
 bulkscore=0 clxscore=1015 spamscore=0 mlxlogscore=999 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207130063
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

Changes in V5 (no functional changes in this version):
Patch 4/4:
 - fixing typos and grammar issues reported by Randy.
 - Renaming sysctl value from nmi_watchdog_factor to nmi_wd_lpm_factor as
   per Nick request

V4:
https://lore.kernel.org/linuxppc-dev/20220712143202.23144-1-ldufour@linux.ibm.com/

Laurent Dufour (4):
  powerpc/mobility: wait for memory transfer to complete
  watchdog: export lockup_detector_reconfigure
  powerpc/watchdog: introduce a NMI watchdog's factor
  pseries/mobility: set NMI watchdog factor during an LPM

 Documentation/admin-guide/sysctl/kernel.rst | 12 +++
 arch/powerpc/include/asm/nmi.h              |  2 +
 arch/powerpc/kernel/watchdog.c              | 21 ++++-
 arch/powerpc/platforms/pseries/mobility.c   | 91 ++++++++++++++++++++-
 include/linux/nmi.h                         |  2 +
 kernel/watchdog.c                           | 21 +++--
 6 files changed, 141 insertions(+), 8 deletions(-)

-- 
2.37.0

