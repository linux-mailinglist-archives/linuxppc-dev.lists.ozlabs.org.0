Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3AD3664B5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Apr 2021 07:16:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FQ8142Nx7z301t
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Apr 2021 15:16:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FQ80k6XJVz2y0B
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Apr 2021 15:16:22 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FQ80g3fKKzB09Zn;
 Wed, 21 Apr 2021 07:16:19 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id jT86auJ0Oz4z; Wed, 21 Apr 2021 07:16:19 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FQ80g2rcszB09Zm;
 Wed, 21 Apr 2021 07:16:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2BFF88B814;
 Wed, 21 Apr 2021 07:16:20 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id NEQhXkRjVj-D; Wed, 21 Apr 2021 07:16:20 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9847B8B770;
 Wed, 21 Apr 2021 07:16:19 +0200 (CEST)
Subject: Re: [PATCH v10 06/10] powerpc/mm/ptdump: debugfs handler for W+X
 checks at runtime
To: Jordan Niethe <jniethe5@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>
References: <20210330045132.722243-1-jniethe5@gmail.com>
 <20210330045132.722243-7-jniethe5@gmail.com>
 <87im577eh3.fsf@mpe.ellerman.id.au>
 <CACzsE9pgZRaoHT0Ca=NB3srEMJMvLuiFkYA98xFDiUPyfmoV5Q@mail.gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <825f6dc7-637a-dab3-f659-db5b62a9f73d@csgroup.eu>
Date: Wed, 21 Apr 2021 07:16:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <CACzsE9pgZRaoHT0Ca=NB3srEMJMvLuiFkYA98xFDiUPyfmoV5Q@mail.gmail.com>
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
Cc: ajd@linux.ibm.com, Kees Cook <keescook@chromium.org>,
 Nicholas Piggin <npiggin@gmail.com>, cmr@codefail.de,
 naveen.n.rao@linux.ibm.com, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 21/04/2021 à 04:23, Jordan Niethe a écrit :
> On Wed, Mar 31, 2021 at 10:24 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
>>
>> Jordan Niethe <jniethe5@gmail.com> writes:
>>> From: Russell Currey <ruscur@russell.cc>
>>>
>>> Optionally run W+X checks when dumping pagetable information to
>>> debugfs' kernel_page_tables.
>>>
>>> To use:
>>>      $ echo 1 > /sys/kernel/debug/check_wx_pages
>>>      $ cat /sys/kernel/debug/kernel_page_tables
>>>
>>> and check the kernel log.  Useful for testing strict module RWX.
>>>
>>> To disable W+X checks:
>>>        $ echo 0 > /sys/kernel/debug/check_wx_pages
>>>
>>> Update the Kconfig entry to reflect this.
>>>
>>> Also fix a typo.
>>>
>>> Reviewed-by: Kees Cook <keescook@chromium.org>
>>> Signed-off-by: Russell Currey <ruscur@russell.cc>
>>> [jpn: Change check_wx_pages to act as mode bit affecting
>>>        kernel_page_tables instead of triggering action on its own]
>>> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
>>> ---
>>> v10: check_wx_pages now affects kernel_page_tables rather then triggers
>>>       its own action.
>>
>> Hmm. I liked the old version better :)
>>
>> I think you changed it based on Christophe's comment:
>>
>>    Why not just perform the test everytime someone dumps kernel_page_tables ?
>>
>>
>> But I think he meant *always* do the check when someone dumps
>> kernel_page_tables, not have another file to enable checking and then
>> require someone to dump kernel_page_tables to do the actual check.
> Yes, I guess I misinterpreted that.
>>
>> Still I like the previous version where you can do the checks
>> separately, without having to dump the page tables, because dumping can
>> sometimes take quite a while.
>>
>> What would be even better is if ptdump_check_wx() returned an error when
>> wx pages were found, and that was plumbed out to the debugs file. That
>> way you can script around it.
> Ok I'll go back to how it was and add in returning an error.

I have a series to convert PPC_PTDUMP into GENERIC_PTDUMP, see 
https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=239795

>>
>> cheers
