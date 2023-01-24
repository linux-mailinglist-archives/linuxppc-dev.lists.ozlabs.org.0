Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 60272679D27
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Jan 2023 16:15:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P1Vsl2GCWz3cdg
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jan 2023 02:15:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qKLK+Rwi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=zohar@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qKLK+Rwi;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P1Vrl524Rz3bZl
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jan 2023 02:15:03 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30ODuoHa024626;
	Tue, 24 Jan 2023 15:14:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=SKlWUkhibLKyGL2pkbPla6v3326+q/H8/sBojv/+5ec=;
 b=qKLK+RwifLxJBHY/PTZ5oV2BqPVrQA4clt+I3W9/lEmw2bvdMvdHydJJvosbvkAz99yJ
 RWN31OK0NflVapyl75GBJxHeHfgl8xTSv/kphoGHSj7uw4kfXTLWn5tKHni623tno5uk
 EzjZ989yKX/kTBxgPadvNzY0cjC2OXzlvp+pIeUYge4vIxzH3yiCHaBNvVPd7fRqCnQX
 FO95hgDXUxkD+J0qKQmeF6BmdVsWqzKRbh21hxhzCiiBkQ5kAjcwWl02c+0wfNeZyPuM
 ewae316OMMll08OSs2k4Ex0pIMjmEJYSPwFuj+CQuoFxRqbzcDJFpWq4lGJmzUlmhXu/ 8Q== 
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com [169.47.144.27])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3nac958p65-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Jan 2023 15:14:56 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
	by ppma05wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30OCHP0L007908;
	Tue, 24 Jan 2023 15:14:55 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([9.208.129.116])
	by ppma05wdc.us.ibm.com (PPS) with ESMTPS id 3n87p6tsvc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Jan 2023 15:14:55 +0000
Received: from smtpav06.wdc07v.mail.ibm.com (smtpav06.wdc07v.mail.ibm.com [10.39.53.233])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 30OFEsHF64553392
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 24 Jan 2023 15:14:54 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 421DA58056;
	Tue, 24 Jan 2023 15:14:54 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B5A3F5803F;
	Tue, 24 Jan 2023 15:14:52 +0000 (GMT)
Received: from sig-9-65-196-40.ibm.com (unknown [9.65.196.40])
	by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 24 Jan 2023 15:14:52 +0000 (GMT)
Message-ID: <57dca1ea3ef66bc0935bdd1dab4536f1151f4004.camel@linux.ibm.com>
Subject: Re: [PATCH v4 24/24] integrity/powerpc: Support loading keys from
 pseries secvar
From: Mimi Zohar <zohar@linux.ibm.com>
To: Andrew Donnellan <ajd@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
        linux-integrity@vger.kernel.org
Date: Tue, 24 Jan 2023 10:14:52 -0500
In-Reply-To: <20230120074306.1326298-25-ajd@linux.ibm.com>
References: <20230120074306.1326298-1-ajd@linux.ibm.com>
	 <20230120074306.1326298-25-ajd@linux.ibm.com>
Content-Type: text/plain; charset="ISO-8859-15"
X-Mailer: Evolution 3.28.5 (3.28.5-18.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: iMPfIwpgug5KNB5appsq8SwGgbZCR_4G
X-Proofpoint-ORIG-GUID: iMPfIwpgug5KNB5appsq8SwGgbZCR_4G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-23_12,2023-01-24_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 suspectscore=0
 malwarescore=0 spamscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301240136
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
Cc: sudhakar@linux.ibm.com, bgray@linux.ibm.com, erichte@linux.ibm.com, gregkh@linuxfoundation.org, nayna@linux.ibm.com, linux-kernel@vger.kernel.org, gjoyce@linux.ibm.com, ruscur@russell.cc, joel@jms.id.au, gcwilson@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2023-01-20 at 18:43 +1100, Andrew Donnellan wrote:
> From: Russell Currey <ruscur@russell.cc>
> 
> The secvar object format is only in the device tree under powernv.
> We now have an API call to retrieve it in a generic way, so we should
> use that instead of having to handle the DT here.
> 
> Add support for pseries secvar, with the "ibm,plpks-sb-v1" format.
> The object format is expected to be the same, so there shouldn't be any
> functional differences between objects retrieved from powernv and
> pseries.
> 
> Signed-off-by: Russell Currey <ruscur@russell.cc>
> Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
> 
> ---
> 
> v3: New patch
> 
> v4: Pass format buffer size (stefanb, npiggin)
> ---
>  .../integrity/platform_certs/load_powerpc.c     | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/security/integrity/platform_certs/load_powerpc.c b/security/integrity/platform_certs/load_powerpc.c
> index dee51606d5f4..d4ce91bf3fec 100644
> --- a/security/integrity/platform_certs/load_powerpc.c
> +++ b/security/integrity/platform_certs/load_powerpc.c
> @@ -10,7 +10,6 @@
>  #include <linux/cred.h>
>  #include <linux/err.h>
>  #include <linux/slab.h>
> -#include <linux/of.h>
>  #include <asm/secure_boot.h>
>  #include <asm/secvar.h>
>  #include "keyring_handler.h"
> @@ -59,16 +58,22 @@ static int __init load_powerpc_certs(void)
>  	void *db = NULL, *dbx = NULL;
>  	u64 dbsize = 0, dbxsize = 0;
>  	int rc = 0;
> -	struct device_node *node;
> +	ssize_t len;
> +	char buf[32];
>  
>  	if (!secvar_ops)
>  		return -ENODEV;
>  
> -	/* The following only applies for the edk2-compat backend. */
> -	node = of_find_compatible_node(NULL, NULL, "ibm,edk2-compat-v1");
> -	if (!node)
> +	len = secvar_ops->format(buf, 32);

"powerpc/secvar: Handle format string in the consumer"  defines
opal_secvar_format() for the object format "ibm,secvar-backend".  Here
shouldn't it being returning the format for "ibm,edk2-compat-v1"?

Mimi

> +	if (len <= 0)
>  		return -ENODEV;
>  
> +	// Check for known secure boot implementations from OPAL or PLPKS
> +	if (strcmp("ibm,edk2-compat-v1", buf) && strcmp("ibm,plpks-sb-v1", buf)) {
> +		pr_err("Unsupported secvar implementation \"%s\", not loading certs\n", buf);
> +		return -ENODEV;
> +	}
> +
>  	/*
>  	 * Get db, and dbx. They might not exist, so it isn't an error if we
>  	 * can't get them.
> @@ -103,8 +108,6 @@ static int __init load_powerpc_certs(void)
>  		kfree(dbx);
>  	}
>  
> -	of_node_put(node);
> -
>  	return rc;
>  }
>  late_initcall(load_powerpc_certs);


