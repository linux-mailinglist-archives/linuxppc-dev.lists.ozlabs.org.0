Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 034A33168FE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Feb 2021 15:20:57 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DbMPK2jWpzDrPt
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Feb 2021 01:20:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DbKYM5WMRzDshb
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Feb 2021 23:57:43 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4DbKYL4PN1z9sWP; Wed, 10 Feb 2021 23:57:41 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
In-Reply-To: <20210130130852.2952424-1-npiggin@gmail.com>
References: <20210130130852.2952424-1-npiggin@gmail.com>
Subject: Re: [PATCH v7 00/42] powerpc: interrupt wrappers
Message-Id: <161296171913.3178259.7382068637691096321.b4-ty@ellerman.id.au>
Date: Wed, 10 Feb 2021 23:57:41 +1100 (AEDT)
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
Cc: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 30 Jan 2021 23:08:10 +1000, Nicholas Piggin wrote:
> This adds interrupt handler wrapper functions, similar to the
> generic / x86 code, and moves several common operations into them
> from either asm or open coded in the individual handlers.
> 
> This series is based on powerpc fixes-test tree, there's another
> unrelated pending fix in patch 1 of the series which clashes a
> bit.
> 
> [...]

Patches 1-41 applied to powerpc/next.

[01/42] powerpc/64s: interrupt exit improve bounding of interrupt recursion
        https://git.kernel.org/powerpc/c/c0ef717305f51e29b5ce0c78a6bfe566b3283415
[02/42] KVM: PPC: Book3S HV: Context tracking exit guest context before enabling irqs
        https://git.kernel.org/powerpc/c/112665286d08c87e66d699e7cba43c1497ad165f
[03/42] powerpc/32s: move DABR match out of handle_page_fault
        https://git.kernel.org/powerpc/c/7a24ae2e172f770df07f8e48ed3ed2f3a6b17e37
[04/42] powerpc/64s: move DABR match out of handle_page_fault
        https://git.kernel.org/powerpc/c/36f0114140eef53e931592b65bdf8bb61ffac1f8
[05/42] powerpc/64s: move the hash fault handling logic to C
        https://git.kernel.org/powerpc/c/a4922f5442e7e6ce85da304e224d940edec2f1fb
[06/42] powerpc: remove arguments from fault handler functions
        https://git.kernel.org/powerpc/c/a01a3f2ddbcda83e8572787c0ec1dcbeba86915a
[07/42] powerpc/fsl_booke/32: CacheLockingException remove args
        https://git.kernel.org/powerpc/c/b4ced8031000b832d845dd17994e0fa1b8310496
[08/42] powerpc: do_break get registers from regs
        https://git.kernel.org/powerpc/c/18722ecf9efdc6a7ca933a3e5a83cc9dba375847
[09/42] powerpc: DebugException remove args
        https://git.kernel.org/powerpc/c/755d664174463791489dddf34c33308b61de68c3
[10/42] powerpc/32: transfer can avoid saving r4/r5 over trace call
        https://git.kernel.org/powerpc/c/73d7a97914f23397b012e851f6a1fe4061923a82
[11/42] powerpc: bad_page_fault get registers from regs
        https://git.kernel.org/powerpc/c/8458c628a53ba4311b2df12370be1a6f1870ff37
[12/42] powerpc/64s: add do_bad_page_fault_segv handler
        https://git.kernel.org/powerpc/c/71f47976fafc4375674bd0714153be10f878040a
[13/42] powerpc: rearrange do_page_fault error case to be inside exception_enter
        https://git.kernel.org/powerpc/c/4cb8428465148bcca0b6b8593d51f805818a70e0
[14/42] powerpc/64s: move bad_page_fault handling to C
        https://git.kernel.org/powerpc/c/f4c03b0e520c5f56e569a8da3fce5ddbd0696742
[15/42] powerpc/64s: split do_hash_fault
        https://git.kernel.org/powerpc/c/bf0e2374aa7b4f8b01fd59fcb0746a9b6b05326a
[16/42] powerpc/mm: Remove stale do_page_fault comment referring to SLB faults
        https://git.kernel.org/powerpc/c/31d6490ccb2868530300381d8079026cd4a9f7ad
[17/42] powerpc/64s: slb comment update
        https://git.kernel.org/powerpc/c/e44370abb2e99299678ec6b209f8aad574fa5f36
[18/42] powerpc/traps: add NOKPROBE_SYMBOL for sreset and mce
        https://git.kernel.org/powerpc/c/3a3138836bc35966d59742512b597997755878f7
[19/42] powerpc/perf: move perf irq/nmi handling details into traps.c
        https://git.kernel.org/powerpc/c/156b5371a9c2482a9ad23ec82d1a4f89a3ab430d
[20/42] powerpc/time: move timer_broadcast_interrupt prototype to asm/time.h
        https://git.kernel.org/powerpc/c/0440b8a22cc48922f7c6ae894abd221cf7cc4b64
[21/42] powerpc: add and use unknown_async_exception
        https://git.kernel.org/powerpc/c/6c6aee009ec34cb7f5ef76f910c1b9417c81efd8
[22/42] powerpc/cell: tidy up pervasive declarations
        https://git.kernel.org/powerpc/c/dcdb4f12963f3f4200e24e1dad78564a98736f67
[23/42] powerpc: introduce die_mce
        https://git.kernel.org/powerpc/c/209e9d500e25eada096b2c09a34093bc458166f3
[24/42] powerpc/mce: ensure machine check handler always tests RI
        https://git.kernel.org/powerpc/c/c538938fa2cfdc806c6304888e3876729e6939e0
[25/42] powerpc: improve handling of unrecoverable system reset
        https://git.kernel.org/powerpc/c/11cb0a25f71818ca7ab4856548ecfd83c169aa4d
[26/42] powerpc: interrupt handler wrapper functions
        https://git.kernel.org/powerpc/c/8d41fc618ab804657acd2df8e761ce1001f41513
[27/42] powerpc: add interrupt wrapper entry / exit stub functions
        https://git.kernel.org/powerpc/c/25b7e6bb743ca5a375bb89522a2c2bec840d5fc3
[28/42] powerpc: convert interrupt handlers to use wrappers
        https://git.kernel.org/powerpc/c/3a96570ffceb15c6ed9cc6f990f172dcdc8ac279
[29/42] powerpc: add interrupt_cond_local_irq_enable helper
        https://git.kernel.org/powerpc/c/e6f8a6c86ce7b2108c03c1cc014fdae278573df1
[30/42] powerpc/64: context tracking remove _TIF_NOHZ
        https://git.kernel.org/powerpc/c/2a06bf3e95cd93e3640d431960181b8e47415f33
[31/42] powerpc/64s/hash: improve context tracking of hash faults
        https://git.kernel.org/powerpc/c/a008f8f9fd67ffb13d906ef4ea6235a3d62dfdb6
[32/42] powerpc/64: context tracking move to interrupt wrappers
        https://git.kernel.org/powerpc/c/540d4d34bef4ec58aba12b159030492616d6f54e
[33/42] powerpc/64: add context tracking to asynchronous interrupts
        https://git.kernel.org/powerpc/c/6fdb0f410bb026ade092039a6c2655a53323c996
[34/42] powerpc: handle irq_enter/irq_exit in interrupt handler wrappers
        https://git.kernel.org/powerpc/c/1b1b6a6f4cc0ecc27745fa578cbaf912d76dbdda
[35/42] powerpc/64s: move context tracking exit to interrupt exit path
        https://git.kernel.org/powerpc/c/f821bc97dee4f3ee92c3668d495af49dfd720fe0
[36/42] powerpc/64s: reconcile interrupts in C
        https://git.kernel.org/powerpc/c/75b96950fddab6f1c59a10160b6bf38948bdb0e3
[37/42] powerpc/64: move account_stolen_time into its own function
        https://git.kernel.org/powerpc/c/2994e1babfc477a3101ec6841b9dc5b770c1ec18
[38/42] powerpc/64: entry cpu time accounting in C
        https://git.kernel.org/powerpc/c/56acfdd8bf9f75e83a1b2957bd415368f39b67b6
[39/42] powerpc: move NMI entry/exit code into wrapper
        https://git.kernel.org/powerpc/c/118178e62e2e0da39b394e812fef7179c8bdb3bc
[40/42] powerpc/64s: move NMI soft-mask handling to C
        https://git.kernel.org/powerpc/c/6ecbb582b6947f041832fff07c2f38791ae19287
[41/42] powerpc/64s: runlatch interrupt handling in C
        https://git.kernel.org/powerpc/c/86dbb39416493add2bdf5b7ad39a1276f2107b83

cheers
