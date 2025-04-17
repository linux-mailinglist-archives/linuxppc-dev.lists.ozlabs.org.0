Return-Path: <linuxppc-dev+bounces-7737-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52528A91BC3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Apr 2025 14:18:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZdcNl5zSlz3bsT;
	Thu, 17 Apr 2025 22:17:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744892279;
	cv=none; b=NJOipd7kbV4xHn5oRzFf0H7RAKptTbtc/y2JaGFuRE+ZDNf+E+1gn1jcn9SCWMgq1ho7ZwIjynVhVQTc9wMVvGMu2ZuB1s9Tfjr7ksIqXoENMcpkE93cE40NcFUdb13WYVwhJF4CuQLTuxPn2q9E5LwfVlpUNoRuSTy87iesKlxOBAnjyk55/j9ATbfjTEQeWpT7PA0LLPGHKzajUPB16RUL3ncwCKP8GBIWyqmxeKpajDZes997AqlgwDs9Wuyh2guBeKZyUQ40dfJCp3JQL0JOadb/VPqMBcNQ9F5qHsw5uO0yRElPWaFn8NzNBDoZ3L/jWgP8eg/KoXG9xBH4sA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744892279; c=relaxed/relaxed;
	bh=8s1djKeL3fc4H9gWVuhC844rgRl5PgneXVqXQ6Os7m8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TkoFH89Zi7zktx3mQp1LU9Fn2Ls8pXw+vaNszd+PbCuEl23ZuP69zAC5j0+xxC9NQn7djyuhkiLDoLxEGPw375Vn65fx9ahn27ecJsXZof5fGE7858ttdZuzH5KWKzZ2miKlyghztkIOD2b6pjROYxyeHN+c5kL6BqYcz3flJOqrDbGlzMhjsOgw8fkRz0Vz8S0V24Ol5hH3qdV96j0U9H5gHdisgiZoRIIvhkDQZZcXA3+eyqYur+La4RQGk5Z6mhjKQlue82jxmSlIiIjj+0byb0Dzp44GnOFLIukPXrfIm36KZx3uevUj0HaIUawqL9Fjxb2AVDbQ1Nxw9QviZg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HrFTplON; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=gautam@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HrFTplON;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=gautam@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZdcNk5NRJz2ySp
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Apr 2025 22:17:58 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53HAeaEa015627;
	Thu, 17 Apr 2025 12:17:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=8s1djKeL3fc4H9gWVuhC844rgRl5PgneXVqXQ6Os7
	m8=; b=HrFTplON4eaEVIY8pRzY0DPFDgOLuOfTJqijR744NQ2xpz60nr+RSxnoF
	CJMKMINuFT3O1SC2t5vXI5Yfmryub9LneukT3UT7jdP0PRf2fW2xkktNRPU12wl7
	4ZGQ07zJ2/Agx7G3Yjv1EEx4vHxWPCp+cPFeAI2KWCEYZOYUuvLKxVKOC8rHpPM6
	pxx6JhPFkNxU8Erds7KRzthkniSo/OfpTAslc5kY0Wlw9OXfRXIgweC6qVqnIBum
	MGkLiUgknaB8dhUpO3c86qDDMry+mwNr1rsy4Xb0H4v/VmAsgNwdj4pvJgg7t8h+
	GKOjd4ugUzVngtqQfpZQjo7Pba4uQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46303rrdfa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Apr 2025 12:17:42 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53HCHgda028278;
	Thu, 17 Apr 2025 12:17:42 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46303rrdf8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Apr 2025 12:17:42 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53HBcuAj010392;
	Thu, 17 Apr 2025 12:17:41 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4604qkdamn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Apr 2025 12:17:41 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53HCHb5U29754010
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 17 Apr 2025 12:17:37 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BD56020043;
	Thu, 17 Apr 2025 12:17:37 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0978720040;
	Thu, 17 Apr 2025 12:17:36 +0000 (GMT)
Received: from li-c6426e4c-27cf-11b2-a85c-95d65bc0de0e.in.ibm.com (unknown [9.204.206.66])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 17 Apr 2025 12:17:35 +0000 (GMT)
From: Gautam Menghani <gautam@linux.ibm.com>
To: maddy@linux.ibm.com, npiggin@gmail.com, mpe@ellerman.id.au,
        christophe.leroy@csgroup.eu, naveen@kernel.org
Cc: Gautam Menghani <gautam@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
        kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] KVM: PPC: Kconfig: Enable CONFIG_VPA_PMU with KVM
Date: Thu, 17 Apr 2025 17:47:23 +0530
Message-ID: <20250417121727.267280-1-gautam@linux.ibm.com>
X-Mailer: git-send-email 2.49.0
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=C/bpyRP+ c=1 sm=1 tr=0 ts=6800f166 cx=c_pps a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=4sdRRrpyhxI9_uLjM3gA:9
X-Proofpoint-ORIG-GUID: 7HBlp_NFM4J29MT9buZP-ezNtNQhPCdp
X-Proofpoint-GUID: 0ZTnXM6xgeaJkUNPnWFG_kiOFaa3C1ZH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_03,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 mlxscore=0 suspectscore=0 spamscore=0 mlxlogscore=999 bulkscore=0
 malwarescore=0 phishscore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504170090
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Enable CONFIG_VPA_PMU with KVM to enable its usage. Currently, the
vpa-pmu driver cannot be used since it is not enabled in distro configs.

On fedora kernel 6.13.7, the config option is disabled:
$ cat /boot/config-6.13.7-200.fc41.ppc64le | grep VPA
 # CONFIG_VPA_PMU is not set

Fixes: 176cda0619b6c ("powerpc/perf: Add perf interface to expose vpa counters")
Cc: stable@vger.kernel.org # v6.13+
Signed-off-by: Gautam Menghani <gautam@linux.ibm.com>
---
 arch/powerpc/kvm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/kvm/Kconfig b/arch/powerpc/kvm/Kconfig
index dbfdc126bf14..209627e57d07 100644
--- a/arch/powerpc/kvm/Kconfig
+++ b/arch/powerpc/kvm/Kconfig
@@ -84,6 +84,7 @@ config KVM_BOOK3S_64_HV
 	select KVM_BOOK3S_HV_POSSIBLE
 	select KVM_GENERIC_MMU_NOTIFIER
 	select CMA
+	select VPA_PMU if HV_PERF_CTRS
 	help
 	  Support running unmodified book3s_64 guest kernels in
 	  virtual machines on POWER7 and newer processors that have
-- 
2.49.0


