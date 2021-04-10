Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DDAF35AE5A
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Apr 2021 16:31:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FHcr82z9pz3cbm
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Apr 2021 00:31:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FHcp51cfnz3bqg
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 11 Apr 2021 00:29:33 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4FHcp46kq2z9sWk; Sun, 11 Apr 2021 00:29:32 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, songliubraving@fb.com,
 Michael Ellerman <mpe@ellerman.id.au>, kafai@fb.com,
 naveen.n.rao@linux.ibm.com, Christophe Leroy <christophe.leroy@csgroup.eu>,
 daniel@iogearbox.net, john.fastabend@gmail.com, sandipan@linux.ibm.com,
 yhs@fb.com, ast@kernel.org, kpsingh@chromium.org, andrii@kernel.org,
 Paul Mackerras <paulus@samba.org>
In-Reply-To: <cover.1616430991.git.christophe.leroy@csgroup.eu>
References: <cover.1616430991.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2 0/8] Implement EBPF on powerpc32
Message-Id: <161806493489.1467223.13057218503369355190.b4-ty@ellerman.id.au>
Date: Sun, 11 Apr 2021 00:28:54 +1000
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
Cc: netdev@vger.kernel.org, bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 22 Mar 2021 16:37:45 +0000 (UTC), Christophe Leroy wrote:
> This series implements extended BPF on powerpc32. For the implementation
> details, see the patch before the last.
> 
> The following operations are not implemented:
> 
> 		case BPF_ALU64 | BPF_DIV | BPF_X: /* dst /= src */
> 		case BPF_ALU64 | BPF_MOD | BPF_X: /* dst %= src */
> 		case BPF_STX | BPF_XADD | BPF_DW: /* *(u64 *)(dst + off) += src */
> 
> [...]

Applied to powerpc/next.

[1/8] powerpc/bpf: Remove classical BPF support for PPC32
      https://git.kernel.org/powerpc/c/6944caad78fc4de4ecd0364bbc9715b62b020965
[2/8] powerpc/bpf: Change register numbering for bpf_set/is_seen_register()
      https://git.kernel.org/powerpc/c/ed573b57e77a7860fe4026e1700faa2f6938caf1
[3/8] powerpc/bpf: Move common helpers into bpf_jit.h
      https://git.kernel.org/powerpc/c/f1b1583d5faa86cb3dcb7b740594868debad7c30
[4/8] powerpc/bpf: Move common functions into bpf_jit_comp.c
      https://git.kernel.org/powerpc/c/4ea76e90a97d22f86adbb10044d29d919e620f2e
[5/8] powerpc/bpf: Change values of SEEN_ flags
      https://git.kernel.org/powerpc/c/c426810fcf9f96e3b43d16039e41ecb959f6dc29
[6/8] powerpc/asm: Add some opcodes in asm/ppc-opcode.h for PPC32 eBPF
      https://git.kernel.org/powerpc/c/355a8d26cd0416e7e764e4db766cf91e773a03e7
[7/8] powerpc/bpf: Implement extended BPF on PPC32
      https://git.kernel.org/powerpc/c/51c66ad849a703d9bbfd7704c941827aed0fd9fd
[8/8] powerpc/bpf: Reallocate BPF registers to volatile registers when possible on PPC32
      https://git.kernel.org/powerpc/c/40272035e1d0edcd515ad45be297c4cce044536d

cheers
