Return-Path: <linuxppc-dev+bounces-17006-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Jo47IAD1mmk+oQMAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17006-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 Feb 2026 13:22:24 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E1C16F053
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 Feb 2026 13:22:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fJjmB10B0z30T8;
	Sun, 22 Feb 2026 23:22:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771762938;
	cv=none; b=gUqTDNUIvvJtdHWR+92Fjws5ssPuMRzqE2x6vYBvYC/cM/x9whyT7zo6I4JHinIrBBwznMiJUVYEvdxtBZcf4CKYLVFUuSLY0do9QlY0z3NFi7PR4217F0B2m35KE5drSAsFwmwNgDTzFLsWJKncM1gSQ+RuPbcOkTdgC6wvKjc0WwAABjkoOxfcfSBeAY+1Oc/JSAmNJQZlrr+6RibyK0CrX5X7v09J/2lHY3OXHxby7qAeiOENuSfiP76XM2Q9TQI9pa/l7s1wsWmq/jrn81Gt0rZUh/wg9k4d/zrxiNi4phJDvm7dkjyjzee1sVvFNM/Adk5fS5IBQbXyb4LIRw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771762938; c=relaxed/relaxed;
	bh=rXjejDWrq7IPZo9PdMF10tAzhPn8ttHft2CPrcS7Lgo=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=kDEV9fbvl/VbOD8xwGSi5hvV0c2/gFww3w5hqaOtfsQcGsRFdLpJx6D2xnVvsFkPskEh+Bb+OJ5tflla2E7LAsS5lUqvOCHInQcfZ0PApkJ6FRAu2yeUgzkTwnBK+vBDJIc2tjqaXMPm0VJWBrS0ev+Nj6dFGzMSKJ54x67djIxOLniJ7QKgV7D9VGwoyJTY107ApYJzi+2je3W7DDmAbANgEbRwIiSByAed3XkoG7GmK8ffXPd14m1bFnj+NGKht3Iwp3o/QZfQusjmSrxxoCbIx12u7Tmx+CxKu10iiRtOcBtrkvPzeF9wYUggZe04B2nDSwUAIBCJ7gLWc53/3Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BVgrSz3g; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=adubey@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BVgrSz3g;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=adubey@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fJjm84kB2z2xm5
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Feb 2026 23:22:16 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61M9Llr11191599;
	Sun, 22 Feb 2026 12:22:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=rXjejD
	Wrq7IPZo9PdMF10tAzhPn8ttHft2CPrcS7Lgo=; b=BVgrSz3gFG7fWw/NOEvhkW
	2qrOjJDJu6x1ZdqVfg3Icw1/pO0ftwMml0y+E4dzdjK5qZ1QJH9epvUneO8mr6+p
	gxTqK9BcGGMYiRKktjhKSjj49Mn55HrhXwdM11EeI9pYLkeYc8sJ5qSqPdhlQpRe
	VbN1obakuc/XzY/FNmoS7Rjc5EANgO77HKXLOyX3RTM8XDMAiYpUesrUOArhrlR+
	nKynA7+tz1o6bZENI0bfYVscmgUNryzaOV59+lHlx+JU5uaU9J/NZYCyvRmbSHtq
	bKhdlkMN9MC7MwwUastpjnqADMyPfpcVTMDsCLoUb8O/spoO4qoAAtFhsxIeRG5w
	==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4cf4e33wcd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 22 Feb 2026 12:21:59 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 61M8jZps001607;
	Sun, 22 Feb 2026 12:21:58 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4cfr1msa8j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 22 Feb 2026 12:21:58 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com [10.241.53.103])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 61MCLvw718350756
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 22 Feb 2026 12:21:57 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 514A55805E;
	Sun, 22 Feb 2026 12:21:57 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C854358052;
	Sun, 22 Feb 2026 12:21:56 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.5.196.140])
	by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Sun, 22 Feb 2026 12:21:56 +0000 (GMT)
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
Date: Sun, 22 Feb 2026 17:51:56 +0530
From: adubey <adubey@linux.ibm.com>
To: Hari Bathini <hbathini@linux.ibm.com>
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, bpf@vger.kernel.org,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Alexei Starovoitov
 <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Andrii Nakryiko
 <andrii@kernel.org>,
        Saket Kumar Bhaskar <skb99@linux.ibm.com>,
        Venkat Rao
 Bagalkote <venkat88@linux.ibm.com>, stable@vger.kernel.org
Subject: Re: [PATCH v2 2/5] powerpc64/bpf: fix the address returned by
 bpf_get_func_ip
In-Reply-To: <20260220063933.196141-3-hbathini@linux.ibm.com>
References: <20260220063933.196141-1-hbathini@linux.ibm.com>
 <20260220063933.196141-3-hbathini@linux.ibm.com>
Message-ID: <1c1e950c3513176c99a2a9b027c3be21@linux.ibm.com>
X-Sender: adubey@linux.ibm.com
Organization: IBM
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=XMs9iAhE c=1 sm=1 tr=0 ts=699af4e7 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=VnNF1IyMAAAA:8
 a=VwQbUJbxAAAA:8 a=vzIvt4CvfZBVuRaKyhAA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: xpfEw_kcP__nZcGDNwprFmhQRz6TNl3O
X-Proofpoint-ORIG-GUID: xpfEw_kcP__nZcGDNwprFmhQRz6TNl3O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIyMDExNyBTYWx0ZWRfX7xDt10zT7jME
 gBR6D66W/Bn9MW+NIdcn8FnCQ0iLrozYpEVGRU8UuSqV8T8GrLf0+GkVQxAGv+abkRqdIVfWd63
 5yOt/jHeuTqdd1duS1TxkL9Q3SLwo2gm5HgXbkPi//3M5iCmdeiR0ncFNdbOo5KBBnNii8X9LNz
 FuJlyJOopAXwKuDT2iTxNlEDx21ydte6huaQBQt5N7uRLXMG4qn+Utk6rZdvmtT6hO6Coo6IiV7
 UVhc8qicVpMrbh6rnXRDPUsKYiqCW+tLxZ3BobeaPAlgXYQTRQvKcpDc34sAanbXzreTSLcK9xD
 DjocyTUO488w1oQpR+Tp9m4emkp0y9R+Trxh0ETsRdV5mWWxXZtVAPwjvzLhyarY3HsvTbXujNA
 j07uVUHnzpXuq5Y4hKr4VD77WCRi3TWXGXd53Nc6RkhwKtExHNSqLUqJeMTOo6XZ0pd5ADrWGPB
 9niGbiX7Q5R3RaHua9A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-22_02,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 clxscore=1011 adultscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602220117
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17006-lists,linuxppc-dev=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.ibm.com:mid];
	FORGED_SENDER(0.00)[adubey@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[ibm.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hbathini@linux.ibm.com,m:linuxppc-dev@lists.ozlabs.org,m:bpf@vger.kernel.org,m:maddy@linux.ibm.com,m:ast@kernel.org,m:daniel@iogearbox.net,m:andrii@kernel.org,m:skb99@linux.ibm.com,m:venkat88@linux.ibm.com,m:stable@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[adubey@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 90E1C16F053
X-Rspamd-Action: no action

On 2026-02-20 12:09, Hari Bathini wrote:
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
>  arch/powerpc/net/bpf_jit_comp.c | 21 +++++++++++++--------
>  1 file changed, 13 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/powerpc/net/bpf_jit_comp.c 
> b/arch/powerpc/net/bpf_jit_comp.c
> index 987cd9fb0f37..fb6cc1f832a8 100644
> --- a/arch/powerpc/net/bpf_jit_comp.c
> +++ b/arch/powerpc/net/bpf_jit_comp.c
> @@ -786,8 +786,8 @@ static int __arch_prepare_bpf_trampoline(struct
> bpf_tramp_image *im, void *rw_im
>  	 *                              [ reg argN          ]
>  	 *                              [ ...               ]
>  	 *       regs_off               [ reg_arg1          ] prog ctx 
> context
prog ctx context/prog_ctx context/prog_ctx, to be in sync with tags 
below.
please refer s390's field tagging
> -	 *       nregs_off              [ args count        ]
> -	 *       ip_off                 [ traced function   ]
> +	 *       nregs_off              [ args count        ] ((u64 
> *)prog_ctx)[-1]
> +	 *       ip_off                 [ traced function   ] ((u64 
> *)prog_ctx)[-2]
>  	 *                              [ ...               ]
>  	 *       run_ctx_off            [ bpf_tramp_run_ctx ]
>  	 *                              [ reg argN          ]
> @@ -895,7 +895,7 @@ static int __arch_prepare_bpf_trampoline(struct
> bpf_tramp_image *im, void *rw_im
> 
>  	bpf_trampoline_save_args(image, ctx, func_frame_offset, nr_regs, 
> regs_off);
> 
> -	/* Save our return address */
> +	/* Save our LR/return address */
>  	EMIT(PPC_RAW_MFLR(_R3));
>  	if (IS_ENABLED(CONFIG_PPC_FTRACE_OUT_OF_LINE))
>  		EMIT(PPC_RAW_STL(_R3, _R1, alt_lr_off));
> @@ -903,24 +903,29 @@ static int __arch_prepare_bpf_trampoline(struct
> bpf_tramp_image *im, void *rw_im
>  		EMIT(PPC_RAW_STL(_R3, _R1, bpf_frame_size + PPC_LR_STKOFF));
> 
>  	/*
> -	 * Save ip address of the traced function.
> -	 * We could recover this from LR, but we will need to address for
> OOL trampoline,
> -	 * and optional GEP area.
> +	 * Get IP address of the traced function.
Get/Derive
> +	 * In case of CONFIG_PPC_FTRACE_OUT_OF_LINE or BPF program, LR
> +	 * points to the instruction after the 'bl' instruction in the OOL 
> stub.
> +	 * Refer to ftrace_init_ool_stub() and bpf_arch_text_poke() for OOL 
> stub
> +	 * of kernel functions and bpf programs respectively.
> +	 * Recover kernel function/bpf program address from the unconditional
> +	 * branch instruction at the end of OOL stub.
>  	 */
>  	if (IS_ENABLED(CONFIG_PPC_FTRACE_OUT_OF_LINE) || flags & 
> BPF_TRAMP_F_IP_ARG) {
>  		EMIT(PPC_RAW_LWZ(_R4, _R3, 4));
Please add comment what R4 points to; for easy referencing
>  		EMIT(PPC_RAW_SLWI(_R4, _R4, 6));
>  		EMIT(PPC_RAW_SRAWI(_R4, _R4, 6));
>  		EMIT(PPC_RAW_ADD(_R3, _R3, _R4));
> -		EMIT(PPC_RAW_ADDI(_R3, _R3, 4));
>  	}
> 
>  	if (flags & BPF_TRAMP_F_IP_ARG)
>  		EMIT(PPC_RAW_STL(_R3, _R1, ip_off));
> 
> -	if (IS_ENABLED(CONFIG_PPC_FTRACE_OUT_OF_LINE))
> +	if (IS_ENABLED(CONFIG_PPC_FTRACE_OUT_OF_LINE)) {
>  		/* Fake our LR for unwind */
> +		EMIT(PPC_RAW_ADDI(_R3, _R3, 4));
>  		EMIT(PPC_RAW_STL(_R3, _R1, bpf_frame_size + PPC_LR_STKOFF));
> +	}
> 
>  	/* Save function arg count -- see bpf_get_func_arg_cnt() */
>  	EMIT(PPC_RAW_LI(_R3, nr_regs));
-Abhishek

