Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E1BD71EBFB1
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jun 2020 18:12:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49bxrg5prCzDqTF
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jun 2020 02:12:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=fbarrat@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49bxpq6c9PzDqVR
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Jun 2020 02:10:36 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 052G2MIw140225
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 2 Jun 2020 12:10:34 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31dr0hctm6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 02 Jun 2020 12:10:34 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 052G56qg023894
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 2 Jun 2020 16:10:32 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma04ams.nl.ibm.com with ESMTP id 31bf47xcay-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 02 Jun 2020 16:10:32 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 052GATuo57671724
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 2 Jun 2020 16:10:29 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4D02B11C052;
 Tue,  2 Jun 2020 16:10:29 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2C4FE11C04C;
 Tue,  2 Jun 2020 16:10:29 +0000 (GMT)
Received: from pic2.home (unknown [9.145.35.221])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  2 Jun 2020 16:10:29 +0000 (GMT)
Subject: Re: [PATCH v2] cxl: Remove dead Kconfig option
To: Andrew Donnellan <ajd@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <20200602070545.11942-1-ajd@linux.ibm.com>
From: Frederic Barrat <fbarrat@linux.ibm.com>
Message-ID: <f4b5895c-030b-5c56-aa1b-4ad0dbb20a35@linux.ibm.com>
Date: Tue, 2 Jun 2020 18:10:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200602070545.11942-1-ajd@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-02_13:2020-06-02,
 2020-06-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0
 bulkscore=0 adultscore=0 impostorscore=0 cotscore=-2147483648 phishscore=0
 mlxlogscore=984 spamscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 clxscore=1011 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006020111
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 02/06/2020 à 09:05, Andrew Donnellan a écrit :
> The CXL_AFU_DRIVER_OPS Kconfig option was added to coordinate merging of
> new features. It no longer serves any purpose, so remove it.
> 
> Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>


Acked-by: Frederic Barrat <fbarrat@linux.ibm.com>


> 
> ---
> v1->v2:
> - keep CXL_LIB for now to avoid breaking a driver that is currently out of
> tree
> ---
>   drivers/misc/cxl/Kconfig | 4 ----
>   1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/misc/cxl/Kconfig b/drivers/misc/cxl/Kconfig
> index 39eec9031487..984114f7cee9 100644
> --- a/drivers/misc/cxl/Kconfig
> +++ b/drivers/misc/cxl/Kconfig
> @@ -7,9 +7,6 @@ config CXL_BASE
>   	bool
>   	select PPC_COPRO_BASE
>   
> -config CXL_AFU_DRIVER_OPS
> -	bool
> -
>   config CXL_LIB
>   	bool
>   
> @@ -17,7 +14,6 @@ config CXL
>   	tristate "Support for IBM Coherent Accelerators (CXL)"
>   	depends on PPC_POWERNV && PCI_MSI && EEH
>   	select CXL_BASE
> -	select CXL_AFU_DRIVER_OPS
>   	select CXL_LIB
>   	default m
>   	help
> 
