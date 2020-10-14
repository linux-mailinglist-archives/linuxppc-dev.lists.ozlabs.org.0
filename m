Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DE99828DA5E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Oct 2020 09:16:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CB3d16tLQzDqZC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Oct 2020 18:16:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=mahesh@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=nabLuPxE; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CB3b50MT8zDqTC
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Oct 2020 18:15:12 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09E72rt5179730; Wed, 14 Oct 2020 03:14:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=ueJPysgPbJcMoEPaJmeRWSlqh1gk/6rZ0K7WlG/tuz0=;
 b=nabLuPxEDNen5WpyVBfoA8ZsGe68imxgLNSQzoXHPV+34BnpoUTXbBOs0uYbzIys5zlM
 mRcllTveHoTGeG290FhRLyNVdWn1Qdk8GgPv+dKKE3ublrkSMsJEJ8pStjFVkY2YrDJ9
 BXgww8ktjJ2JHArPszEJgZbFdl1D9mKn9eY9ve7W76T64Rmo9w/D5Zchs+XjnOV4xyRe
 9e3XUef+QWXcaZslOly3JHYPoc6wWOuKJ/vL3cCwX7+58GYDmzteNRTUJiYgUGuGi/1r
 NJZaP2Qtlemf9LhYbpCAEsaPu6pKjkkDLLveBes2TMfJifURI4Oqp++erAt13op4jAaN NA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 345uvc1r3s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Oct 2020 03:14:43 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 09E73iBe183167;
 Wed, 14 Oct 2020 03:14:42 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 345uvc1r2q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Oct 2020 03:14:42 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09E77EnZ013286;
 Wed, 14 Oct 2020 07:14:41 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06ams.nl.ibm.com with ESMTP id 34347guvhc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Oct 2020 07:14:40 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 09E7Ecb129819256
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 14 Oct 2020 07:14:39 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D63DC42042;
 Wed, 14 Oct 2020 07:14:38 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F0A9142041;
 Wed, 14 Oct 2020 07:14:37 +0000 (GMT)
Received: from in.ibm.com (unknown [9.85.68.106])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Wed, 14 Oct 2020 07:14:37 +0000 (GMT)
Date: Wed, 14 Oct 2020 12:44:35 +0530
From: Mahesh J Salgaonkar <mahesh@linux.ibm.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH] powerpc/opal_elog: Handle multiple writes to ack attribute
Message-ID: <20201014071435.dylsc72ucfsckhqe@in.ibm.com>
References: <20201014064813.109515-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201014064813.109515-1-aneesh.kumar@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-14_03:2020-10-14,
 2020-10-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=998 spamscore=0
 clxscore=1011 adultscore=0 mlxscore=0 suspectscore=1 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2010140048
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
Reply-To: mahesh@linux.ibm.com
Cc: Oliver O'Halloran <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2020-10-14 12:18:13 Wed, Aneesh Kumar K.V wrote:
> Even though we use self removing sysfs helper, we still need
> to make sure we do the final kobject delete conditionally.
> sysfs_remove_file_self() will handle parallel calls to remove
> the sysfs attribute file and returns true only in the caller
> that removed the attribute file. The other parallel callers
> are returned false. Do the final kobject delete checking
> the return value of sysfs_remove_file_self().
> 
> Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
> Cc: Oliver O'Halloran <oohall@gmail.com>
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  arch/powerpc/platforms/powernv/opal-elog.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/powernv/opal-elog.c b/arch/powerpc/platforms/powernv/opal-elog.c
> index 5e33b1fc67c2..37b380eef41a 100644
> --- a/arch/powerpc/platforms/powernv/opal-elog.c
> +++ b/arch/powerpc/platforms/powernv/opal-elog.c
> @@ -72,9 +72,14 @@ static ssize_t elog_ack_store(struct elog_obj *elog_obj,
>  			      const char *buf,
>  			      size_t count)
>  {
> -	opal_send_ack_elog(elog_obj->id);
> -	sysfs_remove_file_self(&elog_obj->kobj, &attr->attr);
> -	kobject_put(&elog_obj->kobj);
> +	/*
> +	 * Try to self remove this attribute. If we are successful,
> +	 * delete the kobject itself.
> +	 */
> +	if (sysfs_remove_file_self(&elog_obj->kobj, &attr->attr)) {
> +		opal_send_ack_elog(elog_obj->id);
> +		kobject_put(&elog_obj->kobj);
> +	}
>  	return count;
>  }

Looks good.

Reviewed-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>

Thanks,
-Mahesh.

