Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2973276A7F1
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Aug 2023 06:42:35 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qB2kemP5;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RFMsj0dg3z3bcJ
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Aug 2023 14:42:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qB2kemP5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RFMrl3KTqz2xVn
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Aug 2023 14:41:42 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3714cb3S021159;
	Tue, 1 Aug 2023 04:41:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=Mtn4X5ZSVnobTFeCNYVXXxf/bvO4qWkRqORnPXNG5cM=;
 b=qB2kemP5K0wqEc7XZf9oPRU3oqMnl1TwMTqlN1/DuAUGG7gIl9Qq1ZKL52FAJK6/f9w7
 Ltib0R/+zk0z4ji5deb8f4alGQMK9vpK6nmFA1hZo00KSJJCDVXK96DBUUAORl8gueOT
 Z/E+D1nD5DeyFa2QiMIl7Om2O49VDHNjgC8lBzea0prts8EbMetNPFXBRVEip6FbpMw8
 1aNuOGaDgG56ibncN0iKXpUr4HRe+SsG6zVh0hgdU/dgG7IWXiAxYNyyVxzaHvtg2LJt
 loHHbla3nfl4WsL0RFfvK3SL22BLlgBwHsSE1nzqWDxvkXRhfWm0oOgBvPk9201tlZ9b 6g== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s6tnarscw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Aug 2023 04:41:27 +0000
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3714ctWI021989;
	Tue, 1 Aug 2023 04:41:27 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s6tnarsbg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Aug 2023 04:41:27 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3713S1Gu014545;
	Tue, 1 Aug 2023 04:41:26 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3s5ft186tn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Aug 2023 04:41:26 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com [10.39.53.230])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3714fPbX5505750
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 1 Aug 2023 04:41:25 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 697AF5805C;
	Tue,  1 Aug 2023 04:41:25 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BB6365805D;
	Tue,  1 Aug 2023 04:41:21 +0000 (GMT)
Received: from skywalker.in.ibm.com (unknown [9.109.212.144])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  1 Aug 2023 04:41:21 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org, mpe@ellerman.id.au,
        linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
        christophe.leroy@csgroup.eu
Subject: [PATCH v7 0/7] Add support for memmap on memory feature on ppc64
Date: Tue,  1 Aug 2023 10:11:09 +0530
Message-ID: <20230801044116.10674-1-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: rQRQycIRrlylwnhjfrENjAMiRYPjybNP
X-Proofpoint-ORIG-GUID: cio4raVlUtbwc4Hx4FLk2Rv0jN6zr7tw
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-01_02,2023-07-31_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 bulkscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=984 impostorscore=0 spamscore=0 adultscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308010041
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



Aneesh Kumar K.V (7):
  mm/memory_hotplug: Simplify ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE kconfig
  mm/memory_hotplug: Allow memmap on memory hotplug request to fallback
  mm/memory_hotplug: Allow architecture to override memmap on memory
    support check
  mm/memory_hotplug: Support memmap_on_memory when memmap is not aligned
    to pageblocks
  powerpc/book3s64/memhotplug: Enable memmap on memory for radix
  mm/memory_hotplug: Embed vmem_altmap details in memory block
  mm/memory_hotplug: Enable runtime update of memmap_on_memory parameter

 .../admin-guide/mm/memory-hotplug.rst         |  12 +
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
 mm/memory_hotplug.c                           | 205 ++++++++++++++----
 12 files changed, 220 insertions(+), 73 deletions(-)

-- 
2.41.0

