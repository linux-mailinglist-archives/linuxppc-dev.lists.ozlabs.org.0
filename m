Return-Path: <linuxppc-dev+bounces-16995-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eFryIZQpmWkuRQMAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16995-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Feb 2026 04:42:12 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8546D16C0BC
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Feb 2026 04:42:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fHtGS5w7wz2yrn;
	Sat, 21 Feb 2026 14:42:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771645328;
	cv=none; b=UQDSyUQb2lJpepZLMAIDEow2AUoFeAowlC0s63GyfvGXjf4diTImMxR78ZWsYgmtuLKGo1LvInFKykcozcMoHNnfvH5DKbh55mRCxMJ2T3IbwUvr3vKG9x+DH6/cFDii0Nx9ilD+dB/SUiO90yF4IS4xqZ2s2DeGnPlh7CVsrnwNdrsl26RYJVP0vBuTxwDJzfV9WVFmzQxlQDwB2z7XFEkBTqVNP9ImHKMkz/jpb6Tbh7nBCndeRArywQAVcS917esaJ1IFc2m0NkQBHOQos2qdz+b5EngMs8GhLz11nV5gP6j71vXzls267vOj36pAdMwqDIMnaYZ96ShAi6zjUw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771645328; c=relaxed/relaxed;
	bh=36raoh78EV4QRjSJ+URkApbCZ0vpe47HXa9TqT4HVYc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eSmx6UrXmJnIyqxS3gfLSqNNDs2FP5WM16RbtyYz9i+5+IgbLWSFvqJM/qboImb8x8JcpP1ivcqPNKBMIbkCiZoTEdQpmYUUGMkKevD0jOayZi5yVcRLXS9MO4k7+aKA5J5KYoM6B7HQ4iHkACAoZqpNR2p2zEte9fRQ3NuIFmZXMkrt+gW7JwlG7ye7ot4UrNFRplphsi5YC0Yl6cm3yxrTIYTXMLMw+FcUQtFDeTehyli3SsuaumfZwksmOFjI1y9eafsQrjiJV/tCAk5F4nPncdW2aUHaFBly4urBP72kwa4TFhbbeT4YhiauzfKLbgdj/3Fyj8GB3dHgGF/LBQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=aNSmyRTl; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=aNSmyRTl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fHtGS0DW2z2xlr
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Feb 2026 14:42:07 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61L2kLkK2361131;
	Sat, 21 Feb 2026 03:41:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=36raoh
	78EV4QRjSJ+URkApbCZ0vpe47HXa9TqT4HVYc=; b=aNSmyRTl88FDv2TAofWAEO
	QDg8YDbYELiE5DsokFyDHek3MifILT+HJ/s4UuQxLb/QeAWLscXsmTo7+zCdbn9p
	1D3Qpq7NTGYpuBgd/bU2V401SHC30PxmmCramp0orbCWzMCcXtwgXvcB/Pkntfj5
	VCs4OwCJsX0091T/mV9YQlb58/WdNhI81/KDq3ErpeOubKm0pKS/yU/bnsXNl/DE
	aP2hUR0phCkkZK+Sh7pNhMcu5xbj+PuHms0oEqQ6Jk0JQVflzUuBxMYGMChnBi2/
	uEK+nmdQronwre0x16QssDkULF+UQJ5wu+2FOqVL5cVS0eofoowS/NFYiRQkZLnA
	==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4cf471g39k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 21 Feb 2026 03:41:52 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 61L02bSR011916;
	Sat, 21 Feb 2026 03:41:51 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4ccb27ayfe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 21 Feb 2026 03:41:50 +0000
Received: from smtpav06.wdc07v.mail.ibm.com (smtpav06.wdc07v.mail.ibm.com [10.39.53.233])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 61L3fndj27329154
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 21 Feb 2026 03:41:49 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 524705804E;
	Sat, 21 Feb 2026 03:41:49 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C763C5803F;
	Sat, 21 Feb 2026 03:41:45 +0000 (GMT)
Received: from [9.61.251.42] (unknown [9.61.251.42])
	by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Sat, 21 Feb 2026 03:41:45 +0000 (GMT)
Message-ID: <deed0af5-726a-4055-86b0-116fdd9c42f7@linux.ibm.com>
Date: Sat, 21 Feb 2026 09:11:44 +0530
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
Subject: Re: [PATCH v2 2/5] powerpc64/bpf: fix the address returned by
 bpf_get_func_ip
Content-Language: en-GB
To: Hari Bathini <hbathini@linux.ibm.com>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Cc: bpf@vger.kernel.org, Madhavan Srinivasan <maddy@linux.ibm.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Andrii Nakryiko <andrii@kernel.org>,
        Saket Kumar Bhaskar <skb99@linux.ibm.com>,
        Abhishek Dubey <adubey@linux.ibm.com>, stable@vger.kernel.org
References: <20260220063933.196141-1-hbathini@linux.ibm.com>
 <20260220063933.196141-3-hbathini@linux.ibm.com>
From: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
In-Reply-To: <20260220063933.196141-3-hbathini@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ka-0i8aWwNuYQkmAPtmhT-8NATVT5fwK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIxMDAzNiBTYWx0ZWRfX6nFWdQ42Fpkn
 9uoLQqGkzYzyNMo09hLN8npZRQf/hnuBQxX/E4fi6e2M70mhmKBaYfT4UEvPqxfknKejZO6yShF
 N/AiS+jsMKvvyXPYwlmHNZyGl6E4kykZytDvrrkxNA3/XDK2qTG4L2eJUMVA/ZBdanlohkkDt+N
 PtN3GMXxAtUjamchEP8e8SwIGniZklGqCfVg94ZZA9DASGMf7vSQfagWZgkn00b8kuasY6QzVe3
 YybyNjUG61r4xW6cWIinIW/OV7GAN/LlnklbziSQ8eI8YIyGF8vtnlrNhINW9RUa48N3nMi+4Tf
 PFRe1Dpg7e1vjMzPFrBXWF2ktj4ALX47b/pQh6wbOZSgohRarZqc76IPwbwbNU/qg/NLXB+2LaT
 Lnx8RgeRQSnfWvC6dgyHRS13cUO2y+HiswSGswMR0ZiVqbyKx2eYIeqP7OsbapG3ecx9/V0Y0H/
 itUUQerG26RfjY3f4mw==
X-Authority-Analysis: v=2.4 cv=R7wO2NRX c=1 sm=1 tr=0 ts=69992980 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=VnNF1IyMAAAA:8
 a=VwQbUJbxAAAA:8 a=-nElCGqLb5X_NQfJOnMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: ka-0i8aWwNuYQkmAPtmhT-8NATVT5fwK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-21_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 phishscore=0 spamscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602210036
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-16995-lists,linuxppc-dev=lfdr.de];
	FORGED_SENDER(0.00)[venkat88@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hbathini@linux.ibm.com,m:linuxppc-dev@lists.ozlabs.org,m:bpf@vger.kernel.org,m:maddy@linux.ibm.com,m:ast@kernel.org,m:daniel@iogearbox.net,m:andrii@kernel.org,m:skb99@linux.ibm.com,m:adubey@linux.ibm.com,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ibm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[venkat88@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 8546D16C0BC
X-Rspamd-Action: no action


On 20/02/26 12:09 pm, Hari Bathini wrote:
> bpf_get_func_ip() helper function returns the address of the traced
> function. It relies on the IP address stored at ctx - 16 by the bpf
> trampoline. On 64-bit powerpc, this address is recovered from LR
> accounting for OOL trampoline. But the address stored here was off
> by 4-bytes. Ensure the address is the actual start of the traced
> function.
>
> Reported-by: Abhishek Dubey <adubey@linux.ibm.com>
> Fixes: d243b62b7bd3 ("powerpc64/bpf: Add support for bpf trampolines")
> Cc: stable@vger.kernel.org
> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
> ---
>
> * No changes since v1.
>
>
>   arch/powerpc/net/bpf_jit_comp.c | 21 +++++++++++++--------
>   1 file changed, 13 insertions(+), 8 deletions(-)
>
> diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/bpf_jit_comp.c
> index 987cd9fb0f37..fb6cc1f832a8 100644
> --- a/arch/powerpc/net/bpf_jit_comp.c
> +++ b/arch/powerpc/net/bpf_jit_comp.c
> @@ -786,8 +786,8 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *rw_im
>   	 *                              [ reg argN          ]
>   	 *                              [ ...               ]
>   	 *       regs_off               [ reg_arg1          ] prog ctx context
> -	 *       nregs_off              [ args count        ]
> -	 *       ip_off                 [ traced function   ]
> +	 *       nregs_off              [ args count        ] ((u64 *)prog_ctx)[-1]
> +	 *       ip_off                 [ traced function   ] ((u64 *)prog_ctx)[-2]
>   	 *                              [ ...               ]
>   	 *       run_ctx_off            [ bpf_tramp_run_ctx ]
>   	 *                              [ reg argN          ]
> @@ -895,7 +895,7 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *rw_im
>   
>   	bpf_trampoline_save_args(image, ctx, func_frame_offset, nr_regs, regs_off);
>   
> -	/* Save our return address */
> +	/* Save our LR/return address */
>   	EMIT(PPC_RAW_MFLR(_R3));
>   	if (IS_ENABLED(CONFIG_PPC_FTRACE_OUT_OF_LINE))
>   		EMIT(PPC_RAW_STL(_R3, _R1, alt_lr_off));
> @@ -903,24 +903,29 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *rw_im
>   		EMIT(PPC_RAW_STL(_R3, _R1, bpf_frame_size + PPC_LR_STKOFF));
>   
>   	/*
> -	 * Save ip address of the traced function.
> -	 * We could recover this from LR, but we will need to address for OOL trampoline,
> -	 * and optional GEP area.
> +	 * Get IP address of the traced function.
> +	 * In case of CONFIG_PPC_FTRACE_OUT_OF_LINE or BPF program, LR
> +	 * points to the instruction after the 'bl' instruction in the OOL stub.
> +	 * Refer to ftrace_init_ool_stub() and bpf_arch_text_poke() for OOL stub
> +	 * of kernel functions and bpf programs respectively.
> +	 * Recover kernel function/bpf program address from the unconditional
> +	 * branch instruction at the end of OOL stub.
>   	 */
>   	if (IS_ENABLED(CONFIG_PPC_FTRACE_OUT_OF_LINE) || flags & BPF_TRAMP_F_IP_ARG) {
>   		EMIT(PPC_RAW_LWZ(_R4, _R3, 4));
>   		EMIT(PPC_RAW_SLWI(_R4, _R4, 6));
>   		EMIT(PPC_RAW_SRAWI(_R4, _R4, 6));
>   		EMIT(PPC_RAW_ADD(_R3, _R3, _R4));
> -		EMIT(PPC_RAW_ADDI(_R3, _R3, 4));
>   	}
>   
>   	if (flags & BPF_TRAMP_F_IP_ARG)
>   		EMIT(PPC_RAW_STL(_R3, _R1, ip_off));
>   
> -	if (IS_ENABLED(CONFIG_PPC_FTRACE_OUT_OF_LINE))
> +	if (IS_ENABLED(CONFIG_PPC_FTRACE_OUT_OF_LINE)) {
>   		/* Fake our LR for unwind */
> +		EMIT(PPC_RAW_ADDI(_R3, _R3, 4));
>   		EMIT(PPC_RAW_STL(_R3, _R1, bpf_frame_size + PPC_LR_STKOFF));
> +	}
>   
>   	/* Save function arg count -- see bpf_get_func_arg_cnt() */
>   	EMIT(PPC_RAW_LI(_R3, nr_regs));


./test_progs -t get_func_ip_test
#139     get_func_ip_test:OK
Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED


Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>


Regards,

Venkat.



