Return-Path: <linuxppc-dev+bounces-5447-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53034A17DC6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jan 2025 13:28:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YcmhY3trKz30B8;
	Tue, 21 Jan 2025 23:28:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737462509;
	cv=none; b=NSY/lGAwtHlilx4osQvtu/QFFXV4jFPJE8f16YHo7SpsEXp7QX6/62xHXqWl41NMituPQ/4ebzl7AquMfUtd38oEifE+4wvv1++m7a/cDG3CH/nejsFy0Ho2yObxPGSGMaaeKWWYDepNgNLAMVsTcEcEXohNX3G+y5cyQNXpjd/eag6apwK/Dj0nL1E2bHSZ5TREfA/U3tuwaM6gtq7H6EIcC30yg0Bm9wPWdd5FixFzrdO0qMg8GzwKJXYPA6R4zDBb7/cQF26JGZDfhO5HaMJ1KneOJLUS4G3FuFY9gZ0IBmFD1wRv64E2hWYyjJPRG2JS6hdAx9SaIHwPMTgqcw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737462509; c=relaxed/relaxed;
	bh=z61m1RfOdhzpoeZ6B/KRQ4uX6ZOveB9fSbhLddsM92w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H6UZc8xs7e2jZQNAkNLEonpMKL6iNHByoyEV/afL3/bUtSxUqa0fUB+jUHJfPb/LlhlGzfxuN6gMdvLh6tKRyzCYGkCqptVPbNuIzvb9tN3F0ackgLYd/ufEAk66GMmzEu/c1BYvjneoK9Z/+XDDeLWt3c4UGDja1nSAiYJzjXqz6XRm+J85FkXueO3MejFxezSNpsJXo6NJX7G0LodlyOyLqSDqVN1NCmVaKs1sdnLhoOLSTaHLRfcw637U9PW9Zs6bbQnMIqetAWXpBOj5SBR2wo4VxjBfXJK+jKE4lbFrVnPoNO9e0jspbxABCdauQpt+IOyUDWCYMRyq5AGf3w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YlyLwu0d; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YlyLwu0d;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YcmhX32XMz2yF7
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jan 2025 23:28:28 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50L5ZbFW004323;
	Tue, 21 Jan 2025 12:25:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=z61m1R
	fOdhzpoeZ6B/KRQ4uX6ZOveB9fSbhLddsM92w=; b=YlyLwu0dCCH5iCt9wUliPY
	Yq1/pTUhactGPUpHvTpTk9M3LrwJIXrlZhG+qYwZzmk87D72l4RiIiriYtSS2Wu5
	Rx/1jhPwSX0zD4NEwQnuIGnXIldIjFSN+RzBDcSPjfAVVf1Lps3vTRKwwVM0aP14
	o2wPSkCRzTDY0/5yY8CG2xZ/aSsYxK+PyJ+H5Txlqy0231XcduSVlKw4G+0oBUq0
	HYhbj7MUViwUO6w/Gqx6b7yC6KhGYxIqlzSq++vkuCl1rYTbGasKnb7wRD09SZfn
	/jO1a/2q+9+3ByF0tj3Wmi9yYThJ+M6xmzF80TNhj4W+tuFGjpwoGzafheFkqzbg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 449rrycnbn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jan 2025 12:25:55 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 50LCF8Om015168;
	Tue, 21 Jan 2025 12:25:54 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 449rrycnbh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jan 2025 12:25:54 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50LBOqAD021080;
	Tue, 21 Jan 2025 12:25:53 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([172.16.1.6])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 448sb1arxj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jan 2025 12:25:53 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com [10.39.53.232])
	by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50LCPqVe27591402
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 21 Jan 2025 12:25:53 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D8A4058043;
	Tue, 21 Jan 2025 12:25:52 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6D6A858053;
	Tue, 21 Jan 2025 12:25:44 +0000 (GMT)
Received: from [9.43.71.201] (unknown [9.43.71.201])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 21 Jan 2025 12:25:43 +0000 (GMT)
Message-ID: <697c1f59-80d7-4958-a8c1-e988f657d437@linux.ibm.com>
Date: Tue, 21 Jan 2025 17:55:40 +0530
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
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
        "Dmitry V. Levin" <ldv@strace.io>
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
 <70dc8099-e725-4069-9b3a-af31578278e2@linux.ibm.com>
 <70cb8e5b-7ee5-494a-a02a-ef286f8c970c@csgroup.eu>
Content-Language: en-US
From: Madhavan Srinivasan <maddy@linux.ibm.com>
In-Reply-To: <70cb8e5b-7ee5-494a-a02a-ef286f8c970c@csgroup.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: UugMaKypb99LIYGjdCKQyVqSXc3SBBl6
X-Proofpoint-ORIG-GUID: yKJLwD70BnuJXM5t4lAcmHNwXI1wimIz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-21_05,2025-01-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 bulkscore=0 mlxscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501210099
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



On 1/21/25 4:58 PM, Christophe Leroy wrote:
> 
> 
> Le 21/01/2025 à 12:13, Madhavan Srinivasan a écrit :
>>
>>
>> On 1/20/25 10:42 PM, Dmitry V. Levin wrote:
>>> On Mon, Jan 20, 2025 at 02:51:38PM +0100, Christophe Leroy wrote:
>>>> Le 14/01/2025 à 18:04, Dmitry V. Levin a écrit :
>>>>> On Mon, Jan 13, 2025 at 06:34:44PM +0100, Christophe Leroy wrote:
>>>>>> Le 13/01/2025 à 18:10, Dmitry V. Levin a écrit :
>>>>>>> Bring syscall_set_return_value() in sync with syscall_get_error(),
>>>>>>> and let upcoming ptrace/set_syscall_info selftest pass on powerpc.
>>>>>>>
>>
>> Sorry for getting to this thread late.
>>
>> Tried the series without this patch in
>>
>> 1) power9 PowerNV system and in power10 pSeries lpar
>>
>> # ./set_syscall_info
>> TAP version 13
>> 1..1
>> # Starting 1 tests from 1 test cases.
>> #  RUN           global.set_syscall_info ...
>> #            OK  global.set_syscall_info
>> ok 1 global.set_syscall_info
>> # PASSED: 1 / 1 tests passed.
>> # Totals: pass:1 fail:0 xfail:0 xpass:0 skip:0 error:0
>>
>> and in both case set_syscall_info passes.
>> Will look at it further.
> 
> I guess it works because power9/10 are using scv not sc for system call, hence using the new ABI ?
> 

yeah, I guess.
This is from the a Power8 pSeries lpar without this patch

# ./set_syscall_info 
TAP version 13
1..1
# Starting 1 tests from 1 test cases.
#  RUN           global.set_syscall_info ...
# set_syscall_info.c:428:set_syscall_info:wait #5: unexpected stop signal 11
# set_syscall_info: Test terminated by assertion
#          FAIL  global.set_syscall_info
not ok 1 global.set_syscall_info
# FAILED: 0 / 1 tests passed.
# Totals: pass:0 fail:1 xfail:0 xpass:0 skip:0 error:0

Maddy

> Christophe
> 
>>
>> Maddy
>>
>>>>>>> This reverts commit 1b1a3702a65c ("powerpc: Don't negate error in
>>>>>>> syscall_set_return_value()").
>>>>>>
>>>>>> There is a clear detailed explanation in that commit of why it needs to
>>>>>> be done.
>>>>>>
>>>>>> If you think that commit is wrong you have to explain why with at least
>>>>>> the same level of details.
>>>>>
>>>>> OK, please have a look whether this explanation is clear and detailed enough:
>>>>>
>>>>> =======
>>>>> powerpc: properly negate error in syscall_set_return_value()
>>>>>
>>>>> When syscall_set_return_value() is used to set an error code, the caller
>>>>> specifies it as a negative value in -ERRORCODE form.
>>>>>
>>>>> In !trap_is_scv case the error code is traditionally stored as follows:
>>>>> gpr[3] contains a positive ERRORCODE, and ccr has 0x10000000 flag set.
>>>>> Here are a few examples to illustrate this convention.  The first one
>>>>> is from syscall_get_error():
>>>>>           /*
>>>>>            * If the system call failed,
>>>>>            * regs->gpr[3] contains a positive ERRORCODE.
>>>>>            */
>>>>>           return (regs->ccr & 0x10000000UL) ? -regs->gpr[3] : 0;
>>>>>
>>>>> The second example is from regs_return_value():
>>>>>           if (is_syscall_success(regs))
>>>>>                   return regs->gpr[3];
>>>>>           else
>>>>>                   return -regs->gpr[3];
>>>>>
>>>>> The third example is from check_syscall_restart():
>>>>>           regs->result = -EINTR;
>>>>>           regs->gpr[3] = EINTR;
>>>>>           regs->ccr |= 0x10000000;
>>>>>
>>>>> Compared with these examples, the failure of syscall_set_return_value()
>>>>> to assign a positive ERRORCODE into regs->gpr[3] is clearly visible:
>>>>>     /*
>>>>>      * In the general case it's not obvious that we must deal with
>>>>>      * CCR here, as the syscall exit path will also do that for us.
>>>>>      * However there are some places, eg. the signal code, which
>>>>>      * check ccr to decide if the value in r3 is actually an error.
>>>>>      */
>>>>>     if (error) {
>>>>>         regs->ccr |= 0x10000000L;
>>>>>         regs->gpr[3] = error;
>>>>>     } else {
>>>>>         regs->ccr &= ~0x10000000L;
>>>>>         regs->gpr[3] = val;
>>>>>     }
>>>>>
>>>>> This fix brings syscall_set_return_value() in sync with syscall_get_error()
>>>>> and lets upcoming ptrace/set_syscall_info selftest pass on powerpc.
>>>>>
>>>>> Fixes: 1b1a3702a65c ("powerpc: Don't negate error in syscall_set_return_value()").
>>>>> =======
>>>>>
>>>>>
>>>>
>>>> I think there is still something going wrong.
>>>>
>>>> do_seccomp() sets regs->gpr[3] = -ENOSYS; by default.
>>>>
>>>> Then it calls __secure_computing() which returns what __seccomp_filter()
>>>> returns.
>>>>
>>>> In case of error, __seccomp_filter() calls syscall_set_return_value()
>>>> with a negative value then returns -1
>>>>
>>>> do_seccomp() is called by do_syscall_trace_enter() which returns -1 when
>>>> do_seccomp() doesn't return 0.
>>>>
>>>> do_syscall_trace_enter() is called by system_call_exception() and
>>>> returns -1, so syscall_exception() returns regs->gpr[3]
>>>>
>>>> In entry_32.S, transfer_to_syscall, syscall_exit_prepare() is then
>>>> called with the return of syscall_exception() as first parameter, which
>>>> leads to:
>>>>
>>>>     if (unlikely(r3 >= (unsigned long)-MAX_ERRNO) && is_not_scv) {
>>>>         if (likely(!(ti_flags & (_TIF_NOERROR | _TIF_RESTOREALL)))) {
>>>>             r3 = -r3;
>>>>             regs->ccr |= 0x10000000; /* Set SO bit in CR */
>>>>         }
>>>>     }
>>>
>>> Note the "unlikely" keyword here reminding us once more that in !scv case
>>> regs->gpr[3] does not normally have -ERRORCODE form.
>>>
>>>> By chance, because you have already changed the sign of gpr[3], the
>>>> above test fails and nothing is done to r3, and because you have also
>>>> already set regs->ccr it works.
>>>>
>>>> But all this looks inconsistent with the fact that do_seccomp sets
>>>> -ENOSYS as default value
>>>>
>>>> Also, when do_seccomp() returns 0, do_syscall_trace_enter() check the
>>>> syscall number and when it is wrong it goes to skip: which sets
>>>> regs->gpr[3] = -ENOSYS;
>>>
>>> It looks like do_seccomp() and do_syscall_trace_enter() get away by sheer
>>> luck, implicitly relying on syscall_exit_prepare() transparently fixing
>>> regs->gpr[3] for them.
>>>
>>>> So really I think it is not in line with your changes to set positive
>>>> value in gpr[3].
>>>>
>>>> Maybe your change is still correct but it needs to be handled completely
>>>> in that case.
>>>
>>> By the way, is there any reasons why do_seccomp() and
>>> do_syscall_trace_enter() don't use syscall_set_return_value() yet?
>>>
>>>
>>
> 


