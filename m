Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8F431CCFA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Feb 2021 16:33:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dg4kZ1PG2z30N4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Feb 2021 02:33:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=goCISUI7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=brking@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=goCISUI7; dkim-atps=neutral
X-Greylist: delayed 2081 seconds by postgrey-1.36 at boromir;
 Wed, 17 Feb 2021 02:33:19 AEDT
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dg4k74Vmxz30KL
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Feb 2021 02:33:18 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 11GEnctk014819; Tue, 16 Feb 2021 09:58:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=vCXzb5OpCKLaHDVmWut1qFi4BxjtzdfHygiEhaPanUU=;
 b=goCISUI7PndlL4FJ7okkCp5O1fn6oUQQueIOCD4PoY0mHq+yJ+QKn1X5J2Ge4r64/YIf
 f5X/vdbFZtgiam/MS6xq1CKdQZSyRsk6F7X+0CNXuyECD7yXHAUFEPymkkC1yYfm1wgF
 q519qcqEqjtuujHWBMQciVDKOiU52IxwtvIlAohS2Dp21XYN7rvyPbF7hsl1BBVmxo/D
 Hek1R2JNM8fQ46GlAnekwLLEa2OhQDO9x0mvO4YL4ieZ/0t8bh1DQz1YZ9apSSm92Wg0
 N58K30S+hgp4q4odfn4yAO43Pt3bDSNT5Vu0gJcbvHwGKHXqa4qgLq4y5ImP5kla/LLS rA== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 36rg570716-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Feb 2021 09:58:34 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 11GEqYTh018382;
 Tue, 16 Feb 2021 14:58:33 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma02dal.us.ibm.com with ESMTP id 36p6d9mr0s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Feb 2021 14:58:33 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 11GEwWxr33489364
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 16 Feb 2021 14:58:32 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A70A6112065;
 Tue, 16 Feb 2021 14:58:32 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C46AA112062;
 Tue, 16 Feb 2021 14:58:31 +0000 (GMT)
Received: from oc6034535106.ibm.com (unknown [9.163.23.155])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 16 Feb 2021 14:58:31 +0000 (GMT)
Subject: Re: [PATCH 4/4] ibmvfc: store return code of H_FREE_SUB_CRQ during
 cleanup
To: Tyrel Datwyler <tyreld@linux.ibm.com>,
 james.bottomley@hansenpartnership.com
References: <20210211185742.50143-1-tyreld@linux.ibm.com>
 <20210211185742.50143-5-tyreld@linux.ibm.com>
From: Brian King <brking@linux.vnet.ibm.com>
Message-ID: <94321ded-7970-258c-cee9-222f7b2b511f@linux.vnet.ibm.com>
Date: Tue, 16 Feb 2021 08:58:31 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210211185742.50143-5-tyreld@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-16_04:2021-02-16,
 2021-02-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 clxscore=1015 mlxlogscore=999
 impostorscore=0 bulkscore=0 phishscore=0 adultscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102160130
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

On 2/11/21 12:57 PM, Tyrel Datwyler wrote:
> diff --git a/drivers/scsi/ibmvscsi/ibmvfc.c b/drivers/scsi/ibmvscsi/ibmvfc.c
> index ba6fcf9cbc57..23b803ac4a13 100644
> --- a/drivers/scsi/ibmvscsi/ibmvfc.c
> +++ b/drivers/scsi/ibmvscsi/ibmvfc.c
> @@ -5670,7 +5670,7 @@ static int ibmvfc_register_scsi_channel(struct ibmvfc_host *vhost,
>  
>  irq_failed:
>  	do {
> -		plpar_hcall_norets(H_FREE_SUB_CRQ, vdev->unit_address, scrq->cookie);
> +		rc = plpar_hcall_norets(H_FREE_SUB_CRQ, vdev->unit_address, scrq->cookie);
>  	} while (rc == H_BUSY || H_IS_LONG_BUSY(rc));

Other places in the driver where we get a busy return code back we have an msleep(100).
Should we be doing that here as well?

Thanks,

Brian

-- 
Brian King
Power Linux I/O
IBM Linux Technology Center

