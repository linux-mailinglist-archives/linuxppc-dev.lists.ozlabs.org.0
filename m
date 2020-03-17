Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B756218991D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Mar 2020 11:18:44 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48j5bj3VBLzDqwP
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Mar 2020 21:18:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ganeshgr@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48hbLs2sRPzDqjh
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Mar 2020 01:35:49 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02HEWD3v085421
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Mar 2020 10:35:46 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yru54bp99-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Mar 2020 10:35:46 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <ganeshgr@linux.ibm.com>;
 Tue, 17 Mar 2020 14:35:44 -0000
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 17 Mar 2020 14:35:42 -0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02HEZfxq55771146
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 17 Mar 2020 14:35:41 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9C044A4051;
 Tue, 17 Mar 2020 14:35:41 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5F4B5A4040;
 Tue, 17 Mar 2020 14:35:40 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.199.59.221])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 17 Mar 2020 14:35:40 +0000 (GMT)
Subject: Re: [PATCH] powerpc/pseries: Fix MCE handling on pseries
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au
References: <20200313140418.7940-1-ganeshgr@linux.ibm.com>
 <1584157063.g5s75uhbdu.astroid@bobo.none>
 <d22f9ef9-07db-9615-6420-001b85dd2742@linux.ibm.com>
 <1584437866.2pbq6ca4ia.astroid@bobo.none>
From: Ganesh <ganeshgr@linux.ibm.com>
Date: Tue, 17 Mar 2020 20:05:39 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <1584437866.2pbq6ca4ia.astroid@bobo.none>
Content-Type: multipart/alternative;
 boundary="------------A03758E1FEFCED53C9652184"
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 20031714-0020-0000-0000-000003B5EB0B
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20031714-0021-0000-0000-0000220E4FED
Message-Id: <3d8acf3d-4996-3b4d-bc06-0ef7525035bb@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-17_05:2020-03-17,
 2020-03-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0
 phishscore=0 mlxscore=0 mlxlogscore=999 priorityscore=1501 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003170061
X-Mailman-Approved-At: Wed, 18 Mar 2020 21:15:10 +1100
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
--------------A03758E1FEFCED53C9652184
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/17/20 3:31 PM, Nicholas Piggin wrote:
> Ganesh's on March 16, 2020 9:47 pm:
>>
>> On 3/14/20 9:18 AM, Nicholas Piggin wrote:
>>> Ganesh Goudar's on March 14, 2020 12:04 am:
>>>> MCE handling on pSeries platform fails as recent rework to use common
>>>> code for pSeries and PowerNV in machine check error handling tries to
>>>> access per-cpu variables in realmode. The per-cpu variables may be
>>>> outside the RMO region on pSeries platform and needs translation to be
>>>> enabled for access. Just moving these per-cpu variable into RMO region
>>>> did'nt help because we queue some work to workqueues in real mode, which
>>>> again tries to touch per-cpu variables.
>>> Which queues are these? We should not be using Linux workqueues, but the
>>> powerpc mce code which uses irq_work.
>> Yes, irq work queues accesses memory outside RMO.
>> irq_work_queue()->__irq_work_queue_local()->[this_cpu_ptr(&lazy_list) | this_cpu_ptr(&raised_list)]
> Hmm, okay.
>
>>>> Also fwnmi_release_errinfo()
>>>> cannot be called when translation is not enabled.
>>> Why not?
>> It crashes when we try to get RTAS token for "ibm, nmi-interlock" device
>> tree node. But yes we can avoid it by storing it rtas_token somewhere but haven't
>> tried it, here is the backtrace I got when fwnmi_release_errinfo() called from
>> realmode handler.
> Okay, I actually had problems with that messing up soft-irq state too
> and so I sent a patch to get rid of it, but that's the least of your
> problems really.
>
>>>> This patch fixes this by enabling translation in the exception handler
>>>> when all required real mode handling is done. This change only affects
>>>> the pSeries platform.
>>> Not supposed to do this, because we might not be in a state
>>> where the MMU is ready to be turned on at this point.
>>>
>>> I'd like to understand better which accesses are a problem, and whether
>>> we can fix them all to be in the RMO.
>> I faced three such access problems,
>>    * accessing per-cpu data (like mce_event,mce_event_queue and mce_event_queue),
>>      we can move this inside RMO.
>>    * calling fwnmi_release_errinfo().
>>    * And queuing work to irq_work_queue, not sure how to fix this.
> Yeah. The irq_work_queue one is the biggest problem.
>
> This code "worked" prior to the series unifying pseries and powernv
> machine check handlers, 9ca766f9891d ("powerpc/64s/pseries: machine
> check convert to use common event code") and friends. But it does in
> basically the same way as your fix (i.e., it runs this early handler
> in virtual mode), but that's not really the right fix.
>
> Consider: you get a SLB multi hit on a kernel address due to hardware or
> software error. That access causes a MCE, but before the error can be
> decode to save and flush the SLB, you turn on relocation and that
> causes another SLB multi hit...

We turn on relocation only after all the realmode handling/recovery is done
like SLB flush and reload, All we do after we turn relocation on is saving
mce event to array and queuing the work to irq_workqueue.
So we are good to turn it on here.

> I think the irq_work subsystem will have to be changed to use an array
> unfortunately.
>
> Thanks,
> Nick
>


--------------A03758E1FEFCED53C9652184
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <br>
    <br>
    <div class="moz-cite-prefix">On 3/17/20 3:31 PM, Nicholas Piggin
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:1584437866.2pbq6ca4ia.astroid@bobo.none">
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
        <pre class="moz-quote-pre" wrap="">
Yes, irq work queues accesses memory outside RMO.
irq_work_queue()-&gt;__irq_work_queue_local()-&gt;[this_cpu_ptr(&amp;lazy_list) | this_cpu_ptr(&amp;raised_list)]
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Hmm, okay.

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
        <pre class="moz-quote-pre" wrap="">
It crashes when we try to get RTAS token for "ibm, nmi-interlock" device
tree node. But yes we can avoid it by storing it rtas_token somewhere but haven't
tried it, here is the backtrace I got when fwnmi_release_errinfo() called from
realmode handler.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Okay, I actually had problems with that messing up soft-irq state too
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
        <pre class="moz-quote-pre" wrap="">
I faced three such access problems,
  * accessing per-cpu data (like mce_event,mce_event_queue and mce_event_queue),
    we can move this inside RMO.
  * calling fwnmi_release_errinfo().
  * And queuing work to irq_work_queue, not sure how to fix this.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Yeah. The irq_work_queue one is the biggest problem.

This code "worked" prior to the series unifying pseries and powernv
machine check handlers, 9ca766f9891d ("powerpc/64s/pseries: machine 
check convert to use common event code") and friends. But it does in
basically the same way as your fix (i.e., it runs this early handler
in virtual mode), but that's not really the right fix.

Consider: you get a SLB multi hit on a kernel address due to hardware or 
software error. That access causes a MCE, but before the error can be 
decode to save and flush the SLB, you turn on relocation and that
causes another SLB multi hit...</pre>
    </blockquote>
    <pre>We turn on relocation only after all the realmode handling/recovery is done
like SLB flush and reload, All we do after we turn relocation on is saving
mce event to array and queuing the work to irq_workqueue.
So we are good to turn it on here.
</pre>
    <blockquote type="cite"
      cite="mid:1584437866.2pbq6ca4ia.astroid@bobo.none">
      <pre class="moz-quote-pre" wrap="">
I think the irq_work subsystem will have to be changed to use an array
unfortunately.

Thanks,
Nick

</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------A03758E1FEFCED53C9652184--

