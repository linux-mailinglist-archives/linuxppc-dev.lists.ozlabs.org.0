Return-Path: <linuxppc-dev+bounces-10643-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 041C4B1B0E7
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Aug 2025 11:20:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bx7FK1xQdz3bkL;
	Tue,  5 Aug 2025 19:20:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.236.30
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754385637;
	cv=none; b=OQ1LIACqKp1iVNldvsawtoeI2zPlfG9qPpwyWPvDqRE4IRSp2eMfXLmKfSzXcdHG74AxJESp1ecfNx4VX8UlgEMhiBWxTqoB8F0bT+ckpDBwldgQ5I7f5vGfn+hkN8J/cuaOipg/A2AKhAyvdwCJFkpt+tHO63txRae7vaAB3muRMuODv4anC7G4917E7kXkrFqoLwfof9QiJr8vPQ2DDPddJksEd3pOgyrMTfML+UL4zIxQ02vvuUMJfWp4ZM02vok9k181kWorlu4hxpVvYzJYdZGWeU495VpjJ+RvAm62IT4ab506iGa5eNNQV0y4WDEXpfaukFwxqffHa4xPTw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754385637; c=relaxed/relaxed;
	bh=/gBpGdEEOIoQW1AJhsbnrD9ob04PrfRclJXcWmZ09zc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cBibe21oIhYC74DRdaW5YrfI0YvWeXa6iRFOaHnG8nczidR96rjXjpJj0w6YnLgivGD18S3tgR3JHaI+nPOtoX/mqUaGwWJ/7/GTrnSnTWOLYt4ivWDqpADpG09r9Kq7Cg68D6J8YVXa3Iz19FdkArAynLMljX+ECJZG9f4Q94znLIz2PxnjDQbUXgdtHcGOUSEEx0uVRGYkn47YnkCFZITXd6qIIqCeztka7bJnC5YuG9cuiuJSFlkYF4CRcWuQKetEuQ4B67h9Tsa98NO8j4yU0xQPnggzUEcvkHuu/hBYd8bvK1VShH1l5ktJBi4FywPnVDl/SFcht422MAEYYA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bx7FJ3GCPz3064
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Aug 2025 19:20:36 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4bx4tk4fRkz9sqT;
	Tue,  5 Aug 2025 09:34:22 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M2KWXNzhh9Q9; Tue,  5 Aug 2025 09:34:22 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4bx4tk3tHTz9sps;
	Tue,  5 Aug 2025 09:34:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 7BB458B765;
	Tue,  5 Aug 2025 09:34:22 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 60eHZvnq60Lk; Tue,  5 Aug 2025 09:34:22 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 4970B8B763;
	Tue,  5 Aug 2025 09:34:21 +0200 (CEST)
Message-ID: <e65548d0-14aa-4b9c-8051-7c91c5dffd1f@csgroup.eu>
Date: Tue, 5 Aug 2025 09:34:21 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [bpf-next 1/6] bpf,powerpc: Introduce
 bpf_jit_emit_probe_mem_store() to emit store instructions
To: Saket Kumar Bhaskar <skb99@linux.ibm.com>, bpf@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: hbathini@linux.ibm.com, sachinpb@linux.ibm.com, venkat88@linux.ibm.com,
 andrii@kernel.org, eddyz87@gmail.com, mykolal@fb.com, ast@kernel.org,
 daniel@iogearbox.net, martin.lau@linux.dev, song@kernel.org,
 yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org,
 sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org, naveen@kernel.org,
 maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
 memxor@gmail.com, iii@linux.ibm.com, shuah@kernel.org
References: <20250805062747.3479221-1-skb99@linux.ibm.com>
 <20250805062747.3479221-2-skb99@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20250805062747.3479221-2-skb99@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 05/08/2025 à 08:27, Saket Kumar Bhaskar a écrit :
> bpf_jit_emit_probe_mem_store() is introduced to emit instructions for
> storing memory values depending on the size (byte, halfword,
> word, doubleword).

Build break with this patch

   CC      arch/powerpc/net/bpf_jit_comp64.o
arch/powerpc/net/bpf_jit_comp64.c:395:12: error: 
'bpf_jit_emit_probe_mem_store' defined but not used 
[-Werror=unused-function]
  static int bpf_jit_emit_probe_mem_store(struct codegen_context *ctx, 
u32 src_reg, s16 off,
             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors
make[4]: *** [scripts/Makefile.build:287: 
arch/powerpc/net/bpf_jit_comp64.o] Error 1


> 
> Signed-off-by: Saket Kumar Bhaskar <skb99@linux.ibm.com>
> ---
>   arch/powerpc/net/bpf_jit_comp64.c | 30 ++++++++++++++++++++++++++++++
>   1 file changed, 30 insertions(+)
> 
> diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
> index 025524378443..489de21fe3d6 100644
> --- a/arch/powerpc/net/bpf_jit_comp64.c
> +++ b/arch/powerpc/net/bpf_jit_comp64.c
> @@ -409,6 +409,36 @@ asm (
>   "		blr				;"
>   );
>   
> +static int bpf_jit_emit_probe_mem_store(struct codegen_context *ctx, u32 src_reg, s16 off,
> +					u32 code, u32 *image)
> +{
> +	u32 tmp1_reg = bpf_to_ppc(TMP_REG_1);
> +	u32 tmp2_reg = bpf_to_ppc(TMP_REG_2);
> +
> +	switch (BPF_SIZE(code)) {
> +	case BPF_B:
> +		EMIT(PPC_RAW_STB(src_reg, tmp1_reg, off));
> +		break;
> +	case BPF_H:
> +		EMIT(PPC_RAW_STH(src_reg, tmp1_reg, off));
> +		break;
> +	case BPF_W:
> +		EMIT(PPC_RAW_STW(src_reg, tmp1_reg, off));
> +		break;
> +	case BPF_DW:
> +		if (off % 4) {
> +			EMIT(PPC_RAW_LI(tmp2_reg, off));
> +			EMIT(PPC_RAW_STDX(src_reg, tmp1_reg, tmp2_reg));
> +		} else {
> +			EMIT(PPC_RAW_STD(src_reg, tmp1_reg, off));
> +		}
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +	return 0;
> +}
> +
>   static int emit_atomic_ld_st(const struct bpf_insn insn, struct codegen_context *ctx, u32 *image)
>   {
>   	u32 code = insn.code;


