Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F7E9506779
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Apr 2022 11:10:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KjJ1X1qTTz3bdN
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Apr 2022 19:10:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Gp2yIQ32;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=fbarrat@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Gp2yIQ32; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KjJ0p4qQhz2xC3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Apr 2022 19:10:01 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23J8UeR7014142; 
 Tue, 19 Apr 2022 09:09:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=C3L76yBVKtX0moocSyK7o95BiHWE2+V/apKeaccin9k=;
 b=Gp2yIQ32rKVdSvi5XtsFfmZmQgwlwzdbu7fbZpkC9IYyU/Dh2TBbUs8484v8bbGB+MlZ
 KIAdL/aBDagd7EOZl0UgFxeKHMYd0pphr0qm5JpuUAwzzIwc+X4CN1eWPlJutbL5ZNsQ
 zwCwBOgHTRDFglfOtPfzJtR4chm4yf+3zIOUwIqKMQ/DAISZSrN1PhbkI3FX7mocaDqq
 i/CPnm3lYs362yPTDa0YL6lmnBzeGrzyCFlfIwh0zZwv2gR/YYdiMluIQRnhZmNbdB/i
 lNqVhL68FnmBFx+qNBJ/yzmnGfI2eF5PE4fUCj1sY0fjOB+1EfoPPsFPX7O9aeF8Z01n Ug== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3fg75qaurq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Apr 2022 09:09:49 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 23J8mmKY023148;
 Tue, 19 Apr 2022 09:09:49 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3fg75qaur5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Apr 2022 09:09:48 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 23J92uG0006436;
 Tue, 19 Apr 2022 09:09:47 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma02fra.de.ibm.com with ESMTP id 3fgu6u1q4w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Apr 2022 09:09:47 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 23J8uxk554133134
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Apr 2022 08:56:59 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BB105AE053;
 Tue, 19 Apr 2022 09:09:44 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5AA65AE045;
 Tue, 19 Apr 2022 09:09:44 +0000 (GMT)
Received: from [9.145.173.247] (unknown [9.145.173.247])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 19 Apr 2022 09:09:44 +0000 (GMT)
Message-ID: <e18a4b58-4551-aa68-ed52-baeeeaab56bb@linux.ibm.com>
Date: Tue, 19 Apr 2022 11:09:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] misc: ocxl: fix possible double free in
 ocxl_file_register_afu
Content-Language: en-US
To: Hangyu Hua <hbh25y@gmail.com>, ajd@linux.ibm.com, arnd@arndb.de,
 gregkh@linuxfoundation.org, mpe@ellerman.id.au, alastair@d-silva.org
References: <20220418085758.38145-1-hbh25y@gmail.com>
From: Frederic Barrat <fbarrat@linux.ibm.com>
In-Reply-To: <20220418085758.38145-1-hbh25y@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: tqsESUJyAgQ5cgbTVcLJmO-gOrB5AY6G
X-Proofpoint-GUID: hK1cENiVVV_RTiAQqrd1Pjvhhqe0EkBp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-19_03,2022-04-15_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 phishscore=0
 mlxlogscore=999 spamscore=0 suspectscore=0 impostorscore=0 mlxscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204190051
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



On 18/04/2022 10:57, Hangyu Hua wrote:
> info_release() will be called in device_unregister() when info->dev's
> reference count is 0. So there is no need to call ocxl_afu_put() and
> kfree() again.
> 
> Fix this by adding free_minor() and return to err_unregister error path.
> 
> Fixes: 75ca758adbaf ("ocxl: Create a clear delineation between ocxl backend & frontend")
> Signed-off-by: Hangyu Hua <hbh25y@gmail.com>
> ---


Thanks for fixing that error path!
I'm now thinking it would be cleaner to have the call to free_minor() in 
the info_release() callback but that would be another patch.
In any case:
Acked-by: Frederic Barrat <fbarrat@linux.ibm.com>

   Fred


>   drivers/misc/ocxl/file.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/misc/ocxl/file.c b/drivers/misc/ocxl/file.c
> index d881f5e40ad9..6777c419a8da 100644
> --- a/drivers/misc/ocxl/file.c
> +++ b/drivers/misc/ocxl/file.c
> @@ -556,7 +556,9 @@ int ocxl_file_register_afu(struct ocxl_afu *afu)
>   
>   err_unregister:
>   	ocxl_sysfs_unregister_afu(info); // safe to call even if register failed
> +	free_minor(info);
>   	device_unregister(&info->dev);
> +	return rc;
>   err_put:
>   	ocxl_afu_put(afu);
>   	free_minor(info);
