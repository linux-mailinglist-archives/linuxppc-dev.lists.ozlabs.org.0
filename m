Return-Path: <linuxppc-dev+bounces-10071-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A524AF68D5
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Jul 2025 05:45:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bXjMq5gtbz2yf3;
	Thu,  3 Jul 2025 13:45:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751514327;
	cv=none; b=JA0DO/WbzCPB75/4JfhrC7JeyX2DlfVcHhUsdRrTzLl0KkRreK7P4lyFsNOVlYekfL5jQp0RKaQ4dFdgE7gbWjLWzVsixAjHQAgzj1+Fv0eed6iJS+/Dss9anZoSXJkYtHJSt+rNBzcRS7v+HwKI+glXM/6tHuTkuQ//rs1KG21BrTwfWn4+3wkKLzXjxiStNCTyAK5HQmLm6aNFRAYx6UdMaOJaREjjhqNjLYpZraENiucAHgwf4yE6T6lQpRq9kw/e/EYx9sDefrymjSQRVVKp4Mk5AQ/q9XWwaieNQrxczw/t07YAEgjoa0NT+SAzaYOPWWmTIKcafilVuXAzHg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751514327; c=relaxed/relaxed;
	bh=tIHzD6HjJr5kpoy/3kG0g85TbgCKatonhN6/VMivebM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TGV2xftlyyW9YTQl0JUl9j8D55nUvv/O6t9i9lCGRr4cgNUbVzHuPBZ2Spxj1PjELQqy7uNa2ETwjb6yMMCIFDd8kTHcC+hgflbWAFZ9ECV/r+Bymg17HjjeoC9lNrf0SpC52coO1DAP1PT8QNZLl8A+NnxZ0KX80CY7ePti04XXYHrBY7BYmOvkQOAEsH1HSxxbztWi8QCphMl6/Yi3zC0hSS3ZKmlyb9jyHG9BxcZBrGPritw7hLVreXJ5CU39NnUuFqtlaeZl6DjL2JKO/5Iiwz5lp3GJx8lNxFpYbvjgAc9wL6ku2aBpGjDkAogSkBgOHFeQk4YMsRCYlZH0rA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Q1VurnhK; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ganeshgr@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Q1VurnhK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ganeshgr@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bXjMq0NNKz2yPd
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Jul 2025 13:45:26 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 562KSgcU005891;
	Thu, 3 Jul 2025 03:45:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=tIHzD6HjJr5kpoy/3kG0g85TbgCKatonhN6/VMive
	bM=; b=Q1VurnhKjl5Ofz6GHpoIl+yARLJjrUwYhwb8bqtFEDN/8wOh+Ty7PUZV+
	0P7nN50deAJgu8jKUYhpD550OXyWEBo8+o2+xxH9SqQjnSrJyL725NI4HAEt00h/
	iMIhT/fWX2VtDl/+bxZckbDfogZSMVE2kiPx/Ulk7SwtIFFIng1v5902n8IGT5tV
	DGoKegJytiqSdEVSKybt2qEAo1sddft9M2KIb5Czc0RBpWuRHQTi1eympeiDR4WE
	lGPyp2IZ2lJ9tkuoVj+z9taxzWZ7TCR0zwHJbS7ExEewYQNvlcpiWum1B91yR7w8
	pNNsldA2GzCUqrVFRpHvSwGKSP08w==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47j7wrsc59-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Jul 2025 03:45:18 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5631gAX8021946;
	Thu, 3 Jul 2025 03:45:17 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 47juqptv84-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Jul 2025 03:45:17 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5633jDeE49873214
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 3 Jul 2025 03:45:13 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0891F20040;
	Thu,  3 Jul 2025 03:45:13 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 78E1520043;
	Thu,  3 Jul 2025 03:45:11 +0000 (GMT)
Received: from tp-ibm-com.ibmuc.com (unknown [9.111.78.175])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  3 Jul 2025 03:45:11 +0000 (GMT)
From: Ganesh Goudar <ganeshgr@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, mahesh@linux.ibm.com,
        Ganesh Goudar <ganeshgr@linux.ibm.com>
Subject: [PATCH] powerpc/eeh: parse AER registers
Date: Thu,  3 Jul 2025 09:15:04 +0530
Message-ID: <20250703034504.274940-1-ganeshgr@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=E/PNpbdl c=1 sm=1 tr=0 ts=6865fcce cx=c_pps a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17 a=Wb1JkmetP80A:10 a=VnNF1IyMAAAA:8 a=vpK28AJng4gpH6vAUrYA:9
X-Proofpoint-GUID: QGIv9BvIPmxZJw28ogrhG_AGLNSo1_yz
X-Proofpoint-ORIG-GUID: QGIv9BvIPmxZJw28ogrhG_AGLNSo1_yz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDAyNCBTYWx0ZWRfX1XlMWSphADaW HbY6PEnilUAdxvb6ekhZkmnzjUUziKcQftfblIMteNVRgdVIzpLO46GRLtS0oizsvukQPZsGm1v DERfzyXX0rTpVL9pjLaVOVr/+JOjq4weQMo6FhDBWRFsBvcBva6HDUcvJSjgWi39Cbfqq+CtLNe
 xSgOA9M1VGNTRJ5t51FLAELMEgw1aHWclR7LLzN7s+favb/xqGrvXGZOZGC8zoqFlvZJdRh2S5h RI/TRaTJudyFKXiu0FswE2xId06bpXJsgJNFPXLZyRkcHNX17H3b4Zb50Tp/WTCUSG9YJOiKElw I9hZ6oZ99BMmy10hQ6bZG34Y/TOd/Eb3LWtzFRoeWvogKdSwKQ0JjT1w8xQFkeLoyzqKq8OnNhB
 dde4aIsO8mpXa1CAR/x9iIBVCOCqw7Z7ixNueJoAtvZ092lHf6D4j1RSHIKTNkpPRouJnCqL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_01,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 suspectscore=0 mlxlogscore=837
 lowpriorityscore=0 mlxscore=0 clxscore=1015 adultscore=0 impostorscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507030024
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

parse AER uncorrectable and correctable error status
registers to print error type and severity.

output looks like
EEH:AER Uncorrectable Error
EEH:AER Error Type: Data Link Protocol Error [Fatal]

Signed-off-by: Ganesh Goudar <ganeshgr@linux.ibm.com>
---
 arch/powerpc/kernel/eeh.c | 84 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 83 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
index 83fe99861eb1..03e1e2eeb679 100644
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
@@ -160,6 +203,43 @@ void eeh_show_enabled(void)
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
+	if (!uncor_status && !cor_status)
+		return;
+
+	if (uncor_status) {
+		pr_err("EEH:AER Uncorrectable Error\n");
+		for (i = 0; i < ARRAY_SIZE(aer_uncor_errors); i++) {
+			if (uncor_status & (1 << i)) {
+				error_type = (i < ARRAY_SIZE(aer_uncor_errors))
+					     ? aer_uncor_errors[i] : "Unknown";
+				pr_err("EEH:AER Error Type: %s [%s]\n", error_type,
+				       (uncor_severity & (1 << i)) ? "Fatal" : "Non-Fatal");
+			}
+		}
+	}
+
+	if (cor_status) {
+		pr_err("EEH:AER Correctable Error\n");
+		for (i = 0; i < ARRAY_SIZE(aer_cor_errors); i++) {
+			if (cor_status & (1 << i)) {
+				error_type = (i < ARRAY_SIZE(aer_cor_errors))
+					      ? aer_cor_errors[i] : "Unknown";
+				pr_err("EEH:AER Error Type: %s\n", error_type);
+			}
+		}
+	}
+}
+
 /*
  * This routine captures assorted PCI configuration space data
  * for the indicated PCI device, and puts them into a buffer
@@ -237,9 +317,11 @@ static size_t eeh_dump_dev_log(struct eeh_dev *edev, char *buf, size_t len)
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


