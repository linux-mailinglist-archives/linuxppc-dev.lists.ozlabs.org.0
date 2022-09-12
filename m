Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 374B65B54D6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Sep 2022 08:53:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MQy440mVXz3bbQ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Sep 2022 16:53:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ifncPVbu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ifncPVbu;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MQy3P3mNcz2xHF
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Sep 2022 16:53:05 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28C5xPbd015729;
	Mon, 12 Sep 2022 06:52:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=Jo2lx1l6hBTIPYe6YyBOPt1FLKue2nybCoiv7oyh7Sk=;
 b=ifncPVbuF59LwXscoMTA+YQBEoedIT04tiM34ybOisC7gbScUtqC0yiQ/wDACChnLqgJ
 pcT4CwMOIZlSgRfKOxQHXE5r5pp+ymw6pkC8N77iq56hd4F0Yry+gCEhe91QzLvVGIN3
 tT0UrEVkZ6gv7nZPazU4bAQwlKb2XmrJMT/7sJQmpkYGncmTBfo8TRWjT1KV1pO9rW3V
 aPNAf1ke+k2pebE2VU6t+b4NKI7EpFGGYvE9F7DeMnV85mhO+TGCNn7bKZNyZZbNz0sc
 fUNOZWZztSgp5RPfwi3dg102/QcV5LM3u/fkkTRTKmXFqz76PMPJqPcBSMbY2dT2y3m8 dA== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com [149.81.74.107])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jhy3x9b0w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Sep 2022 06:52:58 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
	by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28C6aOog020133;
	Mon, 12 Sep 2022 06:52:55 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
	by ppma03fra.de.ibm.com with ESMTP id 3jgj78secj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Sep 2022 06:52:55 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28C6qq0K37028328
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 Sep 2022 06:52:52 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1981F5204E;
	Mon, 12 Sep 2022 06:52:52 +0000 (GMT)
Received: from [9.203.106.190] (unknown [9.203.106.190])
	by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id BF1555204F;
	Mon, 12 Sep 2022 06:52:50 +0000 (GMT)
Message-ID: <3583c52c-52c1-b211-dc09-5de22472b084@linux.ibm.com>
Date: Mon, 12 Sep 2022 12:22:50 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH] ppc64/kdump: Limit kdump base to 512MB
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
        Michael Ellerman <mpe@ellerman.id.au>
References: <20220909174034.34086-1-hbathini@linux.ibm.com>
 <023c95f4-cee2-221d-0fdd-e3ab677483f6@csgroup.eu>
Content-Language: en-US
From: Hari Bathini <hbathini@linux.ibm.com>
In-Reply-To: <023c95f4-cee2-221d-0fdd-e3ab677483f6@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 61mvlYMY9PIYkfKSvs8e9qRiJQft7M6Q
X-Proofpoint-GUID: 61mvlYMY9PIYkfKSvs8e9qRiJQft7M6Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-12_04,2022-09-09_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 adultscore=0 impostorscore=0 mlxlogscore=999 lowpriorityscore=0
 suspectscore=0 mlxscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209120020
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Sourabh Jain <sourabhjain@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 12/09/22 10:54 am, Christophe Leroy wrote:
> 
> 
> Le 09/09/2022 à 19:40, Hari Bathini a écrit :
>> Since commit e641eb03ab2b0 ("powerpc: Fix up the kdump base cap to
>> 128M") memory for kdump kernel has been reserved at an offset of
>> 128MB. This held up well for a long time before running into boot
>> failure on LPARs having a lot of cores. Commit 7c5ed82b800d8
>> ("powerpc: Set crashkernel offset to mid of RMA region") fixed this
>> boot failure by moving the offset to mid of RMA region. Limit this
>> offset to 512MB to avoid running into boot failures, during kdump
>> kernel boot, due RTAS or other allocation restrictions.
>>
>> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
>> ---
>>    arch/powerpc/kexec/core.c | 4 ++--
>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/powerpc/kexec/core.c b/arch/powerpc/kexec/core.c
>> index cf84bfe9e27e..c2cbfcf81cea 100644
>> --- a/arch/powerpc/kexec/core.c
>> +++ b/arch/powerpc/kexec/core.c
>> @@ -136,7 +136,7 @@ void __init reserve_crashkernel(void)
>>    #ifdef CONFIG_PPC64
>>    		/*
>>    		 * On the LPAR platform place the crash kernel to mid of
>> -		 * RMA size (512MB or more) to ensure the crash kernel
>> +		 * RMA size (max. of 512MB) to ensure the crash kernel
>>    		 * gets enough space to place itself and some stack to be
>>    		 * in the first segment. At the same time normal kernel
>>    		 * also get enough space to allocate memory for essential
>> @@ -144,7 +144,7 @@ void __init reserve_crashkernel(void)
>>    		 * kernel starts at 128MB offset on other platforms.
>>    		 */
>>    		if (firmware_has_feature(FW_FEATURE_LPAR))
>> -			crashk_res.start = ppc64_rma_size / 2;
>> +			crashk_res.start = min(0x20000000ULL, (ppc64_rma_size / 2));
> 
> Use SZ_512M instead of open coding.
> 
> Remove the ( ) around ppc64_rma_size / 2

Thanks for the review. Posted v2 with updated changelog and
the above addressed..

- Hari
