Return-Path: <linuxppc-dev+bounces-15518-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1C5D0E4E9
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Jan 2026 09:28:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dppYD3qnsz3bV5;
	Sun, 11 Jan 2026 19:28:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768120080;
	cv=none; b=lUIv7XFasN65uKk/hDstA8L9uX1Nt15UZOPzIGThxTvOijfGnY+dH2Ws2MyUENkFTjifElftIBzOdkfwI0VbDUyzfUBPti0fC6QtrJhMoCmYtFEdRtaH1ZVf2V3FjT9Cxcz9Ds9+3nSrQPOqrcjxQBunHNssNsXRzEsICL7d7oICtfW/MsBhoAZ6mMwWXYZ4HDgC5XC/byo9P9U3GqbTxfgq8KTsLhUJsKKNSLBDSNZjuD32retrUe73OV+ychIyZnPYHdrBBgomuojxBBw8BT/ycZ8Y2laNR+naKwh03q+DKRPpQZLDH6hhaPp9NcprZCMy7gvrazU0sNjOu4UjLA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768120080; c=relaxed/relaxed;
	bh=NMuEVnl163nXTa+O/OHvtDDMLzmwllm0L4yo7sEJ3YQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GLfiB+gS5uJmMwjlZ1Kj+ohOaGyBNU3UWGh4R899zHsmawPlblaRZGTNtY7f5atFgzLcKmyRZe5NH8sEBWX1xnospZN+vAFCFtyom++7HoRjqgTOai/VA1BNWFZmIPJwLgaQiE+XsJDKSi/Aqt8DsKLYKH+38SkhAXWLQd8L91CtXnNn4a38wa0hS+ornywvpnHY2cgsAdkTPs+jtLHti7I/b86+hQvawYvH6UQPe4sJ+C42VaAJC3p7SaLEc2obTTkpvuQxmTU9TLcqxQHPQCUPVPrjmXSdRcKz3vnrYUwFQzlExDzRKUv8ab9JlaoN7T4fu9lLLvVdBOPdVz2Usw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IGnsApOe; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IGnsApOe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dppYC2Yxnz2yvG
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 11 Jan 2026 19:27:59 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8073A60127;
	Sun, 11 Jan 2026 08:27:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93D8CC4CEF7;
	Sun, 11 Jan 2026 08:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768120077;
	bh=q+M5A50bBS7JfetqFByPT+KJrphXgISZqTpM92eTenA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IGnsApOe52UMwQH9rU0QdFDUAygZdjQbcEkT+VcFh+f2uIPc0Movv0hadDZtysGLu
	 JMYTBeuroBlSJGszS2K8JW23cEU1tXtb89wIKkYD2uNZvvSMDgnuNSbEAJkkMWfugW
	 cwtKO3+xV3d/K2hNCc4wGnvGVjpj4mSjlL71LyU4btVNuDx9MwMhZ5QsDvVpKtmQNN
	 2EAcaKe/SBeeqJy3AZisKps+dHlJ9rGGk1wbkEMkkumkaTeOfnRjlxc0fyDYFkNWJz
	 /+oWBnCcEaIsUnQb4PUJdVub3TiaSeyalOMYoRZBztcTqMfYM7Z+CzPCQ4YeR/ZN6x
	 o9YVaMIgO5ztg==
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
Subject: [PATCH v3 26/29] x86: don't reserve hugetlb memory in setup_arch()
Date: Sun, 11 Jan 2026 10:21:00 +0200
Message-ID: <20260111082105.290734-27-rppt@kernel.org>
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

Commit 665eaf313314 ("x86/setup: call hugetlb_bootmem_alloc early")
added an early call to hugetlb_bootmem_alloc() to setup_arch() to allow
HVO style pre-initialization of vmemmap on x86.

With the ordering of hugetlb reservation vs memory map initialization
sorted out in core MM this no longer needs to be an architecture specific
quirk.

Drop the call to hugetlb_bootmem_alloc() from x86::setup_arch().

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/x86/kernel/setup.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
index 1b2edd07a3e1..e2318fa9b1bb 100644
--- a/arch/x86/kernel/setup.c
+++ b/arch/x86/kernel/setup.c
@@ -1191,7 +1191,6 @@ void __init setup_arch(char **cmdline_p)
 
 	if (boot_cpu_has(X86_FEATURE_GBPAGES)) {
 		hugetlb_cma_reserve(PUD_SHIFT - PAGE_SHIFT);
-		hugetlb_bootmem_alloc();
 	}
 
 	/*
-- 
2.51.0


