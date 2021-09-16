Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D05EA40D0CA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Sep 2021 02:23:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H8yVp2mlYz30KC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Sep 2021 10:23:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bluescreens.de (client-ip=2001:67c:2050::465:103;
 helo=mout-p-103.mailbox.org; envelope-from=cmr@bluescreens.de;
 receiver=<UNKNOWN>)
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org
 [IPv6:2001:67c:2050::465:103])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H8yVM3N4Hz2yJ5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Sep 2021 10:23:20 +1000 (AEST)
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:4:0])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4H8yV572d8zQjld;
 Thu, 16 Sep 2021 02:23:09 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Subject: Re: [PATCH v6 1/4] powerpc/64s: Introduce temporary mm for Radix MMU
From: "Christopher M. Riedl" <cmr@bluescreens.de>
To: "Jordan Niethe" <jniethe5@gmail.com>
Date: Wed, 15 Sep 2021 19:24:12 -0500
Message-Id: <CEAVR8LKNP66.HVO0DKKWEHOE@wrwlf0000>
In-Reply-To: <CACzsE9rThU0JBACJoeeHOyEOA8CbFwRExrOhTsySaOH44yJa6g@mail.gmail.com>
X-Rspamd-Queue-Id: C4D8B26A
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-hardening@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat Sep 11, 2021 at 3:26 AM CDT, Jordan Niethe wrote:
> On Sat, Sep 11, 2021 at 12:35 PM Christopher M. Riedl
> <cmr@bluescreens.de> wrote:
> >
> > x86 supports the notion of a temporary mm which restricts access to
> > temporary PTEs to a single CPU. A temporary mm is useful for situations
> > where a CPU needs to perform sensitive operations (such as patching a
> > STRICT_KERNEL_RWX kernel) requiring temporary mappings without exposing
> > said mappings to other CPUs. Another benefit is that other CPU TLBs do
> > not need to be flushed when the temporary mm is torn down.
> >
> > Mappings in the temporary mm can be set in the userspace portion of the
> > address-space.
> >
> > Interrupts must be disabled while the temporary mm is in use. HW
> > breakpoints, which may have been set by userspace as watchpoints on
> > addresses now within the temporary mm, are saved and disabled when
> > loading the temporary mm. The HW breakpoints are restored when unloadin=
g
> > the temporary mm. All HW breakpoints are indiscriminately disabled whil=
e
> > the temporary mm is in use - this may include breakpoints set by perf.
>
> I had thought CPUs with a DAWR might not need to do this because the
> privilege level that breakpoints trigger on can be configured. But it
> turns out in ptrace, etc we use HW_BRK_TYPE_PRIV_ALL.

Thanks for double checking :)

>
> >
> > Based on x86 implementation:
> >
> > commit cefa929c034e
> > ("x86/mm: Introduce temporary mm structs")
> >
> > Signed-off-by: Christopher M. Riedl <cmr@bluescreens.de>
> >
> > ---
> >
> > v6:  * Use {start,stop}_using_temporary_mm() instead of
> >        {use,unuse}_temporary_mm() as suggested by Christophe.
> >
> > v5:  * Drop support for using a temporary mm on Book3s64 Hash MMU.
> >
> > v4:  * Pass the prev mm instead of NULL to switch_mm_irqs_off() when
> >        using/unusing the temp mm as suggested by Jann Horn to keep
> >        the context.active counter in-sync on mm/nohash.
> >      * Disable SLB preload in the temporary mm when initializing the
> >        temp_mm struct.
> >      * Include asm/debug.h header to fix build issue with
> >        ppc44x_defconfig.
> > ---
> >  arch/powerpc/include/asm/debug.h |  1 +
> >  arch/powerpc/kernel/process.c    |  5 +++
> >  arch/powerpc/lib/code-patching.c | 56 ++++++++++++++++++++++++++++++++
> >  3 files changed, 62 insertions(+)
> >
> > diff --git a/arch/powerpc/include/asm/debug.h b/arch/powerpc/include/as=
m/debug.h
> > index 86a14736c76c..dfd82635ea8b 100644
> > --- a/arch/powerpc/include/asm/debug.h
> > +++ b/arch/powerpc/include/asm/debug.h
> > @@ -46,6 +46,7 @@ static inline int debugger_fault_handler(struct pt_re=
gs *regs) { return 0; }
> >  #endif
> >
> >  void __set_breakpoint(int nr, struct arch_hw_breakpoint *brk);
> > +void __get_breakpoint(int nr, struct arch_hw_breakpoint *brk);
> >  bool ppc_breakpoint_available(void);
> >  #ifdef CONFIG_PPC_ADV_DEBUG_REGS
> >  extern void do_send_trap(struct pt_regs *regs, unsigned long address,
> > diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/proces=
s.c
> > index 50436b52c213..6aa1f5c4d520 100644
> > --- a/arch/powerpc/kernel/process.c
> > +++ b/arch/powerpc/kernel/process.c
> > @@ -865,6 +865,11 @@ static inline int set_breakpoint_8xx(struct arch_h=
w_breakpoint *brk)
> >         return 0;
> >  }
> >
> > +void __get_breakpoint(int nr, struct arch_hw_breakpoint *brk)
> > +{
> > +       memcpy(brk, this_cpu_ptr(&current_brk[nr]), sizeof(*brk));
> > +}
>
> The breakpoint code is already a little hard to follow. I'm worried
> doing this might spread breakpoint handling into more places in the
> future.
> What about something like having a breakpoint_pause() function which
> clears the hardware registers only and then a breakpoint_resume()
> function that copies from current_brk[] back to the hardware
> registers?
> Then we don't have to make another copy of the breakpoint state.

I think that sounds reasonable - I'll add those functions instead with
the next spin.

>
> > +
> >  void __set_breakpoint(int nr, struct arch_hw_breakpoint *brk)
> >  {
> >         memcpy(this_cpu_ptr(&current_brk[nr]), brk, sizeof(*brk));
> > diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-p=
atching.c
> > index f9a3019e37b4..8d61a7d35b89 100644
> > --- a/arch/powerpc/lib/code-patching.c
> > +++ b/arch/powerpc/lib/code-patching.c
>
> Sorry I might have missed it, but what was the reason for not putting
> this stuff in mmu_context.h?

x86 ended up moving this code into their code-patching file as well. I
suppose nobody has thought of another use for a temporary mm like this
yet :)

>
> > @@ -17,6 +17,9 @@
> >  #include <asm/code-patching.h>
> >  #include <asm/setup.h>
> >  #include <asm/inst.h>
> > +#include <asm/mmu_context.h>
> > +#include <asm/debug.h>
> > +#include <asm/tlb.h>
> >
> >  static int __patch_instruction(u32 *exec_addr, struct ppc_inst instr, =
u32 *patch_addr)
> >  {
> > @@ -45,6 +48,59 @@ int raw_patch_instruction(u32 *addr, struct ppc_inst=
 instr)
> >  }
> >
> >  #ifdef CONFIG_STRICT_KERNEL_RWX
> > +
> > +struct temp_mm {
> > +       struct mm_struct *temp;
> > +       struct mm_struct *prev;
> > +       struct arch_hw_breakpoint brk[HBP_NUM_MAX];
> ^ Then we wouldn't need this.
> > +};
> > +
> > +static inline void init_temp_mm(struct temp_mm *temp_mm, struct mm_str=
uct *mm)
> > +{
> > +       /* We currently only support temporary mm on the Book3s64 Radix=
 MMU */
> > +       WARN_ON(!radix_enabled());
> > +
> > +       temp_mm->temp =3D mm;
> > +       temp_mm->prev =3D NULL;
> > +       memset(&temp_mm->brk, 0, sizeof(temp_mm->brk));
> > +}
> > +
> > +static inline void start_using_temporary_mm(struct temp_mm *temp_mm)
> > +{
> > +       lockdep_assert_irqs_disabled();
> > +
> > +       temp_mm->prev =3D current->active_mm;
> > +       switch_mm_irqs_off(temp_mm->prev, temp_mm->temp, current);
>
> Now that we only support radix it should be fine again to have it like
> this:
> switch_mm_irqs_off(NULL, temp_mm->temp, current);?
> It was changed from that because it would cause issues on nohash I
> thought.

That's true - but if we want to support the other MMUs in the future
I'd rather just keep it as-is. AFAICS there's no harm in passing
temp_mm->prev here instead of NULL.

>
> > +
> > +       WARN_ON(!mm_is_thread_local(temp_mm->temp));
> > +
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
> > +static inline void stop_using_temporary_mm(struct temp_mm *temp_mm)
> > +{
> > +       lockdep_assert_irqs_disabled();
> > +
> > +       switch_mm_irqs_off(temp_mm->temp, temp_mm->prev, current);
> > +
> > +       if (ppc_breakpoint_available()) {
> > +               int i =3D 0;
> > +
> > +               for (; i < nr_wp_slots(); ++i)
> > +                       if (temp_mm->brk[i].type !=3D 0)
> > +                               __set_breakpoint(i, &temp_mm->brk[i]);
> > +       }
> > +}
> > +
> >  static DEFINE_PER_CPU(struct vm_struct *, text_poke_area);
> >
> >  static int text_area_cpu_up(unsigned int cpu)
> > --
> > 2.32.0
> >
> Thanks,
> Jordan

