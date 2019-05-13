Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 375DA1B334
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 May 2019 11:51:10 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 452bfz5X62zDqGW
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 May 2019 19:51:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=huntbag@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 452bdR2Nx4zDqG9
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 May 2019 19:49:46 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4D9m3Jd089982
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 May 2019 05:49:44 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2sf4y73e60-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 May 2019 05:49:44 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <huntbag@linux.vnet.ibm.com>;
 Mon, 13 May 2019 10:49:41 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 13 May 2019 10:49:37 +0100
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x4D9naI05570582
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 May 2019 09:49:36 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8AE954C044;
 Mon, 13 May 2019 09:49:36 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2F4B64C040;
 Mon, 13 May 2019 09:49:35 +0000 (GMT)
Received: from oc0383214508.ibm.com (unknown [9.124.35.159])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 13 May 2019 09:49:35 +0000 (GMT)
Subject: Re: [PATCH 0/1] Forced-wakeup for stop lite states on Powernv
To: Nicholas Piggin <npiggin@gmail.com>, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
References: <20190422063231.51043-1-huntbag@linux.vnet.ibm.com>
 <1557291178.ow4spjzq5t.astroid@bobo.none>
From: Abhishek <huntbag@linux.vnet.ibm.com>
Date: Mon, 13 May 2019 15:19:34 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1557291178.ow4spjzq5t.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19051309-0016-0000-0000-0000027B14D7
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19051309-0017-0000-0000-000032D7D821
Message-Id: <b2fcf69a-aecd-ea81-b497-737642354736@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-13_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905130070
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
Cc: ego@linux.vnet.ibm.com, daniel.lezcano@linaro.org, rjw@rjwysocki.net,
 dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 05/08/2019 10:29 AM, Nicholas Piggin wrote:
> Abhishek Goel's on April 22, 2019 4:32 pm:
>> Currently, the cpuidle governors determine what idle state a idling CPU
>> should enter into based on heuristics that depend on the idle history on
>> that CPU. Given that no predictive heuristic is perfect, there are cases
>> where the governor predicts a shallow idle state, hoping that the CPU will
>> be busy soon. However, if no new workload is scheduled on that CPU in the
>> near future, the CPU will end up in the shallow state.
>>
>> Motivation
>> ----------
>> In case of POWER, this is problematic, when the predicted state in the
>> aforementioned scenario is a lite stop state, as such lite states will
>> inhibit SMT folding, thereby depriving the other threads in the core from
>> using the core resources.
>>
>> So we do not want to get stucked in such states for longer duration. To
>> address this, the cpuidle-core can queue timer to correspond with the
>> residency value of the next available state. This timer will forcefully
>> wakeup the cpu. Few such iterations will essentially train the governor to
>> select a deeper state for that cpu, as the timer here corresponds to the
>> next available cpuidle state residency. Cpu will be kicked out of the lite
>> state and end up in a non-lite state.
>>
>> Experiment
>> ----------
>> I performed experiments for three scenarios to collect some data.
>>
>> case 1 :
>> Without this patch and without tick retained, i.e. in a upstream kernel,
>> It would spend more than even a second to get out of stop0_lite.
>>
>> case 2 : With tick retained in a upstream kernel -
>>
>> Generally, we have a sched tick at 4ms(CONF_HZ = 250). Ideally I expected
>> it to take 8 sched tick to get out of stop0_lite. Experimentally,
>> observation was
>>
>> =========================================================
>> sample          min            max           99percentile
>> 20              4ms            12ms          4ms
>> =========================================================
>>
>> It would take atleast one sched tick to get out of stop0_lite.
>>
>> case 2 :  With this patch (not stopping tick, but explicitly queuing a
>>            timer)
>>
>> ============================================================
>> sample          min             max             99percentile
>> ============================================================
>> 20              144us           192us           144us
>> ============================================================
>>
>> In this patch, we queue a timer just before entering into a stop0_lite
>> state. The timer fires at (residency of next available state + exit latency
>> of next available state * 2). Let's say if next state(stop0) is available
>> which has residency of 20us, it should get out in as low as (20+2*2)*8
>> [Based on the forumla (residency + 2xlatency)*history length] microseconds
>> = 192us. Ideally we would expect 8 iterations, it was observed to get out
>> in 6-7 iterations. Even if let's say stop2 is next available state(stop0
>> and stop1 both are unavailable), it would take (100+2*10)*8 = 960us to get
>> into stop2.
>>
>> So, We are able to get out of stop0_lite generally in 150us(with this
>> patch) as compared to 4ms(with tick retained). As stated earlier, we do not
>> want to get stuck into stop0_lite as it inhibits SMT folding for other
>> sibling threads, depriving them of core resources. Current patch is using
>> forced-wakeup only for stop0_lite, as it gives performance benefit(primary
>> reason) along with lowering down power consumption. We may extend this
>> model for other states in future.
> I still have to wonder, between our snooze loop and stop0, what does
> stop0_lite buy us.
>
> That said, the problem you're solving here is a generic one that all
> stop states have, I think. Doesn't the same thing apply going from
> stop0 to stop5? You might under estimate the sleep time and lose power
> savings and therefore performance there too. Shouldn't we make it
> generic for all stop states?
>
> Thanks,
> Nick
>
>
When a cpu is in snooze, it takes both space and time of core. When in 
stop0_lite,
it free up time but it still takes space. When it is in stop0 or deeper, 
it free up both
space and time slice of core.
In stop0_lite, cpu doesn't free up the core resources and thus inhibits 
thread
folding. When a cpu goes to stop0, it will free up the core resources 
thus increasing
the single thread performance of other sibling thread.
Hence, we do not want to get stuck in stop0_lite for long duration, and 
want to quickly
move onto the next state.
If we get stuck in any other state we would possibly be losing on to 
power saving,
but will still be able to gain the performance benefits for other 
sibling threads.

Thanks,
Abhishek

