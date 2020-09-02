Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BE09B25A882
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Sep 2020 11:21:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BhJND6hLgzDqqW
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Sep 2020 19:21:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::341;
 helo=mail-ot1-x341.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=cSnVWxgU; dkim-atps=neutral
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BhJL00pLpzDqnr
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Sep 2020 19:19:33 +1000 (AEST)
Received: by mail-ot1-x341.google.com with SMTP id i4so3685158ota.2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 02 Sep 2020 02:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OXMTCYKKDHUBQdldt8AzU2mUeg41hBCxakL+XCbBpKs=;
 b=cSnVWxgU0+gX0Cl711d7S/2g8jICe89QKFmbmYivR7A9cZxv9//44M0x3vxH3g0Ym5
 hTYmzBAU8dI0tRGow1vLG+K7TBCB4mG4yM2GHg9hgwtEYZtBwP4nVW15INvFKWxkRfJj
 jNBG4bLMNZ46IQYTDb//qqw6K3TwO0z9dmLdXrYsTPYtjYVehDun5f/BW4UN000g+yVy
 XFmAlyKM7ExthPHjdYh0waEAptpXw4p34ju0hIUSwmP2o1lfECQMUBnWBTfulyhagwHJ
 y/DpJxJ+5KniiA85NsIjhzAWNswP5dA8KqyTws5ULBX84MzF4d1n6gMba/zOd+xNJVRk
 PLwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OXMTCYKKDHUBQdldt8AzU2mUeg41hBCxakL+XCbBpKs=;
 b=NhUQiXauPVg2XCOfGrkvVDSEIV5SQyyjLOuaIulLk1ZAkI5IyDIHWEOC5vtI1JooGo
 ULAArmWTAAzEFnNW1fcNu7OQS6E9fClO90YbfwhztpgnGy8IXmpoDyROjDHh0s95lkxT
 Db57wcmPAxuh6mTuLvPcaMcxNSp6vdI9jMZ4stvEOz40N6KI9qXDUym0QA/8LGwUzAf/
 E3pyLAuKEV96Nada1T/N/HvcVXIyejL84hNdZ3bT5RKgfhVjULdNetqd3jwXH8zy2sTt
 4LOFrB/Mt+xH+dTUyVTcTG5rU45i9peMA7jmMvGCCEqiH5opSoPwulWDR6CAxMkDs9bZ
 b4fQ==
X-Gm-Message-State: AOAM531uU/A6mqtIzQN1cZJdgEdfn/Ak8tkzANHAgvG9M3mgLFrzbw+G
 7T/zWG5qWdmCBfT5+x+2C8ODyVVR0WeMrSYBY6I=
X-Google-Smtp-Source: ABdhPJwbWD8tSzF0QVqiA/05NYJo6VEKYL57PswdCntj5l5+QTb26hx7UUIMjEEIwQ0tyInsXpzPX6k5OFMkK7tNt9w=
X-Received: by 2002:a05:6830:1283:: with SMTP id
 z3mr4409133otp.51.1599038371804; 
 Wed, 02 Sep 2020 02:19:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200820033922.32311-1-jniethe5@gmail.com>
 <20200820033922.32311-2-jniethe5@gmail.com>
 <20200902061829.GF272502@thinks.paulus.ozlabs.org>
In-Reply-To: <20200902061829.GF272502@thinks.paulus.ozlabs.org>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Wed, 2 Sep 2020 19:19:20 +1000
Message-ID: <CACzsE9oeNBRyrf9Tm+3uSypO0mn00Aib=2zCbSE3J5q-i5Ceew@mail.gmail.com>
Subject: Re: [RFC PATCH 2/2] KVM: PPC: Book3S HV: Support prefixed instructions
To: Paul Mackerras <paulus@ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Sep 2, 2020 at 4:18 PM Paul Mackerras <paulus@ozlabs.org> wrote:
>
> On Thu, Aug 20, 2020 at 01:39:22PM +1000, Jordan Niethe wrote:
> > There are two main places where instructions are loaded from the guest:
> >     * Emulate loadstore - such as when performing MMIO emulation
> >       triggered by an HDSI
> >     * After an HV emulation assistance interrupt (e40)
> >
> > If it is a prefixed instruction that triggers these cases, its suffix
> > must be loaded. Use the SRR1_PREFIX bit to decide if a suffix needs to
> > be loaded. Make sure if this bit is set inject_interrupt() also sets it
> > when giving an interrupt to the guest.
> >
> > ISA v3.10 extends the Hypervisor Emulation Instruction Register (HEIR)
> > to 64 bits long to accommodate prefixed instructions. For interrupts
> > caused by a word instruction the instruction is loaded into bits 32:63
> > and bits 0:31 are zeroed. When caused by a prefixed instruction the
> > prefix and suffix are loaded into bits 0:63.
> >
> > Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> > ---
> >  arch/powerpc/kvm/book3s.c               | 15 +++++++++++++--
> >  arch/powerpc/kvm/book3s_64_mmu_hv.c     | 10 +++++++---
> >  arch/powerpc/kvm/book3s_hv_builtin.c    |  3 +++
> >  arch/powerpc/kvm/book3s_hv_rmhandlers.S | 14 ++++++++++++++
> >  4 files changed, 37 insertions(+), 5 deletions(-)
> >
> > diff --git a/arch/powerpc/kvm/book3s.c b/arch/powerpc/kvm/book3s.c
> > index 70d8967acc9b..18b1928a571b 100644
> > --- a/arch/powerpc/kvm/book3s.c
> > +++ b/arch/powerpc/kvm/book3s.c
> > @@ -456,13 +456,24 @@ int kvmppc_load_last_inst(struct kvm_vcpu *vcpu,
> >  {
> >       ulong pc = kvmppc_get_pc(vcpu);
> >       u32 word;
> > +     u64 doubleword;
> >       int r;
> >
> >       if (type == INST_SC)
> >               pc -= 4;
> >
> > -     r = kvmppc_ld(vcpu, &pc, sizeof(u32), &word, false);
> > -     *inst = ppc_inst(word);
> > +     if ((kvmppc_get_msr(vcpu) & SRR1_PREFIXED)) {
> > +             r = kvmppc_ld(vcpu, &pc, sizeof(u64), &doubleword, false);
>
> Should we also have a check here that the doubleword is not crossing a
> page boundary?  I can't think of a way to get this code to cross a
> page boundary, assuming the hardware is working correctly, but it
> makes me just a little nervous.
I didn't think it could happen but I will add a check to be safe.
>
> > +#ifdef CONFIG_CPU_LITTLE_ENDIAN
> > +             *inst = ppc_inst_prefix(doubleword & 0xffffffff, doubleword >> 32);
> > +#else
> > +             *inst = ppc_inst_prefix(doubleword >> 32, doubleword & 0xffffffff);
> > +#endif
>
> Ick.  Is there a cleaner way to do this?
Would it be nicer to read the prefix as u32 then the suffix as a u32 too?
>
> > +     } else {
> > +             r = kvmppc_ld(vcpu, &pc, sizeof(u32), &word, false);
> > +             *inst = ppc_inst(word);
> > +     }
> > +
> >       if (r == EMULATE_DONE)
> >               return r;
> >       else
> > diff --git a/arch/powerpc/kvm/book3s_64_mmu_hv.c b/arch/powerpc/kvm/book3s_64_mmu_hv.c
> > index 775ce41738ce..0802471f4856 100644
> > --- a/arch/powerpc/kvm/book3s_64_mmu_hv.c
> > +++ b/arch/powerpc/kvm/book3s_64_mmu_hv.c
> > @@ -411,9 +411,13 @@ static int instruction_is_store(struct ppc_inst instr)
> >       unsigned int mask;
> >
> >       mask = 0x10000000;
> > -     if ((ppc_inst_val(instr) & 0xfc000000) == 0x7c000000)
> > -             mask = 0x100;           /* major opcode 31 */
> > -     return (ppc_inst_val(instr) & mask) != 0;
> > +     if (ppc_inst_prefixed(instr)) {
> > +             return (ppc_inst_suffix(instr) & mask) != 0;
> > +     } else {
> > +             if ((ppc_inst_val(instr) & 0xfc000000) == 0x7c000000)
> > +                     mask = 0x100;           /* major opcode 31 */
> > +             return (ppc_inst_val(instr) & mask) != 0;
> > +     }
>
> The way the code worked before, the mask depended on whether the
> instruction was a D-form (or DS-form or other variant) instruction,
> where you can tell loads and stores apart by looking at the major
> opcode, or an X-form instruction, where you look at the minor opcode.
>
> Now we are only looking at the minor opcode if it is not a prefixed
> instruction.  Are there no X-form prefixed loads or stores?
I could not see an X-form load/stores so I went with just that.
But checking the ISA it does mention  "..X-form instructions that are
preceded by an MLS-form or MMLS-form prefix..." so I shall use the
other mask too.
>
> Paul.
Thank you for the comments and suggestions.
