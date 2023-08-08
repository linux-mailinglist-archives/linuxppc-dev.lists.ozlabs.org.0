Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F42773944
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Aug 2023 11:16:17 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QsOEoBMH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RKncH5bB1z3cPC
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Aug 2023 19:16:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QsOEoBMH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RKnbL4jqHz2xqp
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Aug 2023 19:15:26 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37898jUG010752;
	Tue, 8 Aug 2023 09:15:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=WI/iOsZMkdaB+MqnzGJRwLm9hPaOeKiGAruY28wN0iA=;
 b=QsOEoBMHbwDtCit/oO6tdqQ9Z1+73+fq6VKrNKgDLJF86nA/QtT+jaaPmL70zS5qH9nr
 yIJgcN/kZuS99NN5zUAQHpl+TyNxm/AN9vWGySUy2a1vzNHVQrQmciPbvHFmNqWENfAk
 sxu8Ww9XhSsTUdb3j2ly+J+BuosLr1achMUTTfIWc35AGjmFoJs1wPnyUbeh0DApL9b4
 UzQsHGW+wJyFbpeBS/BgJsGM3CX7f034Z4VDwYKtvQkTnzj1w5Nfxgw8IOJcnnOwaTTD
 gJB3FyxA+ywVjDkLcmRQylgQ1imoFrPM2IlfV0SAdo8btFjt1rdll6dgnfPmGKUQxM+H nQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sbjpt8fqy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Aug 2023 09:15:10 +0000
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 37898uUw011933;
	Tue, 8 Aug 2023 09:15:10 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sbjpt8fqj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Aug 2023 09:15:10 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 37887EdP001802;
	Tue, 8 Aug 2023 09:15:09 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3sa3f1mmbx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Aug 2023 09:15:09 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3789F9Q53015320
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 8 Aug 2023 09:15:09 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E72B058063;
	Tue,  8 Aug 2023 09:15:08 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B11145803F;
	Tue,  8 Aug 2023 09:15:05 +0000 (GMT)
Received: from skywalker.in.ibm.com (unknown [9.109.212.144])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  8 Aug 2023 09:15:05 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org, mpe@ellerman.id.au,
        linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
        christophe.leroy@csgroup.eu
Subject: [PATCH v8 0/6] Add support for memmap on memory feature on ppc64
Date: Tue,  8 Aug 2023 14:44:55 +0530
Message-ID: <20230808091501.287660-1-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Kjwa2iD_JmXWZHQQuwArdCFUHgzr2qL0
X-Proofpoint-ORIG-GUID: omO4p3pgJMWh4rvzy95AIuyg9P1i4nm8
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-08_07,2023-08-03_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=923 adultscore=0 impostorscore=0 mlxscore=0 spamscore=0
 phishscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308080081
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
https://lore.kernel.org/linux-mm/20230718022934.90447-1-aneesh.kumar@linux.ibm.com/

Changes from v7:
* Drop patch 7 because we are still discussing a runtime update of this
feature is useful.

Changes from v6:
* Update comments in the code
* Update commit message for patch 7

Changes from v5:
* Update commit message
* Move memory alloc/free to the callers in patch 6
* Address review feedback w.r.t patch 4

Changes from v4:
* Use altmap.free instead of altmap.reserve
* Address review feedback

Changes from v3:
* Extend the module parameter memmap_on_memory to force allocation even
  though we can waste hotplug memory.

Changes from v2:
* Rebase to latest linus tree
* Redo the series based on review feedback. Multiple changes to the patchset.

Changes from v1:
* update the memblock to store vmemmap_altmap details. This is required
so that when we remove the memory we can find the altmap details which
is needed on some architectures.
* rebase to latest linus tree


Aneesh Kumar K.V (6):
  mm/memory_hotplug: Simplify ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE kconfig
  mm/memory_hotplug: Allow memmap on memory hotplug request to fallback
  mm/memory_hotplug: Allow architecture to override memmap on memory
    support check
  mm/memory_hotplug: Support memmap_on_memory when memmap is not aligned
    to pageblocks
  powerpc/book3s64/memhotplug: Enable memmap on memory for radix
  mm/memory_hotplug: Embed vmem_altmap details in memory block

 .../admin-guide/mm/memory-hotplug.rst         |  12 ++
 arch/arm64/Kconfig                            |   4 +-
 arch/powerpc/Kconfig                          |   1 +
 arch/powerpc/include/asm/pgtable.h            |  21 ++
 .../platforms/pseries/hotplug-memory.c        |   2 +-
 arch/x86/Kconfig                              |   4 +-
 drivers/acpi/acpi_memhotplug.c                |   3 +-
 drivers/base/memory.c                         |  27 ++-
 include/linux/memory.h                        |   8 +-
 include/linux/memory_hotplug.h                |   3 +-
 mm/Kconfig                                    |   3 +
 mm/memory_hotplug.c                           | 185 ++++++++++++++----
 12 files changed, 209 insertions(+), 64 deletions(-)

-- 
2.41.0

