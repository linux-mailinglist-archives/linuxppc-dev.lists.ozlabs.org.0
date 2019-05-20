Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6E222C61
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 May 2019 08:55:15 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 456qQn0sLNzDqFs
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 May 2019 16:55:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=fbarrat@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 456qPV2clQzDqDS
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 May 2019 16:54:05 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4K6qmIP085578
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 May 2019 02:54:01 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2skmwandcx-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 May 2019 02:54:01 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <fbarrat@linux.ibm.com>;
 Mon, 20 May 2019 07:54:00 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 20 May 2019 07:53:57 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x4K6ruXA53084334
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 20 May 2019 06:53:56 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4ED60A4040;
 Mon, 20 May 2019 06:53:56 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 09A82A4051;
 Mon, 20 May 2019 06:53:56 +0000 (GMT)
Received: from pic2.home (unknown [9.145.147.217])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 20 May 2019 06:53:55 +0000 (GMT)
Subject: Re: [PATCH] ocxl: Fix potential memory leak on context creation
To: Andrew Donnellan <ajd@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 andrew.donnellan@au1.ibm.com, alastair@au1.ibm.com
References: <20190517142054.13933-1-fbarrat@linux.ibm.com>
 <b0d819db-d052-0601-c72b-159017c7e925@linux.ibm.com>
From: Frederic Barrat <fbarrat@linux.ibm.com>
Date: Mon, 20 May 2019 08:53:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <b0d819db-d052-0601-c72b-159017c7e925@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr-MC
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19052006-4275-0000-0000-0000033694DF
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19052006-4276-0000-0000-000038462403
Message-Id: <abd1637c-64bc-7772-c349-3b645a5ee6aa@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-20_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=722 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905200050
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
Cc: clombard@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 20/05/2019 à 03:45, Andrew Donnellan a écrit :
> On 18/5/19 12:20 am, Frederic Barrat wrote:
>> If we couldn't fully init a context, we were leaking memory.
>>
>> Fixes: b9721d275cc2 ("ocxl: Allow external drivers to use OpenCAPI 
>> contexts")
>> Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
> 
> Acked-by: Andrew Donnellan <ajd@linux.ibm.com>
> 
>> ---
>>   drivers/misc/ocxl/context.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/misc/ocxl/context.c b/drivers/misc/ocxl/context.c
>> index bab9c9364184..ab93156aa83e 100644
>> --- a/drivers/misc/ocxl/context.c
>> +++ b/drivers/misc/ocxl/context.c
>> @@ -22,6 +22,7 @@ int ocxl_context_alloc(struct ocxl_context 
>> **context, struct ocxl_afu *afu,
>>               afu->pasid_base + afu->pasid_max, GFP_KERNEL);
>>       if (pasid < 0) {
>>           mutex_unlock(&afu->contexts_lock);
>> +        kfree(*context);
> 
> (defensive programming: set *context = NULL so that if the caller 
> ignores the return code we get an obvious crash)


Good point. v2 on its way


>>           return pasid;
>>       }
>>       afu->pasid_count++;
>>
> 

