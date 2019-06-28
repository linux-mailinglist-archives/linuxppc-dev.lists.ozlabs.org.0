Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1E259226
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2019 05:46:13 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45ZjNg1f4SzDqkV
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2019 13:46:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 45ZjLj3M0tzDqF6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jun 2019 13:44:27 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BC1A92B;
 Thu, 27 Jun 2019 20:44:24 -0700 (PDT)
Received: from [10.162.40.144] (p8cg001049571a15.blr.arm.com [10.162.40.144])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id
 2BE923F706; Thu, 27 Jun 2019 20:44:20 -0700 (PDT)
Subject: Re: [PATCH] powerpc/64s/radix: Define arch_ioremap_p4d_supported()
To: Michael Ellerman <mpe@ellerman.id.au>, linux-mm@kvack.org
References: <1561555260-17335-1-git-send-email-anshuman.khandual@arm.com>
 <87d0iztz0f.fsf@concordia.ellerman.id.au>
From: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <6d201cb8-4c39-b7ea-84e6-f84607cc8b4f@arm.com>
Date: Fri, 28 Jun 2019 09:14:46 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <87d0iztz0f.fsf@concordia.ellerman.id.au>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, linux-next@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 06/27/2019 10:18 AM, Michael Ellerman wrote:
> Anshuman Khandual <anshuman.khandual@arm.com> writes:
>> Recent core ioremap changes require HAVE_ARCH_HUGE_VMAP subscribing archs
>> provide arch_ioremap_p4d_supported() failing which will result in a build
>> failure like the following.
>>
>> ld: lib/ioremap.o: in function `.ioremap_huge_init':
>> ioremap.c:(.init.text+0x3c): undefined reference to
>> `.arch_ioremap_p4d_supported'
>>
>> This defines a stub implementation for arch_ioremap_p4d_supported() keeping
>> it disabled for now to fix the build problem.
> 
> The easiest option is for this to be folded into your patch that creates
> the requirement for arch_ioremap_p4d_supported().
> 
> Andrew might do that for you, or you could send a v2.
> 
> This looks fine from a powerpc POV:
> 
> Acked-by: Michael Ellerman <mpe@ellerman.id.au>
> 
> cheers

Hello Stephen/Michael/Andrew,

On linux-next (next-20190627) this change has already been applied though a
merge commit 153083a99fe431 ("Merge branch 'akpm-current/current'"). So we
are good on this ? Or shall I send out a V2 for the original patch. Please
suggest. Thank you.

- Anshuman
