Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D474B686346
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Feb 2023 11:01:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P6HWP4j4rz3f6K
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Feb 2023 21:01:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dyn8SS/h;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ganeshgr@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dyn8SS/h;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P6Gnj1WtGz300C
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Feb 2023 20:28:56 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3119LMCn020602;
	Wed, 1 Feb 2023 09:28:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 message-id : date : mime-version : subject : to : cc : references : from :
 in-reply-to; s=pp1; bh=UPfS0JSqsHWU6KFIzDh5IR0blcrMc8zrkhvGc8dCkzg=;
 b=dyn8SS/hAZt7z6BLPl1ytITxklw66SuGrWyzOBpQUA0gL8W2s1AC/4XRDzLusfNMh9Gx
 766e9XSjsQAhPcz2NeT/Mae2NeLNfNMd0/ABobKbJgARM/ZfHrq306Y8Z3mW2c/M8VLb
 2t2VdF78yAU+skzWyM02CWwu2/xO5h+ms9WDmC+/Bo8IGPGQjQyvactSgEQ55E0F6WN2
 rFiSSyGWGTDKPiyUdyg7B1RmddT09Un8hs15am4uBoYihdpPkaVQ/1hHV6B1nKDCc8Wq
 qxcIvkBsieyVOTvdVSgfXcksOOJsjNuGq7LFrkVq9KgeVDqLlWyVdXwLlAltAOGIIsW9 hQ== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com [149.81.74.107])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nfncm853a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Feb 2023 09:28:50 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
	by ppma03fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30VJfGfr030067;
	Wed, 1 Feb 2023 09:28:48 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma03fra.de.ibm.com (PPS) with ESMTPS id 3ncvshba5v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Feb 2023 09:28:48 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3119Si0j48038390
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 1 Feb 2023 09:28:44 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B6AD12004E;
	Wed,  1 Feb 2023 09:28:44 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1A91E2004B;
	Wed,  1 Feb 2023 09:28:44 +0000 (GMT)
Received: from [9.204.207.144] (unknown [9.204.207.144])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  1 Feb 2023 09:28:43 +0000 (GMT)
Content-Type: multipart/alternative;
 boundary="------------6mREV7prr1cZoyQESwrmns2W"
Message-ID: <945a90d3-f14e-dd57-4eea-bcdc5f8a96a0@linux.ibm.com>
Date: Wed, 1 Feb 2023 14:58:43 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2] powerpc/mce: log the error for all unrecoverable
 errors
Content-Language: en-US
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
References: <20230127182943.73073-1-ganeshgr@linux.ibm.com>
 <87bkmfeycs.fsf@mpe.ellerman.id.au>
From: Ganesh G R <ganeshgr@linux.ibm.com>
In-Reply-To: <87bkmfeycs.fsf@mpe.ellerman.id.au>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: AZpNWMy961WD6z7_FJaKZwI1_7PhJJw5
X-Proofpoint-ORIG-GUID: AZpNWMy961WD6z7_FJaKZwI1_7PhJJw5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-01_03,2023-01-31_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1015
 mlxlogscore=999 suspectscore=0 spamscore=0 priorityscore=1501
 malwarescore=0 mlxscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302010078
X-Mailman-Approved-At: Wed, 01 Feb 2023 20:59:59 +1100
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
Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------6mREV7prr1cZoyQESwrmns2W
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 1/31/23 4:59 PM, Michael Ellerman wrote:

> Ganesh Goudar<ganeshgr@linux.ibm.com>  writes:
>> For all unrecoverable errors we are missing to log the
>> error, Since machine_check_log_err() is not getting called
>> for unrecoverable errors.
>>
>> Raise irq work in save_mce_event() for unrecoverable errors,
>> So that we log the error from MCE event handling block in
>> timer handler.
> But the patch also removes the irq work raise from machine_check_ue_event().
>
> That's currently done unconditionally, regardless of the disposition. So
> doesn't this change also drop logging of recoverable UEs?
>
> Maybe that's OK, but the change log should explain it.

Yes, its ok, exception vector code will do that for recoverable errors, ill explain
this in commit message.

>
>> Log without this change
>>
>>   MCE: CPU27: machine check (Severe)  Real address Load/Store (foreign/control memory) [Not recovered]
>>   MCE: CPU27: PID: 10580 Comm: inject-ra-err NIP: [0000000010000df4]
>>   MCE: CPU27: Initiator CPU
>>   MCE: CPU27: Unknown
>>
>> Log with this change
>>
>>   MCE: CPU24: machine check (Severe)  Real address Load/Store (foreign/control memory) [Not recovered]
>>   MCE: CPU24: PID: 1589811 Comm: inject-ra-err NIP: [0000000010000e48]
>>   MCE: CPU24: Initiator CPU
>>   MCE: CPU24: Unknown
>>   RTAS: event: 5, Type: Platform Error (224), Severity: 3
>>
>> Signed-off-by: Ganesh Goudar<ganeshgr@linux.ibm.com>
>> Reviewed-by: Mahesh Salgaonkar<mahesh@linux.ibm.com>
>> ---
>> V2: Rephrasing the commit message.
>> ---
>>   arch/powerpc/kernel/mce.c | 8 +++++++-
>>   1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/powerpc/kernel/mce.c b/arch/powerpc/kernel/mce.c
>> index 6c5d30fba766..a1cb2172eb7b 100644
>> --- a/arch/powerpc/kernel/mce.c
>> +++ b/arch/powerpc/kernel/mce.c
>> @@ -131,6 +131,13 @@ void save_mce_event(struct pt_regs *regs, long handled,
>>   	if (mce->error_type == MCE_ERROR_TYPE_UE)
>>   		mce->u.ue_error.ignore_event = mce_err->ignore_event;
>>   
>> +	/*
>> +	 * Raise irq work, So that we don't miss to log the error for
>> +	 * unrecoverable errors.
>> +	 */
>> +	if (mce->disposition == MCE_DISPOSITION_NOT_RECOVERED)
>> +		mce_irq_work_queue();
>> +
>>   	if (!addr)
>>   		return;
>>   
>> @@ -235,7 +242,6 @@ static void machine_check_ue_event(struct machine_check_event *evt)
>>   	       evt, sizeof(*evt));
>>   
>>   	/* Queue work to process this event later. */
> This comment is meaningless without the function call it's commenting
> about, ie. the comment should be removed too.

ok.

Thanks.

--------------6mREV7prr1cZoyQESwrmns2W
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">
      <pre>On 1/31/23 4:59 PM, Michael Ellerman wrote:</pre>
    </div>
    <blockquote type="cite" cite="mid:87bkmfeycs.fsf@mpe.ellerman.id.au">
      <pre class="moz-quote-pre" wrap="">Ganesh Goudar <a class="moz-txt-link-rfc2396E" href="mailto:ganeshgr@linux.ibm.com">&lt;ganeshgr@linux.ibm.com&gt;</a> writes:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">For all unrecoverable errors we are missing to log the
error, Since machine_check_log_err() is not getting called
for unrecoverable errors.

Raise irq work in save_mce_event() for unrecoverable errors,
So that we log the error from MCE event handling block in
timer handler.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
But the patch also removes the irq work raise from machine_check_ue_event().

That's currently done unconditionally, regardless of the disposition. So
doesn't this change also drop logging of recoverable UEs?

Maybe that's OK, but the change log should explain it.</pre>
    </blockquote>
    <pre>Yes, its ok, exception vector code will do that for recoverable errors, ill explain
this in commit message.
</pre>
    <blockquote type="cite" cite="mid:87bkmfeycs.fsf@mpe.ellerman.id.au">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Log without this change

 MCE: CPU27: machine check (Severe)  Real address Load/Store (foreign/control memory) [Not recovered]
 MCE: CPU27: PID: 10580 Comm: inject-ra-err NIP: [0000000010000df4]
 MCE: CPU27: Initiator CPU
 MCE: CPU27: Unknown

Log with this change

 MCE: CPU24: machine check (Severe)  Real address Load/Store (foreign/control memory) [Not recovered]
 MCE: CPU24: PID: 1589811 Comm: inject-ra-err NIP: [0000000010000e48]
 MCE: CPU24: Initiator CPU
 MCE: CPU24: Unknown
 RTAS: event: 5, Type: Platform Error (224), Severity: 3

Signed-off-by: Ganesh Goudar <a class="moz-txt-link-rfc2396E" href="mailto:ganeshgr@linux.ibm.com">&lt;ganeshgr@linux.ibm.com&gt;</a>
Reviewed-by: Mahesh Salgaonkar <a class="moz-txt-link-rfc2396E" href="mailto:mahesh@linux.ibm.com">&lt;mahesh@linux.ibm.com&gt;</a>
---
V2: Rephrasing the commit message.
---
 arch/powerpc/kernel/mce.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/mce.c b/arch/powerpc/kernel/mce.c
index 6c5d30fba766..a1cb2172eb7b 100644
--- a/arch/powerpc/kernel/mce.c
+++ b/arch/powerpc/kernel/mce.c
@@ -131,6 +131,13 @@ void save_mce_event(struct pt_regs *regs, long handled,
 	if (mce-&gt;error_type == MCE_ERROR_TYPE_UE)
 		mce-&gt;u.ue_error.ignore_event = mce_err-&gt;ignore_event;
 
+	/*
+	 * Raise irq work, So that we don't miss to log the error for
+	 * unrecoverable errors.
+	 */
+	if (mce-&gt;disposition == MCE_DISPOSITION_NOT_RECOVERED)
+		mce_irq_work_queue();
+
 	if (!addr)
 		return;
 
@@ -235,7 +242,6 @@ static void machine_check_ue_event(struct machine_check_event *evt)
 	       evt, sizeof(*evt));
 
 	/* Queue work to process this event later. */
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
This comment is meaningless without the function call it's commenting
about, ie. the comment should be removed too.</pre>
    </blockquote>
    <pre class="moz-quote-pre" wrap="">ok.

Thanks.
</pre>
  </body>
</html>

--------------6mREV7prr1cZoyQESwrmns2W--

