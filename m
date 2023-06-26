Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF1073DC29
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Jun 2023 12:23:29 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OA5EMVX+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QqP7g5xJzz30jT
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Jun 2023 20:23:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OA5EMVX+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QqP6k3NwJz2xBV
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Jun 2023 20:22:37 +1000 (AEST)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35QAGn53020439;
	Mon, 26 Jun 2023 10:22:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=4207Gt3veFFi2V8dLuYBIFQ1Y6iRyAxx0DVsvTpmRFw=;
 b=OA5EMVX+RtK1Gm+XabUXle7tJj7naCPYJu+xLxsnkf5fz2NgWqTLK2fOGB/rOy5c7Gr8
 UGYY6U1j0HIJRmkqyhb4LIEdFOe3K/gwRmcVoAA1AWzRBuW6EoggibYgyh7merYykBCL
 cafON3P8bWHx5zTiaqCT58sveyQIuOPXAHTan5+qDHUIMdANjrQG5ouGxMMX1ZoijOC6
 PpcjU3oeLXaF5xUPCmEdj0ORJmpaQC8B2vdldx0n3Dyyom53toJ5vHlVK92nznU1bRbC
 dnKt1vpCeNi7SGaRoG89VIx67jTCOusdy/gccygfXzQ4tMsXXYHPBUUIhz/Nfx2f8Wt2 ug== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rf8skr4tx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Jun 2023 10:22:22 +0000
Received: from m0353727.ppops.net (m0353727.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 35QAH6vs022181;
	Mon, 26 Jun 2023 10:22:22 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com [169.63.214.131])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rf8skr4t8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Jun 2023 10:22:22 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
	by ppma01dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 35QAJVHT011045;
	Mon, 26 Jun 2023 10:22:21 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([9.208.130.102])
	by ppma01dal.us.ibm.com (PPS) with ESMTPS id 3rdr46g906-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Jun 2023 10:22:21 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 35QAMJvK58130804
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 26 Jun 2023 10:22:20 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E300D58059;
	Mon, 26 Jun 2023 10:22:19 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E4DED5805D;
	Mon, 26 Jun 2023 10:22:15 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.43.116.175])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 26 Jun 2023 10:22:15 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org, mpe@ellerman.id.au,
        linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
        christophe.leroy@csgroup.eu
Subject: [RFC PATCH 0/5] Add support for memmap on memory feature on ppc64
Date: Mon, 26 Jun 2023 15:52:07 +0530
Message-ID: <20230626102212.119919-1-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 0nQSvwFi4gxxpeyqVF4MzExRor0HCsP4
X-Proofpoint-ORIG-GUID: I8KHX4_3K7XlkYvddy28fJdiydf-WbrX
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-26_06,2023-06-22_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 clxscore=1011 priorityscore=1501 lowpriorityscore=0 spamscore=0
 mlxlogscore=922 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306260091
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
posted here https://lore.kernel.org/linux-mm/20230616110826.344417-1-aneesh.kumar@linux.ibm.com


Aneesh Kumar K.V (5):
  mm/hotplug: Embed vmem_altmap details in memory block
  mm/hotplug: Allow architecture override for memmap on memory feature
  mm/hotplug: Simplify the handling of MHP_MEMMAP_ON_MEMORY flag
  mm/hotplug: Simplify ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE kconfig
  powerpc/book3s64/memhotplug: Enable memmap on memory for radix

 arch/arm64/Kconfig                            |  4 +-
 arch/arm64/mm/mmu.c                           |  5 +
 arch/powerpc/Kconfig                          |  1 +
 arch/powerpc/mm/book3s64/radix_pgtable.c      | 28 ++++++
 .../platforms/pseries/hotplug-memory.c        |  4 +-
 arch/x86/Kconfig                              |  4 +-
 arch/x86/mm/init_64.c                         |  6 ++
 drivers/acpi/acpi_memhotplug.c                |  3 +-
 drivers/base/memory.c                         | 28 ++++--
 include/linux/memory.h                        | 25 +++--
 include/linux/memory_hotplug.h                | 17 +++-
 include/linux/memremap.h                      | 18 +---
 mm/Kconfig                                    |  3 +
 mm/memory_hotplug.c                           | 95 +++++++++----------
 14 files changed, 151 insertions(+), 90 deletions(-)

-- 
2.41.0

