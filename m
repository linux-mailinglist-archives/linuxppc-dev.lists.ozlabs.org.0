Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D1C2B6E9A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Nov 2020 20:27:26 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CbGDC2vZFzDqS7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Nov 2020 06:27:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=tyreld@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=KRpsbxw9; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CbFzz2KzQzDqRn
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Nov 2020 06:16:46 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AHJ1s38102454; Tue, 17 Nov 2020 14:16:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=kZcCssClMXjy8GLiSfEkjuGbeDo2rfIlZZxOvMfHqYA=;
 b=KRpsbxw9lgmIMOk4aEO6q5v6c7RbQtyqP/A+uEvuoJpD+Fn4vxNNNvlWBPpAnnHY+gmR
 RWDmKko/jlYihmYfRBN8YusOsorN08cgXHLR8oYCz0EJ4Wt0kxEPTC1oUDuSUlUyfX4H
 mxCqNTRYwq8wT9CmrQlRoTLadEnDb2bgXGP9k/DP88gSz67D0zNTNbaxqrXZQgFmTCex
 E9xoQK2bR8uq+gKzo+YniouJouhF8l8KAwRs3z7tdFd1DJJeSr0IMwvgwjGN9tdl+obP
 GSk+9oZV/jOepMNeq5N3LLEkm5OUEO5RDH5p5AIElWPmQGrXfDO3Ax7hwlGSYaGygIWy 1g== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34vexst7jk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Nov 2020 14:16:44 -0500
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AHJ7m74013151;
 Tue, 17 Nov 2020 19:16:42 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma03dal.us.ibm.com with ESMTP id 34t6v9evv6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Nov 2020 19:16:42 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AHJGeOm26018048
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 17 Nov 2020 19:16:40 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8961CC6057;
 Tue, 17 Nov 2020 19:16:40 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 25C8EC6055;
 Tue, 17 Nov 2020 19:16:40 +0000 (GMT)
Received: from vios4361.aus.stglabs.ibm.com (unknown [9.3.43.61])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 17 Nov 2020 19:16:40 +0000 (GMT)
From: Tyrel Datwyler <tyreld@linux.ibm.com>
To: james.bottomley@hansenpartnership.com
Subject: [PATCH v2 3/6] ibmvfc: add helper for testing capability flags
Date: Tue, 17 Nov 2020 13:16:33 -0600
Message-Id: <20201117191636.131127-4-tyreld@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201117191636.131127-1-tyreld@linux.ibm.com>
References: <20201117191636.131127-1-tyreld@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-17_07:2020-11-17,
 2020-11-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0
 phishscore=0 mlxlogscore=999 malwarescore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 mlxscore=0
 suspectscore=1 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011170133
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>, martin.petersen@oracle.com,
 linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, brking@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Testing the NPIV Login response capabilities is a long winded process of
dereferencing the vhost->login_buf->resp.capabilities field byte
swapping that value to host endian and performing the bitwise test.
Currently we only ever check this in ibmvfc_cancel_all(), but follow-up
patches will need to regularly check for targetWWPN and channelization
support.

Add a helper to simplify checking various VIOS capabilities.

Signed-off-by: Tyrel Datwyler <tyreld@linux.ibm.com>
---
 drivers/scsi/ibmvscsi/ibmvfc.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/scsi/ibmvscsi/ibmvfc.c b/drivers/scsi/ibmvscsi/ibmvfc.c
index d33b24668367..a68602cd1255 100644
--- a/drivers/scsi/ibmvscsi/ibmvfc.c
+++ b/drivers/scsi/ibmvscsi/ibmvfc.c
@@ -138,6 +138,13 @@ static void ibmvfc_tgt_move_login(struct ibmvfc_target *);
 
 static const char *unknown_error = "unknown error";
 
+static int ibmvfc_check_caps(struct ibmvfc_host *vhost, unsigned long cap_flags)
+{
+	u64 host_caps = be64_to_cpu(vhost->login_buf->resp.capabilities);
+
+	return (host_caps & cap_flags) ? 1 : 0;
+}
+
 #ifdef CONFIG_SCSI_IBMVFC_TRACE
 /**
  * ibmvfc_trc_start - Log a start trace entry
@@ -2240,7 +2247,7 @@ static int ibmvfc_cancel_all(struct scsi_device *sdev, int type)
 		tmf->common.length = cpu_to_be16(sizeof(*tmf));
 		tmf->scsi_id = cpu_to_be64(rport->port_id);
 		int_to_scsilun(sdev->lun, &tmf->lun);
-		if (!(be64_to_cpu(vhost->login_buf->resp.capabilities) & IBMVFC_CAN_SUPPRESS_ABTS))
+		if (!ibmvfc_check_caps(vhost, IBMVFC_CAN_SUPPRESS_ABTS))
 			type &= ~IBMVFC_TMF_SUPPRESS_ABTS;
 		if (vhost->state == IBMVFC_ACTIVE)
 			tmf->flags = cpu_to_be32((type | IBMVFC_TMF_LUA_VALID));
-- 
2.27.0

