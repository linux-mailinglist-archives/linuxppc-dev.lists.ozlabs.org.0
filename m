Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC8E88C66E7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2024 15:10:22 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Y61M7fN+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VfYVf6tYFz3cnR
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2024 23:10:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Y61M7fN+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=dtsen@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VfYTz2qkYz3bnL
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 May 2024 23:09:42 +1000 (AEST)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44FD26Bb015083;
	Wed, 15 May 2024 13:09:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=Je8U2UY3rc1I4AkmbgNevevdjkjvB7fm8bL0HEh64WE=;
 b=Y61M7fN+tPqlrqXlfmls/IYw6qvfo5LdkLIh/CpHmZAQ+GfHI7Rz6YpRxjRouiUNSkZo
 autp7HVJsKwfKC1xSJ04ooxYUI9K01vjlOS3Kx1Zjs3Zjsh4wHDU0icrBo3Xo2y86OK8
 MC4YcJ7FrJ/TgMc4RhGX5Rg43CVzpumeRHhoLzPEeLWk24UIYvzrMjucCFm5y4M4mNrM
 HaLDuLpLtNd7Wkg5EgFkrwKflfBMiMCB9siuuxD9NzJ18AxoGVQknKLssDKudM2yJ3r5
 XJoOkvhSMdxZrGpYpw6zHcTxyYoIPuTcDUL3qLSkOsnZxbJqE68yV6c6oDs5ZHVCEPoz TQ== 
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y4wjw00cx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 May 2024 13:09:28 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44FBf8o0006183;
	Wed, 15 May 2024 13:06:06 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([172.16.1.6])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3y2mgmkn2t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 May 2024 13:06:06 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com [10.39.53.230])
	by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44FD63ag24052460
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 15 May 2024 13:06:05 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 29DC158064;
	Wed, 15 May 2024 13:06:03 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EADB55805A;
	Wed, 15 May 2024 13:06:01 +0000 (GMT)
Received: from [9.67.88.41] (unknown [9.67.88.41])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 15 May 2024 13:06:01 +0000 (GMT)
Message-ID: <74a95c1b-5137-46bc-beb1-45a7e93f8bdb@linux.ibm.com>
Date: Wed, 15 May 2024 08:06:01 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] crypto: X25519 core functions for ppc64le
To: Andy Polyakov <appro@cryptogams.org>, linux-crypto@vger.kernel.org
References: <20240514173835.4814-1-dtsen@linux.ibm.com>
 <20240514173835.4814-3-dtsen@linux.ibm.com>
 <847f2e4f-ace1-415d-b129-ed2751429eec@cryptogams.org>
Content-Language: en-US
From: Danny Tsen <dtsen@linux.ibm.com>
In-Reply-To: <847f2e4f-ace1-415d-b129-ed2751429eec@cryptogams.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: TSAG0K77Roghbt5nN-MN6XF1lYphDOFS
X-Proofpoint-ORIG-GUID: TSAG0K77Roghbt5nN-MN6XF1lYphDOFS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-15_06,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 phishscore=0 mlxscore=0 mlxlogscore=884 lowpriorityscore=0 clxscore=1015
 bulkscore=0 spamscore=0 malwarescore=0 impostorscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2405150092
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

Points taken.  And much appreciate for the help.

Thanks.

-Danny

On 5/15/24 3:29 AM, Andy Polyakov wrote:
> Hi,
>
>> +static void cswap(fe51 p, fe51 q, unsigned int bit)
>> +{
>> +    u64 t, i;
>> +    u64 c = 0 - (u64) bit;
>> +
>> +    for (i = 0; i < 5; ++i) {
>> +        t = c & (p[i] ^ q[i]);
>> +        p[i] ^= t;
>> +        q[i] ^= t;
>> +    }
>> +}
>
> The "c" in cswap stands for "constant-time," and the problem is that 
> contemporary compilers have exhibited the ability to produce 
> non-constant-time machine code as result of compilation of the above 
> kind of technique. The outcome is platform-specific and ironically 
> some of PPC code generators were observed to generate "most" 
> non-constant-time code. "Most" in sense that execution time variations 
> would be most easy to catch. One way to work around the problem, at 
> least for the time being, is to add 'asm volatile("" : "+r"(c))' after 
> you calculate 'c'. But there is no guarantee that the next compiler 
> version won't see through it, hence the permanent solution is to do it 
> in assembly. I can put together something...
>
> Cheers.
>
