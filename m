Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB45647069
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Dec 2022 14:04:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NSZBD0Jtxz3fN0
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Dec 2022 00:04:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NSYwW6P12z3fRw
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Dec 2022 23:52:59 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4NSYwW0f9hz4xDn;
	Thu,  8 Dec 2022 23:52:59 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <757acccb7fbfc78efa42dcf3c974b46678198905.1669278887.git.christophe.leroy@csgroup.eu>
References: <757acccb7fbfc78efa42dcf3c974b46678198905.1669278887.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2] powerpc/bpf/32: Fix Oops on tail call tests
Message-Id: <167050396505.1462730.10974040872245094646.b4-ty@ellerman.id.au>
Date: Thu, 08 Dec 2022 23:52:45 +1100
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
Cc: Hao Luo <haoluo@google.com>, Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau <martin.lau@linux.dev>, John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>, stable@vger.kernel.org, linux-kernel@vger.kernel.org, Song Liu <song@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, Stanislav Fomichev <sdf@google.com>, Jiri Olsa <jolsa@kernel.org>, KP Singh <kpsingh@kernel.org>, Yonghong Song <yhs@fb.com>, "Naveen N . Rao" <naveen.n.rao@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org, bpf@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 24 Nov 2022 09:37:27 +0100, Christophe Leroy wrote:
> test_bpf tail call tests end up as:
> 
>   test_bpf: #0 Tail call leaf jited:1 85 PASS
>   test_bpf: #1 Tail call 2 jited:1 111 PASS
>   test_bpf: #2 Tail call 3 jited:1 145 PASS
>   test_bpf: #3 Tail call 4 jited:1 170 PASS
>   test_bpf: #4 Tail call load/store leaf jited:1 190 PASS
>   test_bpf: #5 Tail call load/store jited:1
>   BUG: Unable to handle kernel data access on write at 0xf1b4e000
>   Faulting instruction address: 0xbe86b710
>   Oops: Kernel access of bad area, sig: 11 [#1]
>   BE PAGE_SIZE=4K MMU=Hash PowerMac
>   Modules linked in: test_bpf(+)
>   CPU: 0 PID: 97 Comm: insmod Not tainted 6.1.0-rc4+ #195
>   Hardware name: PowerMac3,1 750CL 0x87210 PowerMac
>   NIP:  be86b710 LR: be857e88 CTR: be86b704
>   REGS: f1b4df20 TRAP: 0300   Not tainted  (6.1.0-rc4+)
>   MSR:  00009032 <EE,ME,IR,DR,RI>  CR: 28008242  XER: 00000000
>   DAR: f1b4e000 DSISR: 42000000
>   GPR00: 00000001 f1b4dfe0 c11d2280 00000000 00000000 00000000 00000002 00000000
>   GPR08: f1b4e000 be86b704 f1b4e000 00000000 00000000 100d816a f2440000 fe73baa8
>   GPR16: f2458000 00000000 c1941ae4 f1fe2248 00000045 c0de0000 f2458030 00000000
>   GPR24: 000003e8 0000000f f2458000 f1b4dc90 3e584b46 00000000 f24466a0 c1941a00
>   NIP [be86b710] 0xbe86b710
>   LR [be857e88] __run_one+0xec/0x264 [test_bpf]
>   Call Trace:
>   [f1b4dfe0] [00000002] 0x2 (unreliable)
>   Instruction dump:
>   XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX
>   XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX
>   ---[ end trace 0000000000000000 ]---
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/bpf/32: Fix Oops on tail call tests
      https://git.kernel.org/powerpc/c/89d21e259a94f7d5582ec675aa445f5a79f347e4

cheers
