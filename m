Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE167497B4
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 10:52:11 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AfGnGYFl;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QxVdh1ZdJz3bqx
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 18:52:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AfGnGYFl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QxVck1StKz30Py
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jul 2023 18:51:17 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3668kiqZ018570;
	Thu, 6 Jul 2023 08:51:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=+CrbEjk6aTrtuJPRY83Ysydi7/qhn9mc/IfEFwTSyPw=;
 b=AfGnGYFlYml6N/peQNgxzPhTd7BQUuh7QEB/1JEYeI11xmN/SGofM+J5LQWBT6qtblzO
 MUwToXEmMJc7mtJoTLQx0OgbzgQgunheICP5zRRa4C6e51D6jfcweRLvQt3Jzp2oeXVv
 n9+UN+ZMO5v4LJnIZkqIXBuKl1f4lFkVZyS1ItSm2B5g7dMc98Lrp7uSO3an9P5yL8mI
 KTW656J+QPhS7vR4LKqAsv8YXb44SfSaJmw7rhup+SrEjVgdnAiVsrqmbVKgQoXQKxjM
 JhkEHgGin7lgPJKnNg3wmtBuhm6yfX+A/ZvEAAQ4hbL87f3vAhD7IS3MtG7iwM1xAfly hA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rntd805dc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Jul 2023 08:51:02 +0000
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3668l7wj019555;
	Thu, 6 Jul 2023 08:51:01 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.10])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rntd805ck-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Jul 2023 08:51:01 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
	by ppma02dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3668lE0O016351;
	Thu, 6 Jul 2023 08:51:00 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([9.208.130.101])
	by ppma02dal.us.ibm.com (PPS) with ESMTPS id 3rjbs6n055-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Jul 2023 08:51:00 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3668oxig65470888
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 6 Jul 2023 08:50:59 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id ABD685805D;
	Thu,  6 Jul 2023 08:50:59 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C63B458057;
	Thu,  6 Jul 2023 08:50:55 +0000 (GMT)
Received: from skywalker.in.ibm.com (unknown [9.109.212.144])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  6 Jul 2023 08:50:55 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org, mpe@ellerman.id.au,
        linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
        christophe.leroy@csgroup.eu
Subject: [PATCH v2 0/5] Add support for memmap on memory feature on ppc64
Date: Thu,  6 Jul 2023 14:20:36 +0530
Message-ID: <20230706085041.826340-1-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: t_b_UdVqW-6diCA99dqDAMzvQIYnC1_i
X-Proofpoint-ORIG-GUID: u0Dsn1j6EXWDFSycSLkFpWahlgYnxA_A
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-06_05,2023-07-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 malwarescore=0 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0
 impostorscore=0 mlxscore=0 priorityscore=1501 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307060075
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

Changes from v1:
* update the memblock to store vmemmap_altmap details. This is required
so that when we remove the memory we can find the altmap details which
is needed on some architectures.
* rebase to latest linus tree



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
 mm/memory_hotplug.c                           | 94 +++++++++----------
 14 files changed, 151 insertions(+), 89 deletions(-)

-- 
2.41.0

