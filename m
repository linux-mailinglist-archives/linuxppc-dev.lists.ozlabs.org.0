Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA135985C8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Aug 2022 16:32:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M7nRT1cfqz3f2X
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Aug 2022 00:32:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YSw3eVUV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=gjoyce@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YSw3eVUV;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M7nPL6jnlz3bqn
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Aug 2022 00:31:02 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27IEMRiC011807;
	Thu, 18 Aug 2022 14:30:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=q+xuCAT8Dq2xaBP3fkQXIIwvZvm8PlLRevWJ8ZGNlhU=;
 b=YSw3eVUV2zGsknzQVm6j3m1EOBW3g0I1pYbtvyiUcaXbKVk64IwOj2dhhBNkWB/hNabs
 JI6mhM24Ja6+FSofiNltD9nWBMsjmukrQeBcgs4y5SyHgmrxw988qJji6CmrcaRZdzra
 4N6xL6Ze6xpV+agY6e9s/PMhqztJ2nqOwJMIG5gHOIoQS4ktHISBsBXY4dbDmzVp5Skp
 olrHdB9qXvpsoCvXXDikrLbD5gzrttRb6SWHFOLmIqe4yZyjlwytp0pdFhTB1p/IaBH0
 b2uuyBUyuHNrElX01JXRDaHt1/kKAFOdOLAbAfMuRtucWuLXPXm3Q3cUu/k3DawwVmNU 8Q== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com [169.55.91.170])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3j1q4e08mm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Aug 2022 14:30:52 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
	by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27IEK2og030461;
	Thu, 18 Aug 2022 14:30:51 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
	by ppma02wdc.us.ibm.com with ESMTP id 3hx3ka79p7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Aug 2022 14:30:51 +0000
Received: from b03ledav004.gho.boulder.ibm.com (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
	by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 27IEUoTf34013680
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 18 Aug 2022 14:30:50 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8EA0D7805C;
	Thu, 18 Aug 2022 14:30:50 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 648877805E;
	Thu, 18 Aug 2022 14:30:49 +0000 (GMT)
Received: from rhel-laptop.ibm.com.com (unknown [9.160.121.241])
	by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
	Thu, 18 Aug 2022 14:30:49 +0000 (GMT)
From: gjoyce@linux.vnet.ibm.com
To: linux-block@vger.kernel.org
Subject: [PATCH v2 1/3 RESEND] block: sed-opal: Implement IOC_OPAL_DISCOVERY
Date: Thu, 18 Aug 2022 09:30:43 -0500
Message-Id: <20220818143045.680972-2-gjoyce@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220818143045.680972-1-gjoyce@linux.vnet.ibm.com>
References: <20220818143045.680972-1-gjoyce@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: meLidihwLuwr4vO9zvPF2C_7j2Jkg1sB
X-Proofpoint-ORIG-GUID: meLidihwLuwr4vO9zvPF2C_7j2Jkg1sB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-18_12,2022-08-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 mlxscore=0 adultscore=0
 malwarescore=0 phishscore=0 bulkscore=0 mlxlogscore=999 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2208180050
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
Cc: axboe@kernel.dk, linux-efi@vger.kernel.org, gjoyce@linux.vnet.ibm.com, nayna@linux.ibm.com, keyrings@vger.kernel.org, jonathan.derrick@linux.dev, brking@linux.vnet.ibm.com, akpm@linux-foundation.org, msuchanek@suse.de, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Greg Joyce <gjoyce@linux.vnet.ibm.com>

Add IOC_OPAL_DISCOVERY ioctl to return raw discovery data to a SED Opal
application. This allows the application to display drive capabilities
and state.

Signed-off-by: Greg Joyce <gjoyce@linux.vnet.ibm.com>
---
 block/sed-opal.c              | 38 ++++++++++++++++++++++++++++++++---
 include/linux/sed-opal.h      |  1 +
 include/uapi/linux/sed-opal.h |  6 ++++++
 3 files changed, 42 insertions(+), 3 deletions(-)

diff --git a/block/sed-opal.c b/block/sed-opal.c
index 9700197000f2..e4d8fbdc9dad 100644
--- a/block/sed-opal.c
+++ b/block/sed-opal.c
@@ -426,8 +426,12 @@ static int execute_steps(struct opal_dev *dev,
 	return error;
 }
 
-static int opal_discovery0_end(struct opal_dev *dev)
+static int opal_discovery0_end(struct opal_dev *dev, void *data)
 {
+	struct opal_discovery *discv_out = data; /* may be NULL */
+	u8 __user *buf_out;
+	u64 len_out;
+
 	bool found_com_id = false, supported = true, single_user = false;
 	const struct d0_header *hdr = (struct d0_header *)dev->resp;
 	const u8 *epos = dev->resp, *cpos = dev->resp;
@@ -443,6 +447,15 @@ static int opal_discovery0_end(struct opal_dev *dev)
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
 
@@ -517,13 +530,13 @@ static int opal_discovery0(struct opal_dev *dev, void *data)
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
@@ -2179,6 +2192,22 @@ static int opal_secure_erase_locking_range(struct opal_dev *dev,
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
@@ -2685,6 +2714,9 @@ int sed_ioctl(struct opal_dev *dev, unsigned int cmd, void __user *arg)
 	case IOC_OPAL_GENERIC_TABLE_RW:
 		ret = opal_generic_read_write_table(dev, p);
 		break;
+	case IOC_OPAL_DISCOVERY:
+		ret = opal_get_discv(dev, p);
+		break;
 	default:
 		break;
 	}
diff --git a/include/linux/sed-opal.h b/include/linux/sed-opal.h
index 1ac0d712a9c3..9197b7a628f2 100644
--- a/include/linux/sed-opal.h
+++ b/include/linux/sed-opal.h
@@ -43,6 +43,7 @@ static inline bool is_sed_ioctl(unsigned int cmd)
 	case IOC_OPAL_MBR_DONE:
 	case IOC_OPAL_WRITE_SHADOW_MBR:
 	case IOC_OPAL_GENERIC_TABLE_RW:
+	case IOC_OPAL_DISCOVERY:
 		return true;
 	}
 	return false;
diff --git a/include/uapi/linux/sed-opal.h b/include/uapi/linux/sed-opal.h
index 6f5af1a84213..89dd108b426f 100644
--- a/include/uapi/linux/sed-opal.h
+++ b/include/uapi/linux/sed-opal.h
@@ -132,6 +132,11 @@ struct opal_read_write_table {
 	__u64 priv;
 };
 
+struct opal_discovery {
+	__u64 data;
+	__u64 size;
+};
+
 #define IOC_OPAL_SAVE		    _IOW('p', 220, struct opal_lock_unlock)
 #define IOC_OPAL_LOCK_UNLOCK	    _IOW('p', 221, struct opal_lock_unlock)
 #define IOC_OPAL_TAKE_OWNERSHIP	    _IOW('p', 222, struct opal_key)
@@ -148,5 +153,6 @@ struct opal_read_write_table {
 #define IOC_OPAL_MBR_DONE           _IOW('p', 233, struct opal_mbr_done)
 #define IOC_OPAL_WRITE_SHADOW_MBR   _IOW('p', 234, struct opal_shadow_mbr)
 #define IOC_OPAL_GENERIC_TABLE_RW   _IOW('p', 235, struct opal_read_write_table)
+#define IOC_OPAL_DISCOVERY          _IOW('p', 236, struct opal_discovery)
 
 #endif /* _UAPI_SED_OPAL_H */
-- 
2.27.0

