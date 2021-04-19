Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 921A0363E80
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 11:30:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FP1kT3Zy4z3c00
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 19:30:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=C/S6BOZz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ganeshgr@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=C/S6BOZz; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FP1jy3P4Yz304j
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Apr 2021 19:29:41 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13J92ZuV036614; Mon, 19 Apr 2021 05:29:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=ROS/7MQK0yVtjqoDHgCjwN0KFaEEfjIgY3Gmlg7e9ZM=;
 b=C/S6BOZz9XLfLzbsJ2fYb95ph+uCnfNjUq0IuhXY9XhLG1A5JuhlJGprUwGnhcMjAIQs
 6zKwrEskMD4NlKiVR4dM3uRnmmMxOg/MfhUV8+cxXVEBg5jq/UMhnyGXtw87hFITzPl+
 jtBeZ6QZ+V2bo2p0FbL6tkp+bc289Qx9TMYTwpUO3Ux1/y3L3Y2QfYUlgUzkhKUuoa0t
 UGwnEUoHwkWFpHCo7RCnJopx4Mg9s58WP9Kg/4lMPIKA4Ac2XjxvxeUPSUc9HjNOVM+l
 Nbhqufms8HeWbWIbSt8GKo/M+at/hnu01LtKoZuCkRVTMOjgZ+b2XDgbZtpeiiKDfv3S 0A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 380cny2pdw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Apr 2021 05:29:34 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13J92iKX038147;
 Mon, 19 Apr 2021 05:29:33 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 380cny2pda-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Apr 2021 05:29:33 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13J9BZxT031861;
 Mon, 19 Apr 2021 09:29:31 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06ams.nl.ibm.com with ESMTP id 37yt2rrx77-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Apr 2021 09:29:31 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 13J9T6wJ34079088
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Apr 2021 09:29:06 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 597F5AE055;
 Mon, 19 Apr 2021 09:29:29 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 134E7AE045;
 Mon, 19 Apr 2021 09:29:27 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.77.192.155])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 19 Apr 2021 09:29:26 +0000 (GMT)
Subject: Re: [PATCH] powerpc/pseries/mce: Fix a typo in error type assignment
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
References: <20210416125750.49550-1-ganeshgr@linux.ibm.com>
 <87fszpdr5m.fsf@mpe.ellerman.id.au>
From: Ganesh <ganeshgr@linux.ibm.com>
Message-ID: <4c45d421-ea8c-6243-ee15-ebc85dc733a6@linux.ibm.com>
Date: Mon, 19 Apr 2021 14:59:25 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <87fszpdr5m.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: xYrMShdv6UmjafkOPLNilI1nbNJu4Vpp
X-Proofpoint-ORIG-GUID: IBbSVCzikiUj35ivR8ms-IhpmQBXjDzJ
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-19_05:2021-04-16,
 2021-04-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0
 priorityscore=1501 mlxscore=0 phishscore=0 mlxlogscore=999 spamscore=0
 impostorscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104190063
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
Cc: mahesh@linux.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 4/17/21 6:06 PM, Michael Ellerman wrote:

> Ganesh Goudar <ganeshgr@linux.ibm.com> writes:
>> The error type is ICACHE and DCACHE, for case MCE_ERROR_TYPE_ICACHE.
> Do you mean "is ICACHE not DCACHE" ?

Right :), Should I send v2 ?

>
> cheers
>
>> Signed-off-by: Ganesh Goudar <ganeshgr@linux.ibm.com>
>> ---
>>   arch/powerpc/platforms/pseries/ras.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/powerpc/platforms/pseries/ras.c b/arch/powerpc/platforms/pseries/ras.c
>> index f8b390a9d9fb..9d4ef65da7f3 100644
>> --- a/arch/powerpc/platforms/pseries/ras.c
>> +++ b/arch/powerpc/platforms/pseries/ras.c
>> @@ -699,7 +699,7 @@ static int mce_handle_err_virtmode(struct pt_regs *regs,
>>   		mce_err.error_type = MCE_ERROR_TYPE_DCACHE;
>>   		break;
>>   	case MC_ERROR_TYPE_I_CACHE:
>> -		mce_err.error_type = MCE_ERROR_TYPE_DCACHE;
>> +		mce_err.error_type = MCE_ERROR_TYPE_ICACHE;
>>   		break;
>>   	case MC_ERROR_TYPE_UNKNOWN:
>>   	default:
>> -- 
>> 2.26.2
