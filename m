Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D002911D9
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Oct 2020 14:29:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CD2Pn30m2zDqF7
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Oct 2020 23:29:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CD2MS0yVBzDqjQ
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Oct 2020 23:27:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=CVGnw7qS; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4CD2MR71Nlz8tVV
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Oct 2020 23:26:59 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 4CD2MR6HvPz9sTc; Sat, 17 Oct 2020 23:26:59 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=hegdevasant@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=CVGnw7qS; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4CD2MR0pX5z9sT6;
 Sat, 17 Oct 2020 23:26:57 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09HC3KNC155004; Sat, 17 Oct 2020 08:26:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=ppcC5CHpTCUq314XYJL/g5/GU5nNEc7fng9aYIypWQQ=;
 b=CVGnw7qSqjNRpDy71nPcAQmryXNsh4TN67M2JktlsaFsnWPvXmRyoFk0TkBLZvEKcYml
 fdYak6EoxZGY3yCt1+Hl0kEQsWUWx+tiDQFlscExM3eNbbijqHXyoo4GyfX6+FHJHTNj
 YMW9JK0OzcD0ChcxiUz3EqgDQ6ekSAg89Or3HFIOiIPIsDfVtgIzxzfGAUmjo+mNBdnc
 NqBU/7G5os5kA2nDdEYmZtH4kRHTZ6jwt+XuFjx68u7LOckigCw2NgocH52DxoIlYSVV
 bmu633Ngf/La8qPygJYAqzEKrF3F9PmD3TrmWPru2lLZWpHJtNoRsDeGjvEd0HXLkqIU +Q== 
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3480098kw9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 17 Oct 2020 08:26:53 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09HCEWv7008686;
 Sat, 17 Oct 2020 12:26:51 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma05fra.de.ibm.com with ESMTP id 347r8805eu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 17 Oct 2020 12:26:51 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 09HCQmYd24445214
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 17 Oct 2020 12:26:48 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 35C205204F;
 Sat, 17 Oct 2020 12:26:48 +0000 (GMT)
Received: from [9.199.43.235] (unknown [9.199.43.235])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 6FA6152050;
 Sat, 17 Oct 2020 12:26:47 +0000 (GMT)
Subject: Re: [PATCH] powerpc/powernv/dump: Fix race while processing OPAL dump
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@ozlabs.org
References: <20201007101742.40757-1-hegdevasant@linux.vnet.ibm.com>
 <87a6ww0yzr.fsf@mpe.ellerman.id.au>
From: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>
Message-ID: <4ec0e290-905b-bf71-9d10-29f54a1bdf8d@linux.vnet.ibm.com>
Date: Sat, 17 Oct 2020 17:56:46 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <87a6ww0yzr.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-17_07:2020-10-16,
 2020-10-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 mlxscore=0 adultscore=0 mlxlogscore=999 lowpriorityscore=0 clxscore=1015
 bulkscore=0 phishscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2010170081
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 10/9/20 10:36 AM, Michael Ellerman wrote:
> Vasant Hegde <hegdevasant@linux.vnet.ibm.com> writes:
>> diff --git a/arch/powerpc/platforms/powernv/opal-dump.c b/arch/powerpc/platforms/powernv/opal-dump.c
>> index 543c816fa99e..7e6eeedec32b 100644
>> --- a/arch/powerpc/platforms/powernv/opal-dump.c
>> +++ b/arch/powerpc/platforms/powernv/opal-dump.c
>> @@ -346,21 +345,39 @@ static struct dump_obj *create_dump_obj(uint32_t id, size_t size,
>>   	rc = kobject_add(&dump->kobj, NULL, "0x%x-0x%x", type, id);
>>   	if (rc) {
>>   		kobject_put(&dump->kobj);
>> -		return NULL;
>> +		return;
>>   	}
>>   
>> +	/*
>> +	 * As soon as the sysfs file for this dump is created/activated there is
>> +	 * a chance the opal_errd daemon (or any userspace) might read and
>> +	 * acknowledge the dump before kobject_uevent() is called. If that
>> +	 * happens then there is a potential race between
>> +	 * dump_ack_store->kobject_put() and kobject_uevent() which leads to a
>> +	 * use-after-free of a kernfs object resulting in a kernel crash.
>> +	 *
>> +	 * To avoid that, we need to take a reference on behalf of the bin file,
>> +	 * so that our reference remains valid while we call kobject_uevent().
>> +	 * We then drop our reference before exiting the function, leaving the
>> +	 * bin file to drop the last reference (if it hasn't already).
>> +	 */
>> +
>> +	/* Take a reference for the bin file */
>> +	kobject_get(&dump->kobj);
>>   	rc = sysfs_create_bin_file(&dump->kobj, &dump->dump_attr);
>>   	if (rc) {
>>   		kobject_put(&dump->kobj);
>> -		return NULL;
>> +		/* Drop reference count taken for bin file */
>> +		kobject_put(&dump->kobj);
>> +		return;
>>   	}
>>   
>>   	pr_info("%s: New platform dump. ID = 0x%x Size %u\n",
>>   		__func__, dump->id, dump->size);
>>   
>>   	kobject_uevent(&dump->kobj, KOBJ_ADD);
>> -
>> -	return dump;
>> +	/* Drop reference count taken for bin file */
>> +	kobject_put(&dump->kobj);
>>   }
> 
> I think this would be better if it was reworked along the lines of:
> 
> aea948bb80b4 ("powerpc/powernv/elog: Fix race while processing OPAL error log event.")

Sure. Will fix it in v2.

-Vasant
