Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B69114FC52
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 Feb 2020 09:32:53 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 489PNL4zt9zDqWp
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 Feb 2020 19:32:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=jxSd4bcB; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 489PLm2HlQzDqWp
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  2 Feb 2020 19:31:27 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 489PLc2Pfyz9tyWF;
 Sun,  2 Feb 2020 09:31:20 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=jxSd4bcB; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 0yWRy2TLi9QC; Sun,  2 Feb 2020 09:31:20 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 489PLc0zVpz9tyWB;
 Sun,  2 Feb 2020 09:31:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1580632280; bh=gJ+YBiU1siNA6yw0ERrSRXytsUyJ6J4mmY1g8irtvMg=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=jxSd4bcBMPwDDkQQtltYvbDM7RjmY7wn3YHePmJyrQoSpGxb+srr+7WWVT07acbk4
 Gd8wx/ElVf48v1NQ7kacblPWNxOSr0bIjH1lQW4QiWnAuYKH9BZIwizDmpyvIglx32
 bf4U9cZQC+HCcZh0MgO0YttEmPTxX2H/LjarVNYo=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E45E88B762;
 Sun,  2 Feb 2020 09:31:22 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id wqc16BLAbHuO; Sun,  2 Feb 2020 09:31:22 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A80498B752;
 Sun,  2 Feb 2020 09:31:20 +0100 (CET)
Subject: Re: [PATCH V12] mm/debug: Add tests validating architecture page
 table helpers
To: Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org
References: <1580174873-18117-1-git-send-email-anshuman.khandual@arm.com>
 <68ed6488-aa25-ab41-8da6-f0ddeb15d52b@c-s.fr>
 <49754f74-53a7-0e4a-bb16-53617f8c902c@arm.com>
 <473d8198-3ac4-af3b-e2ec-c0698a3565d3@c-s.fr>
 <ad5ad414-3524-2efa-df16-1ee357e6e2e4@arm.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <e1e046d7-bf1d-eaec-1d0b-fe056b83b84c@c-s.fr>
Date: Sun, 2 Feb 2020 09:31:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <ad5ad414-3524-2efa-df16-1ee357e6e2e4@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
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



Le 02/02/2020 à 08:18, Anshuman Khandual a écrit :
> On 01/30/2020 07:43 PM, Christophe Leroy wrote:
>>
>>
>> Le 30/01/2020 à 14:04, Anshuman Khandual a écrit :
>>>
>>> On 01/28/2020 10:35 PM, Christophe Leroy wrote:
>>
>>>
>>>> I think we could make it standalone and 'default y if DEBUG_VM' instead.
>>>
>>> Which will yield the same result like before but in a different way. But
>>> yes, this test could go about either way but unless there is a good enough
>>> reason why change the current one.
>>
>> I think if we want people to really use it on other architectures it must be possible to activate it without having to modify Kconfig. Otherwise people won't even know the test exists and the architecture fails the test.
>>
>> The purpose of a test suite is to detect bugs. If you can't run the test until you have fixed the bugs, I guess nobody will ever detect the bugs and they will never be fixed.
>>
>> So I think:
>> - the test should be 'default y' when ARCH_HAS_DEBUG_VM_PGTABLE is selected
>> - the test should be 'default n' when ARCH_HAS_DEBUG_VM_PGTABLE is not selected, and it should be user selectable if EXPERT is selected.
>>
>> Something like:
>>
>> config DEBUG_VM_PGTABLE
>>      bool "Debug arch page table for semantics compliance" if ARCH_HAS_DEBUG_VM_PGTABLE || EXPERT
>>      depends on MMU
> 
> (ARCH_HAS_DEBUG_VM_PGTABLE || EXPERT) be moved along side MMU on the same line ?

Yes could also go along side MMU, or could be a depend by itself:
	depends on ARCH_HAS_DEBUG_VM_PGTABLE || EXPERT

> 
>>      default 'n' if !ARCH_HAS_DEBUG_VM_PGTABLE
>>      default 'y' if DEBUG_VM
> 
> This looks good, at least until we get all platforms enabled. Will do all these
> changes along with s390 enablement and re-spin.

Christophe
