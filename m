Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B3AB30D9BB
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 13:25:30 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DW19M2NzNzDxVF
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 23:25:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4DW09V0PkhzDwt7
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Feb 2021 22:40:29 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4DW09S2y65z9vFb; Wed,  3 Feb 2021 22:40:27 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Cédric Le Goater <clg@kaod.org>
In-Reply-To: <20210104143206.695198-1-clg@kaod.org>
References: <20210104143206.695198-1-clg@kaod.org>
Subject: Re: [PATCH v2 00/23] powerpc: Fix W=1 compile errors
Message-Id: <161235200517.1516112.15211493146402587302.b4-ty@ellerman.id.au>
Date: Wed,  3 Feb 2021 22:40:27 +1100 (AEDT)
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 4 Jan 2021 15:31:43 +0100, Cédric Le Goater wrote:
> Here is an assorted collection of fixes for W=1.
> 
> After this series, only a few errors are left, some missing declarations
> in arch/powerpc/kernel/sys_ppc32.c, panic_smp_self_stop() declaration
> and a few of these which I don't know how to fix :
> 
>   ./arch/powerpc/xmon/xmon.c: In function ‘xmon_print_symbol’:
>   ./arch/powerpc/xmon/xmon.c:3656:14: error: variable ‘name’ might be clobbered by ‘longjmp’ or ‘vfork’ [-Werror=clobbered]
>    3656 |  const char *name = NULL;
>         |              ^~~~
> 
> [...]

Applied to powerpc/next.

[01/23] powerpc/mm: Include __find_linux_pte() prototype
        https://git.kernel.org/powerpc/c/d25da505c3f567a8667adb0118de1400468172ac
[02/23] powerpc/pseries/ras: Remove unused variable 'status'
        https://git.kernel.org/powerpc/c/aa23ea0c5f7f9a46e6aa3be0a4cfdfb80fabca6d
[03/23] powerpc/pseries/eeh: Make pseries_pcibios_bus_add_device() static
        https://git.kernel.org/powerpc/c/44159329e0ad160af7cc7e84fa6d97531c8ed78f
[04/23] powerpc/pseries/ras: Make init_ras_hotplug_IRQ() static
        https://git.kernel.org/powerpc/c/90db8bf24d133654032a1c7dd46aa5096627b9ff
[05/23] powerpc/pmem: Include pmem prototypes
        https://git.kernel.org/powerpc/c/d03f210e6ed8f5d64b00f0f07b03db74aa5b95a1
[06/23] powerpc/setup_64: Make some routines static
        https://git.kernel.org/powerpc/c/692e592895266bafb1e0d688e960b4bdd8e165a8
[07/23] powerpc/mce: Include prototypes
        https://git.kernel.org/powerpc/c/1cc2fd75934454be024cd7609b6d7890de6e724b
[08/23] powerpc/smp: Include tick_broadcast() prototype
        https://git.kernel.org/powerpc/c/cd7aa5d2fae11794a00ea34b10ee58434d718bc3
[09/23] powerpc/smp: Make debugger_ipi_callback() static
        https://git.kernel.org/powerpc/c/157c9f409d11fe79f09c69e78bfc7f8fe7410744
[10/23] powerpc/optprobes: Remove unused routine patch_imm32_load_insns()
        https://git.kernel.org/powerpc/c/d47d307f1049be545d45cf0f2332495ec9a89cc0
[11/23] powerpc/optprobes: Make patch_imm64_load_insns() static
        https://git.kernel.org/powerpc/c/bb21e1b6c5352d62d866e9236ed427f632cd537b
[12/23] powerpc/mm: Declare some prototypes
        https://git.kernel.org/powerpc/c/cccaf1a10abf03d91321d29ff333d6d5d4cef542
[13/23] powerpc/mm: Move hpte_insert_repeating() prototype
        https://git.kernel.org/powerpc/c/11f9c1d2fb497f69f83d4fab6fb7fc8a6884eded
[14/23] powerpc/mm: Declare preload_new_slb_context() prototype
        https://git.kernel.org/powerpc/c/1f55aefea3c1431f662aafa02ef9ac18d8880751
[15/23] powerpc/mm/hugetlb: Make pseries_alloc_bootmem_huge_page() static
        https://git.kernel.org/powerpc/c/94b87d72fc852b6995702d74541136a65f88624a
[16/23] powerpc/mm: Declare arch_report_meminfo() prototype.
        https://git.kernel.org/powerpc/c/1429ff51480fe5a21a3d17158d259a4b4b04808f
[17/23] powerpc/watchdog: Declare soft_nmi_interrupt() prototype
        https://git.kernel.org/powerpc/c/9ae440fb3d7d1c91ada7d6b13e009bd9f4f00e6c
[18/23] KVM: PPC: Make the VMX instruction emulation routines static
        https://git.kernel.org/powerpc/c/9236f57a9e51c72ce426ccd2e53e123de7196a0f
[19/23] KVM: PPC: Book3S HV: Include prototypes
        https://git.kernel.org/powerpc/c/d834915e8ee28884f1180dc566ba77c8768ec00a
[20/23] KVM: PPC: Book3S HV: Declare some prototypes
        https://git.kernel.org/powerpc/c/ce275179b6c98032361271927b7458884e9708b1
[21/23] powerpc/pseries: Make IOV setup routines static
        https://git.kernel.org/powerpc/c/42c1f400d1da50dd1cd9f874df72dc827f9fe2d2
[22/23] powerpc/pcidn: Make IOV setup routines static
        https://git.kernel.org/powerpc/c/53137a9b51e49e0399ad322e4a39bc5f9bf0a1de
[23/23] powerpc/pseries/eeh: Make pseries_send_allow_unfreeze() static
        https://git.kernel.org/powerpc/c/22f1de2e13b066921dedf6a00d2cc414f3cbab05

cheers
