Return-Path: <linuxppc-dev+bounces-15502-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A442D0E36F
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Jan 2026 09:24:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dppSs2wWdz2yTH;
	Sun, 11 Jan 2026 19:24:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768119853;
	cv=none; b=ouAgxVxvoczqt7NhH87Wtw//372jVRh+zzurc7FL/SMY6y/M8F2Q66I3vQvI1W5ODbTELOZKpNIAV5DHM0BJttruu6s2uRt/7GwiA5qaUCVgdEDqdN35gBtluoPyofS21vHWcOI8+7JY1FUL0SXRPFdTsRI8uOpyiYnQ+SUcV4hXilzw37NOByMDRiaeOisowkuGvsJdguhPj5zPPH3N2e75G/7OgsXW7RsPNHu/rwqXygCSR3HL7wRYILUdR9euOPxSxetDMOuQ1O04OPQsrBNz9Baxd7KNNwOK5yckddq+9XrXfvYVK/mzCvhCSzMm2ZrjRNcxzMt7L7ZJ6M6Y5w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768119853; c=relaxed/relaxed;
	bh=t9pBPAmCex859p6JrPopJFcFxfKxR6uVnsR3JS1C8yI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RXZD7cdJYs/r5hiPTXDcZ5BjT623GPLXYC0InUyFs9KLkEFzdc2xfSMv426i5jsLLjaMfhTgA/fuxjnWe1R4TSPv9StPOMn6xYIpaiJT4uQr6h6inT9fo3AwDI17asQFnQOpwDEPT9J+qwp42x53G2VtJUR6QPuEA7R09TdOo7Njdd1i4WU5vAzUL8SshDc3T/WZlzzFntcGrHdiNlf0arTSgpMyKPjc/oFVZYMr34k330aL/TkY/uuuvYT2Riqjb2pFcZARxioj/FpNu2v/K+gNFgJKdNq7L8wLn9psTojUCMHclitMptPD7NNWfz7Nb2CKR/gkHhkHVgAJAzDsiA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=omxz2O/a; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=omxz2O/a;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dppSr3tW0z2xdY
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 11 Jan 2026 19:24:12 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 64E9F60121;
	Sun, 11 Jan 2026 08:24:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BDCEC4CEF7;
	Sun, 11 Jan 2026 08:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768119850;
	bh=es+FUCZqCY2a3nIkrdLdpQV/rxxtDtuUgA954vVF+nw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=omxz2O/aNi5ef6cgYnp+37iqiEb04KQOncjs53j7rIMU4VDGgOX2pBVK2nRapJSSP
	 k1CuMOi30eMl+WQajuUXdkhrkdF/m7Tjfpi1B1LrHprBPHjP3Zf1UIt9glL5fkqxUL
	 QQZKUWdSoT9RE+fnq1mBm4qFs6cY5r3sDiVaFaCuBFzDu81I1W78bWXIWVFE2q2L3O
	 YclKYARGBbQMefEdS0nlKYU0XZKLXlE5121MF4WFj42HdvBhME3uC89Nz4eJFFnmrO
	 wu9spXNqayKnIkf8mX9sEG4xfajwEuCKqQPc6BysjXlagd9N7BdqHLEKZvZtn8KDOr
	 Z9iZjeEhDIZ/g==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Alex Shi <alexs@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Borislav Petkov <bp@alien8.de>,
	Brian Cain <bcain@kernel.org>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	"David S. Miller" <davem@davemloft.net>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Hildenbrand <david@kernel.org>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Guo Ren <guoren@kernel.org>,
	Heiko Carstens <hca@linux.ibm.com>,
	Helge Deller <deller@gmx.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Klara Modin <klarasmodin@gmail.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Magnus Lindholm <linmag7@gmail.com>,
	Matt Turner <mattst88@gmail.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Hocko <mhocko@suse.com>,
	Michal Simek <monstr@monstr.eu>,
	Mike Rapoport <rppt@kernel.org>,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Richard Weinberger <richard@nod.at>,
	Ritesh Harjani <ritesh.list@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Stafford Horne <shorne@gmail.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Vineet Gupta <vgupta@kernel.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	Will Deacon <will@kernel.org>,
	x86@kernel.org,
	linux-alpha@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-cxl@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-mm@kvack.org,
	linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-um@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev,
	sparclinux@vger.kernel.org
Subject: [PATCH v3 11/29] mips: introduce arch_zone_limits_init()
Date: Sun, 11 Jan 2026 10:20:45 +0200
Message-ID: <20260111082105.290734-12-rppt@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260111082105.290734-1-rppt@kernel.org>
References: <20260111082105.290734-1-rppt@kernel.org>
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
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

Move calculations of zone limits to a dedicated arch_zone_limits_init()
function.

Later MM core will use this function as an architecture specific callback
during nodes and zones initialization and thus there won't be a need to
call free_area_init() from every architecture.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/mips/loongson64/numa.c      |  9 +++++++--
 arch/mips/mm/init.c              | 14 +++++++++-----
 arch/mips/sgi-ip27/ip27-memory.c |  7 ++++++-
 3 files changed, 22 insertions(+), 8 deletions(-)

diff --git a/arch/mips/loongson64/numa.c b/arch/mips/loongson64/numa.c
index 95d5f553ce19..f72a58f87878 100644
--- a/arch/mips/loongson64/numa.c
+++ b/arch/mips/loongson64/numa.c
@@ -154,13 +154,18 @@ static __init void prom_meminit(void)
 	}
 }
 
+void __init arch_zone_limits_init(unsigned long *max_zone_pfns)
+{
+	max_zone_pfns[ZONE_DMA32] = MAX_DMA32_PFN;
+	max_zone_pfns[ZONE_NORMAL] = max_low_pfn;
+}
+
 void __init paging_init(void)
 {
 	unsigned long zones_size[MAX_NR_ZONES] = {0, };
 
 	pagetable_init();
-	zones_size[ZONE_DMA32] = MAX_DMA32_PFN;
-	zones_size[ZONE_NORMAL] = max_low_pfn;
+	arch_zone_limits_init(zones_size);
 	free_area_init(zones_size);
 }
 
diff --git a/arch/mips/mm/init.c b/arch/mips/mm/init.c
index a673d3d68254..ab08249cfede 100644
--- a/arch/mips/mm/init.c
+++ b/arch/mips/mm/init.c
@@ -394,12 +394,8 @@ void maar_init(void)
 }
 
 #ifndef CONFIG_NUMA
-void __init paging_init(void)
+void __init arch_zone_limits_init(unsigned long *max_zone_pfns)
 {
-	unsigned long max_zone_pfns[MAX_NR_ZONES];
-
-	pagetable_init();
-
 #ifdef CONFIG_ZONE_DMA
 	max_zone_pfns[ZONE_DMA] = MAX_DMA_PFN;
 #endif
@@ -417,7 +413,15 @@ void __init paging_init(void)
 		max_zone_pfns[ZONE_HIGHMEM] = max_low_pfn;
 	}
 #endif
+}
+
+void __init paging_init(void)
+{
+	unsigned long max_zone_pfns[MAX_NR_ZONES];
+
+	pagetable_init();
 
+	arch_zone_limits_init(max_zone_pfns);
 	free_area_init(max_zone_pfns);
 }
 
diff --git a/arch/mips/sgi-ip27/ip27-memory.c b/arch/mips/sgi-ip27/ip27-memory.c
index 2b3e46e2e607..babeb0e07687 100644
--- a/arch/mips/sgi-ip27/ip27-memory.c
+++ b/arch/mips/sgi-ip27/ip27-memory.c
@@ -406,11 +406,16 @@ void __init prom_meminit(void)
 	}
 }
 
+void __init arch_zone_limits_init(unsigned long *max_zone_pfns)
+{
+	max_zone_pfns[ZONE_NORMAL] = max_low_pfn;
+}
+
 void __init paging_init(void)
 {
 	unsigned long zones_size[MAX_NR_ZONES] = {0, };
 
 	pagetable_init();
-	zones_size[ZONE_NORMAL] = max_low_pfn;
+	arch_zone_limits_init(zones_size);
 	free_area_init(zones_size);
 }
-- 
2.51.0


