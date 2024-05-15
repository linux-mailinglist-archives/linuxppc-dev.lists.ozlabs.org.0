Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4DF8C6812
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2024 15:59:32 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Bz+kHhm3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VfZbP6HfKz3cYw
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2024 23:59:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Bz+kHhm3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=dtsen@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VfZZf0y4Sz3cX6
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 May 2024 23:58:49 +1000 (AEST)
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44FDfX0D023613;
	Wed, 15 May 2024 13:58:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=zPt37DEPyt+WFz7Qhwmd8YhDjXwM3w+eiE4uQ3f7kEo=;
 b=Bz+kHhm3r5w7i5M7D6850hAvlijpvflEnP5mI80VknGWmLmmIInb5x+cK7USTNKL9hPp
 a7PZm/6lcCD5DQQvRBpx8/xSZsdcgbx28GYScE8FuLiiEX+CcCaqUOmkGH5hvjxtoLQO
 36P94EjSxJlhXPq9qQXedalcm3SrFWk/VLNuj1V6QcDxAyjueYTZWcrq9A2TGNrZxu1y
 sn7PKD4Q3I0FEyPaZbe5lgHstr2o3BqGISaUbo+3NS32edWv6y4MTv7JArTYnM7rubD5
 Mjp8VeUFjmGAvVXFn6661X6R6RbWg6PH/jPO4G09q54xYtR0UfHCqeisUYefFA6l/ieR aA== 
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y4x5681nx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 May 2024 13:58:37 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44FAiFlv018764;
	Wed, 15 May 2024 13:58:36 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([172.16.1.68])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3y2k0tm50m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 May 2024 13:58:36 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com [10.39.53.230])
	by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44FDwXnp44499700
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 15 May 2024 13:58:35 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 18E845806A;
	Wed, 15 May 2024 13:58:33 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CBA5F58068;
	Wed, 15 May 2024 13:58:31 +0000 (GMT)
Received: from [9.67.88.41] (unknown [9.67.88.41])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 15 May 2024 13:58:31 +0000 (GMT)
Message-ID: <7859e867-ddf4-494f-8ddb-2949aafbb40a@linux.ibm.com>
Date: Wed, 15 May 2024 08:58:31 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] crypto: X25519 core functions for ppc64le
To: Andy Polyakov <appro@cryptogams.org>, linux-crypto@vger.kernel.org
References: <20240514173835.4814-1-dtsen@linux.ibm.com>
 <20240514173835.4814-3-dtsen@linux.ibm.com>
 <847f2e4f-ace1-415d-b129-ed2751429eec@cryptogams.org>
 <7eb6bf4b-5510-48fe-aa6c-ac5207d5a2c1@cryptogams.org>
Content-Language: en-US
From: Danny Tsen <dtsen@linux.ibm.com>
In-Reply-To: <7eb6bf4b-5510-48fe-aa6c-ac5207d5a2c1@cryptogams.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 44D4IcrovAzxQUN07xlYZFX7Nka1sESy
X-Proofpoint-GUID: 44D4IcrovAzxQUN07xlYZFX7Nka1sESy
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-15_07,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 phishscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 mlxscore=0 spamscore=0 adultscore=0 mlxlogscore=945
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405150098
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
Cc: herbert@gondor.apana.org.au, dtsen@us.ibm.com, nayna@linux.ibm.com, linux-kernel@vger.kernel.org, ltcgcw@linux.vnet.ibm.com, leitao@debian.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Andy,

Thanks for the info.  I should be able to do it.  I was hoping an 
assembly guru like you can show me some tricks here if there is :)

Thanks.

-Danny

On 5/15/24 8:33 AM, Andy Polyakov wrote:
>>> +static void cswap(fe51 p, fe51 q, unsigned int bit)
>>> +{
>>> +    u64 t, i;
>>> +    u64 c = 0 - (u64) bit;
>>> +
>>> +    for (i = 0; i < 5; ++i) {
>>> +        t = c & (p[i] ^ q[i]);
>>> +        p[i] ^= t;
>>> +        q[i] ^= t;
>>> +    }
>>> +}
>>
>> The "c" in cswap stands for "constant-time," and the problem is that 
>> contemporary compilers have exhibited the ability to produce 
>> non-constant-time machine code as result of compilation of the above 
>> kind of technique. The outcome is platform-specific and ironically 
>> some of PPC code generators were observed to generate "most" 
>> non-constant-time code. "Most" in sense that execution time 
>> variations would be most easy to catch.
>
> Just to substantiate the point, consider 
> https://godbolt.org/z/faYnEcPT7, and note the conditional branch in 
> the middle of the loop, which flies in the face of constant-time-ness. 
> In case you object 'bit &= 1' on line 7 in the C code. Indeed, if you 
> comment it out, the generated code will be fine. But the point is that 
> the compiler is capable of and was in fact observed to figure out that 
> the caller passes either one or zero and generate the machine code in 
> the assembly window. In other words 'bit &= 1' is just a reflection of 
> what the caller does.
>
>> ... the permanent solution is to do it in assembly. I can put 
>> together something...
>
> Though you should be able to do this just as well :-) So should I or 
> would you?
>
> Cheers.
>
