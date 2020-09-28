Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C398927B4B8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Sep 2020 20:46:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C0Wgj0c3tzDqSH
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Sep 2020 04:46:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ganeshgr@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=WxoFUz+G; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C0V490MJ1zDqRK
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Sep 2020 03:33:44 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08SHWaA4117989; Mon, 28 Sep 2020 13:33:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type; s=pp1; bh=oznwHr+1dAI1Ccuo6mk9/V2dlvv/Mkhzwk8rfcbR2Ms=;
 b=WxoFUz+GedmQQlm9cxCnE77YwzmhXeufFYatpE47q3NJ9CGn07WpmVazXlm4t9bEdn5T
 34ppoMquY3CUW/+9FPl7yK5f4+QqHZmk3YkX87v66G3DwZfyp+01ZGojFl33qpqJAkIp
 AxX/R/CcHp7pbAx6HX/3kMzlNx73RnU4eASIzKC7QvmnE947edGN8EOhft1NG7k2hFVK
 IFMasR0SETy7n0RgQIV2CvT7BlvrGcSAVMY3lnUafpqWiOhtA25WTdTIXuS9nKGNnBvP
 jq5zZ2oVFR5c31hcZV4CQ61/auamCrvoJSpK6nhJLVHf0WVMgbz9nEY7guiAmLTtdJ4t tQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 33ukd1j66f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Sep 2020 13:33:39 -0400
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 08SHWgqi118495;
 Mon, 28 Sep 2020 13:33:38 -0400
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0b-001b2d01.pphosted.com with ESMTP id 33ukd1j656-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Sep 2020 13:33:38 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 08SHQaq6005438;
 Mon, 28 Sep 2020 17:33:36 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03fra.de.ibm.com with ESMTP id 33sw9897jg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Sep 2020 17:33:36 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 08SHXYn229098330
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Sep 2020 17:33:34 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4D456AE04D;
 Mon, 28 Sep 2020 17:33:34 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F1DA1AE051;
 Mon, 28 Sep 2020 17:33:32 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.85.72.170])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 28 Sep 2020 17:33:32 +0000 (GMT)
Subject: Re: [PATCH v2 3/3] selftests/lkdtm: Enable selftest for SLB multihit
To: Kees Cook <keescook@chromium.org>
References: <20200925103123.21102-1-ganeshgr@linux.ibm.com>
 <20200925103123.21102-4-ganeshgr@linux.ibm.com>
 <202009251257.52EAF495@keescook>
From: Ganesh <ganeshgr@linux.ibm.com>
Message-ID: <6d64999f-3a68-7d6c-c421-e710fb9bc431@linux.ibm.com>
Date: Mon, 28 Sep 2020 23:03:32 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <202009251257.52EAF495@keescook>
Content-Type: multipart/alternative;
 boundary="------------2053C60C15453BC43A50F5DD"
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-28_16:2020-09-28,
 2020-09-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 impostorscore=0 phishscore=0 adultscore=0 bulkscore=0 mlxlogscore=999
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009280133
X-Mailman-Approved-At: Tue, 29 Sep 2020 04:44:34 +1000
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
Cc: msuchanek@suse.de, linuxppc-dev@lists.ozlabs.org, mahesh@linux.ibm.com,
 npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------2053C60C15453BC43A50F5DD
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/26/20 1:29 AM, Kees Cook wrote:
> On Fri, Sep 25, 2020 at 04:01:23PM +0530, Ganesh Goudar wrote:
>> Add PPC_SLB_MULTIHIT to lkdtm selftest framework.
>>
>> Signed-off-by: Ganesh Goudar <ganeshgr@linux.ibm.com>
>> ---
>>   tools/testing/selftests/lkdtm/tests.txt | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/tools/testing/selftests/lkdtm/tests.txt b/tools/testing/selftests/lkdtm/tests.txt
>> index 9d266e79c6a2..7eb3cf91c89e 100644
>> --- a/tools/testing/selftests/lkdtm/tests.txt
>> +++ b/tools/testing/selftests/lkdtm/tests.txt
>> @@ -70,3 +70,4 @@ USERCOPY_KERNEL
>>   USERCOPY_KERNEL_DS
>>   STACKLEAK_ERASING OK: the rest of the thread stack is properly erased
>>   CFI_FORWARD_PROTO
>> +PPC_SLB_MULTIHIT Recovered
> Please squash this into the lkdtm patch -- I'd like test implementation
> and kselftest awareness to go in together.

Sure, Thanks.

>

--------------2053C60C15453BC43A50F5DD
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/26/20 1:29 AM, Kees Cook wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:202009251257.52EAF495@keescook">
      <pre class="moz-quote-pre" wrap="">On Fri, Sep 25, 2020 at 04:01:23PM +0530, Ganesh Goudar wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Add PPC_SLB_MULTIHIT to lkdtm selftest framework.

Signed-off-by: Ganesh Goudar <a class="moz-txt-link-rfc2396E" href="mailto:ganeshgr@linux.ibm.com">&lt;ganeshgr@linux.ibm.com&gt;</a>
---
 tools/testing/selftests/lkdtm/tests.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/lkdtm/tests.txt b/tools/testing/selftests/lkdtm/tests.txt
index 9d266e79c6a2..7eb3cf91c89e 100644
--- a/tools/testing/selftests/lkdtm/tests.txt
+++ b/tools/testing/selftests/lkdtm/tests.txt
@@ -70,3 +70,4 @@ USERCOPY_KERNEL
 USERCOPY_KERNEL_DS
 STACKLEAK_ERASING OK: the rest of the thread stack is properly erased
 CFI_FORWARD_PROTO
+PPC_SLB_MULTIHIT Recovered
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Please squash this into the lkdtm patch -- I'd like test implementation
and kselftest awareness to go in together.</pre>
    </blockquote>
    <pre>Sure, Thanks.
</pre>
    <blockquote type="cite" cite="mid:202009251257.52EAF495@keescook">
      <pre class="moz-quote-pre" wrap="">

</pre>
    </blockquote>
  </body>
</html>

--------------2053C60C15453BC43A50F5DD--

