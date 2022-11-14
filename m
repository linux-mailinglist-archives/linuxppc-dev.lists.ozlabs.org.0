Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1794A627C2B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Nov 2022 12:24:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N9n5c6x1fz3cFc
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Nov 2022 22:24:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=A5nrjTLm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=fbarrat@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=A5nrjTLm;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N9n4d668pz2yYj
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Nov 2022 22:23:45 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.5) with ESMTP id 2AEBDcYV006855;
	Mon, 14 Nov 2022 11:23:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=OlDe249rwE0tMfWnjy228S4IM6AeU8AGEvujflVRqoU=;
 b=A5nrjTLmVxyM9eCEpOB3OQqC0+Bg0pMf603nxjzEbvRU0k1Gty/1Z3hmsfkYgSW2WMxd
 IGqWz+AeJIvU3YQMLpAA+J3oOUXwpdJjbbVOhTy03jZCnmMwqLVOPlvsUX33ZzGO/yIb
 6JgBdBEsFqsOWMWb8TbvyXrnChERl1T4H8Rrmoe+BQKuIdCTLGKnonON04Az0vghe6rM
 KCTcSq2IA5U81DnonQweHeTYasSew7SGhTI+nEk3rsqch/swVd/NEziibLGu3GbcIKaJ
 zIZr/gp5lFI5Hz4buuZ8Zob7bSQJNr0jFfA5MfbGWm3HVRnILCrd3tOFMMucVG7zkcrO lQ== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kumm7r6yk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Nov 2022 11:23:34 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AEBKLBh021092;
	Mon, 14 Nov 2022 11:23:32 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
	by ppma06ams.nl.ibm.com with ESMTP id 3kt2rjag4s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Nov 2022 11:23:32 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
	by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2AEBNU1x39912094
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 14 Nov 2022 11:23:30 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 12E5CA4054;
	Mon, 14 Nov 2022 11:23:30 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B73FCA405B;
	Mon, 14 Nov 2022 11:23:29 +0000 (GMT)
Received: from [9.171.73.31] (unknown [9.171.73.31])
	by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon, 14 Nov 2022 11:23:29 +0000 (GMT)
Message-ID: <78108ace-2bd5-5745-36e5-98f7294ae3f2@linux.ibm.com>
Date: Mon, 14 Nov 2022 12:23:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH] misc: ocxl: fix possible name leak in
 ocxl_file_register_afu()
To: Yang Yingliang <yangyingliang@huawei.com>, linuxppc-dev@lists.ozlabs.org
References: <20221111145929.2429271-1-yangyingliang@huawei.com>
Content-Language: en-US
From: Frederic Barrat <fbarrat@linux.ibm.com>
In-Reply-To: <20221111145929.2429271-1-yangyingliang@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: gasm-S7mWnoql_F8R0aI3B0sby9mPZfx
X-Proofpoint-GUID: gasm-S7mWnoql_F8R0aI3B0sby9mPZfx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-14_09,2022-11-11_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 bulkscore=0 adultscore=0 mlxscore=0 clxscore=1011 impostorscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211140080
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



On 11/11/2022 15:59, Yang Yingliang wrote:
> If device_register() returns error in ocxl_file_register_afu(),
> the name allocated by dev_set_name() need be freed. As comment
> of device_register() says, it should use put_device() to give
> up the reference in the error path. So fix this by calling
> put_device(), then the name can be freed in kobject_cleanup(),
> and info is freed in info_release().
> 
> Fixes: 75ca758adbaf ("ocxl: Create a clear delineation between ocxl backend & frontend")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>   drivers/misc/ocxl/file.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/misc/ocxl/file.c b/drivers/misc/ocxl/file.c
> index d46dba2df5a1..452d5777a0e4 100644
> --- a/drivers/misc/ocxl/file.c
> +++ b/drivers/misc/ocxl/file.c
> @@ -541,8 +541,11 @@ int ocxl_file_register_afu(struct ocxl_afu *afu)
>   		goto err_put;
>   
>   	rc = device_register(&info->dev);
> -	if (rc)
> -		goto err_put;
> +	if (rc) {
> +		free_minor(info);
> +		put_device(&info->dev);
> +		return rc;
> +	}


While I agree that a put_device() is needed on that error path, the fix 
above is not correct as it forgets to release the afu reference and the 
memory allocated in info. That was taken care of by the jump to the 
err_put label, so it should be kept. Something like:

-	if (rc)
+	if (rc) {
+		put_device((&info->dev);
  		goto err_put;
+	}


   Fred

