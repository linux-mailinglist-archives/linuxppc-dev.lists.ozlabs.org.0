Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 441EF3ACEE9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 17:27:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G62qb1q52z3c6r
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Jun 2021 01:27:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G62qF2zxhz2yY7
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Jun 2021 01:27:33 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
 by localhost (Postfix) with ESMTP id 4G62q23V0dzBCLV;
 Fri, 18 Jun 2021 17:27:26 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id agQHzAYYeUsd; Fri, 18 Jun 2021 17:27:26 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4G62q12wtwzBCL9;
 Fri, 18 Jun 2021 17:27:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5059F8B84B;
 Fri, 18 Jun 2021 17:27:25 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 9CJLhPmF_CRb; Fri, 18 Jun 2021 17:27:25 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 814148B84A;
 Fri, 18 Jun 2021 17:27:24 +0200 (CEST)
Subject: Re: [PATCH 8/8] membarrier: Rewrite sync_core_before_usermode() and
 improve documentation
To: Andy Lutomirski <luto@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 x86@kernel.org
References: <cover.1623813516.git.luto@kernel.org>
 <07a8b963002cb955b7516e61bad19514a3acaa82.1623813516.git.luto@kernel.org>
 <1623818343.eko1v01gvr.astroid@bobo.none>
 <1e248763-9372-6e4e-5dea-cda999000aeb@kernel.org>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <d1f62354-5249-f258-1a31-d3e8aebc29d7@csgroup.eu>
Date: Fri, 18 Jun 2021 17:27:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1e248763-9372-6e4e-5dea-cda999000aeb@kernel.org>
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
Cc: Dave Hansen <dave.hansen@intel.com>, Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>, linuxppc-dev@lists.ozlabs.org,
 LKML <linux-kernel@vger.kernel.org>, stable@vger.kernel.org,
 linux-mm@kvack.org, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Paul Mackerras <paulus@samba.org>, Andrew Morton <akpm@linux-foundation.org>,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 16/06/2021 à 20:52, Andy Lutomirski a écrit :
> On 6/15/21 9:45 PM, Nicholas Piggin wrote:
>> Excerpts from Andy Lutomirski's message of June 16, 2021 1:21 pm:
>>> The old sync_core_before_usermode() comments suggested that a non-icache-syncing
>>> return-to-usermode instruction is x86-specific and that all other
>>> architectures automatically notice cross-modified code on return to
>>> userspace.
> 
>>> +/*
>>> + * XXX: can a powerpc person put an appropriate comment here?
>>> + */
>>> +static inline void membarrier_sync_core_before_usermode(void)
>>> +{
>>> +}
>>> +
>>> +#endif /* _ASM_POWERPC_SYNC_CORE_H */
>>
>> powerpc's can just go in asm/membarrier.h
> 
> $ ls arch/powerpc/include/asm/membarrier.h
> ls: cannot access 'arch/powerpc/include/asm/membarrier.h': No such file
> or directory

https://github.com/torvalds/linux/blob/master/arch/powerpc/include/asm/membarrier.h


Was added by https://github.com/torvalds/linux/commit/3ccfebedd8cf54e291c809c838d8ad5cc00f5688

> 
> 
>>
>> /*
>>   * The RFI family of instructions are context synchronising, and
>>   * that is how we return to userspace, so nothing is required here.
>>   */
> 
> Thanks!
> 
