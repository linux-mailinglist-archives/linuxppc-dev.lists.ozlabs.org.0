Return-Path: <linuxppc-dev+bounces-5437-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B61BA17CDC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jan 2025 12:17:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ycl6c0lbNz2yFB;
	Tue, 21 Jan 2025 22:17:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737458248;
	cv=none; b=P8HwKJ7UCXgFl9ADy5Vs9bj9f9kk+JgG4bDmfmfQUU8NHVXbcUSYJVzyjMf3i3/Xw6DLrSSnBmoG4c+dznFbOhLOalBZ8e8IynxoyCwwxbUmKQ1iMdfQKbTCs7p2DpRlnIQlOIVxGfxU6VzrH9Vz3xCcOTNg+Dgyx/DO7YImlqN0pZifzMTRDmo/tqduB9VnJT1YB3AhZIQQyjX5t/XCMzrV7d6kVnb3jf1vS7iLg534ioqYbnMJMjz1LnRGoNMV+hxqkvhi5eRPEikBMJxCOG3qoPDwZGTcptN8a83/2Jf6wdty2drj1OBP3t/hvW0JCob18cswQn4PhHLcNXpOYw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737458248; c=relaxed/relaxed;
	bh=Cb+mnUp1tDIT1wUVxeIQnVC/+vobfGVaa+Zvf7QcHvY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nP6qYQfCykgQawM/vfjJMxtYle2ly/PCN+j/3iDl+YGwO3BbREJb7d2dRvG6R54YenUI2X8Oc4c3DKt6W0Ogn0HXeajVkVJpsVN/h7tE8pIFbafsuLYRvlDlHsNl80FcHWOWz2O9SUOuK5NnACpIwcCsLtzGaPcY61iBVYUj+xO9VW8BiEBp7zcvjeXrFDRxTupEsX9Kjlka4NvrRHZ/aUbc2IH+w3YUubcMQanbbYZP/2x2pxYGJxR3g5TBJuE/OqWmlcOT58ImXZD5lVlCRPdyLkER25D4SjW3ClLsVEhT8VVJvlcTglhBn5jUbVIc2PP5qOtg+e0xSopeJxd6Nw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=b6keoxN2; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=b6keoxN2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ycl6Z2G5nz2yDH
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jan 2025 22:17:25 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50L4KhuS014635;
	Tue, 21 Jan 2025 11:13:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=Cb+mnU
	p1tDIT1wUVxeIQnVC/+vobfGVaa+Zvf7QcHvY=; b=b6keoxN2vM2TDcSOEbFGAV
	NbMaYURjnXNGeZT5vXuQVyquUoq2s4kjI3Gcq9El+In9e93l98hIUEy6lCjor4Jq
	ysbjrBlpPCPrDSOh8/3nZ7fYuVTddyqJhVW0HrtHpzc1/m3yl2Ilh6It9JNisiDP
	js+qVn3Wm7XUVKpKYRWE2UW565PPGuvCCs38la94Gp7KNpWAsJ7eKKN6pIMqu3Jx
	iSv4dkvLkFI7M86cLjdXkz959xjnpvZMfxSoE6p0LCXcRoD5jS16xlFV9UEQqDNb
	s2xBYNDiykTdHwJjK2C0bUyTqQ/yran/e4n4WxLV7I2tPBXUmJcHndk7iVPtfc9Q
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 449sat4380-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jan 2025 11:13:53 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 50LAxC95008018;
	Tue, 21 Jan 2025 11:13:53 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 449sat437w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jan 2025 11:13:53 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50L7eUxS032248;
	Tue, 21 Jan 2025 11:13:52 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 448rujjjms-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jan 2025 11:13:52 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com [10.39.53.232])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50LBDpSL6488704
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 21 Jan 2025 11:13:51 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6E72A58059;
	Tue, 21 Jan 2025 11:13:51 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E66495805D;
	Tue, 21 Jan 2025 11:13:42 +0000 (GMT)
Received: from [9.43.71.201] (unknown [9.43.71.201])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 21 Jan 2025 11:13:42 +0000 (GMT)
Message-ID: <70dc8099-e725-4069-9b3a-af31578278e2@linux.ibm.com>
Date: Tue, 21 Jan 2025 16:43:39 +0530
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
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] powerpc: properly negate error in
 syscall_set_return_value()
To: "Dmitry V. Levin" <ldv@strace.io>,
        Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Alexey Gladkov <legion@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Eugene Syromyatnikov <evgsyr@gmail.com>,
        Mike Frysinger <vapier@gentoo.org>, Renzo Davoli <renzo@cs.unibo.it>,
        Davide Berardi <berardi.dav@gmail.com>, strace-devel@lists.strace.io,
        Nicholas Piggin <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20250113171054.GA589@strace.io>
 <6558110c-c2cb-4aa3-9472-b3496f71ebb8@csgroup.eu>
 <20250114170400.GB11820@strace.io>
 <d249e9e2-511a-46af-bd6e-397812b67058@csgroup.eu>
 <20250120171249.GA17320@strace.io>
Content-Language: en-US
From: Madhavan Srinivasan <maddy@linux.ibm.com>
In-Reply-To: <20250120171249.GA17320@strace.io>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: GCBA0hxG_lJipEZlbfLWZUfw0KnA0eQV
X-Proofpoint-ORIG-GUID: tSyCLZalsMRyNo_lRGv_2BXPVhPchd6f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-21_05,2025-01-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 bulkscore=0 phishscore=0
 clxscore=1011 impostorscore=0 mlxscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501210091
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



On 1/20/25 10:42 PM, Dmitry V. Levin wrote:
> On Mon, Jan 20, 2025 at 02:51:38PM +0100, Christophe Leroy wrote:
>> Le 14/01/2025 à 18:04, Dmitry V. Levin a écrit :
>>> On Mon, Jan 13, 2025 at 06:34:44PM +0100, Christophe Leroy wrote:
>>>> Le 13/01/2025 à 18:10, Dmitry V. Levin a écrit :
>>>>> Bring syscall_set_return_value() in sync with syscall_get_error(),
>>>>> and let upcoming ptrace/set_syscall_info selftest pass on powerpc.
>>>>>

Sorry for getting to this thread late.

Tried the series without this patch in 

1) power9 PowerNV system and in power10 pSeries lpar 

# ./set_syscall_info
TAP version 13
1..1
# Starting 1 tests from 1 test cases.
#  RUN           global.set_syscall_info ...
#            OK  global.set_syscall_info
ok 1 global.set_syscall_info
# PASSED: 1 / 1 tests passed.
# Totals: pass:1 fail:0 xfail:0 xpass:0 skip:0 error:0

and in both case set_syscall_info passes.
Will look at it further.

Maddy

>>>>> This reverts commit 1b1a3702a65c ("powerpc: Don't negate error in
>>>>> syscall_set_return_value()").
>>>>
>>>> There is a clear detailed explanation in that commit of why it needs to
>>>> be done.
>>>>
>>>> If you think that commit is wrong you have to explain why with at least
>>>> the same level of details.
>>>
>>> OK, please have a look whether this explanation is clear and detailed enough:
>>>
>>> =======
>>> powerpc: properly negate error in syscall_set_return_value()
>>>
>>> When syscall_set_return_value() is used to set an error code, the caller
>>> specifies it as a negative value in -ERRORCODE form.
>>>
>>> In !trap_is_scv case the error code is traditionally stored as follows:
>>> gpr[3] contains a positive ERRORCODE, and ccr has 0x10000000 flag set.
>>> Here are a few examples to illustrate this convention.  The first one
>>> is from syscall_get_error():
>>>          /*
>>>           * If the system call failed,
>>>           * regs->gpr[3] contains a positive ERRORCODE.
>>>           */
>>>          return (regs->ccr & 0x10000000UL) ? -regs->gpr[3] : 0;
>>>
>>> The second example is from regs_return_value():
>>>          if (is_syscall_success(regs))
>>>                  return regs->gpr[3];
>>>          else
>>>                  return -regs->gpr[3];
>>>
>>> The third example is from check_syscall_restart():
>>>          regs->result = -EINTR;
>>>          regs->gpr[3] = EINTR;
>>>          regs->ccr |= 0x10000000;
>>>
>>> Compared with these examples, the failure of syscall_set_return_value()
>>> to assign a positive ERRORCODE into regs->gpr[3] is clearly visible:
>>> 	/*
>>> 	 * In the general case it's not obvious that we must deal with
>>> 	 * CCR here, as the syscall exit path will also do that for us.
>>> 	 * However there are some places, eg. the signal code, which
>>> 	 * check ccr to decide if the value in r3 is actually an error.
>>> 	 */
>>> 	if (error) {
>>> 		regs->ccr |= 0x10000000L;
>>> 		regs->gpr[3] = error;
>>> 	} else {
>>> 		regs->ccr &= ~0x10000000L;
>>> 		regs->gpr[3] = val;
>>> 	}
>>>
>>> This fix brings syscall_set_return_value() in sync with syscall_get_error()
>>> and lets upcoming ptrace/set_syscall_info selftest pass on powerpc.
>>>
>>> Fixes: 1b1a3702a65c ("powerpc: Don't negate error in syscall_set_return_value()").
>>> =======
>>>
>>>
>>
>> I think there is still something going wrong.
>>
>> do_seccomp() sets regs->gpr[3] = -ENOSYS; by default.
>>
>> Then it calls __secure_computing() which returns what __seccomp_filter() 
>> returns.
>>
>> In case of error, __seccomp_filter() calls syscall_set_return_value() 
>> with a negative value then returns -1
>>
>> do_seccomp() is called by do_syscall_trace_enter() which returns -1 when 
>> do_seccomp() doesn't return 0.
>>
>> do_syscall_trace_enter() is called by system_call_exception() and 
>> returns -1, so syscall_exception() returns regs->gpr[3]
>>
>> In entry_32.S, transfer_to_syscall, syscall_exit_prepare() is then 
>> called with the return of syscall_exception() as first parameter, which 
>> leads to:
>>
>> 	if (unlikely(r3 >= (unsigned long)-MAX_ERRNO) && is_not_scv) {
>> 		if (likely(!(ti_flags & (_TIF_NOERROR | _TIF_RESTOREALL)))) {
>> 			r3 = -r3;
>> 			regs->ccr |= 0x10000000; /* Set SO bit in CR */
>> 		}
>> 	}
> 
> Note the "unlikely" keyword here reminding us once more that in !scv case
> regs->gpr[3] does not normally have -ERRORCODE form.
> 
>> By chance, because you have already changed the sign of gpr[3], the 
>> above test fails and nothing is done to r3, and because you have also 
>> already set regs->ccr it works.
>>
>> But all this looks inconsistent with the fact that do_seccomp sets 
>> -ENOSYS as default value
>>
>> Also, when do_seccomp() returns 0, do_syscall_trace_enter() check the 
>> syscall number and when it is wrong it goes to skip: which sets 
>> regs->gpr[3] = -ENOSYS;
> 
> It looks like do_seccomp() and do_syscall_trace_enter() get away by sheer
> luck, implicitly relying on syscall_exit_prepare() transparently fixing
> regs->gpr[3] for them.
> 
>> So really I think it is not in line with your changes to set positive 
>> value in gpr[3].
>>
>> Maybe your change is still correct but it needs to be handled completely 
>> in that case.
> 
> By the way, is there any reasons why do_seccomp() and
> do_syscall_trace_enter() don't use syscall_set_return_value() yet?
> 
> 


