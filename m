Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4639F2AFBE2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Nov 2020 02:09:10 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CWk5H27BlzDqxX
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Nov 2020 12:09:07 +1100 (AEDT)
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
 header.s=pp1 header.b=oSBX3tGP; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CWk0M2cQjzDqKX
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Nov 2020 12:04:50 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AC11lxY087370; Wed, 11 Nov 2020 20:04:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=RmsftSqeK+iTEilXtDQxEDiHH74AX0QOs+3P/fEMQIY=;
 b=oSBX3tGPgaPrwYcbfpc+YOtoGYRA33u57CszUSUubbVWIdg9kJPfDUjoF9S398zz8wgv
 UHV67dpg4SJqTnZIMCF27Ex+iaK8pTqtt7H1KJF+axaWh90KCsD0REPwynjiT9cW6Uae
 U5nOmBL76feV+iu6wNRY/Hvtqxa3G0hYEl1f7twFeM/HrNQJrpP4ckVitc9TZ7SrchKp
 DxyX3mliwzGUx5GhigJC0xQ5LlC9gof9bKv2JV6eLHXxBDev5Js8F2aHDsi2Zf4l1nE3
 EmlbRFw6ZSv5xMfNH4QDhgjSjyC+v5x5iteRrYfXYkijssLqksXi68jT7/yCQxCYzYKx yQ== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34rfyeur7m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Nov 2020 20:04:46 -0500
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AC0vSTE020667;
 Thu, 12 Nov 2020 01:04:45 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma03dal.us.ibm.com with ESMTP id 34nk79y5sn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Nov 2020 01:04:45 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AC14iMo11207194
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 12 Nov 2020 01:04:44 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B15E428058;
 Thu, 12 Nov 2020 01:04:44 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3AE002805E;
 Thu, 12 Nov 2020 01:04:44 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.40.195.188])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 12 Nov 2020 01:04:44 +0000 (GMT)
From: Tyrel Datwyler <tyreld@linux.ibm.com>
To: james.bottomley@hansenpartnership.com
Subject: [PATCH 1/6] ibmvfc: byte swap login_buf.resp values in attribute show
 functions
Date: Wed, 11 Nov 2020 19:04:37 -0600
Message-Id: <20201112010442.102589-1-tyreld@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-11_12:2020-11-10,
 2020-11-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 mlxscore=0 mlxlogscore=999
 priorityscore=1501 phishscore=0 bulkscore=0 clxscore=1015 suspectscore=1
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011120001
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

Both ibmvfc_show_host_(capabilities|npiv_version) functions retrieve
values from vhost->login_buf.resp buffer. This is the MAD response
buffer from the VIOS and as such any multi-byte non-string values are in
big endian format.

Byte swap these values to host cpu endian format for better human
readability.

Signed-off-by: Tyrel Datwyler <tyreld@linux.ibm.com>
---
 drivers/scsi/ibmvscsi/ibmvfc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/scsi/ibmvscsi/ibmvfc.c b/drivers/scsi/ibmvscsi/ibmvfc.c
index 070cf516b98f..01fe65de9086 100644
--- a/drivers/scsi/ibmvscsi/ibmvfc.c
+++ b/drivers/scsi/ibmvscsi/ibmvfc.c
@@ -3025,7 +3025,7 @@ static ssize_t ibmvfc_show_host_npiv_version(struct device *dev,
 {
 	struct Scsi_Host *shost = class_to_shost(dev);
 	struct ibmvfc_host *vhost = shost_priv(shost);
-	return snprintf(buf, PAGE_SIZE, "%d\n", vhost->login_buf->resp.version);
+	return snprintf(buf, PAGE_SIZE, "%d\n", be32_to_cpu(vhost->login_buf->resp.version));
 }
 
 static ssize_t ibmvfc_show_host_capabilities(struct device *dev,
@@ -3033,7 +3033,7 @@ static ssize_t ibmvfc_show_host_capabilities(struct device *dev,
 {
 	struct Scsi_Host *shost = class_to_shost(dev);
 	struct ibmvfc_host *vhost = shost_priv(shost);
-	return snprintf(buf, PAGE_SIZE, "%llx\n", vhost->login_buf->resp.capabilities);
+	return snprintf(buf, PAGE_SIZE, "%llx\n", be64_to_cpu(vhost->login_buf->resp.capabilities));
 }
 
 /**
-- 
2.27.0

