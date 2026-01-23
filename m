Return-Path: <linuxppc-dev+bounces-16238-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id vDo7HC91c2nbvwAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16238-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jan 2026 14:18:39 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A4CB762A9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jan 2026 14:18:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dyJQy63Jwz2xdY;
	Sat, 24 Jan 2026 00:18:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769174314;
	cv=none; b=WMRkX1E9LOFgeGR/RDrBsNPX0940tYTRGZLeLRFCtF2qWNmWy0anW5PEJE0VquFcgRYE0azrNI9Oc0KkhDYdiJ/twHt0nMFW052ILO8adGSV/n8wUU8BLPvQmry/RzME7cliRsYK7SYEEZ3W7WgFpXUAzenZdLUTD/Ym9NRgIyoyL76LYlpfLJZU+xRBxwOnSn9mRuL5lztzJXXJUZtre1oomoaLYCTF8oc/pRVtzfwx7NbO/kZT0CIsbDU6sN/nGzDjO7SDs7bDXqfHsLQoJQaSLFwZHn29jSJdAVXiN1Vx+kJ/iujokj5V4MAkAigTXHWKfEA1+7iA+mRjrKk96A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769174314; c=relaxed/relaxed;
	bh=gHWv12A8Rwtfmk9fkYlXoxMiX6wio5VUiEJpUX3KQVE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BJu6+EmmiAyODzutZACWh1AMgNRbCAfqe2KeQGNv8uduJS1PWQ7xR6CqF+8gHIE0YOc5GQ7/vhhOEK8uF9Qwqo640Ba77qANTHJoQvDcsa3hkKJfIGuQ0WpXrTcTnuAkmzVc5RgvlbpoeUMM03utM+JpcHNkb6nFyn1xcVT4egH0UgpfQUBgeiJ1bABX4KKocH3Lr02cexSeAHUwGJ1yYlzjrsEzBqn25N8nYZWlCrjPoFPFM/tcNuxEDV+Ty3a6anQrsfX7PtIseL9F2f9SIXpljYp1XxeiOJqelJf7wTPM/GyJarm4we/y27zOQvPadtB+/cq01LalCS3JxVpdwg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XiJNlOD8; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XiJNlOD8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dyJQx3Lggz2xHt
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Jan 2026 00:18:32 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 60N2ViAl022452;
	Fri, 23 Jan 2026 13:18:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=gHWv12
	A8Rwtfmk9fkYlXoxMiX6wio5VUiEJpUX3KQVE=; b=XiJNlOD8anlJAbJZJd7Qrw
	/CcDMVMiYjwX/ZkYqUlJ0MO8K3aVmkBRxxn8oWSqkc9Vth5g9Xll1s3AIfAtHsJb
	dyrHUEaM+uMm59u8bdH4SCsi04tP4xZsqxb8T9Tj0sb/EP8dsW7q+vCxYDPIq07h
	pCQs0UHvhNJ88LU95EwrQ4Swi8FH14Nqwb3XrApRqkmEZimpASTtUZ9KwIESFMFf
	mxSLlwqKRWqrqM9sZWCIEJmvHqjb0zxz/9eEntJc2sFQPQBLWBljMXMpfu3vj0i0
	2AQd+zbs4h7m7uQfrgRzB5ipXDFA5yV3YTUzv2f9tqbZlQUa8tup8kPwcnzRpquQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bt612jnv4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Jan 2026 13:18:04 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 60NDI34Q014813;
	Fri, 23 Jan 2026 13:18:03 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bt612jnux-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Jan 2026 13:18:03 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 60NDBuK6024583;
	Fri, 23 Jan 2026 13:18:02 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4brxas7h4r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Jan 2026 13:18:02 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 60NDHw7044499212
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 23 Jan 2026 13:17:58 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7EA0520043;
	Fri, 23 Jan 2026 13:17:58 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A5FD720040;
	Fri, 23 Jan 2026 13:17:52 +0000 (GMT)
Received: from [9.78.106.105] (unknown [9.78.106.105])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 23 Jan 2026 13:17:52 +0000 (GMT)
Message-ID: <b35dab8c-7e6b-4b7a-ac77-b85e33051e95@linux.ibm.com>
Date: Fri, 23 Jan 2026 18:47:51 +0530
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
Subject: Re: [PATCH v4 6/6] powerpc64/bpf: Additional NVR handling for
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
References: <20260122211854.5508-7-adubey@linux.ibm.com>
 <e63a916bd44b8352aace4fd47fdeb459dc75cceb71615f44e6234cc1b6ffbd69@mail.kernel.org>
Content-Language: en-US
From: Hari Bathini <hbathini@linux.ibm.com>
In-Reply-To: <e63a916bd44b8352aace4fd47fdeb459dc75cceb71615f44e6234cc1b6ffbd69@mail.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: FverhG7n2ipJFykCroDbxcgwoNg173KD
X-Authority-Analysis: v=2.4 cv=LaIxKzfi c=1 sm=1 tr=0 ts=6973750c cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=a6oNqCRM0GkQNCNu6D0A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: IUP3nXrbXDeNT2c92xXTVbhi32ZFiBxO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDEwOSBTYWx0ZWRfX+60DBRAuh8jH
 bTu2r3OmvZNtZ8b29pApv4prW+AjbbMPcAafdvV9LOcm3tn2B81sd5rt8XtgJjgmiAyYABH5c0F
 YbbuuE7qGr5pLi5moCEgBWI5yaYnCKfmhfrg5Gmo6eM2f+rKJa0kNZRbMl508gBNY78qRgTt12q
 iLBa43vZVwKN+t8XlLdcEVpN10LXgDdo1nVzqOjoegmtyJTMQRGm3VN5vbAjOB9d86DZvWKK2dQ
 BOe3mcXT79QmkQxFc5oq2hBCDDZYNUmzTB4a6F1pc/oM+AnMmoSELwAeJ1dSrw6V7kYfMDjtwuQ
 d8Hu/HaxB2LjFx3ImZTefCgEW0gkROtRUgpxrnJpKtYIyqnWvE8H63NPjt3cFD2d/nvmf3Rc6HY
 W3n5pCfF64g3gTQ5Z/4ocdgsTURYy+3yuiYHb3AibLmgpiH4PTaTZ3NPaFJii9Ifa5ls9HutBZi
 ezV/L4lpcGFrDsFH2ow==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-23_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2601150000 definitions=main-2601230109
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
	TAGGED_FROM(0.00)[bounces-16238-lists,linuxppc-dev=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.473];
	TAGGED_RCPT(0.00)[linuxppc-dev,bpf-ci];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.ibm.com:mid]
X-Rspamd-Queue-Id: 8A4CB762A9
X-Rspamd-Action: no action



On 23/01/26 3:10 am, bot+bpf-ci@kernel.org wrote:
>> diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
>> index c284a12fce6e..98780a15fc69 100644
>> --- a/arch/powerpc/net/bpf_jit_comp64.c
>> +++ b/arch/powerpc/net/bpf_jit_comp64.c
> 
> [ ... ]
> 
>> @@ -125,9 +149,19 @@ int bpf_jit_stack_tailcallinfo_offset(struct codegen_context *ctx)
>>
>>   static int bpf_jit_stack_offsetof(struct codegen_context *ctx, int reg)
>>   {
>> -	if (reg >= BPF_PPC_NVR_MIN && reg < 32)
>> +	int min_valid_nvreg = BPF_PPC_NVR_MIN;
>> +	/* Default frame size for all cases except exception boundary */
>> +	int frame_nvr_size = BPF_PPC_STACKFRAME;
>> +
>> +	/* Consider all nv regs for handling exceptions */
>> +	if (ctx->exception_boundary || ctx->exception_cb) {
>> +		min_valid_nvreg = _R14;
>> +		frame_nvr_size = BPF_PPC_EXC_STACKFRAME;
>> +	}
>> +
>> +	if (reg >= min_valid_nvreg && reg < 32)
>>   		return (bpf_has_stack_frame(ctx) ?
>> -			(BPF_PPC_STACKFRAME + ctx->stack_size) : 0)
>> +			(frame_nvr_size + ctx->stack_size) : 0)
>>   				- (8 * (32 - reg)) - BPF_PPC_TAILCALL;
> 
> For the redzone case (no stack frame) with exception_boundary, this
> formula computes R23 at offset -80 and R24 at offset -72 from R1.
> 
> However, bpf_stf_barrier() uses hardcoded offsets -80(1) and -72(1) to
> temporarily save R21 and R22 during STF barrier execution:
> 
>      asm (
>      "	bpf_stf_barrier:		;"
>      "		std	21,-80(1)	;"
>      "		std	22,-72(1)	;"
>      "		sync			;"
>      "		ld	21,-80(1)	;"
>      "		ld	22,-72(1)	;"
>      ...
>      );
> 
> When an exception_boundary program without its own stack frame executes a
> memory load that triggers STF_BARRIER_FALLBACK, can bpf_stf_barrier()
> corrupt the saved R23 and R24 values? The hardcoded offsets would overlap
> with the extended NVR save area.
> 
> If exception_cb later restores these registers, it would get R21/R22 values
> instead of the original R23/R24 values.
> 
That is practically not possible as exception_boundary would mean
at least bpf_throw() is in the program (SEEN_FUNC) and SEEN_FUNC
would setup a frame for the exception_boundary program. Also, 
bpf_stf_barrier() always uses the redzone. So, it never stomps
on the stack of exception_boundary program...

@abhishek, better add the above comment and probably
also make bpf_has_stack_frame() return true explicitly for
exception_boundary as well (though SEEN_FUNC can't be false
in case of exception_boundary)..

- Hari

