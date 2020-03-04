Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B99179496
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Mar 2020 17:11:09 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Xf4p3jJfzDqfJ
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Mar 2020 03:11:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Xdtd4YjJzDqW7
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Mar 2020 03:02:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 48Xdtb6nPLz8t9H
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Mar 2020 03:02:15 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 48Xdtb4G8yz9sSR; Thu,  5 Mar 2020 03:02:15 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=psampat@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 48XdtZ2kTpz9sSQ
 for <linuxppc-dev@ozlabs.org>; Thu,  5 Mar 2020 03:02:13 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 024Fuos7169197
 for <linuxppc-dev@ozlabs.org>; Wed, 4 Mar 2020 11:02:12 -0500
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yfknc4668-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Wed, 04 Mar 2020 11:02:10 -0500
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <psampat@linux.ibm.com>;
 Wed, 4 Mar 2020 16:01:38 -0000
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 4 Mar 2020 16:01:36 -0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 024G1YjR55050250
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 4 Mar 2020 16:01:34 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EF773AE055;
 Wed,  4 Mar 2020 16:01:33 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B2F71AE045;
 Wed,  4 Mar 2020 16:01:31 +0000 (GMT)
Received: from pratiks-thinkpad.ibmuc.com (unknown [9.85.81.47])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  4 Mar 2020 16:01:31 +0000 (GMT)
From: Pratik Rajesh Sampat <psampat@linux.ibm.com>
To: linuxppc-dev@ozlabs.org, linux-kernel@vger.kernel.org, mpe@ellerman.id.au, 
 mikey@neuling.org, npiggin@gmail.com, vaidy@linux.ibm.com,
 ego@linux.vnet.ibm.com, skiboot@lists.ozlabs.org, oohall@gmail.com,
 psampat@linux.ibm.com, pratik.r.sampat@gmail.com
Subject: [RFC 3/3] Introduce capability for firmware-enabled-stop
Date: Wed,  4 Mar 2020 21:31:23 +0530
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1583332695.git.psampat@linux.ibm.com>
References: <cover.1583332695.git.psampat@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20030416-0008-0000-0000-000003595304
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20030416-0009-0000-0000-00004A7A873F
Message-Id: <55fa5021e4de901f05ded8b669777711bf2a9724.1583332695.git.psampat@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-04_05:2020-03-04,
 2020-03-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 mlxlogscore=999 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 suspectscore=0 clxscore=1015 mlxscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003040117
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

Design patch that introduces the capability for firmware to handle the
stop states instead. A bit is set based on the discovery of the feature
and correspondingly also the responsibility to handle the stop states.

The commit does not contain calling into the firmware to utilize
firmware enabled stop.

Signed-off-by: Pratik Rajesh Sampat <psampat at linux.ibm.com>
---
 arch/powerpc/include/asm/processor.h | 1 +
 arch/powerpc/kernel/dt_cpu_ftrs.c    | 9 +++++++++
 2 files changed, 10 insertions(+)

diff --git a/arch/powerpc/include/asm/processor.h b/arch/powerpc/include/asm/processor.h
index 277dbabafd02..978fab35d133 100644
--- a/arch/powerpc/include/asm/processor.h
+++ b/arch/powerpc/include/asm/processor.h
@@ -430,6 +430,7 @@ extern unsigned long cpuidle_disable;
 enum idle_boot_override {IDLE_NO_OVERRIDE = 0, IDLE_POWERSAVE_OFF};
 
 #define STOP_ENABLE		0x00000001
+#define FIRMWARE_STOP_ENABLE	0x00000010
 
 #define STOP_VERSION_P9       0x1
 #define STOP_VERSION_P9_V1    0x2
diff --git a/arch/powerpc/kernel/dt_cpu_ftrs.c b/arch/powerpc/kernel/dt_cpu_ftrs.c
index 63e30aa49356..e00f8afabc46 100644
--- a/arch/powerpc/kernel/dt_cpu_ftrs.c
+++ b/arch/powerpc/kernel/dt_cpu_ftrs.c
@@ -313,6 +313,14 @@ static int __init feat_enable_idle_stop_quirk(struct dt_cpu_feature *f)
 
 	return 1;
 }
+
+static int __init feat_enable_firmware_stop(struct dt_cpu_feature *f)
+{
+	stop_dep.cpuidle_prop |= FIRMWARE_STOP_ENABLE;
+
+	return 1;
+}
+
 static int __init feat_enable_mmu_hash(struct dt_cpu_feature *f)
 {
 	u64 lpcr;
@@ -608,6 +616,7 @@ static struct dt_cpu_feature_match __initdata
 	{"alignment-interrupt-dsisr", feat_enable_align_dsisr, 0},
 	{"idle-stop", feat_enable_idle_stop, 0},
 	{"idle-stop-v1", feat_enable_idle_stop_quirk, 0},
+	{"firmware-stop-supported", feat_enable_firmware_stop, 0},
 	{"machine-check-power8", feat_enable_mce_power8, 0},
 	{"performance-monitor-power8", feat_enable_pmu_power8, 0},
 	{"data-stream-control-register", feat_enable_dscr, CPU_FTR_DSCR},
-- 
2.24.1

