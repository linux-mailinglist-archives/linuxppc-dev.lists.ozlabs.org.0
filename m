Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8514D456C4B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Nov 2021 10:26:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HwWW02zKTz3cBK
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Nov 2021 20:26:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=P4fbZX9O;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=P4fbZX9O; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HwWVD48VXz2ywT
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Nov 2021 20:25:24 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AJ7hJB6026487
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Nov 2021 09:25:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=l9ktOgTTfs/iY9O12mFmLBqewyCQn0ThUr5w8/BMfag=;
 b=P4fbZX9O9wFI7ciAT4LiY0QmYkupijXy9wphbhM8albPJruZSrsAVXoG1AsIuoNJVgwJ
 PpKN6aO2W5fFFgCrVJhm2gMPHuAEcvF5RsEdOCbgepN/UtinlBYp0qKFdfHllJi5bWrf
 DmnfwmERYPdQycsbbB6gT4ej0dRvfxHN9qP8H8Cg9kqJnQoM+cyQVRv0qqArnRyzCKBn
 Tqv+wPcuMPz/xtMQv4WpsRr1brkZRCJ9LAfWTmyasy4HCLQHSQJTR+Jp3UWRpz2uSkNY
 xjxyZ9JdW3da8OpK0cYnWXV3901M1br7qeoNUsY0GXZXYnfVZZTsWMuYaXcnZVh0Af6z AA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ce7smsvvs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Nov 2021 09:25:21 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1AJ9Lft8025924
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Nov 2021 09:25:20 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ce7smsvv9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Nov 2021 09:25:20 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1AJ9DUqT005814;
 Fri, 19 Nov 2021 09:25:18 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06ams.nl.ibm.com with ESMTP id 3ca4mkpw1y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Nov 2021 09:25:18 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1AJ9IGYH63832368
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 19 Nov 2021 09:18:16 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D6DEE4C058;
 Fri, 19 Nov 2021 09:25:15 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B4CC44C050;
 Fri, 19 Nov 2021 09:25:15 +0000 (GMT)
Received: from [9.145.48.173] (unknown [9.145.48.173])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 19 Nov 2021 09:25:15 +0000 (GMT)
Message-ID: <8123a30e-900b-c9fb-6135-e315293e072b@linux.ibm.com>
Date: Fri, 19 Nov 2021 10:25:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.1
Subject: Re: [PATCH v3 1/4] powerpc/watchdog: Fix missed watchdog reset due to
 memory ordering race
Content-Language: en-US
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20211110025056.2084347-1-npiggin@gmail.com>
 <20211110025056.2084347-2-npiggin@gmail.com>
 <0b0cffcb-c99a-bad5-5620-9f3ad154b61e@linux.ibm.com>
 <1637312006.m6vfbmx01l.astroid@bobo.none>
From: Laurent Dufour <ldufour@linux.ibm.com>
In-Reply-To: <1637312006.m6vfbmx01l.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: zNSyEy1GjY0_KBJP4ZF4GRnZ_sjcysTb
X-Proofpoint-GUID: fMKBWYcqOW47bzzV63GLvibxtQClUCdG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-19_07,2021-11-17_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 adultscore=0 bulkscore=0 mlxlogscore=999 phishscore=0 spamscore=0
 mlxscore=0 clxscore=1015 suspectscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111190049
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Le 19/11/2021 à 10:05, Nicholas Piggin a écrit :
> Excerpts from Laurent Dufour's message of November 16, 2021 1:09 am:
>> Le 10/11/2021 à 03:50, Nicholas Piggin a écrit :
>>> It is possible for all CPUs to miss the pending cpumask becoming clear,
>>> and then nobody resetting it, which will cause the lockup detector to
>>> stop working. It will eventually expire, but watchdog_smp_panic will
>>> avoid doing anything if the pending mask is clear and it will never be
>>> reset.
>>>
>>> Order the cpumask clear vs the subsequent test to close this race.
>>>
>>> Add an extra check for an empty pending mask when the watchdog fires and
>>> finds its bit still clear, to try to catch any other possible races or
>>> bugs here and keep the watchdog working. The extra test in
>>> arch_touch_nmi_watchdog is required to prevent the new warning from
>>> firing off.
>>>
>>> Debugged-by: Laurent Dufour <ldufour@linux.ibm.com>
>>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>>> ---
>>>    arch/powerpc/kernel/watchdog.c | 41 +++++++++++++++++++++++++++++++++-
>>>    1 file changed, 40 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/arch/powerpc/kernel/watchdog.c b/arch/powerpc/kernel/watchdog.c
>>> index f9ea0e5357f9..3c60872b6a2c 100644
>>> --- a/arch/powerpc/kernel/watchdog.c
>>> +++ b/arch/powerpc/kernel/watchdog.c
>>> @@ -135,6 +135,10 @@ static void set_cpumask_stuck(const struct cpumask *cpumask, u64 tb)
>>>    {
>>>    	cpumask_or(&wd_smp_cpus_stuck, &wd_smp_cpus_stuck, cpumask);
>>>    	cpumask_andnot(&wd_smp_cpus_pending, &wd_smp_cpus_pending, cpumask);
>>> +	/*
>>> +	 * See wd_smp_clear_cpu_pending()
>>> +	 */
>>> +	smp_mb();
>>>    	if (cpumask_empty(&wd_smp_cpus_pending)) {
>>>    		wd_smp_last_reset_tb = tb;
>>>    		cpumask_andnot(&wd_smp_cpus_pending,
>>> @@ -215,13 +219,44 @@ static void wd_smp_clear_cpu_pending(int cpu, u64 tb)
>>>    
>>>    			cpumask_clear_cpu(cpu, &wd_smp_cpus_stuck);
>>>    			wd_smp_unlock(&flags);
>>> +		} else {
>>> +			/*
>>> +			 * The last CPU to clear pending should have reset the
>>> +			 * watchdog so we generally should not find it empty
>>> +			 * here if our CPU was clear. However it could happen
>>> +			 * due to a rare race with another CPU taking the
>>> +			 * last CPU out of the mask concurrently.
>>> +			 *
>>> +			 * We can't add a warning for it. But just in case
>>> +			 * there is a problem with the watchdog that is causing
>>> +			 * the mask to not be reset, try to kick it along here.
>>> +			 */
>>> +			if (unlikely(cpumask_empty(&wd_smp_cpus_pending)))
>>> +				goto none_pending;
>>
>> If I understand correctly, that branch is a security in case the code is not
>> working as expected. But I'm really wondering if that's really needed, and we
>> will end up with a contention on the watchdog lock while this path should be
>> lockless, and I'd say that in most of the case there is nothing to do after
>> grabbing that lock. Am I missing something risky here?
> 
> I'm thinking it should not hit very much because that first test
> 
>      if (!cpumask_test_cpu(cpu, &wd_smp_cpus_pending)) {
> 
> I think it should not be true too often, it would mean a CPU has taken
> two timer interrupts while another one has not taken any, so hopefully
> that's pretty rare in normal operation.

Thanks, Nick, for the clarification.

Reviewed-by: Laurent Dufour <ldufour@linux.ibm.com>
