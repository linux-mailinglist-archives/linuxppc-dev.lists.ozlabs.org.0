Return-Path: <linuxppc-dev+bounces-12769-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDAEABCBE4E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Oct 2025 09:19:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cjdQn2qGLz2xQD;
	Fri, 10 Oct 2025 18:19:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760080753;
	cv=none; b=OmzzKiBO5kxi4vO/rabyRmYqgMMpGEknyYjCSHms5yLiQo4tUmuCKFlOSBCm+F2vulDHJG13zPB2B00/SFQrDmTCaHoAdf+OHqxz7bEWkOy9VwZV3L2fwpqWmgtt4tBN+Je4tRYnc9wYQu89R1UZM42b3e/VoytALRkAv5L03Sk1YKI7zUM9YnnTM3ObeilSjrH2rl2R6Gmt6jGTO0Ygi5nnMI/l+xjRMjc9sgQmdGfBSRyqNg8fJ/TXcgeqWnsQtvHR68AjfHipwB7svfOUYAVRBv/NsQuL5MlPtmVmhtWopMGrUWcPTFCqZ1fBpw48jh3xu4zr/MiMQSFqj3LY3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760080753; c=relaxed/relaxed;
	bh=8NSNiFsBW58bMpvfBw6u6e82XSmQJRrNFyDoqKUgEsc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HCI/1KRO3ASv8fwVPjvePr+THYxxtpetBe1yjADMLHMlVdxXcYiFib+n8Q48VU6pNIO69Qh5qlpx1K6HGvzYuHwKzHq+pfThh8ULn1WIEqiGgtOHAH2e62MyAu2iRY7MxGv5zm2c3tin8J3U0U38W6WTA/7P3/IwiJWb58oXRRXZ/sseRXzZ32oL0bGe4TY1Fz2E8KJsYSXgxbW57dtqqvCgbLPxe2oJVWPdbHdyayheqoY++gRM5CEzdKb+7J7BjqKm0TUv9YfNuCX5xzzAiYbYk4ZhUATnbDQROsfz6ui16qVPil9ZdyEDfXzxpU5UugEr+5cMmiF9D4mE9K0WzA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SeM57uc8; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SeM57uc8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cjdQm2Nyvz2xPx
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Oct 2025 18:19:11 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 599JTYvg012205;
	Fri, 10 Oct 2025 07:17:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=8NSNiF
	sBW58bMpvfBw6u6e82XSmQJRrNFyDoqKUgEsc=; b=SeM57uc8bnAoZNCI9CTzrP
	wJ3mf6WRZD1xbN/V9Mk6cg5TI/q1z7ZTagbbrKY4dW8+hbKA4O2T2jWXCamHLn15
	boxTYcHL1aiX2qmLk0Zwz3siRTkZ/bTjRF8vu0KX/VdhD1RSCDrtYDJSMTEVe4H+
	S70t7nkoNzG3b69kH5CYk9fyTOpVrxeFJnN0lMo2mLBEz52zP8uyXl+lHG5e7y9U
	Uvy1mi9EwkA5oHeiWzVZr4DLHdj5GSyyFWL+kck0jkIaZ9609kxc3vD8I9CbIuWM
	v4SQX+GnGVvkjjZD7iWF43xwVC8TvDMGsmuGlVaaGFyuOzwxpLz2AjXeThKZEjIw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 49nv7yhaa4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Oct 2025 07:17:42 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 59A7Aceb025936;
	Fri, 10 Oct 2025 07:17:41 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 49nv7yha9y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Oct 2025 07:17:41 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 59A3bR1l020971;
	Fri, 10 Oct 2025 07:17:40 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 49nv9n0nbp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Oct 2025 07:17:40 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 59A7HcGO51183908
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Oct 2025 07:17:38 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CF75020204;
	Fri, 10 Oct 2025 07:17:26 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9D6C920206;
	Fri, 10 Oct 2025 07:17:22 +0000 (GMT)
Received: from [9.78.106.240] (unknown [9.78.106.240])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 10 Oct 2025 07:17:22 +0000 (GMT)
Message-ID: <79946463-4742-4919-9d56-927a0a6f1c7c@linux.ibm.com>
Date: Fri, 10 Oct 2025 12:47:21 +0530
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
Subject: Re: [PATCH] powerpc64/bpf: support direct_call on livepatch function
To: Naveen N Rao <naveen@kernel.org>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>, bpf@vger.kernel.org,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Andrii Nakryiko <andrii@kernel.org>, Song Liu <songliubraving@fb.com>,
        Jiri Olsa <jolsa@kernel.org>, Viktor Malik <vmalik@redhat.com>,
        live-patching@vger.kernel.org, Josh Poimboeuf <jpoimboe@kernel.org>,
        Joe Lawrence
 <joe.lawrence@redhat.com>,
        Jiri Kosina <jikos@kernel.org>, linux-trace-kernel@vger.kernel.org,
        Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Shung-Hsi Yu <shung-hsi.yu@suse.com>
References: <20251002192755.86441-1-hbathini@linux.ibm.com>
 <amwerofvasp7ssmq3zlrjakqj5aygyrgplcqzweno4ef42tiav@uex2ildqjvx2>
 <17f49a63-eccb-4075-91dd-b1f37aa762c7@linux.ibm.com>
 <unegysw3bihg32od7aham3npsdpm5govboo3uglorwsrjqfqfk@pbyzwwztmqtc>
 <42d72061-3d23-43db-bb02-d5f75333c924@linux.ibm.com>
 <dvvv5cytyak2iquer7d6g57ttum3qcckupyahsqsmvpzfjbyni@wbsr77swnrcl>
Content-Language: en-US
From: Hari Bathini <hbathini@linux.ibm.com>
In-Reply-To: <dvvv5cytyak2iquer7d6g57ttum3qcckupyahsqsmvpzfjbyni@wbsr77swnrcl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: pYLSquh4ZIkQZb5wIRM6lSn3LVYuqdhV
X-Proofpoint-ORIG-GUID: qHtgOYHeiHKhlNUjhBuOnuAh19VFb8xY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX6yj8xu1EemA4
 RvjxPaq881ftUtrEBrFFd6UU/nqT5VtIxgwqFfHn/TiKxXbt1sNYDAqQ0uEUDIojvMZ43wx/awU
 G2UuB1aW4fXCCFr6g9Q2SPqZfJsnLiEvScre/OWxoLqhiZokkjWImMq9GYElMf8Uj/PqmAlNjWq
 6VdzamwAzocAMTad0PFJptUiSb76JMXu9HvWDrsC9pPukpIUJCX4GxERqfunur2nIF1Dwqygqz1
 toszBQwqSgemd/WaVSnseQn3TAzy8mcVTLJPk9Z5syrekQNxCME9U7DNHOdaJuRCfZgkLqBfTaF
 I4wa6ZAvLx/g9g7EIGzWuh5D7BX4UZDpcWxGy4x4FiCFYQwdcPUwaKkLc59fH34bgZVyQorFKrP
 WHj9DgGBCRwCiDVZMgtdpEv0U7g92w==
X-Authority-Analysis: v=2.4 cv=FtwIPmrq c=1 sm=1 tr=0 ts=68e8b316 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=S1Tq6YvCFwAA3lmGF84A:9
 a=QEXdDO2ut3YA:10 a=nl4s5V0KI7Kw-pW0DWrs:22 a=pHzHmUro8NiASowvMSCR:22
 a=xoEH_sTeL_Rfw54TyV31:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-10_01,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 phishscore=0 spamscore=0
 bulkscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 09/10/25 4:57 pm, Naveen N Rao wrote:
> On Thu, Oct 09, 2025 at 11:19:45AM +0530, Hari Bathini wrote:
>>
>>
>> On 08/10/25 1:43 pm, Naveen N Rao wrote:
>>> On Mon, Oct 06, 2025 at 06:50:20PM +0530, Hari Bathini wrote:
>>>>
>>>>
>>>> On 06/10/25 1:22 pm, Naveen N Rao wrote:
>>>>> On Fri, Oct 03, 2025 at 12:57:54AM +0530, Hari Bathini wrote:
>>>>>> Today, livepatch takes precedence over direct_call. Instead, save the
>>>>>> state and make direct_call before handling livepatch.
>>>>>
>>>>> If we call into the BPF trampoline first and if we have
>>>>> BPF_TRAMP_F_CALL_ORIG set, does this result in the BPF trampoline
>>>>> calling the new copy of the live-patched function or the old one?
>>>>
>>>> Naveen, calls the new copy of the live-patched function..
>>>
>>> Hmm... I'm probably missing something.
>>>
>>> With ftrace OOL stubs, what I recall is that BPF trampoline derives the
>>> original function address from the OOL stub (which would be associated
>>> with the original function, not the livepatch one).
>>
>> Trampoline derives the address from LR.
> 
> Does it? I'm referring to BPF_TRAMP_F_CALL_ORIG handling in
> __arch_prepare_bpf_trampoline().


> LR at BPF trampoline entry points at
> the ftrace OOL stub. We recover the "real LR" pointing to the function
> being traced from there so that we can call into it from within the BPF
> trampoline.

Naveen, from the snippet in livepatch_handler code shared below,
the LR at BPF trmapoline entry points at the 'nop' after the call
to trampoline with 'bnectrl cr1' in the updated livepatch_handler.

Mimic'ing ftrace OOL branch instruction in livepatch_handler
with 'b	1f' (the instruction after nop) to ensure the trmapoline
derives the real LR to '1f' and jumps back into the livepatch_handler..

+       /* Jump to the direct_call */
+       bnectrl cr1
+
+       /*
+        * The address to jump after direct call is deduced based on 
ftrace OOL stub sequence.
+        * The seemingly insignificant couple of instructions below is 
to mimic that here to
+        * jump back to the livepatch handler code below.
+        */
+       nop
+       b       1f
+
+       /*
+        * Restore the state for livepatching from the livepatch stack.
+        * Before that, check if livepatch stack is intact. Use r0 for it.
+        */
+1:     mtctr   r0


I should probably improve my comments for better readability..

- Hari

