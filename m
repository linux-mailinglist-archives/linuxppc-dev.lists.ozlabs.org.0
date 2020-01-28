Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E5C14AFCD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jan 2020 07:28:00 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 486GrY2hDdzDqKv
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jan 2020 17:27:57 +1100 (AEDT)
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
 header.s=mail header.b=C70j0unK; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 486GWZ2FbCzDqBc
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jan 2020 17:13:14 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 486GWR2cqXz9v22Q;
 Tue, 28 Jan 2020 07:13:07 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=C70j0unK; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id tf9SBshBmIx8; Tue, 28 Jan 2020 07:13:07 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 486GWR19WTz9v22N;
 Tue, 28 Jan 2020 07:13:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1580191987; bh=pcrCnDSka2qoXBfBeA3afQal2h0amq4PFi2jmMQwdpk=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=C70j0unKrMF6yDixdWedTQC2P5T5/vAYpEmpZheamqM8tUIvuDuoyzTfclHpLcmBs
 zFelibkah4ATRqmpbd//5eGzB63dcgYhxVJrzK4IvtVG6rBysf1zACi5HU+mamJ97b
 k3ddSc1LOjJeLmYIAzLxKGYzTukejGmyrGraiJB8=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id DCAFB8B7C2;
 Tue, 28 Jan 2020 07:13:07 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id UqMMVHvL2Had; Tue, 28 Jan 2020 07:13:07 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 1FF9D8B75B;
 Tue, 28 Jan 2020 07:13:05 +0100 (CET)
Subject: Re: [PATCH V12] mm/debug: Add tests validating architecture page
 table helpers
To: Qian Cai <cai@lca.pw>, Anshuman Khandual <anshuman.khandual@arm.com>
References: <1580174873-18117-1-git-send-email-anshuman.khandual@arm.com>
 <14882A91-17DE-4ABD-ABF2-08E7CCEDF660@lca.pw>
 <214c0d53-eb34-9b0c-2e4e-1aa005146331@arm.com>
 <016A776F-EFD9-4D2B-A3A9-788008617D95@lca.pw>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <a7ba6d8a-6443-5994-6a34-2824aa9b054b@c-s.fr>
Date: Tue, 28 Jan 2020 07:13:04 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <016A776F-EFD9-4D2B-A3A9-788008617D95@lca.pw>
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
Cc: Mark Rutland <Mark.Rutland@arm.com>, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 James Hogan <jhogan@kernel.org>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Michal Hocko <mhocko@kernel.org>,
 Linux-MM <linux-mm@kvack.org>, Dave Hansen <dave.hansen@intel.com>,
 Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, linux-s390@vger.kernel.org,
 x86@kernel.org, Russell King - ARM Linux <linux@armlinux.org.uk>,
 Matthew Wilcox <willy@infradead.org>, Steven Price <Steven.Price@arm.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Gerald Schaefer <gerald.schaefer@de.ibm.com>,
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



Le 28/01/2020 à 04:33, Qian Cai a écrit :
> 
> 
>> On Jan 27, 2020, at 10:06 PM, Anshuman Khandual <anshuman.khandual@arm.com> wrote:
>>
>>
>>
>> On 01/28/2020 07:41 AM, Qian Cai wrote:
>>>
>>>
>>>> On Jan 27, 2020, at 8:28 PM, Anshuman Khandual <Anshuman.Khandual@arm.com> wrote:
>>>>
>>>> This adds tests which will validate architecture page table helpers and
>>>> other accessors in their compliance with expected generic MM semantics.
>>>> This will help various architectures in validating changes to existing
>>>> page table helpers or addition of new ones.
>>>>
>>>> This test covers basic page table entry transformations including but not
>>>> limited to old, young, dirty, clean, write, write protect etc at various
>>>> level along with populating intermediate entries with next page table page
>>>> and validating them.
>>>>
>>>> Test page table pages are allocated from system memory with required size
>>>> and alignments. The mapped pfns at page table levels are derived from a
>>>> real pfn representing a valid kernel text symbol. This test gets called
>>>> right after page_alloc_init_late().
>>>>
>>>> This gets build and run when CONFIG_DEBUG_VM_PGTABLE is selected along with
>>>> CONFIG_VM_DEBUG. Architectures willing to subscribe this test also need to
>>>> select CONFIG_ARCH_HAS_DEBUG_VM_PGTABLE which for now is limited to x86 and
>>>> arm64. Going forward, other architectures too can enable this after fixing
>>>> build or runtime problems (if any) with their page table helpers.
>>
>> Hello Qian,
>>
>>>
>>> What’s the value of this block of new code? It only supports x86 and arm64
>>> which are supposed to be good now.
>>
>> We have been over the usefulness of this code many times before as the patch is
>> already in it's V12. Currently it is enabled on arm64, x86 (except PAE), arc and
>> ppc32. There are build time or runtime problems with other archs which prevent
> 
> I am not sure if I care too much about arc and ppc32 which are pretty much legacy
> platforms.
> 
>> enablement of this test (for the moment) but then the goal is to integrate all
>> of them going forward. The test not only validates platform's adherence to the
>> expected semantics from generic MM but also helps in keeping it that way during
>> code changes in future as well.
> 
> Another option maybe to get some decent arches on board first before merging this
> thing, so it have more changes to catch regressions for developers who might run this.
> 

ppc32 an indecent / legacy platform ? Are you kidying ?

Powerquicc II PRO for instance is fully supported by the manufacturer 
and widely used in many small networking devices.

Christophe
