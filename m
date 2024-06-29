Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B6A91CAD4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Jun 2024 05:14:04 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZmpzOCSf;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W9y7s2Hztz3cZJ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Jun 2024 13:14:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZmpzOCSf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=quicinc.com (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=quic_jjohnson@quicinc.com; receiver=lists.ozlabs.org)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W9y756m6jz3by2
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Jun 2024 13:13:20 +1000 (AEST)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45T2YZMT023533;
	Sat, 29 Jun 2024 03:13:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ix0il4ImNJQdQ3dNFMTtMTfJaRAS0QC5gWkQkNe+RQs=; b=ZmpzOCSf/JWiLxpp
	hV4zeBqgpy5BbO/sTx62cg6h0i4E9SdMZ+kN4lzxWbTkxo55LKgfYPy9HC3rjGKR
	aICyzLsVd46AexDa4egmZePF1pakA0M8DEVM77shh3aFUk1/CObq9/HihW2C+zXT
	3SgtvHmmPg81bzGFqyWeQH5ze/O4OV/nnITp1y0L/QD4cvS/P2ZagXVMPtagovYI
	lOMkIYQFkiZCe6CaMWaGBROwsHX7Bn3DLPnA2gHp7lfcB2QV7Rp5+qkCrBlQ2lyj
	8mSmQxxzhhrGkZHER0aWtHxt/IcF9iXe3TvtxdeLKsiRPAMpAy43KdRBjaAGyDWl
	C5J20Q==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4029kh01ms-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 29 Jun 2024 03:13:05 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45T3D4IG030505
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 29 Jun 2024 03:13:04 GMT
Received: from [10.48.245.152] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 28 Jun
 2024 20:13:04 -0700
Message-ID: <2509b43d-630c-4295-8330-5976677bf8bc@quicinc.com>
Date: Fri, 28 Jun 2024 20:13:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc: add missing MODULE_DESCRIPTION() macros
Content-Language: en-US
To: Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin
	<npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        "Naveen
 N. Rao" <naveen.n.rao@linux.ibm.com>,
        Scott Wood <oss@buserror.net>, Arnd
 Bergmann <arnd@arndb.de>,
        Jeremy Kerr <jk@ozlabs.org>
References: <20240615-md-powerpc-arch-powerpc-v1-1-ba4956bea47a@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240615-md-powerpc-arch-powerpc-v1-1-ba4956bea47a@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Vo11WkmKHILM1qK1nnI8dAhwUF7-17-j
X-Proofpoint-ORIG-GUID: Vo11WkmKHILM1qK1nnI8dAhwUF7-17-j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-28_18,2024-06-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 priorityscore=1501 suspectscore=0 adultscore=0 mlxscore=0 clxscore=1011
 malwarescore=0 bulkscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406290023
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
Cc: kernel-janitors@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 6/15/2024 10:06 AM, Jeff Johnson wrote:
> With ARCH=powerpc, make allmodconfig && make W=1 C=1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in arch/powerpc/kernel/rtas_flash.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in arch/powerpc/sysdev/rtc_cmos_setup.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in arch/powerpc/platforms/pseries/papr_scm.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in arch/powerpc/platforms/cell/spufs/spufs.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in arch/powerpc/platforms/cell/cbe_thermal.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in arch/powerpc/platforms/cell/cpufreq_spudemand.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in arch/powerpc/platforms/cell/cbe_powerbutton.o
> 
> Add the missing invocation of the MODULE_DESCRIPTION() macro to all
> files which have a MODULE_LICENSE().
> 
> This includes 85xx/t1042rdb_diu.c and chrp/nvram.c which, although
> they did not produce a warning with the powerpc allmodconfig
> configuration, may cause this warning with other configurations.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> ---
> Corrections to these descriptions are welcomed. I'm not an expert in
> this code so in most cases I've taken these descriptions directly from
> code comments, Kconfig descriptions, or git logs.  History has shown
> that in some cases these are originally wrong due to cut-n-paste
> errors, and in other cases the drivers have evolved such that the
> original information is no longer accurate.
> ---
>  arch/powerpc/kernel/rtas_flash.c                | 1 +
>  arch/powerpc/platforms/85xx/t1042rdb_diu.c      | 1 +
>  arch/powerpc/platforms/cell/cbe_powerbutton.c   | 1 +
>  arch/powerpc/platforms/cell/cbe_thermal.c       | 1 +
>  arch/powerpc/platforms/cell/cpufreq_spudemand.c | 1 +
>  arch/powerpc/platforms/cell/spufs/inode.c       | 1 +
>  arch/powerpc/platforms/chrp/nvram.c             | 1 +
>  arch/powerpc/platforms/pseries/papr_scm.c       | 1 +
>  arch/powerpc/sysdev/rtc_cmos_setup.c            | 1 +
>  9 files changed, 9 insertions(+)
> 
> diff --git a/arch/powerpc/kernel/rtas_flash.c b/arch/powerpc/kernel/rtas_flash.c
> index 359577ec1680..5407024881e5 100644
> --- a/arch/powerpc/kernel/rtas_flash.c
> +++ b/arch/powerpc/kernel/rtas_flash.c
> @@ -773,4 +773,5 @@ static void __exit rtas_flash_cleanup(void)
>  
>  module_init(rtas_flash_init);
>  module_exit(rtas_flash_cleanup);
> +MODULE_DESCRIPTION("PPC procfs firmware flash interface");
>  MODULE_LICENSE("GPL");
> diff --git a/arch/powerpc/platforms/85xx/t1042rdb_diu.c b/arch/powerpc/platforms/85xx/t1042rdb_diu.c
> index 767eed98a0a8..d4fbb6eff38a 100644
> --- a/arch/powerpc/platforms/85xx/t1042rdb_diu.c
> +++ b/arch/powerpc/platforms/85xx/t1042rdb_diu.c
> @@ -149,4 +149,5 @@ static int __init t1042rdb_diu_init(void)
>  
>  early_initcall(t1042rdb_diu_init);
>  
> +MODULE_DESCRIPTION("Freescale T1042 DIU driver");
>  MODULE_LICENSE("GPL");
> diff --git a/arch/powerpc/platforms/cell/cbe_powerbutton.c b/arch/powerpc/platforms/cell/cbe_powerbutton.c
> index a3ee397486f6..3d121acdf69b 100644
> --- a/arch/powerpc/platforms/cell/cbe_powerbutton.c
> +++ b/arch/powerpc/platforms/cell/cbe_powerbutton.c
> @@ -101,5 +101,6 @@ static void __exit cbe_powerbutton_exit(void)
>  module_init(cbe_powerbutton_init);
>  module_exit(cbe_powerbutton_exit);
>  
> +MODULE_DESCRIPTION("Driver for powerbutton on IBM cell blades");
>  MODULE_LICENSE("GPL");
>  MODULE_AUTHOR("Christian Krafft <krafft@de.ibm.com>");
> diff --git a/arch/powerpc/platforms/cell/cbe_thermal.c b/arch/powerpc/platforms/cell/cbe_thermal.c
> index 2f45428e32c8..c295c6714f9b 100644
> --- a/arch/powerpc/platforms/cell/cbe_thermal.c
> +++ b/arch/powerpc/platforms/cell/cbe_thermal.c
> @@ -381,6 +381,7 @@ static void __exit thermal_exit(void)
>  }
>  module_exit(thermal_exit);
>  
> +MODULE_DESCRIPTION("Cell processor thermal driver");
>  MODULE_LICENSE("GPL");
>  MODULE_AUTHOR("Christian Krafft <krafft@de.ibm.com>");
>  
> diff --git a/arch/powerpc/platforms/cell/cpufreq_spudemand.c b/arch/powerpc/platforms/cell/cpufreq_spudemand.c
> index ca7849e113d7..79172ba36eca 100644
> --- a/arch/powerpc/platforms/cell/cpufreq_spudemand.c
> +++ b/arch/powerpc/platforms/cell/cpufreq_spudemand.c
> @@ -129,5 +129,6 @@ static struct cpufreq_governor spu_governor = {
>  cpufreq_governor_init(spu_governor);
>  cpufreq_governor_exit(spu_governor);
>  
> +MODULE_DESCRIPTION("SPU-aware cpufreq governor for the cell processor");
>  MODULE_LICENSE("GPL");
>  MODULE_AUTHOR("Christian Krafft <krafft@de.ibm.com>");
> diff --git a/arch/powerpc/platforms/cell/spufs/inode.c b/arch/powerpc/platforms/cell/spufs/inode.c
> index 030de2b8c145..70236d1df3d3 100644
> --- a/arch/powerpc/platforms/cell/spufs/inode.c
> +++ b/arch/powerpc/platforms/cell/spufs/inode.c
> @@ -822,6 +822,7 @@ static void __exit spufs_exit(void)
>  }
>  module_exit(spufs_exit);
>  
> +MODULE_DESCRIPTION("SPU file system");
>  MODULE_LICENSE("GPL");
>  MODULE_AUTHOR("Arnd Bergmann <arndb@de.ibm.com>");
>  
> diff --git a/arch/powerpc/platforms/chrp/nvram.c b/arch/powerpc/platforms/chrp/nvram.c
> index 0eedae96498c..d3bf56a46656 100644
> --- a/arch/powerpc/platforms/chrp/nvram.c
> +++ b/arch/powerpc/platforms/chrp/nvram.c
> @@ -92,4 +92,5 @@ void __init chrp_nvram_init(void)
>  	return;
>  }
>  
> +MODULE_DESCRIPTION("PPC NVRAM device driver");
>  MODULE_LICENSE("GPL v2");
> diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
> index 9b6420eb3567..f6a70bc92e83 100644
> --- a/arch/powerpc/platforms/pseries/papr_scm.c
> +++ b/arch/powerpc/platforms/pseries/papr_scm.c
> @@ -1536,5 +1536,6 @@ static void __exit papr_scm_exit(void)
>  module_exit(papr_scm_exit);
>  
>  MODULE_DEVICE_TABLE(of, papr_scm_match);
> +MODULE_DESCRIPTION("PAPR Storage Class Memory interface driver");
>  MODULE_LICENSE("GPL");
>  MODULE_AUTHOR("IBM Corporation");
> diff --git a/arch/powerpc/sysdev/rtc_cmos_setup.c b/arch/powerpc/sysdev/rtc_cmos_setup.c
> index 47cc87bd6a33..9a232ae5e360 100644
> --- a/arch/powerpc/sysdev/rtc_cmos_setup.c
> +++ b/arch/powerpc/sysdev/rtc_cmos_setup.c
> @@ -66,4 +66,5 @@ static int  __init add_rtc(void)
>  }
>  fs_initcall(add_rtc);
>  
> +MODULE_DESCRIPTION("PPC RTC CMOS driver");
>  MODULE_LICENSE("GPL");
> 
> ---
> base-commit: 83a7eefedc9b56fe7bfeff13b6c7356688ffa670
> change-id: 20240615-md-powerpc-arch-powerpc-c8b981be95f8

Following up to see if anything else is needed from me. Hoping to see this in
linux-next so I can remove it from my tracking spreadsheet :)

/jeff
