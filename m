Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CD2B756A78C
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Jul 2022 18:11:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lf1ch59l4z3c7C
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Jul 2022 02:11:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HVp6oxP9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=stefanb@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HVp6oxP9;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lf1bx0S0Jz3btt
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Jul 2022 02:10:52 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 267Fpb0X019270;
	Thu, 7 Jul 2022 16:10:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=k2FbwF9n2WlYsbyJT6u8wd+x1qkusCWll51c/T/HkIg=;
 b=HVp6oxP9r52mmrtl2+FUSAvdoYlihvjsRlt27n6DESdPoWQHYJ4lAdzZ88Wi4m9UAfeN
 oyC7HOBFYKzsKUvUhjWmoxBQtLgfY4BXBMZq+u2+NHXOcgLVxkhY3F40+2VtMU8mCZ3i
 MqPm9PWb7e4y5RKpwWG5zWmnPpLJIuPuFsg9vLLqpSG6Kli+I4FtHke8EWairzbKIbiY
 wzx9aC0dO1EhDOvJqYgVdk/UP6iiHI5HXSSdsa9z0VD/yopbBJtxSKHGR4b4tS0O9GQZ
 LC6sUvoc1GbecoJEKxnDgjWMzl2vKJwdaLG2V5zcv6n631PQz5ux4yE9LK9xh355uLg5 oQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h62ge8mns-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Jul 2022 16:10:36 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 267FqNKI021028;
	Thu, 7 Jul 2022 16:10:35 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com [169.47.144.27])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h62ge8mms-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Jul 2022 16:10:35 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
	by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 267G6WYQ001499;
	Thu, 7 Jul 2022 16:10:34 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
	by ppma05wdc.us.ibm.com with ESMTP id 3h4v50466j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Jul 2022 16:10:34 +0000
Received: from b03ledav005.gho.boulder.ibm.com (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
	by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 267GAXeL19202458
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 7 Jul 2022 16:10:33 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F0163BE04F;
	Thu,  7 Jul 2022 16:10:32 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 44C5FBE05A;
	Thu,  7 Jul 2022 16:10:32 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
	by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
	Thu,  7 Jul 2022 16:10:32 +0000 (GMT)
Message-ID: <985a1b8b-5c1c-ba9c-ce6c-4968239448a2@linux.ibm.com>
Date: Thu, 7 Jul 2022 12:10:31 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v5 5/6] of: kexec: Refactor IMA buffer related functions
 to make them reusable
Content-Language: en-US
To: Jonathan McDowell <noodles@fb.com>
References: <20220706152329.665636-1-stefanb@linux.ibm.com>
 <20220706152329.665636-6-stefanb@linux.ibm.com>
 <YsbyENo0bOLljuI8@noodles-fedora.dhcp.thefacebook.com>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <YsbyENo0bOLljuI8@noodles-fedora.dhcp.thefacebook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: _OaNNuDjz8Hd459zm8GiKq_DyNZHoUcS
X-Proofpoint-GUID: U-3ZkHWU9gvO6dxrVjnbK-s6nuslBSZu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-07_12,2022-06-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 mlxscore=0 adultscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 mlxlogscore=999 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207070061
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Frank Rowand <frowand.list@gmail.com>, "nayna@linux.ibm.com" <nayna@linux.ibm.com>, "kexec@lists.infradead.org" <kexec@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mimi Zohar <zohar@linux.ibm.com>, Rob Herring <robh+dt@kernel.org>, "nasastry@in.ibm.com" <nasastry@in.ibm.com>, "linux-integrity@vger.kernel.org" <linux-integrity@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 7/7/22 10:47, Jonathan McDowell wrote:
> On Wed, Jul 06, 2022 at 11:23:28AM -0400, Stefan Berger wrote:
>> Refactor IMA buffer related functions to make them reusable for carrying
>> TPM logs across kexec.
>>
>> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
>> Cc: Rob Herring <robh+dt@kernel.org>
>> Cc: Frank Rowand <frowand.list@gmail.com>
>> Cc: Mimi Zohar <zohar@linux.ibm.com>
>>
>> ---
>> v5:
>>   - Rebased on Jonathan McDowell's commit "b69a2afd5afc x86/kexec: Carry
>>     forward IMA measurement log on kexec"
>> v4:
>>   - Move debug output into setup_buffer()
>> ---
>>   drivers/of/kexec.c | 125 ++++++++++++++++++++++++++-------------------
>>   1 file changed, 73 insertions(+), 52 deletions(-)
>>
>> diff --git a/drivers/of/kexec.c b/drivers/of/kexec.c
>> index 548dd5b1b5c1..404a86bb3978 100644
>> --- a/drivers/of/kexec.c
>> +++ b/drivers/of/kexec.c
>> @@ -117,45 +117,56 @@ static int do_get_kexec_buffer(const void *prop, int len, unsigned long *addr,
>>   }
>>   
>>   #ifdef CONFIG_HAVE_IMA_KEXEC
>> -/**
>> - * ima_get_kexec_buffer - get IMA buffer from the previous kernel
>> - * @addr:	On successful return, set to point to the buffer contents.
>> - * @size:	On successful return, set to the buffer size.
>> - *
>> - * Return: 0 on success, negative errno on error.
>> - */
>> -int __init ima_get_kexec_buffer(void **addr, size_t *size)
>> +static int get_kexec_buffer(const char *name, unsigned long *addr, size_t *size)
> 
> I think this new function can + should be marked __init as well; it's
> only called from the existing IMA functions and your new
> tpm_get_kexec_buffer which is already __init.

Yes, right. Thanks.
    Stefan
