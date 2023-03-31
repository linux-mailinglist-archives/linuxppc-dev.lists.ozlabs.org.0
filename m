Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E67A66D23B2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Mar 2023 17:12:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pp3g74h34z3fWg
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Apr 2023 02:12:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cPx2eF9L;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cPx2eF9L;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pp3fB4w9zz3fL0
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 Apr 2023 02:11:29 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32VF9a9N022526;
	Fri, 31 Mar 2023 15:11:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=peYCy6QUXj6+PheDewCu+f1Nhnx49OIt4ll5OQ5RGd0=;
 b=cPx2eF9LgrowGWY5Yipwi6ZusEiyLQgflu8iR+eVBLkzwEp+JFnSExlYeXGpxqNNkBkU
 9o0sdHViQ3VRdVIdXO83w6eAdUhllneugsIJxIeF9cC2myrq0XNRVZTcsrGKldw842Gf
 VcrsjG7LvGV+9/4EgVJMe1+PYc/w9qY5pFjxFoR16gLRiEnF8lnsRbNG/e2cI5uh3hZV
 XttBWAgz7UIKwOJMoKZoL/qqSgGxcoLYYjz8BAXPm8U/hqv8MwbRwphfogHf3Mww2sqw
 lWEZ3dPMr087pUwudv7SiXttUwCompDcu78Y3loKXJt4ZjTAExU+cKsRR6XGs8fk7xPJ IA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pp16d18p8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 Mar 2023 15:11:26 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32VF9eJJ023141;
	Fri, 31 Mar 2023 15:11:26 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pp16d18nj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 Mar 2023 15:11:26 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32ULEGGe019506;
	Fri, 31 Mar 2023 15:11:24 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3phrk6pvku-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 Mar 2023 15:11:24 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 32VFBK4Y45810016
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 31 Mar 2023 15:11:20 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B4C9C2004D;
	Fri, 31 Mar 2023 15:11:20 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2A78520040;
	Fri, 31 Mar 2023 15:11:20 +0000 (GMT)
Received: from [9.179.0.144] (unknown [9.179.0.144])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 31 Mar 2023 15:11:20 +0000 (GMT)
Message-ID: <b2947d2c-8688-ec42-0b7c-e523c80a6cac@linux.ibm.com>
Date: Fri, 31 Mar 2023 17:11:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH] powerpc/pseries/cpuhp: respect current SMT when adding
 new CPU
Content-Language: en-US
To: =?UTF-8?Q?Michal_Such=c3=a1nek?= <msuchanek@suse.de>
References: <20230213124510.12651-1-ldufour@linux.ibm.com>
 <87ilg5aahx.fsf@linux.ibm.com> <20230213150429.GZ19419@kitsune.suse.cz>
 <87fsb9a7zx.fsf@linux.ibm.com>
 <45989617-e6f9-0ca5-3371-571268807fc5@linux.ibm.com>
 <20230330161938.GY3132@kitsune.suse.cz>
From: Laurent Dufour <ldufour@linux.ibm.com>
In-Reply-To: <20230330161938.GY3132@kitsune.suse.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: sYKYMRSs-PCqj89gJBtLiN0IoZhDAdCf
X-Proofpoint-GUID: hvAcmABO1qe1KZtdPpeFtmtGrTyVKMoV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-31_07,2023-03-31_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=999
 malwarescore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 impostorscore=0 phishscore=0 priorityscore=1501 mlxscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303310120
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, Srikar Dronamraju <srikar@linux.vnet.ibm.com>, linux-kernel@vger.kernel.org, npiggin@gmail.com, Srikar Dronamraju <srikar@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 30/03/2023 18:19:38, Michal Suchánek wrote:
> On Thu, Mar 30, 2023 at 05:51:57PM +0200, Laurent Dufour wrote:
>> On 13/02/2023 16:40:50, Nathan Lynch wrote:
>>> Michal Suchánek <msuchanek@suse.de> writes:
>>>> On Mon, Feb 13, 2023 at 08:46:50AM -0600, Nathan Lynch wrote:
>>>>> Laurent Dufour <ldufour@linux.ibm.com> writes:
>>>>>> When a new CPU is added, the kernel is activating all its threads. This
>>>>>> leads to weird, but functional, result when adding CPU on a SMT 4 system
>>>>>> for instance.
>>>>>>
>>>>>> Here the newly added CPU 1 has 8 threads while the other one has 4 threads
>>>>>> active (system has been booted with the 'smt-enabled=4' kernel option):
>>>>>>
>>>>>> ltcden3-lp12:~ # ppc64_cpu --info
>>>>>> Core   0:    0*    1*    2*    3*    4     5     6     7
>>>>>> Core   1:    8*    9*   10*   11*   12*   13*   14*   15*
>>>>>>
>>>>>> There is no SMT value in the kernel. It is possible to run unbalanced LPAR
>>>>>> with 2 threads for a CPU, 4 for another one, and 5 on the latest.
> 
>> Indeed, that's not so easy. There are multiple ways for the SMT level to be
>> impacted:
>>  - smt-enabled kernel option
>>  - smtstate systemctl service (if activated), saving SMT level at shutdown
>> time to restore it a boot time
>>  - pseries-energyd daemon (if activated) could turn off threads
>>  - ppc64_cpu --smt=x user command
>>  - sysfs direct writing to turn off/on specific threads.
>>
>> There is no SMT level saved, on "disk" or in the kernel, and any of these
>> options can interact in parallel. So from the user space point of view, the
>> best we could do is looking for the SMT current values, there could be
>> multiple values in the case of a mixed SMT state, peek one value and apply it.
>>
>> Extending the drmgr's hook is still valid, and I sent a patch series on the
>> powerpc-utils mailing list to achieve that. However, changing the SMT level
>> in that hook means that newly added CPU will be first turn on and there is
>> a window where this threads could be seen active. Not a big deal but not
>> turning on these extra threads looks better to me.
> 
> Which means
> 
> 1) add an option to not onlince hotplugged CPUs by default

After discussing this with Srikar, it happens that exposing the smt-enabled
value set a boot time (or not) in SYS FS and to update it when SMT level is
changed using ppc64_cpu will be better. This will aslo allow the energy
daemon to take this value in account.

> 2) when a tool that wants to manage CPU onlining is active it can set
> the option so that no threads are onlined automatically, and online the
> desired threads

When new CPU are added, the kernel will automatically online the right
number of threads based on that recorded SMT level.

> 
> 3) when no such tool is active the default should be to online all
> threeads to preserve compatibility with existing behavior

I don't think we should keep the existing behavior, customers are confused
and some user space tools like lparstart have difficulties to handled mixed
SMT levels.

I'll submit a new series exposing the SMT level and propose a patch for
ppc64_cpu too.

> 
>> That's being said, I can't see any benefit of a user space implementation
>> compared to the option I'm proposing in that patch.
> 
> The userspace implementation can implement arbitrily complex policy,
> that's not something that belongs into the kernel.
> 
> Thanks
> 
> Michal

