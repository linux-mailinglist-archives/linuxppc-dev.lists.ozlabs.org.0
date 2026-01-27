Return-Path: <linuxppc-dev+bounces-16297-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sMsBFC0keGlcoQEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16297-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jan 2026 03:34:21 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 769998F0A3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jan 2026 03:34:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f0Txh5DZPz2xjP;
	Tue, 27 Jan 2026 13:34:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769481256;
	cv=none; b=InYiAYIUW7aYt3tEz6g2znxQz2O/A9PguiqQ1qOirmZQusi9pD3TnWX/su7SsqRDpV4GyF5nxdrL31Z7OrUwrUlJR2uemBZRCTYpvLnBIlcD2CsBqM4PShE8cnfbTKC1F2NjyuqwAI/BoMzyD/Rxn9GuUbXRtZU2L5HYvUyCw4ncO3pDGvf4CvPX2R2bApqFx+d3F6MpldR+k1ZKVuuobYfteTkoLmqQquZp6HPZlo2WeYtcAsTdwW+0SYRCmNhbKtyKWIXi0elTPiBCGgCOGbwskpH/zFnmyyeedhQ9CIg+4O3iBW2JTwg0puZDVhm5kaLcLEmCP9CL8QKZETy6jw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769481256; c=relaxed/relaxed;
	bh=CQycuOp4nIBSfW/vleYH22vyOKUKF5lfgvTu3TbeUrQ=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=PZlwAHoA6xoPApfatKBqtctELWGZbtZze3dmQ06LJ44XeiqonPGtOPBjO7hFb87QI2/ycV1CnNyB3h6ote3DawULUIsD44WYEGfgubSwNBUkQbHMimdg3abJgCA3FU9q0jzimyy+VxS1Pu+tBttRhmUUocCfBAHlsGHA+bsLaonVjjtAp/xKaSGp8Xch8igVer+WIW6wC13PX2gqafv0ZSdhhGrn1zKF5NRGUujz+ONziXOU0tBWIe6LN51F286tbmoBzMGHISpt8sGjsuRmJ4diPPAEP/SjDMKS5E+KRkP2YcmrqCl4W0KIuJ4Ztq8s8ULoT9chxeIIBPQ9UJgSMg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=W002QsDT; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=W002QsDT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f0Txg5LgWz2xJF
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Jan 2026 13:34:15 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 60QFGRN2010776;
	Tue, 27 Jan 2026 02:32:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=CQycuO
	p4nIBSfW/vleYH22vyOKUKF5lfgvTu3TbeUrQ=; b=W002QsDTnpWy5bTCK6SUeq
	k1RURfCQAs5S8BiCV6aime/l+ZAp97IhBnvrqHISKtWRVPU+RwXGfpwathlFqsiv
	VTjjl0vqkLmYa08F0o5VuQWoVKx9Qiv22BudjEuJ/C9R9Xaycx0SjasFEX8Za3R3
	cBwYXAPa8aoDAg9UBKWZx3O0WyEzrJ4nor6xX4G8Z0ncjkNWllTU7sPchsDvtSl5
	+38tF/ykcRpBqPgZL3gLU85vX6MPwTcrDoAD6+hh7t5B8vGUy2PAcvBHyzI4U0pc
	ffM8F7mqlhWghoBAbAWmAIxIa221JZPQKLKcs3DB9OPmjLVL2vR/4up/HPidGfuw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bvnt7k2uh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Jan 2026 02:32:44 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 60R2U3X0012232;
	Tue, 27 Jan 2026 02:32:44 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bvnt7k2uc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Jan 2026 02:32:44 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 60QLR0dk026319;
	Tue, 27 Jan 2026 02:32:42 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4bw9wk6x95-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Jan 2026 02:32:42 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 60R2WcCf42402162
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 27 Jan 2026 02:32:38 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8B8AF20043;
	Tue, 27 Jan 2026 02:32:38 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1303920040;
	Tue, 27 Jan 2026 02:32:32 +0000 (GMT)
Received: from [9.43.49.170] (unknown [9.43.49.170])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 27 Jan 2026 02:32:31 +0000 (GMT)
Message-ID: <6873d674-316e-4bc2-a39d-52ba4239e395@linux.ibm.com>
Date: Tue, 27 Jan 2026 08:02:29 +0530
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
From: Hari Bathini <hbathini@linux.ibm.com>
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
 <1ea2c9bc-4dde-4e26-9e50-066e5e3900ab@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <1ea2c9bc-4dde-4e26-9e50-066e5e3900ab@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: FtwGbzwVp_kfmFnVmzUNWrXLGa-8yiha
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDAxNyBTYWx0ZWRfX1yQ/KGzehPNr
 8WXEAkjlXftp4mF4R56AImVx29fMSXQ/itg6Wg4aWNWA6VbroL+l2ezdWIAsUCrWDiAD6/viWWD
 h0DmkXTxlxb1e6dprywG7goStvg1qz/OJFdP5qKObgm4MXm3lVOoBjbGGbwsiS7W2DqdshP5cOb
 mPyLXkTUYwAG6C+6oBav9lwDpsufhl/owJmT0MDsFLstnMQAMO+ZoWmZbzttUnNDWM+8DQmhGRW
 th6SlRkCP2A18V1Tz7X4WKkF6aK4KaDIBsgawN5y7laYxAODTg/odZkg/JwK03In26/cnzZEaYQ
 vW2LARFRCOa5KrnG74t+3ioRaQiuCU26s+UEyVhXqzGYCCdFFvKfxi4WN90TVeq7Q/ErDfFN6fQ
 jt+9RNsXa7RdcihilOA3Ulz/zogAhTKeJIpAjfxbO+Aho40/SxjgMD7vBNEdciwOtPsRfEGK6+W
 IfFFsvbYIi4eMomP6Mw==
X-Authority-Analysis: v=2.4 cv=Zs3g6t7G c=1 sm=1 tr=0 ts=697823cc cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=PTKKscx9fBaGl3L8rvAA:9 a=tOGEaUVFaSAvnmsd:21
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: eI5URQBaM0cPWrVkAcznPgxx4yBPxGiw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-27_01,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2601150000 definitions=main-2601270017
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
	TAGGED_FROM(0.00)[bounces-16297-lists,linuxppc-dev=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.ibm.com:mid,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 769998F0A3
X-Rspamd-Action: no action



On 27/01/26 12:00 am, Hari Bathini wrote:
> 
> 
> On 24/01/26 1:53 pm, bot+bpf-ci@kernel.org wrote:
>>> diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/ 
>>> bpf_jit_comp64.c
>>> index db121b1404fe..17de8b53a962 100644
>>> --- a/arch/powerpc/net/bpf_jit_comp64.c
>>> +++ b/arch/powerpc/net/bpf_jit_comp64.c
>>
>> [ ... ]
>>
>>> +/*
>>> + * For exception boundary & exception_cb progs:
>>> + *     return increased size to accommodate additional NVRs.
>>> + */
>>> +static int bpf_jit_stack_size(struct codegen_context *ctx)
>>> +{
>>> +    return ctx->exception_boundary || ctx->exception_cb ?
>>> +                    BPF_PPC_EXC_STACKFRAME :
>>> +                    BPF_PPC_STACKFRAME;
>>> +}
>>
>> [ ... ]
>>
>>> @@ -198,7 +249,19 @@ void bpf_jit_build_prologue(u32 *image, struct 
>>> codegen_context *ctx)
>>>               EMIT(PPC_RAW_STD(_R0, _R1, PPC_LR_STKOFF));
>>>           }
>>>
>>> -        EMIT(PPC_RAW_STDU(_R1, _R1, -(BPF_PPC_STACKFRAME + ctx- 
>>> >stack_size)));
>>> +        EMIT(PPC_RAW_STDU(_R1, _R1,
>>> +                -(bpf_jit_stack_size(ctx) + ctx->stack_size)));
>>> +    }
>>
>> [ ... ]
>>
>>> @@ -248,9 +311,19 @@ static void bpf_jit_emit_common_epilogue(u32 
>>> *image, struct codegen_context *ctx)
>>>           EMIT(PPC_RAW_LD(bpf_to_ppc(ARENA_VM_START), _R1,
>>>                   bpf_jit_stack_offsetof(ctx, 
>>> bpf_to_ppc(ARENA_VM_START))));
>>>
>>> +    if (ctx->exception_cb) {
>>> +        /*
>>> +         * Recover additionally saved non volatile registers from stack
>>> +         * frame of exception boundary program.
>>> +         */
>>> +        for (i = _R14; i <= _R25; i++)
>>> +            EMIT(PPC_RAW_LD(i, _R1, bpf_jit_stack_offsetof(ctx, i)));
>>> +    }
>>> +
>>>       /* Tear down our stack frame */
>>>       if (bpf_has_stack_frame(ctx)) {
>>> -        EMIT(PPC_RAW_ADDI(_R1, _R1, BPF_PPC_STACKFRAME + ctx- 
>>> >stack_size));
>>> +        EMIT(PPC_RAW_ADDI(_R1, _R1, bpf_jit_stack_size(ctx) + ctx- 
>>> >stack_size));
>>
>> For the exception callback case, doesn't this use the wrong stack_size?
>>
>> In bpf_jit_build_prologue(), the exception callback does not create 
>> its own
>> frame - it sets R1 to the boundary's frame pointer via 
>> EMIT(PPC_RAW_MR(_R1,
>> _R5)). However here in the epilogue, the frame teardown uses ctx- 
>> >stack_size
>> which is the callback's stack depth, not the boundary's.
>>
>> The boundary program creates its frame with:
>>      STDU R1, R1, -(bpf_jit_stack_size(boundary_ctx) + 
>> boundary_stack_size)
>>
>> But the callback tears it down with:
>>      ADDI R1, R1, bpf_jit_stack_size(callback_ctx) + callback_stack_size
>>
>> Since each BPF subprogram can have a different stack_depth (set per- 
>> subprog
>> in kernel/bpf/verifier.c via func[i]->aux->stack_depth), if the exception
>> callback has a different stack depth than the boundary, R1 will end up at
>> the wrong location after this ADDI.
>>
>> After the wrong R1 adjustment, the LR restore below loads from R1+16 
>> which
>> is now pointing to the wrong memory location, potentially causing a 
>> return
>> to an invalid address.
>>
>> Would it be correct to store the boundary's stack_size somewhere 
>> accessible
>> to the callback, or ensure the callback uses the same stack layout as the
>> boundary?
> 
> That is a good catch! Jitting the rollback of the stack frame of
> exception boundary program in exception callback program is tricky
> as stack_depth of exception boundary program is not readily available
> while jitting exception callback program...
> 
> "ld r1, 0(r1)" instruction can be used instead of "addi r1, r1, size"
> form for tearing down the stack.
> 
> The other issue is calculating the offset of non volatile registers
> to restore them from the stack. To reliably restore, move one frame
> above exception boundary frame and restore NVRs with redzone offset
> without relying on stack_depth of exception boundary program.
> 
> Also, as exception callback may also use stack, setup frame for
> exception callback and restore BPF JIT NVRs in its epilogue.
> 
> In essence, something like the below is needed on top of your patch..
> 
> ---
> 
> diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/ 
> bpf_jit_comp64.c
> index b1a3945ccc9f..15342d76f96f 100644
> --- a/arch/powerpc/net/bpf_jit_comp64.c
> +++ b/arch/powerpc/net/bpf_jit_comp64.c
> @@ -32,7 +32,8 @@
>    *
>    *        [    prev sp        ] <-------------
>    *        [    tail_call_info    ] 8        |
> - *        [   nv gpr save area    ] 6*8 + (12*8)    |
> + *        [   nv gpr save area    ] 6*8        |
> + *        [ addl. nv gpr save area] (12*8)    | <--- only in exception 
> boundary program
>    *        [    local_tmp_var    ] 24        |
>    * fp (r31) -->    [   ebpf stack space    ] upto 512    |
>    *        [     frame header    ] 32/112    |
> @@ -125,7 +126,8 @@ static inline bool bpf_has_stack_frame(struct 
> codegen_context *ctx)
>    *        [      ...           ]         |
>    * sp (r1) --->    [    stack pointer    ] --------------
>    *        [    tail_call_info    ] 8
> - *        [   nv gpr save area    ] 6*8 + (12*8)
> + *        [   nv gpr save area    ] 6*8
> + *        [ addl. nv gpr save area] (12*8) <--- Only in case of 
> exception boundary
>    *        [    local_tmp_var    ] 24
>    *        [   unused red zone    ] 224
>    *
> @@ -139,12 +141,9 @@ static int bpf_jit_stack_local(struct 
> codegen_context *ctx)
>           return STACK_FRAME_MIN_SIZE + ctx->stack_size;
>       } else {
>           /* Stack layout with redzone */
> -        return -(BPF_PPC_TAILCALL
> -            +BPF_PPC_STACK_SAVE
> -            +(ctx->exception_boundary || ctx->exception_cb ?
> -                        BPF_PPC_EXC_STACK_SAVE : 0)
> -            +BPF_PPC_STACK_LOCALS
> -            );
> +        return -(BPF_PPC_TAILCALL + BPF_PPC_STACK_SAVE +
> +             (ctx->exception_boundary ? BPF_PPC_EXC_STACK_SAVE : 0) +
> +             BPF_PPC_STACK_LOCALS);
>       }
>   }
> 
> @@ -153,20 +152,27 @@ int bpf_jit_stack_tailcallinfo_offset(struct 
> codegen_context *ctx)
>       return bpf_jit_stack_local(ctx) + BPF_PPC_STACK_LOCALS + 
> BPF_PPC_STACK_SAVE;
>   }
> 
> -static int bpf_jit_stack_offsetof(struct codegen_context *ctx, int reg)
> +static int bpf_jit_stack_offsetof(struct codegen_context *ctx, int reg, 
> bool use_redzone)
>   {
>       int min_valid_nvreg = BPF_PPC_NVR_MIN;
>       /* Default frame size for all cases except exception boundary */
>       int frame_nvr_size = BPF_PPC_STACKFRAME;
> 
> +    /*
> +     * When use_redzone is true, return offset of the NVR on redzone
> +     * Else, return offset based on whether stack is setup or not.
> +     */
> +    if (!use_redzone)
> +        use_redzone = bpf_has_stack_frame(ctx);
> +
>       /* Consider all nv regs for handling exceptions */
> -    if (ctx->exception_boundary || ctx->exception_cb) {
> +    if (ctx->exception_boundary) {
>           min_valid_nvreg = _R14;
>           frame_nvr_size = BPF_PPC_EXC_STACKFRAME;
>       }
> 

>       if (reg >= min_valid_nvreg && reg < 32)

On a closely look, min_valid_nvreg has to be _R14 for exception_cb to
satisfy the above reg condition check...

> -        return (bpf_has_stack_frame(ctx) ?
> +        return (!use_redzone ?
>               (frame_nvr_size + ctx->stack_size) : 0)
>                   - (8 * (32 - reg)) - BPF_PPC_TAILCALL;
> 
> @@ -179,14 +185,12 @@ void bpf_jit_realloc_regs(struct codegen_context 
> *ctx)
>   }
> 
>   /*
> - * For exception boundary & exception_cb progs:
> - *     return increased size to accommodate additional NVRs.
> + * For exception boundary program, return increased size to
> + * accommodate additional NVRs.
>    */
>   static int bpf_jit_stack_size(struct codegen_context *ctx)
>   {
> -    return ctx->exception_boundary || ctx->exception_cb ?
> -                    BPF_PPC_EXC_STACKFRAME :
> -                    BPF_PPC_STACKFRAME;
> +    return ctx->exception_boundary ? BPF_PPC_EXC_STACKFRAME : 
> BPF_PPC_STACKFRAME;
>   }
> 
>   void bpf_jit_build_prologue(u32 *image, struct codegen_context *ctx)
> @@ -235,12 +239,30 @@ void bpf_jit_build_prologue(u32 *image, struct 
> codegen_context *ctx)
>           EMIT(PPC_RAW_STD(bpf_to_ppc(TMP_REG_1), _R1, - 
> (BPF_PPC_TAILCALL)));
>       }
> 
> -    if (bpf_has_stack_frame(ctx) && !ctx->exception_cb) {
> +    if (ctx->exception_cb) {
> +        /*
> +         * Exception callback receives frame pointer of exception 
> boundary program as
> +         * third argument but reliable offset calculation for NVRs is 
> only possible
> +         * on the redzone because stack_depth of exception boundary is 
> not known
> +         * while jitting the exception_cb program. So, rollback to an 
> sp above
> +         * exception boundary frame and restore the additional NVRs 
> using redzone
> +         * offset. The regular BPF JIT NVRs can be restored now, or in 
> the epilogue
> +         * of exception_cb like any other bpf prog by reusing the BPF 
> JIT NVRs part
> +         * of exception_boundary stack frame. The latter is preferred 
> as exception
> +         * cb may also clobber the BPF JIT NVRs.
> +         */
> +        EMIT(PPC_RAW_LD(_R1, _R5, 0));
> +
> +        /*
> +         * Recover additionally saved non volatile registers from stack
> +         * frame of exception boundary program.
> +         */
> +        for (i = _R14; i <= _R25; i++)
> +            EMIT(PPC_RAW_LD(i, _R1, bpf_jit_stack_offsetof(ctx, i, 
> true)));
> +    }
> +
> +    if (bpf_has_stack_frame(ctx)) {
>           /*
> -         * exception_cb uses boundary frame after stack walk.
> -         * It can simply use redzone, this optimization reduces
> -         * stack walk loop by one level.
> -         *
>            * We need a stack frame, but we don't necessarily need to
>            * save/restore LR unless we call other functions
>            */
> @@ -257,11 +279,11 @@ void bpf_jit_build_prologue(u32 *image, struct 
> codegen_context *ctx)
>        * Program acting as exception boundary pushes R14..R25 in 
> addition to
>        * BPF callee-saved non volatile registers. Exception callback uses
>        * the boundary program's stack frame, recover additionally saved
> -     * registers in epilogue of exception callback.
> +     * registers in prologue of exception callback.
>        */
>       if (ctx->exception_boundary) {
>           for (i = _R14; i <= _R25; i++)
> -            EMIT(PPC_RAW_STD(i, _R1, bpf_jit_stack_offsetof(ctx, i)));
> +            EMIT(PPC_RAW_STD(i, _R1, bpf_jit_stack_offsetof(ctx, i, 
> false)));
>       }
> 
>       if (!ctx->exception_cb) {
> @@ -273,17 +295,11 @@ void bpf_jit_build_prologue(u32 *image, struct 
> codegen_context *ctx)
>           for (i = BPF_REG_6; i <= BPF_REG_10; i++)
>               if (ctx->exception_boundary || bpf_is_seen_register(ctx, 
> bpf_to_ppc(i)))
>                   EMIT(PPC_RAW_STD(bpf_to_ppc(i), _R1,
> -                    bpf_jit_stack_offsetof(ctx, bpf_to_ppc(i))));
> +                    bpf_jit_stack_offsetof(ctx, bpf_to_ppc(i), false)));
> 
>           if (ctx->exception_boundary || ctx->arena_vm_start)
>               EMIT(PPC_RAW_STD(bpf_to_ppc(ARENA_VM_START), _R1,
> -                 bpf_jit_stack_offsetof(ctx, 
> bpf_to_ppc(ARENA_VM_START))));
> -    } else {
> -        /*
> -         * Exception callback receives Frame Pointer of boundary
> -         * program(main prog) as third arg
> -         */
> -        EMIT(PPC_RAW_MR(_R1, _R5));
> +                 bpf_jit_stack_offsetof(ctx, 
> bpf_to_ppc(ARENA_VM_START), false)));
>       }
> 
>       /*
> @@ -305,20 +321,12 @@ static void bpf_jit_emit_common_epilogue(u32 
> *image, struct codegen_context *ctx
>       /* Restore NVRs */
>       for (i = BPF_REG_6; i <= BPF_REG_10; i++)
>           if (ctx->exception_cb || bpf_is_seen_register(ctx, 
> bpf_to_ppc(i)))
> -            EMIT(PPC_RAW_LD(bpf_to_ppc(i), _R1, 
> bpf_jit_stack_offsetof(ctx, bpf_to_ppc(i))));
> +            EMIT(PPC_RAW_LD(bpf_to_ppc(i), _R1,
> +                    bpf_jit_stack_offsetof(ctx, bpf_to_ppc(i), false)));
> 
>       if (ctx->exception_cb || ctx->arena_vm_start)
>           EMIT(PPC_RAW_LD(bpf_to_ppc(ARENA_VM_START), _R1,
> -                bpf_jit_stack_offsetof(ctx, bpf_to_ppc(ARENA_VM_START))));
> -
> -    if (ctx->exception_cb) {
> -        /*
> -         * Recover additionally saved non volatile registers from stack
> -         * frame of exception boundary program.
> -         */
> -        for (i = _R14; i <= _R25; i++)
> -            EMIT(PPC_RAW_LD(i, _R1, bpf_jit_stack_offsetof(ctx, i)));
> -    }
> +                bpf_jit_stack_offsetof(ctx, bpf_to_ppc(ARENA_VM_START), 
> false)));
> 
>       /* Tear down our stack frame */
>       if (bpf_has_stack_frame(ctx)) {

Also, if all exception selftests are passing, it is likely that neither
exception boundary nor exception callback is using BPF stack.
Need to have a test case that tests different BPF stack size for
exception boundary and exception callback..

- Hari

