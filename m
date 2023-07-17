Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93449755EB4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jul 2023 10:46:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BEpc9HQs;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R4Fzy3c1Kz30Db
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jul 2023 18:46:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BEpc9HQs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ganeshgr@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R4FBD28nGz2yDN
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jul 2023 18:10:12 +1000 (AEST)
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36H7jwE9009953;
	Mon, 17 Jul 2023 08:10:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 message-id : date : mime-version : subject : to : cc : references : from :
 in-reply-to; s=pp1; bh=SBBYUx9ndl+ghkK33BCRs2eEPeKd41wqhr1CqHq5CGw=;
 b=BEpc9HQsl92BpQ1nCRRPxWwmhhTYnxnz6kHXGPaDcQx3+jLZrQxdESjJa9RxLvDJObCQ
 HKf3JR6wV9GCfgVOdoY01Gd2PVQQbl4y6OHHtF/Ixp1/ZsOWg07Z8tW53E9pdZKrtuk8
 h74SUgd/JBAN/94aArViWAKiX7Eb5dHheF4N3gdgr9lkIeNad2trL3eAZfJNLM5AeOjv
 S3FUaRSbYX+UlmCMRwRg0fiUvy3jvWJJWGna/H+Pvr8esq/k/7S8api3GACxn8rMgYFl
 5lPzpM8RdXZBYXIzlrJWAPee+tSbYfxUMo4WDC0mjzFiWc8OdA8FHLfdQkLpU/BsA7H8 gQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rw0qs270y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Jul 2023 08:10:06 +0000
Received: from m0353723.ppops.net (m0353723.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 36H7UM9Y006145;
	Mon, 17 Jul 2023 08:10:06 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rw0qs270e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Jul 2023 08:10:05 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36H30ePx004179;
	Mon, 17 Jul 2023 08:10:05 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3rv8g0t9n4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Jul 2023 08:10:05 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 36H8A3685767884
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 17 Jul 2023 08:10:03 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8469820040;
	Mon, 17 Jul 2023 08:10:03 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 44B5D20043;
	Mon, 17 Jul 2023 08:10:02 +0000 (GMT)
Received: from [9.43.50.197] (unknown [9.43.50.197])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 17 Jul 2023 08:10:02 +0000 (GMT)
Content-Type: multipart/alternative;
 boundary="------------65TZ5HVj3pEZ0Wk3hbmab0KZ"
Message-ID: <c2eff602-a6d0-2b8d-2c11-5a556b0f4493@linux.ibm.com>
Date: Mon, 17 Jul 2023 13:40:01 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [RFC 0/3] Asynchronous EEH recovery
Content-Language: en-US
To: "Oliver O'Halloran" <oohall@gmail.com>
References: <20230613014337.286222-1-ganeshgr@linux.ibm.com>
 <CAOSf1CGzmbbs16zCAV8_NN49Sd8ifi-4Dvo7wXdVNDE-j76qPQ@mail.gmail.com>
From: Ganesh G R <ganeshgr@linux.ibm.com>
In-Reply-To: <CAOSf1CGzmbbs16zCAV8_NN49Sd8ifi-4Dvo7wXdVNDE-j76qPQ@mail.gmail.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: EwLYd9T_wFVacSkdoDCQK_0-KzXHFR1U
X-Proofpoint-GUID: dH1JWrzBw0Y2QJfrztKTb1RX3XV4k8ff
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-17_06,2023-07-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 malwarescore=0 suspectscore=0 mlxlogscore=999 lowpriorityscore=0
 bulkscore=0 impostorscore=0 spamscore=0 adultscore=0 clxscore=1011
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307170072
X-Mailman-Approved-At: Mon, 17 Jul 2023 18:42:53 +1000
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
--------------65TZ5HVj3pEZ0Wk3hbmab0KZ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 6/13/23 8:06 AM, Oliver O'Halloran wrote:

> On Tue, Jun 13, 2023 at 11:44 AM Ganesh Goudar<ganeshgr@linux.ibm.com>  wrote:
>> Hi,
>>
>> EEH recovery is currently serialized and these patches shorten
>> the time taken for EEH recovery by making the recovery to run
>> in parallel. The original author of these patches is Sam Bobroff,
>> I have rebased and tested these patches.
>>
>> On powervm with 64 VFs from same PHB,  I see approximately 48%
>> reduction in time taken in EEH recovery.
>>
>> On powernv with 9 network cards, Where 2 cards installed on one
>> PHB and 1 card on each of the rest of the PHBs, Providing 20 PFs
>> in total. I see approximately 33% reduction in time taken in EEH
>> recovery.
>>
>> These patches were originally posted as separate RFCs by Sam, And
>> I rebased and posted these patches almost a year back, I stopped
>> pursuing these patches as I was not able test this on powernv, Due
>> to the issues in drivers of cards I was testing this on, Which are
>> now resolved. Since I am re-posting this after long time, Posting
>> this as a fresh RFC, Please comment.
> What changes have you made since the last time you posted this series?
> If the patches are the same then the comments I posted last time still
> apply.

Hi Oliver, You asked about the way we are testing this on powervm, You expressed
concerns about having this on powernv, suggested to have this feature just for
powervm for now, and also expressed concerns on having two locks.

On powervm using two port card we are instantiating 64 VFS, for an lpar and injecting
the error on the bus from phyp, to observe the behavior.
I was able to test this on powernv with 16 PFs from 8 cards installed on separate PHBs,
Where I saw considerable performance improvement.
Regarding two locks idea, I may not have tested it for all scenarios, So far I have not
faced any issue, Are you suggesting a different approach.

Thanks

--------------65TZ5HVj3pEZ0Wk3hbmab0KZ
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">
      <pre>On 6/13/23 8:06 AM, Oliver O'Halloran wrote:</pre>
    </div>
    <blockquote type="cite"
cite="mid:CAOSf1CGzmbbs16zCAV8_NN49Sd8ifi-4Dvo7wXdVNDE-j76qPQ@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">On Tue, Jun 13, 2023 at 11:44 AM Ganesh Goudar <a class="moz-txt-link-rfc2396E" href="mailto:ganeshgr@linux.ibm.com">&lt;ganeshgr@linux.ibm.com&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Hi,

EEH recovery is currently serialized and these patches shorten
the time taken for EEH recovery by making the recovery to run
in parallel. The original author of these patches is Sam Bobroff,
I have rebased and tested these patches.

On powervm with 64 VFs from same PHB,  I see approximately 48%
reduction in time taken in EEH recovery.

On powernv with 9 network cards, Where 2 cards installed on one
PHB and 1 card on each of the rest of the PHBs, Providing 20 PFs
in total. I see approximately 33% reduction in time taken in EEH
recovery.

These patches were originally posted as separate RFCs by Sam, And
I rebased and posted these patches almost a year back, I stopped
pursuing these patches as I was not able test this on powernv, Due
to the issues in drivers of cards I was testing this on, Which are
now resolved. Since I am re-posting this after long time, Posting
this as a fresh RFC, Please comment.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
What changes have you made since the last time you posted this series?
If the patches are the same then the comments I posted last time still
apply.
</pre>
    </blockquote>
    <pre>Hi Oliver, You asked about the way we are testing this on powervm, You expressed
concerns about having this on powernv, suggested to have this feature just for
powervm for now, and also expressed concerns on having two locks.

On powervm using two port card we are instantiating 64 VFS, for an lpar and injecting
the error on the bus from phyp, to observe the behavior.
I was able to test this on powernv with 16 PFs from 8 cards installed on separate PHBs,
Where I saw considerable performance improvement.
Regarding two locks idea, I may not have tested it for all scenarios, So far I have not
faced any issue, Are you suggesting a different approach.

Thanks    
</pre>
  </body>
</html>

--------------65TZ5HVj3pEZ0Wk3hbmab0KZ--

