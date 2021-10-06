Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B46423739
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Oct 2021 06:51:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HPMTt6BRPz30DC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Oct 2021 15:50:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HPMTS5MhDz2yKJ
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Oct 2021 15:50:34 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4HPMTM6mQxz9sVL;
 Wed,  6 Oct 2021 06:50:31 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 12nTGo35SOK0; Wed,  6 Oct 2021 06:50:31 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4HPMTM5YzNz9sVK;
 Wed,  6 Oct 2021 06:50:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A1D388B765;
 Wed,  6 Oct 2021 06:50:31 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 7TC3HBM5bn8x; Wed,  6 Oct 2021 06:50:31 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.204.229])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B3FA48B763;
 Wed,  6 Oct 2021 06:50:30 +0200 (CEST)
Subject: Re: [PATCH v2 01/10] powerpc/lib: Add helper to check if offset is
 within conditional branch range
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Jordan Niethe <jniethe5@gmail.com>, Daniel Borkmann <daniel@iogearbox.net>,
 Alexei Starovoitov <alexei.starovoitov@gmail.com>,
 Johan Almbladh <johan.almbladh@anyfinetworks.com>,
 Song Liu <songliubraving@fb.com>
References: <cover.1633464148.git.naveen.n.rao@linux.vnet.ibm.com>
 <442b69a34ced32ca346a0d9a855f3f6cfdbbbd41.1633464148.git.naveen.n.rao@linux.vnet.ibm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <6d3a46f1-41fa-232d-079d-3b98bf7c3d17@csgroup.eu>
Date: Wed, 6 Oct 2021 06:50:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <442b69a34ced32ca346a0d9a855f3f6cfdbbbd41.1633464148.git.naveen.n.rao@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr-FR
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
Cc: bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 05/10/2021 à 22:25, Naveen N. Rao a écrit :
> Add a helper to check if a given offset is within the branch range for a
> powerpc conditional branch instruction, and update some sites to use the
> new helper.
> 
> Acked-by: Song Liu <songliubraving@fb.com>
> Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

> ---
> Changelog:
> - Change 0x7FFF to 0x7fff, per Christophe
> 
> 
>   arch/powerpc/include/asm/code-patching.h | 1 +
>   arch/powerpc/lib/code-patching.c         | 7 ++++++-
>   arch/powerpc/net/bpf_jit.h               | 7 +------
>   3 files changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/code-patching.h b/arch/powerpc/include/asm/code-patching.h
> index a95f63788c6b14..4ba834599c4d4c 100644
> --- a/arch/powerpc/include/asm/code-patching.h
> +++ b/arch/powerpc/include/asm/code-patching.h
> @@ -23,6 +23,7 @@
>   #define BRANCH_ABSOLUTE	0x2
>   
>   bool is_offset_in_branch_range(long offset);
> +bool is_offset_in_cond_branch_range(long offset);
>   int create_branch(struct ppc_inst *instr, const u32 *addr,
>   		  unsigned long target, int flags);
>   int create_cond_branch(struct ppc_inst *instr, const u32 *addr,
> diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
> index f9a3019e37b43c..c5ed9882383521 100644
> --- a/arch/powerpc/lib/code-patching.c
> +++ b/arch/powerpc/lib/code-patching.c
> @@ -228,6 +228,11 @@ bool is_offset_in_branch_range(long offset)
>   	return (offset >= -0x2000000 && offset <= 0x1fffffc && !(offset & 0x3));
>   }
>   
> +bool is_offset_in_cond_branch_range(long offset)
> +{
> +	return offset >= -0x8000 && offset <= 0x7fff && !(offset & 0x3);
> +}
> +
>   /*
>    * Helper to check if a given instruction is a conditional branch
>    * Derived from the conditional checks in analyse_instr()
> @@ -280,7 +285,7 @@ int create_cond_branch(struct ppc_inst *instr, const u32 *addr,
>   		offset = offset - (unsigned long)addr;
>   
>   	/* Check we can represent the target in the instruction format */
> -	if (offset < -0x8000 || offset > 0x7FFF || offset & 0x3)
> +	if (!is_offset_in_cond_branch_range(offset))
>   		return 1;
>   
>   	/* Mask out the flags and target, so they don't step on each other. */
> diff --git a/arch/powerpc/net/bpf_jit.h b/arch/powerpc/net/bpf_jit.h
> index 99fad093f43ec1..935ea95b66359e 100644
> --- a/arch/powerpc/net/bpf_jit.h
> +++ b/arch/powerpc/net/bpf_jit.h
> @@ -78,11 +78,6 @@
>   #define PPC_FUNC_ADDR(d,i) do { PPC_LI32(d, i); } while(0)
>   #endif
>   
> -static inline bool is_nearbranch(int offset)
> -{
> -	return (offset < 32768) && (offset >= -32768);
> -}
> -
>   /*
>    * The fly in the ointment of code size changing from pass to pass is
>    * avoided by padding the short branch case with a NOP.	 If code size differs
> @@ -91,7 +86,7 @@ static inline bool is_nearbranch(int offset)
>    * state.
>    */
>   #define PPC_BCC(cond, dest)	do {					      \
> -		if (is_nearbranch((dest) - (ctx->idx * 4))) {		      \
> +		if (is_offset_in_cond_branch_range((long)(dest) - (ctx->idx * 4))) {	\
>   			PPC_BCC_SHORT(cond, dest);			      \
>   			EMIT(PPC_RAW_NOP());				      \
>   		} else {						      \
> 
