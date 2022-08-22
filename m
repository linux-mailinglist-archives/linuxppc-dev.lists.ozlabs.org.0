Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC19759BA63
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Aug 2022 09:39:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MB44D3Bvlz3c7P
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Aug 2022 17:39:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tY4D1Y/q;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ganeshgr@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tY4D1Y/q;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MB28M5bsKz305Z
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Aug 2022 16:12:35 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27M63Kh1023881;
	Mon, 22 Aug 2022 06:12:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 message-id : date : mime-version : subject : to : cc : references : from :
 in-reply-to; s=pp1; bh=TwQW9Va/WuomNCUN+cbsDgw6DYFeS1AoBglzygt0PvU=;
 b=tY4D1Y/q8Mgztktpjgtzk8D0QFQ6jVXfR/egKwflkjRYf/eHOJQ0v9x25iikH4az4xug
 SqTwERaE/dEnjC7gr4r6E0zpHfiPYQd2X255QxgrQVqWXfBTBJrTSFFl3Eu59I1ddxan
 Mo49i9fPqwEMGG2MlLoELL7zQ4PwfM8w5juFCMXHxKEmkufj110Rb0yEUzK/yYOaI2xr
 nOQKKyvEe2iec3OZrnZcM4MF9njPNIBGS3EyAch2i2T4h6YTbREHEqDQ40j0s+j9z1yu
 5uRN4JUeKnzH3Rkd7QbnRlneagLULNAl7TxDARk0rQ87UzXR1xsM31IU+mhyLVMdfR0c 8Q== 
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com [159.122.73.70])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3j446rr756-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Aug 2022 06:12:30 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
	by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27M64rr1013914;
	Mon, 22 Aug 2022 06:12:28 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
	by ppma01fra.de.ibm.com with ESMTP id 3j2q88sem1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Aug 2022 06:12:28 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
	by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 27M6COgU31850922
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 22 Aug 2022 06:12:24 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 807F15204F;
	Mon, 22 Aug 2022 06:12:24 +0000 (GMT)
Received: from [9.43.21.150] (unknown [9.43.21.150])
	by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 23E3D5204E;
	Mon, 22 Aug 2022 06:12:22 +0000 (GMT)
Content-Type: multipart/alternative;
 boundary="------------6y5CAj9yqPpln0M0axpxuIn0"
Message-ID: <49c184b5-78fe-eda6-936a-d64b411598ac@linux.ibm.com>
Date: Mon, 22 Aug 2022 11:42:21 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [6.0-rc1] Kernel crash while running MCE tests
Content-Language: en-US
To: Sachin Sant <sachinp@linux.ibm.com>
References: <2BF30341-AD39-4949-9489-86C75A6F4513@linux.ibm.com>
 <87wnb7v2b3.fsf@mpe.ellerman.id.au>
 <f70dfa03-1f5b-d738-ea75-cad5f5f97a43@linux.ibm.com>
 <800F795E-6E80-44D2-81DF-926BBF375F15@linux.ibm.com>
From: Ganesh <ganeshgr@linux.ibm.com>
In-Reply-To: <800F795E-6E80-44D2-81DF-926BBF375F15@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: TzQhclCP6-bIGlc-APfDxOHvrd4UDu6q
X-Proofpoint-GUID: TzQhclCP6-bIGlc-APfDxOHvrd4UDu6q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-22_02,2022-08-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=747
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
Cc: linuxppc-dev@lists.ozlabs.org, mahesh@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------6y5CAj9yqPpln0M0axpxuIn0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/22/22 11:01, Sachin Sant wrote:

>
>> On 19-Aug-2022, at 10:12 AM, Ganesh<ganeshgr@linux.ibm.com>  wrote
>>> We'll have to make sure everything get_pseries_errorlog() is either
>>> forced inline, or marked noinstr.
>>>
>> Making the following functions always_inline and noinstr is fixing the issue.
>> __always_inline pseries_errorlog_id()
>> __always_inline pseries_errorlog_length()
>> __always_inline do_enter_rtas()
>> __always_inline srr_regs_clobbered()
>> noinstr va_rtas_call_unlocked()
>>
>> Shall I post the patch?
> Yes, thanks. I can help with testing.

Sure, thanks.

--------------6y5CAj9yqPpln0M0axpxuIn0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">
      <pre>On 8/22/22 11:01, Sachin Sant wrote:</pre>
    </div>
    <blockquote type="cite"
      cite="mid:800F795E-6E80-44D2-81DF-926BBF375F15@linux.ibm.com">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">On 19-Aug-2022, at 10:12 AM, Ganesh <a class="moz-txt-link-rfc2396E" href="mailto:ganeshgr@linux.ibm.com">&lt;ganeshgr@linux.ibm.com&gt;</a> wrote
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
We'll have to make sure everything get_pseries_errorlog() is either
forced inline, or marked noinstr.

</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">Making the following functions always_inline and noinstr is fixing the issue.
__always_inline pseries_errorlog_id()
__always_inline pseries_errorlog_length()
__always_inline do_enter_rtas()
__always_inline srr_regs_clobbered()
noinstr va_rtas_call_unlocked()

Shall I post the patch?
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Yes, thanks. I can help with testing.</pre>
    </blockquote>
    <pre class="moz-quote-pre" wrap="">Sure, thanks.
</pre>
  </body>
</html>

--------------6y5CAj9yqPpln0M0axpxuIn0--

