Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D109090966B
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Jun 2024 08:53:01 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=b/k/ydMj;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W1Rfv6y4xz30Tr
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Jun 2024 16:52:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=b/k/ydMj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=quicinc.com (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=quic_jjohnson@quicinc.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 2610 seconds by postgrey-1.37 at boromir; Sat, 15 Jun 2024 16:52:16 AEST
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W1Rf83g56z3cLj
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Jun 2024 16:52:15 +1000 (AEST)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45F4pb1k012051;
	Sat, 15 Jun 2024 06:08:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=joR0DuSj5HluPWl2TjMOJ9
	C6AXoNG2TEka1zEPsj3BI=; b=b/k/ydMjDWHsF5VZDMoe+SSO9UqqUfKnbbePi+
	tl7NQJrQ2mPlHDokWjTE8ZJ2BWMhw6AV/h3iwlw2T70BeSiqco9Vn/qQheKOnKFS
	wkwYP0NVV18gm/tyiNuauwWvoujAWJPEZC0ByG7L+0JJGdzlIECEzkqQNK4KnoYo
	4Q13LZXyEEKE10ddyAgWc37xjITYFxszusZIG7PeHkLeHmdPruMYqp2X2kBOhcFk
	GJD1dc825hjPGaAA1M8BdoC5RI8EHfGE4dyiYjWq8qcqF0GRrpe6rZPmZH7RD+kJ
	9adh7m1vGYTWeSetOpZszprNGVK5gzUEtNypgWWk9frjvajQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ys0nf8bqp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 15 Jun 2024 06:08:25 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45F68O7S023345
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 15 Jun 2024 06:08:24 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 14 Jun
 2024 23:08:24 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Fri, 14 Jun 2024 23:08:21 -0700
Subject: [PATCH] cpufreq: powerpc: add missing MODULE_DESCRIPTION() macros
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240614-md-powerpc-drivers-cpufreq-v1-1-de4034d87fd2@quicinc.com>
X-B4-Tracking: v=1; b=H4sIANUvbWYC/x3MQQ6CMBAF0KuQWTsJYG2MVzEuSvuRSaTUKSAJ4
 e5Wl2/zdspQQaZbtZNilSxTLGhOFfnBxSdYQjG1dWtq2xgeA6fpA02eg8oKzezT0ivebMPZXGC
 ujTWgEiRFL9s/vz+KO5fBnbroh1/5krhsPLo8Q+k4voqZNMaLAAAA
To: "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar
	<viresh.kumar@linaro.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        "Nicholas
 Piggin" <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
X-Mailer: b4 0.13.0
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: _FUh_ZeRf1uIc4GeoD0tuD7_mU230y_I
X-Proofpoint-ORIG-GUID: _FUh_ZeRf1uIc4GeoD0tuD7_mU230y_I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-15_02,2024-06-14_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 adultscore=0 clxscore=1011 suspectscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=999 impostorscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406150045
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
Cc: kernel-janitors@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Jeff
 Johnson <quic_jjohnson@quicinc.com>, linux-pm@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

With ARCH=powerpc, make allmodconfig && make W=1 C=1 reports:
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/cpufreq/ppc-cbe-cpufreq.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/cpufreq/powernv-cpufreq.o

Add the missing invocation of the MODULE_DESCRIPTION() macro to all
files which have a MODULE_LICENSE().

This includes three additional files which, although they did not
produce a warning with the powerpc allmodconfig configuration, may
cause this warning with specific options enabled in the kernel
configuration.

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
Corrections to these descriptions are welcomed. I'm not an expert in
this code so in most cases I've taken these descriptions directly from
code comments, Kconfig descriptions, or git logs.  History has shown
that in some cases these are originally wrong due to cut-n-paste
errors, and in other cases the drivers have evolved such that the
original information is no longer accurate.
---
 drivers/cpufreq/maple-cpufreq.c   | 1 +
 drivers/cpufreq/pasemi-cpufreq.c  | 1 +
 drivers/cpufreq/pmac64-cpufreq.c  | 1 +
 drivers/cpufreq/powernv-cpufreq.c | 1 +
 drivers/cpufreq/ppc_cbe_cpufreq.c | 1 +
 5 files changed, 5 insertions(+)

diff --git a/drivers/cpufreq/maple-cpufreq.c b/drivers/cpufreq/maple-cpufreq.c
index f9306410a07f..19ca7f874d28 100644
--- a/drivers/cpufreq/maple-cpufreq.c
+++ b/drivers/cpufreq/maple-cpufreq.c
@@ -238,4 +238,5 @@ static int __init maple_cpufreq_init(void)
 module_init(maple_cpufreq_init);
 
 
+MODULE_DESCRIPTION("cpufreq driver for Maple 970FX Evaluation Board");
 MODULE_LICENSE("GPL");
diff --git a/drivers/cpufreq/pasemi-cpufreq.c b/drivers/cpufreq/pasemi-cpufreq.c
index 039a66bbe1be..92a99f09884a 100644
--- a/drivers/cpufreq/pasemi-cpufreq.c
+++ b/drivers/cpufreq/pasemi-cpufreq.c
@@ -271,5 +271,6 @@ static void __exit pas_cpufreq_exit(void)
 module_init(pas_cpufreq_init);
 module_exit(pas_cpufreq_exit);
 
+MODULE_DESCRIPTION("cpufreq driver for PA Semi PWRficient");
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Egor Martovetsky <egor@pasemi.com>, Olof Johansson <olof@lixom.net>");
diff --git a/drivers/cpufreq/pmac64-cpufreq.c b/drivers/cpufreq/pmac64-cpufreq.c
index 2cd2b06849a2..9d3fe36075f8 100644
--- a/drivers/cpufreq/pmac64-cpufreq.c
+++ b/drivers/cpufreq/pmac64-cpufreq.c
@@ -671,4 +671,5 @@ static int __init g5_cpufreq_init(void)
 module_init(g5_cpufreq_init);
 
 
+MODULE_DESCRIPTION("cpufreq driver for SMU & 970FX based G5 Macs");
 MODULE_LICENSE("GPL");
diff --git a/drivers/cpufreq/powernv-cpufreq.c b/drivers/cpufreq/powernv-cpufreq.c
index fddbd1ea1635..e923f717e1d7 100644
--- a/drivers/cpufreq/powernv-cpufreq.c
+++ b/drivers/cpufreq/powernv-cpufreq.c
@@ -1162,5 +1162,6 @@ static void __exit powernv_cpufreq_exit(void)
 }
 module_exit(powernv_cpufreq_exit);
 
+MODULE_DESCRIPTION("cpufreq driver for the IBM POWER processors");
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Vaidyanathan Srinivasan <svaidy at linux.vnet.ibm.com>");
diff --git a/drivers/cpufreq/ppc_cbe_cpufreq.c b/drivers/cpufreq/ppc_cbe_cpufreq.c
index 88afc49941b7..72f568d14f30 100644
--- a/drivers/cpufreq/ppc_cbe_cpufreq.c
+++ b/drivers/cpufreq/ppc_cbe_cpufreq.c
@@ -169,5 +169,6 @@ static void __exit cbe_cpufreq_exit(void)
 module_init(cbe_cpufreq_init);
 module_exit(cbe_cpufreq_exit);
 
+MODULE_DESCRIPTION("cpufreq driver for Cell BE processors");
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Christian Krafft <krafft@de.ibm.com>");

---
base-commit: 83a7eefedc9b56fe7bfeff13b6c7356688ffa670
change-id: 20240614-md-powerpc-drivers-cpufreq-6d345e48164e

