Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4422D59B6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Dec 2020 12:53:58 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CsC4D5j11zDqhD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Dec 2020 22:53:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CsBXM1ndrzDqc4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Dec 2020 22:29:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4CsBXL1JPsz9sWj; Thu, 10 Dec 2020 22:29:35 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
In-Reply-To: <20201127044424.40686-1-aneesh.kumar@linux.ibm.com>
References: <20201127044424.40686-1-aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH v7 00/22] Kernel userspace access/execution prevention
 with hash translation
Message-Id: <160756606619.1313423.421579647886975926.b4-ty@ellerman.id.au>
Date: Thu, 10 Dec 2020 22:29:35 +1100 (AEDT)
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 27 Nov 2020 10:14:02 +0530, Aneesh Kumar K.V wrote:
> This patch series implements KUAP and KUEP with hash translation mode using
> memory keys. The kernel now uses memory protection key 3 to control access
> to the kernel. Kernel page table entries are now configured with key 3.
> Access to locations configured with any other key value is denied when in
> kernel mode (MSR_PR=0). This includes userspace which is by default configured
> with key 0.
> 
> [...]

Patches 1-20, 22 applied to powerpc/next.

[01/22] powerpc: Add new macro to handle NESTED_IFCLR
        https://git.kernel.org/powerpc/c/c3d35ddd1ec874690a4e8da5a18497256f1ffa9a
[02/22] KVM: PPC: BOOK3S: PR: Ignore UAMOR SPR
        https://git.kernel.org/powerpc/c/9f378b9f007cc94beadea40df83cc62a76975c6f
[03/22] powerpc/book3s64/kuap/kuep: Add PPC_PKEY config on book3s64
        https://git.kernel.org/powerpc/c/227ae625522c65c4535cabe407f47abc058585ed
[04/22] powerpc/book3s64/kuap/kuep: Move uamor setup to pkey init
        https://git.kernel.org/powerpc/c/39df17bc20059c84ddc6f91831fce2e2cc79a6f3
[05/22] powerpc/book3s64/kuap: Move KUAP related function outside radix
        https://git.kernel.org/powerpc/c/3b47b7549ead0719e94022c6742199333c7c8d9f
[06/22] powerpc/book3s64/kuep: Move KUEP related function outside radix
        https://git.kernel.org/powerpc/c/57b7505aa8ba13eb18ffabeb689ac64343c53aaa
[07/22] powerpc/book3s64/kuap: Rename MMU_FTR_RADIX_KUAP and MMU_FTR_KUEP
        https://git.kernel.org/powerpc/c/d5b810b5c938e73fd21b2b05ef6a79837eeaa305
[08/22] powerpc/book3s64/kuap: Use Key 3 for kernel mapping with hash translation
        https://git.kernel.org/powerpc/c/d94b827e89dc3f92cd871d10f4992a6bd3c861e5
[09/22] powerpc/exec: Set thread.regs early during exec
        https://git.kernel.org/powerpc/c/d7df77e89039623ededf0ece7b4358f7c9ecbaae
[10/22] powerpc/book3s64/pkeys: Store/restore userspace AMR/IAMR correctly on entry and exit from kernel
        https://git.kernel.org/powerpc/c/8e560921b58cbc18e192f0ac273d307a37a144f9
[11/22] powerpc/book3s64/pkeys: Inherit correctly on fork.
        https://git.kernel.org/powerpc/c/f643fcab74c005ddfdda68c69909f03bde766ff1
[12/22] powerpc/book3s64/pkeys: Reset userspace AMR correctly on exec
        https://git.kernel.org/powerpc/c/d5fa30e6993ffcdd1859d8dab1a07a6f6c6e7c3f
[13/22] powerpc/ptrace-view: Use pt_regs values instead of thread_struct based one.
        https://git.kernel.org/powerpc/c/edc541ecaae73d498a49b9ca82bc66255d9e0720
[14/22] powerpc/book3s64/pkeys: Don't update SPRN_AMR when in kernel mode.
        https://git.kernel.org/powerpc/c/48a8ab4eeb8271f2a0e2ca3cf80844a59acca153
[15/22] powerpc/book3s64/kuap: Restrict access to userspace based on userspace AMR
        https://git.kernel.org/powerpc/c/4d6c551e9f548f7675a01eff229d09ab41162a25
[16/22] powerpc/book3s64/kuap: Improve error reporting with KUAP
        https://git.kernel.org/powerpc/c/eb232b1624462752dc916d9015b31ecdac0a01f1
[17/22] powerpc/book3s64/kuap: Use Key 3 to implement KUAP with hash translation.
        https://git.kernel.org/powerpc/c/fa46c2fa6ffbedab3a3cbcbde1292468979e830b
[18/22] powerpc/book3s64/kuep: Use Key 3 to implement KUEP with hash translation.
        https://git.kernel.org/powerpc/c/292f86c4c683a1064aff7210348da088c1573ee0
[19/22] powerpc/book3s64/hash/kuap: Enable kuap on hash
        https://git.kernel.org/powerpc/c/b2ff33a10c8b3e9d260c57df38b5cd3765a0b785
[20/22] powerpc/book3s64/hash/kuep: Enable KUEP on hash
        https://git.kernel.org/powerpc/c/c91435d95c49f4053b05ba03b41dd7ed0fbd6c71
[22/22] powerpc/book3s64/pkeys: Optimize KUAP and KUEP feature disabled case
        https://git.kernel.org/powerpc/c/ec0f9b98f7d01b15c804e77e12a515ffc56d7309

cheers
