Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD8F29FAAD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Oct 2020 02:43:09 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CMlSV3Jh1zDqlS
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Oct 2020 12:43:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Dpsikl9V; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CMkvz5YJ4zDqk8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Oct 2020 12:18:23 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09U11rmW157832
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Oct 2020 21:18:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=5EBdFNtrDR+9K9PXdBGtwkPPLbXF+eqhePpUTyYjB5Y=;
 b=Dpsikl9VfAK3opxfssiNrM2GUuu82+kSzWvKqUhAj5m8ukhNmDxV/EFDG1wM4ZG5hPgv
 n9WByHN4yKng7fIn/XfC38VznmD81EcZ66eASbLY9aYmaMQAnkMmw/APWdyk1rmzzsm9
 b0LMKI0qs1iW6D2Diav8ubrJWQgfFds9DB9O68gwil97tHeI/zq/MgAy+yUC/DlXXCCB
 Etv2yomuf/ins1s3ec8PDcj7gvbUMPnZ5uYwixN2/iS6Fu8MaqYzlqxNr3k0pl+opwf6
 HbxqnjyIGVFtMmSCeuybWQQ+kBGPQmvpPnRsvFJL4SmamyT9V02RhSZ8pn3kk5915mjj Lw== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 34g3kkh5ch-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Oct 2020 21:18:21 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09U1HFa1000730
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Oct 2020 01:18:20 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma02dal.us.ibm.com with ESMTP id 34e1gpc5c6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Oct 2020 01:18:20 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 09U1IDiG3736064
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 30 Oct 2020 01:18:13 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 18EB6C605B;
 Fri, 30 Oct 2020 01:18:19 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B755CC6057;
 Fri, 30 Oct 2020 01:18:18 +0000 (GMT)
Received: from localhost (unknown [9.65.225.148])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 30 Oct 2020 01:18:18 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 14/29] powerpc/pseries/mobility: signal suspend cancellation
 to platform
Date: Thu, 29 Oct 2020 20:17:50 -0500
Message-Id: <20201030011805.1224603-15-nathanl@linux.ibm.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20201030011805.1224603-1-nathanl@linux.ibm.com>
References: <20201030011805.1224603-1-nathanl@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-10-29_12:2020-10-29,
 2020-10-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 mlxscore=0 mlxlogscore=919
 phishscore=0 bulkscore=0 malwarescore=0 impostorscore=0 spamscore=0
 adultscore=0 suspectscore=1 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2010300001
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
Cc: tyreld@linux.ibm.com, ajd@linux.ibm.com, mmc@linux.vnet.ibm.com,
 cforno12@linux.vnet.ibm.com, drt@linux.vnet.ibm.com, brking@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

If we're returning an error to user space, use H_VASI_SIGNAL to send a
cancellation request to the platform. This isn't strictly required but
it communicates that Linux will not attempt to complete the suspend,
which allows the various entities involved to promptly end the
operation in progress.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/mobility.c | 31 +++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/powerpc/platforms/pseries/mobility.c b/arch/powerpc/platforms/pseries/mobility.c
index 44ca7d4e143d..0f592246f345 100644
--- a/arch/powerpc/platforms/pseries/mobility.c
+++ b/arch/powerpc/platforms/pseries/mobility.c
@@ -520,6 +520,35 @@ static int do_join(void *arg)
 	return ret;
 }
 
+/*
+ * Abort reason code byte 0. We use only the 'Migrating partition' value.
+ */
+enum vasi_aborting_entity {
+	ORCHESTRATOR        = 1,
+	VSP_SOURCE          = 2,
+	PARTITION_FIRMWARE  = 3,
+	PLATFORM_FIRMWARE   = 4,
+	VSP_TARGET          = 5,
+	MIGRATING_PARTITION = 6,
+};
+
+static void pseries_cancel_migration(u64 handle, int err)
+{
+	u32 reason_code;
+	u32 detail;
+	u8 entity;
+	long hvrc;
+
+	entity = MIGRATING_PARTITION;
+	detail = abs(err) & 0xffffff;
+	reason_code = (entity << 24) | detail;
+
+	hvrc = plpar_hcall_norets(H_VASI_SIGNAL, handle,
+				  H_VASI_SIGNAL_CANCEL, reason_code);
+	if (hvrc)
+		pr_err("H_VASI_SIGNAL error: %ld\n", hvrc);
+}
+
 static int pseries_migrate_partition(u64 handle)
 {
 	atomic_t counter = ATOMIC_INIT(0);
@@ -532,6 +561,8 @@ static int pseries_migrate_partition(u64 handle)
 	ret = stop_machine(do_join, &counter, cpu_online_mask);
 	if (ret == 0)
 		post_mobility_fixup();
+	else
+		pseries_cancel_migration(handle, ret);
 out:
 	return ret;
 }
-- 
2.25.4

