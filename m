Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D74B21EFE25
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Jun 2020 18:40:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49dpKT0HJbzDr2p
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Jun 2020 02:40:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49dpHX2RBCzDqCH
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Jun 2020 02:38:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=IzFlmfUq; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49dpHL5XXtz9sTD;
 Sat,  6 Jun 2020 02:38:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1591375112;
 bh=MzZ9ROeyHp7gWVu0gCxZCn2UOPimVjNyMNWLmfuKQy8=;
 h=From:To:Cc:Subject:Date:From;
 b=IzFlmfUqVoq0avKv7uaxaNF11VMfHQ3xrJup3vqQYAYHtzm4y3fLwrPJ8dONikuAH
 zsrQ0NgHv4pw/yU0Y++tvUKel4pCWX5s9ci8t2JqE1nqr8erkQ2PdrEPdiUyP9AMNE
 mIzT4K1pk8gE7lH+aC3R1yvB/MM69V32fZigxSxH/GFuuGYgZwj5aXg1RPvGg5u3pv
 8xQVJrjy6D6LLudy5X6NOBQKMoJ2BLilemsC4tgvR63zf+6Fsm419J587UwqeL17Tn
 p6YggZgqRjLgxD9F6R3m1yur3nSVHuN8MCIKkN7o+a9vGo13dVw/G9jrtl5ckUxGej
 kKUq1KGWcszYQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-5.8-1 tag
Date: Sat, 06 Jun 2020 02:38:49 +1000
Message-ID: <87eeqth3hi.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Cc: ego@linux.vnet.ibm.com, emmanuel.nicolet@gmail.com, chenzhou10@huawei.com,
 jniethe5@gmail.com, linuxram@us.ibm.com, kernelfans@gmail.com,
 linux-kernel@vger.kernel.org, st5pub@yandex.ru, oohall@gmail.com,
 huhai@tj.kylinos.cn, elfring@users.sourceforge.net, rzinsly@linux.ibm.com,
 leobras.c@gmail.com, mikey@neuling.org, herbert@gondor.apana.org.au,
 aneesh.kumar@linux.ibm.com, haren@linux.ibm.com, michal.simek@xilinx.com,
 mahesh@linux.ibm.com, tiwai@suse.de, kjain@linux.ibm.com,
 leonardo@linux.ibm.com, naveen.n.rao@linux.vnet.ibm.com,
 ravi.bangoria@linux.ibm.com, ajd@linux.ibm.com, arnd@arndb.de,
 sfr@canb.auug.org.au, alistair@popple.id.au, npiggin@gmail.com,
 wangxiongfeng2@huawei.com, cai@lca.pw, clg@kaod.org, natechancellor@gmail.com,
 hbathini@linux.ibm.com, christophe.leroy@c-s.fr, geoff@infradead.org,
 dmitry.torokhov@gmail.com, gustavoars@kernel.org, wsa@kernel.org,
 sbobroff@linux.ibm.com, fbarrat@linux.ibm.com, christophe.jaillet@wanadoo.fr,
 akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Linus,

Please pull powerpc updates for 5.8.

Unfortunately we've ended up with quite a few conflicts, which is primarily=
 my
fault for pushing things to next too late. Lesson learnt.

I've pushed the result of my resolution of the conflicts to the powerpc/mer=
ge
branch, if you want to look at that, though I've also tried to describe it =
in
full below.

Firstly there's a conflict in arch/powerpc/kernel/traps.c in
machine_check_exception() vs 69ea03b56ed2 ("hardirq/nmi: Allow nested
nmi_enter()"). That change made nmi_enter() handle nesting natively, but in
parallel we changed our code to only call nmi_enter() on some configurations
which interacts badly.

The condition on the call to nmi_enter() needs updating, as well as the two
calls to nmi_exit(), and then the comment as well. So I've just included th=
e end
result for the bulk of the function:

void machine_check_exception(struct pt_regs *regs)
{
	int recover =3D 0;

	/*
	 * BOOK3S_64 does not call this handler as a non-maskable interrupt
	 * (it uses its own early real-mode handler to handle the MCE proper
	 * and then raises irq_work to call this handler when interrupts are
	 * enabled).
	 */
	if (!IS_ENABLED(CONFIG_PPC_BOOK3S_64))
		nmi_enter();

	__this_cpu_inc(irq_stat.mce_exceptions);

...

	if (check_io_access(regs))
		goto bail;

	if (!IS_ENABLED(CONFIG_PPC_BOOK3S_64))
		nmi_exit();

	die("Machine check", regs, SIGBUS);

	/* Must die if the interrupt is not recoverable */
	if (!(regs->msr & MSR_RI))
		die("Unrecoverable Machine check", regs, SIGBUS);

	return;

bail:
	if (!IS_ENABLED(CONFIG_PPC_BOOK3S_64))
		nmi_exit();
}

Then there's two conflicts with 2fb4706057bc ("powerpc: add support for fol=
ded
p4d page tables").

The first one in arch/powerpc/mm/kasan/kasan_init_32.c in
kasan_remap_early_shadow_ro() is simple, just remove the for loop entirely.

Then in arch/powerpc/mm/ptdump/ptdump.c, in walk_pagetables(), the for loop
should end up being:

	for (i =3D pgd_index(addr); i < PTRS_PER_PGD; i++, pgd++, addr +=3D PGDIR_=
SIZE) {
		p4d_t *p4d =3D p4d_offset(pgd, 0);

		if (p4d_none(*p4d) || p4d_is_leaf(*p4d))
			note_page(st, addr, 1, p4d_val(*p4d), PGDIR_SIZE);
		else if (is_hugepd(__hugepd(p4d_val(*p4d))))
			walk_hugepd(st, (hugepd_t *)p4d, addr, PGDIR_SHIFT, 1);
		else
			/* p4d exists */
			walk_pud(st, p4d, addr);
	}

Finally, we need this hunk applied to avoid a build break:

diff --git a/arch/powerpc/include/asm/nohash/32/pgtable.h b/arch/powerpc/in=
clude/asm/nohash/32/pgtable.h
index 61fc9e8f12d3..af7f13cf90cf 100644
--- a/arch/powerpc/include/asm/nohash/32/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/32/pgtable.h
@@ -239,7 +239,7 @@ static inline pte_basic_t pte_update(struct mm_struct *=
mm, unsigned long addr, p
 	pte_basic_t old =3D pte_val(*p);
 	pte_basic_t new =3D (old & ~(pte_basic_t)clr) | set;
 	int num, i;
-	pmd_t *pmd =3D pmd_offset(pud_offset(pgd_offset(mm, addr), addr), addr);
+	pmd_t *pmd =3D pmd_offset(pud_offset(p4d_offset(pgd_offset(mm, addr), add=
r), addr), addr);
=20
 	if (!huge)
 		num =3D PAGE_SIZE / SZ_4K;


Let me know if any of that doesn't make sense or otherwise causes problems.

There's also a few out-of-area changes which I'll highlight FYI:

arch/s390/include/asm/pgtable.h	# 93a98695f2f9 mm: change pmdp_huge_get_and=
_clear_full take vm_area_struct as arg
include/asm-generic/pgtable.h
mm/huge_memory.c

drivers/input/serio/		# e4f4ffa8a98c input: i8042 - Remove special PowerPC =
handling
include/linux/hw_breakpoint.h	# ef3534a94fdb hw-breakpoints: Fix build warn=
ings with clang
kernel/events/hw_breakpoint.c	# 29da4f91c0c1 powerpc/watchpoint: Don't allo=
w concurrent perf and ptrace events
sound/...			# f16dca3e30c1 sound: ac97: Remove sound driver for ancient pla=
tform

cheers


The following changes since commit ae83d0b416db002fe95601e7f97f64b59514d936:

  Linux 5.7-rc2 (2020-04-19 14:35:30 -0700)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/po=
werpc-5.8-1

for you to fetch changes up to 1395375c592770fe5158a592944aaeed67fa94ff:

  Merge branch 'topic/ppc-kvm' into next (2020-06-03 13:44:51 +1000)

------------------------------------------------------------------
powerpc updates for 5.8

 - Support for userspace to send requests directly to the on-chip GZIP
   accelerator on Power9.

 - Rework of our lockless page table walking (__find_linux_pte()) to make it
   safe against parallel page table manipulations without relying on an IPI=
 for
   serialisation.

 - A series of fixes & enhancements to make our machine check handling more
   robust.

 - Lots of plumbing to add support for "prefixed" (64-bit) instructions on
   Power10.

 - Support for using huge pages for the linear mapping on 8xx (32-bit).

 - Remove obsolete Xilinx PPC405/PPC440 support, and an associated sound dr=
iver.

 - Removal of some obsolete 40x platforms and associated cruft.

 - Initial support for booting on Power10.

 - Lots of other small features, cleanups & fixes.

Thanks to:
  Alexey Kardashevskiy, Alistair Popple, Andrew Donnellan, Andrey Abramov,
  Aneesh Kumar K.V, Balamuruhan S, Bharata B Rao, Bulent Abali, C=C3=A9dric=
 Le
  Goater, Chen Zhou, Christian Zigotzky, Christophe JAILLET, Christophe Ler=
oy,
  Dmitry Torokhov, Emmanuel Nicolet, Erhard F., Gautham R. Shenoy, Geoff Le=
vand,
  George Spelvin, Greg Kurz, Gustavo A. R. Silva, Gustavo Walbon, Haren Myn=
eni,
  Hari Bathini, Joel Stanley, Jordan Niethe, Kajol Jain, Kees Cook, Leonardo
  Bras, Madhavan Srinivasan., Mahesh Salgaonkar, Markus Elfring, Michael
  Neuling, Michal Simek, Nathan Chancellor, Nathan Lynch, Naveen N. Rao,
  Nicholas Piggin, Oliver O'Halloran, Paul Mackerras, Pingfan Liu, Qian Cai=
, Ram
  Pai, Raphael Moreira Zinsly, Ravi Bangoria, Sam Bobroff, Sandipan Das, Se=
gher
  Boessenkool, Stephen Rothwell, Sukadev Bhattiprolu, Tyrel Datwyler, Wolfr=
am
  Sang, Xiongfeng Wang.

------------------------------------------------------------------
Alistair Popple (7):
      powerpc: Enable Prefixed Instructions
      powerpc: Add new HWCAP bits
      powerpc: Add support for ISA v3.1
      powerpc/dt_cpu_ftrs: Advertise support for ISA v3.1 if selected
      powerpc/dt_cpu_ftrs: Enable Prefixed Instructions
      powerpc/dt_cpu_ftrs: Add MMA feature
      powerpc: Add POWER10 architected mode

Andrew Donnellan (2):
      ocxl: Fix misleading comment
      cxl: Remove dead Kconfig options

Andrey Abramov (1):
      powerpc: module_[32|64].c: replace swap function with built-in one

Aneesh Kumar K.V (24):
      mm: change pmdp_huge_get_and_clear_full take vm_area_struct as arg
      powerpc/pkeys: Avoid using lockless page table walk
      powerpc/pkeys: Check vma before returning key fault error to the user
      powerpc/mm/hash64: use _PAGE_PTE when checking for pte_present
      powerpc/hash64: Restrict page table lookup using init_mm with __flush=
_hash_table_range
      powerpc/book3s64/hash: Use the pte_t address from the caller
      powerpc/mce: Don't reload pte val in addr_to_pfn
      powerpc/perf/callchain: Use __get_user_pages_fast in read_user_stack_=
slow
      powerpc/kvm/book3s: switch from raw_spin_*lock to arch_spin_lock.
      powerpc/kvm/book3s: Add helper to walk partition scoped linux page ta=
ble.
      powerpc/kvm/nested: Add helper to walk nested shadow linux page table.
      powerpc/kvm/book3s: Use kvm helpers to walk shadow or secondary table
      powerpc/kvm/book3s: Add helper for host page table walk
      powerpc/kvm/book3s: Use find_kvm_host_pte in page fault handler
      powerpc/kvm/book3s: Use find_kvm_host_pte in h_enter
      powerpc/kvm/book3s: use find_kvm_host_pte in pute_tce functions
      powerpc/kvm/book3s: Avoid using rmap to protect parallel page table u=
pdate.
      powerpc/kvm/book3s: use find_kvm_host_pte in kvmppc_book3s_instantiat=
e_page
      powerpc/kvm/book3s: Use find_kvm_host_pte in kvmppc_get_hpa
      powerpc/kvm/book3s: Use pte_present instead of opencoding _PAGE_PRESE=
NT check
      powerpc/mm/book3s64: Avoid sending IPI on clearing PMD
      powerpc/mm/book3s64: Fix MADV_DONTNEED and parallel page fault race
      powerpc/book3s64/radix/tlb: Determine hugepage flush correctly
      powerpc/book3s64/kvm: Fix secondary page table walk warning during mi=
gration

Chen Zhou (1):
      powerpc/powernv: add NULL check after kzalloc

Christophe JAILLET (1):
      powerpc/powernv: Fix a warning message

Christophe Leroy (83):
      powerpc/uaccess: Implement unsafe_put_user() using 'asm goto'
      powerpc/uaccess: Implement unsafe_copy_to_user() as a simple loop
      powerpc/uaccess: Implement user_read_access_begin and user_write_acce=
ss_begin
      powerpc/8xx: Update email address in MAINTAINERS
      drivers/powerpc: Replace _ALIGN_UP() by ALIGN()
      powerpc: Replace _ALIGN_DOWN() by ALIGN_DOWN()
      powerpc: Replace _ALIGN_UP() by ALIGN()
      powerpc: Replace _ALIGN() by ALIGN()
      powerpc: Remove _ALIGN_UP(), _ALIGN_DOWN() and _ALIGN()
      powerpc/kasan: Fix stack overflow by increasing THREAD_SHIFT
      powerpc/kasan: Fix error detection on memory allocation
      powerpc/kasan: Fix issues by lowering KASAN_SHADOW_END
      powerpc/kasan: Fix shadow pages allocation failure
      powerpc/kasan: Remove unnecessary page table locking
      powerpc/kasan: Refactor update of early shadow mappings
      powerpc/kasan: Declare kasan_init_region() weak
      powerpc/ptdump: Add _PAGE_COHERENT flag
      powerpc/ptdump: Display size of BATs
      powerpc/ptdump: Standardise display of BAT flags
      powerpc/ptdump: Properly handle non standard page size
      powerpc/ptdump: Handle hugepd at PGD level
      powerpc/32s: Don't warn when mapping RO data ROX.
      powerpc/mm: Allocate static page tables for fixmap
      powerpc/mm: Fix conditions to perform MMU specific management by bloc=
ks on PPC32.
      powerpc/mm: PTE_ATOMIC_UPDATES is only for 40x
      powerpc/mm: Refactor pte_update() on nohash/32
      powerpc/mm: Refactor pte_update() on book3s/32
      powerpc/mm: Standardise __ptep_test_and_clear_young() params between =
PPC32 and PPC64
      powerpc/mm: Standardise pte_update() prototype between PPC32 and PPC64
      powerpc/mm: Create a dedicated pte_update() for 8xx
      powerpc/mm: Reduce hugepd size for 8M hugepages on 8xx
      powerpc/8xx: Drop CONFIG_8xx_COPYBACK option
      powerpc/8xx: Prepare handlers for _PAGE_HUGE for 512k pages.
      powerpc/8xx: Manage 512k huge pages as standard pages.
      powerpc/8xx: Only 8M pages are hugepte pages now
      powerpc/8xx: MM_SLICE is not needed anymore
      powerpc/8xx: Move PPC_PIN_TLB options into 8xx Kconfig
      powerpc/8xx: Add function to set pinned TLBs
      powerpc/8xx: Don't set IMMR map anymore at boot
      powerpc/8xx: Always pin TLBs at startup.
      powerpc/8xx: Drop special handling of Linear and IMMR mappings in I/D=
 TLB handlers
      powerpc/8xx: Remove now unused TLB miss functions
      powerpc/8xx: Move DTLB perf handling closer.
      powerpc/mm: Don't be too strict with _etext alignment on PPC32
      powerpc/8xx: Refactor kernel address boundary comparison
      powerpc/8xx: Add a function to early map kernel via huge pages
      powerpc/8xx: Map IMMR with a huge page
      powerpc/8xx: Map linear memory with huge pages
      powerpc/8xx: Allow STRICT_KERNEL_RwX with pinned TLB
      powerpc/8xx: Allow large TLBs with DEBUG_PAGEALLOC
      powerpc/8xx: Implement dedicated kasan_init_region()
      powerpc/32s: Allow mapping with BATs with DEBUG_PAGEALLOC
      powerpc/32s: Implement dedicated kasan_init_region()
      powerpc/40x: Rework 40x PTE access and TLB miss
      powerpc/pgtable: Drop PTE_ATOMIC_UPDATES
      powerpc/40x: Remove support for IBM 403GCX
      powerpc/40x: Remove STB03xxx
      powerpc/40x: Remove WALNUT
      powerpc/40x: Remove EP405
      powerpc/40x: Remove support for ISS Simulator
      powerpc/40x: Remove support for IBM 405GP
      powerpc/40x: Remove IBM405 Erratum #51
      powerpc: Remove IBM405 Erratum #77
      powerpc/40x: Avoid using r12 in TLB miss handlers
      powerpc/40x: Don't save CR in SPRN_SPRG_SCRATCH6
      powerpc/kprobes: Use probe_address() to read instructions
      powerpc/52xx: Blacklist functions running with MMU disabled for kprobe
      powerpc/82xx: Blacklist pq2_restart() for kprobe
      powerpc/83xx: Blacklist mpc83xx_deep_resume() for kprobe
      powerpc/powermac: Blacklist functions running with MMU disabled for k=
probe
      powerpc/mem: Blacklist flush_dcache_icache_phys() for kprobe
      powerpc/32s: Make local symbols non visible in hash_low.
      powerpc/32s: Blacklist functions running with MMU disabled for kprobe
      powerpc/rtas: Remove machine_check_in_rtas()
      powerpc/32: Blacklist functions running with MMU disabled for kprobe
      powerpc/entry32: Blacklist exception entry points for kprobe.
      powerpc/entry32: Blacklist syscall exit points for kprobe.
      powerpc/entry32: Blacklist exception exit points for kprobe.
      powerpc/8xx: Reduce time spent in allow_user_access() and friends
      powerpc/uaccess: Don't set KUAP by default on book3s/32
      powerpc/uaccess: Don't set KUEP by default on book3s/32
      powerpc/32: Disable KASAN with pages bigger than 16k
      powerpc/32s: Fix another build failure with CONFIG_PPC_KUAP_DEBUG

C=C3=A9dric Le Goater (3):
      powerpc/xive: Enforce load-after-store ordering when StoreEOI is acti=
ve
      powerpc/xive: Clear the page tables for the ESB IO mapping
      powerpc/xive: Do not expose a debugfs file when XIVE is disabled

Dmitry Torokhov (1):
      macintosh/ams-input: switch to using input device polling mode

Emmanuel Nicolet (1):
      ps3disk: use the default segment boundary

Gautham R. Shenoy (5):
      powerpc: Move idle_loop_prolog()/epilog() functions to header file
      powerpc/idle: Store PURR snapshot in a per-cpu global variable
      powerpc/pseries: Account for SPURR ticks on idle CPUs
      powerpc/sysfs: Show idle_purr and idle_spurr for every CPU
      Documentation: Document sysfs interfaces purr, spurr, idle_purr, idle=
_spurr

Geoff Levand (5):
      powerpc/head_check: Automatic verbosity
      powerpc/wrapper: Output linker map file
      powerpc/head_check: Avoid broken pipe
      powerpc/ps3: Fix kexec shutdown hang
      powerpc/ps3: Add check for otheros image size

Gustavo A. R. Silva (2):
      powerpc: Replace zero-length array with flexible-array
      powerpc/mm: Replace zero-length array with flexible-array

Haren Myneni (23):
      powerpc/xive: Define xive_native_alloc_irq_on_chip()
      powerpc/vas: Define nx_fault_stamp in coprocessor_request_block
      powerpc/vas: Alloc and setup IRQ and trigger port address
      powerpc/vas: Setup fault window per VAS instance
      powerpc/vas: Register NX with fault window ID and IRQ port value
      powerpc/vas: Take reference to PID and mm for user space windows
      powerpc/vas: Setup thread IRQ handler per VAS instance
      powerpc/vas: Update CSB and notify process for fault CRBs
      powerpc/vas: Return credits after handling fault
      powerpc/vas: Print CRB and FIFO values
      powerpc/vas: Do not use default credits for receive window
      powerpc/vas: Display process stuck message
      powerpc/vas: Free send window in VAS instance after credits returned
      powerpc: Use mm_context vas_windows counter to issue CP_ABORT
      powerpc/vas: Initialize window attributes for GZIP coprocessor type
      powerpc/vas: Define VAS_TX_WIN_OPEN ioctl API
      powerpc/vas: Add VAS user space API
      crypto/nx: Initialize coproc entry with kzalloc
      crypto/nx: Rename nx-842-powernv file name to nx-common-powernv
      crypto/nx: Make enable code generic to add new GZIP compression type
      crypto/nx: Enable and setup GZIP compression type
      crypto/nx: Remove 'pid' in vas_tx_win_attr struct
      Documentation/powerpc: VAS API

Hari Bathini (3):
      powerpc/fadump: use static allocation for reserved memory ranges
      powerpc/fadump: consider reserved ranges while reserving memory
      powerpc/fadump: Account for memory_limit while reserving memory

Jordan Niethe (30):
      powerpc/xmon: Remove store_inst() for patch_instruction()
      powerpc/xmon: Move breakpoint instructions to own array
      powerpc/xmon: Move breakpoints to text section
      powerpc/xmon: Use bitwise calculations in_breakpoint_table()
      powerpc: Change calling convention for create_branch() et. al.
      powerpc: Use a macro for creating instructions from u32s
      powerpc: Use an accessor for instructions
      powerpc: Use a function for getting the instruction op code
      powerpc: Use a function for byte swapping instructions
      powerpc: Introduce functions for instruction equality
      powerpc: Use a datatype for instructions
      powerpc: Use a function for reading instructions
      powerpc: Add a probe_user_read_inst() function
      powerpc: Add a probe_kernel_read_inst() function
      powerpc/kprobes: Use patch_instruction()
      powerpc: Define and use get_user_instr() et. al.
      powerpc: Introduce a function for reporting instruction length
      powerpc/xmon: Use a function for reading instructions
      powerpc/xmon: Move insertion of breakpoint for xol'ing
      powerpc: Make test_translate_branch() independent of instruction leng=
th
      powerpc: Define new SRR1 bits for a ISA v3.1
      powerpc/optprobes: Add register argument to patch_imm64_load_insns()
      powerpc: Add prefixed instructions to instruction data type
      powerpc: Test prefixed code patching
      powerpc: Test prefixed instructions in feature fixups
      powerpc/xmon: Don't allow breakpoints on suffixes
      powerpc/kprobes: Don't allow breakpoints on suffixes
      powerpc: Support prefixed instructions in alignment handler
      powerpc sstep: Add support for prefixed load/stores
      powerpc sstep: Add support for prefixed fixed-point arithmetic

Kajol Jain (5):
      powerpc/perf/hv-24x7: Fix inconsistent output values incase multiple =
hv-24x7 events run
      powerpc/hv-24x7: Add rtas call in hv-24x7 driver to get processor det=
ails
      powerpc/hv-24x7: Add sysfs files inside hv-24x7 device to show proces=
sor details
      Documentation/ABI: Add ABI documentation for chips and sockets
      powerpc/pseries: Update hv-24x7 information after migration

Leonardo Bras (4):
      powerpc/kernel: Enables memory hot-remove after reboot on pseries gue=
sts
      powerpc/crash: Use NMI context for printk when starting to crash
      powerpc/rtas: Move type/struct definitions from rtas.h into rtas-type=
s.h
      powerpc/rtas: Implement reentrant rtas call

Markus Elfring (2):
      drivers/ps3: Remove duplicate error messages
      net/ps3_gelic_net: Remove duplicate error message

Michael Ellerman (24):
      Merge VAS page fault handling into next
      Merge NX gzip support into next
      Merge branch 'topic/uaccess' into topic/uaccess-ppc
      Merge tag 'kvm-ppc-fixes-5.7-1' into topic/ppc-kvm
      Merge the lockless page table walk rework into next
      powerpc/uaccess: Don't use "m<>" constraint
      powerpc/64: Don't initialise init_task->thread.regs
      powerpc: Drop unneeded cast in task_pt_regs()
      selftests/powerpc: Add a test of counting larx/stcx
      drivers/macintosh: Fix memleak in windfarm_pm112 driver
      powerpc/64: Update Speculation_Store_Bypass in /proc/<pid>/status
      Merge branch 'topic/uaccess-ppc' into next
      Merge branch 'topic/ppc-kvm' into next
      Merge "Use hugepages to map kernel mem on 8xx" into next
      Merge branch 'fixes' into next
      powerpc: Add ppc_inst_next()
      powerpc: Add ppc_inst_as_u64()
      powerpc/configs/64s: Enable CONFIG_PRINTK_CALLER
      powerpc/xmon: Show task->thread.regs in process display
      powerpc/64s: Don't init FSCR_DSCR in __init_FSCR()
      powerpc/64s: Don't let DT CPU features set FSCR_DSCR
      powerpc/64s: Save FSCR to init_task.thread.fscr after feature init
      powerpc/64s: Don't set FSCR bits in INIT_THREAD
      Merge branch 'topic/ppc-kvm' into next

Michael Neuling (3):
      powerpc/tm: Document h/rfid and mtmsrd quirk
      powerpc: Fix misleading small cores print
      powerpc/configs: Add LIBNVDIMM to ppc64_defconfig

Michal Simek (2):
      powerpc: Remove Xilinx PPC405/PPC440 support
      sound: ac97: Remove sound driver for ancient platform

Nathan Chancellor (2):
      powerpc/wii: Fix declaration made after definition
      input: i8042 - Remove special PowerPC handling

Naveen N. Rao (4):
      powerpc/64: Have MPROFILE_KERNEL depend on FUNCTION_TRACER
      powerpc/module_64: Consolidate ftrace code
      powerpc/module_64: Simplify check for -mprofile-kernel ftrace relocat=
ions
      powerpc/module_64: Use special stub for _mcount() with -mprofile-kern=
el

Nicholas Piggin (26):
      powerpc/64s: Always has full regs, so remove remnant checks
      powerpc: Use set_trap() and avoid open-coding trap masking
      powerpc: trap_is_syscall() helper to hide syscall trap number
      powerpc: Use trap metadata to prevent double restart rather than zero=
ing trap
      powerpc/64s/exception: Fix machine check no-loss idle wakeup
      powerpc/64s/exceptions: Fix in_mce accounting in unrecoverable path
      powerpc/64s/exceptions: Change irq reconcile for NMIs from reusing _D=
AR to RESULT
      powerpc/64s/exceptions: Machine check reconcile irq state
      powerpc/pseries/ras: Avoid calling rtas_token() in NMI paths
      powerpc/pseries/ras: Fix FWNMI_VALID off by one
      powerpc/pseries/ras: fwnmi avoid modifying r3 in error case
      powerpc/pseries/ras: fwnmi sreset should not interlock
      powerpc/pseries: Limit machine check stack to 4GB
      powerpc/pseries: Machine check use rtas_call_unlocked() with args on =
stack
      powerpc/64s: machine check interrupt update NMI accounting
      powerpc: Implement ftrace_enabled() helpers
      powerpc/64s: machine check do not trace real-mode handler
      powerpc/traps: Do not trace system reset
      powerpc/traps: Make unrecoverable NMIs die instead of panic
      powerpc/64s: Fix early_init_mmu section mismatch
      powerpc/64s/hash: Add stress_slb kernel boot option to increase SLB f=
aults
      powerpc/64s/radix: Don't prefetch DAR in update_mmu_cache
      powerpc/64: Refactor interrupt exit irq disabling sequence
      powerpc/64s/kuap: Add missing isync to KUAP restore paths
      powerpc/64/kuap: Conditionally restore AMR in interrupt exit
      powerpc/64s/kuap: Conditionally restore AMR in kuap_restore_amr asm

Oliver O'Halloran (14):
      powerpc/powernv/npu: Clean up compound table group initialisation
      powerpc/powernv/iov: Don't add VFs to iommu group during PE config
      powerpc/powernv/pci: Register iommu group at PE DMA setup
      powerpc/powernv/pci: Add device to iommu group during dma_dev_setup()
      powerpc/powernv/pci: Delete old iommu recursive iommu setup
      powerpc/powernv/pci: Move tce size parsing to pci-ioda-tce.c
      powerpc/powernv/npu: Move IOMMU group setup into npu-dma.c
      powerpc/powernv: Add a print indicating when an IODA PE is released
      powerpc/powernv/pci: Add an explaination for PNV_IODA_PE_BUS_ALL
      powerpc/powernv/pci: Add helper to find ioda_pe from BDFN
      powerpc/powernv/pci: Re-work bus PE configuration
      powerpc/powernv/pci: Reserve the root bus PE during init
      powerpc/powernv/pci: Sprinkle around some WARN_ON()s
      powerpc/pseries: Make vio and ibmebus initcalls pseries specific

Pingfan Liu (1):
      powerpc/crashkernel: Take "mem=3D" option into account

Qian Cai (1):
      powerpc/64s/pgtable: fix an undefined behaviour

Ram Pai (1):
      powerpc/xive: Share the event-queue page with the Hypervisor.

Raphael Moreira Zinsly (5):
      selftests/powerpc: Add header files for GZIP engine test
      selftests/powerpc: Add header files for NX compresion/decompression
      selftests/powerpc: Add NX-GZIP engine compress testcase
      selftests/powerpc: Add NX-GZIP engine decompress testcase
      selftests/powerpc: Add README for GZIP engine tests

Ravi Bangoria (17):
      powerpc/watchpoint: Rename current DAWR macros
      powerpc/watchpoint: Add SPRN macros for second DAWR
      powerpc/watchpoint: Introduce function to get nr watchpoints dynamica=
lly
      powerpc/watchpoint/ptrace: Return actual num of available watchpoints
      powerpc/watchpoint: Provide DAWR number to set_dawr
      powerpc/watchpoint: Provide DAWR number to __set_breakpoint
      powerpc/watchpoint: Get watchpoint count dynamically while disabling =
them
      powerpc/watchpoint: Disable all available watchpoints when !dawr_forc=
e_enable
      powerpc/watchpoint: Convert thread_struct->hw_brk to an array
      powerpc/watchpoint: Use loop for thread_struct->ptrace_bps
      powerpc/watchpoint: Introduce is_ptrace_bp() function
      powerpc/watchpoint: Use builtin ALIGN*() macros
      powerpc/watchpoint: Prepare handler to handle more than one watchpoint
      powerpc/watchpoint: Don't allow concurrent perf and ptrace events
      powerpc/watchpoint/xmon: Don't allow breakpoint overwriting
      powerpc/watchpoint/xmon: Support 2nd DAWR
      hw-breakpoints: Fix build warnings with clang

Sam Bobroff (2):
      powerpc/eeh: Fix pseries_eeh_configure_bridge()
      powerpc/eeh: Release EEH device state synchronously

Stephen Rothwell (1):
      powerpc/vas: Include linux/types.h in uapi/asm/vas-api.h

Wolfram Sang (1):
      powerpc/5200: update contact email

Xiongfeng Wang (1):
      powerpc/ps3: Move static keyword to the front of declaration

huhai (1):
      powerpc/4xx: Don't unmap NULL mbase


 Documentation/ABI/testing/sysfs-bus-event_source-devices-hv_24x7 |   21 +
 Documentation/ABI/testing/sysfs-devices-system-cpu               |   39 +
 Documentation/admin-guide/kernel-parameters.txt                  |    5 +
 Documentation/devicetree/bindings/xilinx.txt                     |  143 ---
 Documentation/powerpc/bootwrapper.rst                            |   28 +-
 Documentation/powerpc/index.rst                                  |    1 +
 Documentation/powerpc/transactional_memory.rst                   |   27 +
 Documentation/powerpc/vas-api.rst                                |  292 ++=
+++
 Documentation/userspace-api/ioctl/ioctl-number.rst               |    1 +
 MAINTAINERS                                                      |    2 +-
 arch/powerpc/Kconfig                                             |   69 +-
 arch/powerpc/Kconfig.debug                                       |    2 +-
 arch/powerpc/boot/Makefile                                       |   14 +-
 arch/powerpc/boot/dts/Makefile                                   |    1 -
 arch/powerpc/boot/dts/ep405.dts                                  |  230 --=
--
 arch/powerpc/boot/dts/pcm032.dts                                 |    4 +-
 arch/powerpc/boot/dts/virtex440-ml507.dts                        |  406 --=
----
 arch/powerpc/boot/dts/virtex440-ml510.dts                        |  466 --=
-----
 arch/powerpc/boot/dts/walnut.dts                                 |  246 --=
--
 arch/powerpc/boot/ep405.c                                        |   71 --
 arch/powerpc/boot/ops.h                                          |    1 -
 arch/powerpc/boot/serial.c                                       |    5 -
 arch/powerpc/boot/treeboot-walnut.c                              |   81 --
 arch/powerpc/boot/uartlite.c                                     |   79 --
 arch/powerpc/boot/virtex.c                                       |   97 --
 arch/powerpc/boot/virtex405-head.S                               |   31 -
 arch/powerpc/boot/wrapper                                        |   26 +-
 arch/powerpc/configs/40x/acadia_defconfig                        |    1 -
 arch/powerpc/configs/40x/ep405_defconfig                         |   62 -
 arch/powerpc/configs/40x/kilauea_defconfig                       |    1 -
 arch/powerpc/configs/40x/klondike_defconfig                      |    1 -
 arch/powerpc/configs/40x/makalu_defconfig                        |    1 -
 arch/powerpc/configs/40x/obs600_defconfig                        |    1 -
 arch/powerpc/configs/40x/virtex_defconfig                        |   75 --
 arch/powerpc/configs/44x/virtex5_defconfig                       |   74 --
 arch/powerpc/configs/adder875_defconfig                          |    1 -
 arch/powerpc/configs/ep88xc_defconfig                            |    1 -
 arch/powerpc/configs/mpc866_ads_defconfig                        |    1 -
 arch/powerpc/configs/mpc885_ads_defconfig                        |    1 -
 arch/powerpc/configs/powernv_defconfig                           |    1 +
 arch/powerpc/configs/ppc40x_defconfig                            |    9 -
 arch/powerpc/configs/ppc44x_defconfig                            |    8 -
 arch/powerpc/configs/ppc64_defconfig                             |    2 +
 arch/powerpc/configs/pseries_defconfig                           |    1 +
 arch/powerpc/configs/tqm8xx_defconfig                            |    1 -
 arch/powerpc/include/asm/asm-405.h                               |   19 -
 arch/powerpc/include/asm/atomic.h                                |   11 -
 arch/powerpc/include/asm/bitops.h                                |    4 -
 arch/powerpc/include/asm/book3s/32/kup.h                         |    7 +-
 arch/powerpc/include/asm/book3s/32/pgtable.h                     |   82 +-
 arch/powerpc/include/asm/book3s/64/kup-radix.h                   |   41 +-
 arch/powerpc/include/asm/book3s/64/mmu.h                         |    5 +-
 arch/powerpc/include/asm/book3s/64/pgtable.h                     |   50 +-
 arch/powerpc/include/asm/book3s/64/tlbflush-hash.h               |    3 +-
 arch/powerpc/include/asm/cache.h                                 |    2 +-
 arch/powerpc/include/asm/cmpxchg.h                               |   11 -
 arch/powerpc/include/asm/code-patching.h                         |   37 +-
 arch/powerpc/include/asm/cputable.h                              |   22 +-
 arch/powerpc/include/asm/debug.h                                 |    2 +-
 arch/powerpc/include/asm/drmem.h                                 |    1 +
 arch/powerpc/include/asm/fadump-internal.h                       |    4 +-
 arch/powerpc/include/asm/firmware.h                              |    1 +
 arch/powerpc/include/asm/fixmap.h                                |    4 +
 arch/powerpc/include/asm/ftrace.h                                |   14 +
 arch/powerpc/include/asm/futex.h                                 |    3 -
 arch/powerpc/include/asm/hugetlb.h                               |    4 -
 arch/powerpc/include/asm/hw_breakpoint.h                         |   31 +-
 arch/powerpc/include/asm/icswx.h                                 |   20 +-
 arch/powerpc/include/asm/idle.h                                  |   93 ++
 arch/powerpc/include/asm/inst.h                                  |  131 ++
 arch/powerpc/include/asm/iommu.h                                 |    4 +-
 arch/powerpc/include/asm/kasan.h                                 |   10 +-
 arch/powerpc/include/asm/kprobes.h                               |    2 +-
 arch/powerpc/include/asm/kup.h                                   |   14 +-
 arch/powerpc/include/asm/kvm_book3s.h                            |    2 +-
 arch/powerpc/include/asm/kvm_book3s_64.h                         |   44 +-
 arch/powerpc/include/asm/mmu.h                                   |   10 +-
 arch/powerpc/include/asm/mmu_context.h                           |   30 +
 arch/powerpc/include/asm/module.h                                |    3 -
 arch/powerpc/include/asm/nohash/32/hugetlb-8xx.h                 |   32 +-
 arch/powerpc/include/asm/nohash/32/mmu-8xx.h                     |   90 +-
 arch/powerpc/include/asm/nohash/32/pgtable.h                     |  120 +-
 arch/powerpc/include/asm/nohash/32/pte-40x.h                     |   23 +-
 arch/powerpc/include/asm/nohash/32/pte-8xx.h                     |    4 +-
 arch/powerpc/include/asm/nohash/32/slice.h                       |   20 -
 arch/powerpc/include/asm/nohash/64/pgtable.h                     |   28 +-
 arch/powerpc/include/asm/nohash/pgtable.h                        |    4 +-
 arch/powerpc/include/asm/paca.h                                  |    2 +
 arch/powerpc/include/asm/page.h                                  |    7 -
 arch/powerpc/include/asm/pgtable.h                               |    2 +
 arch/powerpc/include/asm/ppc-opcode.h                            |    3 +
 arch/powerpc/include/asm/processor.h                             |   11 +-
 arch/powerpc/include/asm/prom.h                                  |    1 +
 arch/powerpc/include/asm/ptrace.h                                |   46 +-
 arch/powerpc/include/asm/reg.h                                   |   19 +-
 arch/powerpc/include/asm/reg_booke.h                             |   54 -
 arch/powerpc/include/asm/rtas-types.h                            |  124 ++
 arch/powerpc/include/asm/rtas.h                                  |  125 +-
 arch/powerpc/include/asm/slice.h                                 |    2 -
 arch/powerpc/include/asm/spinlock.h                              |    4 -
 arch/powerpc/include/asm/sstep.h                                 |   17 +-
 arch/powerpc/include/asm/switch_to.h                             |    2 -
 arch/powerpc/include/asm/syscall.h                               |    5 +-
 arch/powerpc/include/asm/time.h                                  |   12 -
 arch/powerpc/include/asm/uaccess.h                               |  149 ++-
 arch/powerpc/include/asm/uprobes.h                               |    7 +-
 arch/powerpc/include/asm/vas.h                                   |   13 +-
 arch/powerpc/include/asm/xilinx_intc.h                           |   16 -
 arch/powerpc/include/asm/xilinx_pci.h                            |   21 -
 arch/powerpc/include/asm/xive-regs.h                             |    8 +
 arch/powerpc/include/asm/xive.h                                  |    9 +-
 arch/powerpc/include/uapi/asm/cputable.h                         |    2 +
 arch/powerpc/include/uapi/asm/vas-api.h                          |   24 +
 arch/powerpc/kernel/align.c                                      |   18 +-
 arch/powerpc/kernel/asm-offsets.c                                |    8 +
 arch/powerpc/kernel/cpu_setup_6xx.S                              |    2 +
 arch/powerpc/kernel/cpu_setup_power.S                            |   22 +-
 arch/powerpc/kernel/cputable.c                                   |  124 +-
 arch/powerpc/kernel/crash_dump.c                                 |    7 +-
 arch/powerpc/kernel/dawr.c                                       |   23 +-
 arch/powerpc/kernel/dt_cpu_ftrs.c                                |   32 +-
 arch/powerpc/kernel/eeh.c                                        |   31 +
 arch/powerpc/kernel/entry_32.S                                   |   69 +-
 arch/powerpc/kernel/entry_64.S                                   |    8 +-
 arch/powerpc/kernel/epapr_paravirt.c                             |    7 +-
 arch/powerpc/kernel/exceptions-64s.S                             |   51 +-
 arch/powerpc/kernel/fadump.c                                     |  155 ++-
 arch/powerpc/kernel/fpu.S                                        |    1 +
 arch/powerpc/kernel/head_32.S                                    |    2 +-
 arch/powerpc/kernel/head_40x.S                                   |  316 +-=
---
 arch/powerpc/kernel/head_64.S                                    |    9 +-
 arch/powerpc/kernel/head_8xx.S                                   |  354 ++=
+---
 arch/powerpc/kernel/head_booke.h                                 |    2 +-
 arch/powerpc/kernel/hw_breakpoint.c                              |  641 ++=
++++++--
 arch/powerpc/kernel/idle_6xx.S                                   |    1 +
 arch/powerpc/kernel/idle_e500.S                                  |    1 +
 arch/powerpc/kernel/jump_label.c                                 |    5 +-
 arch/powerpc/kernel/kgdb.c                                       |    9 +-
 arch/powerpc/kernel/kprobes.c                                    |   47 +-
 arch/powerpc/kernel/l2cr_6xx.S                                   |    1 +
 arch/powerpc/kernel/mce.c                                        |   16 +-
 arch/powerpc/kernel/mce_power.c                                  |   19 +-
 arch/powerpc/kernel/misc.S                                       |    2 +
 arch/powerpc/kernel/misc_32.S                                    |   11 +-
 arch/powerpc/kernel/module_32.c                                  |   17 +-
 arch/powerpc/kernel/module_64.c                                  |  301 ++=
---
 arch/powerpc/kernel/nvram_64.c                                   |    4 +-
 arch/powerpc/kernel/optprobes.c                                  |   99 +-
 arch/powerpc/kernel/optprobes_head.S                             |    3 +
 arch/powerpc/kernel/paca.c                                       |   32 +
 arch/powerpc/kernel/pci-hotplug.c                                |    2 -
 arch/powerpc/kernel/pci_64.c                                     |    6 +-
 arch/powerpc/kernel/process.c                                    |  113 +-
 arch/powerpc/kernel/prom.c                                       |   38 +-
 arch/powerpc/kernel/prom_init.c                                  |   36 +-
 arch/powerpc/kernel/ptrace/ptrace-noadv.c                        |   72 +-
 arch/powerpc/kernel/ptrace/ptrace-tm.c                           |    2 +-
 arch/powerpc/kernel/ptrace/ptrace-view.c                         |    2 +-
 arch/powerpc/kernel/ptrace/ptrace32.c                            |    4 +-
 arch/powerpc/kernel/rtas.c                                       |   52 +
 arch/powerpc/kernel/security.c                                   |   48 +-
 arch/powerpc/kernel/setup-common.c                               |    4 -
 arch/powerpc/kernel/setup_32.c                                   |   10 +-
 arch/powerpc/kernel/setup_64.c                                   |   15 +-
 arch/powerpc/kernel/signal.c                                     |   22 +-
 arch/powerpc/kernel/signal_32.c                                  |    2 +-
 arch/powerpc/kernel/signal_64.c                                  |   10 +-
 arch/powerpc/kernel/smp.c                                        |    2 +-
 arch/powerpc/kernel/swsusp_32.S                                  |    2 +
 arch/powerpc/kernel/syscall_64.c                                 |   72 +-
 arch/powerpc/kernel/sysfs.c                                      |   82 +-
 arch/powerpc/kernel/trace/ftrace.c                               |  168 +--
 arch/powerpc/kernel/traps.c                                      |   46 +-
 arch/powerpc/kernel/uprobes.c                                    |    5 +-
 arch/powerpc/kernel/vecemu.c                                     |   20 +-
 arch/powerpc/kernel/vector.S                                     |    1 +
 arch/powerpc/kernel/vmlinux.lds.S                                |    3 +-
 arch/powerpc/kexec/core.c                                        |    8 +-
 arch/powerpc/kexec/crash.c                                       |    3 +
 arch/powerpc/kvm/book3s_64_mmu_hv.c                              |   13 +-
 arch/powerpc/kvm/book3s_64_mmu_radix.c                           |   71 +-
 arch/powerpc/kvm/book3s_64_vio_hv.c                              |   66 +-
 arch/powerpc/kvm/book3s_hv.c                                     |   15 +-
 arch/powerpc/kvm/book3s_hv_nested.c                              |   39 +-
 arch/powerpc/kvm/book3s_hv_rm_mmu.c                              |   60 +-
 arch/powerpc/kvm/book3s_hv_rmhandlers.S                          |   23 +-
 arch/powerpc/kvm/book3s_xive_native.c                            |    6 +
 arch/powerpc/kvm/book3s_xive_template.c                          |    3 +
 arch/powerpc/kvm/emulate_loadstore.c                             |    2 +-
 arch/powerpc/lib/Makefile                                        |    2 +-
 arch/powerpc/lib/code-patching.c                                 |  307 ++=
+--
 arch/powerpc/lib/feature-fixups-test.S                           |   69 ++
 arch/powerpc/lib/feature-fixups.c                                |  163 ++-
 arch/powerpc/lib/inst.c                                          |   73 ++
 arch/powerpc/lib/sstep.c                                         |  460 ++=
++---
 arch/powerpc/lib/test_code-patching.S                            |   20 +
 arch/powerpc/lib/test_emulate_step.c                             |   56 +-
 arch/powerpc/mm/book3s32/hash_low.S                              |   32 +-
 arch/powerpc/mm/book3s32/mmu.c                                   |   12 +-
 arch/powerpc/mm/book3s64/hash_pgtable.c                          |   11 -
 arch/powerpc/mm/book3s64/hash_tlb.c                              |   22 +-
 arch/powerpc/mm/book3s64/hash_utils.c                            |   72 +-
 arch/powerpc/mm/book3s64/internal.h                              |   16 +
 arch/powerpc/mm/book3s64/pgtable.c                               |   37 +-
 arch/powerpc/mm/book3s64/radix_pgtable.c                         |   21 +-
 arch/powerpc/mm/book3s64/radix_tlb.c                             |    4 +-
 arch/powerpc/mm/book3s64/slb.c                                   |  166 ++-
 arch/powerpc/mm/fault.c                                          |   92 +-
 arch/powerpc/mm/hugetlbpage.c                                    |   43 +-
 arch/powerpc/mm/init_32.c                                        |   12 +-
 arch/powerpc/mm/init_64.c                                        |    4 +-
 arch/powerpc/mm/kasan/8xx.c                                      |   74 ++
 arch/powerpc/mm/kasan/Makefile                                   |    2 +
 arch/powerpc/mm/kasan/book3s_32.c                                |   57 +
 arch/powerpc/mm/kasan/kasan_init_32.c                            |   88 +-
 arch/powerpc/mm/mem.c                                            |    2 +
 arch/powerpc/mm/mmu_decl.h                                       |    4 +
 arch/powerpc/mm/nohash/40x.c                                     |    4 +-
 arch/powerpc/mm/nohash/8xx.c                                     |  227 ++=
--
 arch/powerpc/mm/pgtable.c                                        |   34 +-
 arch/powerpc/mm/pgtable_32.c                                     |   22 +-
 arch/powerpc/mm/ptdump/8xx.c                                     |    5 +
 arch/powerpc/mm/ptdump/bats.c                                    |   41 +-
 arch/powerpc/mm/ptdump/ptdump.c                                  |   73 +-
 arch/powerpc/mm/ptdump/ptdump.h                                  |    3 +
 arch/powerpc/mm/ptdump/shared.c                                  |    5 +
 arch/powerpc/mm/slice.c                                          |    2 +-
 arch/powerpc/perf/8xx-pmu.c                                      |   19 +-
 arch/powerpc/perf/callchain_64.c                                 |   46 +-
 arch/powerpc/perf/core-book3s.c                                  |    4 +-
 arch/powerpc/perf/hv-24x7.c                                      |   96 +-
 arch/powerpc/platforms/40x/Kconfig                               |   76 --
 arch/powerpc/platforms/40x/Makefile                              |    3 -
 arch/powerpc/platforms/40x/ep405.c                               |  123 --
 arch/powerpc/platforms/40x/virtex.c                              |   54 -
 arch/powerpc/platforms/40x/walnut.c                              |   65 -
 arch/powerpc/platforms/44x/Kconfig                               |   40 +-
 arch/powerpc/platforms/44x/Makefile                              |    2 -
 arch/powerpc/platforms/44x/virtex.c                              |   60 -
 arch/powerpc/platforms/44x/virtex_ml510.c                        |   30 -
 arch/powerpc/platforms/4xx/pci.c                                 |    4 +-
 arch/powerpc/platforms/52xx/lite5200_sleep.S                     |    2 +
 arch/powerpc/platforms/82xx/pq2.c                                |    3 +
 arch/powerpc/platforms/83xx/suspend-asm.S                        |    1 +
 arch/powerpc/platforms/86xx/mpc86xx_smp.c                        |    5 +-
 arch/powerpc/platforms/8xx/Kconfig                               |   50 +-
 arch/powerpc/platforms/Kconfig                                   |    4 -
 arch/powerpc/platforms/Kconfig.cputype                           |    6 +-
 arch/powerpc/platforms/cell/iommu.c                              |    6 +-
 arch/powerpc/platforms/embedded6xx/wii.c                         |   25 +-
 arch/powerpc/platforms/powermac/bootx_init.c                     |   14 +-
 arch/powerpc/platforms/powermac/cache.S                          |    2 +
 arch/powerpc/platforms/powermac/nvram.c                          |    2 +-
 arch/powerpc/platforms/powermac/sleep.S                          |    5 +-
 arch/powerpc/platforms/powermac/smp.c                            |    5 +-
 arch/powerpc/platforms/powernv/Makefile                          |    2 +-
 arch/powerpc/platforms/powernv/idle.c                            |    2 +-
 arch/powerpc/platforms/powernv/npu-dma.c                         |  117 +-
 arch/powerpc/platforms/powernv/opal-fadump.c                     |    2 +-
 arch/powerpc/platforms/powernv/opal.c                            |    4 +
 arch/powerpc/platforms/powernv/pci-ioda-tce.c                    |   28 +
 arch/powerpc/platforms/powernv/pci-ioda.c                        |  299 ++=
---
 arch/powerpc/platforms/powernv/pci.c                             |   20 -
 arch/powerpc/platforms/powernv/pci.h                             |   28 +-
 arch/powerpc/platforms/powernv/vas-api.c                         |  278 ++=
+++
 arch/powerpc/platforms/powernv/vas-debug.c                       |    2 +-
 arch/powerpc/platforms/powernv/vas-fault.c                       |  382 ++=
++++
 arch/powerpc/platforms/powernv/vas-window.c                      |  238 ++=
+-
 arch/powerpc/platforms/powernv/vas.c                             |   85 +-
 arch/powerpc/platforms/powernv/vas.h                             |   59 +-
 arch/powerpc/platforms/ps3/mm.c                                  |   52 +-
 arch/powerpc/platforms/ps3/setup.c                               |    2 +-
 arch/powerpc/platforms/pseries/eeh_pseries.c                     |    8 +-
 arch/powerpc/platforms/pseries/ibmebus.c                         |    3 +-
 arch/powerpc/platforms/pseries/mobility.c                        |    3 +
 arch/powerpc/platforms/pseries/ras.c                             |   62 +-
 arch/powerpc/platforms/pseries/rtas-fadump.c                     |    2 +-
 arch/powerpc/platforms/pseries/setup.c                           |   22 +-
 arch/powerpc/platforms/pseries/vio.c                             |    7 +-
 arch/powerpc/sysdev/Makefile                                     |    2 -
 arch/powerpc/sysdev/cpm_common.c                                 |    2 +
 arch/powerpc/sysdev/xics/ics-rtas.c                              |   22 +-
 arch/powerpc/sysdev/xilinx_intc.c                                |   88 --
 arch/powerpc/sysdev/xilinx_pci.c                                 |  132 --
 arch/powerpc/sysdev/xive/common.c                                |   13 +-
 arch/powerpc/sysdev/xive/native.c                                |    6 +-
 arch/powerpc/sysdev/xive/spapr.c                                 |    7 +
 arch/powerpc/tools/head_check.sh                                 |    8 +-
 arch/powerpc/xmon/Makefile                                       |    2 +-
 arch/powerpc/xmon/xmon.c                                         |  229 ++=
--
 arch/powerpc/xmon/xmon_bpts.S                                    |   11 +
 arch/powerpc/xmon/xmon_bpts.h                                    |   14 +
 arch/s390/include/asm/pgtable.h                                  |    4 +-
 drivers/block/ps3disk.c                                          |    1 -
 drivers/char/Kconfig                                             |    2 +-
 drivers/cpuidle/cpuidle-pseries.c                                |   39 +-
 drivers/crypto/nx/Makefile                                       |    2 +-
 drivers/crypto/nx/{nx-842-powernv.c =3D> nx-common-powernv.c}      |  204 =
++-
 drivers/input/serio/i8042-ppcio.h                                |   57 -
 drivers/input/serio/i8042.h                                      |    2 -
 drivers/macintosh/Kconfig                                        |    1 -
 drivers/macintosh/ams/ams-input.c                                |   37 +-
 drivers/macintosh/ams/ams.h                                      |    4 +-
 drivers/macintosh/windfarm_pm112.c                               |   21 +-
 drivers/misc/cxl/Kconfig                                         |    8 -
 drivers/misc/ocxl/context.c                                      |    2 +-
 drivers/net/ethernet/toshiba/ps3_gelic_net.c                     |    2 -
 drivers/ps3/ps3-lpm.c                                            |    8 +-
 drivers/ps3/ps3-vuart.c                                          |    5 +-
 drivers/vfio/pci/vfio_pci_nvlink2.c                              |    2 +-
 drivers/video/fbdev/Kconfig                                      |    2 +-
 drivers/video/fbdev/ps3fb.c                                      |    4 +-
 include/asm-generic/pgtable.h                                    |    4 +-
 include/linux/hw_breakpoint.h                                    |    4 +
 kernel/events/hw_breakpoint.c                                    |   16 +
 mm/huge_memory.c                                                 |    4 +-
 sound/drivers/Kconfig                                            |   12 -
 sound/drivers/Makefile                                           |    2 -
 sound/drivers/ml403-ac97cr.c                                     | 1298 --=
------------------
 sound/drivers/pcm-indirect2.c                                    |  560 --=
-------
 sound/drivers/pcm-indirect2.h                                    |  127 --
 sound/ppc/snd_ps3.c                                              |    2 +-
 tools/testing/selftests/powerpc/Makefile                         |    1 +
 tools/testing/selftests/powerpc/nx-gzip/99-nx-gzip.rules         |    1 +
 tools/testing/selftests/powerpc/nx-gzip/Makefile                 |    8 +
 tools/testing/selftests/powerpc/nx-gzip/README                   |   45 +
 tools/testing/selftests/powerpc/nx-gzip/gunz_test.c              | 1028 ++=
++++++++++++++
 tools/testing/selftests/powerpc/nx-gzip/gzfht_test.c             |  433 ++=
+++++
 tools/testing/selftests/powerpc/nx-gzip/gzip_vas.c               |  316 ++=
+++
 tools/testing/selftests/powerpc/nx-gzip/include/copy-paste.h     |   56 +
 tools/testing/selftests/powerpc/nx-gzip/include/crb.h            |  155 +++
 tools/testing/selftests/powerpc/nx-gzip/include/nx.h             |   38 +
 tools/testing/selftests/powerpc/nx-gzip/include/nx_dbg.h         |   95 ++
 tools/testing/selftests/powerpc/nx-gzip/include/nxu.h            |  650 ++=
++++++++
 tools/testing/selftests/powerpc/nx-gzip/include/vas-api.h        |    1 +
 tools/testing/selftests/powerpc/nx-gzip/nx-gzip-test.sh          |   46 +
 tools/testing/selftests/powerpc/pmu/.gitignore                   |    1 +
 tools/testing/selftests/powerpc/pmu/Makefile                     |    8 +-
 tools/testing/selftests/powerpc/pmu/count_stcx_fail.c            |  161 +++
 tools/testing/selftests/powerpc/pmu/ebb/trace.h                  |    4 +-
 tools/testing/selftests/powerpc/pmu/loop.S                       |   35 +
 tools/testing/selftests/powerpc/signal/Makefile                  |    2 +-
 tools/testing/selftests/powerpc/signal/sig_sc_double_restart.c   |  174 +++
 343 files changed, 10392 insertions(+), 8589 deletions(-)
 create mode 100644 Documentation/powerpc/vas-api.rst
 delete mode 100644 arch/powerpc/boot/dts/ep405.dts
 delete mode 100644 arch/powerpc/boot/dts/virtex440-ml507.dts
 delete mode 100644 arch/powerpc/boot/dts/virtex440-ml510.dts
 delete mode 100644 arch/powerpc/boot/dts/walnut.dts
 delete mode 100644 arch/powerpc/boot/ep405.c
 delete mode 100644 arch/powerpc/boot/treeboot-walnut.c
 delete mode 100644 arch/powerpc/boot/uartlite.c
 delete mode 100644 arch/powerpc/boot/virtex.c
 delete mode 100644 arch/powerpc/boot/virtex405-head.S
 delete mode 100644 arch/powerpc/configs/40x/ep405_defconfig
 delete mode 100644 arch/powerpc/configs/40x/virtex_defconfig
 delete mode 100644 arch/powerpc/configs/44x/virtex5_defconfig
 delete mode 100644 arch/powerpc/include/asm/asm-405.h
 create mode 100644 arch/powerpc/include/asm/idle.h
 create mode 100644 arch/powerpc/include/asm/inst.h
 delete mode 100644 arch/powerpc/include/asm/nohash/32/slice.h
 create mode 100644 arch/powerpc/include/asm/rtas-types.h
 delete mode 100644 arch/powerpc/include/asm/xilinx_intc.h
 delete mode 100644 arch/powerpc/include/asm/xilinx_pci.h
 create mode 100644 arch/powerpc/include/uapi/asm/vas-api.h
 create mode 100644 arch/powerpc/lib/inst.c
 create mode 100644 arch/powerpc/lib/test_code-patching.S
 create mode 100644 arch/powerpc/mm/book3s64/internal.h
 create mode 100644 arch/powerpc/mm/kasan/8xx.c
 create mode 100644 arch/powerpc/mm/kasan/book3s_32.c
 delete mode 100644 arch/powerpc/platforms/40x/ep405.c
 delete mode 100644 arch/powerpc/platforms/40x/virtex.c
 delete mode 100644 arch/powerpc/platforms/40x/walnut.c
 delete mode 100644 arch/powerpc/platforms/44x/virtex.c
 delete mode 100644 arch/powerpc/platforms/44x/virtex_ml510.c
 create mode 100644 arch/powerpc/platforms/powernv/vas-api.c
 create mode 100644 arch/powerpc/platforms/powernv/vas-fault.c
 delete mode 100644 arch/powerpc/sysdev/xilinx_intc.c
 delete mode 100644 arch/powerpc/sysdev/xilinx_pci.c
 create mode 100644 arch/powerpc/xmon/xmon_bpts.S
 create mode 100644 arch/powerpc/xmon/xmon_bpts.h
 rename drivers/crypto/nx/{nx-842-powernv.c =3D> nx-common-powernv.c} (87%)
 delete mode 100644 drivers/input/serio/i8042-ppcio.h
 delete mode 100644 sound/drivers/ml403-ac97cr.c
 delete mode 100644 sound/drivers/pcm-indirect2.c
 delete mode 100644 sound/drivers/pcm-indirect2.h
 create mode 100644 tools/testing/selftests/powerpc/nx-gzip/99-nx-gzip.rules
 create mode 100644 tools/testing/selftests/powerpc/nx-gzip/Makefile
 create mode 100644 tools/testing/selftests/powerpc/nx-gzip/README
 create mode 100644 tools/testing/selftests/powerpc/nx-gzip/gunz_test.c
 create mode 100644 tools/testing/selftests/powerpc/nx-gzip/gzfht_test.c
 create mode 100644 tools/testing/selftests/powerpc/nx-gzip/gzip_vas.c
 create mode 100644 tools/testing/selftests/powerpc/nx-gzip/include/copy-pa=
ste.h
 create mode 100644 tools/testing/selftests/powerpc/nx-gzip/include/crb.h
 create mode 100644 tools/testing/selftests/powerpc/nx-gzip/include/nx.h
 create mode 100644 tools/testing/selftests/powerpc/nx-gzip/include/nx_dbg.h
 create mode 100644 tools/testing/selftests/powerpc/nx-gzip/include/nxu.h
 create mode 120000 tools/testing/selftests/powerpc/nx-gzip/include/vas-api=
.h
 create mode 100755 tools/testing/selftests/powerpc/nx-gzip/nx-gzip-test.sh
 create mode 100644 tools/testing/selftests/powerpc/pmu/count_stcx_fail.c
 create mode 100644 tools/testing/selftests/powerpc/signal/sig_sc_double_re=
start.c
