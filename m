Return-Path: <linuxppc-dev+bounces-16300-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sDhTACBheGmbpgEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16300-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jan 2026 07:54:24 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F5B9087D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jan 2026 07:54:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f0bjj54yWz2xjP;
	Tue, 27 Jan 2026 17:54:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769496857;
	cv=none; b=hHU+Ybg43poHafyQscnsQIkzq8QSEcOz9jLu5ZuQByzRfYuyLbMYRpsPtTUqLeHfuINpmaR+oD/GCDS25hz7eLYGiRZ4ItoocJ3t5FLlZAFlMt/qgDiuDIX2FZoOzCdZt01XelMxeShrf06N79+db65Df3IOk8FO6IF/d1d8oVYuvP7Viecj5Py4vxb2FY/189HL5hccu08yTv6l+hnxrleyUh38/7qDtA4dFjjs559qyZ19hUbc1UfwuEGDmmqETBOlkPS/H9jq8Jp5IFVS7rPf3LKEBJ7qEjIpjvewU3Yk/+jVZKiLVdKjc5z6oI7+ac7dCzxk7H3rxbX+N6H69w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769496857; c=relaxed/relaxed;
	bh=2vKyuYPx1Jq1ekbrT4IzHP+v9xXysPIOpGFFOnvpWoI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L91rCy1epMzow/UgfCfq0SdAUc1hyQGh9ElgFFKLMFxGfZ8CmHXwnz7lExPoVz8GSDPj51G6HD5PHJXkIyb2kFjCfleGYCLqKLBqxDFV0YraTs/s9tzK/iuWk6eboPR9pZ/bYWfgqLjzR1bLRrRN8S1Psyrp9DNi1VDrbVU2JjYi0JpqmmQFG34rKO3eWkQ4r50KKrT4746DDQQXbeEqZxOdj3L/UAmrXS5SQ+QB8RBgVZAo2+L1mlTwLVr/naxQtHs9ZAUGWpqyCwTJRfqNlHHdOQ0MwacrYlJxXZEGv+oC3p68BhZhUDISJBrHb1IGywlwAuFY7NjDvCoSBpe6Ng==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MHjDObsF; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MHjDObsF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f0bjh5DNRz2xJF
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Jan 2026 17:54:16 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 60QFcQPc023414;
	Tue, 27 Jan 2026 06:53:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=2vKyuY
	Px1Jq1ekbrT4IzHP+v9xXysPIOpGFFOnvpWoI=; b=MHjDObsFUocpXTiOJ4FkIH
	pN5rcvsjOpbt8u4T4+d7nM9NeoYxToKC4IDqydh2gb8tTcZAiQ7zqNzlZXjNo4Ui
	inQ/b9mfiH/A0uDDOwrdbXQjwofOH6I440R8F2vyykGCooIH7wG+ogQV927a2KqH
	Ad87Z5KP0nTVfrUF3CnbY7QRUsuSX9Grlsn2CiKEBobISXeT+CTBkV+oK6vr6lcF
	/kz2U+YibqcAmstUBDzTLK4uPqI1knDINIMt0nPphvP3Mx+tPgJh4H20MkSBVO5F
	LA0Jl3SSM8Smi+XQlYY/Np2Rz6Gq64W2LlPGehMhGacmoNg8hXhyLHhVWpZass3Q
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bvnk6uxdb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Jan 2026 06:53:45 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 60R6rikb030787;
	Tue, 27 Jan 2026 06:53:44 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bvnk6uxd9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Jan 2026 06:53:44 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 60R3vTD3023625;
	Tue, 27 Jan 2026 06:53:43 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4bwamjqf9b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Jan 2026 06:53:43 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 60R6rdu253608772
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 27 Jan 2026 06:53:39 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4D51120043;
	Tue, 27 Jan 2026 06:53:39 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 83F5B20040;
	Tue, 27 Jan 2026 06:53:34 +0000 (GMT)
Received: from [9.78.106.105] (unknown [9.78.106.105])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 27 Jan 2026 06:53:34 +0000 (GMT)
Message-ID: <91a1246a-44d7-4f39-b7a5-2de1865e7415@linux.ibm.com>
Date: Tue, 27 Jan 2026 12:23:33 +0530
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
Subject: Re: [PATCH v5 6/6] powerpc64/bpf: Additional NVR handling for
 bpf_throw
To: bot+bpf-ci@kernel.org, adubey@linux.ibm.com, bpf@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-kselftest@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: sachinpb@linux.ibm.com, venkat88@linux.ibm.com, andrii@kernel.org,
        eddyz87@gmail.com, mykolal@fb.com, ast@kernel.org,
        daniel@iogearbox.net, martin.lau@linux.dev, song@kernel.org,
        yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org,
        sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org,
        christophe.leroy@csgroup.eu, naveen@kernel.org, maddy@linux.ibm.com,
        mpe@ellerman.id.au, npiggin@gmail.com, memxor@gmail.com,
        iii@linux.ibm.com, shuah@kernel.org, martin.lau@kernel.org,
        clm@meta.com, ihor.solodrai@linux.dev
References: <20260124075223.6033-7-adubey@linux.ibm.com>
 <2a310e86a59eb4c44c3ac9e5647814469d9c955580c9c0f1b3d9ca4a44717a34@mail.kernel.org>
Content-Language: en-US
From: Hari Bathini <hbathini@linux.ibm.com>
In-Reply-To: <2a310e86a59eb4c44c3ac9e5647814469d9c955580c9c0f1b3d9ca4a44717a34@mail.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: PFbibNarOBqJkas2DMGTEou_bb19UzBW
X-Proofpoint-ORIG-GUID: 9D4Ah6Cb63jonCAn6hbYlOYL6sVvYXd6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDA1NCBTYWx0ZWRfX92YmP9olsmk7
 ifu2d0hXdJlzQ/tVU8Ue7Aeym88Q9H0TKK0m9XsiWDeh2FQtCRR32Rl75Nu1XWlSzMyu0gRG7ek
 HuDq+VHNPDUg3jtdx/zn2Kho70vhOpazchYYqVvccMOBCsUp5K4+iu40FYdBdIl90LbgLZIhX6A
 7fU13Trb8v7KUiCfrWy2OFFVGUoVotOXIjf86qp9f2/POe5yIRagdjze/t56UQTPFpVDE38wfeP
 Lf9va1A6UeUkXsEILvDeXRkJhhqSvrlWum0Mp/RcbBwcRkaUxIyCE2ZZ/z58XuJaKkWHre0YrUM
 nRg4H1g6+0JB9p2stZVKug/6v4Ez++140RyvZG1KDZuiB9nxqHOVUuOhyVbh4Vo1skUuP48aEUC
 w37PSFcFkDE/7gPaRv6JtbDM3wCqUgX6mg2hMfqpmmX3dOBb+g+Cmx+vKhRBSANsxr86VhlfHdv
 EQEewlDpy8umq+1DWSA==
X-Authority-Analysis: v=2.4 cv=AMiVTGgp c=1 sm=1 tr=0 ts=697860f9 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=DLj6BFq7CkYCEiYtZIMA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-27_01,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 bulkscore=0 suspectscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2601150000
 definitions=main-2601270054
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
	TAGGED_FROM(0.00)[bounces-16300-lists,linuxppc-dev=lfdr.de];
	FREEMAIL_CC(0.00)[linux.ibm.com,kernel.org,gmail.com,fb.com,iogearbox.net,linux.dev,fomichev.me,google.com,csgroup.eu,ellerman.id.au,meta.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[hbathini@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:bot+bpf-ci@kernel.org,m:adubey@linux.ibm.com,m:bpf@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-kselftest@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:sachinpb@linux.ibm.com,m:venkat88@linux.ibm.com,m:andrii@kernel.org,m:eddyz87@gmail.com,m:mykolal@fb.com,m:ast@kernel.org,m:daniel@iogearbox.net,m:martin.lau@linux.dev,m:song@kernel.org,m:yonghong.song@linux.dev,m:john.fastabend@gmail.com,m:kpsingh@kernel.org,m:sdf@fomichev.me,m:haoluo@google.com,m:jolsa@kernel.org,m:christophe.leroy@csgroup.eu,m:naveen@kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:memxor@gmail.com,m:iii@linux.ibm.com,m:shuah@kernel.org,m:martin.lau@kernel.org,m:clm@meta.com,m:ihor.solodrai@linux.dev,m:bot@kernel.org,m:johnfastabend@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ibm.com:+];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCPT_COUNT_TWELVE(0.00)[32];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hbathini@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linuxppc-dev,bpf-ci];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.ibm.com:mid]
X-Rspamd-Queue-Id: C8F5B9087D
X-Rspamd-Action: no action



On 24/01/26 1:53 pm, bot+bpf-ci@kernel.org wrote:
>> diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
>> index db121b1404fe..17de8b53a962 100644
>> --- a/arch/powerpc/net/bpf_jit_comp64.c
>> +++ b/arch/powerpc/net/bpf_jit_comp64.c
> 
> [ ... ]
> 
>> +/*
>> + * For exception boundary & exception_cb progs:
>> + *     return increased size to accommodate additional NVRs.
>> + */
>> +static int bpf_jit_stack_size(struct codegen_context *ctx)
>> +{
>> +	return ctx->exception_boundary || ctx->exception_cb ?
>> +					BPF_PPC_EXC_STACKFRAME :
>> +					BPF_PPC_STACKFRAME;
>> +}
> 
> [ ... ]
> 
>> @@ -198,7 +249,19 @@ void bpf_jit_build_prologue(u32 *image, struct codegen_context *ctx)
>>   			EMIT(PPC_RAW_STD(_R0, _R1, PPC_LR_STKOFF));
>>   		}
>>
>> -		EMIT(PPC_RAW_STDU(_R1, _R1, -(BPF_PPC_STACKFRAME + ctx->stack_size)));
>> +		EMIT(PPC_RAW_STDU(_R1, _R1,
>> +				-(bpf_jit_stack_size(ctx) + ctx->stack_size)));
>> +	}
> 
> [ ... ]
> 
>> @@ -248,9 +311,19 @@ static void bpf_jit_emit_common_epilogue(u32 *image, struct codegen_context *ctx)
>>   		EMIT(PPC_RAW_LD(bpf_to_ppc(ARENA_VM_START), _R1,
>>   				bpf_jit_stack_offsetof(ctx, bpf_to_ppc(ARENA_VM_START))));
>>
>> +	if (ctx->exception_cb) {
>> +		/*
>> +		 * Recover additionally saved non volatile registers from stack
>> +		 * frame of exception boundary program.
>> +		 */
>> +		for (i = _R14; i <= _R25; i++)
>> +			EMIT(PPC_RAW_LD(i, _R1, bpf_jit_stack_offsetof(ctx, i)));
>> +	}
>> +
>>   	/* Tear down our stack frame */
>>   	if (bpf_has_stack_frame(ctx)) {
>> -		EMIT(PPC_RAW_ADDI(_R1, _R1, BPF_PPC_STACKFRAME + ctx->stack_size));
>> +		EMIT(PPC_RAW_ADDI(_R1, _R1, bpf_jit_stack_size(ctx) + ctx->stack_size));
> 
> For the exception callback case, doesn't this use the wrong stack_size?
> 
> In bpf_jit_build_prologue(), the exception callback does not create its own
> frame - it sets R1 to the boundary's frame pointer via EMIT(PPC_RAW_MR(_R1,
> _R5)). However here in the epilogue, the frame teardown uses ctx->stack_size
> which is the callback's stack depth, not the boundary's.
> 
> The boundary program creates its frame with:
>      STDU R1, R1, -(bpf_jit_stack_size(boundary_ctx) + boundary_stack_size)
> 
> But the callback tears it down with:
>      ADDI R1, R1, bpf_jit_stack_size(callback_ctx) + callback_stack_size
> 
> Since each BPF subprogram can have a different stack_depth (set per-subprog
> in kernel/bpf/verifier.c via func[i]->aux->stack_depth), if the exception
> callback has a different stack depth than the boundary, R1 will end up at
> the wrong location after this ADDI.
> 
> After the wrong R1 adjustment, the LR restore below loads from R1+16 which
> is now pointing to the wrong memory location, potentially causing a return
> to an invalid address.
> 
> Would it be correct to store the boundary's stack_size somewhere accessible
> to the callback, or ensure the callback uses the same stack layout as the
> boundary?
> 
>> +
>>   		if (ctx->seen & SEEN_FUNC || ctx->exception_cb) {
>>   			EMIT(PPC_RAW_LD(_R0, _R1, PPC_LR_STKOFF));
>>   			EMIT(PPC_RAW_MTLR(_R0));
> 
> 
> ---
> AI reviewed your patch. Please fix the bug or email reply why it's not a bug.

I will post the fix for this issue as a follow-up.

Thanks
Hari

