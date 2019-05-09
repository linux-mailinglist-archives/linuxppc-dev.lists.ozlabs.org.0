Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D412184C7
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2019 07:15:28 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4501kk1XjhzDqNS
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2019 15:15:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4501fT0JxrzDqLS
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 May 2019 15:11:44 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x494vMlg054736
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 9 May 2019 01:11:41 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2sc9qp0m9m-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 May 2019 01:11:41 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <ajd@linux.ibm.com>;
 Thu, 9 May 2019 06:11:40 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 9 May 2019 06:11:37 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x495Ba8u41418968
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 9 May 2019 05:11:36 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BD063AE053
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 May 2019 05:11:36 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6E2D3AE058
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 May 2019 05:11:36 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 May 2019 05:11:36 +0000 (GMT)
Received: from intelligence.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher DHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 55D78A03C7
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 May 2019 15:11:32 +1000 (AEST)
From: Andrew Donnellan <ajd@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 4/5] powerpc/powernv: Fix checkpatch warnings in
 opal-xscom.c
Date: Thu,  9 May 2019 15:11:18 +1000
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190509051119.7694-1-ajd@linux.ibm.com>
References: <20190509051119.7694-1-ajd@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19050905-0012-0000-0000-00000319CAF0
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19050905-0013-0000-0000-000021524F7E
Message-Id: <20190509051119.7694-4-ajd@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-09_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905090032
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
---
v1->v2:
- new patch
---
 arch/powerpc/platforms/powernv/opal-xscom.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/opal-xscom.c b/arch/powerpc/platforms/powernv/opal-xscom.c
index e16b0e346d7e..d9607376822c 100644
--- a/arch/powerpc/platforms/powernv/opal-xscom.c
+++ b/arch/powerpc/platforms/powernv/opal-xscom.c
@@ -95,7 +95,7 @@ static ssize_t scom_debug_read(struct file *filp, char __user *ubuf,
 	struct scom_debug_entry *ent = filp->private_data;
 	u64 __user *ubuf64 = (u64 __user *)ubuf;
 	loff_t off = *ppos;
-	ssize_t done = 0; 
+	ssize_t done = 0;
 	u64 reg, reg_base, reg_cnt, val;
 	int rc;
 
@@ -120,13 +120,13 @@ static ssize_t scom_debug_read(struct file *filp, char __user *ubuf,
 	return done;
 }
 
-static ssize_t scom_debug_write(struct file* filp, const char __user *ubuf,
+static ssize_t scom_debug_write(struct file *filp, const char __user *ubuf,
 				size_t count, loff_t *ppos)
 {
 	struct scom_debug_entry *ent = filp->private_data;
 	u64 __user *ubuf64 = (u64 __user *)ubuf;
 	loff_t off = *ppos;
-	ssize_t done = 0; 
+	ssize_t done = 0;
 	u64 reg, reg_base, reg_cnt, val;
 	int rc;
 
@@ -169,7 +169,7 @@ static int scom_debug_init_one(struct dentry *root, struct device_node *dn,
 
 	ent->chip = chip;
 	snprintf(ent->name, 16, "%08x", chip);
-	ent->path.data = (void*)kasprintf(GFP_KERNEL, "%pOF", dn);
+	ent->path.data = (void *)kasprintf(GFP_KERNEL, "%pOF", dn);
 	ent->path.size = strlen((char *)ent->path.data);
 
 	dir = debugfs_create_dir(ent->name, root);
-- 
2.20.1

