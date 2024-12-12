Return-Path: <linuxppc-dev+bounces-4034-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 176359EE09A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Dec 2024 08:51:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y84R90bfsz30Sw;
	Thu, 12 Dec 2024 18:51:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733989877;
	cv=none; b=MGgW38SE8PldZHyjcmLsYtBsz2uN2WWnMOR93eSMRSZ7o4KvU/GA7bfDANSpfWMXldn/YbpBzCOfyznAp6dj0UYvyjugr7GKHnADaFlY/VXaWWb9qs7ztejZ4Rxp/4zTrSKxHEUw2Fw49DznoE6tzxBVDNTo0Gt8RmmRFPOvdESmTFavahQGFDuE1gQfyrSoZm9uyusUgZr+DNT+9fad60xMV+7v31wzgbMsC3+pfslRP6YjIkG29vdix21OY7DZbPfaozsmedLTQBHQ6+ok1CbRE2T0aXvSJROU3Xk5INHPejlfNDKSPYy0cKjNFkIt2C1/cIkwsQszxBlOEA8oLA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733989877; c=relaxed/relaxed;
	bh=yZ4MeYQw/1ZkuXeIVBNsIkvrnQTLTnryS0nM9q1mRL4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IAJ29nj37TwtbrRQE5SWM4NxrAEVJzGX5OXwO2s0ExnJ0Kd4CjmhRc6prqw3dxBTY0LE2Gs1JjZx9RC4xN2EBP/52ZOjFMtsj5BRD/puL2CvI2EpMumnXRjaWYVYX518XidUyrq1VXG1fACn24mLldyP5BY0G8uzyCVIsJPq+JTmpDnGiiVkfDfpK9u7HdcG0gPtQeOxPahq9C8PQ9SmWDFSaimvrLVNGwsNpeoXj7HuOxFG14W1VG8Z5kzewaWqsiLs7GM7xQrGB0JOXLWB1EA17aK10lAwa+9MByY5Kr+FD+2YlLLA3ERvkh6WpRJ5QHLCRA+HOrApYLFEgJmgsw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=W5KCL8FU; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nnmlinux@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=W5KCL8FU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nnmlinux@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y84R74c7hz30St
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Dec 2024 18:51:15 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BC6HeLb029772;
	Thu, 12 Dec 2024 07:51:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=yZ4MeYQw/1ZkuXeIVBNsIkvrnQTLTnryS0nM9q1mR
	L4=; b=W5KCL8FU8QStWQHSz7TOAjpvjK8iK+YQPgS11ets7NT4WyymJEVFBlX4T
	eSnvgxtm/svp/onAJh4GpSUM7olRYXtmLQ5pIl0ll0bUJvIGNsbrCuYEP2lkPXtj
	nPUwZ5oDFsGdMtJ6XVSyssKZZuWmXNNl7xW3251xwWffM6U2C6MIXO85XkLQVUoR
	yR2Gjv9zq0ohbSt4LZK5IgQYhKjOPb0Yxt2bK/gS351d41psIx6ymLp5dNU3sQHh
	vZCI1avn7cLUXZ7c/2DTKOrK9WvIPqzLS6oOdEEBeMg+yyLhNsUOzNYVcn5JqShQ
	CJ5jvbxSc6OpJJhfKrd2NtIkEv5aA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43ccsjsgh8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 07:51:01 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4BC7k0Pv020322;
	Thu, 12 Dec 2024 07:51:00 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43ccsjsgh6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 07:51:00 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4BC7ZRTr018611;
	Thu, 12 Dec 2024 07:50:59 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 43d26kpx50-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 07:50:59 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4BC7otib49545496
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 12 Dec 2024 07:50:55 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B6BCD2004B;
	Thu, 12 Dec 2024 07:50:55 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AFF4720043;
	Thu, 12 Dec 2024 07:50:53 +0000 (GMT)
Received: from ltcrain34-lp2.aus.stglabs.ibm.com (unknown [9.3.101.41])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 12 Dec 2024 07:50:53 +0000 (GMT)
From: Narayana Murty N <nnmlinux@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au,
        linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org, mahesh@linux.ibm.com, oohall@gmail.com,
        npiggin@gmail.com, christophe.leroy@csgroup.eu, maddy@linux.ibm.com,
        naveen@kernel.org, vaibhav@linux.ibm.com, ganeshgr@linux.ibm.com,
        sbhat@linux.ibm.com
Subject: [PATCH v2] powerpc/pseries/eeh: Fix get PE state translation
Date: Thu, 12 Dec 2024 01:50:43 -0600
Message-ID: <20241212075044.10563-1-nnmlinux@linux.ibm.com>
X-Mailer: git-send-email 2.47.1
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
X-Proofpoint-GUID: 3K_beW4bd-4YUxXt79MV5W5H4IgfnmmR
X-Proofpoint-ORIG-GUID: 8E852y98kTwKlGwixTi9KHvSqMAhdRWd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 adultscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=968
 mlxscore=0 priorityscore=1501 suspectscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412120050
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The PE Reset State "0" obtained from RTAS calls
ibm_read_slot_reset_[state|state2] indicates that
the Reset is deactivated and the PE is not in the MMIO
Stopped or DMA Stopped state.

With PE Reset State "0", the MMIO and DMA is allowed for
the PE. The function pseries_eeh_get_state() is currently
not indicating that to the caller because of  which the
drivers are unable to resume the MMIO and DMA activity.
The patch fixes that by reflecting what is actually allowed.

Fixes: 00ba05a12b3c ("powerpc/pseries: Cleanup on pseries_eeh_get_state()")
Signed-off-by: Narayana Murty N <nnmlinux@linux.ibm.com>

---
Changelog:
V1:https://lore.kernel.org/all/20241107042027.338065-1-nnmlinux@linux.ibm.com/
--added Fixes tag for "powerpc/pseries: Cleanup on
pseries_eeh_get_state()".
---
 arch/powerpc/platforms/pseries/eeh_pseries.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/eeh_pseries.c b/arch/powerpc/platforms/pseries/eeh_pseries.c
index 1893f66371fa..b12ef382fec7 100644
--- a/arch/powerpc/platforms/pseries/eeh_pseries.c
+++ b/arch/powerpc/platforms/pseries/eeh_pseries.c
@@ -580,8 +580,10 @@ static int pseries_eeh_get_state(struct eeh_pe *pe, int *delay)
 
 	switch(rets[0]) {
 	case 0:
-		result = EEH_STATE_MMIO_ACTIVE |
-			 EEH_STATE_DMA_ACTIVE;
+		result = EEH_STATE_MMIO_ACTIVE	|
+			 EEH_STATE_DMA_ACTIVE	|
+			 EEH_STATE_MMIO_ENABLED	|
+			 EEH_STATE_DMA_ENABLED;
 		break;
 	case 1:
 		result = EEH_STATE_RESET_ACTIVE |
-- 
2.47.1


