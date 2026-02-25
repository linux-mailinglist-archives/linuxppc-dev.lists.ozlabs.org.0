Return-Path: <linuxppc-dev+bounces-17171-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KHTtNG3QnmnwXQQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17171-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Feb 2026 11:35:25 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B2FE195D31
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Feb 2026 11:35:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fLWFP4p2Dz3dng;
	Wed, 25 Feb 2026 21:35:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772015721;
	cv=none; b=GrRMyi3gfXiZqc5P4XhBtIofI5xv3+q2AdXbPzUq9vX8T89OyUHV/OiCzUUB67/IzArcDTp7etOfLwpvh2VrUnpPIacFsQV8DzOc6mUoQCAK5vLgMkpo+sg8thS43lIrNhh7wfToSATIy4PUulcsIhIZUxY+j/y/rl4w5JJ4ojZ8rc3djweKF76X8CIcybV38dTE/dfLWAjTy9VWWDyhswoQYfLZiWFFKjEfgB09p+Tx3HY0IXITnysjJKc+ERD5cf2K9anTqBPLun1Jgrvy8mCIsxC3LcSr9zAmpIK+kxECAPjEG7w++pGfe3F8EWRAbECfqhehN84Go3z7ADbm9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772015721; c=relaxed/relaxed;
	bh=e6mL9wG5hBiKht6Ojs2a0eK9zPQWHYYGut+jsFWSf1s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gwszz6LItaswrZBK8AYNWNhx8Y9MuCKW9v9B2zXTmiobE/U1aoC+OgEb3jm+f22arSbAMB6xMjZr13K1T282zrTYJxI/YcSxTjJqMYaZVOaLXFm4ui1b09DGvidi5BaGuiBB9jGoWwazUAiGOMjOeucNM9hvCSCjzGqQXxIF9qyGNRGa5IMwhPLmtfLboaysKWpcaxjR56QaCtPMtZ9XM1UKW3ApuXzmocRAeX3Hh9/8G4OFL3TFjVNfRqqYlR9P8CEhk5lObUh1yyZaGgrMJMiKD4rPNW9s1fLnQaPsjwTjcODwKED13FU6NoebD3e3sBlsyoIWAmC8civ2XIVWWQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kfxMhhCs; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kfxMhhCs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fLWFN270Nz3dhk
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Feb 2026 21:35:19 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61OKchnH2750096;
	Wed, 25 Feb 2026 10:34:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=e6mL9w
	G5hBiKht6Ojs2a0eK9zPQWHYYGut+jsFWSf1s=; b=kfxMhhCspr3L0UkaqjFtwf
	csvS03LdccE5butyY++mDvJPqDw4EMmQddhAxoLNufxjjymb62Uep0eaO0I5Jwsr
	AYKGDnhBQIShefpLAeM58UegdweEdU9m9vlZchMnfBop5zxTQIYOhenVnWu7446r
	H8FAM6HN8rOhfCIA7jrPreRrThvXTcFQAW4XBW0eHBzbwmPjygQPFcP+6zUpFelB
	umPMsW3NM41yxSCJwYkgbmWQzTjmJ9W6lBYvsNuXkPM3oAJ2+OBBmWGdKLNDicqO
	igI28pGvDMHbCeYKFHW6KHsAxX2cTd8AXeogqD1oDmbs+ycGaugDLeiR85vnTVqw
	==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4cf471yuab-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Feb 2026 10:34:57 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 61P7nmA0015750;
	Wed, 25 Feb 2026 10:34:56 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4cfq1sn16f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Feb 2026 10:34:56 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 61PAYqNs59703590
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Feb 2026 10:34:52 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 152DC20043;
	Wed, 25 Feb 2026 10:34:52 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9D6FE20040;
	Wed, 25 Feb 2026 10:34:46 +0000 (GMT)
Received: from [9.39.30.87] (unknown [9.39.30.87])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 25 Feb 2026 10:34:46 +0000 (GMT)
Message-ID: <a20beb34-0e4b-4063-b6b0-6c5886bbb971@linux.ibm.com>
Date: Wed, 25 Feb 2026 16:04:45 +0530
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
 <120884b0-0b09-43a9-b0f6-7dc2affe1ac0@linux.ibm.com>
 <55720b5b-f643-4e67-8841-d81a9e712faf@kernel.org>
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <55720b5b-f643-4e67-8841-d81a9e712faf@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: QDDPAUCb8499caYrFfY1nvv-Hkfeh5Bl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDA5OSBTYWx0ZWRfXzMpn/3TDNT6w
 V6+iUGhNdvRl/CdCsynFp12pJSKPOWZiXWmYE8IzdM6TIJVK1abYuCpHqmcNSp8EtMm+vQE5+dg
 iWCmcOqEmi8pv5bVpTMeCqNYDgv+fJx31I9bEZsMrcEYr1gywBMfN69EIM3RKmOUgsGO1nX2UIY
 yqVwSlSM23XD50JcCkiLoHs3zTJs9bvcldMVj6zQX+TyVlS7RVkEm3XH68xy74O0HSc+w7hTyTM
 5INnn5Foy1T2S0he4VTvCnoogtDtb7h0R6BoDWtV7Y3G9CrUcLTY7DVV9mGc8O+FXPS1ETq3y6W
 t2ckob9fNO+XCceZy+YUtWGLAQQDmj9TxHep1xEA/7u+lIEpt3yM8aBy1MLgYlTTzzIrGzcgBZ5
 P7c5N7deISmv7Ryg8ll9EDjG1tKlHroSB0CZhu4O1sMnenDdiNNVJanDVNB6s3pmZQiwdb36aWv
 AIgk0LKD6UsmfVOigcw==
X-Authority-Analysis: v=2.4 cv=R7wO2NRX c=1 sm=1 tr=0 ts=699ed051 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8
 a=VnNF1IyMAAAA:8 a=N8oYV1VUXeJbLZ80LbcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: qb3GfPlWGaTSmmChQEBthJqg9TVS0JDn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_03,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 phishscore=0 spamscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602250099
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
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17171-lists,linuxppc-dev=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.977];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 7B2FE195D31
X-Rspamd-Action: no action

Hi Christophe.

On 2/25/26 3:15 PM, Christophe Leroy (CS GROUP) wrote:
> Hi Hegde,
> 
> Le 25/02/2026 à 08:46, Shrikanth Hegde a écrit :
>> Hi Christophe,
>>
>> On 2/24/26 9:11 PM, Christophe Leroy (CS GROUP) wrote:
>>> Hi Hegde,
>>>
>>> Le 19/02/2026 à 19:30, Shrikanth Hegde a écrit :
>>>>
>>>>
>>>> On 2/6/26 7:52 PM, Frederic Weisbecker wrote:
>>>>> Currently the tick subsystem stores the idle cputime accounting in
>>>>> private fields, allowing cohabitation with architecture idle vtime
>>>>> accounting. The former is fetched on online CPUs, the latter on 
>>>>> offline
>>>>> CPUs.
>>>>>
>>>>> For consolidation purpose, architecture vtime accounting will continue
>>>>> to account the cputime but will make a break when the idle tick is
>>>>> stopped. The dyntick cputime accounting will then be relayed by the 
>>>>> tick
>>>>> subsystem so that the idle cputime is still seen advancing coherently
>>>>> even when the tick isn't there to flush the idle vtime.
>>>>>
>>>>> Prepare for that and introduce three new APIs which will be used in
>>>>> subsequent patches:
>>>>>
>>>>> _ vtime_dynticks_start() is deemed to be called when idle enters in
>>>>>    dyntick mode. The idle cputime that elapsed so far is accumulated.
>>>>>
>>>>> - vtime_dynticks_stop() is deemed to be called when idle exits from
>>>>>    dyntick mode. The vtime entry clocks are fast-forward to current 
>>>>> time
>>>>>    so that idle accounting restarts elapsing from now.
>>>>>
>>>>> - vtime_reset() is deemed to be called from dynticks idle IRQ entry to
>>>>>    fast-forward the clock to current time so that the IRQ time is 
>>>>> still
>>>>>    accounted by vtime while nohz cputime is paused.
>>>>>
>>>>> Also accumulated vtime won't be flushed from dyntick-idle ticks to 
>>>>> avoid
>>>>> accounting twice the idle cputime, along with nohz accounting.
>>>>>
>>>>> Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
>>>>
>>>> Reviewed-by: Shrikanth Hegde <sshegde@linux.ibm.com>
>>>>
>>>>> ---
>>>>>   arch/powerpc/kernel/time.c | 41 +++++++++++++++++++++++++++++++++ 
>>>>> + ++++
>>>>>   include/linux/vtime.h      |  6 ++++++
>>>>>   2 files changed, 47 insertions(+)
>>>>>
>>>>> diff --git a/arch/powerpc/kernel/time.c b/arch/powerpc/kernel/time.c
>>>>> index 4bbeb8644d3d..18506740f4a4 100644
>>>>> --- a/arch/powerpc/kernel/time.c
>>>>> +++ b/arch/powerpc/kernel/time.c
>>>>> @@ -376,6 +376,47 @@ void vtime_task_switch(struct task_struct *prev)
>>>>>           acct->starttime = acct0->starttime;
>>>>>       }
>>>>>   }
>>>>> +
>>>>> +#ifdef CONFIG_NO_HZ_COMMON
>>>>> +/**
>>>>> + * vtime_reset - Fast forward vtime entry clocks
>>>>> + *
>>>>> + * Called from dynticks idle IRQ entry to fast-forward the clocks 
>>>>> to current time
>>>>> + * so that the IRQ time is still accounted by vtime while nohz 
>>>>> cputime is paused.
>>>>> + */
>>>>> +void vtime_reset(void)
>>>>> +{
>>>>> +    struct cpu_accounting_data *acct = get_accounting(current);
>>>>> +
>>>>> +    acct->starttime = mftb();
>>>>
>>>> I figured out why those huge values happen.
>>>>
>>>> This happens because mftb is from when the system is booted.
>>>> I was doing kexec to start the new kernel and mftb wasn't getting
>>>> reset.
>>>>
>>>> I thought about this. This is concern for pseries too, where LPAR's
>>>> restart but system won't restart and mftb will continue to run 
>>>> instead of
>>>> reset.
>>>>
>>>> I think we should be using sched_clock instead of mftb here.
>>>> Though we need it a few more places and some cosmetic changes around 
>>>> it.
>>>>
>>>> Note: Some values being huge exists without series for few CPUs, 
>>>> with series it
>>>> shows up in most of the CPUs.
>>>>
>>>> So I am planning send out fix below fix separately keeping your
>>>> series as dependency.
>>>>
>>>> ---
>>>>   arch/powerpc/include/asm/accounting.h |  4 ++--
>>>>   arch/powerpc/include/asm/cputime.h    | 14 +++++++-------
>>>>   arch/powerpc/kernel/time.c            | 22 +++++++++++-----------
>>>>   3 files changed, 20 insertions(+), 20 deletions(-)
>>>>
>>>> diff --git a/arch/powerpc/include/asm/accounting.h b/arch/powerpc/ 
>>>> include/asm/accounting.h
>>>> index 6d79c31700e2..50f120646e6d 100644
>>>> --- a/arch/powerpc/include/asm/accounting.h
>>>> +++ b/arch/powerpc/include/asm/accounting.h
>>>> @@ -21,8 +21,8 @@ struct cpu_accounting_data {
>>>>       unsigned long steal_time;
>>>>       unsigned long idle_time;
>>>>       /* Internal counters */
>>>> -    unsigned long starttime;    /* TB value snapshot */
>>>> -    unsigned long starttime_user;    /* TB value on exit to 
>>>> usermode */
>>>> +    unsigned long starttime;    /* Time value snapshot */
>>>> +    unsigned long starttime_user;    /* Time value on exit to 
>>>> usermode */
>>>>   #ifdef CONFIG_ARCH_HAS_SCALED_CPUTIME
>>>>       unsigned long startspurr;    /* SPURR value snapshot */
>>>>       unsigned long utime_sspurr;    /* ->user_time when - 
>>>> >startspurr set */
>>>> diff --git a/arch/powerpc/include/asm/cputime.h b/arch/powerpc/ 
>>>> include/ asm/cputime.h
>>>> index aff858ca99c0..eb6b629b113f 100644
>>>> --- a/arch/powerpc/include/asm/cputime.h
>>>> +++ b/arch/powerpc/include/asm/cputime.h
>>>> @@ -20,9 +20,9 @@
>>>>   #include <asm/time.h>
>>>>   #include <asm/param.h>
>>>>   #include <asm/firmware.h>
>>>> +#include <linux/sched/clock.h>
>>>>
>>>>   #ifdef __KERNEL__
>>>> -#define cputime_to_nsecs(cputime) tb_to_ns(cputime)
>>>>
>>>>   /*
>>>>    * PPC64 uses PACA which is task independent for storing 
>>>> accounting data while
>>>> @@ -44,20 +44,20 @@
>>>>    */
>>>>   static notrace inline void account_cpu_user_entry(void)
>>>>   {
>>>> -    unsigned long tb = mftb();
>>>> +    unsigned long now = sched_clock();
>>>
>>> Now way !
>>>
>>> By doing that you'll kill performance for no reason. All we need when 
>>> accounting time spent in kernel or in user is the difference between 
>>> time at entry and time at exit, no mater what the time was at boot time.
>>>
>>
>> No. With this patch there will not be any performance difference.
>> All it does is, instead of using mftb uses sched_clock at those places.
>>
>>
>> In arch/powerpc/kernel/time.c we have sched_clock().
>> notrace unsigned long long sched_clock(void)
>> {
>>          return mulhdu(get_tb() - boot_tb, tb_to_ns_scale) << 
>> tb_to_ns_shift;
>> }
>>
>> It does the same mftb call, and accounts only the time after boot, 
>> which is
>> what /proc/stat should do as well.
>>
>> "
>> the amount of time, measured in units of USER_HZ
>> (1/100ths of a second on most architectures
>>
>> user   (1) Time spent in user mode.
>>
>> idle   (4) Time spent in the idle task.  This value
>>         should be USER_HZ times the second entry in
>>         the /proc/uptime pseudo-file.
>> "
>> /proc/uptime is based on sched_clock, so i infer /proc/stat also 
>> should show
>> values w.r.t to boot of the OS.
>>
>>
>>> Also sched_clock() returns nanoseconds which implies calculation from 
>>> timebase. This is pointless CPU consumption. The current 
>>> implementation calculates nanoseconds at task switch when calling 
>>> vtime_flush().Your change will now do it at every kernel entry and 
>>> kernel exit by calling sched_clock().
>>
>> This change doesn't add any additional paths. Even without patches, 
>> mftb would have
>> been called in every kernel entry/exit.  See mftb usage 
>> account_cpu_user_exit/enter
>>
>> Now instead of mftb sched_clock is used, that's all. No additional 
>> entry/exit points.
>> And previously when accounting we would have done cputime_to_nsecs, 
>> now that conversion
>> is done automatically in sched_clock. So overall computation-wise it 
>> should be same.
>>
>> What i am missing to see it here?
> 
> Ok, lets try to explain in more details:
> 
> While a process is running, it will enter and leave the kernel multiple 
> times, without task switch. For instance for system calls or for 
> interrupts.
> 
> At every kernel entry and exit, account_cpu_user_entry() and 
> account_cpu_user_exit() are called. That's a very hot path.
> 
> I have added the following functions to see what the code looks like:
> 
> +
> +void my_account_cpu_user_entry(void);
> +void my_account_cpu_user_entry(void)
> +{
> +       account_cpu_user_entry();
> +}
> +
> +void my_account_cpu_user_exit(void);
> +void my_account_cpu_user_exit(void)
> +{
> +       account_cpu_user_exit();
> +}
> 
> What we have today is very optimised:
> 
> 00000148 <my_account_cpu_user_entry>:
>   148:    7d 0c 42 e6     mftb    r8
>   14c:    80 e2 00 08     lwz     r7,8(r2)
>   150:    81 22 00 28     lwz     r9,40(r2)
>   154:    91 02 00 24     stw     r8,36(r2)
>   158:    7d 29 38 50     subf    r9,r9,r7
>   15c:    7d 29 42 14     add     r9,r9,r8
>   160:    91 22 00 08     stw     r9,8(r2)
>   164:    4e 80 00 20     blr
> 
> 00000168 <my_account_cpu_user_exit>:
>   168:    7d 0c 42 e6     mftb    r8
>   16c:    80 e2 00 0c     lwz     r7,12(r2)
>   170:    81 22 00 24     lwz     r9,36(r2)
>   174:    91 02 00 28     stw     r8,40(r2)
>   178:    7d 29 38 50     subf    r9,r9,r7
>   17c:    7d 29 42 14     add     r9,r9,r8
>   180:    91 22 00 0c     stw     r9,12(r2)
>   184:    4e 80 00 20     blr
> 
> 
> 
> With your change we now get a call to sched_clock() instead of a simple 
> mftb,
> 
> 00000154 <my_account_cpu_user_entry>:
>   154:    94 21 ff f0     stwu    r1,-16(r1)
>   158:    7c 08 02 a6     mflr    r0
>   15c:    90 01 00 14     stw     r0,20(r1)
>   160:    48 00 00 01     bl      160 <my_account_cpu_user_entry+0xc>
>              160: R_PPC_REL24    sched_clock
>   164:    81 02 00 08     lwz     r8,8(r2)
>   168:    81 22 00 28     lwz     r9,40(r2)
>   16c:    90 82 00 24     stw     r4,36(r2)
>   170:    7d 29 40 50     subf    r9,r9,r8
>   174:    7d 29 22 14     add     r9,r9,r4
>   178:    91 22 00 08     stw     r9,8(r2)
>   17c:    80 01 00 14     lwz     r0,20(r1)
>   180:    38 21 00 10     addi    r1,r1,16
>   184:    7c 08 03 a6     mtlr    r0
>   188:    4e 80 00 20     blr
> 
> 0000018c <my_account_cpu_user_exit>:
>   18c:    94 21 ff f0     stwu    r1,-16(r1)
>   190:    7c 08 02 a6     mflr    r0
>   194:    90 01 00 14     stw     r0,20(r1)
>   198:    48 00 00 01     bl      198 <my_account_cpu_user_exit+0xc>
>              198: R_PPC_REL24    sched_clock
>   19c:    81 02 00 0c     lwz     r8,12(r2)
>   1a0:    81 22 00 24     lwz     r9,36(r2)
>   1a4:    90 82 00 28     stw     r4,40(r2)
>   1a8:    7d 29 40 50     subf    r9,r9,r8
>   1ac:    7d 29 22 14     add     r9,r9,r4
>   1b0:    91 22 00 0c     stw     r9,12(r2)
>   1b4:    80 01 00 14     lwz     r0,20(r1)
>   1b8:    38 21 00 10     addi    r1,r1,16
>   1bc:    7c 08 03 a6     mtlr    r0
>   1c0:    4e 80 00 20     blr
> 
> And sched_clock() is heavy, first it has the sequence mftbu/mftb/mftbu, 
> and then it does awful lot of calculations including many multiply:
> 
> 000004d8 <sched_clock>:
>   4d8:    7d 2d 42 e6     mftbu   r9
>   4dc:    7d 0c 42 e6     mftb    r8
>   4e0:    7d 4d 42 e6     mftbu   r10
>   4e4:    7c 09 50 40     cmplw   r9,r10
>   4e8:    40 82 ff f0     bne     4d8 <sched_clock>
>   4ec:    3d 40 00 00     lis     r10,0
>              4ee: R_PPC_ADDR16_HA    .data..ro_after_init
>   4f0:    38 ca 00 00     addi    r6,r10,0
>              4f2: R_PPC_ADDR16_LO    .data..ro_after_init
>   4f4:    3c e0 00 00     lis     r7,0
>              4f6: R_PPC_ADDR16_HA    .data..read_mostly
>   4f8:    38 87 00 00     addi    r4,r7,0
>              4fa: R_PPC_ADDR16_LO    .data..read_mostly
>   4fc:    80 66 00 04     lwz     r3,4(r6)
>   500:    80 e7 00 00     lwz     r7,0(r7)
>              502: R_PPC_ADDR16_LO    .data..read_mostly
>   504:    80 c4 00 04     lwz     r6,4(r4)
>   508:    81 4a 00 00     lwz     r10,0(r10)
>              50a: R_PPC_ADDR16_LO    .data..ro_after_init
>   50c:    7c 63 40 10     subfc   r3,r3,r8
>   510:    7d 0a 49 10     subfe   r8,r10,r9
>   514:    7d 27 19 d6     mullw   r9,r7,r3
>   518:    7d 43 30 16     mulhwu  r10,r3,r6
>   51c:    7c 08 31 d6     mullw   r0,r8,r6
>   520:    7d 4a 48 14     addc    r10,r10,r9
>   524:    7c 67 18 16     mulhwu  r3,r7,r3
>   528:    39 20 00 00     li      r9,0
>   52c:    7c c8 30 16     mulhwu  r6,r8,r6
>   530:    7c a9 49 14     adde    r5,r9,r9
>   534:    7d 67 41 d6     mullw   r11,r7,r8
>   538:    7d 4a 00 14     addc    r10,r10,r0
>   53c:    7c a5 01 94     addze   r5,r5
>   540:    7c 63 30 14     addc    r3,r3,r6
>   544:    7d 29 49 14     adde    r9,r9,r9
>   548:    80 84 00 08     lwz     r4,8(r4)
>   54c:    7c 63 58 14     addc    r3,r3,r11
>   550:    7c e7 40 16     mulhwu  r7,r7,r8
>   554:    7d 29 01 94     addze   r9,r9
>   558:    7c 63 28 14     addc    r3,r3,r5
>   55c:    7d 29 39 14     adde    r9,r9,r7
>   560:    35 44 ff e0     addic.  r10,r4,-32
>   564:    41 80 00 10     blt     574 <sched_clock+0x9c>
>   568:    7c 63 50 30     slw     r3,r3,r10
>   56c:    38 80 00 00     li      r4,0
>   570:    4e 80 00 20     blr
>   574:    21 04 00 1f     subfic  r8,r4,31
>   578:    54 6a f8 7e     srwi    r10,r3,1
>   57c:    7d 29 20 30     slw     r9,r9,r4
>   580:    7d 4a 44 30     srw     r10,r10,r8
>   584:    7c 64 20 30     slw     r4,r3,r4
>   588:    7d 43 4b 78     or      r3,r10,r9
>   58c:    4e 80 00 20     blr
> 
> I think the difference is obvious, no need of benchmarking. We shall 
> refrain from calling sched_clock() at every kernel entry/exit. 
> Converting from timebase to nanoseconds only need to be done in 
> vtime_flush() called by vtime_task_switch() during task switch.
> 
> Hope it is more explicit now.
> 

Got it. The main concern was around with additional computation that sched_clock,
not any additional paths per se.

yes, that would be possible,


How about we do below? This adds only one subtraction.
This achieves the same outcome.

---

diff --git a/arch/powerpc/include/asm/cputime.h b/arch/powerpc/include/asm/cputime.h
index aff858ca99c0..7afba0202568 100644
--- a/arch/powerpc/include/asm/cputime.h
+++ b/arch/powerpc/include/asm/cputime.h
@@ -44,7 +44,7 @@
   */
  static notrace inline void account_cpu_user_entry(void)
  {
-       unsigned long tb = mftb();
+       unsigned long tb = mftb() - get_boot_tb();
         struct cpu_accounting_data *acct = raw_get_accounting(current);
  
         acct->utime += (tb - acct->starttime_user);
@@ -53,7 +53,7 @@ static notrace inline void account_cpu_user_entry(void)
  
  static notrace inline void account_cpu_user_exit(void)
  {
-       unsigned long tb = mftb();
+       unsigned long tb = mftb() - get_boot_tb();
         struct cpu_accounting_data *acct = raw_get_accounting(current);
  
         acct->stime += (tb - acct->starttime);
diff --git a/arch/powerpc/kernel/time.c b/arch/powerpc/kernel/time.c
index 18506740f4a4..ff5524e6cdc7 100644
--- a/arch/powerpc/kernel/time.c
+++ b/arch/powerpc/kernel/time.c
@@ -215,7 +215,7 @@ static unsigned long vtime_delta(struct cpu_accounting_data *acct,
  
         WARN_ON_ONCE(!irqs_disabled());
  
-       now = mftb();
+       now = mftb() - get_boot_tb();
         stime = now - acct->starttime;
         acct->starttime = now;
  
@@ -388,7 +388,7 @@ void vtime_reset(void)
  {
         struct cpu_accounting_data *acct = get_accounting(current);
  
-       acct->starttime = mftb();
+       acct->starttime = mftb() - get_boot_tb();
  #ifdef CONFIG_ARCH_HAS_SCALED_CPUTIME
         acct->startspurr = read_spurr(acct->starttime);
  #endif


