Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 55FC548AFD6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jan 2022 15:44:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JYD491xyDz3cNl
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jan 2022 01:44:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=temperror (SPF Temporary Error: DNS Timeout)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JYD3R2bR3z30RT
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jan 2022 01:43:42 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4JYD2x59F1z9sSb;
 Tue, 11 Jan 2022 15:43:37 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QbyPiAZ3CXvW; Tue, 11 Jan 2022 15:43:37 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4JYD2x4L2lz9sSW;
 Tue, 11 Jan 2022 15:43:37 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8432B8B774;
 Tue, 11 Jan 2022 15:43:37 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id e3xOgcnyXO4V; Tue, 11 Jan 2022 15:43:37 +0100 (CET)
Received: from [192.168.235.34] (unknown [192.168.235.34])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id F1E4A8B763;
 Tue, 11 Jan 2022 15:43:36 +0100 (CET)
Message-ID: <01d558b9-82b7-f73e-70d6-d19a192d47b6@csgroup.eu>
Date: Tue, 11 Jan 2022 15:43:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 11/13] powerpc64/bpf elfv2: Setup kernel TOC in r2 on entry
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Alexei Starovoitov <alexei.starovoitov@gmail.com>,
 Daniel Borkmann <daniel@iogearbox.net>, Michael Ellerman <mpe@ellerman.id.au>
References: <cover.1641468127.git.naveen.n.rao@linux.vnet.ibm.com>
 <4501050f6080f12bd3ba1b5d9d7bef8d3aa57d23.1641468127.git.naveen.n.rao@linux.vnet.ibm.com>
 <d0e28f07-c24c-200d-de04-5d27c651a5e6@csgroup.eu>
 <1641896867.1ukblu8135.naveen@linux.ibm.com>
 <080527ac-54f2-6e41-17a0-fdb7a556c30d@csgroup.eu>
In-Reply-To: <080527ac-54f2-6e41-17a0-fdb7a556c30d@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: "ykaliuta@redhat.com" <ykaliuta@redhat.com>,
 "johan.almbladh@anyfinetworks.com" <johan.almbladh@anyfinetworks.com>,
 Jiri Olsa <jolsa@redhat.com>, "song@kernel.org" <song@kernel.org>,
 "bpf@vger.kernel.org" <bpf@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 11/01/2022 à 15:35, Christophe Leroy a écrit :
> 
> 
> Le 11/01/2022 à 11:31, Naveen N. Rao a écrit :
>> Christophe Leroy wrote:
>>>
>>>
>>> Le 06/01/2022 à 12:45, Naveen N. Rao a écrit :
>>>> In preparation for using kernel TOC, load the same in r2 on entry. With
>>>> elfv1, the kernel TOC is already setup by our caller so we just emit a
>>>> nop. We adjust the number of instructions to skip on a tail call
>>>> accordingly.
>>>>
>>>> Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
>>>> ---
>>>>    arch/powerpc/net/bpf_jit_comp64.c | 8 +++++++-
>>>>    1 file changed, 7 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/arch/powerpc/net/bpf_jit_comp64.c
>>>> b/arch/powerpc/net/bpf_jit_comp64.c
>>>> index ce4fc59bbd6a92..e05b577d95bf11 100644
>>>> --- a/arch/powerpc/net/bpf_jit_comp64.c
>>>> +++ b/arch/powerpc/net/bpf_jit_comp64.c
>>>> @@ -73,6 +73,12 @@ void bpf_jit_build_prologue(u32 *image, struct
>>>> codegen_context *ctx)
>>>>    {
>>>>        int i;
>>>> +#ifdef PPC64_ELF_ABI_v2
>>>> +    PPC_BPF_LL(_R2, _R13, offsetof(struct paca_struct, kernel_toc));
>>>> +#else
>>>> +    EMIT(PPC_RAW_NOP());
>>>> +#endif
>>>
>>> Can we avoid the #ifdef, using
>>>
>>>      if (__is_defined(PPC64_ELF_ABI_v2))
>>>          PPC_BPF_LL(_R2, _R13, offsetof(struct paca_struct, kernel_toc));
>>>      else
>>>          EMIT(PPC_RAW_NOP());
>>
>> Hmm... that doesn't work for me. Is __is_defined() expected to work with
>> macros other than CONFIG options?
> 
> Yes, __is_defined() should work with any item.
> 
> It is IS_ENABLED() which is supposed to work only with CONFIG options.
> 
> See commit 5c189c523e78 ("powerpc/time: Fix mftb()/get_tb() for use with
> the compat VDSO")
> 
> Or commit ca5999fde0a1 ("mm: introduce include/linux/pgtable.h")

Ah ... wait.

It seems it expects a macro set to 1.

So it would require arch/powerpc/include/asm/types.h to be modified to 
define PPC64_ELF_ABI_v2 or PPC64_ELF_ABI_v1 as 1

Christophe
