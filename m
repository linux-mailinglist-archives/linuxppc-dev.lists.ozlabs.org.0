Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7444C697C16
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Feb 2023 13:44:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PGySs2GQCz3fWB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Feb 2023 23:44:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PGyRH3STVz3cLB
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Feb 2023 23:43:07 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4PGyRF73j9z4x7w;
	Wed, 15 Feb 2023 23:43:05 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <4fd69ef7945518c3e27f96b95046a5c1468d35bf.1675245773.git.christophe.leroy@csgroup.eu>
References: <4fd69ef7945518c3e27f96b95046a5c1468d35bf.1675245773.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2 1/9] powerpc: Remove __kernel_text_address() in show_instructions()
Message-Id: <167646484231.1421441.4745112349089639781.b4-ty@ellerman.id.au>
Date: Wed, 15 Feb 2023 23:40:42 +1100
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
Cc: Hao Luo <haoluo@google.com>, Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau <martin.lau@linux.dev>, John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, Song Liu <song@kernel.org>, Stanislav Fomichev <sdf@google.com>, Jiri Olsa <jolsa@kernel.org>, KP Singh <kpsingh@kernel.org>, Yonghong Song <yhs@fb.com>, bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 1 Feb 2023 11:04:23 +0100, Christophe Leroy wrote:
> That test was introducted in 2006 by
> commit 00ae36de49cc ("[POWERPC] Better check in show_instructions").
> At that time, there was no BPF progs.
> 
> As seen in message of commit 89d21e259a94 ("powerpc/bpf/32: Fix Oops
> on tail call tests"), when a page fault occurs in test_bpf.ko for
> instance, the code is dumped as XXXXXXXXs. Allthough
> __kernel_text_address() checks is_bpf_text_address(), it seems it is
> not enough.
> 
> [...]

Applied to powerpc/next.

[1/9] powerpc: Remove __kernel_text_address() in show_instructions()
      https://git.kernel.org/powerpc/c/d9ab6da64fd15608c9feb20d769d8df1a32fe212
[2/9] powerpc/bpf/32: No need to zeroise r4 when not doing tail call
      https://git.kernel.org/powerpc/c/6376ed8feca829039d31a208216b958f0e439d87
[3/9] powerpc/bpf/32: Only set a stack frame when necessary
      https://git.kernel.org/powerpc/c/d084dcf256bc4565b4b1af9b00297ac7b51c7049
[4/9] powerpc/bpf/32: BPF prog is never called with more than one arg
      https://git.kernel.org/powerpc/c/7dd0e2848764306d7a70943b97584ffdc7754708
[5/9] powerpc/bpf: Perform complete extra passes to update addresses
      https://git.kernel.org/powerpc/c/85e031154c7c14edee0705532a9ffc8a2fe591d0
[6/9] powerpc/bpf: Only pad length-variable code at initial pass
      https://git.kernel.org/powerpc/c/d3921cbb6cd663193cecf04f0b170a30c6d0e390
[7/9] powerpc/bpf/32: Optimise some particular const operations
      https://git.kernel.org/powerpc/c/8616045fe785229b53a24b8698631826298d1500
[8/9] powerpc/bpf/32: introduce a second source register for ALU operations
      https://git.kernel.org/powerpc/c/c88da29b4d2ce8d0070646b8f99729e9b355a4bf
[9/9] powerpc/bpf/32: perform three operands ALU operations
      https://git.kernel.org/powerpc/c/19daf0aef84f33bde9c742ed41b4ded567b8dfbf

cheers
