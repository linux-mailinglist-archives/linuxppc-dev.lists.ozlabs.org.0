Return-Path: <linuxppc-dev+bounces-5746-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F109A23DBF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Jan 2025 13:25:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ykw8q4V6kz30Vr;
	Fri, 31 Jan 2025 23:25:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738326347;
	cv=none; b=iCGR0LciYafu9uPZxDgo5GdXZvNyyBtz2O5XhGG5wE3B7yBIffUwS+N4gkcD8exuDZbwCZ7sSUrVrkd0RKAzoa3XE4T4Zg9e3FVgucqiyBapQGEtSPy5bPrGQz505cxeMFY351axtK+8R3suU4p1h+0BFxaKqZa+CJp9NCbywgyzWNZHtyxkTHfOmbo9RO6Dr/VVpPLgCEsq6eH7CKNSJgH5el/IMC7HpLTljmikGZgdGz22N4Yq+4xIZJJJL0/qSI8ieQSs0l4Zfkr7oEIGy48a6DL47sG5Kiy2HHSpSFQSU/obQn8zTqeK516kxB5m0TR2bIKQ2pBocUgRZzv4cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738326347; c=relaxed/relaxed;
	bh=9ccUDYc1EcHDH2NmxewPM72NWsh2GLRbN3XP7uqVYz4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LIcmdpYFdhj0S8bn8/Ght8s1ny0I9EaIWYDB86wFgeoOBiT6HolEJnsHxpAK5hpp5TUYChYBYAHV13ZyZ3uMjpZVJCPdGHZOQgePy7WcFXw4lScqw9wflJ/gYiQfv51NIU5FBS9KRDpELnjmmICoxqDHyu4MrcY9ZRssXjDNM6Uj9cWpJAnLbHmgOEvni+NvwvS3gwYhqJx22hy885jh19ANs3MWtReDWakxRPCKXMd/8lkxc4zdIvoGNmtm3lVE03YZGHkeYe2NZ1gE6HqbW9RJ3nH2YKVgQrhUriPEIk4x5gj2Y/JFnfIAKtXupsM6tb7+cY19GRgWqWSz4fdp4A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mibX7pez; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mibX7pez;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ykw8p65fFz30Vq
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Jan 2025 23:25:46 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50V2OJkW016476;
	Fri, 31 Jan 2025 12:25:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=9ccUDYc1EcHDH2NmxewPM72NWsh2GLRbN3XP7uqVY
	z4=; b=mibX7pezBgydwGC9klaT6XtbjGxjTRnUifweGaIlRaq8N2Utgw6kzIIeu
	Wz9aU/SaN4b8tNyv6boj11TDEk+NWbj9ck//AZ9Oge2mvey8uFSbmGHHlz8k4Ju/
	wima7q3AhAzk0pA4I5q3nU58FPIrsBnU/w2h5In+ys38YXK2MFZlzIOeajTBvvfz
	bSYVtuuTPW+g8IyuE+3aSxaVzGH4laW2JRWjVb9h4wfgnqUYBr87CGSUUj8PmzZ6
	Ct2hkRhHPx1nIKKxBum+CJqz/deMFW+EPiluEp7w80oZzBYVbK5juGupwVXGEWZK
	Vm/4X3nfOf+KwxP1VsPi27XPB909g==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44gmk92css-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 Jan 2025 12:25:37 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50VCAvcP017237;
	Fri, 31 Jan 2025 12:25:36 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 44gfaybgwh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 Jan 2025 12:25:36 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50VCPWuO35193348
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 31 Jan 2025 12:25:32 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9A1EE200F6;
	Fri, 31 Jan 2025 11:38:36 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 881FF200F0;
	Fri, 31 Jan 2025 11:38:33 +0000 (GMT)
Received: from li-4f5ba44c-27d4-11b2-a85c-a08f5b49eada.ibm.com.com (unknown [9.43.16.21])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 31 Jan 2025 11:38:33 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>,
        Andrew Morton <akpm@linux-foundation.org>, Baoquan he <bhe@redhat.com>,
        Hari Bathini <hbathini@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>, kexec@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/7] powerpc/crash: use generic crashkernel reservation
Date: Fri, 31 Jan 2025 17:08:23 +0530
Message-ID: <20250131113830.925179-1-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.48.1
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: IpMBxVikNIkI1ge4T6Sppr_sgL2rkU2_
X-Proofpoint-ORIG-GUID: IpMBxVikNIkI1ge4T6Sppr_sgL2rkU2_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-31_04,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 impostorscore=0 mlxscore=0 bulkscore=0 clxscore=1015
 adultscore=0 spamscore=0 phishscore=0 priorityscore=1501 mlxlogscore=999
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2501310091
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Commit 0ab97169aa05 ("crash_core: add generic function to do
reservation") added a generic function to reserve crashkernel memory.
So let's use the same function on powerpc and remove the
architecture-specific code that essentially does the same thing.

The generic crashkernel reservation also provides a way to split the
crashkernel reservation into high and low memory reservations, which can
be enabled for powerpc in the future.

Additionally move powerpc to use generic APIs to locate memory hole for
kexec segments while loading kdump kernel.

Patch series summary:
=====================
Patch 1-3: generic changes
Patch 4-7: powerpc changes

Changelog:

v1:
 https://lore.kernel.org/all/20241217064613.1042866-1-sourabhjain@linux.ibm.com/

v1 Resend:
 https://lore.kernel.org/all/20250108101458.406806-1-sourabhjain@linux.ibm.com/
 - Rebased on top of 6.13-rc6

v2:
 https://lore.kernel.org/all/20250121115442.1278458-1-sourabhjain@linux.ibm.com/
 - 01/06 new patch, fixes a bug with ELF load address
   It was posted in community as individual path but
   since it align with this patch series so include here:
   https://lore.kernel.org/all/20241210091314.185785-1-sourabhjain@linux.ibm.com/
 - Fixed a typo 06/06

 - Added Acked-by and Reviewed-by tags

 - Rebased it on 6.13

 - It was suggested to try HAVE_ARCH_ADD_CRASH_RES_TO_IOMEM_EARLY and
   see if 03/06 patch can be avoided:
   https://lore.kernel.org/all/Z35gnO2N%2FLFt1E7E@MiWiFi-R3L-srv/
   But after adding HAVE_ARCH_ADD_CRASH_RES_TO_IOMEM_EARLY the issue
   persisted and kernel prints below logs on boot:
   ...snip ...

v3:
 - Split the patch that adds the arch hook to handle special regions in
   crashkernel reserved: Now 03/07 and 04/07.

 - Dropped the patch that adds arch hooks to skip `Crash Kernel` from
   iomem_resource (/proc/iomem). Instead, a patch is added to include
   both `System RAM` and `Crash Kernel` memory ranges in iomem_resource: 06/07.

 - Rearranged the patches to ensure that generic patches come first,
   followed by PowerPC-specific patches.

 - Added Acked-by tags.

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Baoquan he <bhe@redhat.com>
Cc: Hari Bathini <hbathini@linux.ibm.com>
CC: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: kexec@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: sourabhjain@linux.ibm.com

Sourabh Jain (7):
  kexec: Initialize ELF lowest address to ULONG_MAX
  crash: remove an unused argument from reserve_crashkernel_generic()
  crash: Let arch decide usable memory range in reserved area
  powerpc/crash: Use generic APIs to locate memory hole for kdump
  powerpc/crash: preserve user-specified memory limit
  powerpc: insert System RAM resource to prevent crashkernel conflict
  powerpc/crash: use generic crashkernel reservation

 arch/arm64/mm/init.c                     |   6 +-
 arch/loongarch/kernel/setup.c            |   5 +-
 arch/powerpc/Kconfig                     |   3 +
 arch/powerpc/include/asm/crash_reserve.h |   8 +
 arch/powerpc/include/asm/kexec.h         |  10 +-
 arch/powerpc/kernel/prom.c               |   2 +-
 arch/powerpc/kexec/core.c                |  96 ++++-----
 arch/powerpc/kexec/file_load_64.c        | 259 +----------------------
 arch/powerpc/mm/mem.c                    |   2 +-
 arch/riscv/mm/init.c                     |   6 +-
 arch/x86/kernel/setup.c                  |   6 +-
 include/linux/crash_reserve.h            |  11 +-
 include/linux/kexec.h                    |   9 +
 kernel/crash_reserve.c                   |   9 +-
 kernel/kexec_elf.c                       |   2 +-
 kernel/kexec_file.c                      |  12 ++
 16 files changed, 105 insertions(+), 341 deletions(-)
 create mode 100644 arch/powerpc/include/asm/crash_reserve.h

-- 
2.48.1


