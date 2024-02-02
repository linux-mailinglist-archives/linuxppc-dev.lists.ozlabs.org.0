Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7402D846A2B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Feb 2024 09:09:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TR7jF3DKLz3dVj
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Feb 2024 19:09:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TR7hN421dz3c5T
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Feb 2024 19:08:51 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 85221FEC;
	Fri,  2 Feb 2024 00:09:02 -0800 (PST)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.26])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 99B143F5A1;
	Fri,  2 Feb 2024 00:08:16 -0800 (PST)
From: Ryan Roberts <ryan.roberts@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	James Morse <james.morse@arm.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>,
	David Hildenbrand <david@redhat.com>,
	Kefeng Wang <wangkefeng.wang@huawei.com>,
	John Hubbard <jhubbard@nvidia.com>,
	Zi Yan <ziy@nvidia.com>,
	Barry Song <21cnbao@gmail.com>,
	Alistair Popple <apopple@nvidia.com>,
	Yang Shi <shy828301@gmail.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH v5 01/25] mm: Clarify the spec for set_ptes()
Date: Fri,  2 Feb 2024 08:07:32 +0000
Message-Id: <20240202080756.1453939-2-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240202080756.1453939-1-ryan.roberts@arm.com>
References: <20240202080756.1453939-1-ryan.roberts@arm.com>
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
Cc: Ryan Roberts <ryan.roberts@arm.com>, x86@kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

set_ptes() spec implies that it can only be used to set a present pte
because it interprets the PFN field to increment it. However,
set_pte_at() has been implemented on top of set_ptes() since set_ptes()
was introduced, and set_pte_at() allows setting a pte to a not-present
state. So clarify the spec to state that when nr==1, new state of pte
may be present or not present. When nr>1, new state of all ptes must be
present.

While we are at it, tighten the spec to set requirements around the
initial state of ptes; when nr==1 it may be either present or
not-present. But when nr>1 all ptes must initially be not-present. All
set_ptes() callsites already conform to this requirement. Stating it
explicitly is useful because it allows for a simplification to the
upcoming arm64 contpte implementation.

Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---
 include/linux/pgtable.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index f0feae7f89fb..5e7eaf8f2b97 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -229,6 +229,10 @@ static inline pte_t pte_next_pfn(pte_t pte)
  * @pte: Page table entry for the first page.
  * @nr: Number of pages to map.
  *
+ * When nr==1, initial state of pte may be present or not present, and new state
+ * may be present or not present. When nr>1, initial state of all ptes must be
+ * not present, and new state must be present.
+ *
  * May be overridden by the architecture, or the architecture can define
  * set_pte() and PFN_PTE_SHIFT.
  *
-- 
2.25.1

