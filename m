Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 559E232D9A1
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Mar 2021 19:49:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ds0KJ2VmQz3d6x
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Mar 2021 05:49:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=odAqV6or;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=tyreld@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=odAqV6or; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ds0Jr6Vwjz3cKY
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Mar 2021 05:49:15 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 124IYT4b165664; Thu, 4 Mar 2021 13:49:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=NQ12GuvXHspGybmK53e54xawvK/ZlV9uYf88vxw3ECM=;
 b=odAqV6or4D/XdgCrvQUjHalBUcDTF5nSWvzxVozT8X1MDwUzCBKCO6ViQQ93a0nMT1m8
 XV3m8abckFQpvCYUqf3o3GtNjz4ZQ0P61pIyIabuQgjkzF1rAZgoS4A95u/a75taixHu
 T7ZcMZpWel17o55s5b3HAyr+5/QXkR2dXeXX34yC/rw8pIpPzXARd+OrSqd0A+7xT062
 Q+iKc862/loSOLXam4gLacTsJf5+2Ia5J7WSg6Iy6tGslMqUCMpndt0MO43QePinmGZ2
 ys7gcoYTF3p08ZObYs9JuJLNjQJOVno4x6Uv/05Xk9i9duGSeGoVMr7L6bhsrHiuUh8Z cA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3734nss34u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Mar 2021 13:49:02 -0500
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 124IYdmT166313;
 Thu, 4 Mar 2021 13:49:02 -0500
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3734nss33v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Mar 2021 13:49:02 -0500
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 124IWGrU005854;
 Thu, 4 Mar 2021 18:49:01 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma03dal.us.ibm.com with ESMTP id 3720r0s3ty-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Mar 2021 18:49:01 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 124Imxle30277932
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 4 Mar 2021 18:49:00 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E2BC0BE051;
 Thu,  4 Mar 2021 18:48:59 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1D03CBE054;
 Thu,  4 Mar 2021 18:48:58 +0000 (GMT)
Received: from oc6857751186.ibm.com (unknown [9.160.44.137])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu,  4 Mar 2021 18:48:57 +0000 (GMT)
Subject: Re: [PATCH] scsi: ibmvfc: Switch to using the new API kobj_to_dev()
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
References: <1614850124-54111-1-git-send-email-jiapeng.chong@linux.alibaba.com>
From: Tyrel Datwyler <tyreld@linux.ibm.com>
Message-ID: <87514c42-eb5a-ee68-ff21-49d08bd42a4e@linux.ibm.com>
Date: Thu, 4 Mar 2021 10:48:56 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <1614850124-54111-1-git-send-email-jiapeng.chong@linux.alibaba.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-04_05:2021-03-03,
 2021-03-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0 clxscore=1011
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103040088
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
Cc: martin.petersen@oracle.com, linux-scsi@vger.kernel.org, jejb@linux.ibm.com,
 linux-kernel@vger.kernel.org, paulus@samba.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 3/4/21 1:28 AM, Jiapeng Chong wrote:
> Fix the following coccicheck warnings:
> 
> ./drivers/scsi/ibmvscsi/ibmvfc.c:3483:60-61: WARNING opportunity for
> kobj_to_dev().
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>

Acked-by: Tyrel Datwyler <tyreld@linux.ibm.com>

> ---
>  drivers/scsi/ibmvscsi/ibmvfc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/scsi/ibmvscsi/ibmvfc.c b/drivers/scsi/ibmvscsi/ibmvfc.c
> index 755313b..e5f1ca7 100644
> --- a/drivers/scsi/ibmvscsi/ibmvfc.c
> +++ b/drivers/scsi/ibmvscsi/ibmvfc.c
> @@ -3480,7 +3480,7 @@ static ssize_t ibmvfc_read_trace(struct file *filp, struct kobject *kobj,
>  				 struct bin_attribute *bin_attr,
>  				 char *buf, loff_t off, size_t count)
>  {
> -	struct device *dev = container_of(kobj, struct device, kobj);
> +	struct device *dev = kobj_to_dev(kobj);
>  	struct Scsi_Host *shost = class_to_shost(dev);
>  	struct ibmvfc_host *vhost = shost_priv(shost);
>  	unsigned long flags = 0;
> 

