Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 824F056D391
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Jul 2022 05:51:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lh9162yg2z3fDf
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Jul 2022 13:51:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SFKtuwsU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SFKtuwsU;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lh8z83yNxz3c1R
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Jul 2022 13:49:56 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26B0UFFI012872;
	Mon, 11 Jul 2022 03:49:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=Py9Pi238eUcQ1EqzCGTfzy9KUMDPa3Dw2zzCt7+RIaw=;
 b=SFKtuwsUK5TfGkO2wUhVtAsRbtcS44ZDQMnuJCEvdSao1SZ9tJNXZg22oaHHthIXo7gL
 tiVoW5mFufGHtY6JT0g8l9Tpkng03tfFc/xzjo1dq5h4oVLAOVnptXsvDi9SpABvCGKZ
 LGi3MaL638WGFxh9sjHXPWVbPK/U4K2BU1O7MLwJkLw7g9eb26InLL2uT2LCF010Xhgy
 aeGghssdZMpQ2BiosrRLRiwpIWPa2IOUqh0+XJdTY/ksAyff8JnFoQfKqatx3Zlkx0jE
 1JD2w+ivxwQ83SaxAF4c3miv2ZT+I+Jege4zlMO7dEvD8OdkT6GJQB2tA9x+by1GrH2H ew== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h83h3yhks-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Jul 2022 03:49:49 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26B3nm6l003938;
	Mon, 11 Jul 2022 03:49:48 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com [149.81.74.108])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h83h3yhkh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Jul 2022 03:49:48 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
	by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26B3LkH6027525;
	Mon, 11 Jul 2022 03:49:46 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
	by ppma05fra.de.ibm.com with ESMTP id 3h71a8sk2t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Jul 2022 03:49:46 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com [9.149.105.58])
	by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 26B3mHGp19399070
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 11 Jul 2022 03:48:17 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 94C294C046;
	Mon, 11 Jul 2022 03:49:43 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EDA484C044;
	Mon, 11 Jul 2022 03:49:40 +0000 (GMT)
Received: from li-e8dccbcc-2adc-11b2-a85c-bc1f33b9b810.ibm.com.com (unknown [9.43.105.173])
	by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon, 11 Jul 2022 03:49:40 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com
Subject: [PATCH 2/2] powerpc/kvm: Remove comment related to moving PMU code to perf subsystem 
Date: Mon, 11 Jul 2022 09:19:27 +0530
Message-Id: <20220711034927.213192-2-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220711034927.213192-1-kjain@linux.ibm.com>
References: <20220711034927.213192-1-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: xgPw-O1dJRFyk5V6S4h5HIPcXF91GMNI
X-Proofpoint-ORIG-GUID: aeZ8M1wlBQZd_xL5vyYoXQfYc8Ih4vSn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-10_18,2022-07-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 clxscore=1015 phishscore=0 spamscore=0
 suspectscore=0 mlxscore=0 mlxlogscore=999 priorityscore=1501 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207110013
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
Cc: kjain@linux.ibm.com, atrajeev@linux.vnet.ibm.com, maddy@linux.ibm.com, disgoel@linux.vnet.ibm.com, rnsastry@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit aabcaf6ae2a0 ("KVM: PPC: Book3S HV P9: Move host OS save/restore
functions to  built-in") added a comment in switch_pmu_to_guest
function, indicating possibility of moving PMU handling code
to perf subsystem. But perf subsystem code compilation depends upon
the enablement of CONFIG_PERF_EVENTS whereas, kvm code don't have
any dependency on this config.
Patch remove this comment as switch_pmu_to_guest functionality is
needed even if perf subsystem is disabled.

Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
---
 arch/powerpc/kvm/book3s_hv_p9_perf.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv_p9_perf.c b/arch/powerpc/kvm/book3s_hv_p9_perf.c
index da3135cab9ea..44d24cca3df1 100644
--- a/arch/powerpc/kvm/book3s_hv_p9_perf.c
+++ b/arch/powerpc/kvm/book3s_hv_p9_perf.c
@@ -44,12 +44,6 @@ void switch_pmu_to_guest(struct kvm_vcpu *vcpu,
 
 	/* Save host */
 	if (ppc_get_pmu_inuse()) {
-		/*
-		 * It might be better to put PMU handling (at least for the
-		 * host) in the perf subsystem because it knows more about what
-		 * is being used.
-		 */
-
 		/* POWER9, POWER10 do not implement HPMC or SPMC */
 
 		host_os_sprs->mmcr0 = mfspr(SPRN_MMCR0);
-- 
2.27.0

