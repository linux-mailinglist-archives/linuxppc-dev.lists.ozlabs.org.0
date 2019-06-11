Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 19A3C3C3DE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2019 08:19:07 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45NKZw30bHzDqVm
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2019 16:19:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 45NKY32R83zDqTm
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2019 16:17:25 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 04483344;
 Mon, 10 Jun 2019 23:17:22 -0700 (PDT)
Received: from [10.162.43.135] (p8cg001049571a15.blr.arm.com [10.162.43.135])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id
 847F13F73C; Mon, 10 Jun 2019 23:17:20 -0700 (PDT)
Subject: Re: [PATCH 4/4] mm/vmalloc: Hugepage vmalloc mappings
To: Nicholas Piggin <npiggin@gmail.com>, Mark Rutland <mark.rutland@arm.com>
References: <20190610043838.27916-1-npiggin@gmail.com>
 <20190610043838.27916-4-npiggin@gmail.com>
 <20190610141036.GA16989@lakrids.cambridge.arm.com>
 <1560177786.t6c5cn5hw4.astroid@bobo.none>
From: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <a1747247-f4f6-ea9a-149c-07c7eb9193d8@arm.com>
Date: Tue, 11 Jun 2019 11:47:39 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1560177786.t6c5cn5hw4.astroid@bobo.none>
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
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 06/10/2019 08:14 PM, Nicholas Piggin wrote:
> Mark Rutland's on June 11, 2019 12:10 am:
>> Hi,
>>
>> On Mon, Jun 10, 2019 at 02:38:38PM +1000, Nicholas Piggin wrote:
>>> For platforms that define HAVE_ARCH_HUGE_VMAP, have vmap allow vmalloc to
>>> allocate huge pages and map them
>>>
>>> This brings dTLB misses for linux kernel tree `git diff` from 45,000 to
>>> 8,000 on a Kaby Lake KVM guest with 8MB dentry hash and mitigations=off
>>> (performance is in the noise, under 1% difference, page tables are likely
>>> to be well cached for this workload). Similar numbers are seen on POWER9.
>>
>> Do you happen to know which vmalloc mappings these get used for in the
>> above case? Where do we see vmalloc mappings that large?
> 
> Large module vmalloc could be subject to huge mappings.
> 
>> I'm worried as to how this would interact with the set_memory_*()
>> functions, as on arm64 those can only operate on page-granular mappings.
>> Those may need fixing up to handle huge mappings; certainly if the above
>> is all for modules.
> 
> Good point, that looks like it would break on arm64 at least. I'll
> work on it. We may have to make this opt in beyond HUGE_VMAP.

This is another reason we might need to have an arch opt-ins like the one
I mentioned before.
