Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED642C1A44
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Nov 2020 01:55:17 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cg5Cj4bbZzDqSD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Nov 2020 11:55:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cg59M5tWyzDqRd
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Nov 2020 11:53:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=n18IzvBW; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Cg59H3239z9s1l;
 Tue, 24 Nov 2020 11:53:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1606179188;
 bh=lyVOjIkSY5dqLzPZNvbMZ38Ji4ioww1+hvQxiSUQm3Q=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=n18IzvBWw2TV142EFQEjejJW7/FqYCmtDMxgjeVIyiVy1SevKBgYP5TmkR63a64hK
 LRWMxRUBR2ZOQRXhBYqjzuN2PFrl6VigEQ6gnJH0UT0Of8Ujkb4w5eNs07U1B1dEfp
 DrHLTr5A6SglsJ+b5Js3pIWtN0Om0clhQJm/tvrTd/YRpsDNavh9V9NV/WSW7nuSwn
 Ngoa5rpHPiutfEVtD/GSEqwWvdv3GILXN5Ca4/7eb1fscPfRRc1zCyCmvN0aKdxJzH
 VHzfXi8nikZ4SZkVGyksLHcAy/v3klnQvWX4uCEJUHpnwA1HFVCnyEx9vzhGG6YZcY
 kWzUeSbjru6ng==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Oleg Nesterov <oleg@redhat.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v3 2/2] powerpc/ptrace: Hard wire PT_SOFTE value to 1 in
 gpr_get() too
In-Reply-To: <20201123180142.GB20279@redhat.com>
References: <20201119160154.GA5183@redhat.com>
 <20201119160247.GB5188@redhat.com>
 <20201119221033.Horde.be-msjDTeIW4XeXARjUu7g1@messagerie.c-s.fr>
 <20201119224347.GC5138@redhat.com> <20201123180142.GB20279@redhat.com>
Date: Tue, 24 Nov 2020 11:53:03 +1100
Message-ID: <87360z1spc.fsf@mpe.ellerman.id.au>
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>,
 Madhavan Srinivasan <maddy@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Nicholas Piggin <npiggin@gmail.com>, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, Al Viro <viro@zeniv.linux.org.uk>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Jan Kratochvil <jan.kratochvil@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Oleg Nesterov <oleg@redhat.com> writes:
> Christophe, et al,
>
> So what?
>
> Are you going to push your change or should I re-send 1-2 without
> whitespace cleanups?

I'll take your 1 & 2 and fixup the whitespace issues when applying.

cheers

> On 11/19, Oleg Nesterov wrote:
>>
>> On 11/19, Christophe Leroy wrote:
>> >
>> > I think the following should work, and not require the first patch (compile
>> > tested only).
>> >
>> > --- a/arch/powerpc/kernel/ptrace/ptrace-view.c
>> > +++ b/arch/powerpc/kernel/ptrace/ptrace-view.c
>> > @@ -234,9 +234,21 @@ static int gpr_get(struct task_struct *target, const
>> > struct user_regset *regset,
>> >  	BUILD_BUG_ON(offsetof(struct pt_regs, orig_gpr3) !=
>> >  		     offsetof(struct pt_regs, msr) + sizeof(long));
>> > 
>> > +#ifdef CONFIG_PPC64
>> > +	membuf_write(&to, &target->thread.regs->orig_gpr3,
>> > +		     offsetof(struct pt_regs, softe) - offsetof(struct pt_regs,
>> > orig_gpr3));
>> > +	membuf_store(&to, 1UL);
>> > +
>> > +	BUILD_BUG_ON(offsetof(struct pt_regs, trap) !=
>> > +		     offsetof(struct pt_regs, softe) + sizeof(long));
>> > +
>> > +	membuf_write(&to, &target->thread.regs->trap,
>> > +		     sizeof(struct user_pt_regs) - offsetof(struct pt_regs, trap));
>> > +#else
>> >  	membuf_write(&to, &target->thread.regs->orig_gpr3,
>> >  			sizeof(struct user_pt_regs) -
>> >  			offsetof(struct pt_regs, orig_gpr3));
>> > +#endif
>> >  	return membuf_zero(&to, ELF_NGREG * sizeof(unsigned long) -
>> >  				 sizeof(struct user_pt_regs));
>> >  }
>> 
>> Probably yes.
>> 
>> This mirrors the previous patch I sent (https://lore.kernel.org/lkml/20190917143753.GA12300@redhat.com/)
>> and this is exactly what I tried to avoid, we can make a simpler fix now.
>> 
>> But let me repeat, I agree with any fix even if imp my version simplifies the code, just
>> commit this change and lets forget this problem.
>> 
>> Oleg.
