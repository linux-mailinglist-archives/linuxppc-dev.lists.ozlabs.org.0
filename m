Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE827571E7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 04:45:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iozN5aXr;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R4jws2rq3z3cYx
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 12:45:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iozN5aXr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R4jw16Thzz2yF1
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jul 2023 12:44:33 +1000 (AEST)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36I2gOHH010618;
	Tue, 18 Jul 2023 02:44:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=RtWBvfQ6kkIEPZWUvA777nY9iUweKwXHv4RQA1GNxFo=;
 b=iozN5aXrC6a2RfbhhWVOxVmRe/nG1WX31wJqJtImfzdlqdMdNT1T5P4edVkiZgkWs4mQ
 XvsLm22ud3Nsbh+atrlZpBE0VyfdiKRvaSJux0F/iYL5+22YfAmNQ000mw63FWvonZUQ
 Dl7DOZ8f6d23WAxtXbCHTuvBUrzuigGaM8TfhvkniYZnFAG2d70iU1n7xdHKC/bPRdzv
 6jaO2gA3eHcvUniDaA9cV50kcLysualAqDLZHFuF4kcU3MdJ1t2E6tjX9cWy2lfdVF9s
 ByQYRkqADG1AcbxqXSQCeCIwHCQsI5zsr3hNAOBoRguiNi/UfRglK8IrvaCCjrX9f5vZ NA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rwj6gr0p2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jul 2023 02:44:20 +0000
Received: from m0353726.ppops.net (m0353726.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 36I2i5KO015392;
	Tue, 18 Jul 2023 02:44:19 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rwj6gr0nu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jul 2023 02:44:19 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36HK0R9F009611;
	Tue, 18 Jul 2023 02:44:18 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([172.16.1.73])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3rv80j1hf3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jul 2023 02:44:18 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 36I2iHl92425456
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 18 Jul 2023 02:44:17 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 87BE05805C;
	Tue, 18 Jul 2023 02:44:17 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 826175805A;
	Tue, 18 Jul 2023 02:44:13 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.43.62.199])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 18 Jul 2023 02:44:13 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org, mpe@ellerman.id.au,
        linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
        christophe.leroy@csgroup.eu
Subject: [PATCH v4 0/6] Add support for memmap on memory feature on ppc64
Date: Tue, 18 Jul 2023 08:14:03 +0530
Message-ID: <20230718024409.95742-1-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ryOY_6AoALwuZUkz7Mq3nckED12_Nblo
X-Proofpoint-GUID: 0PyZN0drMhvgkarcI5Np4xizfMu-EHlQ
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-17_15,2023-07-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=976
 impostorscore=0 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307180022
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
  mm/hotplug: Simplify ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE kconfig
  mm/hotplug: Allow memmap on memory hotplug request to fallback
  mm/hotplug: Allow architecture to override memmap on memory support
    check
  mm/hotplug: Allow pageblock alignment via altmap reservation
  powerpc/book3s64/memhotplug: Enable memmap on memory for radix
  mm/hotplug: Embed vmem_altmap details in memory block

 arch/arm64/Kconfig                            |   4 +-
 arch/powerpc/Kconfig                          |   1 +
 arch/powerpc/include/asm/pgtable.h            |  24 +++
 .../platforms/pseries/hotplug-memory.c        |   3 +-
 arch/x86/Kconfig                              |   4 +-
 drivers/acpi/acpi_memhotplug.c                |   3 +-
 drivers/base/memory.c                         |  32 +++-
 include/linux/memory.h                        |   8 +-
 include/linux/memory_hotplug.h                |   3 +-
 mm/Kconfig                                    |   3 +
 mm/memory_hotplug.c                           | 168 ++++++++++++++----
 11 files changed, 193 insertions(+), 60 deletions(-)

-- 
2.41.0

