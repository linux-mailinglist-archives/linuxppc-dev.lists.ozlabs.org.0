Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 85FE2303179
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Jan 2021 02:50:50 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DPqSl68ttzDqbW
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Jan 2021 12:50:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=stefanb@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=A4jcBSUC; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DPqQn2jWKzDqld
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Jan 2021 12:49:01 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10Q1WAfm079981; Mon, 25 Jan 2021 20:48:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=qDlLTrJhI9pAWTPZzvEj2myghWfEoN4K/hh1AcU5nnc=;
 b=A4jcBSUCed/y8O6j82+m2GYzSBr/aUIO0I73UYCGUArwUx0K6/bFzkcfMLmIocKzPkUq
 Pjeg/MGeo+XSF55PgkgFMmnWYIW5HA5TWW1yvNQN4yWyKuNfnxL/GgGwOd5SbroyMUgg
 UJjsrzaJvSsOtjfEp2cX6O2HwjykI1FkY7y0XJ7t0pwdwQt9jGmjctaGMACTj0Z3M02B
 DXYDLrc0axFPvjGSSOtfGyg7bL4DMvtocZ6VF2wK0jdCbNQ83GS2XLVi8JJUYMW7cT4t
 bjfiMrfljNQnviIi21EAJiAFk1zXPcjwHmhwRyES4BDRIfngTiMSB+CWnydyRKtNEt18 uQ== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com with ESMTP id 36a4ttpfta-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Jan 2021 20:48:45 -0500
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10Q1kXDu004438;
 Tue, 26 Jan 2021 01:48:44 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma01wdc.us.ibm.com with ESMTP id 36a8uh09ax-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Jan 2021 01:48:44 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10Q1mhJw17891772
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Jan 2021 01:48:43 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A3AC26A057;
 Tue, 26 Jan 2021 01:48:43 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 13A986A04F;
 Tue, 26 Jan 2021 01:48:42 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 26 Jan 2021 01:48:42 +0000 (GMT)
From: Stefan Berger <stefanb@linux.vnet.ibm.com>
To: jarkko@kernel.org, linux-integrity@vger.kernel.org
Subject: [PATCH v2] tpm: ibmvtpm: fix error return code in tpm_ibmvtpm_probe()
Date: Mon, 25 Jan 2021 20:47:53 -0500
Message-Id: <20210126014753.340299-1-stefanb@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-25_10:2021-01-25,
 2021-01-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 clxscore=1011
 mlxlogscore=999 bulkscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101260002
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
Cc: Wang Hai <wanghai38@huawei.com>, linux-kernel@vger.kernel.org,
 Hulk Robot <hulkci@huawei.com>, paulus@samba.org,
 linuxppc-dev@lists.ozlabs.org, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Stefan Berger <stefanb@linux.ibm.com>

Return error code -ETIMEDOUT rather than '0' when waiting for the
rtce_buf to be set has timed out.

Fixes: d8d74ea3c002 ("tpm: ibmvtpm: Wait for buffer to be set before proceeding")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wang Hai <wanghai38@huawei.com>
Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
---
 drivers/char/tpm/tpm_ibmvtpm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/char/tpm/tpm_ibmvtpm.c b/drivers/char/tpm/tpm_ibmvtpm.c
index 994385bf37c0..813eb2cac0ce 100644
--- a/drivers/char/tpm/tpm_ibmvtpm.c
+++ b/drivers/char/tpm/tpm_ibmvtpm.c
@@ -687,6 +687,7 @@ static int tpm_ibmvtpm_probe(struct vio_dev *vio_dev,
 				ibmvtpm->rtce_buf != NULL,
 				HZ)) {
 		dev_err(dev, "CRQ response timed out\n");
+		rc = -ETIMEDOUT;
 		goto init_irq_cleanup;
 	}
 
-- 
2.25.4

