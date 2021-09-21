Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C9DB41353B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Sep 2021 16:21:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HDNsK73X9z2yZv
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Sep 2021 00:21:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HDNrw0T9Jz2xZL
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Sep 2021 00:21:19 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4HDNrr4P3rz9sTH;
 Tue, 21 Sep 2021 16:21:16 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XbTzWHWhH7j9; Tue, 21 Sep 2021 16:21:16 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4HDNrr2sLnz9sT9;
 Tue, 21 Sep 2021 16:21:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 470418B765;
 Tue, 21 Sep 2021 16:21:16 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id PE1hNpxh9zx8; Tue, 21 Sep 2021 16:21:16 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.202.127])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 1B6948B763;
 Tue, 21 Sep 2021 16:21:15 +0200 (CEST)
Subject: Re: [PATCH v3 6/8] bpf ppc64: Access only if addr is kernel address
To: Hari Bathini <hbathini@linux.ibm.com>, naveen.n.rao@linux.ibm.com,
 mpe@ellerman.id.au, ast@kernel.org, daniel@iogearbox.net
References: <20210921132943.489732-1-hbathini@linux.ibm.com>
 <20210921132943.489732-7-hbathini@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <837a3cee-4dc1-ccf2-c976-a9ab89e92b1f@csgroup.eu>
Date: Tue, 21 Sep 2021 16:21:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210921132943.489732-7-hbathini@linux.ibm.com>
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
Cc: Ravi Bangoria <ravi.bangoria@linux.ibm.com>, songliubraving@fb.com,
 netdev@vger.kernel.org, john.fastabend@gmail.com, andrii@kernel.org,
 kpsingh@kernel.org, paulus@samba.org, yhs@fb.com, bpf@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, kafai@fb.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 21/09/2021 à 15:29, Hari Bathini a écrit :
> From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
> 
> On PPC64 with KUAP enabled, any kernel code which wants to
> access userspace needs to be surrounded by disable-enable KUAP.
> But that is not happening for BPF_PROBE_MEM load instruction.
> So, when BPF program tries to access invalid userspace address,
> page-fault handler considers it as bad KUAP fault:
> 
>    Kernel attempted to read user page (d0000000) - exploit attempt? (uid: 0)
> 
> Considering the fact that PTR_TO_BTF_ID (which uses BPF_PROBE_MEM
> mode) could either be a valid kernel pointer or NULL but should
> never be a pointer to userspace address, execute BPF_PROBE_MEM load
> only if addr is kernel address, otherwise set dst_reg=0 and move on.
> 
> This will catch NULL, valid or invalid userspace pointers. Only bad
> kernel pointer will be handled by BPF exception table.
> 
> [Alexei suggested for x86]
> Suggested-by: Alexei Starovoitov <ast@kernel.org>
> Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
> ---
> 
> Changes in v3:
> * Used is_kernel_addr() logic instead of using TASK_SIZE_MAX check
>    all the time.
> * Addressed other comments from Christophe.
> 
> 
>   arch/powerpc/net/bpf_jit_comp64.c | 29 +++++++++++++++++++++++++++++
>   1 file changed, 29 insertions(+)
> 
> diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
> index 506934c13ef7..06e1206a4266 100644
> --- a/arch/powerpc/net/bpf_jit_comp64.c
> +++ b/arch/powerpc/net/bpf_jit_comp64.c
> @@ -734,6 +734,35 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
>   		case BPF_LDX | BPF_MEM | BPF_DW:
>   			fallthrough;
>   		case BPF_LDX | BPF_PROBE_MEM | BPF_DW:
> +			/*
> +			 * As PTR_TO_BTF_ID that uses BPF_PROBE_MEM mode could either be a valid
> +			 * kernel pointer or NULL but not a userspace address, execute BPF_PROBE_MEM
> +			 * load only if addr is kernel address (see is_kernel_addr()), otherwise
> +			 * set dst_reg=0 and move on.
> +			 */
> +			if (BPF_MODE(code) == BPF_PROBE_MEM) {
> +				EMIT(PPC_RAW_ADDI(b2p[TMP_REG_1], src_reg, off));
> +#ifdef CONFIG_PPC_BOOK3E_64

It is better to use IS_ENABLED() whenever possible,

		if (IS_ENABLED((CONFIG_PPC_BOOK3E_64))
			PPC_LI64(b2p[TMP_REG_2], 0x8000000000000000ul);
		else
			PPC_LI64(b2p[TMP_REG_2], PAGE_OFFSET);


> +				PPC_LI64(b2p[TMP_REG_2], 0x8000000000000000ul);
> +#elif defined(CONFIG_PPC_BOOK3S_64)
> +				PPC_LI64(b2p[TMP_REG_2], PAGE_OFFSET);
> +#else
> +				PPC_LI64(b2p[TMP_REG_2], TASK_SIZE);
> +#endif

PPC64 is either CONFIG_PPC_BOOK3S_64 or CONFIG_PPC_BOOK3E_64. The else 
is PPC32.


> +				EMIT(PPC_RAW_CMPLD(b2p[TMP_REG_1], b2p[TMP_REG_2]));
> +				PPC_BCC(COND_GT, (ctx->idx + 4) * 4);
> +				EMIT(PPC_RAW_LI(dst_reg, 0));
> +				/*
> +				 * Check if 'off' is word aligned because PPC_BPF_LL()
> +				 * (BPF_DW case) generates two instructions if 'off' is not
> +				 * word-aligned and one instruction otherwise.
> +				 */
> +				if (BPF_SIZE(code) == BPF_DW && (off & 3))
> +					PPC_JMP((ctx->idx + 3) * 4);
> +				else
> +					PPC_JMP((ctx->idx + 2) * 4);
> +			}
> +
>   			switch (size) {
>   			case BPF_B:
>   				EMIT(PPC_RAW_LBZ(dst_reg, src_reg, off));
> 
