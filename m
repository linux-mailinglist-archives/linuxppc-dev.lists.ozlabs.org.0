Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 15FA052B947
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 May 2022 14:04:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L3BVh0GYMz3cfg
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 May 2022 22:04:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=bgEw3lhp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L3BV65MYCz3bpR
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 May 2022 22:03:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=bgEw3lhp; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4L3BV63YQ6z4xbP;
 Wed, 18 May 2022 22:03:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1652875438;
 bh=tCWgxXr7XXOx2XHZ9VRkQnDGXiWz2tzxEYsme/eLKqE=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=bgEw3lhpumxzhiCa0NmLobkT9jCCBKGXzAYGvAAKp4y6+qKbEoTuUzgD3lmp9ZpQP
 X19kR3JPHCXNMK0FkYN276FM5ipkoO1DkQKOZOCHCpu4aJfGi+WuSiMSatT7/e6XtJ
 HHvd0uonUT9wLssaLa3oG2bW0M+HhUcdY1/6+AmCT5HcK5LTLFR5lJqn7+ChNlo+2v
 BKS5BkFqVQ35v9urZsHSR0W/eVnDf3aLOMDn1x+BXUXqpgbWiFHfVYR4qQBrZB5VlK
 +/asA2hBbKnUQu0jFO0kubBmsXwfG8aeJX2vd/Ub5EAa8jJ5QMJ6Z16WnstFzAKjKT
 EtWcZCuakOCpQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>, Benjamin
 Herrenschmidt <benh@kernel.crashing.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Paul Mackerras <paulus@samba.org>
Subject: Re: [PATCH v3 19/25] powerpc/ftrace: Minimise number of #ifdefs
In-Reply-To: <87leuznl5h.fsf@mpe.ellerman.id.au>
References: <cover.1652074503.git.christophe.leroy@csgroup.eu>
 <18ce6708d6f8c71d87436f9c6019f04df4125128.1652074503.git.christophe.leroy@csgroup.eu>
 <1652866821.cdcfe8bs78.naveen@linux.ibm.com>
 <87leuznl5h.fsf@mpe.ellerman.id.au>
Date: Wed, 18 May 2022 22:03:55 +1000
Message-ID: <87ilq3nj2s.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman <mpe@ellerman.id.au> writes:
> "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com> writes:
>> Christophe Leroy wrote:
>>> A lot of #ifdefs can be replaced by IS_ENABLED()
>>> 
>>> Do so.
>>> 
>>> This requires to have kernel_toc_addr() defined at all time
>>> as well as PPC_INST_LD_TOC and PPC_INST_STD_LR.
>>> 
>>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>>> ---
>>> v2: Moved the setup of pop outside of the big if()/else() in __ftrace_make_nop()
>>> ---
>>>  arch/powerpc/include/asm/code-patching.h |   2 -
>>>  arch/powerpc/include/asm/module.h        |   2 -
>>>  arch/powerpc/include/asm/sections.h      |  24 +--
>>>  arch/powerpc/kernel/trace/ftrace.c       | 182 +++++++++++------------
>>>  4 files changed, 103 insertions(+), 107 deletions(-)
>>> 
>>
>> <snip>
>>
>>> @@ -710,6 +707,9 @@ void arch_ftrace_update_code(int command)
>>> 
>>>  #ifdef CONFIG_PPC64
>>>  #define PACATOC offsetof(struct paca_struct, kernel_toc)
>>> +#else
>>> +#define PACATOC 0
>>> +#endif
>>
>> This conflicts with my fix for the ftrace init tramp:
>> https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20220516071422.463738-1-naveen.n.rao@linux.vnet.ibm.com/
>>
>> It probably makes sense to retain #ifdef CONFIG_PPC64, so that we can 
>> get rid of the PACATOC. Here is an incremental diff:
>
> Where is the incremental diff meant to apply?
>
> It doesn't apply on top of patch 19, or at the end of the series.

I think I worked out what you meant.

Can you check what's in next-test:

  https://github.com/linuxppc/linux/commits/next-test

cheers
