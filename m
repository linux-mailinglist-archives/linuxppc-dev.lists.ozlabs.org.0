Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 996F85BC417
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Sep 2022 10:14:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MWHWs2GWdz3bls
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Sep 2022 18:14:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UZIKR6sd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ganeshgr@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UZIKR6sd;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MWDd06rJRz2yYL
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Sep 2022 16:03:32 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28J5K7Br002816;
	Mon, 19 Sep 2022 06:03:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 message-id : date : mime-version : subject : to : cc : references : from :
 in-reply-to; s=pp1; bh=b0JxFeJQMsGrOIKS8SCWKkrVTBJMriLRD6npqoHFZZg=;
 b=UZIKR6sdXoUp5ZhgE8lknsUvkIVEHlWOkj4Bq81HgMEGpFk1XEpQi2wudAzllML13D85
 uRdFupOf4U4kevCYKKXqc4PrCV3akWrIIsfSkj15/ifrU+SlLmNqqttO+AbrDcXKexd7
 ZSb2cT9g4oJx+rxDqNXnkXYO3JYjuR/W2/PtBbAfXUA6NmO+B75ovjmFyOHMrMNsBC4e
 RQQFl0p+tkdTw4paaXumiQnewSh9Cu+k86U+tPznPEki4vHpp7lW/c3R8r8PT/PS2Qfs
 z7tKZiBCAotsoWemgaL537+nuvkErkuLsWAchi1nmSWN07X93l9C0npD9duNtSvawfjo pg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jpj680sqr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Sep 2022 06:03:26 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28J5aoGR032155;
	Mon, 19 Sep 2022 06:03:26 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jpj680sq4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Sep 2022 06:03:26 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28J5p1Ne001007;
	Mon, 19 Sep 2022 06:03:24 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
	by ppma06ams.nl.ibm.com with ESMTP id 3jn5gj1y1s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Sep 2022 06:03:24 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
	by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28J63k9j40960400
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 19 Sep 2022 06:03:46 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D9C1DA4053;
	Mon, 19 Sep 2022 06:03:20 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2E5D7A4040;
	Mon, 19 Sep 2022 06:03:19 +0000 (GMT)
Received: from [9.43.125.247] (unknown [9.43.125.247])
	by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon, 19 Sep 2022 06:03:18 +0000 (GMT)
Content-Type: multipart/alternative;
 boundary="------------xnH1tx2oswo1w1EnfCqTvUwT"
Message-ID: <895f4387-582a-6d60-a176-e2112f506e12@linux.ibm.com>
Date: Mon, 19 Sep 2022 11:33:17 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PACTH v2] powerpc/pseries/mce: Avoid instrumentation in realmode
Content-Language: en-US
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org,
        mpe@ellerman.id.au
References: <20220905063811.16454-1-ganeshgr@linux.ibm.com>
 <CMPVP7RZXP5G.2D3ZNQPWARIG8@bobo>
From: Ganesh <ganeshgr@linux.ibm.com>
In-Reply-To: <CMPVP7RZXP5G.2D3ZNQPWARIG8@bobo>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: AceP4uWgcU3JhxDaC-TzwUxKYIIHO99E
X-Proofpoint-ORIG-GUID: u5za0AjZP54b_r_2w-7Rj-DUW-k82WTI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-19_03,2022-09-16_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 mlxscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 clxscore=1015
 mlxlogscore=772 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2209130000 definitions=main-2209190039
X-Mailman-Approved-At: Mon, 19 Sep 2022 18:12:32 +1000
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
Cc: mahesh@linux.ibm.com, sachinp@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------xnH1tx2oswo1w1EnfCqTvUwT
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/7/22 09:49, Nicholas Piggin wrote:

> On Mon Sep 5, 2022 at 4:38 PM AEST, Ganesh Goudar wrote:
>> Part of machine check error handling is done in realmode,
>> As of now instrumentation is not possible for any code that
>> runs in realmode.
>> When MCE is injected on KASAN enabled kernel, crash is
>> observed, Hence force inline or mark no instrumentation
>> for functions which can run in realmode, to avoid KASAN
>> instrumentation.
>>
>> Signed-off-by: Ganesh Goudar<ganeshgr@linux.ibm.com>
>> ---
>> v2: Force inline few more functions.
>> ---
>>   arch/powerpc/include/asm/hw_irq.h    | 8 ++++----
>>   arch/powerpc/include/asm/interrupt.h | 2 +-
>>   arch/powerpc/include/asm/rtas.h      | 4 ++--
>>   arch/powerpc/kernel/rtas.c           | 4 ++--
>>   4 files changed, 9 insertions(+), 9 deletions(-)
>>
>> diff --git a/arch/powerpc/include/asm/hw_irq.h b/arch/powerpc/include/asm/hw_irq.h
>> index 26ede09c521d..3264991fe524 100644
>> --- a/arch/powerpc/include/asm/hw_irq.h
>> +++ b/arch/powerpc/include/asm/hw_irq.h
>> @@ -111,7 +111,7 @@ static inline void __hard_RI_enable(void)
>>   #ifdef CONFIG_PPC64
>>   #include <asm/paca.h>
>>   
>> -static inline notrace unsigned long irq_soft_mask_return(void)
>> +static __always_inline notrace unsigned long irq_soft_mask_return(void)
>>   {
>>   	return READ_ONCE(local_paca->irq_soft_mask);
>>   }
>> @@ -121,7 +121,7 @@ static inline notrace unsigned long irq_soft_mask_return(void)
>>    * for the critical section and as a clobber because
>>    * we changed paca->irq_soft_mask
>>    */
>> -static inline notrace void irq_soft_mask_set(unsigned long mask)
>> +static __always_inline notrace void irq_soft_mask_set(unsigned long mask)
>>   {
>>   	/*
>>   	 * The irq mask must always include the STD bit if any are set.
> This doesn't give a reason why it's __always_inline, and having the
> notrace attribute makes it possibly confusing. I think it would be easy
> for someone to break without realising. Could you add a noinstr to these
> instead / as well?

Yeah we can add noinstr. Missed to see your comment, Sorry for the delayed reply

>
> What about adding a 'realmode' function annotation that includes noinstr?

You mean to define a new function annotation?


--------------xnH1tx2oswo1w1EnfCqTvUwT
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">
      <pre>On 9/7/22 09:49, Nicholas Piggin wrote:</pre>
    </div>
    <blockquote type="cite" cite="mid:CMPVP7RZXP5G.2D3ZNQPWARIG8@bobo">
      <pre class="moz-quote-pre" wrap="">On Mon Sep 5, 2022 at 4:38 PM AEST, Ganesh Goudar wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Part of machine check error handling is done in realmode,
As of now instrumentation is not possible for any code that
runs in realmode.
When MCE is injected on KASAN enabled kernel, crash is
observed, Hence force inline or mark no instrumentation
for functions which can run in realmode, to avoid KASAN
instrumentation.

Signed-off-by: Ganesh Goudar <a class="moz-txt-link-rfc2396E" href="mailto:ganeshgr@linux.ibm.com">&lt;ganeshgr@linux.ibm.com&gt;</a>
---
v2: Force inline few more functions.
---
 arch/powerpc/include/asm/hw_irq.h    | 8 ++++----
 arch/powerpc/include/asm/interrupt.h | 2 +-
 arch/powerpc/include/asm/rtas.h      | 4 ++--
 arch/powerpc/kernel/rtas.c           | 4 ++--
 4 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/include/asm/hw_irq.h b/arch/powerpc/include/asm/hw_irq.h
index 26ede09c521d..3264991fe524 100644
--- a/arch/powerpc/include/asm/hw_irq.h
+++ b/arch/powerpc/include/asm/hw_irq.h
@@ -111,7 +111,7 @@ static inline void __hard_RI_enable(void)
 #ifdef CONFIG_PPC64
 #include &lt;asm/paca.h&gt;
 
-static inline notrace unsigned long irq_soft_mask_return(void)
+static __always_inline notrace unsigned long irq_soft_mask_return(void)
 {
 	return READ_ONCE(local_paca-&gt;irq_soft_mask);
 }
@@ -121,7 +121,7 @@ static inline notrace unsigned long irq_soft_mask_return(void)
  * for the critical section and as a clobber because
  * we changed paca-&gt;irq_soft_mask
  */
-static inline notrace void irq_soft_mask_set(unsigned long mask)
+static __always_inline notrace void irq_soft_mask_set(unsigned long mask)
 {
 	/*
 	 * The irq mask must always include the STD bit if any are set.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
This doesn't give a reason why it's __always_inline, and having the
notrace attribute makes it possibly confusing. I think it would be easy
for someone to break without realising. Could you add a noinstr to these
instead / as well?</pre>
    </blockquote>
    <pre>Yeah we can add noinstr. Missed to see your comment, Sorry for the delayed reply</pre>
    <blockquote type="cite" cite="mid:CMPVP7RZXP5G.2D3ZNQPWARIG8@bobo">
      <pre class="moz-quote-pre" wrap="">

What about adding a 'realmode' function annotation that includes noinstr?</pre>
    </blockquote>
    <pre>You mean to define a new function annotation?</pre>
    <br>
  </body>
</html>

--------------xnH1tx2oswo1w1EnfCqTvUwT--

