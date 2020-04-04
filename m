Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB5819E7BA
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Apr 2020 23:32:33 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48vqlL4NdzzDqHH
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Apr 2020 07:32:30 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48vcVW4FLYzDrg6
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  5 Apr 2020 00:05:39 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 034D4gTn059763
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 4 Apr 2020 09:05:35 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 306k4d7uyc-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 04 Apr 2020 09:05:35 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <ganeshgr@linux.ibm.com>;
 Sat, 4 Apr 2020 14:05:13 +0100
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Sat, 4 Apr 2020 14:05:11 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 034D4Ppg49021412
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 4 Apr 2020 13:04:25 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6811E11C050;
 Sat,  4 Apr 2020 13:05:29 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1CCDF11C04A;
 Sat,  4 Apr 2020 13:05:26 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.85.75.6])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Sat,  4 Apr 2020 13:05:25 +0000 (GMT)
Subject: Re: [PATCH] powerpc/mce: Add MCE notification chain
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au
References: <20200330071219.12284-1-ganeshgr@linux.ibm.com>
 <1585879413.ubv3w8ta2y.astroid@bobo.none>
From: Ganesh <ganeshgr@linux.ibm.com>
Date: Sat, 4 Apr 2020 18:35:23 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <1585879413.ubv3w8ta2y.astroid@bobo.none>
Content-Type: multipart/alternative;
 boundary="------------87CCF05201A858112AAEDE76"
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 20040413-0016-0000-0000-000002FE3527
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20040413-0017-0000-0000-0000336206EB
Message-Id: <a9b03938-5053-3c44-217b-5892533bd38d@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-04_09:2020-04-03,
 2020-04-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 spamscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 mlxlogscore=999 adultscore=0 phishscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004040117
X-Mailman-Approved-At: Sun, 05 Apr 2020 07:29:55 +1000
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
Cc: aneesh.kumar@linux.ibm.com, santosh@fossix.org, arbab@linux.ibm.com,
 mahesh@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------87CCF05201A858112AAEDE76
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/3/20 7:38 AM, Nicholas Piggin wrote:

> Ganesh Goudar's on March 30, 2020 5:12 pm:
>> From: Santosh S <santosh@fossix.org>
>>
>> Introduce notification chain which lets know about uncorrected memory
>> errors(UE). This would help prospective users in pmem or nvdimm subsystem
>> to track bad blocks for better handling of persistent memory allocations.
>>
>> Signed-off-by: Santosh S <santosh@fossix.org>
>> Signed-off-by: Ganesh Goudar <ganeshgr@linux.ibm.com>
> Do you have any such users yet? It would be good to refer to an example
> user and give a brief description of what it does in its notifier.

Santosh has sent a patch which uses this notification.
https://patchwork.ozlabs.org/patch/1265062/

>> @@ -263,6 +277,7 @@ static void machine_process_ue_event(struct work_struct *work)
>>   	while (__this_cpu_read(mce_ue_count) > 0) {
>>   		index = __this_cpu_read(mce_ue_count) - 1;
>>   		evt = this_cpu_ptr(&mce_ue_event_queue[index]);
>> +		blocking_notifier_call_chain(&mce_notifier_list, 0, evt);
> Can we really use a blocking notifier here? I'm not sure that we can.

I think we can, do you see any problem?

>
> Thanks,
> Nick


--------------87CCF05201A858112AAEDE76
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <pre>On 4/3/20 7:38 AM, Nicholas Piggin wrote:</pre>
    <blockquote type="cite"
      cite="mid:1585879413.ubv3w8ta2y.astroid@bobo.none">
      <pre class="moz-quote-pre" wrap="">Ganesh Goudar's on March 30, 2020 5:12 pm:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">From: Santosh S <a class="moz-txt-link-rfc2396E" href="mailto:santosh@fossix.org">&lt;santosh@fossix.org&gt;</a>

Introduce notification chain which lets know about uncorrected memory
errors(UE). This would help prospective users in pmem or nvdimm subsystem
to track bad blocks for better handling of persistent memory allocations.

Signed-off-by: Santosh S <a class="moz-txt-link-rfc2396E" href="mailto:santosh@fossix.org">&lt;santosh@fossix.org&gt;</a>
Signed-off-by: Ganesh Goudar <a class="moz-txt-link-rfc2396E" href="mailto:ganeshgr@linux.ibm.com">&lt;ganeshgr@linux.ibm.com&gt;</a>
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Do you have any such users yet? It would be good to refer to an example 
user and give a brief description of what it does in its notifier.</pre>
    </blockquote>
    <pre>Santosh has sent a patch which uses this notification.
<a class="moz-txt-link-freetext" href="https://patchwork.ozlabs.org/patch/1265062/">https://patchwork.ozlabs.org/patch/1265062/</a>
</pre>
    <blockquote type="cite"
      cite="mid:1585879413.ubv3w8ta2y.astroid@bobo.none">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">@@ -263,6 +277,7 @@ static void machine_process_ue_event(struct work_struct *work)
 	while (__this_cpu_read(mce_ue_count) &gt; 0) {
 		index = __this_cpu_read(mce_ue_count) - 1;
 		evt = this_cpu_ptr(&amp;mce_ue_event_queue[index]);
+		blocking_notifier_call_chain(&amp;mce_notifier_list, 0, evt);
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Can we really use a blocking notifier here? I'm not sure that we can.</pre>
    </blockquote>
    <pre>I think we can, do you see any problem?
</pre>
    <blockquote type="cite"
      cite="mid:1585879413.ubv3w8ta2y.astroid@bobo.none">
      <pre class="moz-quote-pre" wrap="">

Thanks,
Nick
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------87CCF05201A858112AAEDE76--

