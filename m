Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B7F348FC32
	for <lists+linuxppc-dev@lfdr.de>; Sun, 16 Jan 2022 11:43:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JcBTN10W6z3cRn
	for <lists+linuxppc-dev@lfdr.de>; Sun, 16 Jan 2022 21:43:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JcBSc2QpXz30LS
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 16 Jan 2022 21:42:40 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4JcBSY444sz4y4p;
 Sun, 16 Jan 2022 21:42:37 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Alexei Starovoitov <alexei.starovoitov@gmail.com>,
 "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
In-Reply-To: <cover.1641468127.git.naveen.n.rao@linux.vnet.ibm.com>
References: <cover.1641468127.git.naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH 00/13] powerpc/bpf: Some fixes and updates
Message-Id: <164232966375.2885693.16633538158150214426.b4-ty@ellerman.id.au>
Date: Sun, 16 Jan 2022 21:41:03 +1100
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
Cc: johan.almbladh@anyfinetworks.com, ykaliuta@redhat.com,
 Jiri Olsa <jolsa@redhat.com>, song@kernel.org, bpf@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 6 Jan 2022 17:15:04 +0530, Naveen N. Rao wrote:
> A set of fixes and updates to powerpc BPF JIT:
> - Patches 1-3 fix issues with the existing powerpc JIT and are tagged
>   for -stable.
> - Patch 4 fixes a build issue with bpf selftests on powerpc.
> - Patches 5-9 handle some corner cases and make some small improvements.
> - Patches 10-13 optimize how function calls are handled in ppc64.
> 
> [...]

Patches 1-4, and 8 applied to powerpc/fixes.

[01/13] bpf: Guard against accessing NULL pt_regs in bpf_get_task_stack()
        https://git.kernel.org/powerpc/c/b992f01e66150fc5e90be4a96f5eb8e634c8249e
[02/13] powerpc32/bpf: Fix codegen for bpf-to-bpf calls
        https://git.kernel.org/powerpc/c/fab07611fb2e6a15fac05c4583045ca5582fd826
[03/13] powerpc/bpf: Update ldimm64 instructions during extra pass
        https://git.kernel.org/powerpc/c/f9320c49993ca3c0ec0f9a7026b313735306bb8b
[04/13] tools/bpf: Rename 'struct event' to avoid naming conflict
        https://git.kernel.org/powerpc/c/88a71086c48ae98e93c0208044827621e9717f7e
[08/13] powerpc64/bpf: Limit 'ldbrx' to processors compliant with ISA v2.06
        https://git.kernel.org/powerpc/c/3f5f766d5f7f95a69a630da3544a1a0cee1cdddf

cheers
