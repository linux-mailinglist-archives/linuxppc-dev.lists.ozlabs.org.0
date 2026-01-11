Return-Path: <linuxppc-dev+bounces-15522-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 36AEDD0F980
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Jan 2026 19:44:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dq4DX0hCJz2yN1;
	Mon, 12 Jan 2026 05:44:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768157067;
	cv=none; b=Rv/w/HBi67KfzQlROe7iF303gjpXd8P28M7VPfSYBv3YZZ6XeL+XU3/Q1o/q460Qb4MSCP0de0izgriHYSjJPCNw6CurAx1ZJIsEm2D8yO8oz4K7mHWNPVbJVAQtfKFjKAHEkJdNgoIuZMBB/Io23rabWN5l7egXSvpSCeUWkvqPWkF7z8oJu2cZuNkBM30WMSntbLMVGEkFWjKxd+bZNNsDslNJDBBrEVRSPadDOIqrdwm+ib+lIocQP2FNOQ9bGiyGexZItOlz0TOC1OUi2bENjc5qRpGrwWkjQcrkaJIq9YcvNNSJtqqzWi3ZG90nuESWwDhMk/ycIbJHGN6smg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768157067; c=relaxed/relaxed;
	bh=4E/veOnYUJg19tqlhN7S29P/tWOVYXD7tshyyPLlWU4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZXsNwoa+4W40rtGToYcw0NBFaFYE175ksmn7B34R2R4NukIwUngGlF23dIHo+wyoLKO+3/LFPyT+wVc7RH6GXBBIHx9F5la29Sw4lPFZLiQLYvWz/KnW3s63VHGQ1Nruvmcnjcsky7wZc+qUNtdp0ZYFhRulzJi3g0vJX4XafJTQkcddg8Be1ZJp/tMocPXEp5RgS7qz1Nf0n9IKd+ERTLeIQhmzBrNUtiKFZr8JNrDtNCLvNUrAW4tfLAMudmtF/6awcRMmX4aT6jZXil0CxUss2g6JYoieJoZ2i+KpIPdA2CNBkthfTbYnjdM1Q3pywcQPrjUyETENAuEX+bOFfA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KvzfPYUP; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KvzfPYUP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dq4DT3XJGz2yKp
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Jan 2026 05:44:24 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 60B4F7AT001684;
	Sun, 11 Jan 2026 18:43:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=4E/veO
	nYUJg19tqlhN7S29P/tWOVYXD7tshyyPLlWU4=; b=KvzfPYUPDl/0oIg/1rUqlU
	3bcqj1BP8ofqwFJPheNXWN1VFjHAhfyMsJThHovAVEC1fxsJqhNVUYtjqAyoI2fk
	5cWmFqardfMawcLwpHvnBzbte2Vbf4hWNdW6Ru3QwS3+hnpqdNj41GwovvBtlpvj
	h1zLdK4auDw6P+wbPpMWt0L+TI6/TcjwP0WNgdgG+aNdKDdCEwMl0Rl3b6s27sWO
	CUlbZ3vOUchw45+fPAaYqS0wg6SY7ipfrQCjosO8cKTLxTQNagXYO2DGWd0Y8dBD
	mLUEan2YdGLfHXwBl/EQ6HsR0gsRPRkC0gi/MQ6Mux4fW5sb5VANyUUd3ZxnXGVw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bkeg44d4n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 11 Jan 2026 18:43:29 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 60BIhSil002697;
	Sun, 11 Jan 2026 18:43:29 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bkeg44d4h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 11 Jan 2026 18:43:28 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 60BEhpQU031250;
	Sun, 11 Jan 2026 18:43:27 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4bm3t1aapp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 11 Jan 2026 18:43:27 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 60BIhNoL54198696
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 11 Jan 2026 18:43:24 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C754D20043;
	Sun, 11 Jan 2026 18:43:23 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D333220040;
	Sun, 11 Jan 2026 18:43:17 +0000 (GMT)
Received: from [9.43.37.142] (unknown [9.43.37.142])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun, 11 Jan 2026 18:43:17 +0000 (GMT)
Message-ID: <24d8437d-3227-4abd-a31b-e6f03f4d7414@linux.ibm.com>
Date: Mon, 12 Jan 2026 00:13:16 +0530
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
Subject: Re: [PATCH 2/6] powerpc64/bpf: Tailcall handling with trampolines
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
References: <20260105105212.136645-3-adubey@linux.ibm.com>
 <655a960bb1b98cf56777481bd84ce53c2a17e527a8230edf9ad7523e98cce565@mail.kernel.org>
Content-Language: en-US
From: Hari Bathini <hbathini@linux.ibm.com>
In-Reply-To: <655a960bb1b98cf56777481bd84ce53c2a17e527a8230edf9ad7523e98cce565@mail.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTExMDE2OSBTYWx0ZWRfX/4etHatfZqhM
 HPuVxsLruTUOYPwp5KrfIJrb0gvjUYtEvx+dxwFI3Pp3JIa8H1dCB6cmMOiaBjwHg7IJyd6B9Ie
 HLVBJ9NocPQMgSuzzWeOgYK1PZPb1u5LzwhsoqUCxCoF4dxBjUE8RoS6j6uZOfrrLZVQ0Du2ea8
 e6YaIln5nzSOrU9K8AYdjUWuNDgu4H3SDgr2i3HWjbWsz41omqlm7qafasemg2G3NiPKxhpnqsC
 XXRXLwremKPoSucKLQehZQVymcAk7+gSOAP9Caz5k23gOxh9sFrZMej9ah39c0qGHVKRa2AcYrA
 6NsYsqhn/qHreb7UglwWmaD8B461tEwwce3ELfTPPYpxkPJtqHZ31JAVuy2Hcc9OO1Iebzn5GY5
 KzgGqyzICEXstFocnkNao05CoojKr0pYUvP9iRPlMFMRhW3pyp09gtC4Xc03Q3Uq1eomQwTp3gR
 9uBv4NZFuLGwMkQPjIA==
X-Proofpoint-ORIG-GUID: WyaYviypZ-Hql3b69_ji-yXJCJxKElKm
X-Authority-Analysis: v=2.4 cv=B/60EetM c=1 sm=1 tr=0 ts=6963ef51 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=qd48AjYRKxYDT3Iv1msA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: hAJ1JxaWMfoY_e0HRGFdt5logLPYWCj1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-11_07,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0 impostorscore=0
 malwarescore=0 phishscore=0 adultscore=0 clxscore=1011 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2512120000 definitions=main-2601110169
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 05/01/26 4:45 pm, bot+bpf-ci@kernel.org wrote:
>> diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/bpf_jit_comp.c
>> index 069a8822c30d..4aaa0a287a45 100644
>> --- a/arch/powerpc/net/bpf_jit_comp.c
>> +++ b/arch/powerpc/net/bpf_jit_comp.c
> 
> [ ... ]
> 
>> -static void bpf_trampoline_setup_tail_call_cnt(u32 *image, struct codegen_context *ctx,
>> -					       int func_frame_offset, int r4_off)
>> +static void bpf_trampoline_setup_tail_call_info(u32 *image, struct codegen_context *ctx,
>> +					       int func_frame_offset,
>> +					       int bpf_dummy_frame_size, int r4_off)
>>   {
>>   	if (IS_ENABLED(CONFIG_PPC64)) {
>>   		/* See bpf_jit_stack_tailcallinfo_offset() */
>> -		int tailcallcnt_offset = 7 * 8;
>> +		int tailcallinfo_offset = BPF_PPC_STACK_SAVE + SZL;
> 
> [ ... ]
> 
>> +		EMIT(PPC_RAW_STL(_R3, _R1, func_frame_offset
>> +				- bpf_dummy_frame_size - tailcallinfo_offset));
>                                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> 
> The new setup function stores tail_call_info at offset
> (func_frame_offset - bpf_dummy_frame_size - tailcallinfo_offset) from R1.
> Since func_frame_offset = bpf_dummy_frame_size + bpf_frame_size, this
> resolves to (bpf_frame_size - 56), which is a positive offset from R1.

With this patchset, back propagation of tail call count is not needed
anymore, as tail call count is saved only at one place and all 
subsequent uses only hold the pointer to it. So, I can't think of a
good reason to restore tailcall count. Restore can be skipped?

@abhishek, a comment explaining how tailcall count/pointer is being
setup would help here...

Also, the trampoline frame has increased by as much as the size of
the redzone for bpf program. We are doing that just to keep tailcall
info at the same offset. No reason to save the NVRs in this frame
though. I suggest to adjust the stack layout to have tailcall info
as the first doubleword in the redzone instead of being the (n+1)th
doubleword after n NVRs. Saves stack space and makes tailcall info
offset calculation simpler.

- Hari

