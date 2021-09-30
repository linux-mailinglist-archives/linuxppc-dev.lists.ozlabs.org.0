Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59FE341E2E9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Sep 2021 22:58:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HL5FB0hmBz30BM
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Oct 2021 06:58:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=iogearbox.net (client-ip=213.133.104.62;
 helo=www62.your-server.de; envelope-from=daniel@iogearbox.net;
 receiver=<UNKNOWN>)
Received: from www62.your-server.de (www62.your-server.de [213.133.104.62])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HL5Dh1j04z304S
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Oct 2021 06:58:08 +1000 (AEST)
Received: from sslproxy01.your-server.de ([78.46.139.224])
 by www62.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92.3) (envelope-from <daniel@iogearbox.net>)
 id 1mW37V-000DIq-1m; Thu, 30 Sep 2021 22:57:33 +0200
Received: from [85.1.206.226] (helo=linux.home)
 by sslproxy01.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <daniel@iogearbox.net>)
 id 1mW37U-000FDj-Lu; Thu, 30 Sep 2021 22:57:32 +0200
Subject: Re: [PATCH v4 0/8] bpf powerpc: Add BPF_PROBE_MEM support in powerpc
 JIT compiler
To: Hari Bathini <hbathini@linux.ibm.com>, naveen.n.rao@linux.ibm.com,
 christophe.leroy@csgroup.eu, mpe@ellerman.id.au, ast@kernel.org
References: <20210929111855.50254-1-hbathini@linux.ibm.com>
From: Daniel Borkmann <daniel@iogearbox.net>
Message-ID: <88b59272-e3f7-30ba-dda0-c4a6b42c0029@iogearbox.net>
Date: Thu, 30 Sep 2021 22:57:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20210929111855.50254-1-hbathini@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Authenticated-Sender: daniel@iogearbox.net
X-Virus-Scanned: Clear (ClamAV 0.103.3/26308/Thu Sep 30 11:04:45 2021)
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

On 9/29/21 1:18 PM, Hari Bathini wrote:
> Patch #1 & #2 are simple cleanup patches. Patch #3 refactors JIT
> compiler code with the aim to simplify adding BPF_PROBE_MEM support.
> Patch #4 introduces PPC_RAW_BRANCH() macro instead of open coding
> branch instruction. Patch #5 & #7 add BPF_PROBE_MEM support for PPC64
> & PPC32 JIT compilers respectively. Patch #6 & #8 handle bad userspace
> pointers for PPC64 & PPC32 cases respectively.

Michael, are you planning to pick up the series or shall we route via bpf-next?

Thanks,
Daniel

> Changes in v4:
> * Addressed all the review comments from Christophe.
> 
> 
> Hari Bathini (4):
>    bpf powerpc: refactor JIT compiler code
>    powerpc/ppc-opcode: introduce PPC_RAW_BRANCH() macro
>    bpf ppc32: Add BPF_PROBE_MEM support for JIT
>    bpf ppc32: Access only if addr is kernel address
> 
> Ravi Bangoria (4):
>    bpf powerpc: Remove unused SEEN_STACK
>    bpf powerpc: Remove extra_pass from bpf_jit_build_body()
>    bpf ppc64: Add BPF_PROBE_MEM support for JIT
>    bpf ppc64: Access only if addr is kernel address
> 
>   arch/powerpc/include/asm/ppc-opcode.h |   2 +
>   arch/powerpc/net/bpf_jit.h            |  19 +++--
>   arch/powerpc/net/bpf_jit_comp.c       |  72 ++++++++++++++++--
>   arch/powerpc/net/bpf_jit_comp32.c     | 101 ++++++++++++++++++++++----
>   arch/powerpc/net/bpf_jit_comp64.c     |  72 ++++++++++++++----
>   5 files changed, 224 insertions(+), 42 deletions(-)
> 

