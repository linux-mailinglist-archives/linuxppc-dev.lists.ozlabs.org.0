Return-Path: <linuxppc-dev+bounces-10755-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 91131B1E44F
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Aug 2025 10:22:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4byxqN1hj1z3cR2;
	Fri,  8 Aug 2025 18:22:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754641376;
	cv=none; b=F+D+nQyZNybwTlPoLaWMiA5qZx1ttOnltMw4Jwi9jVFiVGS5wZBB9hvic4HBynxNKtfphd7WDq1UODpCaVvqDe1zmi/8RieFIJR3+P0WBlY2mtvq5iRQWIgoqxaaPbCJg3zDwJMIordKFKCDIcfcVatGtcCQHtuny9gY9tXPXgL6pKNw1DqDcW6xpBgNbx4mF9zgradUs0x0W9U0w8Jt8ojRNa+JtGMI/K13uTUT9pEtQn71XrQNEMouUgOeWtjmBsP4kgwTyOYKOGI0EDiGn4bLJRSIXb87H3NOMqS6p4FxeamV9eUNP2zU/rUa+iWz/rpKUNuPVUc+k2IItWqjSw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754641376; c=relaxed/relaxed;
	bh=M8H8VatuFDhz85n97YqA7df4qaC3IJcBKVKFKpZb8bA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cmrOg/fbAoGOCEWfYsFAFT6UlR4l8YMoe1mVNRykDTBdRlW6I314ZJLgpOA56jV4dsTXZ6ReCG2WIzM0o8AoriUneUa7JzYrw0sUvuNve1wnrfVqflWeNurhn1/kA4dqDebRjq4gqJSuCv+OeAaR5n/CV3VQ9NUIe3A2HM7NPxC/ROEDFhMgfQdSPQaNxTU8+5XIHTM4d9edcRRW2KMFWcWSdtUwSmcGpt9MBCsn49MfRXmkYRkmo8G7XjjQlrDys7DKe9W/UAVfhWgUjQLQBLi/XgwR6TJbn+vCvwtKZqoD+VputIQEVgGt9aVWquupgmZ6A+dwEzEDZ6NQtYd/Fg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fIbEcEBR; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ganeshgr@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fIbEcEBR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ganeshgr@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4byxqM1j1Lz3cR1
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Aug 2025 18:22:54 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5781Nlh2010278;
	Fri, 8 Aug 2025 08:22:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=M8H8VatuFDhz85n97YqA7df4qaC3IJcBKVKFKpZb8
	bA=; b=fIbEcEBRQRXu3+dixFbBf5tJ9R7VKQjaGiKklrqRw4/sg54xThaME8K9E
	DFgSoGnXkppQSzH17gW73z59tpgFIZo+8YR8vUmXpqhT4mMSDdDYxjvez8TwmxJ3
	eCyYOCL1BXEUBjIwQTYMQUgiDf9sLOPnqgpB3FA4mtqjTboRBZtvivEuEAXgy+hX
	xuNsxfTmikw2M6Ov/uaK+pKMM+A/aF9KiqCx77LSXuw/TOccmsJyOkkCvhE901Ti
	sNaax9n/6khI0pRyDhdjV+kAtzyiYypBwWgxWnqN0q5YxnLksNH8RUMi3Upj1mKW
	skSCMCa+lmsoBb5NatqkDYoVMeRMQ==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48bq63xyk6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Aug 2025 08:22:43 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 57866Kcs031444;
	Fri, 8 Aug 2025 08:22:42 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 48bpwnmt8s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Aug 2025 08:22:42 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5788McGk57082208
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 8 Aug 2025 08:22:38 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BD0742004D;
	Fri,  8 Aug 2025 08:22:38 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 221DD20040;
	Fri,  8 Aug 2025 08:22:37 +0000 (GMT)
Received: from tp-ibm-com.ibmuc.com (unknown [9.111.53.205])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  8 Aug 2025 08:22:36 +0000 (GMT)
From: Ganesh Goudar <ganeshgr@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, mahesh@linux.ibm.com,
        Ganesh Goudar <ganeshgr@linux.ibm.com>
Subject: [PATCH v2] powerpc/eeh: parse AER registers
Date: Fri,  8 Aug 2025 13:52:34 +0530
Message-ID: <20250808082234.645375-1-ganeshgr@linux.ibm.com>
X-Mailer: git-send-email 2.48.1
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA4MDA2OCBTYWx0ZWRfXwwwfBzvGYWHz
 145BYgbhnI2F3tzKMkXj+oPdoRLfnzxFEY75vXFUfPsuDbHKEBiQzNbvVGLXfOE751MI0T+bNUX
 KIXn2xKw0/oeu3P3QQDwm36/a3U05+uK/EdIgq8fTdzQQxf2z+k4bYoj87mWAGVEfyrHv887AWz
 o761NYM3pEUy7uHYX0FSVM70LtOJ2l7yC24uSvq72dBjl5I8gfQAB0CL5CRf37sc8vKhn+mmB8l
 BbfuaeLeL5eL+Gz2eysl4MYNbvApEAAY4fTLF2pBIgwsHrJsscfHRpo7UbHIrRz3HlvYsEjzntA
 hbOWZx0qx0Ssh1g0xKpZbpEQTKkW79eHFezkfn9MkLHtQsDAmp2N5W61FYTXQ1y0eWza/qjvvd6
 TAfLJbfBztjUa54mgq2rRyHnCNiMVlMVBPbsQYcjTC1sDNS/vJFlJHgPlQ5JaTSwiwbUGg4f
X-Proofpoint-ORIG-GUID: KEgwo3rA2s9aqwcA3myW2FCsRlQLrbBt
X-Authority-Analysis: v=2.4 cv=LreSymdc c=1 sm=1 tr=0 ts=6895b3d3 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=2OwXVqhp2XgA:10 a=VnNF1IyMAAAA:8 a=vpK28AJng4gpH6vAUrYA:9
X-Proofpoint-GUID: KEgwo3rA2s9aqwcA3myW2FCsRlQLrbBt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-08_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 mlxlogscore=975 bulkscore=0
 malwarescore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2507300000
 definitions=main-2508080068
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

parse AER uncorrectable and correctable error status
registers to print error type and severity.

output looks like
EEH:AER severity=Uncorrected (Fatal), Error Type: Data Link Protocol Error

Signed-off-by: Ganesh Goudar <ganeshgr@linux.ibm.com>
---
v2:
* Remove unnecessary checks.
* Change the error message format.
---
 arch/powerpc/kernel/eeh.c | 81 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 80 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
index 83fe99861eb1..cd083e59d6b3 100644
--- a/arch/powerpc/kernel/eeh.c
+++ b/arch/powerpc/kernel/eeh.c
@@ -139,6 +139,49 @@ struct eeh_stats {
 
 static struct eeh_stats eeh_stats;
 
+static const char * const aer_uncor_errors[] = {
+	"Undefined",
+	"Undefined",
+	"Undefined",
+	"Undefined",
+	"Data Link Protocol",
+	"Surprise Down",
+	"Poisoned TLP",
+	"Flow Control Protocol",
+	"Completion Timeout",
+	"Completer Abort",
+	"Unexpected Completion",
+	"Receiver Overflow",
+	"Malformed TLP",
+	"ECRC Error",
+	"Unsupported Request",
+	"ACS Violation",
+	"Uncorrectable Internal Error",
+	"MC Blocked TLP",
+	"AtomicOp Egress Blocked",
+	"TLPPrefix Blocked",
+	"Poisoned TLP Egress Blocked"
+};
+
+static const char * const aer_cor_errors[] = {
+	"Receiver Error",
+	"Undefined",
+	"Undefined",
+	"Undefined",
+	"Undefined",
+	"Undefined",
+	"Bad TLP",
+	"Bad DLLP",
+	"Replay Num Rollover",
+	"Undefined",
+	"Undefined",
+	"Undefined",
+	"Replay Timer Timeout",
+	"Advisory Non-Fatal Error",
+	"Corrected Internal Error",
+	"Header Log Overflow",
+};
+
 static int __init eeh_setup(char *str)
 {
 	if (!strcmp(str, "off"))
@@ -160,6 +203,40 @@ void eeh_show_enabled(void)
 		pr_info("EEH: No capable adapters found: recovery disabled.\n");
 }
 
+static void eeh_parse_aer_registers(struct eeh_dev *edev, int cap)
+{
+	int i;
+	const char *error_type;
+	u32 uncor_status, uncor_severity, cor_status;
+
+	eeh_ops->read_config(edev, cap + PCI_ERR_UNCOR_STATUS, 4, &uncor_status);
+	eeh_ops->read_config(edev, cap + PCI_ERR_UNCOR_SEVER, 4, &uncor_severity);
+	eeh_ops->read_config(edev, cap + PCI_ERR_COR_STATUS, 4, &cor_status);
+
+	if (uncor_status) {
+		for (i = 0; i < ARRAY_SIZE(aer_uncor_errors); i++) {
+			if (uncor_status & (1 << i)) {
+				error_type = (i < ARRAY_SIZE(aer_uncor_errors))
+					     ? aer_uncor_errors[i] : "Unknown";
+				pr_err("EEH:AER severity=Uncorrected (%s), Error type: %s\n",
+				       (uncor_severity & (1 << i)) ?
+				       "Fatal" : "Non-Fatal", error_type);
+			}
+		}
+	}
+
+	if (cor_status) {
+		for (i = 0; i < ARRAY_SIZE(aer_cor_errors); i++) {
+			if (cor_status & (1 << i)) {
+				error_type = (i < ARRAY_SIZE(aer_cor_errors))
+					      ? aer_cor_errors[i] : "Unknown";
+				pr_err("EEH:AER severity=Correctable, Error Type: %s\n",
+				       error_type);
+			}
+		}
+	}
+}
+
 /*
  * This routine captures assorted PCI configuration space data
  * for the indicated PCI device, and puts them into a buffer
@@ -237,9 +314,11 @@ static size_t eeh_dump_dev_log(struct eeh_dev *edev, char *buf, size_t len)
 		pr_warn("%s\n", buffer);
 	}
 
-	/* If AER capable, dump it */
+	/* If AER capable, parse and dump it */
 	cap = edev->aer_cap;
 	if (cap) {
+		eeh_parse_aer_registers(edev, cap);
+
 		n += scnprintf(buf+n, len-n, "pci-e AER:\n");
 		pr_warn("EEH: PCI-E AER capability register set follows:\n");
 
-- 
2.48.1


