Return-Path: <linuxppc-dev+bounces-14692-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E65CADC4F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 08 Dec 2025 17:36:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dQ70R6kQ4z2xrC;
	Tue, 09 Dec 2025 03:36:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765211783;
	cv=none; b=cJRnId5Xvnm5C48FwdvDMXMxG5JmbAV+JMaoO1LFJaUzWGLKpAxk/hP/AQ+6UaYvQGEF19FIcqlJoP+g3TU/6Ff9ktthD9JsUgnG6RFZ2EOrbuRXgDtD6pOTBaw9M+6VjYtYv/gMvXHmSnUf7ip2X9Gh7Cq1gny9fp5w/JuBgmO0LBvNV7L0Ini9xG7xdFOPtEFzii3XRXxNKSe0izSAKSM6vETsJF58sDojSn4XvlpRODsqQJK3+72qVkJ1Uhq+VZO1hpIgdLJ70i9pzAIf/gjS77kZPSJUTNLi2iBEvhJhh3NL0y7si1mvSg5TWUsrHb2U5LM8a8lVAa9ESt2VtA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765211783; c=relaxed/relaxed;
	bh=e3eIChwSuwWgy6GE4OQOcLb+VywABhBwwWbuVsEmPOw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l3faBJDXxjcqml30sJJQCTzCUfPGP2FCcltt44psxXQ8g2s5PLfHKrAZFKz82ChM0QNrWRKAgDSJvc6MVHIdiR4XyX8YOz5+0NcTALJv8ApWevpeUC9HAe+JnDmBWU31QLq7sHnLcstrqgX31dNnJMYCpDAAU44FtGyd+zeK69i/1hhOE3jCq4MJmXoYu78nR8fuk/vVwjOUd+Ze/qJg8VGoZgatFSsWZ7XGOXzAT8vEB+gTzCaMCdfpNFksHX1LmnOrzSmUyWZTY82esUnQviJYdYYBeUfrBknkyj2yj+pLKkEF7jyXE2+Geug1L4IFi657sft3jLkVV+IHEyN8CQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JfCXLG9l; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JfCXLG9l;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dQ70Q1H5Nz2xFS
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 Dec 2025 03:36:21 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5B883t4J031236;
	Mon, 8 Dec 2025 16:35:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=e3eICh
	wSuwWgy6GE4OQOcLb+VywABhBwwWbuVsEmPOw=; b=JfCXLG9luLEQyuk2flqLwU
	VPLSkQ8UYmif9gEy3uytbinIq9hsN/jMwwp/B5Fcyo1Ot2ywWrvFhYvIkgsRXui8
	LMXAm5PYW/gUJhtaylBYrQIw5E/8v8AMwVXhg2feYufWzt53/FELV7F2ttmC4PWu
	o6tXkWtfzL9z2m9hK3qKjCqhj//bTitvcOyUQ4NglbI7AI67faH4Pmj1ulIXmwVC
	lfHcscd6pdA2cS3kOfLGRQm59vAsfjiQIlJCc8VZpRLi9LMSKpAxFyCmiHVTxG7q
	GHnwIrzHchOI7yUK/Bd1rCbE7maZgkWeQ8jpO8uCeTmjC5a9tI5rR5cBxSiZse3A
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4avc618r8h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Dec 2025 16:35:53 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5B8GQm8q002455;
	Mon, 8 Dec 2025 16:35:53 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4avc618r8f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Dec 2025 16:35:52 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5B8Eh8TW028123;
	Mon, 8 Dec 2025 16:35:51 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4avy6xpqyu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Dec 2025 16:35:51 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5B8GZnnD60031444
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 8 Dec 2025 16:35:49 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 968B72004B;
	Mon,  8 Dec 2025 16:35:49 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CA12020040;
	Mon,  8 Dec 2025 16:35:45 +0000 (GMT)
Received: from [9.43.1.23] (unknown [9.43.1.23])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  8 Dec 2025 16:35:45 +0000 (GMT)
Message-ID: <e34ddd05-d926-4eb4-b861-4bf8fd5635bb@linux.ibm.com>
Date: Mon, 8 Dec 2025 22:05:44 +0530
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
 <79946463-4742-4919-9d56-927a0a6f1c7c@linux.ibm.com>
 <nuinyo7o7uniemqqmoboctwrkkwkuv77nt7yk6td6eb3x43hv2@2lukfuvcmcko>
Content-Language: en-US
From: Hari Bathini <hbathini@linux.ibm.com>
In-Reply-To: <nuinyo7o7uniemqqmoboctwrkkwkuv77nt7yk6td6eb3x43hv2@2lukfuvcmcko>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA2MDAyMCBTYWx0ZWRfX9U2KbdGZ/LCC
 JOjlrLWWTsixmht3mI0hbyMr73SiF8T4VBqS934bvJozgzXIG9hLpfbmgI5EZ4XNn75Pv6x3P+V
 uipZqh3xvmpRN7lw9OIhWDgWhlnpvomPUNrMXaZwWoOyyTxr55wntz33MjCtOkZ/axksMtj7IUp
 tPULqxBEF0eMCUJlnm9mql8gV6g68sTs9P02OVNf1Niwha+yJYgit+DlomxvLnef6Q2pRJvloIt
 mxSzwt9KczRq47Wh1glc9LxKMyJ5l739xzBOKHIXYMj+FDUj3Mfac0TttMRQGHePqwohwOiUSXo
 c7a6H5T7CjH3GUIINmXxnNrdLD10MlKFl5xPGC/KNoBHDO11P6GtMzUmv3YpJsU7Tcy1j6jP2C9
 IvL6enxk8iooG/hhtTomhNsGwFAhNg==
X-Proofpoint-GUID: eceSSM85vtVc9Swark3NlheFqQRPVYLn
X-Proofpoint-ORIG-GUID: Xz4BH_e4YtKkpsZ2KZVlvpNoDMQcbkWY
X-Authority-Analysis: v=2.4 cv=O/U0fR9W c=1 sm=1 tr=0 ts=6936fe69 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=ytJgG1wrisC3aVGMN-IA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1011 phishscore=0
 suspectscore=0 adultscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2512060020
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Thanks for the review, Naveen.
I was on leave for sometime and could not look into it in a while
after that.

On 15/10/25 11:48 am, Naveen N Rao wrote:
> On Fri, Oct 10, 2025 at 12:47:21PM +0530, Hari Bathini wrote:
>>
>>
>> On 09/10/25 4:57 pm, Naveen N Rao wrote:
>>> On Thu, Oct 09, 2025 at 11:19:45AM +0530, Hari Bathini wrote:
>>>>
>>>>
>>>> On 08/10/25 1:43 pm, Naveen N Rao wrote:
>>>>> On Mon, Oct 06, 2025 at 06:50:20PM +0530, Hari Bathini wrote:
>>>>>>
>>>>>>
>>>>>> On 06/10/25 1:22 pm, Naveen N Rao wrote:
>>>>>>> On Fri, Oct 03, 2025 at 12:57:54AM +0530, Hari Bathini wrote:
>>>>>>>> Today, livepatch takes precedence over direct_call. Instead, save the
>>>>>>>> state and make direct_call before handling livepatch.
>>>>>>>
>>>>>>> If we call into the BPF trampoline first and if we have
>>>>>>> BPF_TRAMP_F_CALL_ORIG set, does this result in the BPF trampoline
>>>>>>> calling the new copy of the live-patched function or the old one?
>>>>>>
>>>>>> Naveen, calls the new copy of the live-patched function..
>>>>>
>>>>> Hmm... I'm probably missing something.
>>>>>
>>>>> With ftrace OOL stubs, what I recall is that BPF trampoline derives the
>>>>> original function address from the OOL stub (which would be associated
>>>>> with the original function, not the livepatch one).
>>>>
>>>> Trampoline derives the address from LR.
>>>
>>> Does it? I'm referring to BPF_TRAMP_F_CALL_ORIG handling in
>>> __arch_prepare_bpf_trampoline().
>>
>>
>>> LR at BPF trampoline entry points at
>>> the ftrace OOL stub. We recover the "real LR" pointing to the function
>>> being traced from there so that we can call into it from within the BPF
>>> trampoline.
>>
>> Naveen, from the snippet in livepatch_handler code shared below,
>> the LR at BPF trmapoline entry points at the 'nop' after the call
>> to trampoline with 'bnectrl cr1' in the updated livepatch_handler.
>>
>> Mimic'ing ftrace OOL branch instruction in livepatch_handler
>> with 'b	1f' (the instruction after nop) to ensure the trmapoline
>> derives the real LR to '1f' and jumps back into the livepatch_handler..
>>
>> +       /* Jump to the direct_call */
>> +       bnectrl cr1
>> +
>> +       /*
>> +        * The address to jump after direct call is deduced based on ftrace
>> OOL stub sequence.
>> +        * The seemingly insignificant couple of instructions below is to
>> mimic that here to
>> +        * jump back to the livepatch handler code below.
>> +        */
>> +       nop
>> +       b       1f
>> +
>> +       /*
>> +        * Restore the state for livepatching from the livepatch stack.
>> +        * Before that, check if livepatch stack is intact. Use r0 for it.
>> +        */
>> +1:     mtctr   r0
> 
> Ah, so you are faking a ftrace OOL stub here. But, won't this mean that

Yeah.

> bpf_get_func_ip() won't return the function address anymore?

Right. I do agree it can have issues in some scenarios.

> 
> One of the other thoughts I had was if we could stuff the function
> address into the ftrace OOL stub. I had considered this back when I
> implemented the OOL stubs, but didn't do it due to the extra memory
> requirement. However, given the dance we're having to do, I'm now
> thinking that may make sense and can simplify the code. If we can also
> hook into livepatch, then we should be able to update the function
> address in the stub to point to the new address and the trampoline
> should then "just work" since it already saves/restores the TOC [We may
> additionally have to update the function IP in _R12, but that would be a
> minor change overall]
> 
> We will still need a way to restore livepatch TOC if the BPF trampoline
> doesn't itself call into the function, but we may be able to handle that
> if we change the return address to jump to a stub that restores the TOC
> from the livepatch stack.

Sounds doable. Looking into a couple of other things at the moment
though. Will try out this suggestion and get back post that.
Having said that, your thoughts on whether the current approach
is a viable option if bpf_get_func_ip() can be fixed somehow?

- Hari

