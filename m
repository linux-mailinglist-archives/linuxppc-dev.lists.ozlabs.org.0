Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6729F2E882C
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Jan 2021 18:56:10 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D7V1f6Lj8zDqvT
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 Jan 2021 04:56:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D7TyP2JvszDqtj
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  3 Jan 2021 04:53:05 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4D7Ty15p1rz9vBmm;
 Sat,  2 Jan 2021 18:52:57 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id BC0wL56FylRY; Sat,  2 Jan 2021 18:52:57 +0100 (CET)
Received: from vm-hermes.si.c-s.fr (vm-hermes.si.c-s.fr [192.168.25.253])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4D7Ty14CbZz9vBml;
 Sat,  2 Jan 2021 18:52:57 +0100 (CET)
Received: by vm-hermes.si.c-s.fr (Postfix, from userid 33)
 id 40671656; Sat,  2 Jan 2021 18:56:30 +0100 (CET)
Received: from 37.171.162.12 ([37.171.162.12]) by messagerie.c-s.fr (Horde
 Framework) with HTTP; Sat, 02 Jan 2021 18:56:30 +0100
Date: Sat, 02 Jan 2021 18:56:30 +0100
Message-ID: <20210102185630.Horde.GwG0xTTuKDzS6PsMZTUftw1@messagerie.c-s.fr>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v4 02/21] powerpc/64s: move the last of the page fault
 handling logic to C
References: <20210102122508.1950592-1-npiggin@gmail.com>
 <20210102122508.1950592-3-npiggin@gmail.com>
In-Reply-To: <20210102122508.1950592-3-npiggin@gmail.com>
User-Agent: Internet Messaging Program (IMP) H5 (6.2.3)
Content-Type: text/plain; charset=UTF-8; format=flowed; DelSp=Yes
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> a =C3=A9crit=C2=A0:

> The page fault handling still has some complex logic particularly around
> hash table handling, in asm. Implement this in C instead.

Hi,

I'm afk at the moment and unable to look at this in details before one=20=
=20
week=20but this looks pretty complexe, especially the churn around=20=20
___do_page_fault
Do=20we really need 3 layers of do_page_fault() ?

I think it would likely be more straight forward to just move=20=20
handle_page_fault()=20to C.

There also seems to be some unrelated changes, like the (msr & MSR_PR)=20=
=20
changed=20to user_mode(regs).

Christophe


>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  arch/powerpc/include/asm/book3s/64/mmu-hash.h |   1 +
>  arch/powerpc/kernel/exceptions-64s.S          | 131 +++---------------
>  arch/powerpc/mm/book3s64/hash_utils.c         |  77 ++++++----
>  arch/powerpc/mm/fault.c                       |  59 ++++++--
>  4 files changed, 119 insertions(+), 149 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/book3s/64/mmu-hash.h=20=20
>=20b/arch/powerpc/include/asm/book3s/64/mmu-hash.h
> index 066b1d34c7bc..60a669379aa0 100644
> --- a/arch/powerpc/include/asm/book3s/64/mmu-hash.h
> +++ b/arch/powerpc/include/asm/book3s/64/mmu-hash.h
> @@ -454,6 +454,7 @@ static inline unsigned long hpt_hash(unsigned long vp=
n,
>  #define HPTE_NOHPTE_UPDATE	0x2
>  #define HPTE_USE_KERNEL_KEY	0x4
>
> +int do_hash_fault(struct pt_regs *regs, unsigned long ea, unsigned=20=20
>=20long dsisr);
>  extern int __hash_page_4K(unsigned long ea, unsigned long access,
>  			  unsigned long vsid, pte_t *ptep, unsigned long trap,
>  			  unsigned long flags, int ssize, int subpage_prot);
> diff --git a/arch/powerpc/kernel/exceptions-64s.S=20=20
>=20b/arch/powerpc/kernel/exceptions-64s.S
> index e02ad6fefa46..bda91c79b261 100644
> --- a/arch/powerpc/kernel/exceptions-64s.S
> +++ b/arch/powerpc/kernel/exceptions-64s.S
> @@ -1401,14 +1401,15 @@ END_FTR_SECTION_IFSET(CPU_FTR_HVMODE)
>   *
>   * Handling:
>   * - Hash MMU
> - *   Go to do_hash_page first to see if the HPT can be filled from=20=20
>=20an entry in
> - *   the Linux page table. Hash faults can hit in kernel mode in a fairl=
y
> + *   Go to do_hash_fault, which attempts to fill the HPT from an=20=20
>=20entry in the
> + *   Linux page table. Hash faults can hit in kernel mode in a fairly
>   *   arbitrary state (e.g., interrupts disabled, locks held) when access=
ing
>   *   "non-bolted" regions, e.g., vmalloc space. However these=20=20
>=20should always be
> - *   backed by Linux page tables.
> + *   backed by Linux page table entries.
>   *
> - *   If none is found, do a Linux page fault. Linux page faults can=20=
=20
>=20happen in
> - *   kernel mode due to user copy operations of course.
> + *   If no entry is found the Linux page fault handler is invoked (by
> + *   do_hash_fault). Linux page faults can happen in kernel mode due to =
user
> + *   copy operations of course.
>   *
>   *   KVM: The KVM HDSI handler may perform a load with MSR[DR]=3D1 in gu=
est
>   *   MMU context, which may cause a DSI in the host, which must go to th=
e
> @@ -1439,13 +1440,17 @@ EXC_COMMON_BEGIN(data_access_common)
>  	GEN_COMMON data_access
>  	ld	r4,_DAR(r1)
>  	ld	r5,_DSISR(r1)
> +	addi	r3,r1,STACK_FRAME_OVERHEAD
>  BEGIN_MMU_FTR_SECTION
> -	ld	r6,_MSR(r1)
> -	li	r3,0x300
> -	b	do_hash_page		/* Try to handle as hpte fault */
> +	bl	do_hash_fault
>  MMU_FTR_SECTION_ELSE
> -	b	handle_page_fault
> +	bl	do_page_fault
>  ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
> +        cmpdi	r3,0
> +	beq+	interrupt_return
> +	/* We need to restore NVGPRS */
> +	REST_NVGPRS(r1)
> +	b       interrupt_return
>
>  	GEN_KVM data_access
>
> @@ -1540,13 +1545,17 @@ EXC_COMMON_BEGIN(instruction_access_common)
>  	GEN_COMMON instruction_access
>  	ld	r4,_DAR(r1)
>  	ld	r5,_DSISR(r1)
> +	addi	r3,r1,STACK_FRAME_OVERHEAD
>  BEGIN_MMU_FTR_SECTION
> -	ld      r6,_MSR(r1)
> -	li	r3,0x400
> -	b	do_hash_page		/* Try to handle as hpte fault */
> +	bl	do_hash_fault
>  MMU_FTR_SECTION_ELSE
> -	b	handle_page_fault
> +	bl	do_page_fault
>  ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
> +        cmpdi	r3,0
> +	beq+	interrupt_return
> +	/* We need to restore NVGPRS */
> +	REST_NVGPRS(r1)
> +	b       interrupt_return
>
>  	GEN_KVM instruction_access
>
> @@ -3202,99 +3211,3 @@ disable_machine_check:
>  	RFI_TO_KERNEL
>  1:	mtlr	r0
>  	blr
> -
> -/*
> - * Hash table stuff
> - */
> -	.balign	IFETCH_ALIGN_BYTES
> -do_hash_page:
> -#ifdef CONFIG_PPC_BOOK3S_64
> -	lis	r0,(DSISR_BAD_FAULT_64S | DSISR_DABRMATCH | DSISR_KEYFAULT)@h
> -	ori	r0,r0,DSISR_BAD_FAULT_64S@l
> -	and.	r0,r5,r0		/* weird error? */
> -	bne-	handle_page_fault	/* if not, try to insert a HPTE */
> -
> -	/*
> -	 * If we are in an "NMI" (e.g., an interrupt when soft-disabled), then
> -	 * don't call hash_page, just fail the fault. This is required to
> -	 * prevent re-entrancy problems in the hash code, namely perf
> -	 * interrupts hitting while something holds H_PAGE_BUSY, and taking a
> -	 * hash fault. See the comment in hash_preload().
> -	 */
> -	ld	r11, PACA_THREAD_INFO(r13)
> -	lwz	r0,TI_PREEMPT(r11)
> -	andis.	r0,r0,NMI_MASK@h
> -	bne	77f
> -
> -	/*
> -	 * r3 contains the trap number
> -	 * r4 contains the faulting address
> -	 * r5 contains dsisr
> -	 * r6 msr
> -	 *
> -	 * at return r3 =3D 0 for success, 1 for page fault, negative for error
> -	 */
> -	bl	__hash_page		/* build HPTE if possible */
> -        cmpdi	r3,0			/* see if __hash_page succeeded */
> -
> -	/* Success */
> -	beq	interrupt_return	/* Return from exception on success */
> -
> -	/* Error */
> -	blt-	13f
> -
> -	/* Reload DAR/DSISR into r4/r5 for the DABR check below */
> -	ld	r4,_DAR(r1)
> -	ld      r5,_DSISR(r1)
> -#endif /* CONFIG_PPC_BOOK3S_64 */
> -
> -/* Here we have a page fault that hash_page can't handle. */
> -handle_page_fault:
> -11:	andis.  r0,r5,DSISR_DABRMATCH@h
> -	bne-    handle_dabr_fault
> -	addi	r3,r1,STACK_FRAME_OVERHEAD
> -	bl	do_page_fault
> -	cmpdi	r3,0
> -	beq+	interrupt_return
> -	mr	r5,r3
> -	addi	r3,r1,STACK_FRAME_OVERHEAD
> -	ld	r4,_DAR(r1)
> -	bl	__bad_page_fault
> -	b	interrupt_return
> -
> -/* We have a data breakpoint exception - handle it */
> -handle_dabr_fault:
> -	ld      r4,_DAR(r1)
> -	ld      r5,_DSISR(r1)
> -	addi    r3,r1,STACK_FRAME_OVERHEAD
> -	bl      do_break
> -	/*
> -	 * do_break() may have changed the NV GPRS while handling a breakpoint.
> -	 * If so, we need to restore them with their updated values.
> -	 */
> -	REST_NVGPRS(r1)
> -	b       interrupt_return
> -
> -
> -#ifdef CONFIG_PPC_BOOK3S_64
> -/* We have a page fault that hash_page could handle but HV refused
> - * the PTE insertion
> - */
> -13:	mr	r5,r3
> -	addi	r3,r1,STACK_FRAME_OVERHEAD
> -	ld	r4,_DAR(r1)
> -	bl	low_hash_fault
> -	b	interrupt_return
> -#endif
> -
> -/*
> - * We come here as a result of a DSI at a point where we don't want
> - * to call hash_page, such as when we are accessing memory (possibly
> - * user memory) inside a PMU interrupt that occurred while interrupts
> - * were soft-disabled.  We want to invoke the exception handler for
> - * the access, or panic if there isn't a handler.
> - */
> -77:	addi	r3,r1,STACK_FRAME_OVERHEAD
> -	li	r5,SIGSEGV
> -	bl	bad_page_fault
> -	b	interrupt_return
> diff --git a/arch/powerpc/mm/book3s64/hash_utils.c=20=20
>=20b/arch/powerpc/mm/book3s64/hash_utils.c
> index 73b06adb6eeb..5a61182ddf75 100644
> --- a/arch/powerpc/mm/book3s64/hash_utils.c
> +++ b/arch/powerpc/mm/book3s64/hash_utils.c
> @@ -1512,16 +1512,40 @@ int hash_page(unsigned long ea, unsigned=20=20
>=20long access, unsigned long trap,
>  }
>  EXPORT_SYMBOL_GPL(hash_page);
>
> -int __hash_page(unsigned long trap, unsigned long ea, unsigned long dsis=
r,
> -		unsigned long msr)
> +int do_hash_fault(struct pt_regs *regs, unsigned long ea, unsigned=20=20
>=20long dsisr)
>  {
>  	unsigned long access =3D _PAGE_PRESENT | _PAGE_READ;
>  	unsigned long flags =3D 0;
> -	struct mm_struct *mm =3D current->mm;
> -	unsigned int region_id =3D get_region_id(ea);
> +	struct mm_struct *mm;
> +	unsigned int region_id;
> +	int err;
> +
> +	if (unlikely(dsisr & (DSISR_BAD_FAULT_64S | DSISR_DABRMATCH |=20=20
>=20DSISR_KEYFAULT)))
> +		goto page_fault;
> +
> +	/*
> +	 * If we are in an "NMI" (e.g., an interrupt when soft-disabled), then
> +	 * don't call hash_page, just fail the fault. This is required to
> +	 * prevent re-entrancy problems in the hash code, namely perf
> +	 * interrupts hitting while something holds H_PAGE_BUSY, and taking a
> +	 * hash fault. See the comment in hash_preload().
> +	 *
> +	 * We come here as a result of a DSI at a point where we don't want
> +	 * to call hash_page, such as when we are accessing memory (possibly
> +	 * user memory) inside a PMU interrupt that occurred while interrupts
> +	 * were soft-disabled.  We want to invoke the exception handler for
> +	 * the access, or panic if there isn't a handler.
> +	 */
> +	if (unlikely(in_nmi())) {
> +		bad_page_fault(regs, ea, SIGSEGV);
> +		return 0;
> +	}
>
> +	region_id =3D get_region_id(ea);
>  	if ((region_id =3D=3D VMALLOC_REGION_ID) || (region_id =3D=3D IO_REGION=
_ID))
>  		mm =3D &init_mm;
> +	else
> +		mm =3D current->mm;
>
>  	if (dsisr & DSISR_NOHPTE)
>  		flags |=3D HPTE_NOHPTE_UPDATE;
> @@ -1537,13 +1561,31 @@ int __hash_page(unsigned long trap, unsigned=20=
=20
>=20long ea, unsigned long dsisr,
>  	 * 2) user space access kernel space.
>  	 */
>  	access |=3D _PAGE_PRIVILEGED;
> -	if ((msr & MSR_PR) || (region_id =3D=3D USER_REGION_ID))
> +	if (user_mode(regs) || (region_id =3D=3D USER_REGION_ID))
>  		access &=3D ~_PAGE_PRIVILEGED;
>
> -	if (trap =3D=3D 0x400)
> +	if (regs->trap =3D=3D 0x400)
>  		access |=3D _PAGE_EXEC;
>
> -	return hash_page_mm(mm, ea, access, trap, flags);
> +	err =3D hash_page_mm(mm, ea, access, regs->trap, flags);
> +	if (unlikely(err < 0)) {
> +		// failed to instert a hash PTE due to an hypervisor error
> +		if (user_mode(regs)) {
> +			if (IS_ENABLED(CONFIG_PPC_SUBPAGE_PROT) && err =3D=3D -2)
> +				_exception(SIGSEGV, regs, SEGV_ACCERR, ea);
> +			else
> +				_exception(SIGBUS, regs, BUS_ADRERR, ea);
> +		} else {
> +			bad_page_fault(regs, ea, SIGBUS);
> +		}
> +		err =3D 0;
> +
> +	} else if (err) {
> +page_fault:
> +		err =3D do_page_fault(regs, ea, dsisr);
> +	}
> +
> +	return err;
>  }
>
>  #ifdef CONFIG_PPC_MM_SLICES
> @@ -1843,27 +1885,6 @@ void flush_hash_range(unsigned long number, int lo=
cal)
>  	}
>  }
>
> -/*
> - * low_hash_fault is called when we the low level hash code failed
> - * to instert a PTE due to an hypervisor error
> - */
> -void low_hash_fault(struct pt_regs *regs, unsigned long address, int rc)
> -{
> -	enum ctx_state prev_state =3D exception_enter();
> -
> -	if (user_mode(regs)) {
> -#ifdef CONFIG_PPC_SUBPAGE_PROT
> -		if (rc =3D=3D -2)
> -			_exception(SIGSEGV, regs, SEGV_ACCERR, address);
> -		else
> -#endif
> -			_exception(SIGBUS, regs, BUS_ADRERR, address);
> -	} else
> -		bad_page_fault(regs, address, SIGBUS);
> -
> -	exception_exit(prev_state);
> -}
> -
>  long hpte_insert_repeating(unsigned long hash, unsigned long vpn,
>  			   unsigned long pa, unsigned long rflags,
>  			   unsigned long vflags, int psize, int ssize)
> diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
> index 8961b44f350c..6af4516d1c50 100644
> --- a/arch/powerpc/mm/fault.c
> +++ b/arch/powerpc/mm/fault.c
> @@ -369,7 +369,9 @@ static void sanity_check_fault(bool is_write,=20=20
>=20bool is_user,
>  #define page_fault_is_bad(__err)	(0)
>  #elif defined(CONFIG_PPC_8xx)
>  #define page_fault_is_bad(__err)	((__err) & DSISR_NOEXEC_OR_G)
> -#elif defined(CONFIG_PPC64)
> +#elif defined(CONFIG_PPC_BOOK3S_64)
> +#define page_fault_is_bad(__err)	((__err) & (DSISR_BAD_FAULT_64S |=20=20
>=20DSISR_DABRMATCH))
> +#elif defined(CONFIG_PPC_BOOK3E_64)
>  #define page_fault_is_bad(__err)	((__err) & DSISR_BAD_FAULT_64S)
>  #else
>  #define page_fault_is_bad(__err)	((__err) & DSISR_BAD_FAULT_32S)
> @@ -388,7 +390,7 @@ static void sanity_check_fault(bool is_write,=20=20
>=20bool is_user,
>   * The return value is 0 if the fault was handled, or the signal
>   * number if this is a kernel fault that can't be handled here.
>   */
> -static int __do_page_fault(struct pt_regs *regs, unsigned long address,
> +static int ___do_page_fault(struct pt_regs *regs, unsigned long address,
>  			   unsigned long error_code)
>  {
>  	struct vm_area_struct * vma;
> @@ -404,6 +406,9 @@ static int __do_page_fault(struct pt_regs *regs,=20=
=20
>=20unsigned long address,
>  		return 0;
>
>  	if (unlikely(page_fault_is_bad(error_code))) {
> +		if (IS_ENABLED(CONFIG_PPC_BOOK3S_64) && (error_code & DSISR_DABRMATCH)=
)
> +			return -1;
> +
>  		if (is_user) {
>  			_exception(SIGBUS, regs, BUS_OBJERR, address);
>  			return 0;
> @@ -540,25 +545,55 @@ static int __do_page_fault(struct pt_regs=20=20
>=20*regs, unsigned long address,
>
>  	return 0;
>  }
> +NOKPROBE_SYMBOL(___do_page_fault);
> +
> +static int __do_page_fault(struct pt_regs *regs, unsigned long address,
> +		  unsigned long error_code)
> +{
> +	int err;
> +
> +	err =3D ___do_page_fault(regs, address, error_code);
> +	if (unlikely(err)) {
> +		const struct exception_table_entry *entry;
> +
> +		entry =3D search_exception_tables(regs->nip);
> +		if (likely(entry)) {
> +			instruction_pointer_set(regs, extable_fixup(entry));
> +			err =3D 0;
> +		}
> +	}
> +
> +#ifdef CONFIG_PPC_BOOK3S_64
> +	/* 32 and 64e handle these errors in asm */
> +	if (unlikely(err)) {
> +		if (err > 0) {
> +			__bad_page_fault(regs, address, err);
> +			err =3D 0;
> +		} else {
> +			/*
> +			 * do_break() may change NV GPRS while handling the
> +			 * breakpoint. Return -ve to caller to do that.
> +			 */
> +			do_break(regs, address, error_code);
> +		}
> +	}
> +#endif
> +
> +	return err;
> +}
>  NOKPROBE_SYMBOL(__do_page_fault);
>
>  int do_page_fault(struct pt_regs *regs, unsigned long address,
>  		  unsigned long error_code)
>  {
> -	const struct exception_table_entry *entry;
>  	enum ctx_state prev_state =3D exception_enter();
> -	int rc =3D __do_page_fault(regs, address, error_code);
> -	exception_exit(prev_state);
> -	if (likely(!rc))
> -		return 0;
> +	int err;
>
> -	entry =3D search_exception_tables(regs->nip);
> -	if (unlikely(!entry))
> -		return rc;
> +	err =3D __do_page_fault(regs, address, error_code);
>
> -	instruction_pointer_set(regs, extable_fixup(entry));
> +	exception_exit(prev_state);
>
> -	return 0;
> +	return err;
>  }
>  NOKPROBE_SYMBOL(do_page_fault);
>
> --
> 2.23.0


