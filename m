Return-Path: <linuxppc-dev+bounces-9321-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D765AD7910
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Jun 2025 19:36:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bJ8pQ4B80z306l;
	Fri, 13 Jun 2025 03:36:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749749790;
	cv=none; b=E2PeC8FpnOgz+r0J4+K0XSIPQ8q8kfVPpGzFIdV+Y+wfWlak4lSIq5qHyWi9wCWsqqLuMZNvjEISkNDofv7iHzUXD4NzQ+ksHlSzDxrQqKzKGVTyydU9Y8tG7+QkjoHrxdqsgjDgtwDI+xNWdvyYXNgIN8u5TpfzUMA0VdwQYVsP3DeAW/7cbrnB24OgP63iah+jyHtaAYS+0HqKZpxFiCLVH2JEwVVaFi21std3frcnHSoVJn0LIqeDNqH8i0rHwlJ/rcC2mMs2THa6SbrZBEl2tzne390WXrMxpmWPc8IyDaow4kXpMwC6usbLOEwVGJ76XPkSxtiAMJqdxrlStw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749749790; c=relaxed/relaxed;
	bh=ANjAB/i+3wqbtm/fqKC9pjVNNGYd+LvuX5UmSeokVjQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=M1MUqsBNxdT6cJHngkgMmMOv21+ojKoDmkY+2We3MK83xctJrDhYvIRSQCd19ZkxHQ7ESWJy3kMoAGE4dQwHpmspGdC5z4BWHGCYTZ4ibkM+2t/Oo55ptchvZKKPmZmqfX5AFHbumrCdjwky3qgq8f9dZBW++AJLEjwev6E/PnN8UT/cEAI36sWyyAq0yEcIsdybttzjTT/SyMghFph1oN64bxpudJeoDHqOomNmKAABIhKNnrGXPjQOmhV9K51u6RBKG9syjigN0lOpvqM2XYg6HXNm0QLrRWB46aj9qpuyIBNXefwukTEBuVgmwvRM9n0fI9dSnsbJsU3Bu6qrzQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gPjOJz2D; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=agordeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gPjOJz2D;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=agordeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bJ8pN1kFFz2yFQ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Jun 2025 03:36:27 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55C9xpHh005022;
	Thu, 12 Jun 2025 17:36:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=ANjAB/i+3wqbtm/fqKC9pjVNNGYd+LvuX5UmSeokV
	jQ=; b=gPjOJz2DlLLAahuxLsMvga8P96e5QtjjssuX3WnL7wfNwU9S7odZ1iF9n
	AHXZaL0QgY2Yvv6+PISmVU8AGURt3TkfFKWYn1x50taMSKAa7h1Py0L08hzBockn
	sQx28XfA83iutCkSgewhPkGk2hg9n0qPC6L8fNJUmDuqW9yEPkMry4L+GC9tTYO0
	SD4Ldvr2NfjhdTYVv7Rn944LtNQhipOioR+F7fsnJ9kdle/XbEcv+ONZ2kYaVUYJ
	/VTaRAakSqlZ1oK9rnq/4HmKpkaucRMwQY60+eLDS+xgc8bSOsXNrs+da1Mm5Jx9
	DxiiZIL4w7ZQHN8ei7UjgxYir2X1w==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 474x4mhdbs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Jun 2025 17:36:16 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 55CHaGIg029272;
	Thu, 12 Jun 2025 17:36:16 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 474x4mhdbp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Jun 2025 17:36:16 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 55CGbdNq015205;
	Thu, 12 Jun 2025 17:36:15 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 474yrtp6b1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Jun 2025 17:36:15 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 55CHaE2S46072192
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 12 Jun 2025 17:36:14 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F201B20043;
	Thu, 12 Jun 2025 17:36:13 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DE45420040;
	Thu, 12 Jun 2025 17:36:13 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu, 12 Jun 2025 17:36:13 +0000 (GMT)
Received: by tuxmaker.boeblingen.de.ibm.com (Postfix, from userid 55669)
	id 9B577E0157; Thu, 12 Jun 2025 19:36:13 +0200 (CEST)
From: Alexander Gordeev <agordeev@linux.ibm.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
        Hugh Dickins <hughd@google.com>, Nicholas Piggin <npiggin@gmail.com>,
        Guenter Roeck <linux@roeck-us.net>, Juergen Gross <jgross@suse.com>,
        Jeremy Fitzhardinge <jeremy@goop.org>,
        Ryan Roberts <ryan.roberts@arm.com>
Subject: [PATCH 0/6] mm: Consolidate lazy MMU mode context
Date: Thu, 12 Jun 2025 19:36:07 +0200
Message-ID: <cover.1749747752.git.agordeev@linux.ibm.com>
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
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=Y4X4sgeN c=1 sm=1 tr=0 ts=684b1011 cx=c_pps a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=_adeEUt4WAeD9YfioJwA:9
X-Proofpoint-GUID: qr5W2YIzc2A8ZYU2dsRpP1AphHqeKos2
X-Proofpoint-ORIG-GUID: y6xW9IJSAE1JE6kcXuiy_mrCImk2ZWSK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEyMDEzMiBTYWx0ZWRfXwOXjIkbbpepd OoV77Zxzv1DOdGZHdC1rjgNBCs+WzETf7mIinKv8drROUhS3PC4S3Ul3Eq1Rd7PKATmFyM+TDvL kAnBooerznbgDsNZ+/ZPaU+KOsEBXC93w8q9w6KmW11m/vgE/aUeMTSFQFutpSKrQJxT61mMBuv
 KSDxU4i8iMDqRaETa8beoNjTewS286bfktL7BQreW7c9kRIZcei0lJ9aqGyaWPDFPjwcafICCtq M+2fDqSlBJ149EKa1BJjaYXJjRiLvX/CmWd9wRa81Sdbs49mWKwGJKFbJ7AczMoR5fjZJzIohlx h7ggGzYUtbK6qCOXcSYaA1viUBK2oMNNt7ackAbJO+mupvs+X1Tc6Jccl69/IVghIosL27dXHPA
 isXNAQ9475tlf5eWUprb3n3jaqwe+zULK27nDf9N0r4ezafy+XnKcezzdAsVHSGEj7SQHlPp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_10,2025-06-12_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=994 spamscore=0
 clxscore=1011 lowpriorityscore=0 malwarescore=0 bulkscore=0 adultscore=0
 impostorscore=0 suspectscore=0 phishscore=0 mlxscore=0 priorityscore=1501
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506120132
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi All,

Consolidate arch_enter|leave|flush_lazy_mmu_mode() context and protect
with a lock not only user, but also kernel mappings before entering
the lazy MMU mode.

For not fully preemptible (Real-Time) kernels that simplifies semantics -
while the mode is active the code should assume it is executing in atomic
context. That paves the way for cleanups, such as suggested for sparc and
powerpc and hopefully brings a bit more clarity in what labeled in commit
691ee97e1a9d ("mm: fix lazy mmu docs and usage") as "a bit of a mess (to
put it politely)".

The fully preemptible (Real-Time) kernels could probably also be brought
into the fold, but I am not sure about implications (to say at least).

This series is continuation of [1] and [2], with commit b6ea95a34cbd
("kasan: avoid sleepable page allocation from atomic context") already
upstream.

I dared to keep Nicholas Piggin R-b on patch 3, but dropped it from
patch 2 due to new bits.

Except the optional sparc (untested) and powerpc (complile-tested)
updates this series is a prerequisite for implementation of lazy MMU
mode on s390.

1. https://lore.kernel.org/linux-mm/cover.1744037648.git.agordeev@linux.ibm.com/#r
2. https://lore.kernel.org/linux-mm/cover.1744128123.git.agordeev@linux.ibm.com/#r

Thanks!

Alexander Gordeev (6):
  mm: Cleanup apply_to_pte_range() routine
  mm: Lock kernel page tables before entering lazy MMU mode
  mm/debug: Detect wrong arch_enter_lazy_mmu_mode() contexts
  sparc/mm: Do not disable preemption in lazy MMU mode
  powerpc/64s: Do not disable preemption in lazy MMU mode
  powerpc/64s: Do not re-activate batched TLB flush

 .../include/asm/book3s/64/tlbflush-hash.h     | 13 ++++----
 arch/powerpc/include/asm/thread_info.h        |  2 --
 arch/powerpc/kernel/process.c                 | 25 --------------
 arch/sparc/include/asm/tlbflush_64.h          |  2 +-
 arch/sparc/mm/tlb.c                           | 12 ++++---
 include/linux/pgtable.h                       | 32 +++++++++++++-----
 mm/kasan/shadow.c                             |  5 ---
 mm/memory.c                                   | 33 ++++++++++++-------
 mm/vmalloc.c                                  |  6 ++++
 9 files changed, 65 insertions(+), 65 deletions(-)

-- 
2.48.1


