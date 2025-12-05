Return-Path: <linuxppc-dev+bounces-14650-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CFBB3CA7D13
	for <lists+linuxppc-dev@lfdr.de>; Fri, 05 Dec 2025 14:46:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dNCMN4x0kz2yNG;
	Sat, 06 Dec 2025 00:46:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764942368;
	cv=none; b=Bj+xvDg0bLeP9Gm7H6dgRFj2AvLgaBQCT4li2LVpdzXY7v2eiLi88pfYQQEw5s2a2gtPhy1q86Cr+nExV591V44VIip7qnyFa8QaI/twdKNnGAb2rj/ibF/+He56atKZ+eESC+OsgNPYxT3SHOKgabt63DLPUqT6I1A+AiiT960gsls8d95GAZx0Z36Rk6EOhSEaQ2ty25fWoeSynn3+MUkzocrhdPgRx14hlNKrr85+KwWbDkcU0kXZNddRtyGGxgh+N91l/w77qms7X93JeRz9rEw0rFFK+tMyjGQ9MOFl8Wih9zkB+wFB2B4iXutleYWFVjGImjOco3afUl8fsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764942368; c=relaxed/relaxed;
	bh=2Wsjd5AJnhoSdRNqe0Du1Qr+oQCkFLWon4cEEHpofr8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hJkG7QOo815m62ZM8JvQectd2Noot6n03uq209lb2+EGqPlIo9nid9YN5b7hnjmxcdPHqFoMEgrduUPrcZsW9Yqe5f50FvZjleDwNqdq3Eotgx9K13ZQzSFIzjztODr9Oz/l+XYcr7ABedCLvNh91GLWhWeMTH31SoyvF64L13shlf1S/e3bGTsGqRQRyJbEPr+7iqqjaMXSfcKQtJ6nUtb1eeLtGMRvBmUNV5afN1S9i0qyrczE+4kfC2j9pU9zihd1zhuo8ioWUp7ucP0lTLu4ktB8SROm5Fj24gHwr1iC5aF3AM3rrMZSbaQqy++ZoA1q5ALI/zleMdlur7m7yQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VCMQs9VX; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nnmlinux@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VCMQs9VX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nnmlinux@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dNCMN0YqHz2xPT
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 06 Dec 2025 00:46:07 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5B5CTooZ026295;
	Fri, 5 Dec 2025 13:45:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=2Wsjd5AJnhoSdRNqe
	0Du1Qr+oQCkFLWon4cEEHpofr8=; b=VCMQs9VXofgIhS2ZdEbNQo7vFKFsRM/Yu
	U7eIDweOwVz+/Pm0du5mk2Dl9qwQ7bfVF1TzMInSMTpc9cnQg24EvqX9f+LgYK0I
	5uIVlCpKN2ZbcV7jo1yu7VywYlWHItJO5C4NklFyc6JoHWMY/VBcuVUQ+kHPvnDL
	a0zAnetA00yCdjIDxa+UtEbBcUSIzDDWjKhThAVu1L1a36S9blJyjd0dtzLA//Op
	mCD2D7ogKS7GmyVvs7TuF2Uhet/z435ozAfhLqo6u4hcabYg/WM6t48XWcAJVunq
	ymakv+gppTwZjylNk9imPyzlHDIOuN9VbTaFyHHRt7fkkm4PxIzAQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aqrh7dyrf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Dec 2025 13:45:58 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5B5Debq3031580;
	Fri, 5 Dec 2025 13:45:57 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aqrh7dyrb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Dec 2025 13:45:57 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5B5ADXqj024111;
	Fri, 5 Dec 2025 13:45:55 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4arb5swmy8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Dec 2025 13:45:55 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5B5DjpnP14024980
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 5 Dec 2025 13:45:51 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 79A992004B;
	Fri,  5 Dec 2025 13:45:51 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 142B520040;
	Fri,  5 Dec 2025 13:45:49 +0000 (GMT)
Received: from ltcd48-lp3.ltc.tadn.ibm.com (unknown [9.5.7.39])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  5 Dec 2025 13:45:48 +0000 (GMT)
From: Narayana Murty N <nnmlinux@linux.ibm.com>
To: mahesh@linux.ibm.com, maddy@linux.ibm.com, mpe@ellerman.id.au,
        christophe.leroy@csgroup.eu, gregkh@linuxfoundation.org,
        oohall@gmail.com, npiggin@gmail.com
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        tyreld@linux.ibm.com, vaibhav@linux.ibm.com, sbhat@linux.ibm.com,
        ganeshgr@linux.ibm.com, sourabhjain@linux.ibm.com
Subject: [PATCH 4/4] powerpc/pseries: Implement RTAS error injection via pseries_eeh_err_inject
Date: Fri,  5 Dec 2025 03:45:10 -0600
Message-ID: <20251205094510.4671-5-nnmlinux@linux.ibm.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251205094510.4671-1-nnmlinux@linux.ibm.com>
References: <20251205094510.4671-1-nnmlinux@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=dK+rWeZb c=1 sm=1 tr=0 ts=6932e216 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8
 a=deTHFr3idxbnG05LXr8A:9
X-Proofpoint-GUID: _xAYc_x4bKY5roffsl_TdXnvvF7Qz0fL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI5MDAyMCBTYWx0ZWRfX5YpbkRgUyHTi
 oKnQ2zA7LC7yza3NPE/5fnQofB4Kp31oib6G/RrrmVNupNew+fZQmJ4izkPTPDoRyii4X72rKVO
 CcJg412EhgUdN/ki9QtiBJTFcmcq1bqPVIwPs53jXA7CQk6bPDwIt0I/aH65lsdcXAXNlDcyUbN
 a5SsBcaMRPaDWX5fMvn5y3y1+W9kO0cgLGjHPxxullk6ecwBPUdEmJ7askP1cfiKzImJ1AbZyBg
 KkEEvx4fX121HdfKJ8WQ8jxZAmJarxDS2/+ub5sQi80BhRW09DuCCeZIl4mCs3PY1IYNhpV/NID
 Uc8TgnoYUSxYPEp7irHeWW+lhnyG2PEZ6zyBHzuq8G8ijgXGMl9m5dRSso1WtvDQsgQFrp6tceN
 C5TD3DscrSdp/OmLDD77bRRLZEm5Kw==
X-Proofpoint-ORIG-GUID: nosvOfS3DPLu6Nav2U41FcrIKoWYqBTd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_04,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510240000
 definitions=main-2511290020
X-Spam-Status: No, score=0.4 required=3.0 tests=DATE_IN_PAST_03_06,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Replace legacy MMIO error injection with full PAPR-compliant RTAS error
injection supporting 14+ error types via
 - ibm,open-errinjct
 - ibm,errinjct
 - ibm,close-errinjct.

Key features:
- Complete open-session-inject-close cycle management
- Special handling for ibm,open-errinjct output format (token,status)
- Comprehensive buffer preparation per PAPR layouts
- All pr_* logging uses pr_fmt("EEH: ") prefix

Tested with corresponding QEMU patches:
https://lore.kernel.org/all/20251029150618.186803-1-nnmlinux@linux.ibm.com/

Signed-off-by: Narayana Murty N <nnmlinux@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/eeh_pseries.c | 164 +++++++++++++++++--
 1 file changed, 146 insertions(+), 18 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/eeh_pseries.c b/arch/powerpc/platforms/pseries/eeh_pseries.c
index 110e8cf10985..d0010f2fc656 100644
--- a/arch/powerpc/platforms/pseries/eeh_pseries.c
+++ b/arch/powerpc/platforms/pseries/eeh_pseries.c
@@ -1047,6 +1047,98 @@ static int prepare_errinjct_buffer(struct eeh_pe *pe, int type, int func,
 	return 0;
 }
 
+/**
+ * rtas_open_errinjct_session - Open an RTAS error injection session
+ *
+ * Opens a session with the RTAS ibm,open-errinjct service.
+ *
+ * Return: Positive session token on success, negative error code on failure.
+ */
+static int rtas_open_errinjct_session(void)
+{
+	int open_token, args[2] = {0};
+	int rc, status, session_token = -1;
+
+	open_token = rtas_function_token(RTAS_FN_IBM_OPEN_ERRINJCT);
+	if (open_token == RTAS_UNKNOWN_SERVICE) {
+		pr_err("RTAS: ibm,open-errinjct not available\n");
+		return RTAS_UNKNOWN_SERVICE;
+	}
+
+	/* Call open; original code treated rtas_call return as session token */
+	rc = rtas_call(open_token, 0, 2, args);
+	status = args[1];
+	if (status != 0) {
+		pr_err("RTAS: open-errinjct failed: status=%d args[1]=%d rc=%d\n",
+		       status, args[1], rc);
+		return status ? status : -EIO;
+	}
+
+	session_token = args[0];
+	pr_info("Opened injection session: token=%d\n", session_token);
+	return session_token;
+}
+
+/**
+ * rtas_close_errinjct_session - Close an RTAS error injection session
+ * @session_token: Session token returned from open
+ *
+ * Attempts to close a previously opened error injection session. Best-effort;
+ * logs warnings if close fails or if service is unavailable.
+ */
+
+static void rtas_close_errinjct_session(int session_token)
+{
+	int close_token, args[2] = {0};
+
+	if (session_token <= 0)
+		return;
+
+	close_token = rtas_function_token(RTAS_FN_IBM_CLOSE_ERRINJCT);
+	if (close_token == RTAS_UNKNOWN_SERVICE) {
+		pr_warn("close-errinjct not available\n");
+		return;
+	}
+
+	args[0] = 0;
+	rtas_call(close_token, 1, 1, &session_token, args);
+	if (args[0]) {
+		pr_warn("close-errinjct  args[0]=%d\n", args[0]);
+	}
+}
+
+/**
+ * do_errinjct_call - Invoke the RTAS error injection service
+ * @errinjct_token: RTAS token for ibm,errinjct
+ * @type:           RTAS error type
+ * @session_token:  RTAS error injection session token
+ *
+ * Issues the RTAS ibm,errinjct call with the prepared work buffer. Logs errors
+ * on failure.
+ *
+ * Return: 0 on success, negative error code otherwise.
+ */
+
+static int do_errinjct_call(int errinjct_token, int type, int session_token)
+{
+	int rc, status;
+
+	if (errinjct_token == RTAS_UNKNOWN_SERVICE)
+		return -ENODEV;
+
+	/* errinjct takes: type, session_token, workbuf pointer (3 in), returns status */
+	rc = rtas_call(errinjct_token, 3, 1, &status, type, session_token,
+		       rtas_errinjct_buf);
+
+	if (rc || status != 0) {
+		pr_err("RTAS: errinjct failed: rc=%d, status=%d\n", rc, status);
+		return status ? status : -EIO;
+	}
+
+	pr_info("RTAS: errinjct ok: rc=%d, status=%d\n", rc, status);
+	return 0;
+}
+
 /**
  * pseries_eeh_err_inject - Inject specified error to the indicated PE
  * @pe: the indicated PE
@@ -1060,30 +1152,66 @@ static int prepare_errinjct_buffer(struct eeh_pe *pe, int type, int func,
 static int pseries_eeh_err_inject(struct eeh_pe *pe, int type, int func,
 				  unsigned long addr, unsigned long mask)
 {
-	struct	eeh_dev	*pdev;
+	int rc = 0;
+	int session_token = -1;
+	int errinjct_token;
 
-	/* Check on PCI error type */
-	if (type != EEH_ERR_TYPE_32 && type != EEH_ERR_TYPE_64)
-		return -EINVAL;
+	/* Validate type */
+	if (!validate_err_type(type)) {
+		pr_err("RTAS: invalid error type 0x%x\n", type);
+		return RTAS_INVALID_PARAMETER;
+	}
+	pr_debug("RTAS: error type 0x%x\n", type);
 
-	switch (func) {
-	case EEH_ERR_FUNC_LD_MEM_ADDR:
-	case EEH_ERR_FUNC_LD_MEM_DATA:
-	case EEH_ERR_FUNC_ST_MEM_ADDR:
-	case EEH_ERR_FUNC_ST_MEM_DATA:
-		/* injects a MMIO error for all pdev's belonging to PE */
-		pci_lock_rescan_remove();
-		list_for_each_entry(pdev, &pe->edevs, entry)
-			eeh_pe_inject_mmio_error(pdev->pdev);
-		pci_unlock_rescan_remove();
-		break;
-	default:
-		return -ERANGE;
+	/* For IOA bus errors we must validate err_func and addr/mask in PE.
+	 * For other types: if addr/mask present we'll still validate BAR range;
+	 * otherwise skip function checks.
+	 */
+	if (type == RTAS_ERR_TYPE_IOA_BUS_ERROR ||
+	    type == RTAS_ERR_TYPE_IOA_BUS_ERROR_64) {
+		/* Validate that addr/mask fall in the PE's BAR ranges */
+		rc = validate_addr_mask_in_pe(pe, addr, mask);
+		if (rc)
+			return rc;
+	} else if (addr || mask) {
+		/* If caller provided addr/mask for a non-IOA type, do a BAR check too */
+		rc = validate_addr_mask_in_pe(pe, addr, mask);
+		if (rc)
+			return rc;
 	}
 
-	return 0;
+	/* Open RTAS session */
+	session_token = rtas_open_errinjct_session();
+	if (session_token < 0)
+		return session_token;
+
+	/* get errinjct token */
+	errinjct_token = rtas_function_token(RTAS_FN_IBM_ERRINJCT);
+	if (errinjct_token == RTAS_UNKNOWN_SERVICE) {
+		pr_err("RTAS: ibm,errinjct not available\n");
+		rc = -ENODEV;
+		goto out_close;
+	}
+
+	/* prepare shared buffer while holding lock */
+	spin_lock(&rtas_errinjct_buf_lock);
+	rc = prepare_errinjct_buffer(pe, type, func, addr, mask);
+	if (rc) {
+		spin_unlock(&rtas_errinjct_buf_lock);
+		goto out_close;
+	}
+
+	/* perform the errinjct RTAS call */
+	rc = do_errinjct_call(errinjct_token, type, session_token);
+	spin_unlock(&rtas_errinjct_buf_lock);
+
+out_close:
+	/* always attempt close if we opened a session */
+	rtas_close_errinjct_session(session_token);
+	return rc;
 }
 
+
 static struct eeh_ops pseries_eeh_ops = {
 	.name			= "pseries",
 	.probe			= pseries_eeh_probe,
-- 
2.51.1


