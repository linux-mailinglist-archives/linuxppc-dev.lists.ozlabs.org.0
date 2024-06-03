Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A14428D7A27
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jun 2024 04:46:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VsymZ68T2z3d28
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jun 2024 12:46:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VsylP3rsKz3bTP
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Jun 2024 12:45:53 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VsylN3kNRz4x10;
	Mon,  3 Jun 2024 12:45:52 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Hari Bathini <hbathini@linux.ibm.com>, bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, paulmck@kernel.org, Puranjay Mohan <puranjay@kernel.org>
In-Reply-To: <20240513100248.110535-1-puranjay@kernel.org>
References: <20240513100248.110535-1-puranjay@kernel.org>
Subject: Re: [PATCH bpf v3] powerpc/bpf: enforce full ordering for ATOMIC operations with BPF_FETCH
Message-Id: <171738271132.1517513.12789013884540856700.b4-ty@ellerman.id.au>
Date: Mon, 03 Jun 2024 12:45:11 +1000
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
Cc: Puranjay Mohan <puranjay@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 13 May 2024 10:02:48 +0000, Puranjay Mohan wrote:
> The Linux Kernel Memory Model [1][2] requires RMW operations that have a
> return value to be fully ordered.
> 
> BPF atomic operations with BPF_FETCH (including BPF_XCHG and
> BPF_CMPXCHG) return a value back so they need to be JITed to fully
> ordered operations. POWERPC currently emits relaxed operations for
> these.
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/bpf: enforce full ordering for ATOMIC operations with BPF_FETCH
      https://git.kernel.org/powerpc/c/b1e7cee96127468c2483cf10c2899c9b5cf79bf8

cheers
