Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D16206A74
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jun 2020 05:15:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49s7ZJ2B8gzDqbx
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jun 2020 13:15:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 49s7Wy4DYlzDqLK
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jun 2020 13:13:32 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5D1A01FB;
 Tue, 23 Jun 2020 20:13:29 -0700 (PDT)
Received: from [10.163.82.47] (unknown [10.163.82.47])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C237B3F71E;
 Tue, 23 Jun 2020 20:13:19 -0700 (PDT)
Subject: Re: [PATCH V3 0/4] mm/debug_vm_pgtable: Add some more tests
To: linux-mm@kvack.org
References: <1592192277-8421-1-git-send-email-anshuman.khandual@arm.com>
From: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <70ddc7dd-b688-b73e-642a-6363178c8cdd@arm.com>
Date: Wed, 24 Jun 2020 08:43:10 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1592192277-8421-1-git-send-email-anshuman.khandual@arm.com>
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
Cc: linux-doc@vger.kernel.org, Heiko Carstens <heiko.carstens@de.ibm.com>,
 Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, x86@kernel.org,
 Mike Rapoport <rppt@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 linux-arm-kernel@lists.infradead.org, ziy@nvidia.com,
 Catalin Marinas <catalin.marinas@arm.com>, linux-snps-arc@lists.infradead.org,
 Vasily Gorbik <gor@linux.ibm.com>, Borislav Petkov <bp@alien8.de>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A . Shutemov" <kirill@shutemov.name>,
 Thomas Gleixner <tglx@linutronix.de>, gerald.schaefer@de.ibm.com,
 christophe.leroy@c-s.fr, Vineet Gupta <vgupta@synopsys.com>,
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 06/15/2020 09:07 AM, Anshuman Khandual wrote:
> This series adds some more arch page table helper validation tests which
> are related to core and advanced memory functions. This also creates a
> documentation, enlisting expected semantics for all page table helpers as
> suggested by Mike Rapoport previously (https://lkml.org/lkml/2020/1/30/40).
> 
> There are many TRANSPARENT_HUGEPAGE and ARCH_HAS_TRANSPARENT_HUGEPAGE_PUD
> ifdefs scattered across the test. But consolidating all the fallback stubs
> is not very straight forward because ARCH_HAS_TRANSPARENT_HUGEPAGE_PUD is
> not explicitly dependent on ARCH_HAS_TRANSPARENT_HUGEPAGE.
> 
> Tested on arm64, x86 platforms but only build tested on all other enabled
> platforms through ARCH_HAS_DEBUG_VM_PGTABLE i.e powerpc, arc, s390. The
> following failure on arm64 still exists which was mentioned previously. It
> will be fixed with the upcoming THP migration on arm64 enablement series.
> 
> WARNING .... mm/debug_vm_pgtable.c:860 debug_vm_pgtable+0x940/0xa54
> WARN_ON(!pmd_present(pmd_mkinvalid(pmd_mkhuge(pmd))))
> 
> This series is based on v5.8-rc1.
> 
> Changes in V3:
> 
> - Replaced HAVE_ARCH_SOFT_DIRTY with MEM_SOFT_DIRTY
> - Added HAVE_ARCH_HUGE_VMAP checks in pxx_huge_tests() per Gerald
> - Updated documentation for pmd_thp_tests() per Zi Yan
> - Replaced READ_ONCE() with huge_ptep_get() per Gerald
> - Added pte_mkhuge() and masking with PMD_MASK per Gerald
> - Replaced pte_same() with holding pfn check in pxx_swap_tests()
> - Added documentation for all (#ifdef #else #endif) per Gerald
> - Updated pmd_protnone_tests() per Gerald
> - Updated HugeTLB PTE creation in hugetlb_advanced_tests() per Gerald
> - Replaced [pmd|pud]_mknotpresent() with [pmd|pud]_mkinvalid()
> - Added has_transparent_hugepage() check for PMD and PUD tests
> - Added a patch which debug prints all individual tests being executed
> - Updated documentation for renamed [pmd|pud]_mkinvalid() helpers

Hello Gerald/Christophe/Vineet,

It would be really great if you could give this series a quick test
on s390/ppc/arc platforms respectively. Thank you.

- Anshuman
