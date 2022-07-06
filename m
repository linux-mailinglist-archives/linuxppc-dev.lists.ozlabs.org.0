Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B608567E18
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Jul 2022 07:59:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ld84d1fTxz3c7H
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Jul 2022 15:59:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ld84563RSz3blS
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Jul 2022 15:58:42 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EBF5A1570;
	Tue,  5 Jul 2022 22:58:09 -0700 (PDT)
Received: from [10.163.43.16] (unknown [10.163.43.16])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3C01D3F70D;
	Tue,  5 Jul 2022 22:58:01 -0700 (PDT)
Message-ID: <8a6ccbae-7d7c-6e08-cc28-eeb649f86112@arm.com>
Date: Wed, 6 Jul 2022 11:27:59 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH V6 00/26] mm/mmap: Drop __SXXX/__PXXX macros from across
 platforms
Content-Language: en-US
To: linux-mm@kvack.org, akpm@linux-foundation.org
References: <20220630051630.1718927-1-anshuman.khandual@arm.com>
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20220630051630.1718927-1-anshuman.khandual@arm.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-xtensa@linux-xtensa.org, linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, linux-hexagon@vger.kernel.org, x86@kernel.org, linux-um@lists.infradead.org, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, hch@infradead.org, linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org, linux-csky@vger.kernel.org, linux-alpha@vger.kernel.org, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, linux-snps-arc@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 6/30/22 10:46, Anshuman Khandual wrote:
> __SXXX/__PXXX macros is an unnecessary abstraction layer in creating the
> generic protection_map[] array which is used for vm_get_page_prot(). This
> abstraction layer can be avoided, if the platforms just define the array
> protection_map[] for all possible vm_flags access permission combinations
> and also export vm_get_page_prot() implementation.
> 
> This series drops __SXXX/__PXXX macros from across platforms in the tree.
> First it build protects generic protection_map[] array with '#ifdef __P000'
> and moves it inside platforms which enable ARCH_HAS_VM_GET_PAGE_PROT. Later
> this build protects same array with '#ifdef ARCH_HAS_VM_GET_PAGE_PROT' and
> moves inside remaining platforms while enabling ARCH_HAS_VM_GET_PAGE_PROT.
> This adds a new macro DECLARE_VM_GET_PAGE_PROT defining the current generic
> vm_get_page_prot(), in order for it to be reused on platforms that do not
> require custom implementation. Finally, ARCH_HAS_VM_GET_PAGE_PROT can just
> be dropped, as all platforms now define and export vm_get_page_prot(), via
> looking up a private and static protection_map[] array. protection_map[]
> data type has been changed as 'static const' on all platforms that do not
> change it during boot.
> 
> This series applies on v5.19-rc4 and has been build tested for multiple
> platforms. While here it has dropped off all previous tags from folks after
> the current restructuring. Series common CC list has been expanded to cover
> all impacted platforms for wider reach.
> 
> - Anshuman
> 
> Changes in V6:
> 
> - Converted protection_map[] array as 'static const' on sparc32 platform
> - Rebased on v5.19-rc4
> - Collected tags

There are two linux-next based build fixes for this series (listed below), when
vm_get_page_prot() gets redefined with !CONFIG_MMU. Platform vm_get_page_prot()
is required only with CONFIG_MMU enabled, otherwise there is a generic fallback
stub in include/linux/mm.h

https://lore.kernel.org/all/20220705221411.3381797-1-jcmvbkbc@gmail.com/	[xtensa]
https://lore.kernel.org/all/20220706054002.1936820-1-anshuman.khandual@arm.com/ [sh]

It does not seem CONFIG_MMU can be disabled on other platforms thus exposing a build
failure. But just to be on the safer side, should all vm_get_page_prot() be wrapped
around with #ifdef CONFIG_MMU ? In that case will resend the series with above build
fixes folded back in as well. Please do suggest. Thank you.

- Anshuman
