Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 747FA5653E8
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Jul 2022 13:41:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lc3mx2YxPz3g7k
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Jul 2022 21:41:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lc3fQ6Nwgz3c6y
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Jul 2022 21:36:14 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Lc3fP5lSQz4xdP;
	Mon,  4 Jul 2022 21:36:13 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: bpf@vger.kernel.org, Hari Bathini <hbathini@linux.ibm.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
In-Reply-To: <20220610155552.25892-1-hbathini@linux.ibm.com>
References: <20220610155552.25892-1-hbathini@linux.ibm.com>
Subject: Re: [PATCH v2 0/5] Atomics support for eBPF on powerpc
Message-Id: <165693443908.9954.12279962376383575979.b4-ty@ellerman.id.au>
Date: Mon, 04 Jul 2022 21:33:59 +1000
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
Cc: Song Liu <songliubraving@fb.com>, Daniel Borkmann <daniel@iogearbox.net>, Jordan Niethe <jniethe5@gmail.com>, John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>, KP Singh <kpsingh@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, Paul Mackerras <paulus@samba.org>, netdev@vger.kernel.org, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Yonghong Song <yhs@fb.com>, Martin KaFai Lau <kafai@fb.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 10 Jun 2022 21:25:47 +0530, Hari Bathini wrote:
> This patchset adds atomic operations to the eBPF instruction set on
> powerpc. The instructions that are added here can be summarised with
> this list of kernel operations for ppc64:
> 
> * atomic[64]_[fetch_]add
> * atomic[64]_[fetch_]and
> * atomic[64]_[fetch_]or
> * atomic[64]_[fetch_]xor
> * atomic[64]_xchg
> * atomic[64]_cmpxchg
> 
> [...]

Applied to powerpc/next.

[1/5] bpf ppc64: add support for BPF_ATOMIC bitwise operations
      https://git.kernel.org/powerpc/c/65112709115f48f16d7082bcabf173d08622e69f
[2/5] bpf ppc64: add support for atomic fetch operations
      https://git.kernel.org/powerpc/c/dbe6e2456fb0263a5a961a92836d2cebdbca979c
[3/5] bpf ppc64: Add instructions for atomic_[cmp]xchg
      https://git.kernel.org/powerpc/c/1e82dfaa7819f03f0b0022be7ca15bbc83090da1
[4/5] bpf ppc32: add support for BPF_ATOMIC bitwise operations
      https://git.kernel.org/powerpc/c/aea7ef8a82c0ea13ff20b65ff2edf8a38a17eda8
[5/5] bpf ppc32: Add instructions for atomic_[cmp]xchg
      https://git.kernel.org/powerpc/c/2d9206b227434912582049c49af1085660fa1e50

cheers
