Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4118B18CB1E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 11:05:09 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48kKC448LdzDrFr
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 21:05:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ganeshgr@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48kHzR6YbpzDrZD
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Mar 2020 20:09:55 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02K92QwH146773
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Mar 2020 05:09:53 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yu71c2v3b-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Mar 2020 05:09:53 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <ganeshgr@linux.ibm.com>;
 Fri, 20 Mar 2020 09:09:50 -0000
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 20 Mar 2020 09:09:48 -0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02K99ltC59572342
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 20 Mar 2020 09:09:47 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4737711C052;
 Fri, 20 Mar 2020 09:09:47 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2C1E511C054;
 Fri, 20 Mar 2020 09:09:45 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.199.55.224])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 20 Mar 2020 09:09:44 +0000 (GMT)
Subject: Re: [PATCH] powerpc/pseries: Fix MCE handling on pseries
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au
References: <20200313140418.7940-1-ganeshgr@linux.ibm.com>
 <1584157063.g5s75uhbdu.astroid@bobo.none>
 <d22f9ef9-07db-9615-6420-001b85dd2742@linux.ibm.com>
 <1584437866.2pbq6ca4ia.astroid@bobo.none>
 <3d8acf3d-4996-3b4d-bc06-0ef7525035bb@linux.ibm.com>
 <1584670525.n2ybablt2y.astroid@bobo.none>
From: Ganesh <ganeshgr@linux.ibm.com>
Date: Fri, 20 Mar 2020 14:39:43 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <1584670525.n2ybablt2y.astroid@bobo.none>
Content-Type: multipart/alternative;
 boundary="------------846D6611CA673ADC26A0ECDC"
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 20032009-0008-0000-0000-0000036085AF
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20032009-0009-0000-0000-00004A81E666
Message-Id: <678cd99f-4377-4242-2a27-c9ac8c57606f@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-20_01:2020-03-19,
 2020-03-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 mlxscore=0 phishscore=0
 priorityscore=1501 adultscore=0 clxscore=1015 bulkscore=0 mlxlogscore=999
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003200037
X-Mailman-Approved-At: Fri, 20 Mar 2020 21:00:22 +1100
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
Cc: mahesh@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------846D6611CA673ADC26A0ECDC
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/20/20 8:11 AM, Nicholas Piggin wrote:
> Ganesh's on March 18, 2020 12:35 am:
>>
>> On 3/17/20 3:31 PM, Nicholas Piggin wrote:
>>> Ganesh's on March 16, 2020 9:47 pm:
>>>> On 3/14/20 9:18 AM, Nicholas Piggin wrote:
>>>>> Ganesh Goudar's on March 14, 2020 12:04 am:
>>>>>> MCE handling on pSeries platform fails as recent rework to use common
>>>>>> code for pSeries and PowerNV in machine check error handling tries to
>>>>>> access per-cpu variables in realmode. The per-cpu variables may be
>>>>>> outside the RMO region on pSeries platform and needs translation to be
>>>>>> enabled for access. Just moving these per-cpu variable into RMO region
>>>>>> did'nt help because we queue some work to workqueues in real mode, which
>>>>>> again tries to touch per-cpu variables.
>>>>> Which queues are these? We should not be using Linux workqueues, but the
>>>>> powerpc mce code which uses irq_work.
>>>> Yes, irq work queues accesses memory outside RMO.
>>>> irq_work_queue()->__irq_work_queue_local()->[this_cpu_ptr(&lazy_list) | this_cpu_ptr(&raised_list)]
>>> Hmm, okay.
>>>
>>>>>> Also fwnmi_release_errinfo()
>>>>>> cannot be called when translation is not enabled.
>>>>> Why not?
>>>> It crashes when we try to get RTAS token for "ibm, nmi-interlock" device
>>>> tree node. But yes we can avoid it by storing it rtas_token somewhere but haven't
>>>> tried it, here is the backtrace I got when fwnmi_release_errinfo() called from
>>>> realmode handler.
>>> Okay, I actually had problems with that messing up soft-irq state too
>>> and so I sent a patch to get rid of it, but that's the least of your
>>> problems really.
>>>
>>>>>> This patch fixes this by enabling translation in the exception handler
>>>>>> when all required real mode handling is done. This change only affects
>>>>>> the pSeries platform.
>>>>> Not supposed to do this, because we might not be in a state
>>>>> where the MMU is ready to be turned on at this point.
>>>>>
>>>>> I'd like to understand better which accesses are a problem, and whether
>>>>> we can fix them all to be in the RMO.
>>>> I faced three such access problems,
>>>>     * accessing per-cpu data (like mce_event,mce_event_queue and mce_event_queue),
>>>>       we can move this inside RMO.
>>>>     * calling fwnmi_release_errinfo().
>>>>     * And queuing work to irq_work_queue, not sure how to fix this.
>>> Yeah. The irq_work_queue one is the biggest problem.
>>>
>>> This code "worked" prior to the series unifying pseries and powernv
>>> machine check handlers, 9ca766f9891d ("powerpc/64s/pseries: machine
>>> check convert to use common event code") and friends. But it does in
>>> basically the same way as your fix (i.e., it runs this early handler
>>> in virtual mode), but that's not really the right fix.
>>>
>>> Consider: you get a SLB multi hit on a kernel address due to hardware or
>>> software error. That access causes a MCE, but before the error can be
>>> decode to save and flush the SLB, you turn on relocation and that
>>> causes another SLB multi hit...
>> We turn on relocation only after all the realmode handling/recovery is done
>> like SLB flush and reload, All we do after we turn relocation on is saving
>> mce event to array and queuing the work to irq_workqueue.
> Oh I see, fwnmi_release_errinfo is done after mce_handle_error, I didnt
> read your comment closely!
>
> That means the recovery is done with MSR[ME]=0, which means saving the
> SLB entries can take a machine check which will turn into a checkstop,
> or walking user page tables and loading memory to handle memory
> failures.
>
> We really should release that immediately so we get ME back on.
>
>> So we are good to turn it on here.
> Possibly. I don't think it's generally a good idea enable relocation
> from an interrupted relocation off context, but yeah this might be okay.
>
> I think FWNMI mce needs to be fixed to not do this, and do the
> nmi-interlock earlier, but for now your patch I guess improves things
> significantly. So, okay let's go with it.
>
> You should be able to just use mtmsrd to switch to virtual mode, so no
> need for the asm code.
>
>    mtmsr(mfmsr()|MSR_IR|MSR_DR);

Sure, Thanks

>
> Otherwise,
>
> Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
>
> Thanks,
> Nick


--------------846D6611CA673ADC26A0ECDC
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <br>
    <br>
    <div class="moz-cite-prefix">On 3/20/20 8:11 AM, Nicholas Piggin
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:1584670525.n2ybablt2y.astroid@bobo.none">
      <pre class="moz-quote-pre" wrap="">Ganesh's on March 18, 2020 12:35 am:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">

On 3/17/20 3:31 PM, Nicholas Piggin wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">Ganesh's on March 16, 2020 9:47 pm:
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">
On 3/14/20 9:18 AM, Nicholas Piggin wrote:
</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">Ganesh Goudar's on March 14, 2020 12:04 am:
</pre>
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">MCE handling on pSeries platform fails as recent rework to use common
code for pSeries and PowerNV in machine check error handling tries to
access per-cpu variables in realmode. The per-cpu variables may be
outside the RMO region on pSeries platform and needs translation to be
enabled for access. Just moving these per-cpu variable into RMO region
did'nt help because we queue some work to workqueues in real mode, which
again tries to touch per-cpu variables.
</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">Which queues are these? We should not be using Linux workqueues, but the
powerpc mce code which uses irq_work.
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">Yes, irq work queues accesses memory outside RMO.
irq_work_queue()-&gt;__irq_work_queue_local()-&gt;[this_cpu_ptr(&amp;lazy_list) | this_cpu_ptr(&amp;raised_list)]
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">Hmm, okay.

</pre>
          <blockquote type="cite">
            <blockquote type="cite">
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">Also fwnmi_release_errinfo()
cannot be called when translation is not enabled.
</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">Why not?
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">It crashes when we try to get RTAS token for "ibm, nmi-interlock" device
tree node. But yes we can avoid it by storing it rtas_token somewhere but haven't
tried it, here is the backtrace I got when fwnmi_release_errinfo() called from
realmode handler.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">Okay, I actually had problems with that messing up soft-irq state too
and so I sent a patch to get rid of it, but that's the least of your
problems really.

</pre>
          <blockquote type="cite">
            <blockquote type="cite">
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">This patch fixes this by enabling translation in the exception handler
when all required real mode handling is done. This change only affects
the pSeries platform.
</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">Not supposed to do this, because we might not be in a state
where the MMU is ready to be turned on at this point.

I'd like to understand better which accesses are a problem, and whether
we can fix them all to be in the RMO.
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">I faced three such access problems,
   * accessing per-cpu data (like mce_event,mce_event_queue and mce_event_queue),
     we can move this inside RMO.
   * calling fwnmi_release_errinfo().
   * And queuing work to irq_work_queue, not sure how to fix this.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">Yeah. The irq_work_queue one is the biggest problem.

This code "worked" prior to the series unifying pseries and powernv
machine check handlers, 9ca766f9891d ("powerpc/64s/pseries: machine
check convert to use common event code") and friends. But it does in
basically the same way as your fix (i.e., it runs this early handler
in virtual mode), but that's not really the right fix.

Consider: you get a SLB multi hit on a kernel address due to hardware or
software error. That access causes a MCE, but before the error can be
decode to save and flush the SLB, you turn on relocation and that
causes another SLB multi hit...
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
We turn on relocation only after all the realmode handling/recovery is done
like SLB flush and reload, All we do after we turn relocation on is saving
mce event to array and queuing the work to irq_workqueue.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Oh I see, fwnmi_release_errinfo is done after mce_handle_error, I didnt
read your comment closely!

That means the recovery is done with MSR[ME]=0, which means saving the
SLB entries can take a machine check which will turn into a checkstop,
or walking user page tables and loading memory to handle memory 
failures.

We really should release that immediately so we get ME back on.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">So we are good to turn it on here.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Possibly. I don't think it's generally a good idea enable relocation
from an interrupted relocation off context, but yeah this might be okay.

I think FWNMI mce needs to be fixed to not do this, and do the
nmi-interlock earlier, but for now your patch I guess improves things
significantly. So, okay let's go with it.

You should be able to just use mtmsrd to switch to virtual mode, so no
need for the asm code.

  mtmsr(mfmsr()|MSR_IR|MSR_DR);</pre>
    </blockquote>
    <pre>Sure, Thanks
</pre>
    <blockquote type="cite"
      cite="mid:1584670525.n2ybablt2y.astroid@bobo.none">
      <pre class="moz-quote-pre" wrap="">

Otherwise,

Reviewed-by: Nicholas Piggin <a class="moz-txt-link-rfc2396E" href="mailto:npiggin@gmail.com">&lt;npiggin@gmail.com&gt;</a>

Thanks,
Nick
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------846D6611CA673ADC26A0ECDC--

