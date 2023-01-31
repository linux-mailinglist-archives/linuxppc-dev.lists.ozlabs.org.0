Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE8168254F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Jan 2023 08:01:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P5bYR2hZbz3f36
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Jan 2023 18:00:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Rh4ovVcx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Rh4ovVcx;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P5b5n5HKrz3cKb
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Jan 2023 17:40:29 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30V5uewn010357;
	Tue, 31 Jan 2023 06:40:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=+3kvWVz6aOeabVr4AOc40oYztb0yqrcFdrGQzMhlefo=;
 b=Rh4ovVcxlVWV6HkrcSR8MRjNrjeDC06HlS7EKIl846NulxC63RBDZjA7TQppoKWwd75A
 46Ut36qMHdJbDiQHoVWvL5Qx4IVwlQgSJysvBIW2zbFt6KFLRo/TztHbUBVO7eZZl1vO
 xyzKDSZrdMf6LLhJgh7n+MjrX3Duafn+uN9ebCQ9TJieacp/kN/PqgJMSzPQ5Pdpm3Af
 CHGcW6KcXgnyforFtDI4xBvMfByPzXS2QTwi4vEQQcWvRjxClkxTOvC9DfHx5OcK1S9W
 3XcDpCadyahLAOIOyr61ZWm4BsndWB2JnNYvHFIf3DGZ+JbCM5S6JeKEQOkbNh+ydn3X Tw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3new9kgthu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 31 Jan 2023 06:40:17 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30V6M3ww015061;
	Tue, 31 Jan 2023 06:40:17 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com [159.122.73.71])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3new9kgtg4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 31 Jan 2023 06:40:16 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
	by ppma02fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30V29aOC004065;
	Tue, 31 Jan 2023 06:40:14 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma02fra.de.ibm.com (PPS) with ESMTPS id 3ncvv6a7dt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 31 Jan 2023 06:40:14 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 30V6eBrd20971946
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 31 Jan 2023 06:40:11 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C223F20040;
	Tue, 31 Jan 2023 06:40:11 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C52ED2004B;
	Tue, 31 Jan 2023 06:40:10 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 31 Jan 2023 06:40:10 +0000 (GMT)
Received: from jarvis-ozlabs-ibm-com.au.ibm.com (unknown [9.192.255.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 1760960996;
	Tue, 31 Jan 2023 17:40:05 +1100 (AEDT)
From: Andrew Donnellan <ajd@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-integrity@vger.kernel.org
Subject: [PATCH v5 19/25] powerpc/pseries: Make caller pass buffer to plpks_read_var()
Date: Tue, 31 Jan 2023 17:39:22 +1100
Message-Id: <20230131063928.388035-20-ajd@linux.ibm.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230131063928.388035-1-ajd@linux.ibm.com>
References: <20230131063928.388035-1-ajd@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: n6uKZ1xReVlR6XUhAPHPDure0p3EYFUh
X-Proofpoint-GUID: WDtjhlGM16apAXAnkmWek1knZRRTw946
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-31_02,2023-01-30_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 mlxlogscore=999
 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301310059
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
Cc: sudhakar@linux.ibm.com, erichte@linux.ibm.com, gregkh@linuxfoundation.org, nayna@linux.ibm.com, npiggin@gmail.com, linux-kernel@vger.kernel.org, zohar@linux.ibm.com, gjoyce@linux.ibm.com, ruscur@russell.cc, joel@jms.id.au, bgray@linux.ibm.com, brking@linux.ibm.com, gcwilson@linux.ibm.com, stefanb@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currently, plpks_read_var() allocates a buffer to pass to the
H_PKS_READ_OBJECT hcall, then allocates another buffer, of the caller's
preferred size if necessary, into which the data is copied, and returns
that buffer to the caller.

This is a bit over the top - while we probably still want to allocate a
separate buffer to pass to the hypervisor in the hcall, we can let the
caller allocate the final buffer and specify the size.

Don't allocate var->data in plpks_read_var(), instead expect the caller to
allocate it. If the caller needs to discover the size, it can set
var->data to NULL and var->datalen will be populated. Update header file
to document this.

Suggested-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
Signed-off-by: Russell Currey <ruscur@russell.cc>

---

v3: New patch (mpe)
---
 arch/powerpc/include/asm/plpks.h       | 12 ++++++++++++
 arch/powerpc/platforms/pseries/plpks.c | 11 ++++-------
 2 files changed, 16 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/include/asm/plpks.h b/arch/powerpc/include/asm/plpks.h
index e7204e6c0ca4..0c49969b0864 100644
--- a/arch/powerpc/include/asm/plpks.h
+++ b/arch/powerpc/include/asm/plpks.h
@@ -88,16 +88,28 @@ int plpks_remove_var(char *component, u8 varos,
 
 /**
  * Returns the data for the specified os variable.
+ *
+ * Caller must allocate a buffer in var->data with length in var->datalen.
+ * If no buffer is provided, var->datalen will be populated with the object's
+ * size.
  */
 int plpks_read_os_var(struct plpks_var *var);
 
 /**
  * Returns the data for the specified firmware variable.
+ *
+ * Caller must allocate a buffer in var->data with length in var->datalen.
+ * If no buffer is provided, var->datalen will be populated with the object's
+ * size.
  */
 int plpks_read_fw_var(struct plpks_var *var);
 
 /**
  * Returns the data for the specified bootloader variable.
+ *
+ * Caller must allocate a buffer in var->data with length in var->datalen.
+ * If no buffer is provided, var->datalen will be populated with the object's
+ * size.
  */
 int plpks_read_bootloader_var(struct plpks_var *var);
 
diff --git a/arch/powerpc/platforms/pseries/plpks.c b/arch/powerpc/platforms/pseries/plpks.c
index e5755443d4a4..926b6a927326 100644
--- a/arch/powerpc/platforms/pseries/plpks.c
+++ b/arch/powerpc/platforms/pseries/plpks.c
@@ -581,17 +581,14 @@ static int plpks_read_var(u8 consumer, struct plpks_var *var)
 		goto out_free_output;
 	}
 
-	if (var->datalen == 0 || var->datalen > retbuf[0])
+	if (!var->data || var->datalen > retbuf[0])
 		var->datalen = retbuf[0];
 
-	var->data = kzalloc(var->datalen, GFP_KERNEL);
-	if (!var->data) {
-		rc = -ENOMEM;
-		goto out_free_output;
-	}
 	var->policy = retbuf[1];
 
-	memcpy(var->data, output, var->datalen);
+	if (var->data)
+		memcpy(var->data, output, var->datalen);
+
 	rc = 0;
 
 out_free_output:
-- 
2.39.1

