Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC934C9BF4
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Mar 2022 04:17:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K7fRh5k4Xz3bsL
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Mar 2022 14:17:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4K7fQd05ZDz30gk
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Mar 2022 14:16:05 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2C1C9113E;
 Tue,  1 Mar 2022 19:16:02 -0800 (PST)
Received: from [10.163.49.202] (unknown [10.163.49.202])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 091233F73D;
 Tue,  1 Mar 2022 19:15:54 -0800 (PST)
Subject: Re: [PATCH V3 09/30] arm/mm: Enable ARCH_HAS_VM_GET_PAGE_PROT
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
References: <1646045273-9343-1-git-send-email-anshuman.khandual@arm.com>
 <1646045273-9343-10-git-send-email-anshuman.khandual@arm.com>
 <Yhyqjo/4bozJB6j5@shell.armlinux.org.uk>
 <542fa048-131e-240b-cc3a-fd4fff7ce4ba@arm.com>
 <Yh1pYAOiskEQes3p@shell.armlinux.org.uk>
From: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <2f995e2a-c00f-bc9c-6ac6-c783a21b007e@arm.com>
Date: Wed, 2 Mar 2022 08:45:52 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <Yh1pYAOiskEQes3p@shell.armlinux.org.uk>
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



On 3/1/22 6:01 AM, Russell King (Oracle) wrote:
> On Tue, Mar 01, 2022 at 05:30:41AM +0530, Anshuman Khandual wrote:
>> On 2/28/22 4:27 PM, Russell King (Oracle) wrote:
>>> On Mon, Feb 28, 2022 at 04:17:32PM +0530, Anshuman Khandual wrote:
>>>> This defines and exports a platform specific custom vm_get_page_prot() via
>>>> subscribing ARCH_HAS_VM_GET_PAGE_PROT. Subsequently all __SXXX and __PXXX
>>>> macros can be dropped which are no longer needed.
>>> What I would really like to know is why having to run _code_ to work out
>>> what the page protections need to be is better than looking it up in a
>>> table.
>>>
>>> Not only is this more expensive in terms of CPU cycles, it also brings
>>> additional code size with it.
>>>
>>> I'm struggling to see what the benefit is.
>> Currently vm_get_page_prot() is also being _run_ to fetch required page
>> protection values. Although that is being run in the core MM and from a
>> platform perspective __SXXX, __PXXX are just being exported for a table.
>> Looking it up in a table (and applying more constructs there after) is
>> not much different than a clean switch case statement in terms of CPU
>> usage. So this is not more expensive in terms of CPU cycles.
> I disagree.
> 
> However, let's base this disagreement on some evidence. Here is the
> present 32-bit ARM implementation:
> 
> 00000048 <vm_get_page_prot>:
>       48:       e200000f        and     r0, r0, #15
>       4c:       e3003000        movw    r3, #0
>                         4c: R_ARM_MOVW_ABS_NC   .LANCHOR1
>       50:       e3403000        movt    r3, #0
>                         50: R_ARM_MOVT_ABS      .LANCHOR1
>       54:       e7930100        ldr     r0, [r3, r0, lsl #2]
>       58:       e12fff1e        bx      lr
> 
> That is five instructions long.
> 
> Please show that your new implementation is not more expensive on
> 32-bit ARM. Please do so by building a 32-bit kernel, and providing
> the disassembly.
> 
> I think you will find way more than five instructions in your version -
> the compiler will have to issue code to decode the protection bits,
> probably using a table of branches or absolute PC values, or possibly
> the worst case of using multiple comparisons and branches. It then has
> to load constants that may be moved using movw on ARMv7, but on
> older architectures would have to be created from multiple instructions
> or loaded from the literal pool. Then there'll be instructions to load
> the address of "user_pgprot", retrieve its value, and bitwise or that.
> 
> Therefore, I fail to see how your approach of getting rid of the table
> is somehow "better" than what we currently have in terms of the effect
> on the resulting code.
> 
> If you don't like the __P and __S stuff and two arch_* hooks, you could
> move the table into arch code along with vm_get_page_prot() without the
> additional unnecessary hooks, while keeping all the benefits of the
> table lookup.

Okay, will change the arm's vm_get_page_prot() implementation as suggested.
