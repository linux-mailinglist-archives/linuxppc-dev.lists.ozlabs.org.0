Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD7C213A41
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jul 2020 14:51:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49yvws1Xh5zDqQ9
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jul 2020 22:51:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=psampat@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49yvqT3YL8zDrFm
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jul 2020 22:46:58 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 063CYQcE039767; Fri, 3 Jul 2020 08:46:51 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 322144pe59-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Jul 2020 08:46:51 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 063CYU5O039953;
 Fri, 3 Jul 2020 08:46:50 -0400
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 322144pe4d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Jul 2020 08:46:50 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 063CkAxV009024;
 Fri, 3 Jul 2020 12:46:48 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03fra.de.ibm.com with ESMTP id 31wwr8be7v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Jul 2020 12:46:47 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 063Ckjfa2490624
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 3 Jul 2020 12:46:45 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 266424C050;
 Fri,  3 Jul 2020 12:46:45 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5253A4C046;
 Fri,  3 Jul 2020 12:46:43 +0000 (GMT)
Received: from pratiks-thinkpad.ibmuc.com (unknown [9.85.102.88])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  3 Jul 2020 12:46:43 +0000 (GMT)
From: Pratik Rajesh Sampat <psampat@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, benh@kernel.crashing.org,
 paulus@samba.org, ego@linux.vnet.ibm.com, svaidy@linux.ibm.com,
 psampat@linux.ibm.com, pratik.r.sampat@gmail.com
Subject: [PATCH 2/2] powerpc/powernv/idle: save-restore DAWR0,DAWRX0 for P10
Date: Fri,  3 Jul 2020 18:16:40 +0530
Message-Id: <20200703124640.42820-2-psampat@linux.ibm.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200703124640.42820-1-psampat@linux.ibm.com>
References: <20200703124640.42820-1-psampat@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-03_06:2020-07-02,
 2020-07-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 lowpriorityscore=0 malwarescore=0 mlxscore=0 spamscore=0 impostorscore=0
 mlxlogscore=916 priorityscore=1501 bulkscore=0 cotscore=-2147483648
 suspectscore=0 adultscore=0 phishscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2007030086
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

Additional registers DAWR0, DAWRX0 may be lost on Power 10 for
stop levels < 4.
Therefore save the values of these SPRs before entering a  "stop"
state and restore their values on wakeup.

Signed-off-by: Pratik Rajesh Sampat <psampat@linux.ibm.com>
---
 arch/powerpc/platforms/powernv/idle.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/powerpc/platforms/powernv/idle.c b/arch/powerpc/platforms/powernv/idle.c
index 19d94d021357..471d4a65b1fa 100644
--- a/arch/powerpc/platforms/powernv/idle.c
+++ b/arch/powerpc/platforms/powernv/idle.c
@@ -600,6 +600,8 @@ struct p9_sprs {
 	u64 iamr;
 	u64 amor;
 	u64 uamor;
+	u64 dawr0;
+	u64 dawrx0;
 };
 
 static unsigned long power9_idle_stop(unsigned long psscr, bool mmu_on)
@@ -677,6 +679,10 @@ static unsigned long power9_idle_stop(unsigned long psscr, bool mmu_on)
 		sprs.tscr	= mfspr(SPRN_TSCR);
 		if (!firmware_has_feature(FW_FEATURE_ULTRAVISOR))
 			sprs.ldbar = mfspr(SPRN_LDBAR);
+		if (cpu_has_feature(CPU_FTR_ARCH_31)) {
+			sprs.dawr0 = mfspr(SPRN_DAWR0);
+			sprs.dawrx0 = mfspr(SPRN_DAWRX0);
+		}
 
 		sprs_saved = true;
 
@@ -792,6 +798,10 @@ static unsigned long power9_idle_stop(unsigned long psscr, bool mmu_on)
 	mtspr(SPRN_MMCR2,	sprs.mmcr2);
 	if (!firmware_has_feature(FW_FEATURE_ULTRAVISOR))
 		mtspr(SPRN_LDBAR, sprs.ldbar);
+	if (cpu_has_feature(CPU_FTR_ARCH_31)) {
+		mtspr(SPRN_DAWR0, sprs.dawr0);
+		mtspr(SPRN_DAWRX0, sprs.dawrx0);
+	}
 
 	mtspr(SPRN_SPRG3,	local_paca->sprg_vdso);
 
-- 
2.25.4

