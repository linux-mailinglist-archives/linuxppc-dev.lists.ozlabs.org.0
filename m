Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F93B2C381F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 05:31:59 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CgnzH4nnzzDqZL
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 15:31:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cgnxc72ZWzDqWh
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Nov 2020 15:30:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=iwOQFWnZ; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4Cgnxc5vdmz8wLG
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Nov 2020 15:30:28 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 4Cgnxc5PsSz9sT6; Wed, 25 Nov 2020 15:30:28 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=iwOQFWnZ; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4Cgnxc15B1z9sRK
 for <linuxppc-dev@ozlabs.org>; Wed, 25 Nov 2020 15:30:27 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AP43gcB030860; Tue, 24 Nov 2020 23:30:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=0O2rrve8LRgRF+5D5c1GnI0eTF8QsLA5RcmpOeuiT4Y=;
 b=iwOQFWnZ/pEeNYKjivfnNoO7zbNfn//peHktErftjKp/SAVT13fybs5Jb24JIGS02wOQ
 H/Zl89l3s4T1XQzzRXewNoMkj9fJSVpNsNn09ESnv7WCf8My6XQ4c+5PkB/jcepJa21Q
 IADk6+E83h8tCfU0rgKejh3WklUEK85bCqLnhPkJHzVCsgaEmXHU6V4Rf5cb8AtpGHDC
 +Iv7i9qTvofJtm+8sxcqwgHzAg/Q85g/XIhYjnuWQ3XMhYrDhuSwZut6urRKMU2+OYdw
 JjG8VhLvClF69aVzE7TrVNOVlZcoN26PTw+UWSQvKXzPZRSOeQX6JDu7earkqgMKfo4f KQ== 
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34ygtuktt4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Nov 2020 23:30:17 -0500
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AP4SEWS028426;
 Wed, 25 Nov 2020 04:30:15 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma05fra.de.ibm.com with ESMTP id 34y6k4sy0b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Nov 2020 04:30:15 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AP4UDu31770230
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 25 Nov 2020 04:30:13 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BE708A407E;
 Wed, 25 Nov 2020 04:30:09 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DF944A4040;
 Wed, 25 Nov 2020 04:30:08 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.126.150.29])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed, 25 Nov 2020 04:30:08 +0000 (GMT)
Date: Wed, 25 Nov 2020 10:00:08 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH 1/3] powerpc: Make NUMA depend on SMP
Message-ID: <20201125043008.GD528281@linux.vnet.ibm.com>
References: <20201124120547.1940635-1-mpe@ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20201124120547.1940635-1-mpe@ellerman.id.au>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-24_11:2020-11-24,
 2020-11-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1011
 mlxscore=0 impostorscore=0 malwarescore=0 mlxlogscore=999 suspectscore=1
 bulkscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011250021
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

* Michael Ellerman <mpe@ellerman.id.au> [2020-11-24 23:05:45]:

> Our Kconfig allows NUMA to be enabled without SMP, but none of
> our defconfigs use that combination. This means it can easily be
> broken inadvertently by code changes, which has happened recently.
> 
> Although it's theoretically possible to have a machine with a single
> CPU and multiple memory nodes, I can't think of any real systems where
> that's the case. Even so if such a system exists, it can just run an
> SMP kernel anyway.
> 
> So to avoid the need to add extra #ifdefs and/or build breaks, make
> NUMA depend on SMP.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

Looks good to me.

Reviewed-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
> ---
>  arch/powerpc/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index e9f13fe08492..a22db3db6b96 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -660,7 +660,7 @@ config IRQ_ALL_CPUS
> 
>  config NUMA
>  	bool "NUMA support"
> -	depends on PPC64
> +	depends on PPC64 && SMP
>  	default y if SMP && PPC_PSERIES
> 
>  config NODES_SHIFT
> -- 
> 2.25.1
> 

-- 
Thanks and Regards
Srikar Dronamraju
