Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D532700C8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Sep 2020 17:19:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BtHZC0Lk6zDqsG
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Sep 2020 01:19:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=fbarrat@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Gfdz5JkV; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BtHQK5rc7zDqlS
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Sep 2020 01:12:57 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08IF3t25138350; Fri, 18 Sep 2020 11:12:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=MYiRSfl6oFSnoLa2L2NyGczjGrdVdkqfSRM2ldv5OQk=;
 b=Gfdz5JkV1UqBeCPPEHG4J+xS8c9+eJ6HwDTHm8Fzd3tTeRk9wT4ll4n/YNGI+WMTQlMl
 66Xg87Jd7Y3IQEWTlyeFIVAp2qAL+tjoqBjTDaTei44o1EnwBl6iacwnkulFVCwc8qY2
 pWZ2YBSmNtU2qK6CSV2/2Pkf1ZZmN6nBKS6EeOR7d+DG4pz6MSmv1nvY6fhLMFXo7aGi
 MLhrkg2cZWLDcHQScw3HiWv40+PhII2kThMpl8CfgW3BA6b6B0BoS/aoWZBCCnkRfGRH
 1nL5hrko6Y47xSfwNXQ3ShRpXlSvAtsEcQt26ryIzH9cm2TtU0e0Afzl+CEvjptxiDuS Ug== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33mx5gt1dd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Sep 2020 11:12:35 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 08IF3uTo138356;
 Fri, 18 Sep 2020 11:12:32 -0400
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33mx5gt1b5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Sep 2020 11:12:32 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 08IF36sL030335;
 Fri, 18 Sep 2020 15:12:28 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma01fra.de.ibm.com with ESMTP id 33k5v99qaw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Sep 2020 15:12:28 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 08IFCQs024379668
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Sep 2020 15:12:26 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7CA584C058;
 Fri, 18 Sep 2020 15:12:26 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3FA7C4C052;
 Fri, 18 Sep 2020 15:12:26 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.145.34.234])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 18 Sep 2020 15:12:26 +0000 (GMT)
Subject: Re: [PATCH] ocxl: fix kconfig dependency warning for OCXL
To: Necip Fazil Yildiran <fazilyildiran@gmail.com>
References: <20200918094148.20525-1-fazilyildiran@gmail.com>
From: Frederic Barrat <fbarrat@linux.ibm.com>
Message-ID: <e1142ed3-c769-f906-3780-8b68c783b565@linux.ibm.com>
Date: Fri, 18 Sep 2020 17:12:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200918094148.20525-1-fazilyildiran@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-18_14:2020-09-16,
 2020-09-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0 malwarescore=0
 mlxlogscore=999 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009180124
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
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 jeho@cs.utexas.edu, paul@pgazz.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 18/09/2020 à 11:41, Necip Fazil Yildiran a écrit :
> When OCXL is enabled and HOTPLUG_PCI is disabled, it results in the
> following Kbuild warning:
> 
> WARNING: unmet direct dependencies detected for HOTPLUG_PCI_POWERNV
>    Depends on [n]: PCI [=y] && HOTPLUG_PCI [=n] && PPC_POWERNV [=y] && EEH [=y]
>    Selected by [y]:
>    - OCXL [=y] && PPC_POWERNV [=y] && PCI [=y] && EEH [=y]
> 
> The reason is that OCXL selects HOTPLUG_PCI_POWERNV without depending on
> or selecting HOTPLUG_PCI while HOTPLUG_PCI_POWERNV is subordinate to
> HOTPLUG_PCI.
> 
> HOTPLUG_PCI_POWERNV is a visible symbol with a set of dependencies.
> Selecting it will lead to overlooking its other dependencies as well.
> 
> Let OCXL depend on HOTPLUG_PCI_POWERNV instead to avoid Kbuild issues.
> 
> Fixes: 49ce94b8677c ("ocxl: Add PCI hotplug dependency to Kconfig")
> Signed-off-by: Necip Fazil Yildiran <fazilyildiran@gmail.com>
> ---

OK, that makes sense, thanks!
Acked-by: Frederic Barrat <fbarrat@linux.ibm.com>



>   drivers/misc/ocxl/Kconfig | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/misc/ocxl/Kconfig b/drivers/misc/ocxl/Kconfig
> index 6551007a066c..947294f6d7f4 100644
> --- a/drivers/misc/ocxl/Kconfig
> +++ b/drivers/misc/ocxl/Kconfig
> @@ -9,9 +9,8 @@ config OCXL_BASE
>   
>   config OCXL
>   	tristate "OpenCAPI coherent accelerator support"
> -	depends on PPC_POWERNV && PCI && EEH
> +	depends on PPC_POWERNV && PCI && EEH && HOTPLUG_PCI_POWERNV
>   	select OCXL_BASE
> -	select HOTPLUG_PCI_POWERNV
>   	default m
>   	help
>   	  Select this option to enable the ocxl driver for Open
> 
