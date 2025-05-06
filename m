Return-Path: <linuxppc-dev+bounces-8351-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE697AACA4D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 May 2025 18:00:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZsNQW3nJMz2yrF;
	Wed,  7 May 2025 02:00:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746547219;
	cv=none; b=B41raXbPmSxYvNjjP9pC26Sbr/rlwDGX3rscS7w7CVWFgGaevV0OgldFWYixu/w0dQ4Bimqf7AYPQdQv6FPhPrcLmDoaCiOsYkJpM4hQMk82ikdweE9f/jEkS5k7/I4KPRCaTbw4SM6cDrA6w2fEU1pVCdxThhOsCqqiqMecOYALZfXnPlwswN7HDjUS2x3PCLOXUkkSQ3HnpwERlURCOE2mMSqteXJSMlTVXTfZSGHEWcOo2mybI7I0+mvYS0gU/LKb48K/1eZrxWpy7lq+b6qnOSkhTmL6uYaUimJXefBRqSQKMsVtdp3USdpts9seBtH7QT0VVifh0pB4STcgFg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746547219; c=relaxed/relaxed;
	bh=wIPpIr4DJQxkLoiaoFhsmbSNEWgtEzeMf5+wpDoVxFo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VHH2fwLTb0iQwi7JTCQ213snsPq9X1esG+RjDqV8/tqLYoxelEDIm7UlhbMS/wlFtyWxiT2oJi4NLglKa6P6SFx6bam+zsmeUnKKSQ/sSzvGvqJ53v+an45Z1FG7zxbZZ/tmv9DE2eCeuOFpxdFW3VyyLQt0GR+QqL/Cl0suPD3H1uqy/eR3lYhtAiNU4qxhVcqqvy8WEQJFbTXWBEacoKKTDcYhAs0RJjrSGm3v9B/80Zze+oVjdnUqljpmv1FzeNDwiRcDjOixtalrKDpNLBGqM9qJPxkZ08Mn6sISKiyOtlRlTka/HT1zs00UePpPocvR6vvefSjJBcnhxORslQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=au2bgeTl; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=davemarq@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=au2bgeTl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=davemarq@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZsNQV075Mz2yhY
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 May 2025 02:00:17 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 546FdaJ6006662;
	Tue, 6 May 2025 16:00:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=wIPpIr4DJQxkLoiaoFhsmbSNEWgtEzeMf5+wpDoVx
	Fo=; b=au2bgeTldBkCZFEmyt5gXXBzziHmc1ABjDFw7XlsjWbDaW8qo+HVpe1pa
	3ZsSYd/JHcjOVU230k9QIhL6dmSYSSasdiBKfi8em8r2sK6riPwABt4cfcZkuwoF
	1aFeu0COy6xLOlrHV4kQEMc5pWj9FEaocRMVSPyPHoDtas/o+DNJUqTpWGXjyLgA
	NAUmLxiWrRiwlSNOzD0odXsFfwDkdA7zbZs5QE6zF6BIBQiDoR++//vPYXvIFnPg
	oqd69+D2TBwdx3yePUQvKqpvyNqjy2vua5sbcnhVOrHIMjqUglzltgpCvKCa4miO
	WxMlKusP8KUI9DDbm2t/6Em/UD+RQ==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46fcgy2uc9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 May 2025 16:00:14 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 546DU7nN014097;
	Tue, 6 May 2025 16:00:13 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([172.16.1.7])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 46dypkm1yr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 May 2025 16:00:13 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com [10.39.53.230])
	by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 546G0Cfg19530458
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 6 May 2025 16:00:12 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 61D4A5805A;
	Tue,  6 May 2025 16:00:12 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 29EFC58054;
	Tue,  6 May 2025 16:00:12 +0000 (GMT)
Received: from d.austin.ibm.com (unknown [9.41.102.181])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  6 May 2025 16:00:12 +0000 (GMT)
From: Dave Marquardt <davemarq@linux.ibm.com>
To: netdev@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org, Dave Marquardt <davemarq@linux.ibm.com>
Subject: [PATCH net-next] net: ibmveth: Refactored veth_pool_store for better maintainability
Date: Tue,  6 May 2025 11:00:04 -0500
Message-ID: <20250506160004.328347-1-davemarq@linux.ibm.com>
X-Mailer: git-send-email 2.49.0
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
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 33W9RJPXo1ANHBOSEAbktN31y_GhcYPs
X-Authority-Analysis: v=2.4 cv=Pa7/hjhd c=1 sm=1 tr=0 ts=681a320e cx=c_pps a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17 a=dt9VzEwgFbYA:10 a=VnNF1IyMAAAA:8 a=-_ijbZd1G4CfSeCqscAA:9
X-Proofpoint-ORIG-GUID: 33W9RJPXo1ANHBOSEAbktN31y_GhcYPs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA2MDE1MSBTYWx0ZWRfXyVLapHt5pvuI m6R29G5i+rnfQ4h/C3N3GVIZLLdp/nG6XGEZFG4mKDuzFO2qOfFxng9fBnpcLAlKkUmg3jdwQkV lZ4oIsQntPqy/zFv4VCJMW09s94c6u/zsz5K+jla+B90w/AKHZOA3FaYIleaRZI0I4HNSLFxA+T
 VQk0s2bzgnXE/vAXyr5U67WmwHOrRmsFO/tsjRuFPfR7sUNwrk5Ph01rS7/2du9f68g1mtmpwfm hBWDyjToRf4k0ETm8Wfp3zJOZalZPH3t+a1heLsucHUN3GeshVNZWzyvdTYURFnzxooKLYrHjOY EP6VK6uXyynuN01jlVUSZwzS9pPlHbVfS/TgohREpLK3bspFHbit8RlsQ9Upw8Kt7/fdN+wCwNA
 bbhPJFkmo0H5av8Vn1USv9/0dWj/YAdrYepo1RFOdLda3qsbQot2syCrhFyJXFkNrnoskEK7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-06_07,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 suspectscore=0 spamscore=0 bulkscore=0 mlxlogscore=999
 adultscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 mlxscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505060151
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Make veth_pool_store detect requested pool changes, close device if
necessary, update pool, and reopen device.

Signed-off-by: Dave Marquardt <davemarq@linux.ibm.com>
---
 drivers/net/ethernet/ibm/ibmveth.c | 111 +++++++++++++++++------------
 1 file changed, 67 insertions(+), 44 deletions(-)

diff --git a/drivers/net/ethernet/ibm/ibmveth.c b/drivers/net/ethernet/ibm/ibmveth.c
index 45143467286e..24046fe16634 100644
--- a/drivers/net/ethernet/ibm/ibmveth.c
+++ b/drivers/net/ethernet/ibm/ibmveth.c
@@ -1871,6 +1871,26 @@ static ssize_t veth_pool_show(struct kobject *kobj,
 	return 0;
 }
 
+/**
+ * veth_pool_store - sysfs store handler for pool attributes
+ * @kobj: kobject embedded in pool
+ * @attr: attribute being changed
+ * @buf: value being stored
+ * @count: length of @buf in bytes
+ *
+ * Stores new value in pool attribute. Verifies the range of the new value for
+ * size and buff_size. Verifies that at least one pool remains available to
+ * receive MTU-sized packets.
+ *
+ * Context: Process context.
+ *          Takes and releases rtnl_mutex to ensure correct ordering of close
+ *	    and open calls.
+ * Return:
+ * * %-EPERM  - Not allowed to disabled all MTU-sized buffer pools
+ * * %-EINVAL - New pool size or buffer size is out of range
+ * * count    - Return count for success
+ * * other    - Return value from a failed ibmveth_open call
+ */
 static ssize_t veth_pool_store(struct kobject *kobj, struct attribute *attr,
 			       const char *buf, size_t count)
 {
@@ -1880,28 +1900,30 @@ static ssize_t veth_pool_store(struct kobject *kobj, struct attribute *attr,
 	struct net_device *netdev = dev_get_drvdata(kobj_to_dev(kobj->parent));
 	struct ibmveth_adapter *adapter = netdev_priv(netdev);
 	long value = simple_strtol(buf, NULL, 10);
+	bool change = false;
+	u32 newbuff_size;
+	u32 oldbuff_size;
+	int newactive;
+	int oldactive;
+	u32 newsize;
+	u32 oldsize;
 	long rc;
 
 	rtnl_lock();
 
+	oldbuff_size = pool->buff_size;
+	oldactive = pool->active;
+	oldsize = pool->size;
+
+	newbuff_size = oldbuff_size;
+	newactive = oldactive;
+	newsize = oldsize;
+
 	if (attr == &veth_active_attr) {
-		if (value && !pool->active) {
-			if (netif_running(netdev)) {
-				if (ibmveth_alloc_buffer_pool(pool)) {
-					netdev_err(netdev,
-						   "unable to alloc pool\n");
-					rc = -ENOMEM;
-					goto unlock_err;
-				}
-				pool->active = 1;
-				ibmveth_close(netdev);
-				rc = ibmveth_open(netdev);
-				if (rc)
-					goto unlock_err;
-			} else {
-				pool->active = 1;
-			}
-		} else if (!value && pool->active) {
+		if (value && !oldactive) {
+			newactive = 1;
+			change = true;
+		} else if (!value && oldactive) {
 			int mtu = netdev->mtu + IBMVETH_BUFF_OH;
 			int i;
 			/* Make sure there is a buffer pool with buffers that
@@ -1921,43 +1943,44 @@ static ssize_t veth_pool_store(struct kobject *kobj, struct attribute *attr,
 				goto unlock_err;
 			}
 
-			if (netif_running(netdev)) {
-				ibmveth_close(netdev);
-				pool->active = 0;
-				rc = ibmveth_open(netdev);
-				if (rc)
-					goto unlock_err;
-			}
-			pool->active = 0;
+			newactive = 0;
+			change = true;
 		}
 	} else if (attr == &veth_num_attr) {
 		if (value <= 0 || value > IBMVETH_MAX_POOL_COUNT) {
 			rc = -EINVAL;
 			goto unlock_err;
-		} else {
-			if (netif_running(netdev)) {
-				ibmveth_close(netdev);
-				pool->size = value;
-				rc = ibmveth_open(netdev);
-				if (rc)
-					goto unlock_err;
-			} else {
-				pool->size = value;
-			}
+		}
+		if (value != oldsize) {
+			newsize = value;
+			change = true;
 		}
 	} else if (attr == &veth_size_attr) {
 		if (value <= IBMVETH_BUFF_OH || value > IBMVETH_MAX_BUF_SIZE) {
 			rc = -EINVAL;
 			goto unlock_err;
-		} else {
-			if (netif_running(netdev)) {
-				ibmveth_close(netdev);
-				pool->buff_size = value;
-				rc = ibmveth_open(netdev);
-				if (rc)
-					goto unlock_err;
-			} else {
-				pool->buff_size = value;
+		}
+		if (value != oldbuff_size) {
+			newbuff_size = value;
+			change = true;
+		}
+	}
+
+	if (change) {
+		if (netif_running(netdev))
+			ibmveth_close(netdev);
+
+		pool->active = newactive;
+		pool->buff_size = newbuff_size;
+		pool->size = newsize;
+
+		if (netif_running(netdev)) {
+			rc = ibmveth_open(netdev);
+			if (rc) {
+				pool->active = oldactive;
+				pool->buff_size = oldbuff_size;
+				pool->size = oldsize;
+				goto unlock_err;
 			}
 		}
 	}
-- 
2.49.0


