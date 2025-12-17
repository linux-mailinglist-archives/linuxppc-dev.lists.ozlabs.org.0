Return-Path: <linuxppc-dev+bounces-14829-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BCDCACC6025
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Dec 2025 06:12:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dWMNq71vbz2yY9;
	Wed, 17 Dec 2025 16:12:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765948331;
	cv=none; b=WEqWDswkQOQ/yEHxTXdOckq9ptCdvKMyYFX/pVc4PGqr4hwPdHRM8pz1mBJzQRq59xLZN8mMulRNEcdjGmRrD3t+P7/D/7WjnBeqqmL3h1GG6hbch3+fXPYG+7GBC6g6HTn5ZzQf9FJMlsn5EM7iNeTNk75V9b5ECmzts1exe1K0jmnuUYv9BKbK5mYNR5FNi0RxNwgNdlViFi42f8DTVGuEc6KwWn+a9bGouKu0Chk0BPqMe9UySjHsniK8SWOL9G0NOORi8k5i19tkla1Qqpq3OitTdGKngFNWNGiuVHPyzOofBjl/2s0EQLHlpZLHClxJtJL2eg7LXTq3vnrcdA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765948331; c=relaxed/relaxed;
	bh=2oE606FfQv5MjWtb8qKWqbj2vXcNS8WU0s3KoSoSCAc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ho3fmhVt0RLGMynENd5H/5z9TKCDg6YjFYchJ0fckG9X7aw90b9pqAWEJXNPVaA9ea59FLDnNJ5yGpkIzmDg5NxPgEXuDytAm5EWApmhV+pYlu3ZdtAPfSHFc0HME/4v0bAoPLGnIh4rsEQ+8YIoVpMlKRt5zHlUcqesw5vbPT3rbdx4nXjPPEkZdzGE1F2dKK30pDIE/tSSTy2vpFYTLNzw8TQSkpxjWmdpYVwykCjvKgnCAvDYSCBmcl62efm0ZPKo7/dKVCehPiWEHG8jjaQeJIu6ICG+AiinHp4GBMHC//NqxMl0rgds3Im1bLHkLwziCMXYk7/PrTilHKVHCg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=apE6gVKP; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=apE6gVKP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dWMNp71xLz2yVM
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Dec 2025 16:12:10 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5BGHq1OS011837;
	Wed, 17 Dec 2025 05:11:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=2oE606
	FfQv5MjWtb8qKWqbj2vXcNS8WU0s3KoSoSCAc=; b=apE6gVKPU7htNUGNWxVdqG
	a3L9V9c9fdw03wl0Tl5IKK7s3BbxdQdy7jujVbpP9B8xsF6kPPW23xLfQFXU7UUL
	D4R4IxWhqTMmGRqWABNco/sk6GrDeRkKt8KA+ZxmkUch+keE2AVWMkKRm5rZDIz6
	9EokTqgOdPO5yHSTXWZkQLK9FU3ZoNLgtq4hq/956OgsamRFeCR+i3a+IU1gZ+WL
	yhe88MQ++8zs9S7sY8C1llVX8KutW5/UoCn5GfWQ5BOlwkkq3+Rewgyil65fmDob
	UAOAW3q2yuiIJaPH83ckxTbbaxOahnuM/pTYsc6+Axb/sujpK48I0pzO8hS/BEiw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4b0yt1j6yn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Dec 2025 05:11:27 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5BH4xCHI018169;
	Wed, 17 Dec 2025 05:11:27 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4b0yt1j6yj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Dec 2025 05:11:27 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5BH2Z9In003049;
	Wed, 17 Dec 2025 05:11:26 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4b1kfn8fwy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Dec 2025 05:11:26 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5BH5BMMR31260934
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 17 Dec 2025 05:11:22 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6BE3020040;
	Wed, 17 Dec 2025 05:11:22 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C789120043;
	Wed, 17 Dec 2025 05:11:18 +0000 (GMT)
Received: from [9.109.222.214] (unknown [9.109.222.214])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 17 Dec 2025 05:11:18 +0000 (GMT)
Message-ID: <ea212ba7-5118-409c-b082-efe3e360d73f@linux.ibm.com>
Date: Wed, 17 Dec 2025 10:41:17 +0530
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
Subject: Re: [PATCH bpf-next v4 1/2] powerpc64/bpf: Support internal-only MOV
 instruction to resolve per-CPU addrs
To: Saket Kumar Bhaskar <skb99@linux.ibm.com>, bpf@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Cc: sachinpb@linux.ibm.com, venkat88@linux.ibm.com, andrii@kernel.org,
        eddyz87@gmail.com, ast@kernel.org, daniel@iogearbox.net,
        martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev,
        john.fastabend@gmail.com, kpsingh@kernel.org, sdf@fomichev.me,
        haoluo@google.com, jolsa@kernel.org, christophe.leroy@csgroup.eu,
        naveen@kernel.org, maddy@linux.ibm.com, mpe@ellerman.id.au,
        npiggin@gmail.com
References: <cover.1765343385.git.skb99@linux.ibm.com>
 <667fdaa19c1564141f6cd82e75b2be86a42c0f96.1765343385.git.skb99@linux.ibm.com>
Content-Language: en-US
From: Hari Bathini <hbathini@linux.ibm.com>
In-Reply-To: <667fdaa19c1564141f6cd82e75b2be86a42c0f96.1765343385.git.skb99@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: RvI6DLK40gWHN2rvZ2DYnUphMEMeiO_-
X-Proofpoint-ORIG-GUID: m3v8Y0sL58iDAFhJph_-NsV0Iw9-M7GP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEzMDAyMyBTYWx0ZWRfX9fALa1sKEvIT
 xhUXW2p5J1Iz91DxYO673BHAwr8zTuKTa4y6hnRowoI59AkKtqc8IYWnLeJpx4phy0CoIMAUCk2
 7fnyh3R/SkaPUykjpoorjxZ3fGEYpb66498h0sITwPQrBknBohJ6h2fJveC0m3H44dLJRb2Twx7
 tbJMuhBwZrK3gtrE5JJuVqJYoocpe4oAGR45Ou6H7IJqoDOfupZS+wW73BwK3ysCfOLI9+YMCvn
 skNIWfvY+5zcwpQXCYvjcJ/l73NYnKnI9vzcRYypEb5g/Y2bxBAkbFidnfzUdWaVzyKZNahQivw
 44X6n/RqNY/VnM9To/NhniI1WLQmSIdqx8cfxZJDlNqzs217qKFp3fBKb4tJ3ZjEYqiUmotXhv6
 YW5FKcz461cDB6P4RO/V+V8tqmFmQg==
X-Authority-Analysis: v=2.4 cv=L/MQguT8 c=1 sm=1 tr=0 ts=69423b7f cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=VnNF1IyMAAAA:8 a=VwQbUJbxAAAA:8 a=Wj4u7s7dtEynkXKrbAAA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_03,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 clxscore=1011 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2512130023
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 10/12/25 12:20 pm, Saket Kumar Bhaskar wrote:
> With the introduction of commit 7bdbf7446305 ("bpf: add special
> internal-only MOV instruction to resolve per-CPU addrs"),
> a new BPF instruction BPF_MOV64_PERCPU_REG has been added to
> resolve absolute addresses of per-CPU data from their per-CPU
> offsets. This update requires enabling support for this
> instruction in the powerpc JIT compiler.
> 
> As of commit 7a0268fa1a36 ("[PATCH] powerpc/64: per cpu data
> optimisations"), the per-CPU data offset for the CPU is stored in
> the paca.
> 
> To support this BPF instruction in the powerpc JIT, the following
> powerpc instructions are emitted:
> if (IS_ENABLED(CONFIG_SMP))
> ld tmp1_reg, 48(13)		//Load per-CPU data offset from paca(r13) in tmp1_reg.
> add dst_reg, src_reg, tmp1_reg	//Add the per cpu offset to the dst.
> else if (src_reg != dst_reg)
> mr dst_reg, src_reg		//Move src_reg to dst_reg, if src_reg != dst_reg
> 
> To evaluate the performance improvements introduced by this change,
> the benchmark described in [1] was employed.
> 
> Before Change:
> glob-arr-inc   :   41.580 ± 0.034M/s
> arr-inc        :   39.592 ± 0.055M/s
> hash-inc       :   25.873 ± 0.012M/s
> 
> After Change:
> glob-arr-inc   :   42.024 ± 0.049M/s
> arr-inc        :   55.447 ± 0.031M/s
> hash-inc       :   26.565 ± 0.014M/s
> 
> [1] https://github.com/anakryiko/linux/commit/8dec900975ef
> 

Looks good to me.

Acked-by: Hari Bathini <hbathini@linux.ibm.com>


> Reviewed-by: Puranjay Mohan <puranjay@kernel.org>
> Signed-off-by: Saket Kumar Bhaskar <skb99@linux.ibm.com>
> ---
>   arch/powerpc/net/bpf_jit_comp.c   |  5 +++++
>   arch/powerpc/net/bpf_jit_comp64.c | 10 ++++++++++
>   2 files changed, 15 insertions(+)
> 
> diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/bpf_jit_comp.c
> index 5e976730b2f5..d53e9cd7563f 100644
> --- a/arch/powerpc/net/bpf_jit_comp.c
> +++ b/arch/powerpc/net/bpf_jit_comp.c
> @@ -466,6 +466,11 @@ bool bpf_jit_supports_insn(struct bpf_insn *insn, bool in_arena)
>   	return true;
>   }
>   
> +bool bpf_jit_supports_percpu_insn(void)
> +{
> +	return IS_ENABLED(CONFIG_PPC64);
> +}
> +
>   void *arch_alloc_bpf_trampoline(unsigned int size)
>   {
>   	return bpf_prog_pack_alloc(size, bpf_jit_fill_ill_insns);
> diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
> index 1fe37128c876..37723ee9344e 100644
> --- a/arch/powerpc/net/bpf_jit_comp64.c
> +++ b/arch/powerpc/net/bpf_jit_comp64.c
> @@ -918,6 +918,16 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, u32 *fimage, struct code
>   		case BPF_ALU | BPF_MOV | BPF_X: /* (u32) dst = src */
>   		case BPF_ALU64 | BPF_MOV | BPF_X: /* dst = src */
>   
> +			if (insn_is_mov_percpu_addr(&insn[i])) {
> +				if (IS_ENABLED(CONFIG_SMP)) {
> +					EMIT(PPC_RAW_LD(tmp1_reg, _R13, offsetof(struct paca_struct, data_offset)));
> +					EMIT(PPC_RAW_ADD(dst_reg, src_reg, tmp1_reg));
> +				} else if (src_reg != dst_reg) {
> +					EMIT(PPC_RAW_MR(dst_reg, src_reg));
> +				}
> +				break;
> +			}
> +
>   			if (insn_is_cast_user(&insn[i])) {
>   				EMIT(PPC_RAW_RLDICL_DOT(tmp1_reg, src_reg, 0, 32));
>   				PPC_LI64(dst_reg, (ctx->user_vm_start & 0xffffffff00000000UL));


