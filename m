Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E56876101A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 12:03:30 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nBGlVP7V;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R9CKD0Pxsz3cGS
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 20:03:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nBGlVP7V;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R9CJK2hqDz2xHb
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 20:02:40 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36P9bfoC025395;
	Tue, 25 Jul 2023 10:02:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=CGUlAJvMCS6sRK63SjAzMj2NTm5JvG6HgFTGq1Auw2w=;
 b=nBGlVP7VHM4nVm/6uR7hqnDOQTeCnLBCmsyydXRzJV3mOwelc45TaPlBSEYmgN8IyiNb
 g2AUcB3uQgi1EPvZsx8Z/cWySMWHuK+oHTucIQQq9CnsjiOx5Ju2Z3vvmINvnS0LU6HX
 kn3oYg+WuuDJU5t3OaaKmWAMtFD6rV4nOUMOhIBca3yd8Gq9McpQCVvgYNr7d1u4r+ja
 J+xPwINqoOLON2qEnPfZkAJ93h5owBCJMxf07I/AGNcKkzaf4AE7cjLa0YLr8Z22Ue1t
 cFn6YWQXqQVyAHmp6PDfkcOkHAyJEBNFKXPfPaCCAIuQIjsxCeDHWyhgcSiWmDL8lDbP xg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s24q1smn0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jul 2023 10:02:24 +0000
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 36P9dC87004109;
	Tue, 25 Jul 2023 10:02:23 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s24q1smm0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jul 2023 10:02:23 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36P8da4f003714;
	Tue, 25 Jul 2023 10:02:22 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3s0txjtup7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jul 2023 10:02:22 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 36PA2Lt520250964
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 25 Jul 2023 10:02:21 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8A3D45805E;
	Tue, 25 Jul 2023 10:02:21 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BDEF458051;
	Tue, 25 Jul 2023 10:02:17 +0000 (GMT)
Received: from skywalker.in.ibm.com (unknown [9.109.212.144])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 25 Jul 2023 10:02:17 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org, mpe@ellerman.id.au,
        linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
        christophe.leroy@csgroup.eu
Subject: [PATCH v5 0/7] Add support for memmap on memory feature on ppc64
Date: Tue, 25 Jul 2023 15:32:05 +0530
Message-ID: <20230725100212.531277-1-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: hYYhVq_v3ldVfVg9O8nZ4Y6bVjpj7Jfw
X-Proofpoint-GUID: 4rdXYET5no1eKQZpAJoDZjspjMf6sU7u
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-25_04,2023-07-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 bulkscore=0 mlxscore=0 spamscore=0
 suspectscore=0 adultscore=0 phishscore=0 mlxlogscore=999 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307250082
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



Aneesh Kumar K.V (7):
  mm/hotplug: Simplify ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE kconfig
  mm/hotplug: Allow memmap on memory hotplug request to fallback
  mm/hotplug: Allow architecture to override memmap on memory support
    check
  mm/hotplug: Support memmap_on_memory when memmap is not aligned to
    pageblocks
  powerpc/book3s64/memhotplug: Enable memmap on memory for radix
  mm/hotplug: Embed vmem_altmap details in memory block
  mm/hotplug: Enable runtime update of memmap_on_memory parameter

 .../admin-guide/mm/memory-hotplug.rst         |  12 ++
 arch/arm64/Kconfig                            |   4 +-
 arch/powerpc/Kconfig                          |   1 +
 arch/powerpc/include/asm/pgtable.h            |  24 +++
 .../platforms/pseries/hotplug-memory.c        |   3 +-
 arch/x86/Kconfig                              |   4 +-
 drivers/acpi/acpi_memhotplug.c                |   3 +-
 drivers/base/memory.c                         |  32 ++-
 include/linux/memory.h                        |   8 +-
 include/linux/memory_hotplug.h                |   3 +-
 mm/Kconfig                                    |   3 +
 mm/memory_hotplug.c                           | 201 ++++++++++++++----
 12 files changed, 229 insertions(+), 69 deletions(-)

-- 
2.41.0

