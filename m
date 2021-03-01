Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5F232785E
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Mar 2021 08:43:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dpsh50h7Kz3clG
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Mar 2021 18:43:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4Dpsgm5KzFz30LD
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Mar 2021 18:43:14 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9EFE71FB;
 Sun, 28 Feb 2021 23:43:10 -0800 (PST)
Received: from [10.163.67.14] (unknown [10.163.67.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0BD253F70D;
 Sun, 28 Feb 2021 23:43:07 -0800 (PST)
Subject: Re: [PATCH] mm: Generalize HUGETLB_PAGE_SIZE_VARIABLE
To: Christoph Hellwig <hch@lst.de>
References: <1614577853-7452-1-git-send-email-anshuman.khandual@arm.com>
 <20210301062358.GA25761@lst.de>
From: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <89f2d77c-f4bc-8f7b-a6b0-1c04e422fb77@arm.com>
Date: Mon, 1 Mar 2021 13:13:41 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210301062358.GA25761@lst.de>
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
Cc: linux-ia64@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 3/1/21 11:53 AM, Christoph Hellwig wrote:
> On Mon, Mar 01, 2021 at 11:20:53AM +0530, Anshuman Khandual wrote:
>> HUGETLB_PAGE_SIZE_VARIABLE need not be defined for each individual
>> platform subscribing it. Instead just make it generic.
>>
>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
>> Cc: Paul Mackerras <paulus@samba.org>
>> Cc: Andrew Morton <akpm@linux-foundation.org>
>> Cc: Christoph Hellwig <hch@lst.de>
>> Cc: linux-ia64@vger.kernel.org
>> Cc: linuxppc-dev@lists.ozlabs.org
>> Cc: linux-mm@kvack.org
>> Cc: linux-kernel@vger.kernel.org
>> Suggested-by: Christoph Hellwig <hch@lst.de>
>> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
>> ---
>> This change was originally suggested in an earilier discussion. This
>> applies on v5.12-rc1 and has been build tested on all applicable
>> platforms i.e ia64 and powerpc.
>>
>> https://patchwork.kernel.org/project/linux-mm/patch/1613024531-19040-3-git-send-email-anshuman.khandual@arm.com/
>>
>>  arch/ia64/Kconfig    | 6 +-----
>>  arch/powerpc/Kconfig | 6 +-----
>>  mm/Kconfig           | 8 ++++++++
>>  3 files changed, 10 insertions(+), 10 deletions(-)
>>
>> diff --git a/arch/ia64/Kconfig b/arch/ia64/Kconfig
>> index 2ad7a8d29fcc..6b3e3f6c29ae 100644
>> --- a/arch/ia64/Kconfig
>> +++ b/arch/ia64/Kconfig
>> @@ -32,6 +32,7 @@ config IA64
>>  	select TTY
>>  	select HAVE_ARCH_TRACEHOOK
>>  	select HAVE_VIRT_CPU_ACCOUNTING
>> +	select HUGETLB_PAGE_SIZE_VARIABLE
> 
> doesn't this need a 'if HUGETLB_PAGE'

While making HUGETLB_PAGE_SIZE_VARIABLE a generic option, also made it
dependent on HUGETLB_PAGE. Should not that gate HUGETLB_PAGE_SIZE_VARIABLE
when HUGETLB_PAGE is not available irrespective of the select statement on
the platforms ?

> 
> or did you verify that HUGETLB_PAGE_SIZE_VARIABLE checks are always
> nested inside of HUGETLB_PAGE ones?
>
