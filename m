Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 453076D0A79
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Mar 2023 17:52:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PnScP1KRXz3fKQ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Mar 2023 02:52:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jeavevmH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jeavevmH;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PnSbX25Nnz3cLh
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Mar 2023 02:52:07 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32UF2ips006772;
	Thu, 30 Mar 2023 15:52:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=pZCUFkZgsAw3SUtEcfncO2YiMButsh4w+3FR83KmNmI=;
 b=jeavevmHOm6cm4mN/MxIsII10Y4RcmL+slaDNWZYEBvUOcBDnCfYX5DPaxrxu4esJ33o
 kl5uU7SYpzMgoyZVx9rfB0oE8h3VRH8TMM12T/Zl+xptVvzpLzJOEsOLWO/ME2Jn/yll
 NiilTLryzub9Spm9L7PKbs8SBQd1ZhhRY4cXQNjIrpO7UBNqgZDkBuhmAXxv/CgdDs/h
 /VI+mV3XFksrpBu7lif1aLUQYf5QDMDJ3avdSuo30CnbESmcacyfVPlETfMMmwIMUx62
 nyPlMSMofuIjAHYGxf9pNYiyJSP2R8plBjynkqPWmmw0TLJmxC/dkcith+Mtghi00pnG Yg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pmpr41uwu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Mar 2023 15:52:04 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32UF2rTU007786;
	Thu, 30 Mar 2023 15:52:04 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pmpr41uvj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Mar 2023 15:52:03 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32TKpnPI010293;
	Thu, 30 Mar 2023 15:52:01 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3phrk6p0gg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Mar 2023 15:52:01 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 32UFpw1Z46465388
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 30 Mar 2023 15:51:58 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0B33D2004E;
	Thu, 30 Mar 2023 15:51:58 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B79B320043;
	Thu, 30 Mar 2023 15:51:57 +0000 (GMT)
Received: from [9.101.4.33] (unknown [9.101.4.33])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 30 Mar 2023 15:51:57 +0000 (GMT)
Message-ID: <45989617-e6f9-0ca5-3371-571268807fc5@linux.ibm.com>
Date: Thu, 30 Mar 2023 17:51:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH] powerpc/pseries/cpuhp: respect current SMT when adding
 new CPU
To: Nathan Lynch <nathanl@linux.ibm.com>,
        =?UTF-8?Q?Michal_Such=c3=a1nek?=
 <msuchanek@suse.de>
References: <20230213124510.12651-1-ldufour@linux.ibm.com>
 <87ilg5aahx.fsf@linux.ibm.com> <20230213150429.GZ19419@kitsune.suse.cz>
 <87fsb9a7zx.fsf@linux.ibm.com>
Content-Language: en-US
From: Laurent Dufour <ldufour@linux.ibm.com>
In-Reply-To: <87fsb9a7zx.fsf@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 1NHTgHTUYtooka195LEfZscRFAKWB2bH
X-Proofpoint-ORIG-GUID: NrYgbgxGkFR0zlCkEhKJwHMZhAl6U_X1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-30_09,2023-03-30_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011
 priorityscore=1501 spamscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 phishscore=0 adultscore=0 mlxlogscore=999 impostorscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303300123
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Srikar Dronamraju <srikar@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Srikar Dronamraju <srikar@linux.vnet.ibm.com>, npiggin@gmail.com, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 13/02/2023 16:40:50, Nathan Lynch wrote:
> Michal Suchánek <msuchanek@suse.de> writes:
>> On Mon, Feb 13, 2023 at 08:46:50AM -0600, Nathan Lynch wrote:
>>> Laurent Dufour <ldufour@linux.ibm.com> writes:
>>>> When a new CPU is added, the kernel is activating all its threads. This
>>>> leads to weird, but functional, result when adding CPU on a SMT 4 system
>>>> for instance.
>>>>
>>>> Here the newly added CPU 1 has 8 threads while the other one has 4 threads
>>>> active (system has been booted with the 'smt-enabled=4' kernel option):
>>>>
>>>> ltcden3-lp12:~ # ppc64_cpu --info
>>>> Core   0:    0*    1*    2*    3*    4     5     6     7
>>>> Core   1:    8*    9*   10*   11*   12*   13*   14*   15*
>>>>
>>>> There is no SMT value in the kernel. It is possible to run unbalanced LPAR
>>>> with 2 threads for a CPU, 4 for another one, and 5 on the latest.
>>>>
>>>> To work around this possibility, and assuming that the LPAR run with the
>>>> same number of threads for each CPU, which is the common case,
>>>
>>> I am skeptical at best of baking that assumption into this code. Mixed
>>> SMT modes within a partition doesn't strike me as an unreasonable
>>> possibility for some use cases. And if that's wrong, then we should just
>>> add a global smt value instead of using heuristics.
>>>
>>>> the number
>>>> of active threads of the CPU doing the hot-plug operation is computed. Only
>>>> that number of threads will be activated for the newly added CPU.
>>>>
>>>> This way on a LPAR running in SMT=4, newly added CPU will be running 4
>>>> threads, which is what a end user would expect.
>>>
>>> I could see why most users would prefer this new behavior. But surely
>>> some users have come to expect the existing behavior, which has been in
>>> place for years, and developed workarounds that might be broken by this
>>> change?
>>>
>>> I would suggest that to handle this well, we need to give user space
>>> more ability to tell the kernel what actions to take on added cores, on
>>> an opt-in basis.
>>>
>>> This could take the form of extending the DLPAR sysfs command set:
>>>
>>> Option 1 - Add a flag that tells the kernel not to online any threads at
>>> all; user space will online the desired threads later.
>>>
>>> Option 2 - Add an option that tells the kernel which SMT mode to apply.
>>
>> powerpc-utils grew some drmgr hooks recently so maybe the policy can be
>> moved to userspace?
> 
> I'm not sure whether the hook mechanism would come into play, but yes, I
> am suggesting that user space be given the option of overriding the
> kernel's current behavior.

Indeed, that's not so easy. There are multiple ways for the SMT level to be
impacted:
 - smt-enabled kernel option
 - smtstate systemctl service (if activated), saving SMT level at shutdown
time to restore it a boot time
 - pseries-energyd daemon (if activated) could turn off threads
 - ppc64_cpu --smt=x user command
 - sysfs direct writing to turn off/on specific threads.

There is no SMT level saved, on "disk" or in the kernel, and any of these
options can interact in parallel. So from the user space point of view, the
best we could do is looking for the SMT current values, there could be
multiple values in the case of a mixed SMT state, peek one value and apply it.

Extending the drmgr's hook is still valid, and I sent a patch series on the
powerpc-utils mailing list to achieve that. However, changing the SMT level
in that hook means that newly added CPU will be first turn on and there is
a window where this threads could be seen active. Not a big deal but not
turning on these extra threads looks better to me.

That's being said, I can't see any benefit of a user space implementation
compared to the option I'm proposing in that patch.

Does anyone have a better idea?

Cheers,
Laurent.
