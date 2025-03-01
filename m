Return-Path: <linuxppc-dev+bounces-6591-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF2CA4AD52
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Mar 2025 19:24:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z4tkd2wsxz305G;
	Sun,  2 Mar 2025 05:23:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740853433;
	cv=none; b=FdgLav+13BnEqQJ8Ek0OzakYYdsxffR/GZGmn8qNRx1g5htK9gO3qubYyWmLjezpfoGway+XdBvSNgAgaICkoHxG2fa3mX2v0ryHFAyohoWK+ygN2yMbpTYZUA2XVZWhR2zrSA3nyNbMjznH/kVQDBpcKzq9+hV0wBrB+csLc8vNq3bR712jsvIWhTbk6lEwYjr5yCFmzVexucsuGewyof7TupydjgbMut3qJGNEidwtjcIUnkuyY30mi/jnEdglKjJjdu2ajfnTlkYPviTBtJLoJT4RAlrEXXtPoCtZOQEIAqklG1OHsnfut8dHLDBjuu+k8rX0H1o2b7yMxSCtrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740853433; c=relaxed/relaxed;
	bh=/xIetWcIKBU2rBDxAmKfjJgKcO5RDy4zcjXkQm9qSBk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=egn2AEtn0875jcSuwRoAez5HtbofkdOsaTUl6OMXjpMmSQRCVCWv+7Bl+B64H1kder6QgBQv7SAVLOZO27y4CeeZCkzCfCEcVcXnAWnL/4IVXECxfteGMGh8SYJh/6I9c9ioHIhsoQv4N7ytiGjvF0Pq2XjXANAoIGyFDGqNE84vatLsiJVmUWJxR38Aea0zk0LVGjIm7J9t5sxyNgsbjm9XuLlCzo0WiC/SLEiaeDUQrN1xJkkgGIPiX7GqF/LdB8n9BrtegT6lRKnOhHWZdbG23kdwiJumZpi5s5yux3K/nu5kaPOCksbbHMsg8N3vZRo7HLbPioPxAy0jxObekg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cUgzvPiQ; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cUgzvPiQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z4tkc56cwz2yGM
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  2 Mar 2025 05:23:52 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 521FJ31P013804;
	Sat, 1 Mar 2025 18:23:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=/xIetWcIKBU2rBDxA
	mKfjJgKcO5RDy4zcjXkQm9qSBk=; b=cUgzvPiQr7ESAa9LHiQR2CGvfDtWiYTiU
	m3jCOxip1RpTJgS0+Ju2oC3gBOspryC+yIhKhdEJcinL741Emir7HEMN3BvhJnAd
	tFDqu1PQg7tLz93E5VmxWQqMqYgZ7FodueZcXfmOIna2PygbYb5o6lZhk35yWE1w
	UqG7Hk+YlD/X70WIKcJLDl19WkwTqUMVkFjAPw1HuMf0pQnpowVJG0wazzPK202p
	Jw6Qu8YNXcM49y8ajQKOG08lKufa4WoDlaxLjd3g9eyak0GZ6E7q+MVLJNBY5LAK
	d0TDKhCklmIKXUqGwsmrDtTfIR6uJiRG0zEOYLJSlc2XV8RHlBovQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 454291108u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 01 Mar 2025 18:23:43 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 521INhUY003963;
	Sat, 1 Mar 2025 18:23:43 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 454291108a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 01 Mar 2025 18:23:43 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 521EeDjU026287;
	Sat, 1 Mar 2025 18:23:42 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 44yswp4wvd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 01 Mar 2025 18:23:42 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 521INeMc22479244
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 1 Mar 2025 18:23:40 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1AB0620043;
	Sat,  1 Mar 2025 18:23:40 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CAD0A20040;
	Sat,  1 Mar 2025 18:23:36 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.6.12])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sat,  1 Mar 2025 18:23:36 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu
Cc: linuxppc-dev@lists.ozlabs.org, Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: [PATCH v2 4/4] powerpc/perf/vpa-pmu: Avoid loading vpa-pmu driver during dump kernel
Date: Sat,  1 Mar 2025 23:53:10 +0530
Message-ID: <20250301182310.6832-4-maddy@linux.ibm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250301182310.6832-1-maddy@linux.ibm.com>
References: <20250301182310.6832-1-maddy@linux.ibm.com>
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
X-Proofpoint-GUID: meYX_3Sd2CEAnUpyz6g2ycRHQSrD2cgU
X-Proofpoint-ORIG-GUID: ctMOyW9zdyiu7Oa4LoV6Ap8wqTikBuPY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-01_07,2025-02-28_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 mlxscore=0 bulkscore=0 clxscore=1015 spamscore=0
 phishscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502100000 definitions=main-2503010145
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

vpa-pmu driver is used to collect latency metrics for host to guest
or guest to host context switches in a PowerVM KVM guest scenario.
These are enabled using CONFIG_VPA_PMU and when these are compiled
as built-in, add check for kdump and fadump kernel to avoids
loading them, since there are no commandline option to disable them.

Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
---
Changelog v1:
- Added more details to commmit message

 arch/powerpc/perf/vpa-pmu.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/powerpc/perf/vpa-pmu.c b/arch/powerpc/perf/vpa-pmu.c
index 6a5bfd2a13b5..f7f72b976c1d 100644
--- a/arch/powerpc/perf/vpa-pmu.c
+++ b/arch/powerpc/perf/vpa-pmu.c
@@ -10,6 +10,8 @@
 #include <linux/perf_event.h>
 #include <asm/kvm_ppc.h>
 #include <asm/kvm_book3s_64.h>
+#include <asm/fadump.h>
+#include <asm/kexec.h>
 
 #define MODULE_VERS "1.0"
 #define MODULE_NAME "pseries_vpa_pmu"
@@ -183,6 +185,9 @@ static int __init pseries_vpa_pmu_init(void)
 	if (!firmware_has_feature(FW_FEATURE_LPAR) || is_kvm_guest())
 		return -ENODEV;
 
+	if (is_kdump_kernel() || is_fadump_active())
+		return 0;
+
 	perf_pmu_register(&vpa_pmu, vpa_pmu.name, -1);
 	pr_info("Virtual Processor Area PMU registered.\n");
 
-- 
2.47.0


