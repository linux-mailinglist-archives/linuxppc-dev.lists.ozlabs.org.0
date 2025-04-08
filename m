Return-Path: <linuxppc-dev+bounces-7535-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BB98A7FA6D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Apr 2025 11:55:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZX1dP4ljnz303B;
	Tue,  8 Apr 2025 19:54:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744106073;
	cv=none; b=A7FJsSIvC6FlrW4d0qx6E/UJq5My/MwFyGN6rLmK5HUWYfCzLTzQBQDXK2eqc2bdPdQGuRjvfpwevPw/tAwMN4Z5Z35uQFzFOugrDOraM4VC+blDOFrDtxGNAYPw5dvzRL5xGW/PYknO0dbwSW5GIIunEGbrQFr27rcl1jLF2Of/Yn0ctQGPTIgbZgqwTYpDSerz9zpACdva6WZF29sv2GaAVE2cHq7+kJ3584zyLHTMK6EGHgwFHsGoBepad6HIB1przc95gNjAiqY3I4iDkeVCiwdRY6wNVas3D+jxcrvQpihx5p97Z8YBdXAyz8NZA0MQlPLnF7hxPhMuqY9iEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744106073; c=relaxed/relaxed;
	bh=zCqJ5i1RxEJN7X5dUM1nM7yZwBGmu6xdERTmZRAkVic=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IHEl4jn3GZWwrZ/1QZR+6MfzyvOJuE0jtQzSvu9GJaqIVXQGVTjKGwnmd8kfWk55RvMlm9fOTEeOsvdlreBcT7azkaVmF1032s5T5SXVFjWvNBqmH/ziZSDG476caNegjUOAT4KqIYXXXu6KPB7FWi3P1Zs29/Lf6P5gh6Oi0+mXQyBiVLiDkZ6Lp45/JHlLcfe4uAbB9YJ5Vw5urVuAoE6lDoE96Zm0260xC4hvI66kOL8A+nUKKU9JkjS1kaO2WRVlCxKSJLdnuD3WI2dEPNwvHmzxL/Rfv1gr9FEte2tG0GA/f6KpvWPWZONX1xmVX9K4Can9Hpk5p2kBPemCnA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZX1dP0MnBz300B
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Apr 2025 19:54:33 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 15DC122FA;
	Tue,  8 Apr 2025 02:54:03 -0700 (PDT)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CA25B3F6A8;
	Tue,  8 Apr 2025 02:53:57 -0700 (PDT)
From: Kevin Brodsky <kevin.brodsky@arm.com>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andreas Larsson <andreas@gaisler.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"David S. Miller" <davem@davemloft.net>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Matthew Wilcox <willy@infradead.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	"Mike Rapoport (IBM)" <rppt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Qi Zheng <zhengqi.arch@bytedance.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Will Deacon <will@kernel.org>,
	Yang Shi <yang@os.amperecomputing.com>,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	linux-openrisc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org
Subject: [PATCH v2 11/12] arm64: mm: Call PUD/P4D ctor in __create_pgd_mapping()
Date: Tue,  8 Apr 2025 10:52:21 +0100
Message-ID: <20250408095222.860601-12-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250408095222.860601-1-kevin.brodsky@arm.com>
References: <20250408095222.860601-1-kevin.brodsky@arm.com>
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
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Constructors for PUD/P4D-level pgtables were recently introduced.
They should be called for all pgtables; make sure they are called
for special kernel mappings created by __create_pgd_mapping() too.

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 arch/arm64/mm/mmu.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 51cfc891f6a1..8fcf59ba39db 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -497,7 +497,11 @@ static phys_addr_t __pgd_pgtable_alloc(struct mm_struct *mm,
 	case TABLE_PMD:
 		BUG_ON(!pagetable_pmd_ctor(mm, ptdesc));
 		break;
-	default:
+	case TABLE_PUD:
+		pagetable_pud_ctor(ptdesc);
+		break;
+	case TABLE_P4D:
+		pagetable_p4d_ctor(ptdesc);
 		break;
 	}
 
-- 
2.47.0


