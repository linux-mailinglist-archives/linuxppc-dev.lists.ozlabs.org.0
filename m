Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A667D64CC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Oct 2023 10:20:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gGEd1imB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SFhhJ0KxRz3cRh
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Oct 2023 19:20:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gGEd1imB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=fbarrat@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SFhgP5cbYz2xQJ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Oct 2023 19:20:01 +1100 (AEDT)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39P8CFuP028224;
	Wed, 25 Oct 2023 08:19:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=8fyN1XSY3iCzycp1u1WIJ7TbJh+QRJ4JC+EH0GTwq6A=;
 b=gGEd1imBRlYBLjZWM4WWitsIvM7HE4nBnDRuC7pKeW4XsiLjLfrM+Q4pxokDwVlVc59s
 Lk1A348Mh9V+rWj8jrocKOnOLqQf3MoZBpvnb3/B8Ua43Mst8KheDWYj4QTGUMTsuF/H
 UlgLxpXXOkvc0NNl2XM1fVJV4/ED9wdL5uf54Y7C7YSbRN/ZE/f4OtOTGjDcHoEgkMpq
 jyfGXqR77NDQ38e6ddxhehWVfo1ZasA3T6g7MJnjGeFqgMpcl+90ZlJx7qcmpkmX6KtI
 +c9jjJFs/DRgVel5OEJOYQM9MLG7UtJkpbGaZQc4wlde2AZGbsTS0IHEwyAO1rCYqJac CQ== 
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3txya3r8d3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Oct 2023 08:19:55 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 39P5wqWk024403;
	Wed, 25 Oct 2023 08:19:55 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3tvu6k4wkj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Oct 2023 08:19:54 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 39P8JrmZ21430838
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Oct 2023 08:19:53 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 317C52004B;
	Wed, 25 Oct 2023 08:19:53 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C83B920040;
	Wed, 25 Oct 2023 08:19:52 +0000 (GMT)
Received: from [9.171.32.46] (unknown [9.171.32.46])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 25 Oct 2023 08:19:52 +0000 (GMT)
Message-ID: <9cdba213-d6cf-427e-abd3-a0e1e1b39299@linux.ibm.com>
Date: Wed, 25 Oct 2023 10:19:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ocxl: make ocxl_class constant
Content-Language: en-US
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linuxppc-dev@lists.ozlabs.org
References: <2023102403-squirt-defraud-6c0c@gregkh>
From: Frederic Barrat <fbarrat@linux.ibm.com>
In-Reply-To: <2023102403-squirt-defraud-6c0c@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: dNcJmMaG1T2GK9C19kaa-ksAv4XOWZdv
X-Proofpoint-ORIG-GUID: dNcJmMaG1T2GK9C19kaa-ksAv4XOWZdv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-25_01,2023-10-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2310170001 definitions=main-2310250070
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
Cc: linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Andrew Donnellan <ajd@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 24/10/2023 13:49, Greg Kroah-Hartman wrote:
> Now that the driver core allows for struct class to be in read-only
> memory, we should make all 'class' structures declared at build time
> placing them into read-only memory, instead of having to be dynamically
> allocated at runtime.
> 
> Cc: Frederic Barrat <fbarrat@linux.ibm.com>
> Cc: Andrew Donnellan <ajd@linux.ibm.com>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: linuxppc-dev@lists.ozlabs.org
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---

Thanks!

Acked-by: Frederic Barrat <fbarrat@linux.ibm.com>

   Fred


>   drivers/misc/ocxl/file.c | 27 +++++++++++++++------------
>   1 file changed, 15 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/misc/ocxl/file.c b/drivers/misc/ocxl/file.c
> index 6e63f060e4cc..ac69b7f361f5 100644
> --- a/drivers/misc/ocxl/file.c
> +++ b/drivers/misc/ocxl/file.c
> @@ -14,7 +14,6 @@
>   #define OCXL_NUM_MINORS 256 /* Total to reserve */
>   
>   static dev_t ocxl_dev;
> -static struct class *ocxl_class;
>   static DEFINE_MUTEX(minors_idr_lock);
>   static struct idr minors_idr;
>   
> @@ -509,6 +508,16 @@ static void ocxl_file_make_invisible(struct ocxl_file_info *info)
>   	cdev_del(&info->cdev);
>   }
>   
> +static char *ocxl_devnode(const struct device *dev, umode_t *mode)
> +{
> +	return kasprintf(GFP_KERNEL, "ocxl/%s", dev_name(dev));
> +}
> +
> +static const struct class ocxl_class = {
> +	.name =		"ocxl",
> +	.devnode =	ocxl_devnode,
> +};
> +
>   int ocxl_file_register_afu(struct ocxl_afu *afu)
>   {
>   	int minor;
> @@ -529,7 +538,7 @@ int ocxl_file_register_afu(struct ocxl_afu *afu)
>   
>   	info->dev.parent = &fn->dev;
>   	info->dev.devt = MKDEV(MAJOR(ocxl_dev), minor);
> -	info->dev.class = ocxl_class;
> +	info->dev.class = &ocxl_class;
>   	info->dev.release = info_release;
>   
>   	info->afu = afu;
> @@ -584,11 +593,6 @@ void ocxl_file_unregister_afu(struct ocxl_afu *afu)
>   	device_unregister(&info->dev);
>   }
>   
> -static char *ocxl_devnode(const struct device *dev, umode_t *mode)
> -{
> -	return kasprintf(GFP_KERNEL, "ocxl/%s", dev_name(dev));
> -}
> -
>   int ocxl_file_init(void)
>   {
>   	int rc;
> @@ -601,20 +605,19 @@ int ocxl_file_init(void)
>   		return rc;
>   	}
>   
> -	ocxl_class = class_create("ocxl");
> -	if (IS_ERR(ocxl_class)) {
> +	rc = class_register(&ocxl_class);
> +	if (rc) {
>   		pr_err("Unable to create ocxl class\n");
>   		unregister_chrdev_region(ocxl_dev, OCXL_NUM_MINORS);
> -		return PTR_ERR(ocxl_class);
> +		return rc;
>   	}
>   
> -	ocxl_class->devnode = ocxl_devnode;
>   	return 0;
>   }
>   
>   void ocxl_file_exit(void)
>   {
> -	class_destroy(ocxl_class);
> +	class_unregister(&ocxl_class);
>   	unregister_chrdev_region(ocxl_dev, OCXL_NUM_MINORS);
>   	idr_destroy(&minors_idr);
>   }
