Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2FF67442C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Jan 2023 22:19:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nyb9h4S5xz3fHf
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Jan 2023 08:19:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PXyL1e0H;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=gjoyce@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PXyL1e0H;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nyb8l0r7Gz3c6q
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Jan 2023 08:18:46 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30JJBrw9028405;
	Thu, 19 Jan 2023 21:18:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : reply-to : to : cc : date : in-reply-to : references : content-type
 : mime-version : content-transfer-encoding; s=pp1;
 bh=fOmHjl45i/BOeBlFY+5ny3aN3s26Qml7s+k+CJ5/H8k=;
 b=PXyL1e0HKxKgQ6CCPRCuJVVrKNQSA2AHnZNCkZ4tz/83b8N4eFouwZb+tT5JLv8uQVHK
 KDhZzkLJy91eNPZQFZFKCsc56vdl01y7IOHqei2f1HSNx4ZZB0sPp+Xqdn+Ydh0Q4BM8
 q6wXfe09qzKvKBgWl+cjMfHHfxFuq7Ao6y7KsenfWlv4lFAq9gZFExfBKyba9YGeUN22
 MIfyI4YYtyTPdhy/GDMe3LfieOfpRji6r8yCGZxmLMT4PjD19gOLC+xaNEOb32V7DOL7
 55spVAkHNp0LHohaayNSfWXUa80ImaVHixMaTXi941MzbYPw4+9RKfycuETqLOOtn6jw Ag== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com [169.55.91.170])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3n7btajthp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Jan 2023 21:18:38 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
	by ppma02wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30JIfEq0027310;
	Thu, 19 Jan 2023 21:18:37 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([9.208.130.102])
	by ppma02wdc.us.ibm.com (PPS) with ESMTPS id 3n3m186hek-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Jan 2023 21:18:37 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 30JLIamb10748592
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Jan 2023 21:18:36 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3FF0358057;
	Thu, 19 Jan 2023 21:18:36 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 15C725805D;
	Thu, 19 Jan 2023 21:18:34 +0000 (GMT)
Received: from rhel-laptop.ibm.com (unknown [9.160.28.21])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 19 Jan 2023 21:18:33 +0000 (GMT)
Message-ID: <a991c60c5c10a37cc0385663705e8b39d8e23c09.camel@linux.vnet.ibm.com>
Subject: Re: [PATCH v3 05/24] powerpc/secvar: Handle max object size in the
 consumer
From: Greg Joyce <gjoyce@linux.vnet.ibm.com>
To: Andrew Donnellan <ajd@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
        linux-integrity@vger.kernel.org
Date: Thu, 19 Jan 2023 15:18:33 -0600
In-Reply-To: <20230118061049.1006141-6-ajd@linux.ibm.com>
References: <20230118061049.1006141-1-ajd@linux.ibm.com>
	 <20230118061049.1006141-6-ajd@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-18.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: V-10U9LXaj_bHAbA5CbFq6q2JBh89Jt7
X-Proofpoint-ORIG-GUID: V-10U9LXaj_bHAbA5CbFq6q2JBh89Jt7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-19_14,2023-01-19_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 bulkscore=0 mlxscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 clxscore=1011
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301190176
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
Reply-To: gjoyce@linux.vnet.ibm.com
Cc: sudhakar@linux.ibm.com, bgray@linux.ibm.com, erichte@linux.ibm.com, gregkh@linuxfoundation.org, nayna@linux.ibm.com, linux-kernel@vger.kernel.org, zohar@linux.ibm.com, gjoyce@linux.ibm.com, ruscur@russell.cc, gcwilson@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2023-01-18 at 17:10 +1100, Andrew Donnellan wrote:
> From: Russell Currey <ruscur@russell.cc>
> 
> Currently the max object size is handled in the core secvar code with
> an
> entirely OPAL-specific implementation, so create a new max_size() op
> and
> move the existing implementation into the powernv platform.  Should
> be
> no functional change.
> 
> Signed-off-by: Russell Currey <ruscur@russell.cc>
> Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
> 
> ---
> 
> v3: Change uint64_t type to u64 (mpe)
> ---
>  arch/powerpc/include/asm/secvar.h            |  1 +
>  arch/powerpc/kernel/secvar-sysfs.c           | 17 +++--------------
>  arch/powerpc/platforms/powernv/opal-secvar.c | 19
> +++++++++++++++++++
>  3 files changed, 23 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/secvar.h
> b/arch/powerpc/include/asm/secvar.h
> index 8b6475589120..b2cb9bb7c540 100644
> --- a/arch/powerpc/include/asm/secvar.h
> +++ b/arch/powerpc/include/asm/secvar.h
> @@ -20,6 +20,7 @@ struct secvar_operations {
>  	int (*get_next)(const char *key, u64 *key_len, u64 keybufsize);
>  	int (*set)(const char *key, u64 key_len, u8 *data, u64
> data_size);
>  	ssize_t (*format)(char *buf);
> +	int (*max_size)(u64 *max_size);
>  };
>  
>  #ifdef CONFIG_PPC_SECURE_BOOT
> diff --git a/arch/powerpc/kernel/secvar-sysfs.c
> b/arch/powerpc/kernel/secvar-sysfs.c
> index d3858eedd72c..031ef37bca99 100644
> --- a/arch/powerpc/kernel/secvar-sysfs.c
> +++ b/arch/powerpc/kernel/secvar-sysfs.c
> @@ -128,27 +128,16 @@ static struct kobj_type secvar_ktype = {
>  static int update_kobj_size(void)
>  {
>  
> -	struct device_node *node;
>  	u64 varsize;
> -	int rc = 0;
> +	int rc = secvar_ops->max_size(&varsize);
>  
> -	node = of_find_compatible_node(NULL, NULL, "ibm,secvar-
> backend");
> -	if (!of_device_is_available(node)) {
> -		rc = -ENODEV;
> -		goto out;
> -	}
> -
> -	rc = of_property_read_u64(node, "max-var-size", &varsize);
>  	if (rc)
> -		goto out;
> +		return rc;
>  
>  	data_attr.size = varsize;
>  	update_attr.size = varsize;
>  
> -out:
> -	of_node_put(node);
> -
> -	return rc;
> +	return 0;
>  }
>  
>  static int secvar_sysfs_load(void)
> diff --git a/arch/powerpc/platforms/powernv/opal-secvar.c
> b/arch/powerpc/platforms/powernv/opal-secvar.c
> index 623c6839e66c..c9b9fd3730df 100644
> --- a/arch/powerpc/platforms/powernv/opal-secvar.c
> +++ b/arch/powerpc/platforms/powernv/opal-secvar.c
> @@ -122,11 +122,30 @@ static ssize_t opal_secvar_format(char *buf)
>  	return rc;
>  }
>  
> +static int opal_secvar_max_size(u64 *max_size)
> +{
> +	int rc;
> +	struct device_node *node;
> +
> +	node = of_find_compatible_node(NULL, NULL, "ibm,secvar-
> backend");

I assume that node could be NULL and this code relies on
of_device_is_available() and of_node_put() checking for a NULL node
pointer? Would it be safer just to return -ENODEV if node is NULL?

> +	if (!of_device_is_available(node)) {
> +		rc = -ENODEV;
> +		goto out;
> +	}
> +
> +	rc = of_property_read_u64(node, "max-var-size", max_size);
> +
> +out:
> +	of_node_put(node);
> +	return rc;
> +}
> +
>  static const struct secvar_operations opal_secvar_ops = {
>  	.get = opal_get_variable,
>  	.get_next = opal_get_next_variable,
>  	.set = opal_set_variable,
>  	.format = opal_secvar_format,
> +	.max_size = opal_secvar_max_size,
>  };
>  
>  static int opal_secvar_probe(struct platform_device *pdev)

