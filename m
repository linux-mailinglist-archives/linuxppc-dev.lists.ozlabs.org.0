Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C52162426AB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Aug 2020 10:23:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BRN4Q5PcmzDqb9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Aug 2020 18:23:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4BRMsS6CJmzDqZF
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Aug 2020 18:13:31 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 71A6ED6E;
 Wed, 12 Aug 2020 01:13:30 -0700 (PDT)
Received: from [10.163.66.87] (unknown [10.163.66.87])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B924C3F22E;
 Wed, 12 Aug 2020 01:13:28 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH 02/16] debug_vm_pgtable/ppc64: Avoid setting top bits in
 radom value
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org
References: <20200812063358.369514-1-aneesh.kumar@linux.ibm.com>
 <20200812063358.369514-2-aneesh.kumar@linux.ibm.com>
Message-ID: <fcb44f1d-4131-9135-512e-11a5c00abcd9@arm.com>
Date: Wed, 12 Aug 2020 13:42:59 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200812063358.369514-2-aneesh.kumar@linux.ibm.com>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 08/12/2020 12:03 PM, Aneesh Kumar K.V wrote:
> ppc64 use bit 62 to indicate a pte entry (_PAGE_PTE). Avoid setting that bit in
> random value.
> 
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  mm/debug_vm_pgtable.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
> index 086309fb9b6f..4c32063a8acf 100644
> --- a/mm/debug_vm_pgtable.c
> +++ b/mm/debug_vm_pgtable.c
> @@ -45,9 +45,12 @@
>   * pxx_clear() because of how dynamic page table folding works on s390. So
>   * while loading up the entries do not change the lower 4 bits. It does not
>   * have affect any other platform.
> + *
> + * Also avoid the 62nd bit on ppc64 that is used to mark a pte entry.
>   */

Please move and fold the above line with the existing paragraph.

>  #define S390_MASK_BITS	4
> -#define RANDOM_ORVALUE	GENMASK(BITS_PER_LONG - 1, S390_MASK_BITS)
> +#define PPC_MASK_BITS	2

s/PPC/PPC64/

> +#define RANDOM_ORVALUE	GENMASK(BITS_PER_LONG - 1 - PPC_MASK_BITS, S390_MASK_BITS)
>  #define RANDOM_NZVALUE	GENMASK(7, 0)
>  
>  static void __init pte_basic_tests(unsigned long pfn, pgprot_t prot)
> 

With this change, RANDOM_ORVALUE will be (0x3ffffffffffffff0) which discards
both bit 63 and 62. If only bit 62 is to be avoided for ppc64 the mask should
be (0xbffffffffffffff0) instead. The following change on this patch should do
the trick.

diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
index eb059fef89c2..1499181fb0e9 100644
--- a/mm/debug_vm_pgtable.c
+++ b/mm/debug_vm_pgtable.c
@@ -45,13 +45,13 @@
  * entry type. But these bits might affect the ability to clear entries with
  * pxx_clear() because of how dynamic page table folding works on s390. So
  * while loading up the entries do not change the lower 4 bits. It does not
- * have affect any other platform.
- *
- * Also avoid the 62nd bit on ppc64 that is used to mark a pte entry.
+ * have affect any other platform. Also avoid the 62nd bit on ppc64 that is
+ * used to mark a pte entry.
  */
-#define S390_MASK_BITS 4
-#define PPC_MASK_BITS  2
-#define RANDOM_ORVALUE GENMASK(BITS_PER_LONG - 1 - PPC_MASK_BITS, S390_MASK_BITS)
+#define S390_SKIP_MASK GENMASK(3, 0)
+#define PPC64_SKIP_MASK        GENMASK(62, 62)
+#define ARCH_SKIP_MASK (S390_SKIP_MASK | PPC64_SKIP_MASK)
+#define RANDOM_ORVALUE (GENMASK(BITS_PER_LONG - 1, 0) & ~ARCH_SKIP_MASK)
 #define RANDOM_NZVALUE GENMASK(7, 0)
 
 static void __init pte_basic_tests(unsigned long pfn, pgprot_t prot)
