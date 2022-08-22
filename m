Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B5EE59BA62
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Aug 2022 09:38:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MB43S2gnrz3cDh
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Aug 2022 17:38:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YIyrRTAm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ganeshgr@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YIyrRTAm;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MB26b3mbDz302S
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Aug 2022 16:11:02 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27M63H1i023786;
	Mon, 22 Aug 2022 06:10:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 message-id : date : mime-version : subject : to : cc : references : from :
 in-reply-to; s=pp1; bh=Ff7GUgOOEuMTHgFyWD8B83S5aXFSm+iCD6WKdyztmkM=;
 b=YIyrRTAmymkZNh1lvDmBMviehO1W2JQo3jvAUvi6ww7KenkW+NFaVtnuuNrr8CYvf1uA
 i5DCyi/g1BtntcfgGeNOrOYKdu2nnabnhw/dFacjMsmgmbAvrOw1q+gzr0KZk+VBigSR
 736DFKc8YHXFfKmOXSnOQJpejzEX9i7dAR6CzJDbTD5o00WhFOf2uscp4kPmj8T9h0vX
 qZC/CKmPVnQ2tDaDSjC9Sp0Dkxue5JZo3pkrLxBWV8u69PXsFlLTfGKy+AFqleW8iW17
 5Ofn3Dby6IXWtZJuHe6SaCUcH7tAJ95VaCSjwWrpZdi9nHaCSuTwhdYCQHu04iennL/Y UQ== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3j446rr5q7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Aug 2022 06:10:55 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27M651Mv000781;
	Mon, 22 Aug 2022 06:10:54 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
	by ppma06ams.nl.ibm.com with ESMTP id 3j2pvj1yy1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Aug 2022 06:10:53 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 27M6AoHV27066692
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 22 Aug 2022 06:10:50 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 81DA25204E;
	Mon, 22 Aug 2022 06:10:50 +0000 (GMT)
Received: from [9.43.21.150] (unknown [9.43.21.150])
	by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 1465D52050;
	Mon, 22 Aug 2022 06:10:48 +0000 (GMT)
Content-Type: multipart/alternative;
 boundary="------------EO7koPxcDA5Ch6EI1kpLCNNa"
Message-ID: <29cc4bc6-d952-b23e-e4fd-f56a78bc88fd@linux.ibm.com>
Date: Mon, 22 Aug 2022 11:40:47 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [6.0-rc1] Kernel crash while running MCE tests
Content-Language: en-US
To: Michael Ellerman <mpe@ellerman.id.au>,
        Sachin Sant
 <sachinp@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <2BF30341-AD39-4949-9489-86C75A6F4513@linux.ibm.com>
 <87wnb7v2b3.fsf@mpe.ellerman.id.au>
 <f70dfa03-1f5b-d738-ea75-cad5f5f97a43@linux.ibm.com>
 <87lergltej.fsf@mpe.ellerman.id.au>
From: Ganesh <ganeshgr@linux.ibm.com>
In-Reply-To: <87lergltej.fsf@mpe.ellerman.id.au>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 1j8XRbAShiWCPKZ6u0LGP0jM28_y-RCR
X-Proofpoint-GUID: 1j8XRbAShiWCPKZ6u0LGP0jM28_y-RCR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-22_02,2022-08-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=702
 impostorscore=0 mlxscore=0 malwarescore=0 bulkscore=0 spamscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208220027
X-Mailman-Approved-At: Mon, 22 Aug 2022 17:37:53 +1000
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
Cc: mahesh@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------EO7koPxcDA5Ch6EI1kpLCNNa
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/22/22 11:19, Michael Ellerman wrote:

>>> So I guess the compiler has decided not to inline it (why?!), and it is
>>> not marked noinstr, so it gets KASAN instrumentation which crashes in
>>> real mode.
>>>
>>> We'll have to make sure everything get_pseries_errorlog() is either
>>> forced inline, or marked noinstr.
>> Making the following functions always_inline and noinstr is fixing the issue.
>> __always_inline pseries_errorlog_id()
>> __always_inline pseries_errorlog_length()
>> __always_inline do_enter_rtas()
>> __always_inline srr_regs_clobbered()
>> noinstr va_rtas_call_unlocked()
> Why do we need it? Because of fwnmi_release_errinfo()?

Yes.

>> Shall I post the patch?
> Yeah.
>
> cheers
--------------EO7koPxcDA5Ch6EI1kpLCNNa
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">
      <pre>On 8/22/22 11:19, Michael Ellerman wrote:
</pre>
    </div>
    <blockquote type="cite" cite="mid:87lergltej.fsf@mpe.ellerman.id.au">
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">So I guess the compiler has decided not to inline it (why?!), and it is
not marked noinstr, so it gets KASAN instrumentation which crashes in
real mode.

We'll have to make sure everything get_pseries_errorlog() is either
forced inline, or marked noinstr.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Making the following functions always_inline and noinstr is fixing the issue.
__always_inline pseries_errorlog_id()
__always_inline pseries_errorlog_length()
__always_inline do_enter_rtas()
__always_inline srr_regs_clobbered()
noinstr va_rtas_call_unlocked()
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Why do we need it? Because of fwnmi_release_errinfo()?</pre>
    </blockquote>
    <pre class="moz-quote-pre" wrap="">Yes.</pre>
    <blockquote type="cite" cite="mid:87lergltej.fsf@mpe.ellerman.id.au">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Shall I post the patch?
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Yeah.

cheers
</pre>
    </blockquote>
  </body>
</html>

--------------EO7koPxcDA5Ch6EI1kpLCNNa--

