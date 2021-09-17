Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0274340F461
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Sep 2021 10:47:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H9nd56MmCz305h
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Sep 2021 18:47:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RlazjpnM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=ganeshgr@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=RlazjpnM; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H9nTK2n7Mz2xvG
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Sep 2021 18:40:20 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18H8Qh1L012099; 
 Fri, 17 Sep 2021 04:40:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type; s=pp1; bh=mYy2uboKlr/gD81W+0jUXFmzk5rbAxGpEzENeLc+aDE=;
 b=RlazjpnMIC7oegwqRx/TIkANFlLnYELxiex7NHZ7OEhAYEBtN4yyb33TdxUfWnm5mpBI
 2Bg+8Vd54+znLjdAFhK4TvuRrmRgV5HIXOiLmNf5cUhC8zKAqkswO8YHbI5tDGaOlj/q
 0/lON0oDS5qGHrKSxR3INMvHW1aIwuArh32sf0uMjeOj34sP6nUjxyGeICfxQk1EpCt+
 iVNsWW3Lvq9gP6m+ZfYqRM86h7qyf7tJKWtmjf7AHMKyyL0Q9o34zEP6qe6CtD+1WKU0
 v3IGvEADALK6k3yTE/VnbXrnH9Etgp4xhKJA/AxwwDxbGBgolRjx/KMWXn4iBophZdSw aA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3b4jqypra0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Sep 2021 04:40:12 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 18H7vYqr026731;
 Fri, 17 Sep 2021 04:40:11 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3b4jqypr9j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Sep 2021 04:40:11 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 18H8X32X025776;
 Fri, 17 Sep 2021 08:40:09 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04ams.nl.ibm.com with ESMTP id 3b0m3av1yg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Sep 2021 08:40:09 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 18H8e7t740698326
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 Sep 2021 08:40:07 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F10B5AE067;
 Fri, 17 Sep 2021 08:40:06 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 36A8EAE045;
 Fri, 17 Sep 2021 08:40:05 +0000 (GMT)
Received: from li-c7b85bcc-2727-11b2-a85c-a9ba7f3a2193.ibm.com (unknown
 [9.43.80.218]) by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 17 Sep 2021 08:40:04 +0000 (GMT)
Subject: Re: [PATCH v2] powerpc/mce: Fix access error in mce handler
To: Daniel Axtens <dja@axtens.net>, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au
References: <20210909064330.312432-1-ganeshgr@linux.ibm.com>
 <87lf3v903y.fsf@linkitivity.dja.id.au>
From: Ganesh <ganeshgr@linux.ibm.com>
Message-ID: <d0a9d52f-b427-757e-0fab-e63ef7c035b1@linux.ibm.com>
Date: Fri, 17 Sep 2021 14:10:03 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <87lf3v903y.fsf@linkitivity.dja.id.au>
Content-Type: multipart/alternative;
 boundary="------------6C24F535DA50341CB001A694"
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Rit6zHGmMr6egaU6jgUDaDTVYsgf7uCG
X-Proofpoint-GUID: Xkft6wkz4w6fh2fNyy5OUQibjDCM1lXW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-17_04,2021-09-16_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 clxscore=1011 priorityscore=1501 suspectscore=0 mlxlogscore=999
 malwarescore=0 adultscore=0 mlxscore=0 phishscore=0 impostorscore=0
 spamscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109170054
X-Mailman-Approved-At: Fri, 17 Sep 2021 18:46:29 +1000
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
--------------6C24F535DA50341CB001A694
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/17/21 12:09 PM, Daniel Axtens wrote:

> Hi Ganesh,
>
>> We queue an irq work for deferred processing of mce event
>> in realmode mce handler, where translation is disabled.
>> Queuing of the work may result in accessing memory outside
>> RMO region, such access needs the translation to be enabled
>> for an LPAR running with hash mmu else the kernel crashes.
>>
>> After enabling translation in mce_handle_error() we used to
>> leave it enabled to avoid crashing here, but now with the
>> commit 74c3354bc1d89 ("powerpc/pseries/mce: restore msr before
>> returning from handler") we are restoring the MSR to disable
>> translation.
>>
>> Hence to fix this enable the translation before queuing the work.
> [snip]
>
>> Fixes: 74c3354bc1d89 ("powerpc/pseries/mce: restore msr before returning from handler")
> That patch changes arch/powerpc/powerpc/platforms/pseries/ras.c just
> below this comment:
>
>      /*
>       * Enable translation as we will be accessing per-cpu variables
>       * in save_mce_event() which may fall outside RMO region, also
>       * leave it enabled because subsequently we will be queuing work
>       * to workqueues where again per-cpu variables accessed, besides
>       * fwnmi_release_errinfo() crashes when called in realmode on
>       * pseries.
>       * Note: All the realmode handling like flushing SLB entries for
>       *       SLB multihit is done by now.
>       */
>
> That suggests per-cpu variables need protection. In your patch, you
> enable translations just around irq_work_queue:

The comment is bit old, most of it doesn't make any sense now, yes per-cpu
variables cannot be accessed in realmode, but with commit 923b3cf00b3f
("powerpc/mce: Remove per cpu variables from MCE handlers") we moved all of
them to paca.

>> +	/* Queue irq work to process this event later. Before
>> +	 * queuing the work enable translation for non radix LPAR,
>> +	 * as irq_work_queue may try to access memory outside RMO
>> +	 * region.
>> +	 */
>> +	if (!radix_enabled() && firmware_has_feature(FW_FEATURE_LPAR)) {
>> +		msr = mfmsr();
>> +		mtmsr(msr | MSR_IR | MSR_DR);
>> +		irq_work_queue(&mce_event_process_work);
>> +		mtmsr(msr);
>> +	} else {
>> +		irq_work_queue(&mce_event_process_work);
>> +	}
> However, just before that in the function, there are a few things that
> access per-cpu variables via the local_paca, e.g.:
>
> memcpy(&local_paca->mce_info->mce_event_queue[index],
>         &evt, sizeof(evt));
>
> Do we need to widen the window where translations are enabled in order
> to protect accesses to local_paca?

paca will be within Real Mode Area, so it can be accessed with translate off.


--------------6C24F535DA50341CB001A694
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">
      <pre>On 9/17/21 12:09 PM, Daniel Axtens wrote:</pre>
    </div>
    <blockquote type="cite"
      cite="mid:87lf3v903y.fsf@linkitivity.dja.id.au">
      <pre class="moz-quote-pre" wrap="">Hi Ganesh,

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">We queue an irq work for deferred processing of mce event
in realmode mce handler, where translation is disabled.
Queuing of the work may result in accessing memory outside
RMO region, such access needs the translation to be enabled
for an LPAR running with hash mmu else the kernel crashes.

After enabling translation in mce_handle_error() we used to
leave it enabled to avoid crashing here, but now with the
commit 74c3354bc1d89 ("powerpc/pseries/mce: restore msr before
returning from handler") we are restoring the MSR to disable
translation.

Hence to fix this enable the translation before queuing the work.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
[snip]

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Fixes: 74c3354bc1d89 ("powerpc/pseries/mce: restore msr before returning from handler")
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
That patch changes arch/powerpc/powerpc/platforms/pseries/ras.c just
below this comment:

    /*
     * Enable translation as we will be accessing per-cpu variables
     * in save_mce_event() which may fall outside RMO region, also
     * leave it enabled because subsequently we will be queuing work
     * to workqueues where again per-cpu variables accessed, besides
     * fwnmi_release_errinfo() crashes when called in realmode on
     * pseries.
     * Note: All the realmode handling like flushing SLB entries for
     *       SLB multihit is done by now.
     */

That suggests per-cpu variables need protection. In your patch, you
enable translations just around irq_work_queue:</pre>
    </blockquote>
    <pre class="moz-quote-pre" wrap="">The comment is bit old, most of it doesn't make any sense now, yes per-cpu
variables cannot be accessed in realmode, but with commit 923b3cf00b3f
("powerpc/mce: Remove per cpu variables from MCE handlers") we moved all of
them to paca.

</pre>
    <blockquote type="cite"
      cite="mid:87lf3v903y.fsf@linkitivity.dja.id.au">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+	/* Queue irq work to process this event later. Before
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
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
However, just before that in the function, there are a few things that
access per-cpu variables via the local_paca, e.g.:

memcpy(&amp;local_paca-&gt;mce_info-&gt;mce_event_queue[index],
       &amp;evt, sizeof(evt));

Do we need to widen the window where translations are enabled in order
to protect accesses to local_paca?</pre>
    </blockquote>
    <pre class="moz-quote-pre" wrap="">paca will be within Real Mode Area, so it can be accessed with translate off. 
</pre>
    <blockquote type="cite"
      cite="mid:87lf3v903y.fsf@linkitivity.dja.id.au">
    </blockquote>
  </body>
</html>

--------------6C24F535DA50341CB001A694--

