Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 847524034A3
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Sep 2021 08:58:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H4CfS1dv9z2yV6
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Sep 2021 16:58:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=L7TM055Y;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ganeshgr@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=L7TM055Y; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H4CS460HYz2xY1
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Sep 2021 16:49:56 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1886XjAl158597; Wed, 8 Sep 2021 02:49:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type; s=pp1; bh=eWjUMpF2SuEofYY/R8q3nVEsfZJ3i1TS78PNMbU+5gM=;
 b=L7TM055YA+MOHx8ew39HYLXezJUb8SAdsmcCm7qTl8D9ewzf1X2aM0W6gQC54gUkIH5m
 NdreM+aGfmwU8eD7NJosGtOsIv/W2/FlwjEW+9RgDROAXaaU41NK80R3Al7oT4L7zQBT
 qSn7Dp3nm6d9F07TdAZ1S4GtCXykINSgfb8Whn2zwDjq+9Dbch37frzLBWX+CaUI9jGT
 sq+cRMSLsVDwaC/G82wra0BpVHBybFN+Vzk82zXx1AaZopt00F1EIDfM9cSYh/rU0mqo
 +SAMJYrZadh+Pw2R6LXM9yU/SlHnuT2auzGmMaTC6bB6WHXhn/BZLnwteZ9J4Rol2luw MQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3axhcefnet-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Sep 2021 02:49:49 -0400
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1886ZS9B166436;
 Wed, 8 Sep 2021 02:49:49 -0400
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3axhcefneg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Sep 2021 02:49:49 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1886m03M023011;
 Wed, 8 Sep 2021 06:49:47 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma01fra.de.ibm.com with ESMTP id 3axcnk4svn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Sep 2021 06:49:47 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1886jU6556689024
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 8 Sep 2021 06:45:30 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E8A76A405B;
 Wed,  8 Sep 2021 06:49:44 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E5C21A4065;
 Wed,  8 Sep 2021 06:49:42 +0000 (GMT)
Received: from li-c7b85bcc-2727-11b2-a85c-a9ba7f3a2193.ibm.com (unknown
 [9.43.67.252])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  8 Sep 2021 06:49:42 +0000 (GMT)
Subject: Re: [PATCH] powerpc/mce: Fix access error in mce handler
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
References: <20210906081823.181509-1-ganeshgr@linux.ibm.com>
 <87y289natb.fsf@mpe.ellerman.id.au>
 <f14cb57a-5ae0-f867-1e18-004f34a3b320@linux.ibm.com>
 <87mtonmxp6.fsf@mpe.ellerman.id.au>
From: Ganesh <ganeshgr@linux.ibm.com>
Message-ID: <e622b2e2-12f9-6237-6243-badeddddfaa3@linux.ibm.com>
Date: Wed, 8 Sep 2021 12:19:41 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <87mtonmxp6.fsf@mpe.ellerman.id.au>
Content-Type: multipart/alternative;
 boundary="------------C54619CBB058F90F152DF72D"
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 2kszFem73SUQzuRCz8Z282mnPtWqUNs8
X-Proofpoint-ORIG-GUID: bRFPv1J9NpJPwruuScdaj3RtUQriZEkW
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-09-08_02:2021-09-07,
 2021-09-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 priorityscore=1501 adultscore=0 phishscore=0 impostorscore=0 clxscore=1015
 mlxscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109080040
X-Mailman-Approved-At: Wed, 08 Sep 2021 16:58:17 +1000
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
Cc: mahesh@linux.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------C54619CBB058F90F152DF72D
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/8/21 11:10 AM, Michael Ellerman wrote:

> Ganesh <ganeshgr@linux.ibm.com> writes:
>> On 9/6/21 6:03 PM, Michael Ellerman wrote:
>>
>>> Ganesh Goudar <ganeshgr@linux.ibm.com> writes
>>>> Oops: Kernel access of bad area, sig: 11 [#1]
>>>> LE PAGE_SIZE=64K MMU=Hash SMP NR_CPUS=2048 NUMA pSeries
>>>> CPU: 5 PID: 1883 Comm: insmod Tainted: G        OE     5.14.0-mce+ #137
>>>> NIP:  c000000000735d60 LR: c000000000318640 CTR: 0000000000000000
>>>> REGS: c00000001ebff9a0 TRAP: 0300   Tainted: G       OE      (5.14.0-mce+)
>>>> MSR:  8000000000001003 <SF,ME,RI,LE>  CR: 28008228  XER: 00000001
>>>> CFAR: c00000000031863c DAR: c00000027fa8fe08 DSISR: 40000000 IRQMASK: 0
>>>> GPR00: c0000000003186d0 c00000001ebffc40 c000000001b0df00 c0000000016337e8
>>>> GPR04: c0000000016337e8 c00000027fa8fe08 0000000000000023 c0000000016337f0
>>>> GPR08: 0000000000000023 c0000000012ffe08 0000000000000000 c008000001460240
>>>> GPR12: 0000000000000000 c00000001ec9a900 c00000002ac4bd00 0000000000000000
>>>> GPR16: 00000000000005a0 c0080000006b0000 c0080000006b05a0 c000000000ff3068
>>>> GPR20: c00000002ac4bbc0 0000000000000001 c00000002ac4bbc0 c008000001490298
>>>> GPR24: c008000001490108 c000000001636198 c008000001470090 c008000001470058
>>>> GPR28: 0000000000000510 c008000001000000 c008000008000019 0000000000000019
>>>> NIP [c000000000735d60] llist_add_batch+0x0/0x40
>>>> LR [c000000000318640] __irq_work_queue_local+0x70/0xc0
>>>> Call Trace:
>>>> [c00000001ebffc40] [c00000001ebffc0c] 0xc00000001ebffc0c (unreliable)
>>>> [c00000001ebffc60] [c0000000003186d0] irq_work_queue+0x40/0x70
>>>> [c00000001ebffc80] [c00000000004425c] machine_check_queue_event+0xbc/0xd0
>>>> [c00000001ebffcf0] [c00000000000838c] machine_check_early_common+0x16c/0x1f4
>>>>
>>>> Fixes: 74c3354bc1d89 ("powerpc/pseries/mce: restore msr before returning from handler")
>>> Please explain in more detail why that commit caused this breakage.
>> After enabling translation in mce_handle_error() we used to leave it enabled to avoid
>> crashing here, but now with this commit we are restoring the MSR to disable translation.
> Are you sure we left the MMU enabled to avoid crashing there, or we just
> left it enabled by accident?

No, I think we left it enabled intentionally, I mentioned about leaving it enabled
in my comment and commit message of a95a0a1654 "powerpc/pseries: Fix MCE handling on pseries".

>
> But yeah, previously the MMU was enabled when we got here whereas now
> it's not, because of that change.
>
>> Missed to mention it in commit log, I will add it.
> Thanks.
>
>>>> diff --git a/arch/powerpc/kernel/mce.c b/arch/powerpc/kernel/mce.c
>>>> index 47a683cd00d2..9d1e39d42e3e 100644
>>>> --- a/arch/powerpc/kernel/mce.c
>>>> +++ b/arch/powerpc/kernel/mce.c
>>>> @@ -249,6 +249,7 @@ void machine_check_queue_event(void)
>>>>    {
>>>>    	int index;
>>>>    	struct machine_check_event evt;
>>>> +	unsigned long msr;
>>>>    
>>>>    	if (!get_mce_event(&evt, MCE_EVENT_RELEASE))
>>>>    		return;
>>>> @@ -262,8 +263,19 @@ void machine_check_queue_event(void)
>>>>    	memcpy(&local_paca->mce_info->mce_event_queue[index],
>>>>    	       &evt, sizeof(evt));
>>>>    
>>>> -	/* Queue irq work to process this event later. */
>>>> -	irq_work_queue(&mce_event_process_work);
>>>> +	/* Queue irq work to process this event later. Before
>>>> +	 * queuing the work enable translation for non radix LPAR,
>>>> +	 * as irq_work_queue may try to access memory outside RMO
>>>> +	 * region.
>>>> +	 */
>>>> +	if (!radix_enabled() && firmware_has_feature(FW_FEATURE_LPAR)) {
>>>> +		msr = mfmsr();
>>>> +		mtmsr(msr | MSR_IR | MSR_DR);
>>>> +		irq_work_queue(&mce_event_process_work);
>>>> +		mtmsr(msr);
>>>> +	} else {
>>>> +		irq_work_queue(&mce_event_process_work);
>>>> +	}
>>>>    }
>>> We already went to virtual mode and queued (different) irq work in
>>> arch/powerpc/platforms/pseries/ras.c:mce_handle_error()
>>>
>>> We also called save_mce_event() which also might have queued irq work,
>>> via machine_check_ue_event().
>>>
>>> So it really feels like something about the design is wrong if we have
>>> to go to virtual mode again and queue more irq work here.
>>>
>>> I guess we can probably merge this as a backportable fix, doing anything
>>> else would be a bigger change.
>> I agree.
>>
>>> Looking at ras.c there's the comment:
>>>
>>> 	 * Enable translation as we will be accessing per-cpu variables
>>> 	 * in save_mce_event() which may fall outside RMO region, also
>>>
>>> But AFAICS it's only irq_work_queue() that touches anything percpu?
>> Yeah, we left the comment unchanged after doing some modifications around it,
>> It needs to be updated, ill send a separate patch for it.
> Thanks.
>
> I see some other comments that look out of date, ie. the one above
> machine_check_process_queued_event() mentions syscall exit, which is no
> longer true.

ill take care of it.

>
> There's also comments in pseries/ras.c about fwnmi_release_errinfo()
> crashing in real mode, but we call it in real mode now so that must be
> fixed?

Yes, it is fixed now.

>
>>> So maybe we should just not be using irq_work_queue(). It's a pretty
>>> thin wrapper around set_dec(1), perhaps we just need to hand-roll some
>>> real-mode friendly way of doing that.
>> You mean, have separate queue and run the work from timer handler?
> Yeah something like that.
>
> We don't even need a queue, we already have local_paca->mce_info->mce_queue_count.
>
> So it could just be:
>
>    if (local_paca->mce_info->mce_queue_count)
>    	machine_check_process_queued_event();
>
> Though it would need a wrapper because local_paca only exists for 64-bit.

Thanks, ill look into it.

>
> cheers

--------------C54619CBB058F90F152DF72D
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre>On 9/8/21 11:10 AM, Michael Ellerman wrote:</pre>
    <blockquote type="cite" cite="mid:87mtonmxp6.fsf@mpe.ellerman.id.au">
      <pre class="moz-quote-pre" wrap="">Ganesh <a class="moz-txt-link-rfc2396E" href="mailto:ganeshgr@linux.ibm.com">&lt;ganeshgr@linux.ibm.com&gt;</a> writes:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">On 9/6/21 6:03 PM, Michael Ellerman wrote:

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">Ganesh Goudar <a class="moz-txt-link-rfc2396E" href="mailto:ganeshgr@linux.ibm.com">&lt;ganeshgr@linux.ibm.com&gt;</a> writes
</pre>
        </blockquote>
        <blockquote type="cite">
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">Oops: Kernel access of bad area, sig: 11 [#1]
LE PAGE_SIZE=64K MMU=Hash SMP NR_CPUS=2048 NUMA pSeries
CPU: 5 PID: 1883 Comm: insmod Tainted: G        OE     5.14.0-mce+ #137
NIP:  c000000000735d60 LR: c000000000318640 CTR: 0000000000000000
REGS: c00000001ebff9a0 TRAP: 0300   Tainted: G       OE      (5.14.0-mce+)
MSR:  8000000000001003 &lt;SF,ME,RI,LE&gt;  CR: 28008228  XER: 00000001
CFAR: c00000000031863c DAR: c00000027fa8fe08 DSISR: 40000000 IRQMASK: 0
GPR00: c0000000003186d0 c00000001ebffc40 c000000001b0df00 c0000000016337e8
GPR04: c0000000016337e8 c00000027fa8fe08 0000000000000023 c0000000016337f0
GPR08: 0000000000000023 c0000000012ffe08 0000000000000000 c008000001460240
GPR12: 0000000000000000 c00000001ec9a900 c00000002ac4bd00 0000000000000000
GPR16: 00000000000005a0 c0080000006b0000 c0080000006b05a0 c000000000ff3068
GPR20: c00000002ac4bbc0 0000000000000001 c00000002ac4bbc0 c008000001490298
GPR24: c008000001490108 c000000001636198 c008000001470090 c008000001470058
GPR28: 0000000000000510 c008000001000000 c008000008000019 0000000000000019
NIP [c000000000735d60] llist_add_batch+0x0/0x40
LR [c000000000318640] __irq_work_queue_local+0x70/0xc0
Call Trace:
[c00000001ebffc40] [c00000001ebffc0c] 0xc00000001ebffc0c (unreliable)
[c00000001ebffc60] [c0000000003186d0] irq_work_queue+0x40/0x70
[c00000001ebffc80] [c00000000004425c] machine_check_queue_event+0xbc/0xd0
[c00000001ebffcf0] [c00000000000838c] machine_check_early_common+0x16c/0x1f4

Fixes: 74c3354bc1d89 ("powerpc/pseries/mce: restore msr before returning from handler")
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">Please explain in more detail why that commit caused this breakage.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
After enabling translation in mce_handle_error() we used to leave it enabled to avoid
crashing here, but now with this commit we are restoring the MSR to disable translation.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Are you sure we left the MMU enabled to avoid crashing there, or we just
left it enabled by accident?</pre>
    </blockquote>
    <pre>No, I think we left it enabled intentionally, I mentioned about leaving it enabled
in my comment and commit message of a95a0a1654 "powerpc/pseries: Fix MCE handling on pseries".
</pre>
    <blockquote type="cite" cite="mid:87mtonmxp6.fsf@mpe.ellerman.id.au">
      <pre class="moz-quote-pre" wrap="">

But yeah, previously the MMU was enabled when we got here whereas now
it's not, because of that change.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Missed to mention it in commit log, I will add it.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Thanks.

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">diff --git a/arch/powerpc/kernel/mce.c b/arch/powerpc/kernel/mce.c
index 47a683cd00d2..9d1e39d42e3e 100644
--- a/arch/powerpc/kernel/mce.c
+++ b/arch/powerpc/kernel/mce.c
@@ -249,6 +249,7 @@ void machine_check_queue_event(void)
  {
  	int index;
  	struct machine_check_event evt;
+	unsigned long msr;
  
  	if (!get_mce_event(&amp;evt, MCE_EVENT_RELEASE))
  		return;
@@ -262,8 +263,19 @@ void machine_check_queue_event(void)
  	memcpy(&amp;local_paca-&gt;mce_info-&gt;mce_event_queue[index],
  	       &amp;evt, sizeof(evt));
  
-	/* Queue irq work to process this event later. */
-	irq_work_queue(&amp;mce_event_process_work);
+	/* Queue irq work to process this event later. Before
+	 * queuing the work enable translation for non radix LPAR,
+	 * as irq_work_queue may try to access memory outside RMO
+	 * region.
+	 */
+	if (!radix_enabled() &amp;&amp; firmware_has_feature(FW_FEATURE_LPAR)) {
+		msr = mfmsr();
+		mtmsr(msr | MSR_IR | MSR_DR);
+		irq_work_queue(&amp;mce_event_process_work);
+		mtmsr(msr);
+	} else {
+		irq_work_queue(&amp;mce_event_process_work);
+	}
  }
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">We already went to virtual mode and queued (different) irq work in
arch/powerpc/platforms/pseries/ras.c:mce_handle_error()

We also called save_mce_event() which also might have queued irq work,
via machine_check_ue_event().

So it really feels like something about the design is wrong if we have
to go to virtual mode again and queue more irq work here.

I guess we can probably merge this as a backportable fix, doing anything
else would be a bigger change.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
I agree.

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
Looking at ras.c there's the comment:

	 * Enable translation as we will be accessing per-cpu variables
	 * in save_mce_event() which may fall outside RMO region, also

But AFAICS it's only irq_work_queue() that touches anything percpu?
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Yeah, we left the comment unchanged after doing some modifications around it,
It needs to be updated, ill send a separate patch for it.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Thanks.

I see some other comments that look out of date, ie. the one above
machine_check_process_queued_event() mentions syscall exit, which is no
longer true.</pre>
    </blockquote>
    <pre>ill take care of it.</pre>
    <blockquote type="cite" cite="mid:87mtonmxp6.fsf@mpe.ellerman.id.au">
      <pre class="moz-quote-pre" wrap="">

There's also comments in pseries/ras.c about fwnmi_release_errinfo()
crashing in real mode, but we call it in real mode now so that must be
fixed?</pre>
    </blockquote>
    <pre>Yes, it is fixed now.
</pre>
    <blockquote type="cite" cite="mid:87mtonmxp6.fsf@mpe.ellerman.id.au">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">So maybe we should just not be using irq_work_queue(). It's a pretty
thin wrapper around set_dec(1), perhaps we just need to hand-roll some
real-mode friendly way of doing that.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
You mean, have separate queue and run the work from timer handler?
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Yeah something like that.

We don't even need a queue, we already have local_paca-&gt;mce_info-&gt;mce_queue_count.

So it could just be:

  if (local_paca-&gt;mce_info-&gt;mce_queue_count)
  	machine_check_process_queued_event();

Though it would need a wrapper because local_paca only exists for 64-bit.</pre>
    </blockquote>
    <pre>Thanks, ill look into it.  
</pre>
    <blockquote type="cite" cite="mid:87mtonmxp6.fsf@mpe.ellerman.id.au">
      <pre class="moz-quote-pre" wrap="">

cheers
</pre>
    </blockquote>
  </body>
</html>

--------------C54619CBB058F90F152DF72D--

