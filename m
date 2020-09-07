Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CE6AF25F167
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Sep 2020 03:14:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bl9LJ3CLbzDqJQ
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Sep 2020 11:14:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=codefail.de (client-ip=198.54.127.82;
 helo=se17-3.privateemail.com; envelope-from=cmr@codefail.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=codefail.de
Received: from se17-3.privateemail.com (se17-3.privateemail.com
 [198.54.127.82])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bl9JL06vQzDqQj
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Sep 2020 11:13:05 +1000 (AEST)
Received: from new-01-3.privateemail.com ([198.54.122.47])
 by se17.registrar-servers.com with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92)
 (envelope-from <cmr@codefail.de>)
 id 1kF5iK-0004ne-6c; Sun, 06 Sep 2020 18:12:58 -0700
Received: from MTA-07-1.privateemail.com (unknown [10.20.147.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by NEW-01-3.privateemail.com (Postfix) with ESMTPS id 1C4E3A6F;
 Mon,  7 Sep 2020 01:12:55 +0000 (UTC)
Received: from MTA-07.privateemail.com (localhost [127.0.0.1])
 by MTA-07.privateemail.com (Postfix) with ESMTP id 63BEB60049;
 Sun,  6 Sep 2020 21:12:54 -0400 (EDT)
Received: from localhost (unknown [10.20.151.224])
 by MTA-07.privateemail.com (Postfix) with ESMTPA id 1F85560046;
 Mon,  7 Sep 2020 01:12:54 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Subject: Re: [PATCH v3 4/6] powerpc: Introduce temporary mm
From: "Christopher M. Riedl" <cmr@codefail.de>
To: "Jann Horn" <jannh@google.com>
Date: Sun, 06 Sep 2020 19:15:02 -0500
Message-Id: <C5GPCGQNRBQ2.8LRBQFQQ8QRK@geist>
In-Reply-To: <CAG48ez1W7FcDPAnqQ7TpSnKy--vaQm_f5prsZXRxcybzGg0tpg@mail.gmail.com>
X-Virus-Scanned: ClamAV using ClamSMTP
X-Originating-IP: 198.54.122.47
X-SpamExperts-Domain: o3.privateemail.com
X-SpamExperts-Username: out-03
Authentication-Results: registrar-servers.com;
 auth=pass (plain) smtp.auth=out-03@o3.privateemail.com
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: Combined (0.02)
X-Recommended-Action: accept
X-Filter-ID: Mvzo4OR0dZXEDF/gcnlw0VKALJWqpbz84ezJUOplsTqpSDasLI4SayDByyq9LIhVViWPu4qwxrHG
 on7QCRBH60TNWdUk1Ol2OGx3IfrIJKyP9eGNFz9TW9u+Jt8z2T3K0kAEPCk9rIF2PFRPd9oD/+mU
 epBsntXvmzMKp70qHIVy06HjBCNevvMk3/tz3RhKppPDurF249hEi/hXuZV0Bfydg2dPJIOdvML0
 pmuMjL+sSRVE/Yi9caFO9s+hJUIag7Mr+LdmEPMuzjcDLgIpUp4KqOh03z3Jnl1IbrFC3WxWd62Q
 4tf7w1n56gL5R3iTitzRVjQKpyyasW/cnw+IYZ3P7SXZfF/PMa7BKaW4aUHy0JCEIEBpwRrTof3G
 nw4dOSMe/wvVcKjx/+UKUJ2dAQHXl4wgwTqJlTT/fetzilMGV02hzj+6Clu59u5sr7HikapUBPW9
 YV4SESdWyVtFdVGH7sydZvDt9c5R0PA8ODZs3zuom9668jgWRpPOjHntXKEKMgzNLgjKsVkPoQlW
 r+vjEfTaJe0WbjDSwI4VsDh/Ak5UMKR5Jabn4uqWeMpVV+j5NTNoBBmpJESzDIAZD+ijHBtexFH6
 /O9QemIWoIxJHU2xvEqMW59RROlnpVhs3WYdNxMU6g6rgAqTbJg65XJ7Wcw/vHrkNz0yR/nxmRhz
 HDeqqFz43py4SDhdaHkWfNr5H/lmx0CkCS1/c0I+vQBJgDK7W7IEgz6hLB4NE7r4xc7DI5pUcvgC
 2qkeP00Sk+1FWQ+vJ8qzoMDtBircbZyj4Vr2fJau/pSKTnHZpmzev7R5gLj25cxY39MfuDbvaQ11
 y3lWUHxy16UznfzqmjgtcanFiK6d7wZEdGX/n8cTMXL2ASzO2/x/FXAqsRfgwBXfs6ClNsb8ml4Z
 rgPQJkxUuqZsyTFf9tJdo1NX/ThvA3QEKTMFvUWB5kl7tpOKiZ05cqMnXxzdxIfkHhcHe2JzRhXU
 TdwrTzwY0h5CMWU4m+NxLqLodZwv2BZA26yO5xS/zVfrqzZpLvpYwP30rKEsmgNU80KTDQcWwe0S
 4mBBUkQTxmW44eWEf55rQAvvoiIOeoh24KMUdfqAzhfhkHj0OOJajA6cq8jxoXiPMC6r+737L3jx
 JfXzftJwbfbaqDNKToL2xQmqr15vNQO8SQ==
X-Report-Abuse-To: spam@se5.registrar-servers.com
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
Cc: linuxppc-dev@lists.ozlabs.org,
 Kernel Hardening <kernel-hardening@lists.openwall.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu Aug 27, 2020 at 11:15 AM CDT, Jann Horn wrote:
> On Thu, Aug 27, 2020 at 7:24 AM Christopher M. Riedl <cmr@codefail.de>
> wrote:
> > x86 supports the notion of a temporary mm which restricts access to
> > temporary PTEs to a single CPU. A temporary mm is useful for situations
> > where a CPU needs to perform sensitive operations (such as patching a
> > STRICT_KERNEL_RWX kernel) requiring temporary mappings without exposing
> > said mappings to other CPUs. A side benefit is that other CPU TLBs do
> > not need to be flushed when the temporary mm is torn down.
> >
> > Mappings in the temporary mm can be set in the userspace portion of the
> > address-space.
> [...]
> > diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-p=
atching.c
> [...]
> > @@ -44,6 +45,70 @@ int raw_patch_instruction(struct ppc_inst *addr, str=
uct ppc_inst instr)
> >  }
> >
> >  #ifdef CONFIG_STRICT_KERNEL_RWX
> > +
> > +struct temp_mm {
> > +       struct mm_struct *temp;
> > +       struct mm_struct *prev;
> > +       bool is_kernel_thread;
> > +       struct arch_hw_breakpoint brk[HBP_NUM_MAX];
> > +};
> > +
> > +static inline void init_temp_mm(struct temp_mm *temp_mm, struct mm_str=
uct *mm)
> > +{
> > +       temp_mm->temp =3D mm;
> > +       temp_mm->prev =3D NULL;
> > +       temp_mm->is_kernel_thread =3D false;
> > +       memset(&temp_mm->brk, 0, sizeof(temp_mm->brk));
> > +}
> > +
> > +static inline void use_temporary_mm(struct temp_mm *temp_mm)
> > +{
> > +       lockdep_assert_irqs_disabled();
> > +
> > +       temp_mm->is_kernel_thread =3D current->mm =3D=3D NULL;
>
> (That's a somewhat misleading variable name - kernel threads can have
> a non-NULL ->mm, too.)
>

Oh I didn't know that, in that case yes this is not a good name. I am
considering some changes (based on your comments about current->mm
below) which would make this variable superfluous.

> > +       if (temp_mm->is_kernel_thread)
> > +               temp_mm->prev =3D current->active_mm;
> > +       else
> > +               temp_mm->prev =3D current->mm;
>
> Why the branch? Shouldn't current->active_mm work in both cases?
>
>

Yes you are correct.

> > +       /*
> > +        * Hash requires a non-NULL current->mm to allocate a userspace=
 address
> > +        * when handling a page fault. Does not appear to hurt in Radix=
 either.
> > +        */
> > +       current->mm =3D temp_mm->temp;
>
> This looks dangerous to me. There are various places that attempt to
> find all userspace tasks that use a given mm by iterating through all
> tasks on the system and comparing each task's ->mm pointer to
> current's. Things like current_is_single_threaded() as part of various
> security checks, mm_update_next_owner(), zap_threads(), and so on. So
> if this is reachable from userspace task context (which I think it
> is?), I don't think we're allowed to switch out the ->mm pointer here.
>
>

Thanks for pointing this out! I took a step back and looked at this
again in more detail. The only reason for reassigning the ->mm pointer
is that when patching we need to hash the page and allocate an SLB=20
entry w/ the hash MMU. That codepath includes a check to ensure that
->mm is not NULL. Overwriting ->mm temporarily and restoring it is
pretty crappy in retrospect. I _think_ a better approach is to just call
the hashing and allocate SLB functions from `map_patch` directly - this
both removes the need to overwrite ->mm (since the functions take an mm
parameter) and it avoids taking two exceptions when doing the actual
patching.

This works fine on Power9 and a Power8 at least but needs some testing
on PPC32 before I can send a v4.

> > +       switch_mm_irqs_off(NULL, temp_mm->temp, current);
>
> switch_mm_irqs_off() calls switch_mmu_context(), which in the nohash
> implementation increments next->context.active and decrements
> prev->context.active if prev is non-NULL, right? So this would
> increase temp_mm->temp->context.active...
>
> > +       if (ppc_breakpoint_available()) {
> > +               struct arch_hw_breakpoint null_brk =3D {0};
> > +               int i =3D 0;
> > +
> > +               for (; i < nr_wp_slots(); ++i) {
> > +                       __get_breakpoint(i, &temp_mm->brk[i]);
> > +                       if (temp_mm->brk[i].type !=3D 0)
> > +                               __set_breakpoint(i, &null_brk);
> > +               }
> > +       }
> > +}
> > +
> > +static inline void unuse_temporary_mm(struct temp_mm *temp_mm)
> > +{
> > +       lockdep_assert_irqs_disabled();
> > +
> > +       if (temp_mm->is_kernel_thread)
> > +               current->mm =3D NULL;
> > +       else
> > +               current->mm =3D temp_mm->prev;
> > +       switch_mm_irqs_off(NULL, temp_mm->prev, current);
>
> ... whereas this would increase temp_mm->prev->context.active. As far
> as I can tell, that'll mean that both the original mm and the patching
> mm will have their .active counts permanently too high after
> use_temporary_mm()+unuse_temporary_mm()?
>

Yes you are correct. Hmm, I can't immediately recall why prev=3DNULL here,
and I can't find anything in the various powerpc
switch_mm_irqs_off/switch_mmu_context implementations that would break
by setting prev=3Dactual previous mm here. I will fix this for v4. Thanks!

> > +       if (ppc_breakpoint_available()) {
> > +               int i =3D 0;
> > +
> > +               for (; i < nr_wp_slots(); ++i)
> > +                       if (temp_mm->brk[i].type !=3D 0)
> > +                               __set_breakpoint(i, &temp_mm->brk[i]);
> > +       }
> > +}

