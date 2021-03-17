Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A8633E98B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Mar 2021 07:12:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F0fvn1SlBz30LJ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Mar 2021 17:12:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F0fvS3YsDz309v
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Mar 2021 17:12:17 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4F0fvK5L07z9vBmL;
 Wed, 17 Mar 2021 07:12:13 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id RaYV9Wti6v7M; Wed, 17 Mar 2021 07:12:13 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4F0fvK3T74z9vBmJ;
 Wed, 17 Mar 2021 07:12:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5588F8B7FE;
 Wed, 17 Mar 2021 07:12:14 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id RDplpAdvlUpA; Wed, 17 Mar 2021 07:12:14 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D41298B768;
 Wed, 17 Mar 2021 07:12:13 +0100 (CET)
Subject: Re: [PATCH v9 3/8] powerpc/kprobes: Mark newly allocated probes as RO
To: Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20210316031741.1004850-1-jniethe5@gmail.com>
 <20210316031741.1004850-3-jniethe5@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <87553048-5f1f-0704-2256-d2c85b8e43c6@csgroup.eu>
Date: Wed, 17 Mar 2021 07:12:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210316031741.1004850-3-jniethe5@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
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
Cc: christophe.leroy@c-s.fr, naveen.n.rao@linux.ibm.com, ajd@linux.ibm.com,
 npiggin@gmail.com, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 16/03/2021 à 04:17, Jordan Niethe a écrit :
> From: Russell Currey <ruscur@russell.cc>
> 
> With CONFIG_STRICT_KERNEL_RWX=y and CONFIG_KPROBES=y, there will be one
> W+X page at boot by default.  This can be tested with
> CONFIG_PPC_PTDUMP=y and CONFIG_PPC_DEBUG_WX=y set, and checking the
> kernel log during boot.
> 
> Add an arch specific insn page allocator which returns RO pages if
> STRICT_KERNEL_RWX is enabled. This page is only written to with
> patch_instruction() which is able to write RO pages.
> 

Did you investigate BPF ? The problematic looks more or less similar to kprobe:

bpf_jit_compile() in arch/powerpc/net/bpf_jit_comp.c calls module_alloc(), which provides it with 
PAGE_KERNEL_TEXT memory, ie RWX. That function is only used on PPC32 which still has Classic BPF, 
and this is about to go away with future series 
https://patchwork.ozlabs.org/project/linuxppc-dev/cover/cover.1608112796.git.christophe.leroy@csgroup.eu/

PPC64 has Extended BPF instead, and PPC32 will it the future too.
bpf_int_jit_compile() in arch/powerpc/net/bpf_jit_comp64.c calls bpf_jit_binary_alloc() which uses 
bpf_jit_alloc_exec().

bpf_jit_alloc_exec() is a weak function that should be redefined for powerpc I think, more or less 
like alloc_insn_page() for kprobes.

Christophe
