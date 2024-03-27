Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D732588E9AE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Mar 2024 16:47:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V4WJC4tZhz3vly
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Mar 2024 02:47:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V4WHq1cGpz2xLW
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Mar 2024 02:46:45 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ACC782F4;
	Wed, 27 Mar 2024 08:46:46 -0700 (PDT)
Received: from [10.57.72.121] (unknown [10.57.72.121])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 25BC83F64C;
	Wed, 27 Mar 2024 08:46:09 -0700 (PDT)
Message-ID: <8727a618-30c4-4a13-b0e9-eccc3fd67c73@arm.com>
Date: Wed, 27 Mar 2024 15:46:07 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 0/3] mm/gup: consistently call it GUP-fast
Content-Language: en-GB
To: David Hildenbrand <david@redhat.com>, Peter Xu <peterx@redhat.com>
References: <20240327130538.680256-1-david@redhat.com> <ZgQ5hNltQ2DHQXps@x1n>
 <3922460a-4d01-4ecb-b8c5-7c57fd46f3fd@redhat.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <3922460a-4d01-4ecb-b8c5-7c57fd46f3fd@redhat.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-s390@vger.kernel.org, loongarch@lists.linux.dev, Arnd Bergmann <arnd@arndb.de>, linux-sh@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>, x86@kernel.org, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-mm@kvack.org, Mike Rapoport <rppt@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>, linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> 
> Some of them look like mm-unstable issue, For example, arm64 fails with
> 
>   CC      arch/arm64/mm/extable.o
> In file included from ./include/linux/hugetlb.h:828,
>                  from security/commoncap.c:19:
> ./arch/arm64/include/asm/hugetlb.h:25:34: error: redefinition of
> 'arch_clear_hugetlb_flags'
>    25 | #define arch_clear_hugetlb_flags arch_clear_hugetlb_flags
>       |                                  ^~~~~~~~~~~~~~~~~~~~~~~~
> ./include/linux/hugetlb.h:840:20: note: in expansion of macro
> 'arch_clear_hugetlb_flags'
>   840 | static inline void arch_clear_hugetlb_flags(struct folio *folio) { }
>       |                    ^~~~~~~~~~~~~~~~~~~~~~~~
> ./arch/arm64/include/asm/hugetlb.h:21:20: note: previous definition of
> 'arch_clear_hugetlb_flags' with t
> ype 'void(struct folio *)'
>    21 | static inline void arch_clear_hugetlb_flags(struct folio *folio)
>       |                    ^~~~~~~~~~~~~~~~~~~~~~~~
> In file included from ./include/linux/hugetlb.h:828,
>                  from mm/filemap.c:37:
> ./arch/arm64/include/asm/hugetlb.h:25:34: error: redefinition of
> 'arch_clear_hugetlb_flags'
>    25 | #define arch_clear_hugetlb_flags arch_clear_hugetlb_flags
>       |                                  ^~~~~~~~~~~~~~~~~~~~~~~~
> ./include/linux/hugetlb.h:840:20: note: in expansion of macro
> 'arch_clear_hugetlb_flags'
>   840 | static inline void arch_clear_hugetlb_flags(struct folio *folio) { }
>       |                    ^~~~~~~~~~~~~~~~~~~~~~~~
> ./arch/arm64/include/asm/hugetlb.h:21:20: note: previous definition of
> 'arch_clear_hugetlb_flags' with type 'void(struct folio *)'
>    21 | static inline void arch_clear_hugetlb_flags(struct folio *folio)

see: https://lore.kernel.org/linux-mm/ZgQvNKGdlDkwhQEX@casper.infradead.org/

