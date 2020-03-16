Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C538187665
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 00:53:23 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48hCmc0zfBzDqWs
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 10:53:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48hCl05fKVzDqWX
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Mar 2020 10:51:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=KyZp3UU4; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 48hCl00YkRz9sNg;
 Tue, 17 Mar 2020 10:51:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1584402716;
 bh=VpGZJfIHRSmpY2D6/9MDE+epOSAM4GCBKy3wjs3vSQY=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=KyZp3UU46svAFMhAbU9or0JQs3a7cvyqqXAhvu3oQALDSAmUTG90zdGlkD0Wp8Quw
 iHaED7uUOqwS9JISSSweGCtZP8EEnAF5XvupzScmakJX/Yn2W/31NAp0qT4f+Yo3zL
 V+wyBffLfS/TRxxkS2a0SlOLo9pib5gF931+1foZ/L7FWPYttasxj0OQpHsScZKNKN
 ogF9pHfcKEWI/a1mlWPhEBTrC9JUt5y4nLI6mfpObDEvrBNeI/0B3BCpIXycQZ+0DB
 Ojix1JIaU3FQdnEUeN+jWrJWSYAhqy4fJSNsKvV0oZrsbSbamiZu0zDmbRe8hACJ4h
 /Aw3ogY1hT2WQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH] powerpc/32: Fix missing NULL pmd check in virt_to_kpte()
In-Reply-To: <CAKwvOdm6Z+ERUcGXPbuBKmnpBUNKfL8fPOdxK2g+a1gVRWqh-Q@mail.gmail.com>
References: <b1177cdfc6af74a3e277bba5d9e708c4b3315ebe.1583575707.git.christophe.leroy@c-s.fr>
 <20200313033517.GA37606@ubuntu-m2-xlarge-x86>
 <CAKwvOdm6Z+ERUcGXPbuBKmnpBUNKfL8fPOdxK2g+a1gVRWqh-Q@mail.gmail.com>
Date: Tue, 17 Mar 2020 10:51:55 +1100
Message-ID: <87zhcfq2n8.fsf@mpe.ellerman.id.au>
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
Cc: LKML <linux-kernel@vger.kernel.org>, Paul Mackerras <paulus@samba.org>,
 Nathan Chancellor <natechancellor@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nick Desaulniers <ndesaulniers@google.com> writes:
> Hello ppc friends, did this get picked up into -next yet?

Not yet.

It's in my next-test, but it got stuck there because some subsequent
patches caused some CI errors that I had to debug.

I'll push it to next today.

cheers

> On Thu, Mar 12, 2020 at 8:35 PM Nathan Chancellor
> <natechancellor@gmail.com> wrote:
>>
>> On Sat, Mar 07, 2020 at 10:09:15AM +0000, Christophe Leroy wrote:
>> > Commit 2efc7c085f05 ("powerpc/32: drop get_pteptr()"),
>> > replaced get_pteptr() by virt_to_kpte(). But virt_to_kpte() lacks a
>> > NULL pmd check and returns an invalid non NULL pointer when there
>> > is no page table.
>> >
>> > Reported-by: Nick Desaulniers <ndesaulniers@google.com>
>> > Fixes: 2efc7c085f05 ("powerpc/32: drop get_pteptr()")
>> > Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
>> > ---
>> >  arch/powerpc/include/asm/pgtable.h | 4 +++-
>> >  1 file changed, 3 insertions(+), 1 deletion(-)
>> >
>> > diff --git a/arch/powerpc/include/asm/pgtable.h b/arch/powerpc/include/asm/pgtable.h
>> > index b80bfd41828d..b1f1d5339735 100644
>> > --- a/arch/powerpc/include/asm/pgtable.h
>> > +++ b/arch/powerpc/include/asm/pgtable.h
>> > @@ -54,7 +54,9 @@ static inline pmd_t *pmd_ptr_k(unsigned long va)
>> >
>> >  static inline pte_t *virt_to_kpte(unsigned long vaddr)
>> >  {
>> > -     return pte_offset_kernel(pmd_ptr_k(vaddr), vaddr);
>> > +     pmd_t *pmd = pmd_ptr_k(vaddr);
>> > +
>> > +     return pmd_none(*pmd) ? NULL : pte_offset_kernel(pmd, vaddr);
>> >  }
>> >  #endif
>> >
>> > --
>> > 2.25.0
>> >
>>
>> With QEMU 4.2.0, I can confirm this fixes the panic:
>>
>> Tested-by: Nathan Chancellor <natechancellor@gmail.com>
>
>
>
> -- 
> Thanks,
> ~Nick Desaulniers
