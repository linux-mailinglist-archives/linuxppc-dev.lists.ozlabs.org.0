Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6B5325948
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Feb 2021 23:12:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dmn920s4Gz3dC4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Feb 2021 09:12:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tKongqvs;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=tyreld@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=tKongqvs; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dmn8Z3YnBz30N4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Feb 2021 09:12:29 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11PM5ZYF165647; Thu, 25 Feb 2021 17:12:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=ENtB9L0T9Uc1EJuHaVh6I7LbKCVplGQT/CvgVhH5kBA=;
 b=tKongqvsPbOpI1jBCssAE+YJKloh+G9L3BHfkHeSbRgn45XcVyEdsopP+88deAnDKVyV
 J61vOUq/fsdjBJD7WugtCAT94lG/25kUrWAa08OjUNLsqSqQHb86pCBOFkCOQkNV4rzy
 Q4LPc8QAmDJTz6psMJwB6eqRGVFOEWNqZ6rVrIWx2g5RGRuZDzIDNL8mbVA/QGFMnPIe
 MDYfRCC/WGtXDtgDUgxkB/JHQ8xWgQQ0UsmDvEoOYJcJtVqydb/45887IvLSs1rLqQUv
 6czTPAB/Mhd6cz/GTWjyzkXR7iOeYGZ0nTR+eVf5EQUSm940lkq2/BnBsd+5l+WdoMvf 0A== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36xhw0veh6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Feb 2021 17:12:25 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 11PM6wOM031530;
 Thu, 25 Feb 2021 22:12:25 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma02dal.us.ibm.com with ESMTP id 36tt2amghm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Feb 2021 22:12:25 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 11PMCND626608076
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 25 Feb 2021 22:12:23 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BC5BBBE059;
 Thu, 25 Feb 2021 22:12:23 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 87AD8BE054;
 Thu, 25 Feb 2021 22:12:22 +0000 (GMT)
Received: from oc6857751186.ibm.com (unknown [9.160.44.137])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 25 Feb 2021 22:12:22 +0000 (GMT)
Subject: Re: [PATCH v3 5/5] ibmvfc: reinitialize sub-CRQs and perform channel
 enquiry after LPM
To: james.bottomley@hansenpartnership.com
References: <20210225214237.22400-1-tyreld@linux.ibm.com>
 <20210225214237.22400-6-tyreld@linux.ibm.com>
From: Tyrel Datwyler <tyreld@linux.ibm.com>
Message-ID: <0698062b-35b4-6cbe-aee3-a825026fb20f@linux.ibm.com>
Date: Thu, 25 Feb 2021 14:12:21 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210225214237.22400-6-tyreld@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-25_14:2021-02-24,
 2021-02-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999
 malwarescore=0 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 phishscore=0 mlxscore=0 priorityscore=1501 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102250165
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
Cc: brking@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
 linux-scsi@vger.kernel.org, martin.petersen@oracle.com,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2/25/21 1:42 PM, Tyrel Datwyler wrote:
> A live partition migration (LPM) results in a CRQ disconnect similar to
> a hard reset. In this LPM case the hypervisor moslty perserves the CRQ
> transport such that it simply needs to be reenabled. However, the
> capabilities may have changed such as fewer channels, or no channels at
> all. Further, its possible that there may be sub-CRQ support, but no
> channel support. The CRQ reenable path currently doesn't take any of
> this into consideration.
> 
> For simpilicty release and reinitialize sub-CRQs during reenable, and
> set do_enquiry and using_channels with the appropriate values to trigger
> channel renegotiation.
> 
> Signed-off-by: Tyrel Datwyler <tyreld@linux.ibm.com>
> ---
>  drivers/scsi/ibmvscsi/ibmvfc.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/scsi/ibmvscsi/ibmvfc.c b/drivers/scsi/ibmvscsi/ibmvfc.c
> index 1bb08e5f3674..6bbc2697ad5a 100644
> --- a/drivers/scsi/ibmvscsi/ibmvfc.c
> +++ b/drivers/scsi/ibmvscsi/ibmvfc.c
> @@ -903,6 +903,9 @@ static int ibmvfc_reenable_crq_queue(struct ibmvfc_host *vhost)
>  {
>  	int rc = 0;
>  	struct vio_dev *vdev = to_vio_dev(vhost->dev);
> +	unsigned long flags;
> +
> +	ibmvfc_release_sub_crqs(vhost);
>  
>  	/* Re-enable the CRQ */
>  	do {
> @@ -914,6 +917,15 @@ static int ibmvfc_reenable_crq_queue(struct ibmvfc_host *vhost)
>  	if (rc)
>  		dev_err(vhost->dev, "Error enabling adapter (rc=%d)\n", rc);
>  
> +	ibmvfc_init_sub_crqs(vhost);

Realized that if this fails it set the do_enquiry flag to zero which the locked
region below will then flip back to one. Need to move sub-crq init to after
locked region.

-T

> +
> +	spin_lock_irqsave(vhost->host->host_lock, flags);
> +	spin_lock(vhost->crq.q_lock);
> +	vhost->do_enquiry = 1;
> +	vhost->using_channels = 0;
> +	spin_unlock(vhost->crq.q_lock);
> +	spin_unlock_irqrestore(vhost->host->host_lock, flags);
> +
>  	return rc;
>  }
>  
> 

