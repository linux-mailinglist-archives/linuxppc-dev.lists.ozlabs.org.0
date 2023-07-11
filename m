Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D9BD474E60E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 06:49:53 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JizIsvwL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R0T1q5Wxbz3bxr
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 14:49:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JizIsvwL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R0T0y1pllz2xpw
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jul 2023 14:49:06 +1000 (AEST)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36B4juJS014136;
	Tue, 11 Jul 2023 04:48:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=AdTEmZt3Xizs1VYmPABQKhxgqOkLNZY0dVkVVsFQVwc=;
 b=JizIsvwLRJMPxK1hXmWh19pEff5qpiX8qyWgF7ZoY2zWmg3wvSx6CHdfarqkb/D1jvDs
 CE5nbhe/IOBUyCKZGVAJE99GLIKsLTaIh2e5i/eNycx9WJG2DTb1mCHMity7Hpia0ScM
 zCtyE36S7mxX6rRxTcr8C4oubAl7hZ6qpqggmfqSSAN9B4Hafn3avfOzxpgJHJD6fkOZ
 +WgWF5ChJ12XDdaP+rYt0NW3kOtY1fvtNicggS54FuLfcBOh5wwz3jm/OMPHk//zS2Fd
 GvwyPgDMfKmcDV2VO/Bfnwa4e3sI5eUiFBYH+QgNisW25XGdpvNOTadbGN+0D+qH1ocz uQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rryysgg37-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jul 2023 04:48:51 +0000
Received: from m0353726.ppops.net (m0353726.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 36B4d3i1019937;
	Tue, 11 Jul 2023 04:48:51 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com [169.63.214.131])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rryysgg2t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jul 2023 04:48:51 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
	by ppma01dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36B40KI6017127;
	Tue, 11 Jul 2023 04:48:50 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([9.208.129.113])
	by ppma01dal.us.ibm.com (PPS) with ESMTPS id 3rpye6vebu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jul 2023 04:48:49 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 36B4mmw21442530
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 11 Jul 2023 04:48:48 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 88E7C58065;
	Tue, 11 Jul 2023 04:48:48 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6B0B05805B;
	Tue, 11 Jul 2023 04:48:43 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.43.86.43])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 11 Jul 2023 04:48:43 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org, mpe@ellerman.id.au,
        linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
        christophe.leroy@csgroup.eu
Subject: [PATCH v3 0/7] Add support for memmap on memory feature on ppc64
Date: Tue, 11 Jul 2023 10:18:26 +0530
Message-ID: <20230711044834.72809-1-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 18BGlnMQtRbEn4zwAsoMIaFzuWWiQpaW
X-Proofpoint-ORIG-GUID: sFClHmHEcuQxgCOLGP0dYTq4JzWQomQp
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-11_02,2023-07-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 clxscore=1015 mlxlogscore=931 bulkscore=0 adultscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307110040
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
Cc: Vishal Verma <vishal.l.verma@intel.com>, David Hildenbrand <david@redhat.com>, Michal Hocko <mhocko@suse.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This patch series update memmap on memory feature to fall back to
memmap allocation outside the memory block if the alignment rules are
not met. This makes the feature more useful on architectures like
ppc64 where alignment rules are different with 64K page size.

This patch series is dependent on dax vmemmap optimization series
posted here
https://lore.kernel.org/linux-mm/20230710160842.56300-1-aneesh.kumar@linux.ibm.com


Changes from v2:
* Rebase to latest linus tree
* Redo the series based on review feedback. Multiple changes to the patchset.

Changes from v1:
* update the memblock to store vmemmap_altmap details. This is required
so that when we remove the memory we can find the altmap details which
is needed on some architectures.
* rebase to latest linus tree


Aneesh Kumar K.V (6):
  mm/hotplug: Simplify ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE kconfig
  mm/hotplug: Allow memmap on memory hotplug request to fallback
  mm/hotplug: Allow architecture to override memmap on memory support
    check
  mm/hotplug: Allow pageblock alignment via altmap reservation
  powerpc/book3s64/memhotplug: Enable memmap on memory for radix
  mm/hotplug: Embed vmem_altmap details in memory block

Vishal Verma (1):
  dax/kmem: Always enroll hotplugged memory for memmap_on_memory

 arch/arm64/Kconfig                            |   4 +-
 arch/powerpc/Kconfig                          |   1 +
 arch/powerpc/include/asm/pgtable.h            |  28 +++++
 .../platforms/pseries/hotplug-memory.c        |   3 +-
 arch/x86/Kconfig                              |   4 +-
 drivers/acpi/acpi_memhotplug.c                |   3 +-
 drivers/base/memory.c                         |  35 ++++--
 drivers/dax/kmem.c                            |  81 ++++++++++----
 include/linux/memory.h                        |   8 +-
 include/linux/memory_hotplug.h                |   1 -
 mm/Kconfig                                    |  12 ++
 mm/memory_hotplug.c                           | 103 ++++++++++++------
 12 files changed, 205 insertions(+), 78 deletions(-)

-- 
2.41.0

