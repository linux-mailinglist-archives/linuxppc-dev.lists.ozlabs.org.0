Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 683544C7EFE
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Mar 2022 01:01:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K6y8G4MJyz3bqv
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Mar 2022 11:01:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4K6y7q50fSz30NV
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Mar 2022 11:00:52 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7F9BAD6E;
 Mon, 28 Feb 2022 16:00:50 -0800 (PST)
Received: from [10.163.50.231] (unknown [10.163.50.231])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D52833F66F;
 Mon, 28 Feb 2022 16:00:43 -0800 (PST)
Subject: Re: [PATCH V3 09/30] arm/mm: Enable ARCH_HAS_VM_GET_PAGE_PROT
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
References: <1646045273-9343-1-git-send-email-anshuman.khandual@arm.com>
 <1646045273-9343-10-git-send-email-anshuman.khandual@arm.com>
 <Yhyqjo/4bozJB6j5@shell.armlinux.org.uk>
From: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <542fa048-131e-240b-cc3a-fd4fff7ce4ba@arm.com>
Date: Tue, 1 Mar 2022 05:30:41 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <Yhyqjo/4bozJB6j5@shell.armlinux.org.uk>
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mm@kvack.org, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-csky@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
 geert@linux-m68k.org, linux-snps-arc@lists.infradead.org,
 linux-xtensa@linux-xtensa.org, Arnd Bergmann <arnd@arndb.de>,
 linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org, linux-arm-kernel@lists.infradead.org,
 linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-alpha@vger.kernel.org, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 2/28/22 4:27 PM, Russell King (Oracle) wrote:
> On Mon, Feb 28, 2022 at 04:17:32PM +0530, Anshuman Khandual wrote:
>> This defines and exports a platform specific custom vm_get_page_prot() via
>> subscribing ARCH_HAS_VM_GET_PAGE_PROT. Subsequently all __SXXX and __PXXX
>> macros can be dropped which are no longer needed.
> 
> What I would really like to know is why having to run _code_ to work out
> what the page protections need to be is better than looking it up in a
> table.
> 
> Not only is this more expensive in terms of CPU cycles, it also brings
> additional code size with it.
> 
> I'm struggling to see what the benefit is.
> 

Currently vm_get_page_prot() is also being _run_ to fetch required page
protection values. Although that is being run in the core MM and from a
platform perspective __SXXX, __PXXX are just being exported for a table.
Looking it up in a table (and applying more constructs there after) is
not much different than a clean switch case statement in terms of CPU
usage. So this is not more expensive in terms of CPU cycles.

--------------------------
pgprot_t protection_map[16] __ro_after_init = {
        __P000, __P001, __P010, __P011, __P100, __P101, __P110, __P111,
        __S000, __S001, __S010, __S011, __S100, __S101, __S110, __S111
};

#ifndef CONFIG_ARCH_HAS_FILTER_PGPROT
static inline pgprot_t arch_filter_pgprot(pgprot_t prot)
{
        return prot;
}
#endif

pgprot_t vm_get_page_prot(unsigned long vm_flags)
{
        pgprot_t ret = __pgprot(pgprot_val(protection_map[vm_flags &
                                (VM_READ|VM_WRITE|VM_EXEC|VM_SHARED)]) |
                        pgprot_val(arch_vm_get_page_prot(vm_flags)));

        return arch_filter_pgprot(ret);
}
EXPORT_SYMBOL(vm_get_page_prot)
----------------------------

There will be a single vm_get_page_prot() instance on a given platform
just like before. So this also does not bring any additional code size
with it.

As mentioned earlier on a previous version.

Remove multiple 'core MM <--> platform' abstraction layers to map
vm_flags access permission combination into page protection.

From the cover letter ......

----------
Currently there are multiple layers of abstraction i.e __SXXX/__PXXX macros
, protection_map[], arch_vm_get_page_prot() and arch_filter_pgprot() built
between the platform and generic MM, finally defining vm_get_page_prot().

Hence this series proposes to drop all these abstraction levels and instead
just move the responsibility of defining vm_get_page_prot() to the platform
itself making it clean and simple.
----------

Benefits

1. For platforms using arch_vm_get_page_prot() and/or arch_filter_pgprot()

	- A simplified vm_get_page_prot()
	- Dropped arch_vm_get_page_prot() and arch_filter_pgprot()
	- Dropped __SXXX, __PXXX macros

2. For platforms which just exported __SXXX, __PXXX

	- A simplified vm_get_page_prot()
	- Dropped __SXXX, __PXXX macros

3. For core MM

	- Dropped a complex vm_get_page_prot() with multiple layers
 	  of abstraction i.e __SXXX/__PXXX macros, protection_map[],
	  arch_vm_get_page_prot(), arch_filter_pgprot() etc.

- Anshuman
