Return-Path: <linuxppc-dev+bounces-16746-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oNLEDhbyiWnGEgAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16746-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Feb 2026 15:41:26 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA39110B27
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Feb 2026 15:41:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f8nSY4Wt9z30M0;
	Tue, 10 Feb 2026 01:41:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770648077;
	cv=none; b=dvtkZhxNQfHEDGT/9niqJHapusDSCyTHFhzAc8lwTUJ+RNn/r3Oz/39YCzrmqeBiyNYrXcl/en+yBlDxrXXxlPyp/VNP+7BGQ2kUF2KJ5Ttehe7aQxB7C1xbkoEFT7xgLhiGnUPATw7sKQafs9WScvq91X54a0dNCCgJcYhnYEcYJ9sehWAGza86uZdwCbnZZnCTMRyeY+aBGOzp0MjcLNzM1ckTjs4y6NhVsjjp67OPP0c2Sx6L97I1rBRCp35ofCWKn7sSM4zjvFT8mfWH3hSI8TrOiL9n6EPkVJD62AbONY7JRqdW+YYAsi7ZzsfmtE+BB038x0HXG7oYG373UA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770648077; c=relaxed/relaxed;
	bh=KaemXTxQHMv9bpHkXsnfD0HaSN9qgB8hHzbd7NEhoKk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MlJppapAN163Y3JxzFHPSWpfu9c85Vh6Ic77UBPjC7okjuWXSDr/j4Wly36+wN2yKjqjDRHcCtKBjUon7KSeVQ0uU7G+RbAVX4D68vlbTtI1d/3l/scGZzE+ebwA4vVkSHlanHTR9qVQQ/hs7Uu2ymB1yGdDDQqKvb/SHFePA/KrdbnbIxGeeL98N4yhnW5X+39vnGlwgsjWGZ5hT3auDdKc9RaHCiRT3NQQf6TrgbgcJpSHzO9cRzk4tB3XVZpcV7o/zTlRDF0q2eSRByzOAvxr7uAcxaF+u23tspLnJNoajnGcv40vlA9hK4bR24526MjC3xD+W+ueoM48BN950w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lNIMGaab; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lNIMGaab;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f8nSX4y9cz30Lv
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Feb 2026 01:41:16 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 75B9543BD8;
	Mon,  9 Feb 2026 14:41:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 803B4C19422;
	Mon,  9 Feb 2026 14:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770648074;
	bh=B2mkA4JyLV5P+26Kji7kOaADSMAhZAUHx96+BlD9dVA=;
	h=From:To:Cc:Subject:Date:From;
	b=lNIMGaabE0qBHyKmiQQ82ePHeKOk12FZcvy7uIhl99+FK8xY+dvBmwJnHq448tgU5
	 yWCM6YFfxDvwT1wI5+Rt+hhXZLLV4D0u0LeJHpDec1IByx2uLPHCfHaX3Y6XpJ+rsw
	 JJVxqM5D44XNcn4x0x+Kh3J6eZihZBMhmxySUsLGosdfZbLuXcXqIysNK+I7TUQbg9
	 O8HeuEegeOHjXjoPICHlHeBzr1Z+8ulczKwGXjAXkwEVNlDEDH7KqeCc5+hLTfRZaH
	 Codl9ykicppLg+KhR0t3MGY3QhvKdyqCU/tVEiccSKm1jaUu/OhlXAz7EKTzkg5T6F
	 18AZs0Gxi+VGg==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Andreas Larsson <andreas@gaisler.com>,
	Borislav Petkov <bp@alien8.de>,
	Brian Cain <bcain@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Hildenbrand <david@kernel.org>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Guo Ren <guoren@kernel.org>,
	Helge Deller <deller@gmx.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Magnus Lindholm <linmag7@gmail.com>,
	Matt Turner <mattst88@gmail.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Hocko <mhocko@suse.com>,
	Michal Simek <monstr@monstr.eu>,
	Mike Rapoport <rppt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Richard Weinberger <richard@nod.at>,
	Russell King <linux@armlinux.org.uk>,
	Stafford Horne <shorne@gmail.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Vineet Gupta <vgupta@kernel.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	Will Deacon <will@kernel.org>,
	linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-um@lists.infradead.org,
	linux-mm@kvack.org,
	x86@kernel.org
Subject: [PATCH v2 0/4] arch, mm: consolidate empty_zero_page
Date: Mon,  9 Feb 2026 16:40:53 +0200
Message-ID: <20260209144058.2092871-1-rppt@kernel.org>
X-Mailer: git-send-email 2.51.0
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16746-lists,linuxppc-dev=lfdr.de];
	FREEMAIL_CC(0.00)[gaisler.com,alien8.de,kernel.org,arm.com,davemloft.net,linux.intel.com,linux-m68k.org,gmx.de,redhat.com,sipsolutions.net,physik.fu-berlin.de,oracle.com,linux.ibm.com,gmail.com,ellerman.id.au,suse.com,monstr.eu,dabbelt.com,nod.at,armlinux.org.uk,google.com,suse.cz,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.linux-m68k.org,lists.ozlabs.org,kvack.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[rppt@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS(0.00)[m:akpm@linux-foundation.org,m:andreas@gaisler.com,m:bp@alien8.de,m:bcain@kernel.org,m:catalin.marinas@arm.com,m:chleroy@kernel.org,m:davem@davemloft.net,m:dave.hansen@linux.intel.com,m:david@kernel.org,m:dinguyen@kernel.org,m:geert@linux-m68k.org,m:guoren@kernel.org,m:deller@gmx.de,m:chenhuacai@kernel.org,m:mingo@redhat.com,m:johannes@sipsolutions.net,m:glaubitz@physik.fu-berlin.de,m:Liam.Howlett@oracle.com,m:lorenzo.stoakes@oracle.com,m:maddy@linux.ibm.com,m:linmag7@gmail.com,m:mattst88@gmail.com,m:jcmvbkbc@gmail.com,m:mpe@ellerman.id.au,m:mhocko@suse.com,m:monstr@monstr.eu,m:rppt@kernel.org,m:palmer@dabbelt.com,m:richard@nod.at,m:linux@armlinux.org.uk,m:shorne@gmail.com,m:surenb@google.com,m:tglx@kernel.org,m:vgupta@kernel.org,m:vbabka@suse.cz,m:will@kernel.org,m:linux-alpha@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-snps-arc@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-csky@vger.kernel.org,m:linux-hexagon@vger.kernel.org,m
 :loongarch@lists.linux.dev,m:linux-m68k@lists.linux-m68k.org,m:linux-openrisc@vger.kernel.org,m:linux-parisc@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-riscv@lists.infradead.org,m:linux-sh@vger.kernel.org,m:sparclinux@vger.kernel.org,m:linux-um@lists.infradead.org,m:linux-mm@kvack.org,m:x86@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rppt@kernel.org,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_GT_50(0.00)[53];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 4AA39110B27
X-Rspamd-Action: no action

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

Hi,

These patches cleanup handling of ZERO_PAGE() and zero_pfn.

v2 changes:
* add patches that cleanup zero_pfn code a bit (patches 1,2)
* add a patch that caches struct page for empty_zero_page (patch 4)
* use uint8_t instead of unsigned long for empty_zero_page
* fix sparc64 changes in patch 3

v1: https://lore.kernel.org/all/20260124095628.668870-1-rppt@kernel.org

Mike Rapoport (Microsoft) (4):
  mm: don't special case !MMU for is_zero_pfn() and my_zero_pfn()
  mm: rename my_zero_pfn() to zero_pfn()
  arch, mm: consolidate empty_zero_page
  mm: cache struct page for empty_zero_page and return it from ZERO_PAGE()

 arch/alpha/include/asm/pgtable.h          |  6 ---
 arch/arc/include/asm/pgtable.h            |  3 --
 arch/arc/mm/init.c                        |  2 -
 arch/arm/include/asm/pgtable.h            |  9 -----
 arch/arm/mm/mmu.c                         |  7 ----
 arch/arm/mm/nommu.c                       |  7 ----
 arch/arm64/include/asm/pgtable.h          |  7 ----
 arch/arm64/mm/init.c                      |  5 +++
 arch/arm64/mm/mmu.c                       |  7 ----
 arch/csky/include/asm/pgtable.h           |  3 --
 arch/csky/mm/init.c                       |  3 --
 arch/hexagon/include/asm/pgtable.h        |  6 ---
 arch/hexagon/kernel/head.S                |  5 ---
 arch/hexagon/kernel/hexagon_ksyms.c       |  1 -
 arch/loongarch/include/asm/pgtable.h      |  9 -----
 arch/loongarch/mm/init.c                  |  3 --
 arch/m68k/include/asm/pgtable_mm.h        |  9 -----
 arch/m68k/include/asm/pgtable_no.h        |  7 ----
 arch/m68k/mm/init.c                       |  9 -----
 arch/m68k/mm/mcfmmu.c                     |  2 -
 arch/m68k/mm/motorola.c                   |  6 ---
 arch/m68k/mm/sun3mmu.c                    |  2 -
 arch/microblaze/include/asm/pgtable.h     | 10 -----
 arch/microblaze/kernel/head.S             |  4 --
 arch/microblaze/kernel/microblaze_ksyms.c |  2 -
 arch/mips/mm/init.c                       | 11 +-----
 arch/nios2/include/asm/pgtable.h          |  7 ----
 arch/nios2/kernel/head.S                  | 10 -----
 arch/nios2/kernel/nios2_ksyms.c           |  1 -
 arch/openrisc/include/asm/pgtable.h       |  4 --
 arch/openrisc/kernel/head.S               |  3 --
 arch/openrisc/kernel/or32_ksyms.c         |  1 -
 arch/openrisc/mm/init.c                   |  3 --
 arch/parisc/include/asm/pgtable.h         | 11 ------
 arch/parisc/mm/init.c                     |  6 ---
 arch/powerpc/include/asm/pgtable.h        |  6 ---
 arch/powerpc/mm/mem.c                     |  3 --
 arch/riscv/include/asm/pgtable.h          |  7 ----
 arch/riscv/mm/init.c                      |  4 --
 arch/s390/mm/init.c                       |  4 +-
 arch/sh/include/asm/pgtable.h             |  8 ----
 arch/sh/include/asm/setup.h               |  3 +-
 arch/sh/kernel/head_32.S                  |  4 +-
 arch/sh/kernel/sh_ksyms_32.c              |  1 -
 arch/sh/mm/init.c                         |  1 -
 arch/sparc/include/asm/pgtable_32.h       |  8 ----
 arch/sparc/include/asm/pgtable_64.h       |  3 --
 arch/sparc/include/asm/setup.h            |  2 -
 arch/sparc/kernel/head_32.S               |  7 ----
 arch/sparc/mm/init_32.c                   |  4 --
 arch/sparc/mm/init_64.c                   | 24 +++++-------
 arch/um/include/asm/pgtable.h             |  9 -----
 arch/um/include/shared/kern_util.h        |  1 -
 arch/um/kernel/mem.c                      | 16 --------
 arch/um/kernel/um_arch.c                  |  1 -
 arch/x86/include/asm/pgtable.h            |  8 ----
 arch/x86/kernel/head_32.S                 |  4 --
 arch/x86/kernel/head_64.S                 |  7 ----
 arch/x86/kvm/mmu/spte.h                   |  2 +-
 arch/xtensa/include/asm/pgtable.h         |  4 --
 arch/xtensa/kernel/head.S                 |  3 --
 arch/xtensa/kernel/xtensa_ksyms.c         |  2 -
 fs/dax.c                                  |  2 +-
 fs/proc/vmcore.c                          |  2 +-
 include/linux/pgtable.h                   | 48 ++++++++++++++---------
 mm/huge_memory.c                          |  2 +-
 mm/memory.c                               | 15 +------
 mm/migrate.c                              |  2 +-
 mm/mm_init.c                              | 28 +++++++++++++
 mm/userfaultfd.c                          |  4 +-
 70 files changed, 86 insertions(+), 354 deletions(-)


base-commit: 50c7f34c5c7403a12003c6759f6f6ca9a5a10872
--
2.51.0

