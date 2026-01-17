Return-Path: <linuxppc-dev+bounces-15936-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CDAAAD38DC2
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Jan 2026 11:34:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dtY4D1Rvtz309P;
	Sat, 17 Jan 2026 21:34:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768646060;
	cv=none; b=jYV/ttboo/sGXH2FSGGz8o7EdIhntUqX6pvbBug2kJIbUhMOYnOEqg2B6X1MVbdyvtXrhIQabAQEQ5Wyq+NnkPqNpMPqaVBpnPZyiZIXWvfrD63MUGc/vIESQZum+hAjDnkGuNilBHoM7VmEmwHrama0VEU3+cFlRMJIfERpn7CVJ3MjNI5o7+NhkjYORdjp0zs5LuReUUcjtN6LkLXawL0RXCJX79uKHf23ZRlzQN3SoFlpvJeDMZzcLoFOouJIlFkUeZVzNyF7SRx0zyFfEdfiLQdzSJCEhp67GnIoWeBHK9kkTYR62G8nzWDNrBBiWyqkJPhSo7TYLImoWKd4dA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768646060; c=relaxed/relaxed;
	bh=jfz96V8k6SSMjW81E9XKE7AhlPEOa1KiwbJI+Du/Lxk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hjSnhtgaWxkuHMrrC4KLIGmkQzyNIaZJHjcz85+yuT+xQdFN9aLzUevk9nzIM1EiDg6QszvlLfWjolZExt5zltN17iX6cxZ7iSOiGy1nU8DyIeyfSsAcA9bzHU8NbhvOUXpkopfpyJ1kukelVWtuxyEX2Nt+E2lgRW4iBCZ3cep2DrUK7LIJZnzMoiSEGF3bLBz76ktVGNh6Uk9514QDrjYwfnuB29aeJPOoOR1Js7OqMxEaMeSkXH51WfQ0zOhSD4zB71OgPgoAnfsZD8OWeh9KPbYw4sfv6R7E8cIAKJ6r6onxpNfxkZujm3OlzMKVf34WAVho/TsGN4yIRi6zVw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gQKF1MUw; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gQKF1MUw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dtY4C17vqz2xS2
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Jan 2026 21:34:18 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 60H9JW4I002346;
	Sat, 17 Jan 2026 10:33:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=jfz96V
	8k6SSMjW81E9XKE7AhlPEOa1KiwbJI+Du/Lxk=; b=gQKF1MUw4Xi6iV4ZiL7k4E
	qVqJy54/E68gid99cWcAFp4mx4IzJAklWu4fViOfxq97tUPUEfXiVCUy793Y0WXf
	zB6NVhqaUN4fdBqewLlq3GZi9gZvFefhfQAKPydybq63otus+JuJM7TmtfiDGN3g
	S5iKnTMwbAcaRNZCrBjHW7pMJB7JKYXHxgKnI0Za00oJvvI9o85WiOBWG7F5HaD3
	tirEwOG0VsYVJlkE6ZvnegG2u3bFjc/Cwr3NrhuHbGNviXNFZlTEr1SDda1kXGUM
	oRm+Ewmrrx9Gen4DAZRKvlK/hExsfYNH9eX2dUFPqf+GSVI1myBiwaHg3SDRlM1Q
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4br255gxj5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 17 Jan 2026 10:33:40 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 60HAXdUi026277;
	Sat, 17 Jan 2026 10:33:39 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4br255gxj3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 17 Jan 2026 10:33:39 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 60H5UhU6014083;
	Sat, 17 Jan 2026 10:33:38 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4bqv8utm14-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 17 Jan 2026 10:33:38 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 60HAXYMD22937992
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 17 Jan 2026 10:33:34 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BF41320043;
	Sat, 17 Jan 2026 10:33:34 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CBD8420040;
	Sat, 17 Jan 2026 10:33:28 +0000 (GMT)
Received: from [9.43.67.105] (unknown [9.43.67.105])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sat, 17 Jan 2026 10:33:28 +0000 (GMT)
Message-ID: <7c2b6544-8a40-418a-81d5-b74494a36944@linux.ibm.com>
Date: Sat, 17 Jan 2026 16:03:27 +0530
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
References: <20260105105212.136645-1-adubey@linux.ibm.com>
 <20260105105212.136645-3-adubey@linux.ibm.com>
Content-Language: en-US
From: Hari Bathini <hbathini@linux.ibm.com>
In-Reply-To: <20260105105212.136645-3-adubey@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE3MDA4NCBTYWx0ZWRfXwfQVznBx6oy6
 MuvGNjPyLKXQXbdIL2c7kq+kWBgf/j6PRXrpZIDcntlyK+KZkgGY3Vbi5pxra/d0V1CCZNomr4M
 H19dVc0L7DQhy0n4y3eeGN90BNh0ui8VePlfVIhQElhoglIrvrjvzP8tZQEFR1CwDnAuNdXHox7
 U2yy/ZMllDAKN/W8igSbLZuce5VkaGf2nIW1oH20CE1EtcCvs3UVxMDoiWrW4sE0z1VTwxfbeaH
 8kJOy0oyB7pvDbvjoT6FSHNIFkYtCsmU2MxDBmwKOGUbvQQ5IjGtd6MMtijC6Jzy4XcRz9Ig0k4
 8L59be+9E/En6BJ+PPNoJbWVE7KjuhgYAQQua2fTnOXkTbwBiRpRf0qJBRMJSxfRxoUQD+BTL1w
 /V9stI15fJ7DIruewuULMSvDRh9V0kzCcAZV99dIY2MeXrRS4LkJEQDIx6T9CrKlbyxnyb3txhw
 y/UuBvHMM3Mz1PJJSgA==
X-Authority-Analysis: v=2.4 cv=BpSQAIX5 c=1 sm=1 tr=0 ts=696b6584 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VnNF1IyMAAAA:8 a=v1dMKb2XkRFja0Z4mHIA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: Lv2punErfHDXv5-vECztRtoPeAYi2K7L
X-Proofpoint-ORIG-GUID: KPye0R8VwpD9Tmf02LIm7x4Eqc6UrH0E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_09,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2601150000
 definitions=main-2601170084
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 05/01/26 4:22 pm, adubey@linux.ibm.com wrote:
> From: Abhishek Dubey <adubey@linux.ibm.com>
> 
> The trampoline mechanism sets up its own stack frame and
> an additional dummy frame. We need to have additional JIT
> instructions handling tailcall dereferencing in the
> trampoline's context.
> 
> We don't add the two stack frames pointed above, rather
> add space for conventional 'non-volatile register save area'
> and tail_call_info in trampoline's frame for ppc64. This
> makes the trampoline's frame consistent with layout of all
> other frames.
> 
> Signed-off-by: Abhishek Dubey <adubey@linux.ibm.com>
> ---
>   arch/powerpc/net/bpf_jit_comp.c | 48 ++++++++++++++++++++++++++++-----
>   1 file changed, 42 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/bpf_jit_comp.c
> index 069a8822c30d..4aaa0a287a45 100644
> --- a/arch/powerpc/net/bpf_jit_comp.c
> +++ b/arch/powerpc/net/bpf_jit_comp.c
> @@ -606,15 +606,42 @@ static int invoke_bpf_mod_ret(u32 *image, u32 *ro_image, struct codegen_context
>   	return 0;
>   }
>   
> -static void bpf_trampoline_setup_tail_call_cnt(u32 *image, struct codegen_context *ctx,
> -					       int func_frame_offset, int r4_off)
> +/*
> + * Refer the label 'Generated stack layout' in this file for actual stack
> + * layout during trampoline invocation.
> + *
> + * Refer __arch_prepare_bpf_trampoline() for stack component details.
> + *
> + * The tailcall count/reference is present in caller's stack frame. Its required
> + * to copy the content of tail_call_info before calling the actual function
> + * to which the trampoline is attached.
> + *
> + */
> +
> +static void bpf_trampoline_setup_tail_call_info(u32 *image, struct codegen_context *ctx,
> +					       int func_frame_offset,
> +					       int bpf_dummy_frame_size, int r4_off)
>   {
>   	if (IS_ENABLED(CONFIG_PPC64)) {
>   		/* See bpf_jit_stack_tailcallinfo_offset() */
> -		int tailcallcnt_offset = 7 * 8;

This offset update should be part of patch#1

- Hari

