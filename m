Return-Path: <linuxppc-dev+bounces-17150-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mNzHBBapnmntWgQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17150-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Feb 2026 08:47:34 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE47193AFD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Feb 2026 08:47:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fLRWk189tz3dPs;
	Wed, 25 Feb 2026 18:47:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772005650;
	cv=none; b=JtGOrXTKBcfxXYLCAcW65Z+BeB233HnO1VDHQj6rsLZH+2QQcldIKPhweN8MyfGY7EtTciWvgVMqd/o6h2LsK7LeObvTdXUtakVoixFDK2v3E1n6bk7xyk9Lv/rLe0aEtZybDXVHppHWeQfxCdVjn8b7KJli0gLzE7tWFJB9N5hHMRPue+Yfe+kgliuxT8lwR9bryWlUmFjmzTEcrfxrxf8VwNHCvIvxBKvnBupt/xsrfs0OBO2tR73dGyjnOWhw+X8fPU2p8CTNLtS4cVErt9gfN+q3/z1rdCbkmPov4SzTXaHVALJIDIURQ6RZkVZUUMiYnJUQ76e3bVYD2Dk9xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772005650; c=relaxed/relaxed;
	bh=d1bXe+YZJukwpe334qIRVVA3qbpmzBuCIUTLT5KqR1o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UwMTTDkEeddqVYp8hp0R+nmu6cdUkBADVOuS30Sa/zKgHEcnAAki+pUMd6YC7Xmpg6euTesE3Oc//+3Xffig5GBL3yaYUG6dJjMpxwzf0plAuK7ywums/DB323XouBQugunHB2ZZZ1HAd7kXfSv8VUvtoqXV5qqC0Zelig4H2UTCCM4G+ndbrrIb6DqVevIcbynFYNtZQNEdrZ7h71hBheyyYeYUHXQ06Tz/2qCafcT4AO7C3blCEcZbWECkNQX+ykBiMe6sqAHmi4wBab8rQjZWa7gyOtlZqLotY2d4JSvclBhMev/1kzGK3u8ZWJbPXkCND0peTx18krwIHe9ZhQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UBiqe4Jv; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UBiqe4Jv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fLRWj0CcCz3dLS
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Feb 2026 18:47:28 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61OJWgZP2347063;
	Wed, 25 Feb 2026 07:46:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=d1bXe+
	YZJukwpe334qIRVVA3qbpmzBuCIUTLT5KqR1o=; b=UBiqe4Jvy07djaZq7EEzfv
	9a/pUthbCLWxZyBFoa4ywhjVo+RE3tpswVGEpGFXclhLVf7NdX/fnBiZ2gL4LYBk
	OyPF1YyDl945UeoPgP005soOpS/Vwxn24ajonDZUh4kC8nA2PE+k71WMhJlsA3Ux
	OF0SQYd9AV29j/mHUpIylrUq5smn8QT8SdYR+ZIJfJPCS+le1tDIIv9mrtJqzfhW
	O2Lr69pxkCOUZVotA2h8KLyjFbJXBBjoHrpzbIz1pc0jP8BHG8YCCq0fhP1e/t/+
	FpylegVBMOtcVMQryaofelIXqtf2Ks1Wmsomt6saVDGjYSrrlRCsLuvw/bTX1HpA
	==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ch858mkqk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Feb 2026 07:46:58 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 61P4H3fo027797;
	Wed, 25 Feb 2026 07:46:57 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4cfsr1v3u9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Feb 2026 07:46:56 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 61P7krm57864644
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Feb 2026 07:46:53 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 26B902004B;
	Wed, 25 Feb 2026 07:46:53 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8D23620040;
	Wed, 25 Feb 2026 07:46:45 +0000 (GMT)
Received: from [9.124.223.55] (unknown [9.124.223.55])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 25 Feb 2026 07:46:45 +0000 (GMT)
Message-ID: <120884b0-0b09-43a9-b0f6-7dc2affe1ac0@linux.ibm.com>
Date: Wed, 25 Feb 2026 13:16:44 +0530
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
Subject: Re: [PATCH 04/15] powerpc/time: Prepare to stop elapsing in
 dynticks-idle
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Frederic Weisbecker <frederic@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Anna-Maria Behnsen <anna-maria@linutronix.de>,
        Ben Segall <bsegall@google.com>, Boqun Feng <boqun.feng@gmail.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Heiko Carstens <hca@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        Joel Fernandes <joelagnelf@nvidia.com>,
        Juri Lelli <juri.lelli@redhat.com>,
        Kieran Bingham <kbingham@kernel.org>, Mel Gorman <mgorman@suse.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Paul E . McKenney"
 <paulmck@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Sven Schnelle <svens@linux.ibm.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Uladzislau Rezki <urezki@gmail.com>,
        Valentin Schneider <vschneid@redhat.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Xin Zhao <jackzxcui1989@163.com>, linux-pm@vger.kernel.org,
        linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
References: <20260206142245.58987-1-frederic@kernel.org>
 <20260206142245.58987-5-frederic@kernel.org>
 <9413517d-963b-4e6d-b11b-b440acd7cb5a@linux.ibm.com>
 <9ab1e7d7-57ee-49f9-963c-3a1b96dda684@kernel.org>
Content-Language: en-US
From: Shrikanth Hegde <sshegde@linux.ibm.com>
In-Reply-To: <9ab1e7d7-57ee-49f9-963c-3a1b96dda684@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDA3NCBTYWx0ZWRfX5zL8nlc3Tkin
 WFP3VRrkGibb7X4+XFy6DJdpJSRGWFJ1dWNfbFAYy8rXwU6bmmiNFKp3HD+XdclwfASH84hP8aT
 vT+bCqxZifm5okjgmfBNqzV/t3pqtiyPu1Q64jd+AqX5SydlxkK04BgJLGB2yFOp3FkFbf8zbO9
 G7vgrq3Sf2991tZre15QhAao+rrZTiTurqtYWHJIJkwcpOeg/tW6rAwfB0js6N25UTi2dut26k6
 xp8/upN5ts5+5C+ICu8qYpENvDnq/3q4RV1C44h9ObFPuGPIjRRSkOrr++zusTLLy6vq4PX945r
 JDiVBlurD2kalIYQGBQm7hlUddeX1y5FdJSaXmH0f1Lh8W9jHr1ZNCeUlLoRU7pi0gEY10g5Q67
 QwxhBGMAJ5RVbPPw3IAH9an7bpEf3hUKBwlNDByiFH7VnimlT0bUuS6F60xQ7RM9XO0Yw9xgPFl
 6YNOEsjXcyfmEVsE6zA==
X-Proofpoint-GUID: W_fCjhEa7lyx7huGXmAwSIvtcFXEtHaw
X-Authority-Analysis: v=2.4 cv=S4HUAYsP c=1 sm=1 tr=0 ts=699ea8f2 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8
 a=VnNF1IyMAAAA:8 a=WUffXJQcQjR-2s-BLAsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: nL94bN1xdGzMzsg1sXV_icGzGDZcPqGR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_03,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 impostorscore=0 malwarescore=0 bulkscore=0
 phishscore=0 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602250074
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17150-lists,linuxppc-dev=lfdr.de];
	FORGED_SENDER(0.00)[sshegde@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[kernel.org,linux.ibm.com,linutronix.de,google.com,gmail.com,arm.com,redhat.com,siemens.com,nvidia.com,suse.de,ellerman.id.au,infradead.org,goodmis.org,linaro.org,163.com,vger.kernel.org,lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[35];
	FORGED_RECIPIENTS(0.00)[m:chleroy@kernel.org,m:frederic@kernel.org,m:linux-kernel@vger.kernel.org,m:maddy@linux.ibm.com,m:rafael@kernel.org,m:agordeev@linux.ibm.com,m:anna-maria@linutronix.de,m:bsegall@google.com,m:boqun.feng@gmail.com,m:borntraeger@linux.ibm.com,m:dietmar.eggemann@arm.com,m:hca@linux.ibm.com,m:mingo@redhat.com,m:jan.kiszka@siemens.com,m:joelagnelf@nvidia.com,m:juri.lelli@redhat.com,m:kbingham@kernel.org,m:mgorman@suse.de,m:mpe@ellerman.id.au,m:neeraj.upadhyay@kernel.org,m:npiggin@gmail.com,m:paulmck@kernel.org,m:peterz@infradead.org,m:rostedt@goodmis.org,m:svens@linux.ibm.com,m:tglx@linutronix.de,m:urezki@gmail.com,m:vschneid@redhat.com,m:gor@linux.ibm.com,m:vincent.guittot@linaro.org,m:viresh.kumar@linaro.org,m:jackzxcui1989@163.com,m:linux-pm@vger.kernel.org,m:linux-s390@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,linux.ibm.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[sshegde@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ibm.com:+];
	NEURAL_HAM(-0.00)[-0.969];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 0EE47193AFD
X-Rspamd-Action: no action

Hi Christophe,

On 2/24/26 9:11 PM, Christophe Leroy (CS GROUP) wrote:
> Hi Hegde,
> 
> Le 19/02/2026 à 19:30, Shrikanth Hegde a écrit :
>>
>>
>> On 2/6/26 7:52 PM, Frederic Weisbecker wrote:
>>> Currently the tick subsystem stores the idle cputime accounting in
>>> private fields, allowing cohabitation with architecture idle vtime
>>> accounting. The former is fetched on online CPUs, the latter on offline
>>> CPUs.
>>>
>>> For consolidation purpose, architecture vtime accounting will continue
>>> to account the cputime but will make a break when the idle tick is
>>> stopped. The dyntick cputime accounting will then be relayed by the tick
>>> subsystem so that the idle cputime is still seen advancing coherently
>>> even when the tick isn't there to flush the idle vtime.
>>>
>>> Prepare for that and introduce three new APIs which will be used in
>>> subsequent patches:
>>>
>>> _ vtime_dynticks_start() is deemed to be called when idle enters in
>>>    dyntick mode. The idle cputime that elapsed so far is accumulated.
>>>
>>> - vtime_dynticks_stop() is deemed to be called when idle exits from
>>>    dyntick mode. The vtime entry clocks are fast-forward to current time
>>>    so that idle accounting restarts elapsing from now.
>>>
>>> - vtime_reset() is deemed to be called from dynticks idle IRQ entry to
>>>    fast-forward the clock to current time so that the IRQ time is still
>>>    accounted by vtime while nohz cputime is paused.
>>>
>>> Also accumulated vtime won't be flushed from dyntick-idle ticks to avoid
>>> accounting twice the idle cputime, along with nohz accounting.
>>>
>>> Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
>>
>> Reviewed-by: Shrikanth Hegde <sshegde@linux.ibm.com>
>>
>>> ---
>>>   arch/powerpc/kernel/time.c | 41 ++++++++++++++++++++++++++++++++++++++
>>>   include/linux/vtime.h      |  6 ++++++
>>>   2 files changed, 47 insertions(+)
>>>
>>> diff --git a/arch/powerpc/kernel/time.c b/arch/powerpc/kernel/time.c
>>> index 4bbeb8644d3d..18506740f4a4 100644
>>> --- a/arch/powerpc/kernel/time.c
>>> +++ b/arch/powerpc/kernel/time.c
>>> @@ -376,6 +376,47 @@ void vtime_task_switch(struct task_struct *prev)
>>>           acct->starttime = acct0->starttime;
>>>       }
>>>   }
>>> +
>>> +#ifdef CONFIG_NO_HZ_COMMON
>>> +/**
>>> + * vtime_reset - Fast forward vtime entry clocks
>>> + *
>>> + * Called from dynticks idle IRQ entry to fast-forward the clocks to 
>>> current time
>>> + * so that the IRQ time is still accounted by vtime while nohz 
>>> cputime is paused.
>>> + */
>>> +void vtime_reset(void)
>>> +{
>>> +    struct cpu_accounting_data *acct = get_accounting(current);
>>> +
>>> +    acct->starttime = mftb();
>>
>> I figured out why those huge values happen.
>>
>> This happens because mftb is from when the system is booted.
>> I was doing kexec to start the new kernel and mftb wasn't getting
>> reset.
>>
>> I thought about this. This is concern for pseries too, where LPAR's
>> restart but system won't restart and mftb will continue to run instead of
>> reset.
>>
>> I think we should be using sched_clock instead of mftb here.
>> Though we need it a few more places and some cosmetic changes around it.
>>
>> Note: Some values being huge exists without series for few CPUs, with 
>> series it
>> shows up in most of the CPUs.
>>
>> So I am planning send out fix below fix separately keeping your
>> series as dependency.
>>
>> ---
>>   arch/powerpc/include/asm/accounting.h |  4 ++--
>>   arch/powerpc/include/asm/cputime.h    | 14 +++++++-------
>>   arch/powerpc/kernel/time.c            | 22 +++++++++++-----------
>>   3 files changed, 20 insertions(+), 20 deletions(-)
>>
>> diff --git a/arch/powerpc/include/asm/accounting.h b/arch/powerpc/ 
>> include/asm/accounting.h
>> index 6d79c31700e2..50f120646e6d 100644
>> --- a/arch/powerpc/include/asm/accounting.h
>> +++ b/arch/powerpc/include/asm/accounting.h
>> @@ -21,8 +21,8 @@ struct cpu_accounting_data {
>>       unsigned long steal_time;
>>       unsigned long idle_time;
>>       /* Internal counters */
>> -    unsigned long starttime;    /* TB value snapshot */
>> -    unsigned long starttime_user;    /* TB value on exit to usermode */
>> +    unsigned long starttime;    /* Time value snapshot */
>> +    unsigned long starttime_user;    /* Time value on exit to 
>> usermode */
>>   #ifdef CONFIG_ARCH_HAS_SCALED_CPUTIME
>>       unsigned long startspurr;    /* SPURR value snapshot */
>>       unsigned long utime_sspurr;    /* ->user_time when ->startspurr 
>> set */
>> diff --git a/arch/powerpc/include/asm/cputime.h b/arch/powerpc/ 
>> include/ asm/cputime.h
>> index aff858ca99c0..eb6b629b113f 100644
>> --- a/arch/powerpc/include/asm/cputime.h
>> +++ b/arch/powerpc/include/asm/cputime.h
>> @@ -20,9 +20,9 @@
>>   #include <asm/time.h>
>>   #include <asm/param.h>
>>   #include <asm/firmware.h>
>> +#include <linux/sched/clock.h>
>>
>>   #ifdef __KERNEL__
>> -#define cputime_to_nsecs(cputime) tb_to_ns(cputime)
>>
>>   /*
>>    * PPC64 uses PACA which is task independent for storing accounting 
>> data while
>> @@ -44,20 +44,20 @@
>>    */
>>   static notrace inline void account_cpu_user_entry(void)
>>   {
>> -    unsigned long tb = mftb();
>> +    unsigned long now = sched_clock();
> 
> Now way !
> 
> By doing that you'll kill performance for no reason. All we need when 
> accounting time spent in kernel or in user is the difference between 
> time at entry and time at exit, no mater what the time was at boot time.
> 

No. With this patch there will not be any performance difference.
All it does is, instead of using mftb uses sched_clock at those places.


In arch/powerpc/kernel/time.c we have sched_clock().
notrace unsigned long long sched_clock(void)
{
         return mulhdu(get_tb() - boot_tb, tb_to_ns_scale) << tb_to_ns_shift;
}

It does the same mftb call, and accounts only the time after boot, which is
what /proc/stat should do as well.

"
the amount of time, measured in units of USER_HZ
(1/100ths of a second on most architectures

user   (1) Time spent in user mode.

idle   (4) Time spent in the idle task.  This value
        should be USER_HZ times the second entry in
        the /proc/uptime pseudo-file.
"
/proc/uptime is based on sched_clock, so i infer /proc/stat also should show
values w.r.t to boot of the OS.


> Also sched_clock() returns nanoseconds which implies calculation from 
> timebase. This is pointless CPU consumption. The current implementation 
> calculates nanoseconds at task switch when calling vtime_flush().Your 
> change will now do it at every kernel entry and kernel exit by calling 
> sched_clock().

This change doesn't add any additional paths. Even without patches, mftb would have
been called in every kernel entry/exit.  See mftb usage account_cpu_user_exit/enter

Now instead of mftb sched_clock is used, that's all. No additional entry/exit points.
And previously when accounting we would have done cputime_to_nsecs, now that conversion
is done automatically in sched_clock. So overall computation-wise it should be same.

What i am missing to see it here?

> 
> Another point is that sched_clock() returns a long long not a long.

Thanks for pointing that out.

Ok. Let me change some of those variables into unsigned long long.
Compiler didn't warn me, so i didn't see it.

> 
> And also sched_clock() uses get_tb() which does mftb and mftbu. Which is 
> pointless for calculating time deltas unless your application spends 
> hours without being re-scheduled.
> 

I didn't get this. At current also, we use mftb, that functionality should be the same.
Could you please explain how?

> 
>>       struct cpu_accounting_data *acct = raw_get_accounting(current);
>>
>> -    acct->utime += (tb - acct->starttime_user);
>> -    acct->starttime = tb;
>> +    acct->utime += (now - acct->starttime_user);
>> +    acct->starttime = now;
>>   }
>>
>>   static notrace inline void account_cpu_user_exit(void)
>>   {
>> -    unsigned long tb = mftb();
>> +    unsigned long now = sched_clock();
>>       struct cpu_accounting_data *acct = raw_get_accounting(current);
>>
>> -    acct->stime += (tb - acct->starttime);
>> -    acct->starttime_user = tb;
>> +    acct->stime += (now - acct->starttime);
>> +    acct->starttime_user = now;
>>   }
>>
>>   static notrace inline void account_stolen_time(void)
>> diff --git a/arch/powerpc/kernel/time.c b/arch/powerpc/kernel/time.c
>> index 18506740f4a4..fb67cdae3bcb 100644
>> --- a/arch/powerpc/kernel/time.c
>> +++ b/arch/powerpc/kernel/time.c
>> @@ -215,7 +215,7 @@ static unsigned long vtime_delta(struct 
>> cpu_accounting_data *acct,
>>
>>       WARN_ON_ONCE(!irqs_disabled());
>>
>> -    now = mftb();
>> +    now = sched_clock();
>>       stime = now - acct->starttime;
>>       acct->starttime = now;
>>
>> @@ -299,9 +299,9 @@ static void vtime_flush_scaled(struct task_struct 
>> *tsk,
>>   {
>>   #ifdef CONFIG_ARCH_HAS_SCALED_CPUTIME
>>       if (acct->utime_scaled)
>> -        tsk->utimescaled += cputime_to_nsecs(acct->utime_scaled);
>> +        tsk->utimescaled += acct->utime_scaled;
>>       if (acct->stime_scaled)
>> -        tsk->stimescaled += cputime_to_nsecs(acct->stime_scaled);
>> +        tsk->stimescaled += acct->stime_scaled;
>>
>>       acct->utime_scaled = 0;
>>       acct->utime_sspurr = 0;
>> @@ -321,28 +321,28 @@ void vtime_flush(struct task_struct *tsk)
>>       struct cpu_accounting_data *acct = get_accounting(tsk);
>>
>>       if (acct->utime)
>> -        account_user_time(tsk, cputime_to_nsecs(acct->utime));
>> +        account_user_time(tsk, acct->utime);
>>
>>       if (acct->gtime)
>> -        account_guest_time(tsk, cputime_to_nsecs(acct->gtime));
>> +        account_guest_time(tsk, acct->gtime);
>>
>>       if (IS_ENABLED(CONFIG_PPC_SPLPAR) && acct->steal_time) {
>> -        account_steal_time(cputime_to_nsecs(acct->steal_time));
>> +        account_steal_time(acct->steal_time);
>>           acct->steal_time = 0;
>>       }
>>
>>       if (acct->idle_time)
>> -        account_idle_time(cputime_to_nsecs(acct->idle_time));
>> +        account_idle_time(acct->idle_time);
>>
>>       if (acct->stime)
>> -        account_system_index_time(tsk, cputime_to_nsecs(acct->stime),
>> +        account_system_index_time(tsk, acct->stime,
>>                         CPUTIME_SYSTEM);
>>
>>       if (acct->hardirq_time)
>> -        account_system_index_time(tsk, cputime_to_nsecs(acct- 
>>  >hardirq_time),
>> +        account_system_index_time(tsk, acct->hardirq_time,
>>                         CPUTIME_IRQ);
>>       if (acct->softirq_time)
>> -        account_system_index_time(tsk, cputime_to_nsecs(acct- 
>>  >softirq_time),
>> +        account_system_index_time(tsk, acct->softirq_time,
>>                         CPUTIME_SOFTIRQ);
>>
>>       vtime_flush_scaled(tsk, acct);
>> @@ -388,7 +388,7 @@ void vtime_reset(void)
>>   {
>>       struct cpu_accounting_data *acct = get_accounting(current);
>>
>> -    acct->starttime = mftb();
>> +    acct->starttime = sched_clock();
>>   #ifdef CONFIG_ARCH_HAS_SCALED_CPUTIME
>>       acct->startspurr = read_spurr(acct->starttime);
>>   #endif
> 

PS: I measured the performance with hackbench. I don't see any degradation.


