Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B392683204
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Jan 2023 16:59:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P5qVn1QG9z3cMY
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Feb 2023 02:59:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CPLsSVUL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=stefanb@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CPLsSVUL;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P5qTs1X0jz3Wtr
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Feb 2023 02:58:40 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30VEf7iX005558;
	Tue, 31 Jan 2023 15:58:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=vMKvVrDcKvHi4ygBedjGhMHiu80tIjMuvsG1vFRtDNE=;
 b=CPLsSVUL0MzV91MU5H4iPGc7IU4UsmwnxPSDBWWiw695QI6isB3XvHRs0g8rJYZk9AJZ
 +oyGjs622gS/irwjGG+x+6w4NwDS3NHP3F2QDorZKZvXL3Fpjlo5WtBacXLb80rB2M6T
 lkHjgTyXejO2DHslCPfBhU5xwPe4J9yrq5hJT7jBvH+FlU7XTI643rEs02z6UK/XICG0
 4IKuCyQHNabxPC13prlLU2RVKEblHINqEuXOQ3HYQXu5jHH48Y5KjNluLxizTK8YiIWD
 bKnw5NGSpABFCKsKxioPlkSpd6ViF7IU4gkQEWgeoRYRN6dc+O4jE/5WTyWdxUAgf4rH 6g== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nf31ndee3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 31 Jan 2023 15:58:35 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30VDHTli020244;
	Tue, 31 Jan 2023 15:58:35 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.11])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nf31ndedq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 31 Jan 2023 15:58:35 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
	by ppma03dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30VDHe8X025436;
	Tue, 31 Jan 2023 15:58:34 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([9.208.129.114])
	by ppma03dal.us.ibm.com (PPS) with ESMTPS id 3ncvtrmyx2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 31 Jan 2023 15:58:34 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 30VFwVco17039934
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 31 Jan 2023 15:58:32 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CC50F5806A;
	Tue, 31 Jan 2023 15:58:31 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EF08158069;
	Tue, 31 Jan 2023 15:58:30 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 31 Jan 2023 15:58:30 +0000 (GMT)
Message-ID: <06cb4327-5e60-d472-57cc-3b2c568014f1@linux.ibm.com>
Date: Tue, 31 Jan 2023 10:58:30 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v5 13/25] powerpc/secvar: Don't print error on ENOENT when
 reading variables
Content-Language: en-US
To: Andrew Donnellan <ajd@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
        linux-integrity@vger.kernel.org
References: <20230131063928.388035-1-ajd@linux.ibm.com>
 <20230131063928.388035-14-ajd@linux.ibm.com>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <20230131063928.388035-14-ajd@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 5Pte0MhJzS1TBlWULkN0SPmtUwrFHnCJ
X-Proofpoint-GUID: 9bz0UTf004LdAleWIwBy3FOeV_6qDs3J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-31_08,2023-01-31_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 malwarescore=0 bulkscore=0 adultscore=0 mlxscore=0
 phishscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2301310137
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
Cc: sudhakar@linux.ibm.com, erichte@linux.ibm.com, gregkh@linuxfoundation.org, nayna@linux.ibm.com, npiggin@gmail.com, linux-kernel@vger.kernel.org, zohar@linux.ibm.com, gjoyce@linux.ibm.com, ruscur@russell.cc, joel@jms.id.au, bgray@linux.ibm.com, brking@linux.ibm.com, gcwilson@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 1/31/23 01:39, Andrew Donnellan wrote:
> If attempting to read the size or data attributes of a  non-existent
> variable (which will be possible after a later patch to expose the PLPKS
> via the secvar interface), don't spam the kernel log with error messages.
> Only print errors for return codes that aren't ENOENT.
> 
> Reported-by: Sudhakar Kuppusamy <sudhakar@linux.ibm.com>
> Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>

Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>

> 
> ---
> 
> v3: New patch
> ---
>   arch/powerpc/kernel/secvar-sysfs.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/secvar-sysfs.c b/arch/powerpc/kernel/secvar-sysfs.c
> index 9b6be63b7b36..ca3df3f7156c 100644
> --- a/arch/powerpc/kernel/secvar-sysfs.c
> +++ b/arch/powerpc/kernel/secvar-sysfs.c
> @@ -43,8 +43,8 @@ static ssize_t size_show(struct kobject *kobj, struct kobj_attribute *attr,
>   
>   	rc = secvar_ops->get(kobj->name, strlen(kobj->name) + 1, NULL, &dsize);
>   	if (rc) {
> -		pr_err("Error retrieving %s variable size %d\n", kobj->name,
> -		       rc);
> +		if (rc != -ENOENT)
> +			pr_err("Error retrieving %s variable size %d\n", kobj->name, rc);
>   		return rc;
>   	}
>   
> @@ -61,7 +61,8 @@ static ssize_t data_read(struct file *filep, struct kobject *kobj,
>   
>   	rc = secvar_ops->get(kobj->name, strlen(kobj->name) + 1, NULL, &dsize);
>   	if (rc) {
> -		pr_err("Error getting %s variable size %d\n", kobj->name, rc);
> +		if (rc != -ENOENT)
> +			pr_err("Error getting %s variable size %d\n", kobj->name, rc);
>   		return rc;
>   	}
>   	pr_debug("dsize is %llu\n", dsize);
