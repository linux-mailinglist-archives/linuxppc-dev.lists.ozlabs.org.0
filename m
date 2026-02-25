Return-Path: <linuxppc-dev+bounces-17192-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kBMYIUj6nmm+YAQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17192-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Feb 2026 14:34:00 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E8E1981FB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Feb 2026 14:33:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fLbCP6xHbz3f4Z;
	Thu, 26 Feb 2026 00:33:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772026433;
	cv=none; b=YHFOnuXVeuqmmvFabp/aUlK+86qYtdvu8ys0BXY0xmDo4cu4ct6KDZBsKt38oHNuuN7OvQU3/Z3GZZOqwhIWLai6xtpPE2Inz1EP+GrnS3Qx0SOEbs5L8P+f5L0RKeESxp2Z2790P/TRTwvjAcxNBvMc/wC7wdiWczPI/oW3YlQRV1qgtvFbHaQ3NPQm9BbYyoIx3OhYx+osv9wq/5tnazrJuPADIZpimBtDyrg/+30qbgZjSpJzGegZCc1Mfqk535gNlaEGDpMgNusNy8u/37D21kVUwzs8qIl2hZQ0GKHxr7cEg081GQFaUySP/hJ8Kirc29cMnB66E3Vq4lwITg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772026433; c=relaxed/relaxed;
	bh=MKV16Iq/t3QcqQDzN4+Ao/FS2tWGu5v2JXxmaFI9Dx4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JFy9e0/bdpjt6gN7d6DqwkFwkOibXAsiTF7Fy9IRLBwhqILeWYow077anxYpCa1D23IsV8BglEy7XiM2F50eMMgyxwQ3PHiRaNQ99VEU0ZzMzfEJlCvxOWhCv8LwkpP9HN9yt6kZpv7kxzJRW9bLuiM7HFum54o1KBYe6WLftU5TFV79YCfNVmDJS9RAAWnshiLKFnr4kBwonzcUiJzeSwz6cMOKNyPWtwhfQdwRZf/S15e9Grg6/HMG6XyT0NOm3w+s6sN28tij+I7ur6o9Ot2iKQpsDUTIbIgB7FRW7jE35d/Bc2sP/cWzfoCIBlItk6n9UPZW+gyqjDE52NIcdw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RtgekPTi; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RtgekPTi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fLbCN68Vxz3f28
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Feb 2026 00:33:52 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61P7vOku1361599;
	Wed, 25 Feb 2026 13:33:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=MKV16I
	q/t3QcqQDzN4+Ao/FS2tWGu5v2JXxmaFI9Dx4=; b=RtgekPTihxSf+Z1saRD9E5
	+ia9iffe4EJ+WK6VHzkMbGfuLTmZ+lLrROFR5iGUAB9FEqJplUFZNeh6eGdvZ+HY
	bnCHgAX9ZgeVerkVVarxPWxLfegBYZehqGTcOhqTyTe5A12XIgTl74VFT/WHavit
	rjlBbdKWovqepLmof9yAXW1S7D8ZH7/h24kyYzbiq44viFYtzkpsUutjsCk/+c2f
	4xllpI4xt7SPy2Et5LU1OLblloUgc4oRvOnMkWq/CBnAhe3zE1gs3jUXiZG098CT
	AzVonxe7/UeWzj8fyA0+/dEug9PwkZMhQ2Tty3zn35E/3DaRHEMlBYCUBUVZBtMQ
	==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4cf34c7nwy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Feb 2026 13:33:30 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 61PCMQ9F013438;
	Wed, 25 Feb 2026 13:33:30 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4cfqdy5hqy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Feb 2026 13:33:29 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 61PDXORR45351396
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Feb 2026 13:33:24 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C31E120043;
	Wed, 25 Feb 2026 13:33:24 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A2CD120040;
	Wed, 25 Feb 2026 13:33:17 +0000 (GMT)
Received: from [9.124.208.53] (unknown [9.124.208.53])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 25 Feb 2026 13:33:17 +0000 (GMT)
Message-ID: <729a7e7f-a50e-480c-87ce-c45221fbb326@linux.ibm.com>
Date: Wed, 25 Feb 2026 19:03:16 +0530
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
 <a20beb34-0e4b-4063-b6b0-6c5886bbb971@linux.ibm.com>
 <a0c6e65c-3331-402a-94eb-14ba7f4b7ba7@kernel.org>
Content-Language: en-US
From: Shrikanth Hegde <sshegde@linux.ibm.com>
In-Reply-To: <a0c6e65c-3331-402a-94eb-14ba7f4b7ba7@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDEyNyBTYWx0ZWRfX5CemSYZLYfyA
 HGcdaS4W6NSe0RH7joqrl2xCqCNGgO2jyfM9XfmYC5TpEjoXALKUxBhfwlN2gk3B3v5a+0+JGiM
 DSgMS2nZiKGJaU3y4fNU7Cp2QfC0TVb+KYR8ETva90ht1gdaL3JjGHueSAeqfxnuYKFruuom//2
 AqWFMoptMk45r9r3RnL9h3zEl0K7cLSPgEDEtwKXKvDQF2HZrCEZZBBmBDrWojPXYwWXeTWbMBQ
 158am7Lb9ktWcv6xuKGAekFMjHSE2Brh2sJo0BXn1AW3wu6WinWYx8Fs35KHK+1YzJoVjNZUJzg
 JsXNH5lmWhI4AJlJ+Ct+KZ9cMeuS8UhpEkbOtKqZPjKcxjqaeYrTmWls6ASAD9IB4ipPgJjnSXJ
 hUDsNGDqAPF5KI0TtDkwdtzqOayMeZXL7YVSWu3Rctozqz9x3L3hahPArxFNneX9w5/rvqlHmMF
 D7wfMPLd0LwHUIoHiuA==
X-Proofpoint-ORIG-GUID: Z2Jv3lCRzvEH3cjoqe7yhERoCviSoF8M
X-Authority-Analysis: v=2.4 cv=F9lat6hN c=1 sm=1 tr=0 ts=699efa2b cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=vmwh1tm8htbPATXHtMEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: dou2Eb5l4epyt6I8Td4ZuRygSsbP0W0a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_01,2026-02-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 adultscore=0 spamscore=0
 clxscore=1015 suspectscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602250127
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
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17192-lists,linuxppc-dev=lfdr.de];
	FORGED_SENDER(0.00)[sshegde@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[kernel.org,linux.ibm.com,linutronix.de,google.com,gmail.com,arm.com,redhat.com,siemens.com,nvidia.com,suse.de,ellerman.id.au,infradead.org,goodmis.org,linaro.org,163.com,vger.kernel.org,lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[35];
	FORGED_RECIPIENTS(0.00)[m:chleroy@kernel.org,m:frederic@kernel.org,m:linux-kernel@vger.kernel.org,m:maddy@linux.ibm.com,m:rafael@kernel.org,m:agordeev@linux.ibm.com,m:anna-maria@linutronix.de,m:bsegall@google.com,m:boqun.feng@gmail.com,m:borntraeger@linux.ibm.com,m:dietmar.eggemann@arm.com,m:hca@linux.ibm.com,m:mingo@redhat.com,m:jan.kiszka@siemens.com,m:joelagnelf@nvidia.com,m:juri.lelli@redhat.com,m:kbingham@kernel.org,m:mgorman@suse.de,m:mpe@ellerman.id.au,m:neeraj.upadhyay@kernel.org,m:npiggin@gmail.com,m:paulmck@kernel.org,m:peterz@infradead.org,m:rostedt@goodmis.org,m:svens@linux.ibm.com,m:tglx@linutronix.de,m:urezki@gmail.com,m:vschneid@redhat.com,m:gor@linux.ibm.com,m:vincent.guittot@linaro.org,m:viresh.kumar@linaro.org,m:jackzxcui1989@163.com,m:linux-pm@vger.kernel.org,m:linux-s390@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.ibm.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[sshegde@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ibm.com:+];
	NEURAL_HAM(-0.00)[-0.985];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: A5E8E1981FB
X-Rspamd-Action: no action



On 2/25/26 4:44 PM, Christophe Leroy (CS GROUP) wrote:
> Hi Hegde,
> 
> Le 25/02/2026 à 11:34, Shrikanth Hegde a écrit :
>> Hi Christophe.
>>
>> On 2/25/26 3:15 PM, Christophe Leroy (CS GROUP) wrote:
>>>
>>> Hope it is more explicit now.
>>>
>>
>> Got it. The main concern was around with additional computation that 
>> sched_clock,
>> not any additional paths per se.
>>
>> yes, that would be possible,
>>
>>
>> How about we do below? This adds only one subtraction.
>> This achieves the same outcome.
> 
> It adds a bit more than just a substration. It adds a call to an extern 
> fonction.

I think we should make it always inline and move it to time.h

> 
> 00000164 <my_account_cpu_user_entry>:
>   164:    94 21 ff f0     stwu    r1,-16(r1)
>   168:    7c 08 02 a6     mflr    r0
>   16c:    90 01 00 14     stw     r0,20(r1)
>   170:    93 e1 00 0c     stw     r31,12(r1)
>   174:    7f ec 42 e6     mftb    r31
>   178:    48 00 00 01     bl      178 <my_account_cpu_user_entry+0x14>
>              178: R_PPC_REL24    get_boot_tb
>   17c:    81 02 00 08     lwz     r8,8(r2)
>   180:    81 22 00 28     lwz     r9,40(r2)
>   184:    7c 84 f8 50     subf    r4,r4,r31
>   188:    7d 29 40 50     subf    r9,r9,r8
>   18c:    7d 29 22 14     add     r9,r9,r4
>   190:    90 82 00 24     stw     r4,36(r2)
>   194:    91 22 00 08     stw     r9,8(r2)
>   198:    80 01 00 14     lwz     r0,20(r1)
>   19c:    83 e1 00 0c     lwz     r31,12(r1)
>   1a0:    7c 08 03 a6     mtlr    r0
>   1a4:    38 21 00 10     addi    r1,r1,16
>   1a8:    4e 80 00 20     blr
> 
> 000001ac <my_account_cpu_user_exit>:
>   1ac:    94 21 ff f0     stwu    r1,-16(r1)
>   1b0:    7c 08 02 a6     mflr    r0
>   1b4:    90 01 00 14     stw     r0,20(r1)
>   1b8:    93 e1 00 0c     stw     r31,12(r1)
>   1bc:    7f ec 42 e6     mftb    r31
>   1c0:    48 00 00 01     bl      1c0 <my_account_cpu_user_exit+0x14>
>              1c0: R_PPC_REL24    get_boot_tb
>   1c4:    81 02 00 0c     lwz     r8,12(r2)
>   1c8:    81 22 00 24     lwz     r9,36(r2)
>   1cc:    7c 84 f8 50     subf    r4,r4,r31
>   1d0:    7d 29 40 50     subf    r9,r9,r8
>   1d4:    7d 29 22 14     add     r9,r9,r4
>   1d8:    90 82 00 28     stw     r4,40(r2)
>   1dc:    91 22 00 0c     stw     r9,12(r2)
>   1e0:    80 01 00 14     lwz     r0,20(r1)
>   1e4:    83 e1 00 0c     lwz     r31,12(r1)
>   1e8:    7c 08 03 a6     mtlr    r0
>   1ec:    38 21 00 10     addi    r1,r1,16
>   1f0:    4e 80 00 20     blr
> 
> 
> I really still can't see the point of this substraction.
> 
> At one place we do
> 
>      tb1 = mftb1;
> 
>      acct->utime += (tb1 - acct->starttime_user);
>      acct->starttime = tb1;
> 
> At the other place we do
> 
>      tb2 = mftb2;
> 
>      acct->stime += (tb2 - acct->starttime);
>      acct->starttime_user = tb2;
> 
> So at the end we have
> 
>      acct->utime += mftb1 - mftb2;
>      acct->stime += mftb2 - mftb1;
> 
> You want to change to
>      tb1 = mftb1 - boot_tb;
>      tb2 = mftb2 - boot_tb;
> 
> At the end we would get
> 
>      acct->utime += mftb1 - boot_tb - mftb2 + boot_tb = mftb1 - mftb2;
>      acct->stime += mftb2 - boot_tb - mftb1 + boot_tb = mftb2 - mftb1;
> 
> So what's the point in doing such a useless substract that disappears at 
> the end ? What am I missing ?
> 

I had similar thought, but I saw this data below when i do exec on the system.

This was the stats seen on PowerNV system with 144 CPUs.
Nothing is running on the system after boot. So it is mostly idle.


======== With the series applied ===

cat /proc/stat | head
cpu  1494 0 135607576 9628633227 16876 142 63 0 0 0
cpu0 0 0 8 67807311 0 2 40 0 0 0
cpu1 0 0 6 67807349 0 0 0 0 0 0

cat /proc/uptime
48.32 96286332.82   << Note this value is too huge. Also system value is also huge.

========= without the series(tip/master) ===============
cat /proc/stat | head
cpu  2003 0 67866261 859414 15923 249 66 0 0 0
cpu0 5 0 23 5595 461 2 38 0 0 0
cpu1 0 0 9 6092 21 0 3 0 0 0

cat /proc/uptime
61.29 8594.82    << This is right. 144*61 = 8784.

But note, the system time reported. i.e 67866261. It is too huge again. And very close to actual mftb value
rather than the diff. i.e we have paths were tb1 is not done. tb2 is effectively mftb - 0


========= with proposed fix of mftb - boot_tb ===============
cat /proc/stat | head
cpu  5187 0 10996 2025690 16566 765 184 0 0 0
cpu0 9 0 28 14096 65 6 108 0 0 0
cpu1 4 0 15 14277 0 0 2 0 0 0

cat /proc/uptime
142.97 20257.42     << Looks correct, since 142*144 is close to 20448

=============================================================

Now lets go to CONFIG_VIRT_CPU_ACCOUNTING_GEN=y

cat /proc/stat | head
cpu  1804 0 3003 791760 15695 0 0 0 0 0
cpu0 22 0 46 5535 0 0 0 0 0 0
cpu1 0 0 7 5637 0 0 0 0 0 0

cat /proc/uptime
56.49 7918.05      << Looks correct. close 56*144


================================================


