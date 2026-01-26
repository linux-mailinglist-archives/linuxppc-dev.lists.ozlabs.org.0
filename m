Return-Path: <linuxppc-dev+bounces-16292-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oA+YOkKzd2l2kQEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16292-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Jan 2026 19:32:34 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B818C1D0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Jan 2026 19:32:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f0HFn1qJmz2yGM;
	Tue, 27 Jan 2026 05:32:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769452349;
	cv=none; b=gkKxBiJ7oOfR2aTjeKEv9FuZR1cC9DORF2EIkEdjL3a9DQPEd//yYcwB+v1rj4GkZKqKBJeUxnjenENnWwbUdi0n6g2xoS8GHy4xWwAyB9azLly7SED91GVQwk++1KfOoA9o5D60ab1fsPuCFlD/lqB7xTjmV7XKXaZ86ZJuyvb9+RFBRFeMbHQ2sETxZXg1+Y4xg8YsZoYFKw/nqEwuyXVVAThLbp4z5wW5qpZxM9fJKsn7QdXJkG5af9LXsxnuervmfUzhfFxLsnKMSqtyb8RA5w/YBlcUq9hN4xftHwcs5aoVjR7tDmzoC1MTmn2ow6eXCJIBgbOK883zsImuCw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769452349; c=relaxed/relaxed;
	bh=6sBdAV0eN1/VrJbt8ZCps9sFnwToDClVDrFq7vPFX6c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NsBTqTA7207YdGM4z5yvzQt0tmZWDoae0tStI05ajMAbht91EhZ+cchhFAk0S72dn1M3JrUiTtTBsHl7FRwHPahb0m2y8NMyhEIKP4k1WPM2K3lXdHHRpazlgwjof/fUrzyuz8zYyXFyABAlkzbqkxoSIKLs3t8IYba17Yxy7MotZyaj3aLEr09QH6qs97wGZ1Dzpc9dX1JRv72l/Gtpx9QQ+5s6nPdz0YwrsSgKsDRJ0etJoJACy0fw9xXu/buFnKMuBq+L3KZTx4ZGhJxe7MK6OvkRSwQMY++doQmSaGD1pkM8HeapZfp1XhoY5J//ELk0WmzQhilERotu1tYGfw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XJgJxkzf; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XJgJxkzf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f0HFm13Ksz2xpk
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Jan 2026 05:32:27 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 60QGV3rk019537;
	Mon, 26 Jan 2026 18:30:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=6sBdAV
	0eN1/VrJbt8ZCps9sFnwToDClVDrFq7vPFX6c=; b=XJgJxkzfLn96wAHueVLJgO
	fTkvBmTVkh68s1LTprLHPStZ/3oan6k0vtei9Mp7dQu5DuM9LjpHWOk469AaeN1X
	GQnSM01fFhHNq5pbsV+xdZBARCpQ3H9p0g4+AOemLuwu/J/jyOztIy676qwjC11J
	L3WFVyS2rPdH0YRLm2FUaYtfSzWYpi66x9tWVPsWinC9RnOLNPBWJW930VbOsbA/
	/8eqF4sPFINh/kbFCop//ju0j12qLSq15/JpKCGulX+DY2n1NLzH3/QSnmwCA0Er
	eSIRn42VUtIyyxy/dOYZ63kpu/nd7N5AThLeYMaCZkL53n8UdJbEuG4wHkzG/e+g
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bvnr603yk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Jan 2026 18:30:48 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 60QIUl3I012825;
	Mon, 26 Jan 2026 18:30:47 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bvnr603yf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Jan 2026 18:30:47 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 60QGWJ9Q026513;
	Mon, 26 Jan 2026 18:30:47 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4bw9wk5mdm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Jan 2026 18:30:46 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 60QIUh0q51118580
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 26 Jan 2026 18:30:43 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E864920043;
	Mon, 26 Jan 2026 18:30:42 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 63E5B20040;
	Mon, 26 Jan 2026 18:30:36 +0000 (GMT)
Received: from [9.43.47.91] (unknown [9.43.47.91])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 26 Jan 2026 18:30:36 +0000 (GMT)
Message-ID: <1ea2c9bc-4dde-4e26-9e50-066e5e3900ab@linux.ibm.com>
Date: Tue, 27 Jan 2026 00:00:35 +0530
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDE1NiBTYWx0ZWRfXw/FuxsvY0/DX
 SUljJvorQ0c1oi5DL5qbJbnFUYotQIpM5n7mdM9h3s49F3rOFcA2rDLIyKhh5LSqH4GLRwiQD7a
 /37bpQ+Phe967/QZGZ3JIVTI+rMvI5oAB1+KSh/E3UlYBaOcD7J7Gxo8/U+uzIzSyba0hBsqFua
 jbKrwJRaCkEgtvOC+m0aCPDxBPgpqM0RTD6mptk0ljIsFLpC1aZXbnk1IFiTFHNRuoL7bxvSlSE
 nqNWzkwGfNW7MNa8iK5QSxsw23Ve5WeIMJIAx9voFXrzQ103cw+W00KIbvmOY5Bm9Ezqe8rIxK3
 OrHibQKvf4nheCKiAZI5ZqfsINzPP/rqzlOEydexTWVRF/NLUAGhl8Df4K3tI8h7CHahpAPBgVs
 Ui0ExAeY3M2mwCvfzIL5JbAh68mfYwljUQg65MXW00T/cNiKTJ/h+WsiZwirRF3YdFnuDxGAjKc
 0jInN3Wa1rS7xE5aPMQ==
X-Proofpoint-GUID: exLbBdIEsI0iChENTmHn5k1-p7OPoNgR
X-Proofpoint-ORIG-GUID: BCnTabw2-FzGbVe5-UmNiDhN-bSu_L1O
X-Authority-Analysis: v=2.4 cv=X+Vf6WTe c=1 sm=1 tr=0 ts=6977b2d8 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=waAJvyqR3bQwtm8Bw5MA:9 a=tOGEaUVFaSAvnmsd:21
 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_04,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 adultscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2601150000
 definitions=main-2601260156
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
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-16292-lists,linuxppc-dev=lfdr.de];
	FREEMAIL_CC(0.00)[linux.ibm.com,kernel.org,gmail.com,fb.com,iogearbox.net,linux.dev,fomichev.me,google.com,csgroup.eu,ellerman.id.au,meta.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[hbathini@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:bot+bpf-ci@kernel.org,m:adubey@linux.ibm.com,m:bpf@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-kselftest@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:sachinpb@linux.ibm.com,m:venkat88@linux.ibm.com,m:andrii@kernel.org,m:eddyz87@gmail.com,m:mykolal@fb.com,m:ast@kernel.org,m:daniel@iogearbox.net,m:martin.lau@linux.dev,m:song@kernel.org,m:yonghong.song@linux.dev,m:john.fastabend@gmail.com,m:kpsingh@kernel.org,m:sdf@fomichev.me,m:haoluo@google.com,m:jolsa@kernel.org,m:christophe.leroy@csgroup.eu,m:naveen@kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:memxor@gmail.com,m:iii@linux.ibm.com,m:shuah@kernel.org,m:martin.lau@kernel.org,m:clm@meta.com,m:ihor.solodrai@linux.dev,m:bot@kernel.org,m:johnfastabend@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ibm.com:+];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 71B818C1D0
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

That is a good catch! Jitting the rollback of the stack frame of
exception boundary program in exception callback program is tricky
as stack_depth of exception boundary program is not readily available
while jitting exception callback program...

"ld r1, 0(r1)" instruction can be used instead of "addi r1, r1, size"
form for tearing down the stack.

The other issue is calculating the offset of non volatile registers
to restore them from the stack. To reliably restore, move one frame
above exception boundary frame and restore NVRs with redzone offset
without relying on stack_depth of exception boundary program.

Also, as exception callback may also use stack, setup frame for
exception callback and restore BPF JIT NVRs in its epilogue.

In essence, something like the below is needed on top of your patch..

---

diff --git a/arch/powerpc/net/bpf_jit_comp64.c 
b/arch/powerpc/net/bpf_jit_comp64.c
index b1a3945ccc9f..15342d76f96f 100644
--- a/arch/powerpc/net/bpf_jit_comp64.c
+++ b/arch/powerpc/net/bpf_jit_comp64.c
@@ -32,7 +32,8 @@
   *
   *		[	prev sp		] <-------------
   *		[    tail_call_info	] 8		|
- *		[   nv gpr save area	] 6*8 + (12*8)	|
+ *		[   nv gpr save area	] 6*8		|
+ *		[ addl. nv gpr save area] (12*8)	| <--- only in exception boundary 
program
   *		[    local_tmp_var	] 24		|
   * fp (r31) -->	[   ebpf stack space	] upto 512	|
   *		[     frame header	] 32/112	|
@@ -125,7 +126,8 @@ static inline bool bpf_has_stack_frame(struct 
codegen_context *ctx)
   *		[	  ...       	] 		|
   * sp (r1) --->	[    stack pointer	] --------------
   *		[    tail_call_info	] 8
- *		[   nv gpr save area	] 6*8 + (12*8)
+ *		[   nv gpr save area	] 6*8
+ *		[ addl. nv gpr save area] (12*8) <--- Only in case of exception 
boundary
   *		[    local_tmp_var	] 24
   *		[   unused red zone	] 224
   *
@@ -139,12 +141,9 @@ static int bpf_jit_stack_local(struct 
codegen_context *ctx)
  		return STACK_FRAME_MIN_SIZE + ctx->stack_size;
  	} else {
  		/* Stack layout with redzone */
-		return -(BPF_PPC_TAILCALL
-			+BPF_PPC_STACK_SAVE
-			+(ctx->exception_boundary || ctx->exception_cb ?
-						BPF_PPC_EXC_STACK_SAVE : 0)
-			+BPF_PPC_STACK_LOCALS
-			);
+		return -(BPF_PPC_TAILCALL + BPF_PPC_STACK_SAVE +
+			 (ctx->exception_boundary ? BPF_PPC_EXC_STACK_SAVE : 0) +
+			 BPF_PPC_STACK_LOCALS);
  	}
  }

@@ -153,20 +152,27 @@ int bpf_jit_stack_tailcallinfo_offset(struct 
codegen_context *ctx)
  	return bpf_jit_stack_local(ctx) + BPF_PPC_STACK_LOCALS + 
BPF_PPC_STACK_SAVE;
  }

-static int bpf_jit_stack_offsetof(struct codegen_context *ctx, int reg)
+static int bpf_jit_stack_offsetof(struct codegen_context *ctx, int reg, 
bool use_redzone)
  {
  	int min_valid_nvreg = BPF_PPC_NVR_MIN;
  	/* Default frame size for all cases except exception boundary */
  	int frame_nvr_size = BPF_PPC_STACKFRAME;

+	/*
+	 * When use_redzone is true, return offset of the NVR on redzone
+	 * Else, return offset based on whether stack is setup or not.
+	 */
+	if (!use_redzone)
+		use_redzone = bpf_has_stack_frame(ctx);
+
  	/* Consider all nv regs for handling exceptions */
-	if (ctx->exception_boundary || ctx->exception_cb) {
+	if (ctx->exception_boundary) {
  		min_valid_nvreg = _R14;
  		frame_nvr_size = BPF_PPC_EXC_STACKFRAME;
  	}

  	if (reg >= min_valid_nvreg && reg < 32)
-		return (bpf_has_stack_frame(ctx) ?
+		return (!use_redzone ?
  			(frame_nvr_size + ctx->stack_size) : 0)
  				- (8 * (32 - reg)) - BPF_PPC_TAILCALL;

@@ -179,14 +185,12 @@ void bpf_jit_realloc_regs(struct codegen_context *ctx)
  }

  /*
- * For exception boundary & exception_cb progs:
- *     return increased size to accommodate additional NVRs.
+ * For exception boundary program, return increased size to
+ * accommodate additional NVRs.
   */
  static int bpf_jit_stack_size(struct codegen_context *ctx)
  {
-	return ctx->exception_boundary || ctx->exception_cb ?
-					BPF_PPC_EXC_STACKFRAME :
-					BPF_PPC_STACKFRAME;
+	return ctx->exception_boundary ? BPF_PPC_EXC_STACKFRAME : 
BPF_PPC_STACKFRAME;
  }

  void bpf_jit_build_prologue(u32 *image, struct codegen_context *ctx)
@@ -235,12 +239,30 @@ void bpf_jit_build_prologue(u32 *image, struct 
codegen_context *ctx)
  		EMIT(PPC_RAW_STD(bpf_to_ppc(TMP_REG_1), _R1, -(BPF_PPC_TAILCALL)));
  	}

-	if (bpf_has_stack_frame(ctx) && !ctx->exception_cb) {
+	if (ctx->exception_cb) {
+		/*
+		 * Exception callback receives frame pointer of exception boundary 
program as
+		 * third argument but reliable offset calculation for NVRs is only 
possible
+		 * on the redzone because stack_depth of exception boundary is not known
+		 * while jitting the exception_cb program. So, rollback to an sp above
+		 * exception boundary frame and restore the additional NVRs using redzone
+		 * offset. The regular BPF JIT NVRs can be restored now, or in the 
epilogue
+		 * of exception_cb like any other bpf prog by reusing the BPF JIT 
NVRs part
+		 * of exception_boundary stack frame. The latter is preferred as 
exception
+		 * cb may also clobber the BPF JIT NVRs.
+		 */
+		EMIT(PPC_RAW_LD(_R1, _R5, 0));
+
+		/*
+		 * Recover additionally saved non volatile registers from stack
+		 * frame of exception boundary program.
+		 */
+		for (i = _R14; i <= _R25; i++)
+			EMIT(PPC_RAW_LD(i, _R1, bpf_jit_stack_offsetof(ctx, i, true)));
+	}
+
+	if (bpf_has_stack_frame(ctx)) {
  		/*
-		 * exception_cb uses boundary frame after stack walk.
-		 * It can simply use redzone, this optimization reduces
-		 * stack walk loop by one level.
-		 *
  		 * We need a stack frame, but we don't necessarily need to
  		 * save/restore LR unless we call other functions
  		 */
@@ -257,11 +279,11 @@ void bpf_jit_build_prologue(u32 *image, struct 
codegen_context *ctx)
  	 * Program acting as exception boundary pushes R14..R25 in addition to
  	 * BPF callee-saved non volatile registers. Exception callback uses
  	 * the boundary program's stack frame, recover additionally saved
-	 * registers in epilogue of exception callback.
+	 * registers in prologue of exception callback.
  	 */
  	if (ctx->exception_boundary) {
  		for (i = _R14; i <= _R25; i++)
-			EMIT(PPC_RAW_STD(i, _R1, bpf_jit_stack_offsetof(ctx, i)));
+			EMIT(PPC_RAW_STD(i, _R1, bpf_jit_stack_offsetof(ctx, i, false)));
  	}

  	if (!ctx->exception_cb) {
@@ -273,17 +295,11 @@ void bpf_jit_build_prologue(u32 *image, struct 
codegen_context *ctx)
  		for (i = BPF_REG_6; i <= BPF_REG_10; i++)
  			if (ctx->exception_boundary || bpf_is_seen_register(ctx, 
bpf_to_ppc(i)))
  				EMIT(PPC_RAW_STD(bpf_to_ppc(i), _R1,
-					bpf_jit_stack_offsetof(ctx, bpf_to_ppc(i))));
+					bpf_jit_stack_offsetof(ctx, bpf_to_ppc(i), false)));

  		if (ctx->exception_boundary || ctx->arena_vm_start)
  			EMIT(PPC_RAW_STD(bpf_to_ppc(ARENA_VM_START), _R1,
-				 bpf_jit_stack_offsetof(ctx, bpf_to_ppc(ARENA_VM_START))));
-	} else {
-		/*
-		 * Exception callback receives Frame Pointer of boundary
-		 * program(main prog) as third arg
-		 */
-		EMIT(PPC_RAW_MR(_R1, _R5));
+				 bpf_jit_stack_offsetof(ctx, bpf_to_ppc(ARENA_VM_START), false)));
  	}

  	/*
@@ -305,20 +321,12 @@ static void bpf_jit_emit_common_epilogue(u32 
*image, struct codegen_context *ctx
  	/* Restore NVRs */
  	for (i = BPF_REG_6; i <= BPF_REG_10; i++)
  		if (ctx->exception_cb || bpf_is_seen_register(ctx, bpf_to_ppc(i)))
-			EMIT(PPC_RAW_LD(bpf_to_ppc(i), _R1, bpf_jit_stack_offsetof(ctx, 
bpf_to_ppc(i))));
+			EMIT(PPC_RAW_LD(bpf_to_ppc(i), _R1,
+					bpf_jit_stack_offsetof(ctx, bpf_to_ppc(i), false)));

  	if (ctx->exception_cb || ctx->arena_vm_start)
  		EMIT(PPC_RAW_LD(bpf_to_ppc(ARENA_VM_START), _R1,
-				bpf_jit_stack_offsetof(ctx, bpf_to_ppc(ARENA_VM_START))));
-
-	if (ctx->exception_cb) {
-		/*
-		 * Recover additionally saved non volatile registers from stack
-		 * frame of exception boundary program.
-		 */
-		for (i = _R14; i <= _R25; i++)
-			EMIT(PPC_RAW_LD(i, _R1, bpf_jit_stack_offsetof(ctx, i)));
-	}
+				bpf_jit_stack_offsetof(ctx, bpf_to_ppc(ARENA_VM_START), false)));

  	/* Tear down our stack frame */
  	if (bpf_has_stack_frame(ctx)) {

- Hari

