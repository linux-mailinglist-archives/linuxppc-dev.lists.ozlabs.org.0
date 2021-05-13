Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B73A937F334
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 May 2021 08:48:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fgj0h5Zzwz30Bc
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 May 2021 16:48:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=MTgih44z;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mo4-p00-ob.smtp.rzone.de (client-ip=85.215.255.21;
 helo=mo4-p00-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256
 header.s=strato-dkim-0002 header.b=MTgih44z; 
 dkim-atps=neutral
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [85.215.255.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fgj044Rsxz2yZ2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 May 2021 16:47:46 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; t=1620888438; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=nQY8iz6EE6XVCZRp2NG8DyT8njWa9rEqcTrd6PPlD3YYwt3krHNStvmUVFM1257sKs
 Hpv8o5ivahf5NHAqEqHRNrBaImBMF7TGk/eZkF/WnlvWYYBG9GkTxaljBXIsMxaiCv74
 d2bRD83cO8Aj8wTfBGMQczeH9Nx51o+X9iMBl2gaoiTZMSROUh+oox2dJIt6hrIzfEfq
 bbOI6kB6SD9AnF1NVvO0NsMoxL2rECmqrkOoRRc3W3HDE43mmZZcILNn0pMve8BID6od
 9zoEJpa4qfnOdLIvWIAAWKbeq8Ya5s3RiMBJbwjjj4VoiK0mkPS17Ahoxmwzui951MMg
 H/8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1620888438;
 s=strato-dkim-0002; d=strato.com;
 h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
 From:Subject:Sender;
 bh=Z9lza8KRONQz2RBle9s6km+TVQP2XVKhDsO9nHGDHHc=;
 b=r9O6RwAmX3PvENNku6wvk4b+JGsNtlah2So2ejWnMqFJFrkz7i/McSm6Zs60sa4Lum
 i+t8tfDhB+q+5MpdBqVikkYRMM+Yu6pKU65+ETbAiWKsx+RTS5Jz4iyf99f5tvhp1+HD
 VJu2xqjN+pLTMkHc5YNnqeXCjn/HR2rb3rlxqJTRm+B3IGNAewYqFgXfvGpiXgKhDwPJ
 Lui2p/y13Eu3G+irx1kl6HFzG7iST1HEMjm+HUZnxrE3cFOoBljB0gXBgY1h7FZrZY++
 EtVxEjTmM1f56DIyl4OdF3Lg/RVzaCL//2uwqzx9zE3kDalJGmYaOmgTWlZSEOY+vpkq
 BtRA==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1620888438;
 s=strato-dkim-0002; d=xenosoft.de;
 h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
 From:Subject:Sender;
 bh=Z9lza8KRONQz2RBle9s6km+TVQP2XVKhDsO9nHGDHHc=;
 b=MTgih44zMQGih9bu4gVyywXBlVXn5VDUamymFze8e2Fx1LzZI1rMTnV3bgRCXf/5aX
 8q/6pYJvBoC7nVUWtamuvOPyY5458cueZQ+gtXGtt7zvsQpLhXspb3Lo6c62viNNZBYY
 KLnHv8/0H1O9qOM6ZQRO7wo2JOSMHJzOv3N4AZCYYTBsd++UDkesXMV9KRi4lUBEkA4z
 TNGiRxjfakt4CTs/d9qAQJkRng+WVSpJjRV4UMLslrXxKnR1tVwJWvnFfK7cvBaDHT0R
 3VCloyeALeBbZ/kNcN7mGbhZQJZzgp48SpArgvTwjSxaNGmcUVtdwU1ECjG5CL5/hT4r
 rQHQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6KxrfO5Oh7R7bGd4jroxwyMkTmu25/eY+DCqtjmIXdN0fr1/mpU="
X-RZG-CLASS-ID: mo00
Received: from [IPv6:2a01:598:a095:d7e0:51c6:a915:b1d1:c15]
 by smtp.strato.de (RZmta 47.25.7 AUTH)
 with ESMTPSA id j00466x4D6lG6SF
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 13 May 2021 08:47:16 +0200 (CEST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Mime-Version: 1.0 (1.0)
Subject: Re: [FSL P50x0] Xorg always restarts again and again after the the
 PowerPC updates 5.13-1
Date: Thu, 13 May 2021 08:47:15 +0200
Message-Id: <65116250-6EEB-4419-8A7D-B0882379A68B@xenosoft.de>
References: <72e138cd-5201-a059-e8aa-cebc3db4029c@csgroup.eu>
In-Reply-To: <72e138cd-5201-a059-e8aa-cebc3db4029c@csgroup.eu>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
X-Mailer: iPhone Mail (18D70)
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

Hi Christophe,

> On 9. May 2021, at 19:37, Christophe Leroy <christophe.leroy@csgroup.eu> w=
rote:
>=20
> Did I do an error in my analysis ?

No, you didn=E2=80=99t. On the contrary you have found the issue. ;-) The is=
sue is somewhere in the new interrupt code.

> ZZ | * | ceff77efa4f8 powerpc/64e/interrupt: Use new interrupt context tra=
cking scheme

Could you please create a patch for reverting the new interrupt code? I woul=
d like to confirm your result.

Thanks for your help,
Christian

>=20
> BAD *   c70a4be130de Merge tag 'powerpc-5.13-1' of git://git.kernel.org/pu=
b/scm/linux/kernel/git/powerpc/linux
> |\
> | * 525642624783 powerpc/signal32: Fix erroneous SIGSEGV on RT signal retu=
rn
> | * f9cd5f91a897 powerpc: Avoid clang uninitialized warning in __get_user_=
size_allowed
> | * adb68c38d8d4 powerpc/papr_scm: Mark nvdimm as unarmed if needed during=
 probe
> | * ee1bc694fbae powerpc/kvm: Fix build error when PPC_MEM_KEYS/PPC_PSERIE=
S=3Dn
> | * 30c400886bad powerpc/kasan: Fix shadow start address with modules
> | * fc5590fd56c9 powerpc/kernel/iommu: Use largepool as a last resort when=
 !largealloc
> | * 3c0468d4451e powerpc/kernel/iommu: Align size for IOMMU_PAGE_SIZE() to=
 save TCEs
> | * ee6b25fa7c03 powerpc/44x: fix spelling mistake in Kconfig "varients" -=
> "variants"
> | * cc7130bf119a powerpc/iommu: Annotate nested lock for lockdep
> | * 4be518d83880 powerpc/iommu: Do not immediately panic when failed IOMMU=
 table allocation
> | * 7f1fa82d7994 powerpc/iommu: Allocate it_map by vmalloc
> | * 0db11461677a selftests/powerpc: remove unneeded semicolon
> | * caea7b833d86 powerpc/64s: remove unneeded semicolon
> | * f3d03fc748d4 powerpc/eeh: remove unneeded semicolon
> | * 290f7d8ce2b1 powerpc/selftests: Add selftest to test concurrent perf/p=
trace events
> | * c65c64cc7bbd powerpc/selftests/perf-hwbreak: Add testcases for 2nd DAW=
R
> | * c9cb0afb4eaa powerpc/selftests/perf-hwbreak: Coalesce event creation c=
ode
> | * dae4ff8031b4 powerpc/selftests/ptrace-hwbreak: Add testcases for 2nd D=
AWR
> | * 421a7483878c powerpc/configs: Add IBMVNIC to some 64-bit configs
> | * da650ada1009 selftests/powerpc: Add uaccess flush test
> | * 8a87a5077143 powerpc/52xx: Fix an invalid ASM expression ('addi' used i=
nstead of 'add')
> | * 0f197ddce403 powerpc/64s: Fix mm_cpumask memory ordering comment
> | * 66d9b7492887 powerpc/perf: Fix the threshold event selection for memor=
y events in power10
> | * b4ded42268ee powerpc/perf: Fix sampled instruction type for larx/stcx
> | * 0bd3f9e953bd powerpc/legacy_serial: Use early_ioremap()
> | * 9ccba66d4d2a powerpc/64: Fix the definition of the fixmap area
> | * 389586333c02 powerpc: make ALTIVEC select PPC_FPU
> | * 7d9462765707 powerpc/64s: Add FA_DUMP to defconfig
> | * d936f8182e1b powerpc/powernv: Fix type of opal_mpipl_query_tag() addr a=
rgument
> | * 2e341f56a16a powerpc/fadump: Fix sparse warnings
> | * 39352430aaa0 powerpc: Move copy_inst_from_kernel_nofault()
> | * 41d6cf68b5f6 powerpc: Rename probe_kernel_read_inst()
> | * 6449078d5011 powerpc: Make probe_kernel_read_inst() common to PPC32 an=
d PPC64
> | * 6ac7897f08e0 powerpc: Remove probe_user_read_inst()
> | * ee7c3ec3b4b1 powerpc/ebpf32: Use standard function call for functions w=
ithin 32M distance
> | * e7de0023e123 powerpc/ebpf32: Rework 64 bits shifts to avoid tests and b=
ranches
> | * d228cc496966 powerpc/ebpf32: Fix comment on BPF_ALU{64} | BPF_LSH | BP=
F_K
> | * 867e762480f4 powerpc/32: Use r2 in wrtspr() instead of r0
> | * f56607e85ee3 selftests/timens: Fix gettime_perf to work on powerpc
> | * 92d9d61be519 powerpc/mce: save ignore_event flag unconditionally for U=
E
> | * eacf4c020265 powerpc: Enable OPTPROBES on PPC32
> | * 693557ebf407 powerpc/inst: ppc_inst_as_u64() becomes ppc_inst_as_ulong=
()
> | * e522331173ec powerpc/irq: Enhance readability of trap types
> | * 7fab639729ce powerpc/32s: Enhance readability of trap types
> | * 0f5eb28a6ce6 powerpc/8xx: Enhance readability of trap types
> | * a9d2f9bb225f powerpc/pseries/iommu: Fix window size for direct mapping=
 with pmem
> | * e4e8bc1df691 powerpc/kvm: Fix PR KVM with KUAP/MEM_KEYS enabled
> | * ed8029d7b472 powerpc/pseries: Stop calling printk in rtas_stop_self()
> | * 3027a37c06be powerpc: Only define _TASK_CPU for 32-bit
> | * 39d0099f9439 powerpc/pseries: Add shutdown() to vio_driver and vio_bus=

> | * af31fd0c9107 powerpc/perf: Expose processor pipeline stage cycles usin=
g PERF_SAMPLE_WEIGHT_STRUCT
> | * 2886e2df10be Documentation/powerpc: Add proper links for manual and te=
sts
> | * 29c9a2699e71 powerpc/pseries: Set UNISOLATE on dlpar_cpu_remove() fail=
ure
> | * 0e3b3ff83ce2 powerpc/pseries: Introduce dlpar_unisolate_drc()
> | * 864ec4d40c83 powerpc/pseries/mce: Fix a typo in error type assignment
> | * cbd3d5ba46b6 powerpc/fadump: Fix compile error since trap type change
> | * d8a1d6c58986 powerpc/perf: Add platform specific check_attr_config
> | *   a38cb4171928 Merge branch 'topic/ppc-kvm' into next
> | |\
> | | * 732f21a3053c KVM: PPC: Book3S HV: Ensure MSR[HV] is always clear in g=
uest MSR
> | | * 946cf44ac6ce KVM: PPC: Book3S HV: Ensure MSR[ME] is always set in gu=
est MSR
> | | * da487a5d1bee powerpc/64s: remove KVM SKIP test from instruction brea=
kpoint handler
> | | * 5eee8371828a powerpc/64s: Remove KVM handler support from CBE_RAS in=
terrupts
> | | * 0fd85cb83fbd KVM: PPC: Book3S HV: Fix CONFIG_SPAPR_TCE_IOMMU=3Dn def=
ault hcalls
> | | * 6c12c4376bbb KVM: PPC: Book3S HV: remove unused kvmppc_h_protect arg=
ument
> | | * 4b5f0a0d49e6 KVM: PPC: Book3S HV: Remove redundant mtspr PSPB
> | | * 72c15287210f KVM: PPC: Book3S HV: Prevent radix guests setting LPCR[=
TC]
> | | * bcc92a0d6d6e KVM: PPC: Book3S HV: Disallow LPCR[AIL] to be set to 1 o=
r 2
> | | * 67145ef4960f KVM: PPC: Book3S HV: Add a function to filter guest LPC=
R bits
> | | * a19b70abc69a KVM: PPC: Book3S HV: Nested move LPCR sanitising to san=
itise_hv_regs
> | | * 5088eb4092df KVM: PPC: Book3S HV P9: Restore host CTRL SPR after gue=
st exit
> BAD | * | 49c1d07fd04f powerpc/powernv: Enable HAIL (HV AIL) for ISA v3.1 p=
rocessors
> | * | 6980d13f0dd1 powerpc/smp: Set numa node before updating mask
> | * | 7153d4bf0b37 powerpc/traps: Enhance readability for trap types
> | * | 7de21e679e6a powerpc: fix EDEADLOCK redefinition error in uapi/asm/e=
rrno.h
> | * | c1e53367dab1 powerpc/smp: Cache CPU to chip lookup
> | * | 131c82b6a1d2 Revert "powerpc/topology: Update topology_core_cpumask"=

> | * | c47f892d7aa6 powerpc/smp: Reintroduce cpu_core_mask
> | * | e9e16917bc38 powerpc/xive: Use the "ibm, chip-id" property only unde=
r PowerNV
> | * | 38d0b1c9cec7 powerpc/pseries: extract host bridge from pci_bus prior=
 to bus removal
> | * | 0751fdf28041 macintosh/via-pmu: Fix build warning
> | * | 7767d9ac89ce powerpc/papr_scm: Fix build error due to wrong printf s=
pecifier
> | * | d6481a7195df powerpc/configs: Add PAPR_SCM to pseries_defconfig
> | * | 7098f8f0cf03 powerpc/mm/radix: Make radix__change_memory_range() sta=
tic
> | * | 74205b3fc2ef powerpc/vdso: Add support for time namespaces
> | * | 1c4bce675385 powerpc/vdso: Separate vvar vma from vdso
> | * | 808094fcbf41 lib/vdso: Add vdso_data pointer as input to __arch_get_=
timens_vdso_data()
> | * | 58efe9f696cf lib/vdso: Mark do_hres_timens() and do_coarse_timens() _=
_always_inline()
> | * | 8f6cc75a97d1 powerpc: move norestart trap flag to bit 0
> | * | 8dc7f0229b78 powerpc: remove partial register save logic
> | * | c45ba4f44f6b powerpc: clean up do_page_fault
> | * | d738ee8d56de powerpc/64e/interrupt: handle bad_page_fault in C
> ZZ | * | ceff77efa4f8 powerpc/64e/interrupt: Use new interrupt context tra=
cking scheme
> ZZ | * | 097157e16cf8 powerpc/64e/interrupt: reconcile irq soft-mask state=
 in C
> | * | 3db8aa10de9a powerpc/64e/interrupt: NMI save irq soft-mask state in C=

> ZZ | * | 0c2472de23ae powerpc/64e/interrupt: use new interrupt return
> | * | dc6231821a14 powerpc/interrupt: update common interrupt code for
> | * | 4228b2c3d20e powerpc/64e/interrupt: always save nvgprs on interrupt
> | * | 5a5a893c4ad8 powerpc/syscall: switch user_exit_irqoff and trace_hard=
irqs_off order
> ZZ | * | 2e2a441d2c0b powerpc/perf: Infrastructure to support checking of a=
ttr.config*
> | * | 59fd366b9bef powerpc/fadump: make symbol 'rtas_fadump_set_regval' st=
atic
> | * | 7e9ab144c128 powerpc/mem: Use kmap_local_page() in flushing function=
s
> | * | 6c96020882b1 powerpc/mem: Inline flush_dcache_page()
> | * | 67b8e6af191a powerpc/mem: Help GCC realise __flush_dcache_icache() f=
lushes single pages
> | * | 52d490437ffb powerpc/mem: flush_dcache_icache_phys() is for HIGHMEM p=
ages only
> | * | cd97d9e8b5aa powerpc/mem: Optimise flush_dcache_icache_hugepage()
> | * | e618c7aea1f2 powerpc/mem: Call flush_coherent_icache() at higher lev=
el
> | * | 131637a17dc9 powerpc/mem: Remove address argument to flush_coherent_=
icache()
> | * | bf26e0bbd2f8 powerpc/mem: Declare __flush_dcache_icache() static
> | * | b26e8f27253a powerpc/mem: Move cache flushing functions into mm/cach=
eflush.c
> | * | ff0b4155ae99 powerpc/powernv: make symbol 'mpipl_kobj' static
> | * | f234ad405a35 powerpc/xmon: Make symbol 'spu_inst_dump' static
> | * | cc331eee03ea powerpc/perf/hv-24x7: Make some symbols static
> ZZZ | * | 107dadb04617 powerpc/perf: Make symbol 'isa207_pmu_format_attr' s=
tatic
> ZZZ | * | 2235dea17d56 powerpc/pseries/pmem: Make symbol 'drc_pmem_match' s=
tatic
> | * | 193e4cd8ed9d powerpc/pseries: Make symbol '__pcpu_scope_hcall_stats'=
 static
> ZZ | * | 472724111f0f powerpc/iommu: Enable remaining IOMMU Pagesizes pres=
ent in LoPAR
> | * | 672bff581e19 powerpc/syscalls: switch to generic syscallhdr.sh
> XX | * | 14b3c9d24a7a powerpc/syscalls: switch to generic syscalltbl.sh
> ZZ | * | e5d56763525e powerpc/rtas: rename RTAS_RMOBUF_MAX to RTAS_USER_RE=
GION_SIZE
> ZZ | * | 0649cdc82379 powerpc/rtas: move syscall filter setup into separat=
e function
> | * | 0ab1c929ae38 powerpc/rtas: remove ibm_suspend_me_token
> ZZZ | * | 01c1b9984a12 powerpc/rtas-proc: remove unused RMO_READ_BUF_MAX
> ZZ | * | c13ff6f32513 powerpc/rtas: improve ppc_rtas_rmo_buf_show document=
ation
> | * | 5ae5bc12d072 powerpc/eeh: Fix EEH handling for hugepages in ioremap s=
pace.
> XX | * | fd6db2892eba powerpc/xive: Modernize XIVE-IPI domain with an 'all=
oc' handler
> ZZ | * | 7dcc37b3eff9 powerpc/xive: Map one IPI interrupt per node
> | * | 33e4bc594643 powerpc/xive: Fix xmon command "dxi"
> | * | 6bf66eb8f404 powerpc/xive: Simplify the dump of XIVE interrupts unde=
r xmon
> | * | a74ce5926b20 powerpc/xive: Drop check on irq_data in xive_core_debug=
_show()
> | * | 5159d9872823 powerpc/xive: Simplify xive_core_debug_show()
> | * | 1835e72942b5 powerpc/xive: Remove useless check on XIVE_IPI_HW_IRQ
> | * | 7d348494136c powerpc/xive: Introduce an IPI interrupt domain
> | * | 078277acbd7c powerpc/smp: Make some symbols static
> | * | 95d143923379 macintosh/via-pmu: Make some symbols static
> | * | 4204ecd598cb windfarm: make symbol 'wf_thread' static
> | * | 13ddd0e3acf9 macintosh/windfarm: Make symbol 'pm121_sys_state' stati=
c
> | * | f6f1f48e8b3b powerpc/mce: Make symbol 'mce_ue_event_work' static
> | * | 7f262b4dcf7e powerpc/security: Make symbol 'stf_barrier' static
> | * | 80edc68e0479 powerpc/32s: Define a MODULE area below kernel text all=
 the time
> | * | 9132a2e82adc powerpc/8xx: Define a MODULE area below kernel text
> | * | 2ec13df16704 powerpc/modules: Load modules closer to kernel text
> | * | a5d6a3e73acb powerpc/mm: Add cond_resched() while removing hpte mapp=
ings
> | * | 75b7c05ebf90 powerpc/papr_scm: Implement support for H_SCM_FLUSH hca=
ll
> | * | af072b1a9d4d powerpc/signal32: Fix build failure with CONFIG_SPE
> | * | c46bbf5d2def powerpc/32: Remove powerpc specific definition of 'ptrd=
iff_t'
> | * | b27dadecdf91 powerpc: iommu: fix build when neither PCI or IBMVIO is=
 set
> | * | 01ed0510941a powerpc/pseries: remove unneeded semicolon
> ZZ | * | 98db179a78dd powerpc/64s: power4 nap fixup in C
> | * | 10f8f96179ec powerpc/perf: Fix PMU constraint check for EBB events
> | * | 812aa68ef7d4 selftests/powerpc: Suggest memtrace instead of /dev/mem=
 for ci memory
> ZZ | * | 08a022ad3dfa powerpc/powernv/memtrace: Allow mmaping trace buffer=
s
> | * | acd4dfeb49c8 powerpc/kexec: Don't use .machine ppc64 in trampoline_6=
4.S
> | * | c6b4c9147f8b powerpc/64: Move security code into security.c
> | * | bd573a81312f powerpc/mm/64s: Allow STRICT_KERNEL_RWX again
> | * | 87e65ad7bd3a powerpc/mm/64s/hash: Add real-mode change_memory_range(=
) for hash LPAR
> | * | 6f223ebe9c3f powerpc/mm/64s/hash: Factor out change_memory_range()
> ZZZ | * | 2c02e656a29d powerpc/64s: Use htab_convert_pte_flags() in hash__=
mark_rodata_ro()
> | * | b56d55a5aa4a powerpc/pseries: Add key to flags in pSeries_lpar_hpte_=
updateboltedpp()
> ZZZ | * | 56bec2f9d4d0 powerpc/mm/64s: Add _PAGE_KERNEL_ROX
> | * | 29e3ea8cbd29 selftests/powerpc: Test for spurious kernel memory faul=
ts on radix
> | * | b8b2f37cf632 powerpc/64s: Fix pte update for kernel memory on radix
> | * | 4763d3782764 powerpc: Spelling/typo fixes
> | * | b0b3b2c78ec0 powerpc: Switch to relative jump labels
> | * | 40272035e1d0 powerpc/bpf: Reallocate BPF registers to volatile regis=
ters when possible on PPC32
> | * | 51c66ad849a7 powerpc/bpf: Implement extended BPF on PPC32
> | * | 355a8d26cd04 powerpc/asm: Add some opcodes in asm/ppc-opcode.h for P=
PC32 eBPF
> | * | c426810fcf9f powerpc/bpf: Change values of SEEN_ flags
> | * | 4ea76e90a97d powerpc/bpf: Move common functions into bpf_jit_comp.c
> | * | f1b1583d5faa powerpc/bpf: Move common helpers into bpf_jit.h
> | * | ed573b57e77a powerpc/bpf: Change register numbering for bpf_set/is_s=
een_register()
> | * | 6944caad78fc powerpc/bpf: Remove classical BPF support for PPC32
> | * | c7393a71eb1a powerpc/signal32: Simplify logging in sigreturn()
> BAD? | * | 887f3ceb51cd powerpc/signal32: Convert do_setcontext[_tm]() to u=
ser access block
> GOOD | * | 627b72bee84d powerpc/signal32: Convert restore_[tm]_user_regs()=
 to user access block
> | * | 036fc2cb1dc2 powerpc/signal32: Reorder user reads in restore_tm_user=
_regs()
>=20
>=20
> Christophe

