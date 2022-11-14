Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E462E627D4F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Nov 2022 13:05:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N9p155lZ5z3cht
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Nov 2022 23:05:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Whrs9E8e;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=fbarrat@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Whrs9E8e;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N9p0839Tlz2xb4
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Nov 2022 23:04:55 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.5) with ESMTP id 2AEBg0s7024709;
	Mon, 14 Nov 2022 12:04:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=tQiJCsxF1bRKamY8ouvab0/uk8yP8SggYM168ojWsP4=;
 b=Whrs9E8eJx1J9f+XJHDpaIctydb5k5W0ENAMiFfim2Ye5F7vC8KMCbI5guLsowYkWZm+
 8ouYqLUSei+RbhlfKLocdjYSTyaPglrqbjNz/CRMjODrI1TN+YWqi8v58gf/55TFZtx2
 skxvcxO+0hb4EbOtwNCBSGtL00BDn36sTy9YQmB4wT43Ja/NINNDXqpdR9yQRb7jlo3C
 y9/HHx8jpAJfKlsawzwJT9e0cQspmBtbJVWm2U5Xy9wEP/xfWR3Z36qurSl24fVuI/j1
 yDNO9RYXUceYbxiDk37+/tUzeFyOJ1MRBcM8I8P2q4mcvTISpDd3QWfb676LLWpvu8hh ag== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kun1a0hq5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Nov 2022 12:04:44 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AEBpwup000794;
	Mon, 14 Nov 2022 12:04:42 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
	by ppma04ams.nl.ibm.com with ESMTP id 3kt348tgxn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Nov 2022 12:04:42 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
	by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2AEBwi8j48693580
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 14 Nov 2022 11:58:44 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 10B10A405C;
	Mon, 14 Nov 2022 12:04:40 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B1688A4054;
	Mon, 14 Nov 2022 12:04:39 +0000 (GMT)
Received: from [9.171.73.31] (unknown [9.171.73.31])
	by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon, 14 Nov 2022 12:04:39 +0000 (GMT)
Message-ID: <05ff2668-2be8-6a83-c690-b15d2724e03c@linux.ibm.com>
Date: Mon, 14 Nov 2022 13:04:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH] misc: ocxl: fix possible name leak in
 ocxl_file_register_afu()
Content-Language: en-US
To: Yang Yingliang <yangyingliang@huawei.com>, linuxppc-dev@lists.ozlabs.org
References: <20221111145929.2429271-1-yangyingliang@huawei.com>
 <78108ace-2bd5-5745-36e5-98f7294ae3f2@linux.ibm.com>
 <1d06da75-e18c-8a0c-4900-f13adfa74a9f@huawei.com>
From: Frederic Barrat <fbarrat@linux.ibm.com>
In-Reply-To: <1d06da75-e18c-8a0c-4900-f13adfa74a9f@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: tiC5cjFKgpnyt1bsQQlkrhtEoVKcg224
X-Proofpoint-ORIG-GUID: tiC5cjFKgpnyt1bsQQlkrhtEoVKcg224
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-14_10,2022-11-11_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0 mlxlogscore=999
 malwarescore=0 lowpriorityscore=0 mlxscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211140087
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
Cc: gregkh@linuxfoundation.org, ajd@linux.ibm.com, arnd@arndb.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 14/11/2022 12:46, Yang Yingliang wrote:
> Hi,
> 
> On 2022/11/14 19:23, Frederic Barrat wrote:
>>
>>
>> On 11/11/2022 15:59, Yang Yingliang wrote:
>>> If device_register() returns error in ocxl_file_register_afu(),
>>> the name allocated by dev_set_name() need be freed. As comment
>>> of device_register() says, it should use put_device() to give
>>> up the reference in the error path. So fix this by calling
>>> put_device(), then the name can be freed in kobject_cleanup(),
>>> and info is freed in info_release().
>>>
>>> Fixes: 75ca758adbaf ("ocxl: Create a clear delineation between ocxl 
>>> backend & frontend")
>>> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
>>> ---
>>>   drivers/misc/ocxl/file.c | 7 +++++--
>>>   1 file changed, 5 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/misc/ocxl/file.c b/drivers/misc/ocxl/file.c
>>> index d46dba2df5a1..452d5777a0e4 100644
>>> --- a/drivers/misc/ocxl/file.c
>>> +++ b/drivers/misc/ocxl/file.c
>>> @@ -541,8 +541,11 @@ int ocxl_file_register_afu(struct ocxl_afu *afu)
>>>           goto err_put;
>>>         rc = device_register(&info->dev);
>>> -    if (rc)
>>> -        goto err_put;
>>> +    if (rc) {
>>> +        free_minor(info);
>>> +        put_device(&info->dev);
>>> +        return rc;
>>> +    }
>>
>>
>> While I agree that a put_device() is needed on that error path, the 
>> fix above is not correct as it forgets to release the afu reference 
>> and the memory allocated in info. That was taken care of by the jump 
>> to the err_put label, so it should be kept. Something like:
>>
>> -    if (rc)
>> +    if (rc) {
>> +        put_device((&info->dev);
>>          goto err_put;
>> +    }
> The 'info' and the reference is released in info_release().
> 
> Here is call chain:
> put_device()
>    kobject_release()
>      kobject_cleanup()
>        device_release()
>          info_release()
> 
> static void info_release(struct device *dev)
> {
>          struct ocxl_file_info *info = container_of(dev, struct 
> ocxl_file_info, dev);
> 
>          ocxl_afu_put(info->afu);
>          kfree(info);
> }
> So it don't need jump to the error label in this case.


You're right, I went too fast and the patch is correct.
So:
Acked-by: Frederic Barrat <fbarrat@linux.ibm.com>

   Fred


