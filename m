Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1BEB78A6BD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Aug 2023 09:48:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=V+5QYrFS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RZ2kG3x7Nz3bTt
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Aug 2023 17:48:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=V+5QYrFS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RZ2hR5DVyz30Yc
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Aug 2023 17:47:19 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37S76DoB007890;
	Mon, 28 Aug 2023 07:47:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=rk9qc634m4wBlqc9BjXeCjROox+VQ1Jebp9nLAehutA=;
 b=V+5QYrFSVbi3r+hy1D518YYUQ6qPO53f18VfYMpZxVgawnZTuPWPWCb2GTzh6sePcj07
 dyEGRERUznezKgnLOcvrJcpoTA5ngsSd3RP2YmDCrio+dTobkfVSfis7K9f4B2cSQWAJ
 QEZ/WF2ksPkM1odYe+6i87zuI/CyVpKSCVS5ymD8Hb4vlgPW4jwKzP3UN0cinr+FMQWD
 xN0TF7Sfiv1otm5slt6TBMy6QzywiUyKgEdWrkihc4heyMpw9Y0gy14+clOmTvCQL1Dx
 qLRbNWKFzwnR5k6dbb59xV7XuEHYhHikF0+Fsf990XhSBXAJAeq8ZSRm43OK/+7ZWDzJ hg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sr51tgvqm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Aug 2023 07:47:11 +0000
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 37S76Ntv010527;
	Mon, 28 Aug 2023 07:47:10 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sr51tgvqb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Aug 2023 07:47:10 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 37S6DIdn019181;
	Mon, 28 Aug 2023 07:47:09 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([172.16.1.74])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3sqxe18e4c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Aug 2023 07:47:09 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 37S7l8BG62587244
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Aug 2023 07:47:08 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AA03358058;
	Mon, 28 Aug 2023 07:47:08 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id ED8DA58059;
	Mon, 28 Aug 2023 07:47:05 +0000 (GMT)
Received: from skywalker.in.ibm.com (unknown [9.109.212.144])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 28 Aug 2023 07:47:05 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu
Subject: [PATCH 2/2] powerpc/mm/book3s64: Use 256M as the upper limit with coherent device memory attached
Date: Mon, 28 Aug 2023 13:16:58 +0530
Message-ID: <20230828074658.59553-2-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230828074658.59553-1-aneesh.kumar@linux.ibm.com>
References: <20230828074658.59553-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: xY-SyVZFnRDABFDtOgEhw6R8yON7GUgp
X-Proofpoint-ORIG-GUID: nx6D86k3kNL7onL_WNNxy5EPWgniJuPk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-28_04,2023-08-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0
 mlxscore=0 mlxlogscore=999 clxscore=1015 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2308280068
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, foraker1@llnl.gov, Reza Arbab <arbab@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

commit 4d15721177d5 ("powerpc/mm: Cleanup memory block size probing")
used 256MB as the memory block size when we have
ibm,coherent-device-memory device tree node present. Instead of
returning with 256MB memory block size, continue to check the rest of the memory
regions and make sure we can still map them using a 256MB memory block size.

Fixes: 4d15721177d5 ("powerpc/mm: Cleanup memory block size probing")
Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/mm/init_64.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/mm/init_64.c b/arch/powerpc/mm/init_64.c
index e3d7379ef480..a8557867ece0 100644
--- a/arch/powerpc/mm/init_64.c
+++ b/arch/powerpc/mm/init_64.c
@@ -569,8 +569,12 @@ static int __init probe_memory_block_size(unsigned long node, const char *uname,
 		 */
 		compatible = of_get_flat_dt_prop(node, "compatible", NULL);
 		if (compatible && !strcmp(compatible, "ibm,coherent-device-memory")) {
-			*block_size = SZ_256M;
-			return 1;
+			if (*block_size > SZ_256M)
+				*block_size = SZ_256M;
+			/*
+			 * We keep 256M as the upper limit with GPU present.
+			 */
+			return 0;
 		}
 	}
 	/* continue looking for other memory device types */
-- 
2.41.0

