Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A7B4D1722
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Mar 2022 13:19:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KCZC93zX1z3dNJ
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Mar 2022 23:19:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KCZ935RJBz3bYP
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Mar 2022 23:17:59 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KCZ940kMhz4xy3;
 Tue,  8 Mar 2022 23:18:00 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <cover.1644834730.git.naveen.n.rao@linux.vnet.ibm.com>
References: <cover.1644834730.git.naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH powerpc/next 00/17] powerpc/bpf: Some updates and cleanups
Message-Id: <164674128395.3322453.15857183834950930927.b4-ty@ellerman.id.au>
Date: Tue, 08 Mar 2022 23:08:03 +1100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: Daniel Borkmann <daniel@iogearbox.net>,
 Yauheni Kaliuta <yauheni.kaliuta@redhat.com>, bpf@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org,
 Alexei Starovoitov <alexei.starovoitov@gmail.com>,
 Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 14 Feb 2022 16:11:34 +0530, Naveen N. Rao wrote:
> This is a follow-up series with the pending patches from:
> https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=279602&state=*
> 
> Patches 1-5 and 8 are unchanged. Patch 6 is new and patch 7 has changes
> based on discussion from the last series. Patch 9 has a small change to
> not skip the toc load for elf v2.
> 
> [...]

Applied to powerpc/next.

[01/17] powerpc/bpf: Skip branch range validation during first pass
        https://git.kernel.org/powerpc/c/acd7408d2748533d767387cb4308692fba543658
[02/17] powerpc/bpf: Emit a single branch instruction for known short branch ranges
        https://git.kernel.org/powerpc/c/bafb5898de5d2f15133774cb049fe55720b9c92f
[03/17] powerpc/bpf: Handle large branch ranges with BPF_EXIT
        https://git.kernel.org/powerpc/c/0ffdbce6f4a89bb7c0002904d6438ec83cf05ce7
[04/17] powerpc64/bpf: Do not save/restore LR on each call to bpf_stf_barrier()
        https://git.kernel.org/powerpc/c/c2067f7f88830cdd020c775ffefe84a8177337af
[05/17] powerpc64/bpf: Use r12 for constant blinding
        https://git.kernel.org/powerpc/c/1d4866d5652f7a19dcbed0c4e366c3402c7775b7
[06/17] powerpc64: Set PPC64_ELF_ABI_v[1|2] macros to 1
        https://git.kernel.org/powerpc/c/4eeac2b0aaadc3d1943d348d8565f7cfb93272b9
[07/17] powerpc64/bpf elfv2: Setup kernel TOC in r2 on entry
        https://git.kernel.org/powerpc/c/b10cb163c4b31b03ac5014abbfd0b868913fd8e3
[08/17] powerpc64/bpf elfv1: Do not load TOC before calling functions
        https://git.kernel.org/powerpc/c/43d636f8b4fd2ee668e75e835fae2fcf4bc0f699
[09/17] powerpc64/bpf: Optimize instruction sequence used for function calls
        https://git.kernel.org/powerpc/c/feb6307289d85262c5aed04d6f192d38abba7c45
[10/17] powerpc/bpf: Rename PPC_BL_ABS() to PPC_BL()
        https://git.kernel.org/powerpc/c/74bbe3f08463c48a27088be4823a5803b7f7d9a1
[11/17] powerpc64/bpf: Convert some of the uses of PPC_BPF_[LL|STL] to PPC_BPF_[LD|STD]
        https://git.kernel.org/powerpc/c/391c271f4deb7356482d12f962a6fc018b6a3fb0
[12/17] powerpc64/bpf: Get rid of PPC_BPF_[LL|STL|STLU] macros
        https://git.kernel.org/powerpc/c/794abc08d75e9f2833f493090af14b748e182c5f
[13/17] powerpc/bpf: Cleanup bpf_jit.h
        https://git.kernel.org/powerpc/c/7b187dcdb5d348aa916dcda769313512c08e85a5
[14/17] powerpc/bpf: Move bpf_jit64.h into bpf_jit_comp64.c
        https://git.kernel.org/powerpc/c/576a6c3a00c1a2a3645e039b126b52f6c7755e54
[15/17] powerpc/bpf: Use _Rn macros for GPRs
        https://git.kernel.org/powerpc/c/036d559c0bdea75bf4840ba6780790d08572480c
[16/17] powerpc64/bpf: Store temp registers' bpf to ppc mapping
        https://git.kernel.org/powerpc/c/3a3fc9bf103974d9a886fa37087d5d491c806e00
[17/17] powerpc/bpf: Simplify bpf_to_ppc() and adopt it for powerpc64
        https://git.kernel.org/powerpc/c/49c3af43e65fbcc13860e0cf5fb2507b13e9724c

cheers
