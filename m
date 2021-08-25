Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A3593F753A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Aug 2021 14:42:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gvlxg0Xzxz3bhs
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Aug 2021 22:42:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YdjQqqCb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=ganeshgr@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=YdjQqqCb; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gvjs13WsNz2yJf
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Aug 2021 21:08:36 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17PB8HC7043862; Wed, 25 Aug 2021 07:08:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type; s=pp1; bh=5TgmaDLWzka5YfES9KgXi41NK/iRSjFOxvBSk7GsO5Q=;
 b=YdjQqqCbLEjEKBCsrJiK+iVlAD7tmq/jG26N/mzW0Y/rhVbV1azQQeC7W++n4K0V73FC
 D1gj/m3MQId0meWbby4I7e1yrZhMtLlnfw9xKwqdX5L1tBuQGtLEn+3CNRS5Q2JsWAJh
 AO9iUc/Knd6FCAQfXfHzzOcJ5Nk9RKHPu954OeUZvxRr8UHZML4AvS7CtfeMrj2odPlo
 eHJSDK9cJ/vHKeg6Zf357Q2cRlkzKDFtw4Lv3O0bQ3KlSuzqMCeKKXfJLr+ILx/3eNDC
 DsU2Qp0vd6wW4n4Uis/gtZIEMcGmjjr9NYnPc9AN+F+ssta9JW/6koLPL9BGzSzWah7V pA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3anmks843h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Aug 2021 07:08:28 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 17PB8QxX044796;
 Wed, 25 Aug 2021 07:08:27 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3anmks83by-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Aug 2021 07:08:25 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17PB1QVx013190;
 Wed, 25 Aug 2021 11:03:46 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06ams.nl.ibm.com with ESMTP id 3ajrrheyhn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Aug 2021 11:03:46 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17PB3itS47186282
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 25 Aug 2021 11:03:44 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 203A1AE3F0;
 Wed, 25 Aug 2021 11:03:44 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D7857AE422;
 Wed, 25 Aug 2021 11:03:41 +0000 (GMT)
Received: from li-c7b85bcc-2727-11b2-a85c-a9ba7f3a2193.ibm.com (unknown
 [9.43.52.60]) by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 25 Aug 2021 11:03:41 +0000 (GMT)
Subject: Re: [PATCH v2 1/3] powerpc/pseries: Parse control memory access error
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
References: <20210805092025.272871-1-ganeshgr@linux.ibm.com>
 <87eeajcpmq.fsf@mpe.ellerman.id.au>
From: Ganesh <ganeshgr@linux.ibm.com>
Message-ID: <9734b599-eb00-a1d6-cd3c-ed6d0441f240@linux.ibm.com>
Date: Wed, 25 Aug 2021 16:33:40 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <87eeajcpmq.fsf@mpe.ellerman.id.au>
Content-Type: multipart/alternative;
 boundary="------------36E6B48FEAC961647B5A90F4"
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ENR2cFPhssmkWK9EuxxtUNv8SLwGu2NY
X-Proofpoint-ORIG-GUID: 1CZs97s0STgCQzze1Ws8735bobIlEZDb
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-25_04:2021-08-25,
 2021-08-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0
 mlxscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 mlxlogscore=999
 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108250066
X-Mailman-Approved-At: Wed, 25 Aug 2021 22:42:10 +1000
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
--------------36E6B48FEAC961647B5A90F4
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/24/21 12:09 PM, Michael Ellerman wrote:

> Hi Ganesh,
>
> Some comments below ...
>
> Ganesh Goudar <ganeshgr@linux.ibm.com> writes:
>> Add support to parse and log control memory access
>> error for pseries.
>>
>> Signed-off-by: Ganesh Goudar <ganeshgr@linux.ibm.com>
>> ---
>> v2: No changes in this patch.
>> ---
>>   arch/powerpc/platforms/pseries/ras.c | 21 +++++++++++++++++++++
>>   1 file changed, 21 insertions(+)
>>
>> diff --git a/arch/powerpc/platforms/pseries/ras.c b/arch/powerpc/platforms/pseries/ras.c
>> index 167f2e1b8d39..608c35cad0c3 100644
>> --- a/arch/powerpc/platforms/pseries/ras.c
>> +++ b/arch/powerpc/platforms/pseries/ras.c
>> @@ -80,6 +80,7 @@ struct pseries_mc_errorlog {
>>   #define MC_ERROR_TYPE_TLB		0x04
>>   #define MC_ERROR_TYPE_D_CACHE		0x05
>>   #define MC_ERROR_TYPE_I_CACHE		0x07
>> +#define MC_ERROR_TYPE_CTRL_MEM_ACCESS	0x08
> ...
>>   
>> +#define MC_ERROR_CTRL_MEM_ACCESS_PTABLE_WALK	0
>> +#define MC_ERROR_CTRL_MEM_ACCESS_OP_ACCESS	1
>
> Where do the above values come from?

It is from latest PAPR that added support for control memory error.

>> +
>>   static inline u8 rtas_mc_error_sub_type(const struct pseries_mc_errorlog *mlog)
>>   {
>>   	switch (mlog->error_type) {
>> @@ -112,6 +116,8 @@ static inline u8 rtas_mc_error_sub_type(const struct pseries_mc_errorlog *mlog)
>>   	case	MC_ERROR_TYPE_ERAT:
>>   	case	MC_ERROR_TYPE_TLB:
>>   		return (mlog->sub_err_type & 0x03);
>> +	case	MC_ERROR_TYPE_CTRL_MEM_ACCESS:
>> +		return (mlog->sub_err_type & 0x70) >> 4;
> Can you add to the comment above sub_err_type explaining what these bits are.

Sure, for other errors it is explained in pseries_mc_errorlog definition, ill add it there.

>>   	default:
>>   		return 0;
>>   	}
>> @@ -699,6 +705,21 @@ static int mce_handle_err_virtmode(struct pt_regs *regs,
>>   	case MC_ERROR_TYPE_I_CACHE:
>>   		mce_err.error_type = MCE_ERROR_TYPE_ICACHE;
>>   		break;
>> +	case MC_ERROR_TYPE_CTRL_MEM_ACCESS:
>> +		mce_err.error_type = MCE_ERROR_TYPE_RA;
>> +		if (mce_log->sub_err_type & 0x80)
> This appears many times in the file.
>
> Can we add eg. MC_EFFECTIVE_ADDR_PROVIDED?

ok, thanks.

>> +			eaddr = be64_to_cpu(mce_log->effective_address);
>> +		switch (err_sub_type) {
>> +		case MC_ERROR_CTRL_MEM_ACCESS_PTABLE_WALK:
>> +			mce_err.u.ra_error_type =
>> +				MCE_RA_ERROR_PAGE_TABLE_WALK_LOAD_STORE_FOREIGN;
> That name is ridiculously long, but I guess that's not your fault :)
> We can fix it up in a later patch.
>
>> +			break;
>> +		case MC_ERROR_CTRL_MEM_ACCESS_OP_ACCESS:
>> +			mce_err.u.ra_error_type =
>> +				MCE_RA_ERROR_LOAD_STORE_FOREIGN;
>> +			break;
>> +		}
>> +		break;
> cheers

--------------36E6B48FEAC961647B5A90F4
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">
      <pre>On 8/24/21 12:09 PM, Michael Ellerman wrote:</pre>
    </div>
    <blockquote type="cite" cite="mid:87eeajcpmq.fsf@mpe.ellerman.id.au">
      <pre class="moz-quote-pre" wrap="">Hi Ganesh,

Some comments below ...

Ganesh Goudar <a class="moz-txt-link-rfc2396E" href="mailto:ganeshgr@linux.ibm.com">&lt;ganeshgr@linux.ibm.com&gt;</a> writes:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Add support to parse and log control memory access
error for pseries.

Signed-off-by: Ganesh Goudar <a class="moz-txt-link-rfc2396E" href="mailto:ganeshgr@linux.ibm.com">&lt;ganeshgr@linux.ibm.com&gt;</a>
---
v2: No changes in this patch.
---
 arch/powerpc/platforms/pseries/ras.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/powerpc/platforms/pseries/ras.c b/arch/powerpc/platforms/pseries/ras.c
index 167f2e1b8d39..608c35cad0c3 100644
--- a/arch/powerpc/platforms/pseries/ras.c
+++ b/arch/powerpc/platforms/pseries/ras.c
@@ -80,6 +80,7 @@ struct pseries_mc_errorlog {
 #define MC_ERROR_TYPE_TLB		0x04
 #define MC_ERROR_TYPE_D_CACHE		0x05
 #define MC_ERROR_TYPE_I_CACHE		0x07
+#define MC_ERROR_TYPE_CTRL_MEM_ACCESS	0x08
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">...
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap=""> 
+#define MC_ERROR_CTRL_MEM_ACCESS_PTABLE_WALK	0
+#define MC_ERROR_CTRL_MEM_ACCESS_OP_ACCESS	1
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">

Where do the above values come from?</pre>
    </blockquote>
    <pre class="moz-quote-pre" wrap="">It is from latest PAPR that added support for control memory error.
</pre>
    <blockquote type="cite" cite="mid:87eeajcpmq.fsf@mpe.ellerman.id.au">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+
 static inline u8 rtas_mc_error_sub_type(const struct pseries_mc_errorlog *mlog)
 {
 	switch (mlog-&gt;error_type) {
@@ -112,6 +116,8 @@ static inline u8 rtas_mc_error_sub_type(const struct pseries_mc_errorlog *mlog)
 	case	MC_ERROR_TYPE_ERAT:
 	case	MC_ERROR_TYPE_TLB:
 		return (mlog-&gt;sub_err_type &amp; 0x03);
+	case	MC_ERROR_TYPE_CTRL_MEM_ACCESS:
+		return (mlog-&gt;sub_err_type &amp; 0x70) &gt;&gt; 4;
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Can you add to the comment above sub_err_type explaining what these bits are.</pre>
    </blockquote>
    <pre class="moz-quote-pre" wrap="">Sure, for other errors it is explained in pseries_mc_errorlog definition, ill add it there. 
</pre>
    <blockquote type="cite" cite="mid:87eeajcpmq.fsf@mpe.ellerman.id.au">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap=""> 	default:
 		return 0;
 	}
@@ -699,6 +705,21 @@ static int mce_handle_err_virtmode(struct pt_regs *regs,
 	case MC_ERROR_TYPE_I_CACHE:
 		mce_err.error_type = MCE_ERROR_TYPE_ICACHE;
 		break;
+	case MC_ERROR_TYPE_CTRL_MEM_ACCESS:
+		mce_err.error_type = MCE_ERROR_TYPE_RA;
+		if (mce_log-&gt;sub_err_type &amp; 0x80)
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
This appears many times in the file.

Can we add eg. MC_EFFECTIVE_ADDR_PROVIDED?</pre>
    </blockquote>
    <pre>ok, thanks.
</pre>
    <blockquote type="cite" cite="mid:87eeajcpmq.fsf@mpe.ellerman.id.au">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+			eaddr = be64_to_cpu(mce_log-&gt;effective_address);
+		switch (err_sub_type) {
+		case MC_ERROR_CTRL_MEM_ACCESS_PTABLE_WALK:
+			mce_err.u.ra_error_type =
+				MCE_RA_ERROR_PAGE_TABLE_WALK_LOAD_STORE_FOREIGN;
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
That name is ridiculously long, but I guess that's not your fault :)
We can fix it up in a later patch.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+			break;
+		case MC_ERROR_CTRL_MEM_ACCESS_OP_ACCESS:
+			mce_err.u.ra_error_type =
+				MCE_RA_ERROR_LOAD_STORE_FOREIGN;
+			break;
+		}
+		break;
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
cheers
</pre>
    </blockquote>
  </body>
</html>

--------------36E6B48FEAC961647B5A90F4--

