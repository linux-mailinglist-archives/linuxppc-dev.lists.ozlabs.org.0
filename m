Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F4EA1B8CC5
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Apr 2020 07:56:18 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 498xwv5f8gzDqbC
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Apr 2020 15:56:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=ira.weiny@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 498xtz6772zDqKS
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Apr 2020 15:54:25 +1000 (AEST)
IronPort-SDR: 1bz+4W5XjQJEQJoKZcWMaN9LVQe04LJjjwKOYvU0JJla/pNmkuJF51rql1QoRJUy2RUqbWqYdr
 CJgQGl32B8RQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2020 22:54:21 -0700
IronPort-SDR: /cZ3umTa8B8PLh9tjA9EP3+bxl80qczghY2Si7yQnbojuyuxqol2zAYPUansPdHYwpezKRfg9s
 EcpTlSW8XTMQ==
X-IronPort-AV: E=Sophos;i="5.73,319,1583222400"; d="scan'208";a="281313737"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2020 22:54:20 -0700
From: ira.weiny@intel.com
To: linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 0/5] Remove duplicated kmap code
Date: Sat, 25 Apr 2020 22:54:01 -0700
Message-Id: <20200426055406.134198-1-ira.weiny@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Helge Deller <deller@gmx.de>, x86@kernel.org, linux-csky@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>, linux-snps-arc@lists.infradead.org,
 linux-xtensa@linux-xtensa.org, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
 linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Ira Weiny <ira.weiny@intel.com>

The kmap infrastructure has been copied almost verbatim to every architecture.
This series consolidates obvious duplicated code.  (k[un]map_atmoic has some
additional duplication between some of the architectures but the differences
were such to not warrant further changes.)

0day built successfully to cover all the architectures I can't readily build.

Ira Weiny (5):
  arch/kmap: Remove BUG_ON()
  arch/kmap: Remove redundant arch specific kmaps
  arch/kunmap: Remove duplicate kunmap implementations
  arch/kmap_atomic: Consolidate duplicate code
  arch/kunmap_atomic: Consolidate duplicate code

 arch/arc/include/asm/highmem.h        | 11 -------
 arch/arc/mm/highmem.c                 | 20 ++-----------
 arch/arm/include/asm/highmem.h        |  3 --
 arch/arm/mm/highmem.c                 | 28 ++----------------
 arch/csky/include/asm/highmem.h       |  3 +-
 arch/csky/mm/highmem.c                | 28 ++++--------------
 arch/microblaze/include/asm/highmem.h | 17 -----------
 arch/microblaze/mm/highmem.c          | 10 ++-----
 arch/mips/include/asm/highmem.h       |  3 +-
 arch/mips/mm/highmem.c                | 25 +++-------------
 arch/nds32/include/asm/highmem.h      |  3 --
 arch/nds32/mm/highmem.c               | 31 ++------------------
 arch/parisc/include/asm/cacheflush.h  |  2 --
 arch/powerpc/include/asm/highmem.h    | 17 -----------
 arch/powerpc/mm/highmem.c             |  9 ++----
 arch/sparc/include/asm/highmem.h      | 17 -----------
 arch/sparc/mm/highmem.c               |  9 ++----
 arch/x86/include/asm/highmem.h        |  4 ---
 arch/x86/mm/highmem_32.c              | 30 ++------------------
 arch/xtensa/include/asm/highmem.h     | 14 +--------
 arch/xtensa/mm/highmem.c              | 10 ++-----
 include/linux/highmem.h               | 41 +++++++++++++++++++++++++--
 22 files changed, 75 insertions(+), 260 deletions(-)

-- 
2.25.1

