Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C00701E61FA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 May 2020 15:17:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49XpCR1nj2zDqYn
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 May 2020 23:17:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Xp8t04JFzDqX2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 May 2020 23:15:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=ZTblVq9B; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 49Xp8s4nCSz9sSc; Thu, 28 May 2020 23:15:25 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49Xp8r6bMBz9sSJ;
 Thu, 28 May 2020 23:15:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1590671725;
 bh=ZRRO6kMr+cLZJq8SMGMBeVo6o9tnTSDpnGz9qtlOgAk=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=ZTblVq9BeW5qL2XdsVhxlQMZXaduJzn4W3iHIvkBObOs+b6M+ooXadTmwbvKV/+1v
 tAt8mc0jXQ0fV646FSGB2FBqqFM9Ec7NabYKo3kZIqCHekHiXE3AN0i6JfLNlBLmS5
 fxdaT0V2icUW3OZe+dAnbV4u5cmwteWXz3uMW4KP+dkf8v75aQYBflPoMES34d8qwZ
 o9+TATtsWWxhb5HU5JWIxl432L8/XyE6KBSbzbviBXC+paoMSiQknfplAPdQZVwlCj
 6rVVhpwjVJJjie/siX+S5nZwl5rOYksm9YVfIotdqvo2VklsP9ezdtIj0w5yvDaL8S
 7Fw1P2gYEbTyA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Jordan Niethe <jniethe5@gmail.com>
Subject: Re: [PATCH] powerpc/64: Remove unused generic_secondary_thread_init()
In-Reply-To: <CACzsE9oxzdXOip7fnUF8H943FCrdEDqKRaF67YbF_MDguHWEag@mail.gmail.com>
References: <20200526063446.2476336-1-mpe@ellerman.id.au>
 <CACzsE9oxzdXOip7fnUF8H943FCrdEDqKRaF67YbF_MDguHWEag@mail.gmail.com>
Date: Thu, 28 May 2020 23:15:48 +1000
Message-ID: <877dwwjj3v.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linuxppc-dev@ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Jordan Niethe <jniethe5@gmail.com> writes:
> On Tue, May 26, 2020 at 4:36 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
>>
>> The last caller was removed in 2014 in commit fb5a515704d7 ("powerpc:
>> Remove platforms/wsp and associated pieces").
>>
>> Once generic_secondary_thread_init() is removed there are no longer
>> any uses of book3e_secondary_thread_init() or
>> generic_secondary_common_init so remove them too.
>>
>> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
>> ---
>>  arch/powerpc/include/asm/smp.h       |  1 -
>>  arch/powerpc/kernel/exceptions-64e.S |  4 ----
>>  arch/powerpc/kernel/head_64.S        | 18 ------------------
>>  3 files changed, 23 deletions(-)
>>
>> diff --git a/arch/powerpc/include/asm/smp.h b/arch/powerpc/include/asm/smp.h
>> index 49a25e2400f2..81a49566ccd8 100644
>> --- a/arch/powerpc/include/asm/smp.h
>> +++ b/arch/powerpc/include/asm/smp.h
>> @@ -243,7 +243,6 @@ extern void arch_send_call_function_ipi_mask(const struct cpumask *mask);
>>   * 64-bit but defining them all here doesn't harm
>>   */
>>  extern void generic_secondary_smp_init(void);
>> -extern void generic_secondary_thread_init(void);
>>  extern unsigned long __secondary_hold_spinloop;
>>  extern unsigned long __secondary_hold_acknowledge;
>>  extern char __secondary_hold;
>> diff --git a/arch/powerpc/kernel/exceptions-64e.S b/arch/powerpc/kernel/exceptions-64e.S
>> index d9ed79415100..9f9e8686798b 100644
>> --- a/arch/powerpc/kernel/exceptions-64e.S
>> +++ b/arch/powerpc/kernel/exceptions-64e.S
>> @@ -1814,10 +1814,6 @@ _GLOBAL(book3e_secondary_core_init)
>>  1:     mtlr    r28
>>         blr
>>
>> -_GLOBAL(book3e_secondary_thread_init)
>> -       mflr    r28
>> -       b       3b
>> -
>>         .globl init_core_book3e
>>  init_core_book3e:
>>         /* Establish the interrupt vector base */
>> diff --git a/arch/powerpc/kernel/head_64.S b/arch/powerpc/kernel/head_64.S
>> index 0e05a9a47a4b..4ae2c18c5fc6 100644
>> --- a/arch/powerpc/kernel/head_64.S
>> +++ b/arch/powerpc/kernel/head_64.S
>> @@ -302,23 +302,6 @@ _GLOBAL(fsl_secondary_thread_init)
>>  1:
>>  #endif
>
> Nothing directly calls generic_secondary_thread_init() but I think
> fsl_secondary_thread_init() which is directly above "falls through"
> into it. fsl_secondary_thread_init() still has callers.

Damnit, you're right, I love deleting code! Thanks for reviewing.

I'll send a v2.

cheers
