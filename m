Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B8171F62B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Jun 2023 00:42:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QXLkC1rL7z3fms
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Jun 2023 08:42:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gi/THrff;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=gjoyce@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gi/THrff;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QXLch0M64z3fbG
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Jun 2023 08:37:55 +1000 (AEST)
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 351MKqK2020116;
	Thu, 1 Jun 2023 22:37:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=WmW5M4ibPZMS2bwVC5UNFf4vPtQxENZ32A6cAQDe5OE=;
 b=gi/THrfffVYYplSr/1Vyh0QANbljJQU5QCyLCAjKYOaHOVWajb1CnfXdI2/UscAsQo48
 XvSKwbP2baI5VsAlImFM7NK1ul5WdRbi7TecvdW3kjY2cnlOK8qjMzGE/pdjn0dSGNna
 RHEvaBDXVztH2SvpgL2LL/emJfOb3klpycpeSznq1dzFN4Q6WEqzfYZ/OSgS8c/PXLCG
 zwDFb4qjOKVqFP6XZct4jA0Rq7/gaX1fFO91QWO9+xc1SfSjQJ5wPuEP15PtYzcLvcJl
 Ijzs7QXTtNa6mUK3IBVMqTPYsZ+LdvE+Li6Sl/jkT95NprEfOiN5R+8+qrwmkqe2bSuz fA== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com [169.63.214.131])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qy4208am5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Jun 2023 22:37:48 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
	by ppma01dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 351L5mT4019405;
	Thu, 1 Jun 2023 22:37:47 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([9.208.130.99])
	by ppma01dal.us.ibm.com (PPS) with ESMTPS id 3qu9g73d29-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Jun 2023 22:37:47 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 351MbkLE38273720
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 1 Jun 2023 22:37:46 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9169058064;
	Thu,  1 Jun 2023 22:37:46 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 62F7058066;
	Thu,  1 Jun 2023 22:37:46 +0000 (GMT)
Received: from rhel-laptop.ibm.com (unknown [9.61.58.163])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  1 Jun 2023 22:37:46 +0000 (GMT)
From: gjoyce@linux.vnet.ibm.com
To: linux-block@vger.kernel.org
Subject: [PATCH v4 RESEND 2/3] block: sed-opal: Implement IOC_OPAL_REVERT_LSP
Date: Thu,  1 Jun 2023 17:37:44 -0500
Message-Id: <20230601223745.2136203-3-gjoyce@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230601223745.2136203-1-gjoyce@linux.vnet.ibm.com>
References: <20230601223745.2136203-1-gjoyce@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: c7nCuVtjQsMKFEZS1ZfymYIc1AkqOK2a
X-Proofpoint-GUID: c7nCuVtjQsMKFEZS1ZfymYIc1AkqOK2a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-01_08,2023-05-31_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 mlxlogscore=999 clxscore=1015
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2306010194
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
Cc: axboe@kernel.dk, gjoyce@linux.vnet.ibm.com, nayna@linux.ibm.com, keyrings@vger.kernel.org, jonathan.derrick@linux.dev, brking@linux.vnet.ibm.com, akpm@linux-foundation.org, msuchanek@suse.de, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Greg Joyce <gjoyce@linux.vnet.ibm.com>

This is used in conjunction with IOC_OPAL_REVERT_TPR to return a drive to
Original Factory State without erasing the data. If IOC_OPAL_REVERT_LSP
is called with opal_revert_lsp.options bit OPAL_PRESERVE set prior
to calling IOC_OPAL_REVERT_TPR, the drive global locking range will not
be erased.

Signed-off-by: Greg Joyce <gjoyce@linux.vnet.ibm.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Jonathan Derrick <jonathan.derrick@linux.dev>
---
 block/opal_proto.h            |  4 ++++
 block/sed-opal.c              | 40 +++++++++++++++++++++++++++++++++++
 include/linux/sed-opal.h      |  1 +
 include/uapi/linux/sed-opal.h | 11 ++++++++++
 4 files changed, 56 insertions(+)

diff --git a/block/opal_proto.h b/block/opal_proto.h
index 7152aa1f1a49..c3b5bff0b9e4 100644
--- a/block/opal_proto.h
+++ b/block/opal_proto.h
@@ -215,6 +215,10 @@ enum opal_parameter {
 	OPAL_SUM_SET_LIST = 0x060000,
 };
 
+enum opal_revertlsp {
+	OPAL_KEEP_GLOBAL_RANGE_KEY = 0x060000,
+};
+
 /* Packets derived from:
  * TCG_Storage_Architecture_Core_Spec_v2.01_r1.00
  * Secion: 3.2.3 ComPackets, Packets & Subpackets
diff --git a/block/sed-opal.c b/block/sed-opal.c
index b55a8eb29f5b..5b277eaabbc7 100644
--- a/block/sed-opal.c
+++ b/block/sed-opal.c
@@ -1634,6 +1634,26 @@ static int internal_activate_user(struct opal_dev *dev, void *data)
 	return finalize_and_send(dev, parse_and_check_status);
 }
 
+static int revert_lsp(struct opal_dev *dev, void *data)
+{
+	struct opal_revert_lsp *rev = data;
+	int err;
+
+	err = cmd_start(dev, opaluid[OPAL_THISSP_UID],
+			opalmethod[OPAL_REVERTSP]);
+	add_token_u8(&err, dev, OPAL_STARTNAME);
+	add_token_u64(&err, dev, OPAL_KEEP_GLOBAL_RANGE_KEY);
+	add_token_u8(&err, dev, (rev->options & OPAL_PRESERVE) ?
+			OPAL_TRUE : OPAL_FALSE);
+	add_token_u8(&err, dev, OPAL_ENDNAME);
+	if (err) {
+		pr_debug("Error building REVERT SP command.\n");
+		return err;
+	}
+
+	return finalize_and_send(dev, parse_and_check_status);
+}
+
 static int erase_locking_range(struct opal_dev *dev, void *data)
 {
 	struct opal_session_info *session = data;
@@ -2275,6 +2295,23 @@ static int opal_get_discv(struct opal_dev *dev, struct opal_discovery *discv)
 	return discv->size; /* modified to actual length of data */
 }
 
+static int opal_revertlsp(struct opal_dev *dev, struct opal_revert_lsp *rev)
+{
+	/* controller will terminate session */
+	const struct opal_step steps[] = {
+		{ start_admin1LSP_opal_session, &rev->key },
+		{ revert_lsp, rev }
+	};
+	int ret;
+
+	mutex_lock(&dev->dev_lock);
+	setup_opal_dev(dev);
+	ret = execute_steps(dev, steps, ARRAY_SIZE(steps));
+	mutex_unlock(&dev->dev_lock);
+
+	return ret;
+}
+
 static int opal_erase_locking_range(struct opal_dev *dev,
 				    struct opal_session_info *opal_session)
 {
@@ -2842,6 +2879,9 @@ int sed_ioctl(struct opal_dev *dev, unsigned int cmd, void __user *arg)
 	case IOC_OPAL_GET_STATUS:
 		ret = opal_get_status(dev, arg);
 		break;
+	case IOC_OPAL_REVERT_LSP:
+		ret = opal_revertlsp(dev, p);
+		break;
 	case IOC_OPAL_DISCOVERY:
 		ret = opal_get_discv(dev, p);
 		break;
diff --git a/include/linux/sed-opal.h b/include/linux/sed-opal.h
index 8e824ab908e9..bf2f9d7e11eb 100644
--- a/include/linux/sed-opal.h
+++ b/include/linux/sed-opal.h
@@ -46,6 +46,7 @@ static inline bool is_sed_ioctl(unsigned int cmd)
 	case IOC_OPAL_GENERIC_TABLE_RW:
 	case IOC_OPAL_GET_STATUS:
 	case IOC_OPAL_DISCOVERY:
+	case IOC_OPAL_REVERT_LSP:
 		return true;
 	}
 	return false;
diff --git a/include/uapi/linux/sed-opal.h b/include/uapi/linux/sed-opal.h
index 98f216cf2241..720725f1c42a 100644
--- a/include/uapi/linux/sed-opal.h
+++ b/include/uapi/linux/sed-opal.h
@@ -56,6 +56,10 @@ struct opal_key {
 	__u8 key[OPAL_KEY_MAX];
 };
 
+enum opal_revert_lsp_opts {
+	OPAL_PRESERVE = 0x01,
+};
+
 struct opal_lr_act {
 	struct opal_key key;
 	__u32 sum;
@@ -156,6 +160,12 @@ struct opal_discovery {
 	__u64 size;
 };
 
+struct opal_revert_lsp {
+	struct opal_key key;
+	__u32 options;
+	__u32 __pad;
+};
+
 #define IOC_OPAL_SAVE		    _IOW('p', 220, struct opal_lock_unlock)
 #define IOC_OPAL_LOCK_UNLOCK	    _IOW('p', 221, struct opal_lock_unlock)
 #define IOC_OPAL_TAKE_OWNERSHIP	    _IOW('p', 222, struct opal_key)
@@ -174,5 +184,6 @@ struct opal_discovery {
 #define IOC_OPAL_GENERIC_TABLE_RW   _IOW('p', 235, struct opal_read_write_table)
 #define IOC_OPAL_GET_STATUS         _IOR('p', 236, struct opal_status)
 #define IOC_OPAL_DISCOVERY          _IOW('p', 237, struct opal_discovery)
+#define IOC_OPAL_REVERT_LSP         _IOW('p', 238, struct opal_revert_lsp)
 
 #endif /* _UAPI_SED_OPAL_H */
-- 
gjoyce@linux.vnet.ibm.com

