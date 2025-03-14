Return-Path: <linuxppc-dev+bounces-7057-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E4BA6104E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Mar 2025 12:45:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZDjHK1v6Vz3cZL;
	Fri, 14 Mar 2025 22:45:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741952749;
	cv=none; b=WkwyOwL0gpcK4ifpDV9bmD3o+5PC9WuSc8mvDqP3wstEqMJ9JNJLPKRs9FLs6YD7/7bTDVaPTTkAtU3WmS62SWUTdh4JkvvsTJwY1WNDYT01MZbMtD4vjomAfWnLr6uMib2nkdlmHiJsAfg96o6xfPmzYakegDYnPNPMqCP+trvffzofvNyZctGT7CW49lyIj0Y5dYKKfIlq+S3WaiMN+RhAdzboN8MhQNRo4jfIA+wD3CC+VPxRTTzxTuW8URWn0IX+Rl4drn1PDI2oZ2hoAEs7slieDUdDn0xWorIGhstYxjdLI1b/xM+4e12CJ4t78nCKjjTJjoOgTXs6xvPkMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741952749; c=relaxed/relaxed;
	bh=Des5ngxLQ5668Zie0APp79mBo5Tmu7ME/Ak7Q/J8mj8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XIjg2fuk/xbHkqyXMCLIJfzjBEvNRL2svWA8XNKSmLHN/NC2v4EjiT5N7GHO352iSLEY2HWgRvBOUdcNzQdCliKmK/55k9PSmS88c6KKGQ2EceobdJ9xDjWdyCgfSLy5q7NfRfnzXV5AvGC4pkkxRp6WGspRbr8tW+6ORDJ3Mo2ZKgeZIjdyCzHKNp07zpiw4T8UvuZrgkLtKVPYl7+oN9TlGw/xA/cL0IU7VEn9b6nuoZvfPRoJPd4jbKYfym0kQH1ETQWVT2EOE3jTkWSXvGeOB63L3P+BA8gV1vmPI4Gn5WTXVWOmUlDXyhjHctPMybAY0iiv3sGrK7V7GV0AZQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BM+3PSS6; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BM+3PSS6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZDjHJ4NB8z30gC
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Mar 2025 22:45:48 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52EB0m9O001939;
	Fri, 14 Mar 2025 11:45:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=Des5ngxLQ5668Zie0
	APp79mBo5Tmu7ME/Ak7Q/J8mj8=; b=BM+3PSS664XtoE3jB/+HGfpW4UqBF6PeC
	fLr8R8ctsOPHpfZspnyyIzRrzTR1Q4WpuFqzphGc+FSNs+G+G8Nl0r7v1stURQW1
	592QObhVja+xezF2+b3Z94DbPUR6sh8OBCPiCpiw/Vh38ElZQrZg2c1lDDNc0DIu
	Nj+orYNMkUHbxfKFZhQq487zmPbmEvbqM4Y1Ag76HQERGpAcEhut9AtDs9dg0cp+
	wJsZ9jguULTL9b8fNaM2HTj9Ws1eV4Y6yVrxxBosVFH5lwlYlfYQgvsH4/fEtp40
	ExHIQxGCR3/6JJekQNhS+CL5vYxdEHhcTnUCs7KkMq+8Kc0GKOEQg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45c6hpudkh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Mar 2025 11:45:36 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 52EBiRqg016764;
	Fri, 14 Mar 2025 11:45:35 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45c6hpudkf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Mar 2025 11:45:35 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 52E8WSE4015357;
	Fri, 14 Mar 2025 11:45:34 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 45atsppq7e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Mar 2025 11:45:34 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 52EBjVUA34865804
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 14 Mar 2025 11:45:31 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 410862004E;
	Fri, 14 Mar 2025 11:45:31 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DC6722004B;
	Fri, 14 Mar 2025 11:45:27 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.39.22.126])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 14 Mar 2025 11:45:27 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Cc: sshegde@linux.ibm.com, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        mpe@ellerman.id.au, peterz@infradead.org, fbarrat@linux.ibm.com,
        ajd@linux.ibm.com, mahesh@linux.ibm.com, oohall@gmail.com,
        hbathini@linux.ibm.com, dhowells@redhat.com, haren@linux.ibm.com,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/6] powerpc: fadump: use lock guard for mutex
Date: Fri, 14 Mar 2025 17:14:59 +0530
Message-ID: <20250314114502.2083434-4-sshegde@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250314114502.2083434-1-sshegde@linux.ibm.com>
References: <20250314114502.2083434-1-sshegde@linux.ibm.com>
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
X-Proofpoint-GUID: Jh4LPkSVlRClFZBVYA-cGyYUB2sB5r6N
X-Proofpoint-ORIG-GUID: SeRbKrqwDoY0QVWHWlC76RIQOVxC2jGl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-14_04,2025-03-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 impostorscore=0 adultscore=0
 mlxlogscore=711 malwarescore=0 bulkscore=0 clxscore=1015 spamscore=0
 phishscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503140091
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

use scoped_guard for scope based resource management of mutex.
This would make the code simpler and easier to maintain.

More details on lock guards can be found at
https://lore.kernel.org/all/20230612093537.614161713@infradead.org/T/#u

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
 arch/powerpc/kernel/fadump.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
index 4b371c738213..fc6c5275811e 100644
--- a/arch/powerpc/kernel/fadump.c
+++ b/arch/powerpc/kernel/fadump.c
@@ -1374,15 +1374,12 @@ static void fadump_free_elfcorehdr_buf(void)
 
 static void fadump_invalidate_release_mem(void)
 {
-	mutex_lock(&fadump_mutex);
-	if (!fw_dump.dump_active) {
-		mutex_unlock(&fadump_mutex);
-		return;
+	scoped_guard(mutex, &fadump_mutex) {
+		if (!fw_dump.dump_active)
+			return;
+		fadump_cleanup();
 	}
 
-	fadump_cleanup();
-	mutex_unlock(&fadump_mutex);
-
 	fadump_free_elfcorehdr_buf();
 	fadump_release_memory(fw_dump.boot_mem_top, memblock_end_of_DRAM());
 	fadump_free_cpu_notes_buf();
-- 
2.39.3


