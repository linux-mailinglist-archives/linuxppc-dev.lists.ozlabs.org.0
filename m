Return-Path: <linuxppc-dev+bounces-15132-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 841E9CEDBD1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 02 Jan 2026 08:02:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4djF4b5cqsz2ydn;
	Fri, 02 Jan 2026 18:02:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767337343;
	cv=none; b=H2NtR0vkkyqzxZzDmKKPrzcKOHSRodlnV5xGRv0mBDuaI6e061LelJYNJpRn8dUJKsE9AQzh6HC2APDv19t4YjjPvlceK72HobslUB3wLWwCVQgG94pFhA1f2XdI2Tekit/X0aWloOcJhe0HrnL5W7DrHkykVbJAKliwChvTlDJkudLW4G9KV6Ui3MzLbi4z+Ug24N+ySF5OCQbrENqsuoU/ACLub8GM2NfPanBN2PnYFfPXe/Jc0J+t+6tgcE3/ES1el9arazT2UDR+yxUELwDpIIdfd73bOuYVKrMUZjaioBWVyt+c/Wjwndn5Fe5OtFGoLz0Qo6R/G1i0xqGCLw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767337343; c=relaxed/relaxed;
	bh=I9r49gF1239seYn0EXw4a+FTKxA1x4OYVZ+hhz2pvoc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eljq9DrjRyUJ6bAXE2ozyNhLo1S/uU0zAqwDGFBQWTG/fV6rXlthjaqAcLjGbs4pkVU4htxlCSeZjE62zI4ZVBZZpFRqzdvr73q9UcTcHy/pmEFwkvor6TstRbXSjufCHOOdyHn/WlfGpL+a1EUywLijZ8PghQuO+dSgCkFAlAGEnegLAe2TqjZnUuQfI/PZQq6ZChB2UtQNdHp3TRSD8iLnn+5eNoVZY9tUJZX6rod5XvsLiO4KMUSFWh+xQ2rLgMSzGgMS67beMOKvUbMVSkO3fRwWWULGrlhtBaS2s6fcx/oTz1AGhOIXar1L5ZX38hN/u98kQSPGrUI9oNpHng==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BpS/vYy/; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BpS/vYy/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4djF4Z6TkLz2yYq
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 Jan 2026 18:02:22 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DC71360017;
	Fri,  2 Jan 2026 07:01:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B87CDC116B1;
	Fri,  2 Jan 2026 07:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767337310;
	bh=eqWldmxLZQ+MuA70zzUt7CpIfBT1PwNgoY4RoneYtY0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BpS/vYy/9nyGIKafFE9V+r4HIaDTnoFUO6BTxQPGX0+fK6kCr7xShS1cvyBf0N0yT
	 CerQRZQXT7MbCqIrnCsgOrgv2Ia55RleKWDmaMs2irjPc6GjTnGGw+wLnXomD+vLNI
	 KSkl/U2dJXx7h9eXgJ0JskjtaWXluWjpg/x0JjdxvJeKsUnPXMXMkszXrGJ82oXAX3
	 YZWN0c2pAwx8Alfig8i8HbWRbmXbfiG8GoDVdegQc0Cg6X09COblKfsTjZPB14TFdd
	 QC/bQ1qfR0BgMcXAOfnQocx9hjiqjc4+pk0Vmnp+5k7ZzBLlasAVGNh5Q2wgUjvSxI
	 GMTmo8jn11Vdw==
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
Subject: [PATCH v2 06/28] hexagon: introduce arch_zone_limits_init()
Date: Fri,  2 Jan 2026 08:59:42 +0200
Message-ID: <20260102070005.65328-7-rppt@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260102070005.65328-1-rppt@kernel.org>
References: <20260102070005.65328-1-rppt@kernel.org>
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
 arch/hexagon/mm/init.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/arch/hexagon/mm/init.c b/arch/hexagon/mm/init.c
index 34eb9d424b96..e2c9487d8d34 100644
--- a/arch/hexagon/mm/init.c
+++ b/arch/hexagon/mm/init.c
@@ -54,6 +54,18 @@ void sync_icache_dcache(pte_t pte)
 	__vmcache_idsync(addr, PAGE_SIZE);
 }
 
+void __init arch_zone_limits_init(unsigned long *max_zone_pfns)
+{
+	/*
+	 *  This is not particularly well documented anywhere, but
+	 *  give ZONE_NORMAL all the memory, including the big holes
+	 *  left by the kernel+bootmem_map which are already left as reserved
+	 *  in the bootmem_map; free_area_init should see those bits and
+	 *  adjust accordingly.
+	 */
+	max_zone_pfns[ZONE_NORMAL] = max_low_pfn;
+}
+
 /*
  * In order to set up page allocator "nodes",
  * somebody has to call free_area_init() for UMA.
@@ -65,16 +77,7 @@ static void __init paging_init(void)
 {
 	unsigned long max_zone_pfn[MAX_NR_ZONES] = {0, };
 
-	/*
-	 *  This is not particularly well documented anywhere, but
-	 *  give ZONE_NORMAL all the memory, including the big holes
-	 *  left by the kernel+bootmem_map which are already left as reserved
-	 *  in the bootmem_map; free_area_init should see those bits and
-	 *  adjust accordingly.
-	 */
-
-	max_zone_pfn[ZONE_NORMAL] = max_low_pfn;
-
+	arch_zone_limits_init(max_zone_pfn);
 	free_area_init(max_zone_pfn);  /*  sets up the zonelists and mem_map  */
 
 	/*
-- 
2.51.0


