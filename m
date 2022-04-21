Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A58E550997A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Apr 2022 09:51:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KkV9l3Hdlz3bZ2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Apr 2022 17:51:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=m73OyGDy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=fbarrat@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=m73OyGDy; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KkV931JPrz2xsc
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Apr 2022 17:51:18 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23L780YU008515; 
 Thu, 21 Apr 2022 07:51:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=wdSvHv9baqpuxngn9D4RPIwFMM8eVE2OZpbXOHRZAJ4=;
 b=m73OyGDyxe28vaQZi3CvsMFP9NQYH+NZoepaTvRPrsaU72/MtX8QwoJrn6VvaMrQWhTo
 y9zB4Chy6jAoi+WM8N9XjjecrdbG3wrvcbMGyZa29K/pUgvj4KB59eXRdYzON0jsGix2
 3usCxNdiIKaNEZkcuFDeX3jrnRC0M/2AHV9bGyH7Knpst2M3LZn4RjGXi1HuP2TcPZMv
 DyLcujMAd5Oho9Bg7tlUV+8Jqkv7F3NSWj+4S2xuFqE1bgPRncQQYM1yVbBblpaCaFB7
 XBLN021CAQU7V5Y/IvSF/rJl/OdwsEeOLBfRjJdMrBPhfhXo0uMdxFsLELHz30FDgYVj TQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3fjn0xfj1c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Apr 2022 07:51:09 +0000
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 23L7ogAX007872;
 Thu, 21 Apr 2022 07:51:09 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3fjn0xfj0s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Apr 2022 07:51:09 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 23L7mCBl013154;
 Thu, 21 Apr 2022 07:51:07 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04fra.de.ibm.com with ESMTP id 3ffvt9dh57-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Apr 2022 07:51:06 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 23L7p4QI43909380
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 21 Apr 2022 07:51:04 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5837F5204F;
 Thu, 21 Apr 2022 07:51:04 +0000 (GMT)
Received: from [9.145.22.248] (unknown [9.145.22.248])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id DB89A52052;
 Thu, 21 Apr 2022 07:51:03 +0000 (GMT)
Message-ID: <f76454e3-843d-93b4-e30c-bf374d41802b@linux.ibm.com>
Date: Thu, 21 Apr 2022 09:51:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] misc: ocxl: fix possible double free in
 ocxl_file_register_afu
Content-Language: en-US
To: Michael Ellerman <mpe@ellerman.id.au>, Hangyu Hua <hbh25y@gmail.com>,
 ajd@linux.ibm.com, arnd@arndb.de, gregkh@linuxfoundation.org,
 alastair@d-silva.org
References: <20220418085758.38145-1-hbh25y@gmail.com>
 <87czhbfjsj.fsf@mpe.ellerman.id.au>
From: Frederic Barrat <fbarrat@linux.ibm.com>
In-Reply-To: <87czhbfjsj.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: dMdAqTLeMZ7cMz8_CW_Kn8hSQVVy7d0m
X-Proofpoint-ORIG-GUID: jyGlfNOo7lS97HVn6SjRIWMcW8LCpPMc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-20_06,2022-04-20_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 bulkscore=0
 impostorscore=0 suspectscore=0 mlxscore=0 spamscore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204210042
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 21/04/2022 00:54, Michael Ellerman wrote:
> Hangyu Hua <hbh25y@gmail.com> writes:
>> info_release() will be called in device_unregister() when info->dev's
>> reference count is 0. So there is no need to call ocxl_afu_put() and
>> kfree() again.
> 
> Double frees are often exploitable. But it looks to me like this error
> path is not easily reachable by an attacker.
> 
> ocxl_file_register_afu() is only called from ocxl_probe(), and we only
> go to err_unregister if the sysfs or cdev initialisation fails, which
> should only happen if we hit ENOMEM, or we have a duplicate device which
> would be a device-tree/hardware error. But maybe Fred can check more
> closely, I don't know the driver that well.


The linux devices built here are based on what is parsed on the physical 
devices. Those could be FPGAs but updating the FPGA image requires root 
privilege. In any case, duplicate AFU names are possible, that's why the 
driver adds an index (the afu->config.idx part of the name) to the linux 
device name. So we would need to mess that up in the driver as well to 
have a duplicate device name.
So I would agree the double free is hard to hit.

mpe: I think this patch can be taken as is. The "beautification" I 
talked about is just that and I don't intend to work on it except if 
something else shows up.

   Fred



> cheers
> 
> 
>> Fix this by adding free_minor() and return to err_unregister error path.
>>
>> Fixes: 75ca758adbaf ("ocxl: Create a clear delineation between ocxl backend & frontend")
>> Signed-off-by: Hangyu Hua <hbh25y@gmail.com>
>> ---
>>   drivers/misc/ocxl/file.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/misc/ocxl/file.c b/drivers/misc/ocxl/file.c
>> index d881f5e40ad9..6777c419a8da 100644
>> --- a/drivers/misc/ocxl/file.c
>> +++ b/drivers/misc/ocxl/file.c
>> @@ -556,7 +556,9 @@ int ocxl_file_register_afu(struct ocxl_afu *afu)
>>   
>>   err_unregister:
>>   	ocxl_sysfs_unregister_afu(info); // safe to call even if register failed
>> +	free_minor(info);
>>   	device_unregister(&info->dev);
>> +	return rc;
>>   err_put:
>>   	ocxl_afu_put(afu);
>>   	free_minor(info);
>> -- 
>> 2.25.1
