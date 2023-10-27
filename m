Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF817D94F9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Oct 2023 12:16:20 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=kG9V+Tlb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SGz8f04J9z3vtW
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Oct 2023 21:16:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=kG9V+Tlb;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SGyzS4nfPz3cQ7
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Oct 2023 21:08:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1698401300;
	bh=cEQzeRUXv06MDDaWaCL3j8A2cyadnKJYI/xOqlzkLb8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=kG9V+TlbtxYc6/VtuMoWuvBZZA96pY4nS+XT7Nk8tNGzXDS0qUTJDw/iom4amzGUs
	 o5mf0oL6rVs5GyxnE2jxhg++oQteRkEejCVvNm/DQnoQRDlMJ4ETcOqg7kX0b0MhHA
	 ZPH6Vvd1Aj528Vy5h1it58MVthf85Mu6xu1t/2v/bTtrTPXuRbuftFMCW0lS6EuFCF
	 npUrn+8EMpsdjyGdcULpKW8b9OkQSVaV+7Vki9jN8aZwzVfjM5Sy/+n+V+rm05kD4g
	 laosIOu2TNnig+8K9IYQq5RytOfrHgJf0UO4Lsv/e4jvFJalxkVeiBuRWrX9grNYjR
	 BjoGVMRreDrMw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SGyzS0qnXz4xWm;
	Fri, 27 Oct 2023 21:08:20 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, bpf@vger.kernel.org, Hari Bathini <hbathini@linux.ibm.com>
In-Reply-To: <20231020141358.643575-1-hbathini@linux.ibm.com>
References: <20231020141358.643575-1-hbathini@linux.ibm.com>
Subject: Re: [PATCH v7 0/5] powerpc/bpf: use BPF prog pack allocator
Message-Id: <169840079686.2701453.13107509549614413199.b4-ty@ellerman.id.au>
Date: Fri, 27 Oct 2023 20:59:56 +1100
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
Cc: Song Liu <songliubraving@fb.com>, Daniel Borkmann <daniel@iogearbox.net>, Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 20 Oct 2023 19:43:53 +0530, Hari Bathini wrote:
> Most BPF programs are small, but they consume a page each. For systems
> with busy traffic and many BPF programs, this may also add significant
> pressure on instruction TLB. High iTLB pressure usually slows down the
> whole system causing visible performance degradation for production
> workloads.
> 
> bpf_prog_pack, a customized allocator that packs multiple bpf programs
> into preallocated memory chunks, was proposed [1] to address it. This
> series extends this support on powerpc.
> 
> [...]

Applied to powerpc/next.

[1/5] powerpc/code-patching: introduce patch_instructions()
      https://git.kernel.org/powerpc/c/465cabc97b42405eb89380ea6ba8d8b03e4ae1a2
[2/5] powerpc/bpf: implement bpf_arch_text_copy
      https://git.kernel.org/powerpc/c/6efc1675acb88eef45ef0156b93f95d66a8ee759
[3/5] powerpc/bpf: implement bpf_arch_text_invalidate for bpf_prog_pack
      https://git.kernel.org/powerpc/c/033ffaf0af1f974ecf401db3f70aae6fe1a90fc5
[4/5] powerpc/bpf: rename powerpc64_jit_data to powerpc_jit_data
      https://git.kernel.org/powerpc/c/de04e40600ae15fa5e484be242e74aad6de7418f
[5/5] powerpc/bpf: use bpf_jit_binary_pack_[alloc|finalize|free]
      https://git.kernel.org/powerpc/c/90d862f370b6e9de1b5d607843c5a2f9823990f3

cheers
