Return-Path: <linuxppc-dev+bounces-14482-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BE58AC84680
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Nov 2025 11:15:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dFz8j3ZPJz30FR;
	Tue, 25 Nov 2025 21:15:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764065717;
	cv=none; b=cZQScFNdw2H+YCga5dV+2NeAhku7V21O87G0saEyq7DGn8kdQsmiiBixAUcmMt1h0B/rbIQ75IXKIPtn8EQ+OUFE9heskjlG7JhV7wUvnm1gKOa0zVO0iaIUipfTSbHcyOsbQVcYG8kdskmWtt/y14GpDDEIZNJYQtkkIas2UE28Pu0q+y6wSaNHt3DXnGqIQXwu5+EbZS7ytGGgDRb0LeOKQF5rMEWrtnhk5FeA0ku9MdCR0RCz5EK0kcjmw+SALz0nWQhJB1c55H3i7b6+rFYffjSc3kRWPSC5ozyd1ZLuJAK8yqZzmME/DB8U1/Z1xBMbae657rM4O6wlGnrqXw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764065717; c=relaxed/relaxed;
	bh=EuXe4Y3h3MY1uUgr8FcInqhkdluCTebnQuHvnihYzlI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jwQ2WjjDCGeSlzUuCDcCJ/6Y5lDp9wiMNhP3+4dp9D3HU+jniItUq7kEEfz4WB7njLEAwIaTlcR+72jotSwj3QMsW4E1GUZwbp4vDSvELW8vGISBLNFxvoj6FH+l1zvKvHXxTe+3O+isEYt/OFOSreb+AKdyUWzLguELlcyKLSs6AJQ2GzbOfyC+QlPVslbVqXUH8J6sefSaybsCYuvndNq42zsjWFeWdm95oclOPJuDdOHoYXdC6rWfZw+b3cwuFkUrf9U3YlrKj4+64aLrc3HTnZmQt5uNnyoGM2JjZvEiggZueRZ4Dorz6ap/zzJdMDrMWa16Qb9l3Iq3c98ZqQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QWjXfqRb; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QWjXfqRb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dFz8h4v5yz308l
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Nov 2025 21:15:16 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 165BE601FD;
	Tue, 25 Nov 2025 10:15:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBD0EC4AF09;
	Tue, 25 Nov 2025 10:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764065713;
	bh=PCZTA7CvmQSqQVYlMmBwBTfrOIW/wW5BU9i50jf3yeI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QWjXfqRbwubOSTGPMSqYm28L/bIZ7iWVjIWHKZ+DB8g7XVlauedGg9pW1ud1Q+PUA
	 OKgr0ThV6DJA3AMs7aodw1M+S304kycMfFy6McrCPqdOmr1cAxWleNaf23dMdMP0hs
	 0K2Dp5AiO55tiBGqhUVDXDdfo93HnpGbbYk6j+G/4tXAMEBMQYCyxBYw9NAE/STYdz
	 pZ/CU4uc/XN3iKB6R7K49C+WmqIHb26M8qbmb7s5ZBJm39ahCWNCqlYgBcLr5WiB2O
	 IlYKqVXQkH8xutX+uBFC6TCGC8uvC0TnCybpemKZSjwcGRWffQrQNGJs+WG9RxmJTh
	 +VGG1sAKiGLjQ==
Message-ID: <37ae675e-dab2-478d-a5a5-17e50679fefa@kernel.org>
Date: Tue, 25 Nov 2025 11:15:03 +0100
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
Subject: Re: [PATCH bpf-next v2 2/2] powerpc64/bpf: Inline
 bpf_get_smp_processor_id() and bpf_get_current_task()
To: Saket Kumar Bhaskar <skb99@linux.ibm.com>, bpf@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Cc: hbathini@linux.ibm.com, sachinpb@linux.ibm.com, venkat88@linux.ibm.com,
 andrii@kernel.org, eddyz87@gmail.com, ast@kernel.org, daniel@iogearbox.net,
 martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev,
 john.fastabend@gmail.com, kpsingh@kernel.org, sdf@fomichev.me,
 haoluo@google.com, jolsa@kernel.org, naveen@kernel.org, maddy@linux.ibm.com,
 mpe@ellerman.id.au, npiggin@gmail.com
References: <cover.1762422548.git.skb99@linux.ibm.com>
 <1ff85160e12abfe1bd1e553b394957492187d133.1762422548.git.skb99@linux.ibm.com>
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Content-Language: fr-FR
In-Reply-To: <1ff85160e12abfe1bd1e553b394957492187d133.1762422548.git.skb99@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 17/11/2025 à 07:52, Saket Kumar Bhaskar a écrit :
> Inline the calls to bpf_get_smp_processor_id()/bpf_get_current_task()
> in the powerpc bpf jit.
> 
> powerpc saves the Logical processor number (paca_index) and pointer
> to current task (__current) in paca.
> 
> Here is how the powerpc JITed assembly changes after this commit:
> 
> Before:
> 
> cpu = bpf_get_smp_processor_id();
> 
> addis 12, 2, -517
> addi 12, 12, -29456
> mtctr 12
> bctrl
> mr	8, 3
> 
> After:
> 
> cpu = bpf_get_smp_processor_id();
> 
> lhz 8, 8(13)
> 
> To evaluate the performance improvements introduced by this change,
> the benchmark described in [1] was employed.
> 
> +---------------+-------------------+-------------------+--------------+
> |      Name     |      Before       |        After      |   % change   |
> |---------------+-------------------+-------------------+--------------|
> | glob-arr-inc  | 40.701 ± 0.008M/s | 55.207 ± 0.021M/s |   + 35.64%   |
> | arr-inc       | 39.401 ± 0.007M/s | 56.275 ± 0.023M/s |   + 42.42%   |
> | hash-inc      | 24.944 ± 0.004M/s | 26.212 ± 0.003M/s |   +  5.08%   |
> +---------------+-------------------+-------------------+--------------+
> 
> [1] https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2Fanakryiko%2Flinux%2Fcommit%2F8dec900975ef&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C4a08a3af41ff4f9bc55d08de25a5f0ee%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638989591794687135%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=FtfTYpm9VgLfO1Q3iZvyrE4QRG317%2B%2BjfPd66Wd%2FQP4%3D&reserved=0
> 
> Signed-off-by: Saket Kumar Bhaskar <skb99@linux.ibm.com>
> ---
>   arch/powerpc/net/bpf_jit_comp.c   | 11 +++++++++++
>   arch/powerpc/net/bpf_jit_comp64.c | 10 ++++++++++
>   2 files changed, 21 insertions(+)
> 
> diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/bpf_jit_comp.c
> index 2f2230ae2145..c88dfa1418ec 100644
> --- a/arch/powerpc/net/bpf_jit_comp.c
> +++ b/arch/powerpc/net/bpf_jit_comp.c
> @@ -471,6 +471,17 @@ bool bpf_jit_supports_percpu_insn(void)
>   	return IS_ENABLED(CONFIG_PPC64);
>   }
>   
> +bool bpf_jit_inlines_helper_call(s32 imm)
> +{
> +	switch (imm) {
> +	case BPF_FUNC_get_smp_processor_id:
> +	case BPF_FUNC_get_current_task:

What about BPF_FUNC_get_current_task_btf ?

> +		return true;
> +	default:
> +		return false;
> +	}
> +}
> +
>   void *arch_alloc_bpf_trampoline(unsigned int size)
>   {
>   	return bpf_prog_pack_alloc(size, bpf_jit_fill_ill_insns);
> diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
> index 21486706b5ea..4e1643422370 100644
> --- a/arch/powerpc/net/bpf_jit_comp64.c
> +++ b/arch/powerpc/net/bpf_jit_comp64.c
> @@ -1399,6 +1399,16 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, u32 *fimage, struct code
>   		case BPF_JMP | BPF_CALL:
>   			ctx->seen |= SEEN_FUNC;
>   
> +			if (insn[i].src_reg == BPF_REG_0) {

Are you sure you want to use BPF_REG_0 here ? Is it the correct meaning 
? I see RISCV and ARM64 use 0 instead.

If you keep BPF_REG_0 I would have a preference for

		if (src_reg == bpf_to_ppc(BPF_REG_0))

> +				if (imm == BPF_FUNC_get_smp_processor_id) {
> +					EMIT(PPC_RAW_LHZ(insn[i].src_reg, _R13, offsetof(struct paca_struct, paca_index)));

This looks wrong, you can't use insn[i].src_reg to emit powerpc 
instructions, you must use the local src_reg which converts the register 
ID with bpf_to_ppc()

> +					break;
> +				} else if (imm == BPF_FUNC_get_current_task) {
> +					EMIT(PPC_RAW_LD(insn[i].src_reg, _R13, offsetof(struct paca_struct, __current)));

Same here.

> +					break;
> +				}
> +			}
> +
>   			ret = bpf_jit_get_func_addr(fp, &insn[i], extra_pass,
>   						    &func_addr, &func_addr_fixed);
>   			if (ret < 0)


