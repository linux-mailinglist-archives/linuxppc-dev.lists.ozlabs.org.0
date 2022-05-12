Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C4952553A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 May 2022 21:00:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kzh0t6gR5z3c8C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 May 2022 04:59:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=iogearbox.net (client-ip=213.133.104.62;
 helo=www62.your-server.de; envelope-from=daniel@iogearbox.net;
 receiver=<UNKNOWN>)
X-Greylist: delayed 1109 seconds by postgrey-1.36 at boromir;
 Fri, 13 May 2022 04:59:35 AEST
Received: from www62.your-server.de (www62.your-server.de [213.133.104.62])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kzh0R3jj5z3byY
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 May 2022 04:59:35 +1000 (AEST)
Received: from sslproxy05.your-server.de ([78.46.172.2])
 by www62.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92.3) (envelope-from <daniel@iogearbox.net>)
 id 1npDk7-000CtV-Cb; Thu, 12 May 2022 20:40:55 +0200
Received: from [85.1.206.226] (helo=linux.home)
 by sslproxy05.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <daniel@iogearbox.net>)
 id 1npDk6-000UcN-U2; Thu, 12 May 2022 20:40:54 +0200
Subject: Re: [PATCH 0/5] Atomics support for eBPF on powerpc
To: Hari Bathini <hbathini@linux.ibm.com>, bpf@vger.kernel.org,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
References: <20220512074546.231616-1-hbathini@linux.ibm.com>
From: Daniel Borkmann <daniel@iogearbox.net>
Message-ID: <21577e77-9860-7746-235e-8c241b4a8a7a@iogearbox.net>
Date: Thu, 12 May 2022 20:40:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20220512074546.231616-1-hbathini@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Authenticated-Sender: daniel@iogearbox.net
X-Virus-Scanned: Clear (ClamAV 0.103.5/26539/Thu May 12 10:04:41 2022)
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
Cc: Song Liu <songliubraving@fb.com>, John Fastabend <john.fastabend@gmail.com>,
 Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>,
 netdev@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Yonghong Song <yhs@fb.com>,
 KP Singh <kpsingh@kernel.org>, Jordan Niethe <jniethe5@gmail.com>,
 Martin KaFai Lau <kafai@fb.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 5/12/22 9:45 AM, Hari Bathini wrote:
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
> and this list of kernel operations for ppc32:
> 
> * atomic_[fetch_]add
> * atomic_[fetch_]and
> * atomic_[fetch_]or
> * atomic_[fetch_]xor
> * atomic_xchg
> * atomic_cmpxchg
> 
> The following are left out of scope for this effort:
> 
> * 64 bit operations on ppc32.
> * Explicit memory barriers, 16 and 8 bit operations on both ppc32
>    & ppc64.
> 
> The first patch adds support for bitwsie atomic operations on ppc64.
> The next patch adds fetch variant support for these instructions. The
> third patch adds support for xchg and cmpxchg atomic operations on
> ppc64. Patch #4 adds support for 32-bit atomic bitwise operations on
> ppc32. patch #5 adds support for xchg and cmpxchg atomic operations
> on ppc32.

Thanks for adding these, Hari! I presume they'll get routed via Michael,
right? One thing that may be worth adding to the commit log as well is
the test result from test_bpf.ko given it has an extensive suite around
atomics useful for testing corner cases in JITs.

> Hari Bathini (5):
>    bpf ppc64: add support for BPF_ATOMIC bitwise operations
>    bpf ppc64: add support for atomic fetch operations
>    bpf ppc64: Add instructions for atomic_[cmp]xchg
>    bpf ppc32: add support for BPF_ATOMIC bitwise operations
>    bpf ppc32: Add instructions for atomic_[cmp]xchg
> 
>   arch/powerpc/net/bpf_jit_comp32.c | 62 +++++++++++++++++-----
>   arch/powerpc/net/bpf_jit_comp64.c | 87 +++++++++++++++++++++----------
>   2 files changed, 108 insertions(+), 41 deletions(-)
> 

