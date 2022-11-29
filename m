Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0209B63CBC8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Nov 2022 00:27:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NMJQG6H6bz3bY2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Nov 2022 10:27:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=H0IkPhPL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=gjoyce@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=H0IkPhPL;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NMJNL4vQhz2xVr
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Nov 2022 10:25:22 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2ATNEQSs005810;
	Tue, 29 Nov 2022 23:25:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=x+EDMuZY24srdsEE8MGJsP3YeakQaMinbcmq3ihxGwc=;
 b=H0IkPhPLKyDSPGxg+uobkjA/vm1OUv7NCikbbb+P7HIyYr8zVjyFnX00e4yly3rrrWSO
 IrlkWSuSSOUK/fSpsNfyVQQcJ3kkBI015h38mRNyWow/LylRSu8Nl2NWuwzsXXhSPxI+
 RnDbsg1K6/DZzvB2NUTkTu48nPfIG8u27VfL/v/lYvrFghsdatSAZSCyx+wR0vz7zb3c
 fHN+HMsLRMFMskRGD/gwSDJ5vWzgWBYTMnAiXHaq2KAn/KyDkKEBZLR8ovsKf682UCAB
 2SEZWeR4SxK2EEmhunSqYhrDx2VYZyEeWwWiy6H4fSFtTcsiAFwp3bkNq3+U8DJhVAaP ng== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com [169.47.144.26])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m5rwq479b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Nov 2022 23:25:13 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
	by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2ATNLINf016219;
	Tue, 29 Nov 2022 23:25:12 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com [9.57.198.26])
	by ppma04wdc.us.ibm.com with ESMTP id 3m3ae9r4vv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Nov 2022 23:25:12 +0000
Received: from smtpav03.dal12v.mail.ibm.com ([9.208.128.129])
	by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2ATNPBMd37421382
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 29 Nov 2022 23:25:11 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 21A2D5806F;
	Tue, 29 Nov 2022 23:25:11 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0D4E758068;
	Tue, 29 Nov 2022 23:25:10 +0000 (GMT)
Received: from rhel-laptop.ibm.com.com (unknown [9.160.99.100])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 29 Nov 2022 23:25:09 +0000 (GMT)
From: gjoyce@linux.vnet.ibm.com
To: linux-block@vger.kernel.org
Subject: [PATCH v3 1/3] block: sed-opal: Implement IOC_OPAL_DISCOVERY
Date: Tue, 29 Nov 2022 17:25:04 -0600
Message-Id: <20221129232506.3735672-2-gjoyce@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20221129232506.3735672-1-gjoyce@linux.vnet.ibm.com>
References: <20221129232506.3735672-1-gjoyce@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: CI1Nq931h1llOiSugoSwN8Lpd79DC0tn
X-Proofpoint-ORIG-GUID: CI1Nq931h1llOiSugoSwN8Lpd79DC0tn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-29_13,2022-11-29_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 spamscore=0
 adultscore=0 malwarescore=0 mlxscore=0 suspectscore=0 mlxlogscore=999
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211290138
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

Add IOC_OPAL_DISCOVERY ioctl to return raw discovery data to a SED Opal
application. This allows the application to display drive capabilities
and state.

Signed-off-by: Greg Joyce <gjoyce@linux.vnet.ibm.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Jonathan Derrick <jonathan.derrick@linux.dev>
---
 block/sed-opal.c              | 38 ++++++++++++++++++++++++++++++++---
 include/linux/sed-opal.h      |  1 +
 include/uapi/linux/sed-opal.h |  6 ++++++
 3 files changed, 42 insertions(+), 3 deletions(-)

diff --git a/block/sed-opal.c b/block/sed-opal.c
index 9bdb833e5817..0e65ac0cd69e 100644
--- a/block/sed-opal.c
+++ b/block/sed-opal.c
@@ -457,8 +457,11 @@ static int execute_steps(struct opal_dev *dev,
 	return error;
 }
 
-static int opal_discovery0_end(struct opal_dev *dev)
+static int opal_discovery0_end(struct opal_dev *dev, void *data)
 {
+	struct opal_discovery *discv_out = data; /* may be NULL */
+	u8 __user *buf_out;
+	u64 len_out;
 	bool found_com_id = false, supported = true, single_user = false;
 	const struct d0_header *hdr = (struct d0_header *)dev->resp;
 	const u8 *epos = dev->resp, *cpos = dev->resp;
@@ -474,6 +477,15 @@ static int opal_discovery0_end(struct opal_dev *dev)
 		return -EFAULT;
 	}
 
+	if (discv_out) {
+		buf_out = (u8 __user *)(uintptr_t)discv_out->data;
+		len_out = min_t(u64, discv_out->size, hlen);
+		if (buf_out && copy_to_user(buf_out, dev->resp, len_out))
+			return -EFAULT;
+
+		discv_out->size = hlen; /* actual size of data */
+	}
+
 	epos += hlen; /* end of buffer */
 	cpos += sizeof(*hdr); /* current position on buffer */
 
@@ -557,13 +569,13 @@ static int opal_discovery0(struct opal_dev *dev, void *data)
 	if (ret)
 		return ret;
 
-	return opal_discovery0_end(dev);
+	return opal_discovery0_end(dev, data);
 }
 
 static int opal_discovery0_step(struct opal_dev *dev)
 {
 	const struct opal_step discovery0_step = {
-		opal_discovery0,
+		opal_discovery0, NULL
 	};
 
 	return execute_step(dev, &discovery0_step, 0);
@@ -2245,6 +2257,22 @@ static int opal_secure_erase_locking_range(struct opal_dev *dev,
 	return ret;
 }
 
+static int opal_get_discv(struct opal_dev *dev, struct opal_discovery *discv)
+{
+	const struct opal_step discovery0_step = {
+		opal_discovery0, discv
+	};
+	int ret = 0;
+
+	mutex_lock(&dev->dev_lock);
+	setup_opal_dev(dev);
+	ret = execute_step(dev, &discovery0_step, 0);
+	mutex_unlock(&dev->dev_lock);
+	if (ret)
+		return ret;
+	return discv->size; /* modified to actual length of data */
+}
+
 static int opal_erase_locking_range(struct opal_dev *dev,
 				    struct opal_session_info *opal_session)
 {
@@ -2773,6 +2801,10 @@ int sed_ioctl(struct opal_dev *dev, unsigned int cmd, void __user *arg)
 	case IOC_OPAL_GET_STATUS:
 		ret = opal_get_status(dev, arg);
 		break;
+	case IOC_OPAL_DISCOVERY:
+		ret = opal_get_discv(dev, p);
+		break;
+
 	default:
 		break;
 	}
diff --git a/include/linux/sed-opal.h b/include/linux/sed-opal.h
index 6f837bb6c715..ef62e9292b27 100644
--- a/include/linux/sed-opal.h
+++ b/include/linux/sed-opal.h
@@ -44,6 +44,7 @@ static inline bool is_sed_ioctl(unsigned int cmd)
 	case IOC_OPAL_WRITE_SHADOW_MBR:
 	case IOC_OPAL_GENERIC_TABLE_RW:
 	case IOC_OPAL_GET_STATUS:
+	case IOC_OPAL_DISCOVERY:
 		return true;
 	}
 	return false;
diff --git a/include/uapi/linux/sed-opal.h b/include/uapi/linux/sed-opal.h
index 2573772e2fb3..fb6f7fa1e3fd 100644
--- a/include/uapi/linux/sed-opal.h
+++ b/include/uapi/linux/sed-opal.h
@@ -144,6 +144,11 @@ struct opal_status {
 	__u32 reserved;
 };
 
+struct opal_discovery {
+	__u64 data;
+	__u64 size;
+};
+
 #define IOC_OPAL_SAVE		    _IOW('p', 220, struct opal_lock_unlock)
 #define IOC_OPAL_LOCK_UNLOCK	    _IOW('p', 221, struct opal_lock_unlock)
 #define IOC_OPAL_TAKE_OWNERSHIP	    _IOW('p', 222, struct opal_key)
@@ -161,5 +166,6 @@ struct opal_status {
 #define IOC_OPAL_WRITE_SHADOW_MBR   _IOW('p', 234, struct opal_shadow_mbr)
 #define IOC_OPAL_GENERIC_TABLE_RW   _IOW('p', 235, struct opal_read_write_table)
 #define IOC_OPAL_GET_STATUS         _IOR('p', 236, struct opal_status)
+#define IOC_OPAL_DISCOVERY          _IOW('p', 237, struct opal_discovery)
 
 #endif /* _UAPI_SED_OPAL_H */
-- 
gjoyce@linux.vnet.ibm.com

