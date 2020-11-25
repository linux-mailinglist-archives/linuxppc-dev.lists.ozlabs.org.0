Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 363882C3822
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 05:33:46 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cgp1L6VgSzDqQ8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 15:33:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cgnxr0cGKzDqZW
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Nov 2020 15:30:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=jA60mgD+; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4Cgnxq64CTz8v8T
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Nov 2020 15:30:39 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 4Cgnxq4zn0z9sTL; Wed, 25 Nov 2020 15:30:39 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=jA60mgD+; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4Cgnxq0rF6z9sT6
 for <linuxppc-dev@ozlabs.org>; Wed, 25 Nov 2020 15:30:38 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AP42YK7186703; Tue, 24 Nov 2020 23:30:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=omi2U1D0oG2Gbt0dGU0hW0vMsJ8cxFaWGv/x1YGNXJo=;
 b=jA60mgD+0PjZHKsRCFu5gUfI/mv8Q8nbwr05F3Abb12QXTF3ZoSgASE0zIJeL4OCHD96
 ahWekQjlsnN1aM1bTliWvHo9nZBtbFtNap4wAkl+k43wjEns4E0HrQRxxc70wLgMu8OR
 dxel7AzqmGXOrUSIu7qwFnb7Kb20JzzPpP8t4T/ZpklTUe6cfA6kQPLsDVcCo0z08gMy
 JwoUudeS38t9Tn2dGqtC99WGP/ojaassK/yEstgl2zkJKg5Z/Ln5U6/GhmjThhLWjTIJ
 RiS+znFzjidkKVQy2suUEZbEHlyibUUv6MnGyL+Sj5b2QYjtAWM1z7Y3W6CIBXG72NOC rg== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34yghsu3er-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Nov 2020 23:30:30 -0500
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AP4SjNr020940;
 Wed, 25 Nov 2020 04:30:28 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06ams.nl.ibm.com with ESMTP id 34xt5hcab9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Nov 2020 04:30:28 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AP4UQqW6488662
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 25 Nov 2020 04:30:26 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 91CB442061;
 Wed, 25 Nov 2020 04:30:26 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AA7FC42077;
 Wed, 25 Nov 2020 04:30:25 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.126.150.29])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed, 25 Nov 2020 04:30:25 +0000 (GMT)
Date: Wed, 25 Nov 2020 10:00:25 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH 2/3] powerpc: Make NUMA default y for powernv
Message-ID: <20201125043025.GE528281@linux.vnet.ibm.com>
References: <20201124120547.1940635-1-mpe@ellerman.id.au>
 <20201124120547.1940635-2-mpe@ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20201124120547.1940635-2-mpe@ellerman.id.au>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-25_01:2020-11-24,
 2020-11-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=1
 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 phishscore=0 adultscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011250021
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
Reply-To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Cc: linuxppc-dev@ozlabs.org, rdunlap@infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Michael Ellerman <mpe@ellerman.id.au> [2020-11-24 23:05:46]:

> Our NUMA option is default y for pseries, but not powernv. The bulk of
> powernv systems are NUMA, so make NUMA default y for powernv also.
> 
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

Looks good to me.

Reviewed-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
> ---
>  arch/powerpc/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index a22db3db6b96..4d688b426353 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -661,7 +661,7 @@ config IRQ_ALL_CPUS
>  config NUMA
>  	bool "NUMA support"
>  	depends on PPC64 && SMP
> -	default y if SMP && PPC_PSERIES
> +	default y if PPC_PSERIES || PPC_POWERNV
> 
>  config NODES_SHIFT
>  	int
> -- 
> 2.25.1
> 

-- 
Thanks and Regards
Srikar Dronamraju
