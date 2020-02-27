Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 082D0170E7E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Feb 2020 03:36:08 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48ScH83ZkdzDqbf
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Feb 2020 13:36:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 48ScF94tfTzDqWg
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Feb 2020 13:34:19 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A9D9F1FB;
 Wed, 26 Feb 2020 18:34:15 -0800 (PST)
Received: from [10.163.1.119] (unknown [10.163.1.119])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6D8323F819;
 Wed, 26 Feb 2020 18:34:06 -0800 (PST)
From: Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH V14] mm/debug: Add tests validating architecture page
 table helpers
To: Christophe Leroy <christophe.leroy@c-s.fr>, Qian Cai <cai@lca.pw>,
 linux-mm@kvack.org
References: <1581909460-19148-1-git-send-email-anshuman.khandual@arm.com>
 <1582726182.7365.123.camel@lca.pw> <1582726340.7365.124.camel@lca.pw>
 <eb154054-68ab-a659-065b-f4f7dcbb8671@c-s.fr>
Message-ID: <52db1e9b-83b3-c41f-ef03-0f43e2159a83@arm.com>
Date: Thu, 27 Feb 2020 08:04:05 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <eb154054-68ab-a659-065b-f4f7dcbb8671@c-s.fr>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, x86@kernel.org, Mike Rapoport <rppt@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 James Morse <james.morse@arm.com>, linux-snps-arc@lists.infradead.org,
 Vasily Gorbik <gor@linux.ibm.com>, Borislav Petkov <bp@alien8.de>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A . Shutemov" <kirill@shutemov.name>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Vineet Gupta <vgupta@synopsys.com>, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 02/26/2020 08:14 PM, Christophe Leroy wrote:
> 
> 
> Le 26/02/2020 à 15:12, Qian Cai a écrit :
>> On Wed, 2020-02-26 at 09:09 -0500, Qian Cai wrote:
>>> On Mon, 2020-02-17 at 08:47 +0530, Anshuman Khandual wrote:
>>>
>>> How useful is this that straightly crash the powerpc?
>>
>> And then generate warnings on arm64,
>>
>> [  146.634626][    T1] debug_vm_pgtable: debug_vm_pgtable: Validating
>> architecture page table helpers
>> [  146.643995][    T1] ------------[ cut here ]------------
>> [  146.649350][    T1] virt_to_phys used for non-linear address:
>> (____ptrval____) (start_kernel+0x0/0x580)
> 
> Must be something wrong with the following in debug_vm_pgtable()
> 
>     paddr = __pa(&start_kernel);
> 
> Is there any explaination why start_kernel() is not in linear memory on ARM64 ?


Cc: + James Morse <james.morse@arm.com>

This warning gets exposed with DEBUG_VIRTUAL due to __pa() on a kernel symbol
i.e 'start_kernel' which might be outside the linear map. This happens due to
kernel mapping position randomization with KASLR. Adding James here in case he
might like to add more.

__pa_symbol() should have been used instead, for accessing the physical address
here. On arm64 __pa() does check for linear address with __is_lm_address() and
switch accordingly if it is a kernel text symbol. Nevertheless, its much better
to use __pa_symbol() here rather than __pa().

Rather than respining the patch once more, will just send a fix replacing this
helper __pa() with __pa_symbol() for Andrew to pick up as this patch is already
part of linux-next (next-20200226). But can definitely respin if that will be
preferred.

Thanks Qian for catching this.

> 
> Christophe
> 
