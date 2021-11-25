Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 283F845D78F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Nov 2021 10:48:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J0CkX0KRmz3cnQ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Nov 2021 20:48:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J0Chy61htz3c6j
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Nov 2021 20:47:30 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4J0Chx2Xtwz4xcb;
 Thu, 25 Nov 2021 20:47:29 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: ast@kernel.org, daniel@iogearbox.net, naveen.n.rao@linux.ibm.com,
 mpe@ellerman.id.au, christophe.leroy@csgroup.eu,
 Hari Bathini <hbathini@linux.ibm.com>
In-Reply-To: <20211012123056.485795-1-hbathini@linux.ibm.com>
References: <20211012123056.485795-1-hbathini@linux.ibm.com>
Subject: Re: [RESEND PATCH v4 0/8] bpf powerpc: Add BPF_PROBE_MEM support in
 powerpc JIT compiler
Message-Id: <163783298812.1228879.148537426457628310.b4-ty@ellerman.id.au>
Date: Thu, 25 Nov 2021 20:36:28 +1100
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
Cc: songliubraving@fb.com, netdev@vger.kernel.org, john.fastabend@gmail.com,
 andrii@kernel.org, kpsingh@kernel.org, paulus@samba.org, yhs@fb.com,
 bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, kafai@fb.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 12 Oct 2021 18:00:48 +0530, Hari Bathini wrote:
> Patch #1 & #2 are simple cleanup patches. Patch #3 refactors JIT
> compiler code with the aim to simplify adding BPF_PROBE_MEM support.
> Patch #4 introduces PPC_RAW_BRANCH() macro instead of open coding
> branch instruction. Patch #5 & #7 add BPF_PROBE_MEM support for PPC64
> & PPC32 JIT compilers respectively. Patch #6 & #8 handle bad userspace
> pointers for PPC64 & PPC32 cases respectively.
> 
> [...]

Applied to powerpc/next.

[1/8] bpf powerpc: Remove unused SEEN_STACK
      https://git.kernel.org/powerpc/c/c9ce7c36e4870bd307101ba7a00a39d9aad270f3
[2/8] bpf powerpc: Remove extra_pass from bpf_jit_build_body()
      https://git.kernel.org/powerpc/c/04c04205bc35d0ecdc57146995ca9eb957d4f379
[3/8] bpf powerpc: refactor JIT compiler code
      https://git.kernel.org/powerpc/c/efa95f031bf38c85cf865413335a3dc044e3194e
[4/8] powerpc/ppc-opcode: introduce PPC_RAW_BRANCH() macro
      https://git.kernel.org/powerpc/c/f15a71b3880bf07b40810644e5ac6f177c2a7c8f
[5/8] bpf ppc64: Add BPF_PROBE_MEM support for JIT
      https://git.kernel.org/powerpc/c/983bdc0245a29cdefcd30d9d484d3edbc4b6d787
[6/8] bpf ppc64: Access only if addr is kernel address
      https://git.kernel.org/powerpc/c/9c70c7147ffec31de67d33243570a533b29f9759
[7/8] bpf ppc32: Add BPF_PROBE_MEM support for JIT
      https://git.kernel.org/powerpc/c/23b51916ee129833453d8a3d6bde0ff392f82fce
[8/8] bpf ppc32: Access only if addr is kernel address
      https://git.kernel.org/powerpc/c/e919c0b2323bedec00e1ecc6280498ff81f59b15

cheers
