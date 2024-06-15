Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C4DF909926
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Jun 2024 19:07:23 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U64lxNv6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W1jHq6Xk4z3cRR
	for <lists+linuxppc-dev@lfdr.de>; Sun, 16 Jun 2024 03:07:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U64lxNv6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=quicinc.com (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=quic_jjohnson@quicinc.com; receiver=lists.ozlabs.org)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W1jH56VTzz3bX3
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 16 Jun 2024 03:06:40 +1000 (AEST)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45FEqEFh027586;
	Sat, 15 Jun 2024 17:06:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=s36MulOjl5sMtOg3Zzbq1u
	VP8iMKKYneh72+JyIDOGY=; b=U64lxNv6gtJAuycDydGJYIreIQzh8tuL2z2ClD
	Yc2i1IAEuSmG6RyWHFe9vkkwT5HNhUsth4sSMhbmvM+uoqB19xXBLUG+5pBGOYC7
	qYCjlO3CZZkFx0KbhzDqK4znDV+AQB+MZVIjnF6inF0lzCBIAFcnZDQuf0idRRm4
	XRSeZvTs3wihOLBzDfXOCMqrj0EJZrV921Ebr08jXexZiiR6TA0e1oQXaCvL6ofK
	Mc65F8GZGYBSITPcOKydkT+xcNFxAOY2Igsg6kVM6aBceXL9QL6471c14R0sSRFc
	W0qBN0GJeWxoZwqy79HUCw8nPecLa1HhNJrRD6qBgcgIofwA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ys1wr0yga-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 15 Jun 2024 17:06:20 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45FH6KDt010559
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 15 Jun 2024 17:06:20 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sat, 15 Jun
 2024 10:06:19 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Sat, 15 Jun 2024 10:06:18 -0700
Subject: [PATCH] powerpc: add missing MODULE_DESCRIPTION() macros
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240615-md-powerpc-arch-powerpc-v1-1-ba4956bea47a@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAAnKbWYC/z3MPQ7CMAxA4atUnrHUVBSlXAUxOKlLLNE0svmpV
 PXuBAbGb3hvA2MVNjg3Gyi/xGTJFe7QQEyUb4wyVkPXdsf25HqcRyzLm7VEJI3pj+jD4F3goZ8
 81LooT7L+zpdrdSBjDEo5pu/vLvm54kz2YIV9/wA+S59miAAAAA==
To: Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin
	<npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        "Naveen
 N. Rao" <naveen.n.rao@linux.ibm.com>,
        Scott Wood <oss@buserror.net>, "Arnd
 Bergmann" <arnd@arndb.de>,
        Jeremy Kerr <jk@ozlabs.org>
X-Mailer: b4 0.14.0
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: m6WLiNWaWND16ZG1w3csBl4nG43FLScJ
X-Proofpoint-ORIG-GUID: m6WLiNWaWND16ZG1w3csBl4nG43FLScJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-15_13,2024-06-14_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 mlxlogscore=999 adultscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 mlxscore=0 phishscore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2406150130
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
Cc: kernel-janitors@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Jeff Johnson <quic_jjohnson@quicinc.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

With ARCH=powerpc, make allmodconfig && make W=1 C=1 reports:
WARNING: modpost: missing MODULE_DESCRIPTION() in arch/powerpc/kernel/rtas_flash.o
WARNING: modpost: missing MODULE_DESCRIPTION() in arch/powerpc/sysdev/rtc_cmos_setup.o
WARNING: modpost: missing MODULE_DESCRIPTION() in arch/powerpc/platforms/pseries/papr_scm.o
WARNING: modpost: missing MODULE_DESCRIPTION() in arch/powerpc/platforms/cell/spufs/spufs.o
WARNING: modpost: missing MODULE_DESCRIPTION() in arch/powerpc/platforms/cell/cbe_thermal.o
WARNING: modpost: missing MODULE_DESCRIPTION() in arch/powerpc/platforms/cell/cpufreq_spudemand.o
WARNING: modpost: missing MODULE_DESCRIPTION() in arch/powerpc/platforms/cell/cbe_powerbutton.o

Add the missing invocation of the MODULE_DESCRIPTION() macro to all
files which have a MODULE_LICENSE().

This includes 85xx/t1042rdb_diu.c and chrp/nvram.c which, although
they did not produce a warning with the powerpc allmodconfig
configuration, may cause this warning with other configurations.

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
Corrections to these descriptions are welcomed. I'm not an expert in
this code so in most cases I've taken these descriptions directly from
code comments, Kconfig descriptions, or git logs.  History has shown
that in some cases these are originally wrong due to cut-n-paste
errors, and in other cases the drivers have evolved such that the
original information is no longer accurate.
---
 arch/powerpc/kernel/rtas_flash.c                | 1 +
 arch/powerpc/platforms/85xx/t1042rdb_diu.c      | 1 +
 arch/powerpc/platforms/cell/cbe_powerbutton.c   | 1 +
 arch/powerpc/platforms/cell/cbe_thermal.c       | 1 +
 arch/powerpc/platforms/cell/cpufreq_spudemand.c | 1 +
 arch/powerpc/platforms/cell/spufs/inode.c       | 1 +
 arch/powerpc/platforms/chrp/nvram.c             | 1 +
 arch/powerpc/platforms/pseries/papr_scm.c       | 1 +
 arch/powerpc/sysdev/rtc_cmos_setup.c            | 1 +
 9 files changed, 9 insertions(+)

diff --git a/arch/powerpc/kernel/rtas_flash.c b/arch/powerpc/kernel/rtas_flash.c
index 359577ec1680..5407024881e5 100644
--- a/arch/powerpc/kernel/rtas_flash.c
+++ b/arch/powerpc/kernel/rtas_flash.c
@@ -773,4 +773,5 @@ static void __exit rtas_flash_cleanup(void)
 
 module_init(rtas_flash_init);
 module_exit(rtas_flash_cleanup);
+MODULE_DESCRIPTION("PPC procfs firmware flash interface");
 MODULE_LICENSE("GPL");
diff --git a/arch/powerpc/platforms/85xx/t1042rdb_diu.c b/arch/powerpc/platforms/85xx/t1042rdb_diu.c
index 767eed98a0a8..d4fbb6eff38a 100644
--- a/arch/powerpc/platforms/85xx/t1042rdb_diu.c
+++ b/arch/powerpc/platforms/85xx/t1042rdb_diu.c
@@ -149,4 +149,5 @@ static int __init t1042rdb_diu_init(void)
 
 early_initcall(t1042rdb_diu_init);
 
+MODULE_DESCRIPTION("Freescale T1042 DIU driver");
 MODULE_LICENSE("GPL");
diff --git a/arch/powerpc/platforms/cell/cbe_powerbutton.c b/arch/powerpc/platforms/cell/cbe_powerbutton.c
index a3ee397486f6..3d121acdf69b 100644
--- a/arch/powerpc/platforms/cell/cbe_powerbutton.c
+++ b/arch/powerpc/platforms/cell/cbe_powerbutton.c
@@ -101,5 +101,6 @@ static void __exit cbe_powerbutton_exit(void)
 module_init(cbe_powerbutton_init);
 module_exit(cbe_powerbutton_exit);
 
+MODULE_DESCRIPTION("Driver for powerbutton on IBM cell blades");
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Christian Krafft <krafft@de.ibm.com>");
diff --git a/arch/powerpc/platforms/cell/cbe_thermal.c b/arch/powerpc/platforms/cell/cbe_thermal.c
index 2f45428e32c8..c295c6714f9b 100644
--- a/arch/powerpc/platforms/cell/cbe_thermal.c
+++ b/arch/powerpc/platforms/cell/cbe_thermal.c
@@ -381,6 +381,7 @@ static void __exit thermal_exit(void)
 }
 module_exit(thermal_exit);
 
+MODULE_DESCRIPTION("Cell processor thermal driver");
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Christian Krafft <krafft@de.ibm.com>");
 
diff --git a/arch/powerpc/platforms/cell/cpufreq_spudemand.c b/arch/powerpc/platforms/cell/cpufreq_spudemand.c
index ca7849e113d7..79172ba36eca 100644
--- a/arch/powerpc/platforms/cell/cpufreq_spudemand.c
+++ b/arch/powerpc/platforms/cell/cpufreq_spudemand.c
@@ -129,5 +129,6 @@ static struct cpufreq_governor spu_governor = {
 cpufreq_governor_init(spu_governor);
 cpufreq_governor_exit(spu_governor);
 
+MODULE_DESCRIPTION("SPU-aware cpufreq governor for the cell processor");
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Christian Krafft <krafft@de.ibm.com>");
diff --git a/arch/powerpc/platforms/cell/spufs/inode.c b/arch/powerpc/platforms/cell/spufs/inode.c
index 030de2b8c145..70236d1df3d3 100644
--- a/arch/powerpc/platforms/cell/spufs/inode.c
+++ b/arch/powerpc/platforms/cell/spufs/inode.c
@@ -822,6 +822,7 @@ static void __exit spufs_exit(void)
 }
 module_exit(spufs_exit);
 
+MODULE_DESCRIPTION("SPU file system");
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Arnd Bergmann <arndb@de.ibm.com>");
 
diff --git a/arch/powerpc/platforms/chrp/nvram.c b/arch/powerpc/platforms/chrp/nvram.c
index 0eedae96498c..d3bf56a46656 100644
--- a/arch/powerpc/platforms/chrp/nvram.c
+++ b/arch/powerpc/platforms/chrp/nvram.c
@@ -92,4 +92,5 @@ void __init chrp_nvram_init(void)
 	return;
 }
 
+MODULE_DESCRIPTION("PPC NVRAM device driver");
 MODULE_LICENSE("GPL v2");
diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
index 9b6420eb3567..f6a70bc92e83 100644
--- a/arch/powerpc/platforms/pseries/papr_scm.c
+++ b/arch/powerpc/platforms/pseries/papr_scm.c
@@ -1536,5 +1536,6 @@ static void __exit papr_scm_exit(void)
 module_exit(papr_scm_exit);
 
 MODULE_DEVICE_TABLE(of, papr_scm_match);
+MODULE_DESCRIPTION("PAPR Storage Class Memory interface driver");
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("IBM Corporation");
diff --git a/arch/powerpc/sysdev/rtc_cmos_setup.c b/arch/powerpc/sysdev/rtc_cmos_setup.c
index 47cc87bd6a33..9a232ae5e360 100644
--- a/arch/powerpc/sysdev/rtc_cmos_setup.c
+++ b/arch/powerpc/sysdev/rtc_cmos_setup.c
@@ -66,4 +66,5 @@ static int  __init add_rtc(void)
 }
 fs_initcall(add_rtc);
 
+MODULE_DESCRIPTION("PPC RTC CMOS driver");
 MODULE_LICENSE("GPL");

---
base-commit: 83a7eefedc9b56fe7bfeff13b6c7356688ffa670
change-id: 20240615-md-powerpc-arch-powerpc-c8b981be95f8

