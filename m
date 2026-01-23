Return-Path: <linuxppc-dev+bounces-16234-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yAUUMq9tc2mnvgAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16234-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jan 2026 13:46:39 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B00A75F6C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jan 2026 13:46:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dyHk32djVz2xdY;
	Fri, 23 Jan 2026 23:46:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769172395;
	cv=none; b=WwW+Vf1XluQs70v0pKllHAkTBYtb1BX4qpZF+RdYyhhtpyUQ31FLzyJ519+ZNLLva8XWSOcizBRF+l366ErlFE7akysMWGPhHKn7z7Ebn0gNZpKqlvCk2wwM2k+4mKXkLF02KQrYPbmCCX58b9dvazmHaHsViyGHZx4LxThp13wZymkQgFgzV5AhfyKYvmZQ0PDURxnVRHAgs9jL/VCupyGycMN69BVae5Qx9ddbv3MvdGEzYSIAPOX+7lzOJszrnIy1V8PzQ36IlN9PFNo5dG1yizXFsnQQW4Hza1uzmrt0uy5mHH8DhaGXpk/pz00s/gb9boTBiOU/ITib70hr4w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769172395; c=relaxed/relaxed;
	bh=Q6LZsjRf2mHlo3Zv/3wsml5VUp4tXZZjqVcWkZZduQ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B0PJFE1e3yRmWvxo5AqxvvZPOuYuC4lGLymhr/848pR2fGj0i5RC0Ndl9v9xvEDtB394nG5zFCQSXIrvx1cEZlTB4R70bVFoHZ7z61huwvt6zJBVcIULVX9UihFqAhUXXfr+6jwGKnYbyHxHbrnaibrD/l7FD/cfnh9Ig6kucpETw2L2yVLvNd3ZwT4e9WcLzJzEFRwzIdO4fI0E4mOhJ1xdRCbkgP00I8+pwAuMw6QqZXIzNEvNCKXwYbM1wKOXL3csgwfZiGPdHfXd7KWwvkbPKDbtei8YoxpbmoAM19pj08GRX4w9cw0zx/Jp/fCZRbZM9RCbjVd8YGaXHBJrVg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UVVSEQRA; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UVVSEQRA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dyHk150wDz2xHt
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Jan 2026 23:46:32 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 60N6AERS006759;
	Fri, 23 Jan 2026 12:46:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=Q6LZsj
	Rf2mHlo3Zv/3wsml5VUp4tXZZjqVcWkZZduQ4=; b=UVVSEQRAqY3PyKwsOBvL/6
	p0SCLtKOomFEctFH87fkZELnVgpqrM4+RYooXk/NhHl+m2OmT/rUI0v9sel2HbXr
	989i6Yznu4a0XZvQSWTwDKtJs8W3W7dn6kB3m8fwfdEwGWAKhF0KxehyHAdHLUGz
	Hj51bbe2phynZ3PjY7Tr0u9dwT0krOZAbQBRH+f89J0z3QFebmUWR6C+cPY2j9qG
	ntYPqTWJducdPGM0DEkOgSRhTnv9Nqad6h/Qwg43jeb/L1yR25dEB/BARxAL31UM
	PcUeCxu1ypbhQHt7NFrXUlmbJKbEvptQW+h+scMhgSZe78A9ejDKSFzIsLjQWeeg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bus1pv70d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Jan 2026 12:46:02 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 60NCfNwj005887;
	Fri, 23 Jan 2026 12:46:01 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bus1pv709-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Jan 2026 12:46:01 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 60NBtHMJ001171;
	Fri, 23 Jan 2026 12:46:00 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4brpyk8uyp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Jan 2026 12:46:00 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 60NCjugw49545604
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 23 Jan 2026 12:45:57 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D398F20043;
	Fri, 23 Jan 2026 12:45:56 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D8D1720040;
	Fri, 23 Jan 2026 12:45:51 +0000 (GMT)
Received: from [9.78.106.105] (unknown [9.78.106.105])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 23 Jan 2026 12:45:51 +0000 (GMT)
Message-ID: <67d49ba7-876c-4cb6-a34d-772e4fd331a0@linux.ibm.com>
Date: Fri, 23 Jan 2026 18:15:50 +0530
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
Subject: Re: [PATCH v4 1/6] powerpc64/bpf: Moving tail_call_cnt to bottom of
 frame
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
 <20260122211854.5508-2-adubey@linux.ibm.com>
Content-Language: en-US
From: Hari Bathini <hbathini@linux.ibm.com>
In-Reply-To: <20260122211854.5508-2-adubey@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: NjonBlZ9my3uzPNE9oiFmQ7uJIhoXfBs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDEwMSBTYWx0ZWRfX/u7GxI1j2IWK
 AL+2oq3Dz0NTBbfg3YaAKVAv4Z5zElAeL2OfiDt/GOQsEaQWXTXgU/cHJXd1Z9kZZEDUeseZlEV
 xL6BtHiGeuDMSME4OC8TUMNY6DX82YfK92GLVZ4LY5SZugXtQ9LIH9MMNfss5qQjdAG+udhlrur
 agyBR97MZfpQirE1P6GaDlC3ahROH6whvziehRGmmWv22UtS+EJB8FYjKjMndsMGem2uTER3Iii
 a17DO+mAQeTAxxlwbJIft6TzP6YBDkrmh3P2a/jL5dCl8fijtkNCARw9MnmvHDnnABDn3nYgdzr
 5keK3NYaeDO9JiAq1RWNea08Bc7GrBpbJW6tMC1gx8prD2GlDENRr/hk6X78ymwx4pZBSUXey8O
 134PLtr4t8XArJGiNnkdLtaxVcVwOcgtt+keLaLAGLI2+NwcIueDrvtd7xP72p3/tQJH4O3yqXJ
 1R7uNMe+jsVutBokmoQ==
X-Proofpoint-GUID: gsd5nJXCcHpjB5AEwzWU3GFKcBcHMJCO
X-Authority-Analysis: v=2.4 cv=GY8aXAXL c=1 sm=1 tr=0 ts=69736d8a cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VnNF1IyMAAAA:8 a=8L1OQ1Sa3sCk1MEWLCMA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-23_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2601150000 definitions=main-2601230101
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-16234-lists,linuxppc-dev=lfdr.de];
	FREEMAIL_CC(0.00)[linux.ibm.com,kernel.org,gmail.com,fb.com,iogearbox.net,linux.dev,fomichev.me,google.com,csgroup.eu,ellerman.id.au];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[hbathini@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:adubey@linux.ibm.com,m:bpf@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-kselftest@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:sachinpb@linux.ibm.com,m:venkat88@linux.ibm.com,m:andrii@kernel.org,m:eddyz87@gmail.com,m:mykolal@fb.com,m:ast@kernel.org,m:daniel@iogearbox.net,m:martin.lau@linux.dev,m:song@kernel.org,m:yonghong.song@linux.dev,m:john.fastabend@gmail.com,m:kpsingh@kernel.org,m:sdf@fomichev.me,m:haoluo@google.com,m:jolsa@kernel.org,m:christophe.leroy@csgroup.eu,m:naveen@kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:memxor@gmail.com,m:iii@linux.ibm.com,m:shuah@kernel.org,m:johnfastabend@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ibm.com:+];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCPT_COUNT_TWELVE(0.00)[28];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hbathini@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.550];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,linux.ibm.com:mid]
X-Rspamd-Queue-Id: 1B00A75F6C
X-Rspamd-Action: no action



On 23/01/26 2:48 am, adubey@linux.ibm.com wrote:
> From: Abhishek Dubey <adubey@linux.ibm.com>
> 
> In the conventional stack frame, the position of tail_call_cnt
> is after the NVR save area (BPF_PPC_STACK_SAVE). Whereas, the
> offset of tail_call_cnt in the trampoline frame is after the
> stack alignment padding. BPF JIT logic could become complex
> when dealing with frame-sensitive offset calculation of
> tail_call_cnt. Having the same offset in both frames is the
> desired objective.
> 
> The trampoline frame does not have a BPF_PPC_STACK_SAVE area.
> Introducing it leads to under-utilization of extra memory meant
> only for the offset alignment of tail_call_cnt.
> Another challenge is the variable alignment padding sitting at
> the bottom of the trampoline frame, which requires additional
> handling to compute tail_call_cnt offset.
> 
> This patch addresses the above issues by moving tail_call_cnt
> to the bottom of the stack frame at offset 0 for both types
> of frames. This saves additional bytes required by BPF_PPC_STACK_SAVE
> in trampoline frame, and a common offset computation for
> tail_call_cnt serves both frames.
> 
> The changes in this patch are required by the second patch in the
> series, where the 'reference to tail_call_info' of the main frame
> is copied into the trampoline frame from the previous frame.

The changelog needs to be simplified. Something like below:

To support tailcalls in subprogs, tail_call_cnt needs to be on the BPF
trampoline stack frame. In a regular BPF program or subprog stack
frame, the position of tail_call_cnt is after the NVR save area
(BPF_PPC_STACK_SAVE). To avoid complex logic in deducing offset for
tail_call_cnt, it has to be kept at the same offset on the trampoline
frame as well. But doing that wastes nearly all of BPF_PPC_STACK_SAVE
bytes on the BPF trampoline stack frame as the NVR save area is not
the same for BPF trampoline and regular BPF programs. Address this by
moving tail_call_cnt to the bottom of the frame.

This change avoids the need to account for BPF_PPC_STACK_SAVE bytes
in the BPF trampoline stack frame when support for tailcalls in BPF
subprogs is added later. Also, this change makes offset calculation
of tail_call_cnt field simpler all across.

> 
> Signed-off-by: Abhishek Dubey <adubey@linux.ibm.com>
> ---
>   arch/powerpc/net/bpf_jit.h        |  1 +
>   arch/powerpc/net/bpf_jit_comp.c   | 15 ++++++++++++---
>   arch/powerpc/net/bpf_jit_comp64.c | 31 ++++++++++++++++++++-----------
>   3 files changed, 33 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/powerpc/net/bpf_jit.h b/arch/powerpc/net/bpf_jit.h
> index 8334cd667bba..9f6ec00bd02e 100644
> --- a/arch/powerpc/net/bpf_jit.h
> +++ b/arch/powerpc/net/bpf_jit.h
> @@ -24,6 +24,7 @@
>   
>   #define SZL			sizeof(unsigned long)
>   #define BPF_INSN_SAFETY		64
> +#define BPF_PPC_TAILCALL	8
>   
>   #define PLANT_INSTR(d, idx, instr)					      \
>   	do { if (d) { (d)[idx] = instr; } idx++; } while (0)
> diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/bpf_jit_comp.c
> index 5e976730b2f5..d51c696221d7 100644
> --- a/arch/powerpc/net/bpf_jit_comp.c
> +++ b/arch/powerpc/net/bpf_jit_comp.c
> @@ -604,8 +604,8 @@ static void bpf_trampoline_setup_tail_call_cnt(u32 *image, struct codegen_contex
>   					       int func_frame_offset, int r4_off)
>   {
>   	if (IS_ENABLED(CONFIG_PPC64)) {
> -		/* See bpf_jit_stack_tailcallcnt() */
> -		int tailcallcnt_offset = 7 * 8;
> +		/* See Generated stack layout */
> +		int tailcallcnt_offset = BPF_PPC_TAILCALL;
>   
>   		EMIT(PPC_RAW_LL(_R3, _R1, func_frame_offset - tailcallcnt_offset));
>   		EMIT(PPC_RAW_STL(_R3, _R1, -tailcallcnt_offset));
> @@ -620,7 +620,7 @@ static void bpf_trampoline_restore_tail_call_cnt(u32 *image, struct codegen_cont
>   {
>   	if (IS_ENABLED(CONFIG_PPC64)) {
>   		/* See bpf_jit_stack_tailcallcnt() */
> -		int tailcallcnt_offset = 7 * 8;
> +		int tailcallcnt_offset = BPF_PPC_TAILCALL;
>   
>   		EMIT(PPC_RAW_LL(_R3, _R1, -tailcallcnt_offset));
>   		EMIT(PPC_RAW_STL(_R3, _R1, func_frame_offset - tailcallcnt_offset));


> @@ -714,6 +714,7 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *rw_im
>   	 * LR save area                 [ r0 save (64-bit)  ]   | header
>   	 *                              [ r0 save (32-bit)  ]   |
>   	 * dummy frame for unwind       [ back chain 1      ] --
> +	 *                              [ tail_call_cnt     ] optional - 64-bit powerpc
>   	 *                              [ padding           ] align stack frame
>   	 *       r4_off                 [ r4 (tailcallcnt)  ] optional - 32-bit powerpc
>   	 *       alt_lr_off             [ real lr (ool stub)] optional - actual lr
> @@ -795,6 +796,14 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *rw_im
>   		}
>   	}
>   
> +	/*
> +	 * Save tailcall count pointer at the same offset on the
> +	 * stack where subprogs expect it
> +	 */
> +	if ((flags & BPF_TRAMP_F_CALL_ORIG) &&
> +		(flags & BPF_TRAMP_F_TAIL_CALL_CTX))
> +		bpf_frame_size += BPF_PPC_TAILCALL;
> +

The above hunk is relevant in the next patch where tailcalls support
in subprogs is added. Drop it here and move it to patch#2.

- Hari


