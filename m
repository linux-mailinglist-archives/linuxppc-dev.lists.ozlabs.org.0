Return-Path: <linuxppc-dev+bounces-16237-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iFiLG7Bvc2kwvwAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16237-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jan 2026 13:55:12 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED1E760AC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jan 2026 13:55:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dyHvx1zsCz2xdY;
	Fri, 23 Jan 2026 23:55:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769172909;
	cv=none; b=L0R93yJFBNkQqfEkj0Xp7h5r7H8XxyiNMgFszCjpqd7Vw+9/fTRErN3GPhYjmA0TieHNiUuwvIq3zO+drrlqGrjPwykQzH60RysuxCgpitRBqmiJm243bh9mcpcPKIW+scVFODN+Y17s8XE911Os0PPKGiADkQ6Xc8Ok+W1K3teTDcWYOFY28UNKyjuOddO3atdr9wTtXZzDu02VIvjA0xvYpMecna6JzO+UiPNEFRo4TlQSv4r2KZ0/pUpxiqEZJ5jCwrrhceeX8y6SxaLPScfBE2ocu/OwvyVVdRs9hqnki3wcs11aVp0QyVjjuInKsqL8O6sL5qohVBOWAOZwaw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769172909; c=relaxed/relaxed;
	bh=93JbMzI9SQ0jQYOzbHSzCoAKLeKtm3xU1fwzplRNd2s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FWcvSwlmddajz8wGX7dvikxK8+53jHLYYqXR5CfZrFsirvV5EdVERTOO+LaDL0okGNXDepiWWjSWxA3bJa6FvnKlrBUSdahgsl8e3zNeYopR3+v/nnorgYvuLJlKY5IRojwVpfymI8hF35xeGHntgjTSVEfpe3Z8fEf/MSe1NUMiwVAp8HspGoOEd6LzVzibcHgMGjmb/qF610ly/S6GH08NyyvMBZIQixxXI/nMnM5aVMZCeV2Xx8BzWZu670gaH77kMaOCxXflr6T3cuFrVUYA8PJu/Wu+qk2cf55ZVjuWP8RQZbqc6AjbZh2zwYn45UqbuninSJFiPxFCdiLq8A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oQCXVXpc; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oQCXVXpc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dyHvw2vhSz2xHt
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Jan 2026 23:55:08 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 60N2Dufj007880;
	Fri, 23 Jan 2026 12:54:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=93JbMz
	I9SQ0jQYOzbHSzCoAKLeKtm3xU1fwzplRNd2s=; b=oQCXVXpcj5YPR+rTS9Htya
	k/snKLkzMbq7g8FdILR85ryTB1aFeRPYQZlPRhkZY2zqQZKy9nKAFFQ9FJrAKtRG
	5YBilQKa/s/zOMqrED3fiOJJQxt/+vn5F60InWgNqX4kkTgvaWnQqUo4QOfC7fxw
	ZUUl6xaYjRN01f1aMqpYhntq+UUKYb+dQ40H0LEVTSLZItV5ZHxEUOZdtLFRsc9Q
	C8rX6kJKpqjG7QNhpb8ZDIoy4Tm73V6ejS2sK6z2IaH7WRNHysFiUej7Lg12v9d+
	5+9A0nMKCEYddrgA5XPj5wDosNNK6oW7OC6fQRvq32Dr1riX5EqDsuazsTWUMFLw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bqyukpcj7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Jan 2026 12:54:41 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 60NCrTNd004843;
	Fri, 23 Jan 2026 12:54:41 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bqyukpcj5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Jan 2026 12:54:41 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 60NAUaQJ009266;
	Fri, 23 Jan 2026 12:54:40 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4brp8ks1q9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Jan 2026 12:54:40 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 60NCsa3q49742234
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 23 Jan 2026 12:54:36 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1371420043;
	Fri, 23 Jan 2026 12:54:36 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7D83F20040;
	Fri, 23 Jan 2026 12:54:31 +0000 (GMT)
Received: from [9.78.106.105] (unknown [9.78.106.105])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 23 Jan 2026 12:54:31 +0000 (GMT)
Message-ID: <b805a1c1-58fc-4d76-b26c-542c1285ba4a@linux.ibm.com>
Date: Fri, 23 Jan 2026 18:24:30 +0530
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
Subject: Re: [PATCH v4 5/6] powerpc64/bpf: Support exceptions
To: adubey@linux.ibm.com, bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: sachinpb@linux.ibm.com, venkat88@linux.ibm.com, andrii@kernel.org,
        eddyz87@gmail.com, mykolal@fb.com, ast@kernel.org,
        daniel@iogearbox.net, martin.lau@linux.dev, song@kernel.org,
        yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org,
        sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org,
        christophe.leroy@csgroup.eu, naveen@kernel.org, maddy@linux.ibm.com,
        mpe@ellerman.id.au, npiggin@gmail.com, memxor@gmail.com,
        iii@linux.ibm.com, shuah@kernel.org
References: <20260122211854.5508-1-adubey@linux.ibm.com>
 <20260122211854.5508-6-adubey@linux.ibm.com>
Content-Language: en-US
From: Hari Bathini <hbathini@linux.ibm.com>
In-Reply-To: <20260122211854.5508-6-adubey@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDEwNSBTYWx0ZWRfXwywDYpNF4qyR
 A3Sf0MsWuYzEhlbOKxUsD8w1koJcnTd6uG8cmi4ZDObHtwTBRcf7Xp/ZXT4kzs6bWA9ZBt26gb3
 cA8xiihT7rrx5uQDloEZnqlSuHbh9IHEuumLZPdwR3M+k9gqv1aWX877py6qldToWFqCqB9cC/G
 iFApcXzp8fYAJyokml79ZSqNQAm3SLu0P1x3znCYNLYmH2KJLXXmGjcBTS88yOigVdkGV1b3fTv
 B4r64Il+FKBFrFp4V3T3THs35lD3OZahrwC9LNoODLTnyX0NE6nPBY6qoDXZXqBw6T/eDDCqtwR
 HhfnriP5Lqh+1rePoNLHMV6T5Vz5Sk6XKYXJTvZLZLxbTm9EZw4bod2ZF4YHVzA0mcpYPK0koes
 4g9B+WOxMcfjZi79Yr/qysjnhtHNck+xjapgjHVPIAPCqwAjWE6k5TH82LOt+cX2PCywgZyrilw
 DPTZn0QlSpzLVezSilA==
X-Authority-Analysis: v=2.4 cv=bsBBxUai c=1 sm=1 tr=0 ts=69736f91 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=DU0EyFXtAAAA:8 a=VnNF1IyMAAAA:8 a=T6DxGVK8PeSMhVRyarwA:9 a=QEXdDO2ut3YA:10
 a=UCR5be5CC-YrbG9FbbB0:22
X-Proofpoint-ORIG-GUID: VhHDZsy_bd1jOK4d1aaUs6_X7-rKr2_l
X-Proofpoint-GUID: qiRcBadzgjH52kl4ZXxKbtvDqMmnngaK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-23_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2601150000 definitions=main-2601230105
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[linux.ibm.com,kernel.org,gmail.com,fb.com,iogearbox.net,linux.dev,fomichev.me,google.com,csgroup.eu,ellerman.id.au];
	FORGED_RECIPIENTS(0.00)[m:adubey@linux.ibm.com,m:bpf@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-kselftest@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:sachinpb@linux.ibm.com,m:venkat88@linux.ibm.com,m:andrii@kernel.org,m:eddyz87@gmail.com,m:mykolal@fb.com,m:ast@kernel.org,m:daniel@iogearbox.net,m:martin.lau@linux.dev,m:song@kernel.org,m:yonghong.song@linux.dev,m:john.fastabend@gmail.com,m:kpsingh@kernel.org,m:sdf@fomichev.me,m:haoluo@google.com,m:jolsa@kernel.org,m:christophe.leroy@csgroup.eu,m:naveen@kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:memxor@gmail.com,m:iii@linux.ibm.com,m:shuah@kernel.org,m:johnfastabend@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[hbathini@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16237-lists,linuxppc-dev=lfdr.de];
	DKIM_TRACE(0.00)[ibm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hbathini@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.530];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28]
X-Rspamd-Queue-Id: 7ED1E760AC
X-Rspamd-Action: no action



On 23/01/26 2:48 am, adubey@linux.ibm.com wrote:
> From: Abhishek Dubey <adubey@linux.ibm.com>
> 
> The modified prologue/epilogue generation code now
> enables exception-callback to use the stack frame of
> the program marked as exception boundary, where callee
> saved registers are stored.
> 
> As per ppc64 ABIv2 documentation[1], r14-r31 are callee
> saved registers. BPF programs on ppc64 already saves
> r26-r31 registers. Saving the remaining set of callee
> saved registers(r14-r25) is handled in the next patch.
> 
> [1] https://ftp.rtems.org/pub/rtems/people/sebh/ABI64BitOpenPOWERv1.1_16July2015_pub.pdf
> 
> Signed-off-by: Abhishek Dubey <adubey@linux.ibm.com>
> ---
>   arch/powerpc/net/bpf_jit.h        |  2 ++
>   arch/powerpc/net/bpf_jit_comp.c   |  7 ++++
>   arch/powerpc/net/bpf_jit_comp64.c | 58 +++++++++++++++++++++----------
>   3 files changed, 48 insertions(+), 19 deletions(-)
> 
> diff --git a/arch/powerpc/net/bpf_jit.h b/arch/powerpc/net/bpf_jit.h
> index 56f56fdd4969..82bbf63f0e57 100644
> --- a/arch/powerpc/net/bpf_jit.h
> +++ b/arch/powerpc/net/bpf_jit.h
> @@ -179,6 +179,8 @@ struct codegen_context {
>   	u64 arena_vm_start;
>   	u64 user_vm_start;
>   	bool is_subprog;
> +	bool exception_boundary;
> +	bool exception_cb;
>   };
>   
>   #define bpf_to_ppc(r)	(ctx->b2p[r])
> diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/bpf_jit_comp.c
> index 1a305f0fed27..2607ea0bedef 100644
> --- a/arch/powerpc/net/bpf_jit_comp.c
> +++ b/arch/powerpc/net/bpf_jit_comp.c
> @@ -207,6 +207,8 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *fp)
>   	cgctx.arena_vm_start = bpf_arena_get_kern_vm_start(fp->aux->arena);
>   	cgctx.user_vm_start = bpf_arena_get_user_vm_start(fp->aux->arena);
>   	cgctx.is_subprog = bpf_is_subprog(fp);
> +	cgctx.exception_boundary = fp->aux->exception_boundary;
> +	cgctx.exception_cb = fp->aux->exception_cb;
>   
>   	/* Scouting faux-generate pass 0 */
>   	if (bpf_jit_build_body(fp, NULL, NULL, &cgctx, addrs, 0, false)) {
> @@ -436,6 +438,11 @@ void bpf_jit_free(struct bpf_prog *fp)
>   	bpf_prog_unlock_free(fp);
>   }
>   
> +bool bpf_jit_supports_exceptions(void)
> +{
> +	return IS_ENABLED(CONFIG_PPC64);
> +}
> +
>   bool bpf_jit_supports_subprog_tailcalls(void)
>   {
>   	return IS_ENABLED(CONFIG_PPC64);
> diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
> index c25ba1ad587a..d7cd8ab6559c 100644
> --- a/arch/powerpc/net/bpf_jit_comp64.c
> +++ b/arch/powerpc/net/bpf_jit_comp64.c
> @@ -89,7 +89,9 @@ static inline bool bpf_has_stack_frame(struct codegen_context *ctx)
>   	 * - the bpf program uses its stack area
>   	 * The latter condition is deduced from the usage of BPF_REG_FP
>   	 */
> -	return ctx->seen & SEEN_FUNC || bpf_is_seen_register(ctx, bpf_to_ppc(BPF_REG_FP));
> +	return ctx->seen & SEEN_FUNC ||
> +	       bpf_is_seen_register(ctx, bpf_to_ppc(BPF_REG_FP)) ||
> +	       ctx->exception_cb;
>   }
>   
>   /*


> @@ -161,8 +163,13 @@ void bpf_jit_build_prologue(u32 *image, struct codegen_context *ctx)



>   		EMIT(PPC_RAW_LI(bpf_to_ppc(TMP_REG_1), 0));
>   		/* this goes in the redzone */
>   		EMIT(PPC_RAW_STD(bpf_to_ppc(TMP_REG_1), _R1, -(BPF_PPC_TAILCALL)));
> -	} else {
> +	} else if (!ctx->exception_cb) {
>   		/*
> +		 * Tailcall jitting for non exception_cb progs only.
> +		 * exception_cb won't require tail_call_info to be setup.
> +		 *
> +		 * tail_call_info interpretation logic:
> +		 *
>   		 * if tail_call_info < MAX_TAIL_CALL_CNT
>   		 *      main prog calling first subprog -> copy reference
>   		 * else
> @@ -177,8 +184,12 @@ void bpf_jit_build_prologue(u32 *image, struct codegen_context *ctx)
>   		EMIT(PPC_RAW_STD(bpf_to_ppc(TMP_REG_1), _R1, -(BPF_PPC_TAILCALL)));
>   	}
>   
> -	if (bpf_has_stack_frame(ctx)) {
> +	if (bpf_has_stack_frame(ctx) && !ctx->exception_cb) {
>   		/*
> +		 * exception_cb uses boundary frame after stack walk.
> +		 * It can simply use redzone, this optimization reduces
> +		 * stack walk loop by one level.
> +		 *
>   		 * We need a stack frame, but we don't necessarily need to
>   		 * save/restore LR unless we call other functions
>   		 */
> @@ -190,23 +201,32 @@ void bpf_jit_build_prologue(u32 *image, struct codegen_context *ctx)
>   		EMIT(PPC_RAW_STDU(_R1, _R1, -(BPF_PPC_STACKFRAME + ctx->stack_size)));
>   	}
>   
> -	/*
> -	 * Back up non-volatile regs -- BPF registers 6-10
> -	 * If we haven't created our own stack frame, we save these
> -	 * in the protected zone below the previous stack frame
> -	 */
> -	for (i = BPF_REG_6; i <= BPF_REG_10; i++)
> -		if (bpf_is_seen_register(ctx, bpf_to_ppc(i)))
> -			EMIT(PPC_RAW_STD(bpf_to_ppc(i), _R1, bpf_jit_stack_offsetof(ctx, bpf_to_ppc(i))));
> +	if (!ctx->exception_cb) {
> +		/*
> +		 * Back up non-volatile regs -- BPF registers 6-10
> +		 * If we haven't created our own stack frame, we save these
> +		 * in the protected zone below the previous stack frame
> +		 */
> +		for (i = BPF_REG_6; i <= BPF_REG_10; i++)
> +			if (ctx->exception_boundary || bpf_is_seen_register(ctx, bpf_to_ppc(i)))
> +				EMIT(PPC_RAW_STD(bpf_to_ppc(i), _R1,
> +					bpf_jit_stack_offsetof(ctx, bpf_to_ppc(i))));
>   
> -	if (ctx->arena_vm_start)
> -		EMIT(PPC_RAW_STD(bpf_to_ppc(ARENA_VM_START), _R1,
> +		if (ctx->exception_boundary || ctx->arena_vm_start)
> +			EMIT(PPC_RAW_STD(bpf_to_ppc(ARENA_VM_START), _R1,
>   				 bpf_jit_stack_offsetof(ctx, bpf_to_ppc(ARENA_VM_START))));
>   
> -	/* Setup frame pointer to point to the bpf stack area */
> -	if (bpf_is_seen_register(ctx, bpf_to_ppc(BPF_REG_FP)))
> -		EMIT(PPC_RAW_ADDI(bpf_to_ppc(BPF_REG_FP), _R1,
> +		/* Setup frame pointer to point to the bpf stack area */
> +		if (bpf_is_seen_register(ctx, bpf_to_ppc(BPF_REG_FP)))
> +			EMIT(PPC_RAW_ADDI(bpf_to_ppc(BPF_REG_FP), _R1,
>   				STACK_FRAME_MIN_SIZE + ctx->stack_size));
> +	} else {
> +		/*
> +		 * Exception callback receives Frame Pointer of main
> +		 * program as third arg
> +		 */
> +		EMIT(PPC_RAW_MR(_R1, _R5));
> +	}
>   
>   	if (ctx->arena_vm_start)
>   		PPC_LI64(bpf_to_ppc(ARENA_VM_START), ctx->arena_vm_start);

For all practical purposes, the only thing that matters for the prologue
of execption_cb subprog seems to be, to set r1 and move on. The below
snippet before tailcall setup in the prologue should live the rest of
the prologue code unchanged?

if (ctx->exception_cb) {
	/*
	 * Exception callback receives Frame Pointer of main 

	 * program as third arg 

	 */
	EMIT(PPC_RAW_MR(_R1, _R5));
	return;
}

- Hari

