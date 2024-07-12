Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C431492FAB8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jul 2024 14:54:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WLBPJ4105z3cp1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jul 2024 22:54:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WLBNv5cHcz3c3H
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Jul 2024 22:53:51 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WLBNv0dScz4wc1;
	Fri, 12 Jul 2024 22:53:51 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Artem Savkov <asavkov@redhat.com>
In-Reply-To: <20240517075650.248801-1-asavkov@redhat.com>
References: <20240517075650.248801-1-asavkov@redhat.com>
Subject: Re: [PATCH 0/5] powerpc64/bpf: jit support for cpuv4 instructions
Message-Id: <172078879459.310795.3299316174968073660.b4-ty@ellerman.id.au>
Date: Fri, 12 Jul 2024 22:53:14 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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
Cc: Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, bpf@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 17 May 2024 09:56:45 +0200, Artem Savkov wrote:
> Add support for recently added cpuv4 instructions fixing test_bpf module
> failures. This is mostly based on 8ecf3c1dab1c6 (powerpc/bpf/32: Fix
> failing test_bpf tests, 2024-03-05)
> 
> Artem Savkov (5):
>   powerpc64/bpf: jit support for 32bit offset jmp instruction
>   powerpc64/bpf: jit support for unconditional byte swap
>   powerpc64/bpf: jit support for sign extended load
>   powerpc64/bpf: jit support for sign extended mov
>   powerpc64/bpf: jit support for signed division and modulo
> 
> [...]

Applied to powerpc/next.

[1/5] powerpc64/bpf: jit support for 32bit offset jmp instruction
      https://git.kernel.org/powerpc/c/3c086ce222cefcf16d412faa10d456161d076796
[2/5] powerpc64/bpf: jit support for unconditional byte swap
      https://git.kernel.org/powerpc/c/a71c0b09a14db72d59c48a8cda7a73032f4d418b
[3/5] powerpc64/bpf: jit support for sign extended load
      https://git.kernel.org/powerpc/c/717756c9c8ddad9f28389185bfb161d4d88e01a4
[4/5] powerpc64/bpf: jit support for sign extended mov
      https://git.kernel.org/powerpc/c/597b1710982d10b8629697e4a548b30d0d93eeed
[5/5] powerpc64/bpf: jit support for signed division and modulo
      https://git.kernel.org/powerpc/c/fde318326daa48a4bb3ca8ee229bac4d14b5bc2a

cheers
