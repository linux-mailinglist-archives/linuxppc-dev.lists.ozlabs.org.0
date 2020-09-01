Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9927F258615
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Sep 2020 05:18:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BgXMy62J7zDqYh
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Sep 2020 13:18:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4BgXJs3Y9yzDqVr
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Sep 2020 13:15:57 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A61C630E;
 Mon, 31 Aug 2020 20:15:55 -0700 (PDT)
Received: from [192.168.0.130] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1AFB03F68F;
 Mon, 31 Aug 2020 20:15:50 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH v3 03/13] mm/debug_vm_pgtable/ppc64: Avoid setting top
 bits in radom value
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org
References: <20200827080438.315345-1-aneesh.kumar@linux.ibm.com>
 <20200827080438.315345-4-aneesh.kumar@linux.ibm.com>
Message-ID: <3a0b0101-e6ec-26c5-e104-5b0bb95c3e51@arm.com>
Date: Tue, 1 Sep 2020 08:45:14 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200827080438.315345-4-aneesh.kumar@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 Christophe Leroy <christophe.leroy@c-s.fr>, x86@kernel.org,
 Mike Rapoport <rppt@linux.ibm.com>, Qian Cai <cai@lca.pw>,
 Gerald Schaefer <gerald.schaefer@de.ibm.com>,
 Vineet Gupta <vgupta@synopsys.com>, linux-snps-arc@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 08/27/2020 01:34 PM, Aneesh Kumar K.V wrote:
> ppc64 use bit 62 to indicate a pte entry (_PAGE_PTE). Avoid setting that bit in
> random value.
> 
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  mm/debug_vm_pgtable.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
> index 086309fb9b6f..bbf9df0e64c6 100644
> --- a/mm/debug_vm_pgtable.c
> +++ b/mm/debug_vm_pgtable.c
> @@ -44,10 +44,17 @@
>   * entry type. But these bits might affect the ability to clear entries with
>   * pxx_clear() because of how dynamic page table folding works on s390. So
>   * while loading up the entries do not change the lower 4 bits. It does not
> - * have affect any other platform.
> + * have affect any other platform. Also avoid the 62nd bit on ppc64 that is
> + * used to mark a pte entry.
>   */
> -#define S390_MASK_BITS	4
> -#define RANDOM_ORVALUE	GENMASK(BITS_PER_LONG - 1, S390_MASK_BITS)
> +#define S390_SKIP_MASK		GENMASK(3, 0)
> +#ifdef CONFIG_PPC_BOOK3S_64
> +#define PPC64_SKIP_MASK		GENMASK(62, 62)
> +#else
> +#define PPC64_SKIP_MASK		0x0
> +#endif

Please drop the #ifdef CONFIG_PPC_BOOK3S_64 here. We already accommodate skip
bits for a s390 platform requirement and can also do so for ppc64 as well. As
mentioned before, please avoid adding any platform specific constructs in the
test.

> +#define ARCH_SKIP_MASK (S390_SKIP_MASK | PPC64_SKIP_MASK)
> +#define RANDOM_ORVALUE (GENMASK(BITS_PER_LONG - 1, 0) & ~ARCH_SKIP_MASK)
>  #define RANDOM_NZVALUE	GENMASK(7, 0)

Please fix the alignments here. Feel free to consider following changes after
this patch.

diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
index 122416464e0f..f969031152bb 100644
--- a/mm/debug_vm_pgtable.c
+++ b/mm/debug_vm_pgtable.c
@@ -48,14 +48,11 @@
  * have affect any other platform. Also avoid the 62nd bit on ppc64 that is
  * used to mark a pte entry.
  */
-#define S390_SKIP_MASK         GENMASK(3, 0)
-#ifdef CONFIG_PPC_BOOK3S_64
-#define PPC64_SKIP_MASK                GENMASK(62, 62)
-#else
-#define PPC64_SKIP_MASK                0x0
-#endif
-#define ARCH_SKIP_MASK (S390_SKIP_MASK | PPC64_SKIP_MASK)
-#define RANDOM_ORVALUE (GENMASK(BITS_PER_LONG - 1, 0) & ~ARCH_SKIP_MASK)
+#define S390_SKIP_MASK GENMASK(3, 0)
+#define PPC64_SKIP_MASK        GENMASK(62, 62)
+#define ARCH_SKIP_MASK (S390_SKIP_MASK | PPC64_SKIP_MASK)
+#define RANDOM_ORVALUE (GENMASK(BITS_PER_LONG - 1, 0) & ~ARCH_SKIP_MASK)
+
 #define RANDOM_NZVALUE GENMASK(7, 0)
 
>  
>  static void __init pte_basic_tests(unsigned long pfn, pgprot_t prot)
> 

Besides, there is also one checkpatch.pl warning here.

WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)
#7: 
ppc64 use bit 62 to indicate a pte entry (_PAGE_PTE). Avoid setting that bit in

total: 0 errors, 1 warnings, 20 lines checked
