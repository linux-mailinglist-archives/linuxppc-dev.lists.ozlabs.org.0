Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA8A40FE2A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Sep 2021 18:51:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HB0Mc350Sz305L
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Sep 2021 02:51:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HB0M82qtTz2yJB
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Sep 2021 02:50:42 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4HB0M348tfz9sTL;
 Fri, 17 Sep 2021 18:50:39 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LC-caAVKimfd; Fri, 17 Sep 2021 18:50:39 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4HB0M338ztz9sT0;
 Fri, 17 Sep 2021 18:50:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 585B08B799;
 Fri, 17 Sep 2021 18:50:39 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id LUbXjviGP9Hi; Fri, 17 Sep 2021 18:50:39 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.202.36])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 1BABC8B768;
 Fri, 17 Sep 2021 18:50:38 +0200 (CEST)
Subject: Re: [PATCH v2 6/8] bpf ppc64: Add addr > TASK_SIZE_MAX explicit check
To: Hari Bathini <hbathini@linux.ibm.com>, naveen.n.rao@linux.ibm.com,
 mpe@ellerman.id.au, ast@kernel.org, daniel@iogearbox.net
References: <20210917153047.177141-1-hbathini@linux.ibm.com>
 <20210917153047.177141-7-hbathini@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <e59e587f-37ff-9e3d-83a1-7b15bc901643@csgroup.eu>
Date: Fri, 17 Sep 2021 18:50:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210917153047.177141-7-hbathini@linux.ibm.com>
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



Le 17/09/2021 à 17:30, Hari Bathini a écrit :
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
> only if addr > TASK_SIZE_MAX, otherwise set dst_reg=0 and move on.

You should do like copy_from_kernel_nofault_allowed() and use the same 
criterias as is_kernel_addr() instead of using TASK_SIZE_MAX.

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
> Changes in v2:
> * Refactored the code based on Christophe's comments.
> 
> 
>   arch/powerpc/net/bpf_jit_comp64.c | 23 +++++++++++++++++++++++
>   1 file changed, 23 insertions(+)
> 
> diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
> index 2fc10995f243..eb28dbc67151 100644
> --- a/arch/powerpc/net/bpf_jit_comp64.c
> +++ b/arch/powerpc/net/bpf_jit_comp64.c
> @@ -769,6 +769,29 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
>   		/* dst = *(u64 *)(ul) (src + off) */
>   		case BPF_LDX | BPF_MEM | BPF_DW:
>   		case BPF_LDX | BPF_PROBE_MEM | BPF_DW:
> +			/*
> +			 * As PTR_TO_BTF_ID that uses BPF_PROBE_MEM mode could either be a valid
> +			 * kernel pointer or NULL but not a userspace address, execute BPF_PROBE_MEM
> +			 * load only if addr > TASK_SIZE_MAX, otherwise set dst_reg=0 and move on.
> +			 */
> +			if (BPF_MODE(code) == BPF_PROBE_MEM) {
> +				unsigned int adjusted_idx;
> +
> +				/*
> +				 * Check if 'off' is word aligned because PPC_BPF_LL()
> +				 * (BPF_DW case) generates two instructions if 'off' is not
> +				 * word-aligned and one instruction otherwise.
> +				 */
> +				adjusted_idx = ((BPF_SIZE(code) == BPF_DW) && (off & 3)) ? 1 : 0;

No need of ( ) around 'BPF_SIZE(code) == BPF_DW'

> +
> +				EMIT(PPC_RAW_ADDI(b2p[TMP_REG_1], src_reg, off));
> +				PPC_LI64(b2p[TMP_REG_2], TASK_SIZE_MAX);
> +				EMIT(PPC_RAW_CMPLD(b2p[TMP_REG_1], b2p[TMP_REG_2]));
> +				PPC_BCC(COND_GT, (ctx->idx + 4) * 4);
> +				EMIT(PPC_RAW_LI(dst_reg, 0));
> +				PPC_JMP((ctx->idx + 2 + adjusted_idx) * 4);

I think it would be more explicit if you drop adjusted_idx and do :

				if (BPF_SIZE(code) == BPF_DW) && (off & 3)
					PPC_JMP((ctx->idx + 3) * 4);
				else
					PPC_JMP((ctx->idx + 2) * 4);

> +			}
> +
>   			switch (size) {
>   			case BPF_B:
>   				EMIT(PPC_RAW_LBZ(dst_reg, src_reg, off));
> 
