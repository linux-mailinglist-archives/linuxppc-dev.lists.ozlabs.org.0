Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B9013F915F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Aug 2021 02:48:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gwh061jTfz2yx9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Aug 2021 10:48:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=D8HTcPpq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ganeshgr@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=D8HTcPpq; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GwNF44TWTz2xgy
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Aug 2021 22:58:16 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17QCZM78043574; Thu, 26 Aug 2021 08:58:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type; s=pp1; bh=DEc+s6MvO0OlrxaoOK4pT2yqX1vyKCqy7cL3MqV0QQs=;
 b=D8HTcPpqQ9Q1rNleh8QKBYI6jQzktRoaB+z3MlHaGemBP5+DPvX+xPrAkm/iSnqjgkeG
 isD7r4A2IAYA0VeHEKyVXK+UinBOSDSdDXwa45sgbav7aXkim4h8ex16lVeX/WyEu94h
 Db3A2vW9qBwsM7WuRctDYttZ5Irv5mdnxYQAIrmGVH2CSLJvcykUOd28kISivlbbOIRw
 wz5JlWA+II1LODRqgY929UhRgaFpaXKlOQ1M/PZOlw70kFrXBAOP7yqCaqUJp6PiAMww
 OQZOVpDf8HTdWTN0TMR8nDW4iuaQyBNcO2DknTSw8QCw701hBgIRQivg9K8axhnZUgn6 uw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ap5qu13tn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Aug 2021 08:58:08 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 17QCZUt8044090;
 Thu, 26 Aug 2021 08:58:07 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ap5qu13sv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Aug 2021 08:58:07 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17QCusxZ028786;
 Thu, 26 Aug 2021 12:58:05 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma04fra.de.ibm.com with ESMTP id 3ajs48qwpy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Aug 2021 12:58:05 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17QCw2X733620352
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 26 Aug 2021 12:58:02 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7FB7A42054;
 Thu, 26 Aug 2021 12:58:02 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 49E7F42045;
 Thu, 26 Aug 2021 12:58:00 +0000 (GMT)
Received: from li-c7b85bcc-2727-11b2-a85c-a9ba7f3a2193.ibm.com (unknown
 [9.43.90.145]) by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 26 Aug 2021 12:57:59 +0000 (GMT)
Subject: Re: [PATCH v2 2/3] selftests/powerpc: Add test for real address error
 handling
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
References: <20210805092025.272871-1-ganeshgr@linux.ibm.com>
 <20210805092025.272871-2-ganeshgr@linux.ibm.com>
 <87a6l7c8ku.fsf@mpe.ellerman.id.au>
 <8edb13f5-f036-2f9d-4c89-55c51c4cdbc0@linux.ibm.com>
 <87eeagc2c1.fsf@mpe.ellerman.id.au>
From: Ganesh <ganeshgr@linux.ibm.com>
Message-ID: <902f49c7-31d7-b174-2e99-0880bec599f3@linux.ibm.com>
Date: Thu, 26 Aug 2021 18:27:58 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <87eeagc2c1.fsf@mpe.ellerman.id.au>
Content-Type: multipart/alternative;
 boundary="------------B8AF3DD1984CF88B0F360EA4"
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 5m5p9SUQ7SP6tuK4izJszvt-3yHUtV4G
X-Proofpoint-ORIG-GUID: sSwUfV3LqT4OWtRlfU49s8LtwcMhTbaj
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-26_03:2021-08-26,
 2021-08-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 impostorscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 mlxlogscore=999 malwarescore=0 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108260077
X-Mailman-Approved-At: Fri, 27 Aug 2021 10:47:27 +1000
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
Cc: mikey@neuling.org, mahesh@linux.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------B8AF3DD1984CF88B0F360EA4
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/26/21 8:57 AM, Michael Ellerman wrote:
> Ganesh <ganeshgr@linux.ibm.com> writes:
>> On 8/24/21 6:18 PM, Michael Ellerman wrote:
>>
>>> Ganesh Goudar <ganeshgr@linux.ibm.com> writes:
>>>> Add test for real address or control memory address access
>>>> error handling, using NX-GZIP engine.
>>>>
>>>> The error is injected by accessing the control memory address
>>>> using illegal instruction, on successful handling the process
>>>> attempting to access control memory address using illegal
>>>> instruction receives SIGBUS.
>>> ...
>>>
>>>> diff --git a/tools/testing/selftests/powerpc/mce/inject-ra-err.sh b/tools/testing/selftests/powerpc/mce/inject-ra-err.sh
>>>> new file mode 100755
>>>> index 000000000000..3633cdc651a1
>>>> --- /dev/null
>>>> +++ b/tools/testing/selftests/powerpc/mce/inject-ra-err.sh
>>>> @@ -0,0 +1,18 @@
>>>> +#!/bin/bash
>>>> +# SPDX-License-Identifier: GPL-2.0-or-later
>>>> +
>>>> +if [[ ! -w /dev/crypto/nx-gzip ]]; then
>>>> +	echo "WARN: Can't access /dev/crypto/nx-gzip, skipping"
>>>> +	exit 0
>>>> +fi
>>>> +
>>>> +timeout 5 ./inject-ra-err
>>>> +
>>>> +# 128 + 7 (SIGBUS) = 135, 128 is a exit code with special meaning.
>>>> +if [ $? -ne 135 ]; then
>>>> +	echo "FAILED: Real address or Control memory access error not handled"
>>>> +	exit $?
>>>> +fi
>>>> +
>>>> +echo "OK: Real address or Control memory access error is handled"
>>>> +exit 0
>>> I don't think we really need the shell script, we should be able to do
>>> all that in the C code.
>>>
>>> Can you try this?
>> it works!, We need to set timeout, with 120 sec timeout we may flood the dmesg.
> Hmm. Does it keep faulting? The regs->nip += 4 is meant to avoid that.

Yes, it keeps faulting, if we fail to handle and not send SIGBUS to the process.

>
> cheers

--------------B8AF3DD1984CF88B0F360EA4
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/26/21 8:57 AM, Michael Ellerman
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:87eeagc2c1.fsf@mpe.ellerman.id.au">
      <pre class="moz-quote-pre" wrap="">Ganesh <a class="moz-txt-link-rfc2396E" href="mailto:ganeshgr@linux.ibm.com">&lt;ganeshgr@linux.ibm.com&gt;</a> writes:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">On 8/24/21 6:18 PM, Michael Ellerman wrote:

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">Ganesh Goudar <a class="moz-txt-link-rfc2396E" href="mailto:ganeshgr@linux.ibm.com">&lt;ganeshgr@linux.ibm.com&gt;</a> writes:
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">Add test for real address or control memory address access
error handling, using NX-GZIP engine.

The error is injected by accessing the control memory address
using illegal instruction, on successful handling the process
attempting to access control memory address using illegal
instruction receives SIGBUS.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">...

</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">diff --git a/tools/testing/selftests/powerpc/mce/inject-ra-err.sh b/tools/testing/selftests/powerpc/mce/inject-ra-err.sh
new file mode 100755
index 000000000000..3633cdc651a1
--- /dev/null
+++ b/tools/testing/selftests/powerpc/mce/inject-ra-err.sh
@@ -0,0 +1,18 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+if [[ ! -w /dev/crypto/nx-gzip ]]; then
+	echo "WARN: Can't access /dev/crypto/nx-gzip, skipping"
+	exit 0
+fi
+
+timeout 5 ./inject-ra-err
+
+# 128 + 7 (SIGBUS) = 135, 128 is a exit code with special meaning.
+if [ $? -ne 135 ]; then
+	echo "FAILED: Real address or Control memory access error not handled"
+	exit $?
+fi
+
+echo "OK: Real address or Control memory access error is handled"
+exit 0
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">I don't think we really need the shell script, we should be able to do
all that in the C code.

Can you try this?
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
it works!, We need to set timeout, with 120 sec timeout we may flood the dmesg.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Hmm. Does it keep faulting? The regs-&gt;nip += 4 is meant to avoid that.</pre>
    </blockquote>
    <pre>Yes, it keeps faulting, if we fail to handle and not send SIGBUS to the process.</pre>
    <blockquote type="cite" cite="mid:87eeagc2c1.fsf@mpe.ellerman.id.au">
      <pre class="moz-quote-pre" wrap="">

cheers
</pre>
    </blockquote>
  </body>
</html>

--------------B8AF3DD1984CF88B0F360EA4--

