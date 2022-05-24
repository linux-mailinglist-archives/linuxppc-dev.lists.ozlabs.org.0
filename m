Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4014C5328A3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 13:18:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L6sBl1Qtdz3bnn
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 21:18:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L6s7W6rKkz3bq7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 May 2022 21:15:35 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4L6s7W5XBcz4ySp;
 Tue, 24 May 2022 21:15:35 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: naveen.n.rao@linux.vnet.ibm.com, Michael Ellerman <mpe@ellerman.id.au>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
In-Reply-To: <cover.1652074503.git.christophe.leroy@csgroup.eu>
References: <cover.1652074503.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v3 00/25] powerpc: ftrace optimisation and cleanup and
 more [v3]
Message-Id: <165339055456.1718562.6144281793562720834.b4-ty@ellerman.id.au>
Date: Tue, 24 May 2022 21:09:14 +1000
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 9 May 2022 07:35:58 +0200, Christophe Leroy wrote:
> This series provides optimisation and cleanup of ftrace on powerpc.
> 
> With this series ftrace activation is about 20% faster on an 8xx.
> 
> At the end of the series come additional cleanups around ppc-opcode,
> that would likely conflict with this series if posted separately.
> 
> [...]

Applied to powerpc/next.

[01/25] powerpc/ftrace: Refactor prepare_ftrace_return()
        https://git.kernel.org/powerpc/c/d996d5053eb5c0abc0358e5670014a62ada6967e
[02/25] powerpc/ftrace: Remove redundant create_branch() calls
        https://git.kernel.org/powerpc/c/ae3a2a2188214adc355a5bdf6deb29120886c96f
[03/25] powerpc/code-patching: Inline is_offset_in_{cond}_branch_range()
        https://git.kernel.org/powerpc/c/1acbf27e8a5843911d122ad0008e79ec5f7b6382
[04/25] powerpc/ftrace: Use is_offset_in_branch_range()
        https://git.kernel.org/powerpc/c/a1facd2578b312770aaea384adc7de0ed3f543d1
[05/25] powerpc/code-patching: Inline create_branch()
        https://git.kernel.org/powerpc/c/d2f47dabf1252520a88d257133e6bdec474fd935
[06/25] powerpc/ftrace: Inline ftrace_modify_code()
        https://git.kernel.org/powerpc/c/2c920fca8c70287c4448f2653a388ecca7b32e83
[07/25] powerpc/ftrace: Use patch_instruction() return directly
        https://git.kernel.org/powerpc/c/bbffdd2fc743bdc529f9a8264bdb5d3491f58c95
[08/25] powerpc: Add CONFIG_PPC64_ELF_ABI_V1 and CONFIG_PPC64_ELF_ABI_V2
        https://git.kernel.org/powerpc/c/661aa880398add5c27943cb077c451a45cc112a1
[09/25] powerpc: Replace PPC64_ELF_ABI_v{1/2} by CONFIG_PPC64_ELF_ABI_V{1/2}
        https://git.kernel.org/powerpc/c/7d40aff8213c92e64a1576ba9dfebcd201c0564d
[10/25] powerpc: Finalise cleanup around ABI use
        https://git.kernel.org/powerpc/c/5b89492c03e5c0a2c259b97d7d4c1bb9b02860aa
[11/25] powerpc/ftrace: Make __ftrace_make_{nop/call}() common to PPC32 and PPC64
        https://git.kernel.org/powerpc/c/23b44fc248f420bbcd0dcd290c3399885360984d
[12/25] powerpc/ftrace: Don't include ftrace.o for CONFIG_FTRACE_SYSCALLS
        https://git.kernel.org/powerpc/c/a3d0f5b4b7e425b8abeadda1e76496bda88989bd
[13/25] powerpc/ftrace: Use CONFIG_FUNCTION_TRACER instead of CONFIG_DYNAMIC_FTRACE
        https://git.kernel.org/powerpc/c/c2cba93d1a5e2475a636b5cb974da6b73d7a72df
[14/25] powerpc/ftrace: Remove ftrace_plt_tramps[]
        https://git.kernel.org/powerpc/c/ccf6607e45aaf5e0ceabfe018aeb01818a936697
[15/25] powerpc/ftrace: Use BRANCH_SET_LINK instead of value 1
        https://git.kernel.org/powerpc/c/cf9df92a823ce24c19c4c64b334dc5cadd74fa98
[16/25] powerpc/ftrace: Use PPC_RAW_xxx() macros instead of opencoding.
        https://git.kernel.org/powerpc/c/e89aa642be21b14e53bab40a37b8c6b0cf05143d
[17/25] powerpc/ftrace: Use size macro instead of opencoding
        https://git.kernel.org/powerpc/c/c8deb28095f9cd2ee2f4d16e948c9e816a22811b
[18/25] powerpc/ftrace: Simplify expected_nop_sequence()
        https://git.kernel.org/powerpc/c/b97d0e3dcfba07590ec3d2ca2b95b2f029962d16
[19/25] powerpc/ftrace: Minimise number of #ifdefs
        https://git.kernel.org/powerpc/c/af8b9f352ffd435734ab8f94f99ccb922da916b4
[20/25] powerpc/inst: Add __copy_inst_from_kernel_nofault()
        https://git.kernel.org/powerpc/c/8dfdbe4368c09d9eeae2df8968ee6c345ec8c1b5
[21/25] powerpc/ftrace: Don't use copy_from_kernel_nofault() in module_trampoline_target()
        https://git.kernel.org/powerpc/c/8052d043a48f733905e8ea8f900bf58b441a317f
[22/25] powerpc/inst: Remove PPC_INST_BRANCH
        https://git.kernel.org/powerpc/c/4390a58ee1c37dc915dcf44fabe925b160f5bcf0
[23/25] powerpc/modules: Use PPC_LI macros instead of opencoding
        https://git.kernel.org/powerpc/c/e0c2ef43210b023ed9a58c520c2fbede7010c592
[24/25] powerpc/inst: Remove PPC_INST_BL
        https://git.kernel.org/powerpc/c/ae2c760fa10ba2475aa46fffa6be42050586c604
[25/25] powerpc/opcodes: Remove unused PPC_INST_XXX macros
        https://git.kernel.org/powerpc/c/6bdc81eca9519a85d36b3915136640ef9cba1a23

cheers
