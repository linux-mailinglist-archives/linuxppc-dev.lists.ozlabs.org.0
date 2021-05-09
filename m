Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 626F13777D6
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 May 2021 19:37:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FdWbX45PLz3bnh
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 May 2021 03:37:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FdWb937lYz2yRF
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 May 2021 03:37:05 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4FdWb043xqz9scP;
 Sun,  9 May 2021 19:37:00 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XZVDd0qn-_SS; Sun,  9 May 2021 19:37:00 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4FdWb02VJ6z9sW0;
 Sun,  9 May 2021 19:37:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2E9728B776;
 Sun,  9 May 2021 19:37:00 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id VZKSuwTORfVE; Sun,  9 May 2021 19:37:00 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8134C8B765;
 Sun,  9 May 2021 19:36:59 +0200 (CEST)
Subject: Re: [FSL P50x0] Xorg always restarts again and again after the the
 PowerPC updates 5.13-1
To: Christian Zigotzky <chzigotzky@xenosoft.de>
References: <1b0134d4-4235-b294-8112-dcd5468564bf@csgroup.eu>
 <0A8D70F6-CBD4-44FD-9DB1-69097AEB5FA3@xenosoft.de>
 <10d52780-34ca-2205-8d5c-544a1ff2f248@xenosoft.de>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <72e138cd-5201-a059-e8aa-cebc3db4029c@csgroup.eu>
Date: Sun, 9 May 2021 19:36:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <10d52780-34ca-2205-8d5c-544a1ff2f248@xenosoft.de>
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
Cc: Darren Stevens <darren@stevens-zone.net>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 mad skateman <madskateman@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Thanks for testing

Le 08/05/2021 à 18:39, Christian Zigotzky a écrit :
> On 06 May 2021 at 03:58 pm, Christian Zigotzky wrote:
>> I have started bisecting again.
>>
>> Link: https://forum.hyperion-entertainment.com/viewtopic.php?p=53106#p53106 
>> <https://forum.hyperion-entertainment.com/viewtopic.php?p=53106#p53106>
>>
>>
>>> On 6. May 2021, at 10:09, Christophe Leroy <christophe.leroy@csgroup.eu> wrote:
>>>
>>>
>>> - Can you check that 887f3ceb51cd with cherry-picked 525642624783 has Xorg working ?
> git checkout 887f3ceb51cd
> git cherry-pick 525642624783

Good to know. So this confirms your problem is not related to the commit you bisected initially

> 
> Result: Xorg works.
>>> - Can you bisect between 887f3ceb51cd[good] and 56bec2f9d4d0[bad] to identify first bad commit 
>>> that stops after loading the dtb and uImage ?
>>> - Once that first bad commit is identified, can you check whether the preceeding commit with 
>>> cherry-picked 525642624783 has Xorg working or not ?
>>>
>>> Thanks
>>> Christophe
> git bisect start
> git bisect good 887f3ceb51cd
> git bisect bad 56bec2f9d4d0
> git bisect good -- Xorg restarts again and again but we are looking for the first bad commit that 
> stops the boot after loading the dtb and uImage.
> git bisect good -- Xorg restarts again and again.
> git bisect good -- Xorg restarts again and again.
> git bisect good -- Xorg restarts again and again.
> 
> Result:
> 
> 56bec2f9d4d05675cada96772a8a93010f4d82bf is the first bad commit
> commit 56bec2f9d4d05675cada96772a8a93010f4d82bf
> Author: Michael Ellerman <mpe@ellerman.id.au>
> Date:   Wed Mar 31 11:38:40 2021 +1100
> 
>      powerpc/mm/64s: Add _PAGE_KERNEL_ROX
> 

Here I'm a bit sceptique. This is a book3s related patch and it's only an additional define no I 
can't see how it can break the boot on book3e.

I see that's the top of the range I asked you to bisect on, so there is something wrong in the analysis.

Based on the information you gave in 
https://forum.hyperion-entertainment.com/viewtopic.php?p=53103&sid=c8fc65914bfcba65489240cd5eb7e836#p53103 
, I rerun your bisect and established the following log:

git bisect start '--' 'arch/powerpc'
# good: [627b72bee84d6652e0af26617e71ce2b3c18fcd5] powerpc/signal32: Convert 
restore_[tm]_user_regs() to user access block
git bisect good 627b72bee84d6652e0af26617e71ce2b3c18fcd5
# bad: [c70a4be130de333ea079c59da41cc959712bb01c] Merge tag 'powerpc-5.13-1' of 
git://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux
git bisect bad c70a4be130de333ea079c59da41cc959712bb01c
# bad: [49c1d07fd04f54eb588c4a1dfcedc8d22c5ffd50] powerpc/powernv: Enable HAIL (HV AIL) for ISA v3.1 
processors
git bisect bad 49c1d07fd04f54eb588c4a1dfcedc8d22c5ffd50
# skip: [01c1b9984a12a379f332c39c4b1fd96e473b93b0] powerpc/rtas-proc: remove unused RMO_READ_BUF_MAX
git bisect skip 01c1b9984a12a379f332c39c4b1fd96e473b93b0
# skip: [107dadb046178173dea18e0a78ff8ea3cc27c213] powerpc/perf: Make symbol 
'isa207_pmu_format_attr' static
git bisect skip 107dadb046178173dea18e0a78ff8ea3cc27c213
# skip: [56bec2f9d4d05675cada96772a8a93010f4d82bf] powerpc/mm/64s: Add _PAGE_KERNEL_ROX
git bisect skip 56bec2f9d4d05675cada96772a8a93010f4d82bf
# skip: [2235dea17d56238642121a8085b71d68598534bb] powerpc/pseries/pmem: Make symbol 
'drc_pmem_match' static
git bisect skip 2235dea17d56238642121a8085b71d68598534bb
# skip: [2c02e656a29d5f64193eb93da92781bcf0517146] powerpc/64s: Use htab_convert_pte_flags() in 
hash__mark_rodata_ro()
git bisect skip 2c02e656a29d5f64193eb93da92781bcf0517146
# skip: [472724111f0f72042deb6a9dcee9578e5398a1a1] powerpc/iommu: Enable remaining IOMMU Pagesizes 
present in LoPAR
git bisect skip 472724111f0f72042deb6a9dcee9578e5398a1a1
# skip: [ceff77efa4f8d9f02d8442171b325d3b7068fe5e] powerpc/64e/interrupt: Use new interrupt context 
tracking scheme
git bisect skip ceff77efa4f8d9f02d8442171b325d3b7068fe5e
# skip: [7dcc37b3eff97379b194adb17eb9a8270512dd1d] powerpc/xive: Map one IPI interrupt per node
git bisect skip 7dcc37b3eff97379b194adb17eb9a8270512dd1d
# skip: [097157e16cf8bf91b9cf6fbda05d234d3599c01f] powerpc/64e/interrupt: reconcile irq soft-mask 
state in C
git bisect skip 097157e16cf8bf91b9cf6fbda05d234d3599c01f


Then I looked at the list of commits in the kernel, and identified all the ones marked with ZZ or 
ZZZ as the ones which are up to now identified as not booting. And 
56bec2f9d4d05675cada96772a8a93010f4d82bf is the first commit that you skipped.

Did I do an error in my analysis ?

BAD *   c70a4be130de Merge tag 'powerpc-5.13-1' of 
git://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux
|\
| * 525642624783 powerpc/signal32: Fix erroneous SIGSEGV on RT signal return
| * f9cd5f91a897 powerpc: Avoid clang uninitialized warning in __get_user_size_allowed
| * adb68c38d8d4 powerpc/papr_scm: Mark nvdimm as unarmed if needed during probe
| * ee1bc694fbae powerpc/kvm: Fix build error when PPC_MEM_KEYS/PPC_PSERIES=n
| * 30c400886bad powerpc/kasan: Fix shadow start address with modules
| * fc5590fd56c9 powerpc/kernel/iommu: Use largepool as a last resort when !largealloc
| * 3c0468d4451e powerpc/kernel/iommu: Align size for IOMMU_PAGE_SIZE() to save TCEs
| * ee6b25fa7c03 powerpc/44x: fix spelling mistake in Kconfig "varients" -> "variants"
| * cc7130bf119a powerpc/iommu: Annotate nested lock for lockdep
| * 4be518d83880 powerpc/iommu: Do not immediately panic when failed IOMMU table allocation
| * 7f1fa82d7994 powerpc/iommu: Allocate it_map by vmalloc
| * 0db11461677a selftests/powerpc: remove unneeded semicolon
| * caea7b833d86 powerpc/64s: remove unneeded semicolon
| * f3d03fc748d4 powerpc/eeh: remove unneeded semicolon
| * 290f7d8ce2b1 powerpc/selftests: Add selftest to test concurrent perf/ptrace events
| * c65c64cc7bbd powerpc/selftests/perf-hwbreak: Add testcases for 2nd DAWR
| * c9cb0afb4eaa powerpc/selftests/perf-hwbreak: Coalesce event creation code
| * dae4ff8031b4 powerpc/selftests/ptrace-hwbreak: Add testcases for 2nd DAWR
| * 421a7483878c powerpc/configs: Add IBMVNIC to some 64-bit configs
| * da650ada1009 selftests/powerpc: Add uaccess flush test
| * 8a87a5077143 powerpc/52xx: Fix an invalid ASM expression ('addi' used instead of 'add')
| * 0f197ddce403 powerpc/64s: Fix mm_cpumask memory ordering comment
| * 66d9b7492887 powerpc/perf: Fix the threshold event selection for memory events in power10
| * b4ded42268ee powerpc/perf: Fix sampled instruction type for larx/stcx
| * 0bd3f9e953bd powerpc/legacy_serial: Use early_ioremap()
| * 9ccba66d4d2a powerpc/64: Fix the definition of the fixmap area
| * 389586333c02 powerpc: make ALTIVEC select PPC_FPU
| * 7d9462765707 powerpc/64s: Add FA_DUMP to defconfig
| * d936f8182e1b powerpc/powernv: Fix type of opal_mpipl_query_tag() addr argument
| * 2e341f56a16a powerpc/fadump: Fix sparse warnings
| * 39352430aaa0 powerpc: Move copy_inst_from_kernel_nofault()
| * 41d6cf68b5f6 powerpc: Rename probe_kernel_read_inst()
| * 6449078d5011 powerpc: Make probe_kernel_read_inst() common to PPC32 and PPC64
| * 6ac7897f08e0 powerpc: Remove probe_user_read_inst()
| * ee7c3ec3b4b1 powerpc/ebpf32: Use standard function call for functions within 32M distance
| * e7de0023e123 powerpc/ebpf32: Rework 64 bits shifts to avoid tests and branches
| * d228cc496966 powerpc/ebpf32: Fix comment on BPF_ALU{64} | BPF_LSH | BPF_K
| * 867e762480f4 powerpc/32: Use r2 in wrtspr() instead of r0
| * f56607e85ee3 selftests/timens: Fix gettime_perf to work on powerpc
| * 92d9d61be519 powerpc/mce: save ignore_event flag unconditionally for UE
| * eacf4c020265 powerpc: Enable OPTPROBES on PPC32
| * 693557ebf407 powerpc/inst: ppc_inst_as_u64() becomes ppc_inst_as_ulong()
| * e522331173ec powerpc/irq: Enhance readability of trap types
| * 7fab639729ce powerpc/32s: Enhance readability of trap types
| * 0f5eb28a6ce6 powerpc/8xx: Enhance readability of trap types
| * a9d2f9bb225f powerpc/pseries/iommu: Fix window size for direct mapping with pmem
| * e4e8bc1df691 powerpc/kvm: Fix PR KVM with KUAP/MEM_KEYS enabled
| * ed8029d7b472 powerpc/pseries: Stop calling printk in rtas_stop_self()
| * 3027a37c06be powerpc: Only define _TASK_CPU for 32-bit
| * 39d0099f9439 powerpc/pseries: Add shutdown() to vio_driver and vio_bus
| * af31fd0c9107 powerpc/perf: Expose processor pipeline stage cycles using PERF_SAMPLE_WEIGHT_STRUCT
| * 2886e2df10be Documentation/powerpc: Add proper links for manual and tests
| * 29c9a2699e71 powerpc/pseries: Set UNISOLATE on dlpar_cpu_remove() failure
| * 0e3b3ff83ce2 powerpc/pseries: Introduce dlpar_unisolate_drc()
| * 864ec4d40c83 powerpc/pseries/mce: Fix a typo in error type assignment
| * cbd3d5ba46b6 powerpc/fadump: Fix compile error since trap type change
| * d8a1d6c58986 powerpc/perf: Add platform specific check_attr_config
| *   a38cb4171928 Merge branch 'topic/ppc-kvm' into next
| |\
| | * 732f21a3053c KVM: PPC: Book3S HV: Ensure MSR[HV] is always clear in guest MSR
| | * 946cf44ac6ce KVM: PPC: Book3S HV: Ensure MSR[ME] is always set in guest MSR
| | * da487a5d1bee powerpc/64s: remove KVM SKIP test from instruction breakpoint handler
| | * 5eee8371828a powerpc/64s: Remove KVM handler support from CBE_RAS interrupts
| | * 0fd85cb83fbd KVM: PPC: Book3S HV: Fix CONFIG_SPAPR_TCE_IOMMU=n default hcalls
| | * 6c12c4376bbb KVM: PPC: Book3S HV: remove unused kvmppc_h_protect argument
| | * 4b5f0a0d49e6 KVM: PPC: Book3S HV: Remove redundant mtspr PSPB
| | * 72c15287210f KVM: PPC: Book3S HV: Prevent radix guests setting LPCR[TC]
| | * bcc92a0d6d6e KVM: PPC: Book3S HV: Disallow LPCR[AIL] to be set to 1 or 2
| | * 67145ef4960f KVM: PPC: Book3S HV: Add a function to filter guest LPCR bits
| | * a19b70abc69a KVM: PPC: Book3S HV: Nested move LPCR sanitising to sanitise_hv_regs
| | * 5088eb4092df KVM: PPC: Book3S HV P9: Restore host CTRL SPR after guest exit
BAD | * | 49c1d07fd04f powerpc/powernv: Enable HAIL (HV AIL) for ISA v3.1 processors
| * | 6980d13f0dd1 powerpc/smp: Set numa node before updating mask
| * | 7153d4bf0b37 powerpc/traps: Enhance readability for trap types
| * | 7de21e679e6a powerpc: fix EDEADLOCK redefinition error in uapi/asm/errno.h
| * | c1e53367dab1 powerpc/smp: Cache CPU to chip lookup
| * | 131c82b6a1d2 Revert "powerpc/topology: Update topology_core_cpumask"
| * | c47f892d7aa6 powerpc/smp: Reintroduce cpu_core_mask
| * | e9e16917bc38 powerpc/xive: Use the "ibm, chip-id" property only under PowerNV
| * | 38d0b1c9cec7 powerpc/pseries: extract host bridge from pci_bus prior to bus removal
| * | 0751fdf28041 macintosh/via-pmu: Fix build warning
| * | 7767d9ac89ce powerpc/papr_scm: Fix build error due to wrong printf specifier
| * | d6481a7195df powerpc/configs: Add PAPR_SCM to pseries_defconfig
| * | 7098f8f0cf03 powerpc/mm/radix: Make radix__change_memory_range() static
| * | 74205b3fc2ef powerpc/vdso: Add support for time namespaces
| * | 1c4bce675385 powerpc/vdso: Separate vvar vma from vdso
| * | 808094fcbf41 lib/vdso: Add vdso_data pointer as input to __arch_get_timens_vdso_data()
| * | 58efe9f696cf lib/vdso: Mark do_hres_timens() and do_coarse_timens() __always_inline()
| * | 8f6cc75a97d1 powerpc: move norestart trap flag to bit 0
| * | 8dc7f0229b78 powerpc: remove partial register save logic
| * | c45ba4f44f6b powerpc: clean up do_page_fault
| * | d738ee8d56de powerpc/64e/interrupt: handle bad_page_fault in C
ZZ | * | ceff77efa4f8 powerpc/64e/interrupt: Use new interrupt context tracking scheme
ZZ | * | 097157e16cf8 powerpc/64e/interrupt: reconcile irq soft-mask state in C
| * | 3db8aa10de9a powerpc/64e/interrupt: NMI save irq soft-mask state in C
ZZ | * | 0c2472de23ae powerpc/64e/interrupt: use new interrupt return
| * | dc6231821a14 powerpc/interrupt: update common interrupt code for
| * | 4228b2c3d20e powerpc/64e/interrupt: always save nvgprs on interrupt
| * | 5a5a893c4ad8 powerpc/syscall: switch user_exit_irqoff and trace_hardirqs_off order
ZZ | * | 2e2a441d2c0b powerpc/perf: Infrastructure to support checking of attr.config*
| * | 59fd366b9bef powerpc/fadump: make symbol 'rtas_fadump_set_regval' static
| * | 7e9ab144c128 powerpc/mem: Use kmap_local_page() in flushing functions
| * | 6c96020882b1 powerpc/mem: Inline flush_dcache_page()
| * | 67b8e6af191a powerpc/mem: Help GCC realise __flush_dcache_icache() flushes single pages
| * | 52d490437ffb powerpc/mem: flush_dcache_icache_phys() is for HIGHMEM pages only
| * | cd97d9e8b5aa powerpc/mem: Optimise flush_dcache_icache_hugepage()
| * | e618c7aea1f2 powerpc/mem: Call flush_coherent_icache() at higher level
| * | 131637a17dc9 powerpc/mem: Remove address argument to flush_coherent_icache()
| * | bf26e0bbd2f8 powerpc/mem: Declare __flush_dcache_icache() static
| * | b26e8f27253a powerpc/mem: Move cache flushing functions into mm/cacheflush.c
| * | ff0b4155ae99 powerpc/powernv: make symbol 'mpipl_kobj' static
| * | f234ad405a35 powerpc/xmon: Make symbol 'spu_inst_dump' static
| * | cc331eee03ea powerpc/perf/hv-24x7: Make some symbols static
ZZZ | * | 107dadb04617 powerpc/perf: Make symbol 'isa207_pmu_format_attr' static
ZZZ | * | 2235dea17d56 powerpc/pseries/pmem: Make symbol 'drc_pmem_match' static
| * | 193e4cd8ed9d powerpc/pseries: Make symbol '__pcpu_scope_hcall_stats' static
ZZ | * | 472724111f0f powerpc/iommu: Enable remaining IOMMU Pagesizes present in LoPAR
| * | 672bff581e19 powerpc/syscalls: switch to generic syscallhdr.sh
XX | * | 14b3c9d24a7a powerpc/syscalls: switch to generic syscalltbl.sh
ZZ | * | e5d56763525e powerpc/rtas: rename RTAS_RMOBUF_MAX to RTAS_USER_REGION_SIZE
ZZ | * | 0649cdc82379 powerpc/rtas: move syscall filter setup into separate function
| * | 0ab1c929ae38 powerpc/rtas: remove ibm_suspend_me_token
ZZZ | * | 01c1b9984a12 powerpc/rtas-proc: remove unused RMO_READ_BUF_MAX
ZZ | * | c13ff6f32513 powerpc/rtas: improve ppc_rtas_rmo_buf_show documentation
| * | 5ae5bc12d072 powerpc/eeh: Fix EEH handling for hugepages in ioremap space.
XX | * | fd6db2892eba powerpc/xive: Modernize XIVE-IPI domain with an 'alloc' handler
ZZ | * | 7dcc37b3eff9 powerpc/xive: Map one IPI interrupt per node
| * | 33e4bc594643 powerpc/xive: Fix xmon command "dxi"
| * | 6bf66eb8f404 powerpc/xive: Simplify the dump of XIVE interrupts under xmon
| * | a74ce5926b20 powerpc/xive: Drop check on irq_data in xive_core_debug_show()
| * | 5159d9872823 powerpc/xive: Simplify xive_core_debug_show()
| * | 1835e72942b5 powerpc/xive: Remove useless check on XIVE_IPI_HW_IRQ
| * | 7d348494136c powerpc/xive: Introduce an IPI interrupt domain
| * | 078277acbd7c powerpc/smp: Make some symbols static
| * | 95d143923379 macintosh/via-pmu: Make some symbols static
| * | 4204ecd598cb windfarm: make symbol 'wf_thread' static
| * | 13ddd0e3acf9 macintosh/windfarm: Make symbol 'pm121_sys_state' static
| * | f6f1f48e8b3b powerpc/mce: Make symbol 'mce_ue_event_work' static
| * | 7f262b4dcf7e powerpc/security: Make symbol 'stf_barrier' static
| * | 80edc68e0479 powerpc/32s: Define a MODULE area below kernel text all the time
| * | 9132a2e82adc powerpc/8xx: Define a MODULE area below kernel text
| * | 2ec13df16704 powerpc/modules: Load modules closer to kernel text
| * | a5d6a3e73acb powerpc/mm: Add cond_resched() while removing hpte mappings
| * | 75b7c05ebf90 powerpc/papr_scm: Implement support for H_SCM_FLUSH hcall
| * | af072b1a9d4d powerpc/signal32: Fix build failure with CONFIG_SPE
| * | c46bbf5d2def powerpc/32: Remove powerpc specific definition of 'ptrdiff_t'
| * | b27dadecdf91 powerpc: iommu: fix build when neither PCI or IBMVIO is set
| * | 01ed0510941a powerpc/pseries: remove unneeded semicolon
ZZ | * | 98db179a78dd powerpc/64s: power4 nap fixup in C
| * | 10f8f96179ec powerpc/perf: Fix PMU constraint check for EBB events
| * | 812aa68ef7d4 selftests/powerpc: Suggest memtrace instead of /dev/mem for ci memory
ZZ | * | 08a022ad3dfa powerpc/powernv/memtrace: Allow mmaping trace buffers
| * | acd4dfeb49c8 powerpc/kexec: Don't use .machine ppc64 in trampoline_64.S
| * | c6b4c9147f8b powerpc/64: Move security code into security.c
| * | bd573a81312f powerpc/mm/64s: Allow STRICT_KERNEL_RWX again
| * | 87e65ad7bd3a powerpc/mm/64s/hash: Add real-mode change_memory_range() for hash LPAR
| * | 6f223ebe9c3f powerpc/mm/64s/hash: Factor out change_memory_range()
ZZZ | * | 2c02e656a29d powerpc/64s: Use htab_convert_pte_flags() in hash__mark_rodata_ro()
| * | b56d55a5aa4a powerpc/pseries: Add key to flags in pSeries_lpar_hpte_updateboltedpp()
ZZZ | * | 56bec2f9d4d0 powerpc/mm/64s: Add _PAGE_KERNEL_ROX
| * | 29e3ea8cbd29 selftests/powerpc: Test for spurious kernel memory faults on radix
| * | b8b2f37cf632 powerpc/64s: Fix pte update for kernel memory on radix
| * | 4763d3782764 powerpc: Spelling/typo fixes
| * | b0b3b2c78ec0 powerpc: Switch to relative jump labels
| * | 40272035e1d0 powerpc/bpf: Reallocate BPF registers to volatile registers when possible on PPC32
| * | 51c66ad849a7 powerpc/bpf: Implement extended BPF on PPC32
| * | 355a8d26cd04 powerpc/asm: Add some opcodes in asm/ppc-opcode.h for PPC32 eBPF
| * | c426810fcf9f powerpc/bpf: Change values of SEEN_ flags
| * | 4ea76e90a97d powerpc/bpf: Move common functions into bpf_jit_comp.c
| * | f1b1583d5faa powerpc/bpf: Move common helpers into bpf_jit.h
| * | ed573b57e77a powerpc/bpf: Change register numbering for bpf_set/is_seen_register()
| * | 6944caad78fc powerpc/bpf: Remove classical BPF support for PPC32
| * | c7393a71eb1a powerpc/signal32: Simplify logging in sigreturn()
BAD? | * | 887f3ceb51cd powerpc/signal32: Convert do_setcontext[_tm]() to user access block
GOOD | * | 627b72bee84d powerpc/signal32: Convert restore_[tm]_user_regs() to user access block
| * | 036fc2cb1dc2 powerpc/signal32: Reorder user reads in restore_tm_user_regs()


Christophe
