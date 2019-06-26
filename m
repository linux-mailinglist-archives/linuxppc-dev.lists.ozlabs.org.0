Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B4BC5656A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jun 2019 11:11:31 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Ychx0BvkzDqZW
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jun 2019 19:11:29 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Ycfr2D2zzDqX9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jun 2019 19:09:39 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5Q98haV011847
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jun 2019 05:09:35 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tc348pbqp-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jun 2019 05:09:35 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <huntbag@linux.vnet.ibm.com>;
 Wed, 26 Jun 2019 10:09:32 +0100
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 26 Jun 2019 10:09:30 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x5Q99J8p30802320
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Jun 2019 09:09:19 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9497D5204F;
 Wed, 26 Jun 2019 09:09:28 +0000 (GMT)
Received: from oc0383214508.ibm.com (unknown [9.124.35.188])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 079BC52067;
 Wed, 26 Jun 2019 09:09:26 +0000 (GMT)
Subject: Re: [PATCH v2 1/1] cpuidle-powernv : forced wakeup for stop states
To: Nicholas Piggin <npiggin@gmail.com>, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
References: <20190617095648.18847-1-huntbag@linux.vnet.ibm.com>
 <20190617095648.18847-2-huntbag@linux.vnet.ibm.com>
 <1560917320.mk5nn6r8jw.astroid@bobo.none>
 <689a52a7-7bfc-7225-e563-ac07f7357e75@linux.vnet.ibm.com>
 <1560938644.5ukemauqsy.astroid@bobo.none>
From: Abhishek <huntbag@linux.vnet.ibm.com>
Date: Wed, 26 Jun 2019 14:39:26 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1560938644.5ukemauqsy.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19062609-0020-0000-0000-0000034D7EEA
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19062609-0021-0000-0000-000021A0F2FD
Message-Id: <003ea53f-1c11-96cf-5949-3d7bf6fc4b31@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-26_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906260111
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

Hi Nick,


On 06/19/2019 03:39 PM, Nicholas Piggin wrote:
> Abhishek's on June 19, 2019 7:08 pm:
>> Hi Nick,
>>
>> Thanks for the review. Some replies below.
>>
>> On 06/19/2019 09:53 AM, Nicholas Piggin wrote:
>>> Abhishek Goel's on June 17, 2019 7:56 pm:
>>>> Currently, the cpuidle governors determine what idle state a idling CPU
>>>> should enter into based on heuristics that depend on the idle history on
>>>> that CPU. Given that no predictive heuristic is perfect, there are cases
>>>> where the governor predicts a shallow idle state, hoping that the CPU will
>>>> be busy soon. However, if no new workload is scheduled on that CPU in the
>>>> near future, the CPU may end up in the shallow state.
>>>>
>>>> This is problematic, when the predicted state in the aforementioned
>>>> scenario is a shallow stop state on a tickless system. As we might get
>>>> stuck into shallow states for hours, in absence of ticks or interrupts.
>>>>
>>>> To address this, We forcefully wakeup the cpu by setting the
>>>> decrementer. The decrementer is set to a value that corresponds with the
>>>> residency of the next available state. Thus firing up a timer that will
>>>> forcefully wakeup the cpu. Few such iterations will essentially train the
>>>> governor to select a deeper state for that cpu, as the timer here
>>>> corresponds to the next available cpuidle state residency. Thus, cpu will
>>>> eventually end up in the deepest possible state.
>>>>
>>>> Signed-off-by: Abhishek Goel <huntbag@linux.vnet.ibm.com>
>>>> ---
>>>>
>>>> Auto-promotion
>>>>    v1 : started as auto promotion logic for cpuidle states in generic
>>>> driver
>>>>    v2 : Removed timeout_needed and rebased the code to upstream kernel
>>>> Forced-wakeup
>>>>    v1 : New patch with name of forced wakeup started
>>>>    v2 : Extending the forced wakeup logic for all states. Setting the
>>>> decrementer instead of queuing up a hrtimer to implement the logic.
>>>>
>>>>    drivers/cpuidle/cpuidle-powernv.c | 38 +++++++++++++++++++++++++++++++
>>>>    1 file changed, 38 insertions(+)
>>>>
>>>> diff --git a/drivers/cpuidle/cpuidle-powernv.c b/drivers/cpuidle/cpuidle-powernv.c
>>>> index 84b1ebe212b3..bc9ca18ae7e3 100644
>>>> --- a/drivers/cpuidle/cpuidle-powernv.c
>>>> +++ b/drivers/cpuidle/cpuidle-powernv.c
>>>> @@ -46,6 +46,26 @@ static struct stop_psscr_table stop_psscr_table[CPUIDLE_STATE_MAX] __read_mostly
>>>>    static u64 default_snooze_timeout __read_mostly;
>>>>    static bool snooze_timeout_en __read_mostly;
>>>>    
>>>> +static u64 forced_wakeup_timeout(struct cpuidle_device *dev,
>>>> +				 struct cpuidle_driver *drv,
>>>> +				 int index)
>>>> +{
>>>> +	int i;
>>>> +
>>>> +	for (i = index + 1; i < drv->state_count; i++) {
>>>> +		struct cpuidle_state *s = &drv->states[i];
>>>> +		struct cpuidle_state_usage *su = &dev->states_usage[i];
>>>> +
>>>> +		if (s->disabled || su->disable)
>>>> +			continue;
>>>> +
>>>> +		return (s->target_residency + 2 * s->exit_latency) *
>>>> +			tb_ticks_per_usec;
>>>> +	}
>>>> +
>>>> +	return 0;
>>>> +}
>>> It would be nice to not have this kind of loop iteration in the
>>> idle fast path. Can we add a flag or something to the idle state?
>> Currently, we do not have any callback notification or some feedback that
>> notifies the driver everytime some state is enabled/disabled. So we have
>> to parse everytime to get the next enabled state.
> Ahh, that's why you're doing that.
>
>> Are you suggesting to
>> add something like next_enabled_state in cpuidle state structure itself
>> which will be updated when a state is enabled or disabled?
> Hmm, I guess it normally should not iterate over more than one state
> unless some idle states are disabled.
>
> What would have been nice is each state just have its own timeout
> field with ticks already calculated, if that could be updated when
> a state is enabled or disabled. How hard is that to add to the
> cpuidle core?

I have implemented a prototype which does what you have asked for. Added
a  disable_callback which will update timeout whenever a state is 
enabled or
disabled. But It would mean adding some code to cpuidle.h and 
cpuidle/sysfs.c.
If that is not an issue, should I go ahead and post it?
>>>> +
>>>>    static u64 get_snooze_timeout(struct cpuidle_device *dev,
>>>>    			      struct cpuidle_driver *drv,
>>>>    			      int index)
>>>> @@ -144,8 +164,26 @@ static int stop_loop(struct cpuidle_device *dev,
>>>>    		     struct cpuidle_driver *drv,
>>>>    		     int index)
>>>>    {
>>>> +	u64 dec_expiry_tb, dec, timeout_tb, forced_wakeup;
>>>> +
>>>> +	dec = mfspr(SPRN_DEC);
>>>> +	timeout_tb = forced_wakeup_timeout(dev, drv, index);
>>>> +	forced_wakeup = 0;
>>>> +
>>>> +	if (timeout_tb && timeout_tb < dec) {
>>>> +		forced_wakeup = 1;
>>>> +		dec_expiry_tb = mftb() + dec;
>>>> +	}
>>> The compiler probably can't optimise away the SPR manipulations so try
>>> to avoid them if possible.
>> Are you suggesting something like set_dec_before_idle?(in line with
>> what you have suggested to do after idle, reset_dec_after_idle)
> I should have been clear, I meant don't mfspr(SPRN_DEC) until you
> have tested timeout_tb.
>
>>>> +
>>>> +	if (forced_wakeup)
>>>> +		mtspr(SPRN_DEC, timeout_tb);
>>> This should just be put in the above 'if'.
>> Fair point.
>>>> +
>>>>    	power9_idle_type(stop_psscr_table[index].val,
>>>>    			 stop_psscr_table[index].mask);
>>>> +
>>>> +	if (forced_wakeup)
>>>> +		mtspr(SPRN_DEC, dec_expiry_tb - mftb());
>>> This will sometimes go negative and result in another timer interrupt.
>>>
>>> It also breaks irq work (which can be set here by machine check I
>>> believe.
>>>
>>> May need to implement some timer code to do this for you.
>>>
>>> static void reset_dec_after_idle(void)
>>> {
>>> 	u64 now;
>>>           u64 *next_tb;
>>>
>>> 	if (test_irq_work_pending())
>>> 		return;
>>> 	now = mftb;
>>> 	next_tb = this_cpu_ptr(&decrementers_next_tb);
>>>
>>> 	if (now >= *next_tb)
>>> 		return;
>>> 	set_dec(*next_tb - now);
>>> 	if (test_irq_work_pending())
>>> 		set_dec(1);
>>> }
>>>
>>> Something vaguely like that. See timer_interrupt().
>> Ah, Okay. Will go through timer_interrupt().
> Thanks,
> Nick

Thanks,
Abhishek

