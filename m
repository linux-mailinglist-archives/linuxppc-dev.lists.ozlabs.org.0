Return-Path: <linuxppc-dev+bounces-15510-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5ABD0E438
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Jan 2026 09:26:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dppVv2RFpz2yVT;
	Sun, 11 Jan 2026 19:25:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768119959;
	cv=none; b=RFFsSAYLMxl9CWYYQ7sfr7kx3sEcnpgAcLhOUyv918MScX+1+Ld4D4w5x4icIPB3mwciDDJa3zvGcGUFS1//vnqToElA+sH7DgV0fjjUm8/GSHOXweDHHYm5yFJpA9/5RVcIJIdCIStxMuYC2DrXkPQmjjrvbMvYlLg4WZocSkmehpFDwf6/7JT+LLtOaRrDb71zBIdV7GvGglSjGnsF5zeb7Cmog8okB6plbvSFZeVon2H+TDoyp9qxY2nODCQYKGXHASekbBbfy+afW2dktCC9/1P0d+Tdrd2A/NtSDkTRRoBlOooZjIsy10aRWJmDFIjbNmSRzEw5nhlUWrGq5w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768119959; c=relaxed/relaxed;
	bh=tokfLp/e6I58cppZJNFjurjxkamTTnFniADDaVWJ9jM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cZLJr5BnQy/EF//sryH6q8PxZ9gEvJkIgmhevh44ApyQCujJDJ7UxScJq4Vr/YS+DCHbtQ1unoHyak6qlHrlihHLcLn79pHCikx0jxTg2UyHokUxrhiQJ3hwevOMfUzrrDOYzzEUGZqB6sXX0YqE0dGO96XydirqLE+FBcbAWR9Oc6fIXVDZYuQtrEeIw7W3JKrP59P5C19CQ/8TkDGWbGQE2wjWgsLIn01O0wgL74GdG+aCM7Dzr2jGSRUvP8BFXeDqzpJArW9HRPsGArmyo6knIHwiys1OVDhyITzKOiyZEOFKstmNY858xnYPcyezXN8Kg/qKFZ35eQtM2uCb/g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Vx9CZF9X; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Vx9CZF9X;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dppVt2xx1z2yTK
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 11 Jan 2026 19:25:58 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4604560121;
	Sun, 11 Jan 2026 08:25:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D130C16AAE;
	Sun, 11 Jan 2026 08:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768119956;
	bh=8ogz7O8vNIuYttKuy/nGG2q6czMHDvEeQHxuChR5AAc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Vx9CZF9X+r6FjCSdphAFLRUwQBjPzpcpTP1svlo74Z1zpu35asFTu76lv4/ExSZCO
	 QinlSs5dw1egxaQ3D6u/Wecjs4+oXzXRvVhgln/TIxyQ/SySTsoAPtUbEkqpHXgydE
	 o0hCrmlWxImpzttux7/U98aTXPChABKFYpihhavzXT97ij//8Nqr0v0/ZJZ0vcsmol
	 OsGtAGYp7WlLshpxExCRChU6we4lXZT0H7/dFupPg9DFhyYxm5kIqI5sjyM2gMQjUp
	 CVn/rfpc+W6EoH4dECwOXVOCVcWhHXWVAjMAdtnIQmuArEGRcdx8gH0LPFezkkSTO1
	 1Ryd+DGSCZgyA==
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
Subject: [PATCH v3 18/29] sh: introduce arch_zone_limits_init()
Date: Sun, 11 Jan 2026 10:20:52 +0200
Message-ID: <20260111082105.290734-19-rppt@kernel.org>
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
 arch/sh/mm/init.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/sh/mm/init.c b/arch/sh/mm/init.c
index 99e302eeeec1..5e7e63642611 100644
--- a/arch/sh/mm/init.c
+++ b/arch/sh/mm/init.c
@@ -264,6 +264,11 @@ static void __init early_reserve_mem(void)
 	reserve_crashkernel();
 }
 
+void __init arch_zone_limits_init(unsigned long *max_zone_pfns)
+{
+	max_zone_pfns[ZONE_NORMAL] = max_low_pfn;
+}
+
 void __init paging_init(void)
 {
 	unsigned long max_zone_pfns[MAX_NR_ZONES];
@@ -322,7 +327,7 @@ void __init paging_init(void)
 	kmap_coherent_init();
 
 	memset(max_zone_pfns, 0, sizeof(max_zone_pfns));
-	max_zone_pfns[ZONE_NORMAL] = max_low_pfn;
+	arch_zone_limits_init(max_zone_pfns);
 	free_area_init(max_zone_pfns);
 }
 
-- 
2.51.0


