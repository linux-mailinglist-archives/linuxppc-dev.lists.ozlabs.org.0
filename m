Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE1AB5AD9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Sep 2019 07:23:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Y7gX6JtWzF31y
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Sep 2019 15:23:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=au1.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=alastair@au1.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=au1.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Y7cq1kc4zF4H7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Sep 2019 15:21:30 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8I5HSwp091684
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Sep 2019 01:21:26 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2v3b35wu0c-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Sep 2019 01:21:26 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <alastair@au1.ibm.com>;
 Wed, 18 Sep 2019 06:21:23 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 18 Sep 2019 06:21:18 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8I5LHqN45219864
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 18 Sep 2019 05:21:17 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D50AD52050;
 Wed, 18 Sep 2019 05:21:16 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 8D4A35204F;
 Wed, 18 Sep 2019 05:21:16 +0000 (GMT)
Received: from adsilva.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 3E70EA01E6;
 Wed, 18 Sep 2019 15:21:15 +1000 (AEST)
From: "Alastair D'Silva" <alastair@au1.ibm.com>
To: alastair@d-silva.org
Subject: [PATCH v3 0/5] powerpc: convert cache asm to C
Date: Wed, 18 Sep 2019 15:20:54 +1000
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19091805-0020-0000-0000-0000036E6A74
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19091805-0021-0000-0000-000021C41172
Message-Id: <20190918052106.14113-1-alastair@au1.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-18_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909180056
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, Mike Rapoport <rppt@linux.vnet.ibm.com>,
 Qian Cai <cai@lca.pw>, Paul Mackerras <paulus@samba.org>,
 Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Allison Randal <allison@lohutok.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Alastair D'Silva <alastair@d-silva.org>

This series addresses a few issues discovered in how we flush caches:
1. Flushes were truncated at 4GB, so larger flushes were incorrect.
2. Flushing the dcache in arch_add_memory was unnecessary

This series also converts much of the cache assembler to C, with the
aim of making it easier to maintain.

Alastair D'Silva (6):
  powerpc: Allow flush_icache_range to work across ranges >4GB
  powerpc: define helpers to get L1 icache sizes
  powerpc: Convert flush_icache_range & friends to C
  powerpc: Chunk calls to flush_dcache_range in arch_*_memory
  powerpc: Remove 'extern' from func prototypes in cache headers
  powerpc: Don't flush caches when adding memory

Changelog:
 V3:
     - factor out chunking loop
     - Replace __asm__ __volatile__ with asm volatile
     - Replace flush_coherent_icache_or_return macro with
       flush_coherent_icache function
     - factor our invalidate_icache_range
     - Replace code duplicating clean_dcache_range() in
       __flush_dcache_icache() with a call to clean_dcache_range()
     - Remove redundant #ifdef CONFIG_44x
     - Fix preprocessor logic:
         #if !defined(CONFIG_PPC_8xx) & !defined(CONFIG_PPC64)
     - Added loop(1|2) to earlyclobbers in flush_dcache_icache_phys
     - Drop "Remove extern" patch
     - Replace 32 bit shifts in 64 bit VDSO with 64 bit ones
 V2:
     - Replace C implementation of flush_dcache_icache_phys() with
       inline assembler authored by Christophe Leroy
     - Add memory clobbers for iccci implementation
     - Give __flush_dcache_icache a real implementation, it can't
       just be a wrapper around flush_icache_range()
     - Remove PPC64_CACHES from misc_64.S
     - Replace code duplicating clean_dcache_range() in
       flush_icache_range() with a call to clean_dcache_range()
     - Replace #ifdef CONFIG_44x with IS_ENABLED(...) in
       flush_icache_cange()
     - Use 1GB chunks instead of 16GB in arch_*_memory

Alastair D'Silva (5):
  powerpc: Allow flush_icache_range to work across ranges >4GB
  powerpc: define helpers to get L1 icache sizes
  powerpc: Convert flush_icache_range & friends to C
  powerpc: Chunk calls to flush_dcache_range in arch_*_memory
  powerpc: Don't flush caches when adding memory

 arch/powerpc/include/asm/cache.h        |  55 +++++---
 arch/powerpc/include/asm/cacheflush.h   |  36 +++--
 arch/powerpc/kernel/misc_32.S           | 117 ----------------
 arch/powerpc/kernel/misc_64.S           | 102 --------------
 arch/powerpc/kernel/vdso64/cacheflush.S |   4 +-
 arch/powerpc/mm/mem.c                   | 176 +++++++++++++++++++++++-
 6 files changed, 228 insertions(+), 262 deletions(-)

-- 
2.21.0

