Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3802F72906B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jun 2023 08:52:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QcsFz6yfzz3fbZ
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jun 2023 16:52:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rIo2mO9Y;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rIo2mO9Y;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QcsDm6J53z3fFs
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Jun 2023 16:51:20 +1000 (AEST)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3596gDf1002088
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 9 Jun 2023 06:51:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=ysJyQA/rmB+Nlf0ejCIsK6jJo8v8kyZ2D7V2aWs2FSQ=;
 b=rIo2mO9Ym0lQPGi1ro3fwGN62evGRn3wZjQEjZjX5itdWLKkk1q6ZlMH2zv5SO1gKlbE
 pCo76me05aXenwV7DNgCHV6X7oQgeqYej2NfdjA1Zt+qqdrZiNNDMmYBi26c1TSpKat9
 BaIBVrnHGvwRZHt38u9OldoKHbQtr0sxsL8GWYaWWR2SONu/Yvpv91iB9SqvRkM+BTGv
 0EFQZFT8WTQuSLYXO/tx/sgbL+V8Q2rLrEEOvxhFnXt0oaY7Nhw7xgWdfaLdVK5DA4Iw
 pn1mi8+ZVWhUEhh+9wcaZ2AbGAWrb7yp2B0VCfEHJpBT87G9hwS4nIBzt5tqdW1RKY34 Ow== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r3y1sg820-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Jun 2023 06:51:18 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3591GPiF004978
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 9 Jun 2023 06:51:16 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3r2a78stg7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Jun 2023 06:51:15 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3596pAiN21955248
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 9 Jun 2023 06:51:10 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D413520043;
	Fri,  9 Jun 2023 06:51:10 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B3DAF2004D;
	Fri,  9 Jun 2023 06:51:09 +0000 (GMT)
Received: from [9.43.83.118] (unknown [9.43.83.118])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  9 Jun 2023 06:51:09 +0000 (GMT)
Message-ID: <32eabf61-69ba-f850-b123-422c6802e796@linux.ibm.com>
Date: Fri, 9 Jun 2023 12:21:08 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] powerpc/fadump: invoke ibm,os-term with
 rtas_call_unlocked()
Content-Language: en-US
To: mahesh@linux.ibm.com
References: <20230609051846.132457-1-hbathini@linux.ibm.com>
 <riahmqyz32avudmqyoreffhtgeyz3ggisu7n5jrh2gvaqo6pxz@43watyra7uq2>
From: Hari Bathini <hbathini@linux.ibm.com>
In-Reply-To: <riahmqyz32avudmqyoreffhtgeyz3ggisu7n5jrh2gvaqo6pxz@43watyra7uq2>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ZISUhGkURDTku2xL7KetHiC90UBnzk_j
X-Proofpoint-ORIG-GUID: ZISUhGkURDTku2xL7KetHiC90UBnzk_j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-09_04,2023-06-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 phishscore=0 adultscore=0 mlxlogscore=832 malwarescore=0
 lowpriorityscore=0 mlxscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306090057
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Sourabh Jain <sourabhjain@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 09/06/23 11:03 am, Mahesh J Salgaonkar wrote:
> On 2023-06-09 10:48:46 Fri, Hari Bathini wrote:
>> Invoke ibm,os-term call with rtas_call_unlocked(), without using the
>> RTAS spinlock, to avoid deadlock in the unlikely event of a machine
>> crash while making an RTAS call.
> 
> Thanks for the patch. Minor comment bellow.
> 
>>
>> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
>> ---
>>   arch/powerpc/kernel/rtas.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
>> index c087eeee320f..f65b2a8cc0f1 100644
>> --- a/arch/powerpc/kernel/rtas.c
>> +++ b/arch/powerpc/kernel/rtas.c
>> @@ -1587,6 +1587,7 @@ static bool ibm_extended_os_term;
>>   void rtas_os_term(char *str)
>>   {
>>   	s32 token = rtas_function_token(RTAS_FN_IBM_OS_TERM);
>> +	static struct rtas_args args;
>>   	int status;
>>   
>>   	/*
>> @@ -1607,7 +1608,7 @@ void rtas_os_term(char *str)
>>   	 * schedules.
>>   	 */
>>   	do {
>> -		status = rtas_call(token, 1, 1, NULL, __pa(rtas_os_term_buf));
>> +		status = rtas_call_unlocked(&args, token, 1, 1, NULL, __pa(rtas_os_term_buf));
> 
> rtas_call_unlocked() returns void. You may want to extract the status
> from args->rets[0].

Yeah, Mahesh. I posted a stale version. Will post the updated version.

Thanks
Hari
