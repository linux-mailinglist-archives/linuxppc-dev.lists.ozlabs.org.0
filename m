Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F6FF1071
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2019 08:36:12 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 477JHY4JVRzF5hB
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2019 18:36:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 477JFQ60RTzF3mt
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Nov 2019 18:34:15 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1EE3430E;
 Tue,  5 Nov 2019 23:34:13 -0800 (PST)
Received: from [192.168.225.149] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2F42D3F71A;
 Tue,  5 Nov 2019 23:36:40 -0800 (PST)
Subject: Re: [PATCH V8] mm/debug: Add tests validating architecture page table
 helpers
To: Christophe Leroy <christophe.leroy@c-s.fr>, linux-mm@kvack.org
References: <1572240562-23630-1-git-send-email-anshuman.khandual@arm.com>
 <3229d68d-0b9d-0719-3370-c6e1df0ea032@arm.com>
 <42160baa-0e9d-73d0-bf72-58bdbacf10ff@c-s.fr>
From: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <0e0c2ce9-636d-1153-2451-baf7317ed45f@arm.com>
Date: Wed, 6 Nov 2019 13:04:20 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <42160baa-0e9d-73d0-bf72-58bdbacf10ff@c-s.fr>
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 James Hogan <jhogan@kernel.org>, Heiko Carstens <heiko.carstens@de.ibm.com>,
 Michal Hocko <mhocko@kernel.org>, Dave Hansen <dave.hansen@intel.com>,
 Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, linux-s390@vger.kernel.org,
 Jason Gunthorpe <jgg@ziepe.ca>, x86@kernel.org,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Matthew Wilcox <willy@infradead.org>, Steven Price <Steven.Price@arm.com>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Gerald Schaefer <gerald.schaefer@de.ibm.com>,
 linux-snps-arc@lists.infradead.org, Ingo Molnar <mingo@kernel.org>,
 Kees Cook <keescook@chromium.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Mark Brown <broonie@kernel.org>, "Kirill A . Shutemov" <kirill@shutemov.name>,
 Dan Williams <dan.j.williams@intel.com>, Vlastimil Babka <vbabka@suse.cz>,
 linux-arm-kernel@lists.infradead.org,
 Sri Krishna chowdary <schowdary@nvidia.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mips@vger.kernel.org,
 Ralf Baechle <ralf@linux-mips.org>, linux-kernel@vger.kernel.org,
 Paul Burton <paul.burton@mips.com>, Mike Rapoport <rppt@linux.vnet.ibm.com>,
 Vineet Gupta <vgupta@synopsys.com>,
 Martin Schwidefsky <schwidefsky@de.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 11/06/2019 12:11 PM, Christophe Leroy wrote:
> 
> 
> Le 06/11/2019 à 04:22, Anshuman Khandual a écrit :
>>
>>
>> On 10/28/2019 10:59 AM, Anshuman Khandual wrote:
>>> +    -----------------------
>>> +    |         arch |status|
>>> +    -----------------------
>>> +    |       alpha: | TODO |
>>> +    |         arc: | TODO |
>>> +    |         arm: | TODO |
>>> +    |       arm64: |  ok  |
>>> +    |         c6x: | TODO |
>>> +    |        csky: | TODO |
>>> +    |       h8300: | TODO |
>>> +    |     hexagon: | TODO |
>>> +    |        ia64: | TODO |
>>> +    |        m68k: | TODO |
>>> +    |  microblaze: | TODO |
>>> +    |        mips: | TODO |
>>> +    |       nds32: | TODO |
>>> +    |       nios2: | TODO |
>>> +    |    openrisc: | TODO |
>>> +    |      parisc: | TODO |
>>> +    |     powerpc: | TODO |
>>> +    |       ppc32: |  ok  |
> 
> Note that ppc32 is a part of powerpc, not a standalone arch.

Right, I understand. But we are yet to hear about how this test
came about on powerpc server platforms. Will update 'powerpc'
arch listing above once we get some confirmation. May be once
this works on all relevant powerpc platforms, we can just merge
'powerpc' and 'ppc32' entries here as just 'powerpc'.

> 
> Maybe something like the following would be more correct:
> |  powerpc/32: |  ok  |
> |  powerpc/64: | TODO |
> 
> Christophe
> 
>>> +    |       riscv: | TODO |
>>> +    |        s390: | TODO |
>>> +    |          sh: | TODO |
>>> +    |       sparc: | TODO |
>>> +    |          um: | TODO |
>>> +    |   unicore32: | TODO |
>>> +    |         x86: |  ok  |
>>> +    |      xtensa: | TODO |
>>> +    -----------------------
>>
>> While here, are there some volunteers to test this on any of the
>> 'yet to be tested and supported' platforms ?
>>
>> - Anshuman
>>
> 
