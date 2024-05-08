Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C8CD8BFF32
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 May 2024 15:46:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VZGdj0wH7z3vkl
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 May 2024 23:46:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VZGXQ1R8Jz3cXk
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 May 2024 23:41:58 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VZGXP6RJ9z4xG1;
	Wed,  8 May 2024 23:41:57 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, bpf@vger.kernel.org, Hari Bathini <hbathini@linux.ibm.com>
In-Reply-To: <20240502173205.142794-1-hbathini@linux.ibm.com>
References: <20240502173205.142794-1-hbathini@linux.ibm.com>
Subject: Re: [PATCH v4 1/2] powerpc64/bpf: fix tail calls for PCREL addressing
Message-Id: <171517558549.165093.12896481227430118737.b4-ty@ellerman.id.au>
Date: Wed, 08 May 2024 23:39:45 +1000
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
Cc: Song Liu <songliubraving@fb.com>, Daniel Borkmann <daniel@iogearbox.net>, Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, stable@vger.kernel.org, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Martin KaFai Lau <martin.lau@linux.dev>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 02 May 2024 23:02:04 +0530, Hari Bathini wrote:
> With PCREL addressing, there is no kernel TOC. So, it is not setup in
> prologue when PCREL addressing is used. But the number of instructions
> to skip on a tail call was not adjusted accordingly. That resulted in
> not so obvious failures while using tailcalls. 'tailcalls' selftest
> crashed the system with the below call trace:
> 
>   bpf_test_run+0xe8/0x3cc (unreliable)
>   bpf_prog_test_run_skb+0x348/0x778
>   __sys_bpf+0xb04/0x2b00
>   sys_bpf+0x28/0x38
>   system_call_exception+0x168/0x340
>   system_call_vectored_common+0x15c/0x2ec
> 
> [...]

Applied to powerpc/next.

[1/2] powerpc64/bpf: fix tail calls for PCREL addressing
      https://git.kernel.org/powerpc/c/2ecfe59cd7de1f202e9af2516a61fbbf93d0bd4d
[2/2] powerpc/bpf: enable kfunc call
      https://git.kernel.org/powerpc/c/61688a82e047a4166436bf2665716cc070572ffa

cheers
