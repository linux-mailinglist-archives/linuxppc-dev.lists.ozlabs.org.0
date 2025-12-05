Return-Path: <linuxppc-dev+bounces-14649-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7281CCA7D0D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 05 Dec 2025 14:46:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dNCML3rbRz2yHB;
	Sat, 06 Dec 2025 00:46:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764942366;
	cv=none; b=aMjDd8vWagZy9l+amMttejPzRa27bhLj/PMI5dPZGnkzujL0trtHuUgXBLIitQaGy164rxoy+DIonLkIUjqIy+4h5EDZ326SdF9PyVWrDyOZndn4sn/Lin2QYB++BMFqB3548lS1H5k3ZcqjdE39uFy+hD0qt2WZIQk4+pHO59heeOfqNqY+Bbl42OEgEFRt6qZQI/JLexYGq3yX4VKyySVbjRAT46MwkGnCAC5qNeGxSXshMEHw//B/auiOiCDrIQlvVLwImFkDUu3xN3sWMrVK3OW0vmxDZnPMBJpcZ/pXP7NpBypfgKAD5Ia5D+ctnPMuxHDE9p2y/OI1LHaxAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764942366; c=relaxed/relaxed;
	bh=s43gknO5+HJewZG89vel4Fp6nmwF6b34l6NMf10M8uE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C4o/2ps3yfa+CSG0s/cyxM7KA1MY6kT+TKGsSJZVbDRQrw0kL51nx5dRfMJUeSr6H7OPi+wVMJ1jpnpMIwvE5GmZJS6PMIgk7WqjFdGxw6FLSI8wLZ0i9yyTYFBIM5wfJ4rXr5Bz732a/Op3yC+qwpCI32Diev9SC9PaNF1nv5ZHUR1z+pRblklJlc9Di6DcmO3e01RB7RUBvBd2Vfql09Kgna2UXB/DOUpKzhVYP023sjMbq7Gh1EAsBg7cBjBnIcJDhvnFHu615XkztmwKmODoSYN4Eh0tyNlldN/8ReapJVRHNs42yh+usVE/yX3Zjkgdmvf9SrMXyu8k3qcPtA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RLId+3z5; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nnmlinux@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RLId+3z5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nnmlinux@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dNCMK477rz2xPT
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 06 Dec 2025 00:46:05 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5B4N5edf029380;
	Fri, 5 Dec 2025 13:45:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=s43gknO5+HJewZG89
	vel4Fp6nmwF6b34l6NMf10M8uE=; b=RLId+3z5EcuToDVmBD/D75DXW+d7EaQxm
	D+FDwMrPzMvv39WRW7DroSCngG+8IxftTE09yEerQwGzrf0pRZOzGq67v1NosPLX
	s51uBmjr0f+DR5cWRTtHhA/zW/QRXid6JY3Ob1XrSoePOvN7eHrv024JfTfWhCS7
	BilgwwKdOZdh1EuOlpjGJNGXMRSe7X/QIJlcKqPRiENWyhTBNWOmacmMYdqXHbLB
	ckvI+GQaNFcoITddiwBacnvwiLh1D44+yMQ1uvuGYWMDpt/ohONZS5rCpbpmpTxf
	XADlkRqfmXm1rQi+P43hw5bRB9YJ4PcedSh1WOcgDwxvC5z9s4wgg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aqrh7dyr4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Dec 2025 13:45:54 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5B5DjrQU010995;
	Fri, 5 Dec 2025 13:45:53 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aqrh7dyr0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Dec 2025 13:45:53 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5B5C29G8003853;
	Fri, 5 Dec 2025 13:45:52 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4ardck59ap-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Dec 2025 13:45:52 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5B5Djmkc10617196
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 5 Dec 2025 13:45:48 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BEFC92004E;
	Fri,  5 Dec 2025 13:45:48 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5A46B20049;
	Fri,  5 Dec 2025 13:45:46 +0000 (GMT)
Received: from ltcd48-lp3.ltc.tadn.ibm.com (unknown [9.5.7.39])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  5 Dec 2025 13:45:46 +0000 (GMT)
From: Narayana Murty N <nnmlinux@linux.ibm.com>
To: mahesh@linux.ibm.com, maddy@linux.ibm.com, mpe@ellerman.id.au,
        christophe.leroy@csgroup.eu, gregkh@linuxfoundation.org,
        oohall@gmail.com, npiggin@gmail.com
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        tyreld@linux.ibm.com, vaibhav@linux.ibm.com, sbhat@linux.ibm.com,
        ganeshgr@linux.ibm.com, sourabhjain@linux.ibm.com
Subject: [PATCH 3/4] powerpc/pseries: Add RTAS error injection validation helpers
Date: Fri,  5 Dec 2025 03:45:09 -0600
Message-ID: <20251205094510.4671-4-nnmlinux@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=dK+rWeZb c=1 sm=1 tr=0 ts=6932e212 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=VnNF1IyMAAAA:8
 a=roLE4PQrIjLf_F_GOEgA:9
X-Proofpoint-GUID: IUZp5isjWve7TgoWp2-taf51ax91bns2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI5MDAyMCBTYWx0ZWRfX867lieRzBi7P
 rx19XrpnXO9LFO+2fl24ct7SX/1zwlwZLx+Jxlx2dj5ZPFseI2r2hJxJwK4xAQLvO7S/juLJrlf
 G5EnmJPqwk6T8cwWcze/Tdn7xoVgGDtL2rNQ2u7TJFoWIm74fZCyLgnCiIk56nbqiAlxAEz47tW
 kHfis86S+l/VG72C7eNuDtjIu5N8skjhqN7glIXgQAMQnVJ4cPX7EhOowTdFzsj90CpcFV3LBFK
 o4sUuMeDxq0pknfut1BX6nPFgKczeJ0DfSaunTfOpVV1Zw8atAj4ROmmQqs9xByRvDLqdQs9stw
 dptCGZBC6UwF9fvQuQL3D318zCHNOfDM9g0W5lJCFh6757aIdzuS+2MKPBsDmrvBWF1rPOCdRaB
 ZjWRMgZJkSXIiFthoBTLmJy46+hdmA==
X-Proofpoint-ORIG-GUID: F2VSgw1vE1UoBF1G4-bgjR89gAPi__jz
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

Add comprehensive validation helpers for RTAS error injection parameters:
- validate_addr_mask_in_pe(): BAR range validation
- validate_err_type(): Token range check
- Type-specific validators (special-event, corrupted-page, ioa-bus-error)

Signed-off-by: Narayana Murty N <nnmlinux@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/eeh_pseries.c | 261 +++++++++++++++++++
 1 file changed, 261 insertions(+)

diff --git a/arch/powerpc/platforms/pseries/eeh_pseries.c b/arch/powerpc/platforms/pseries/eeh_pseries.c
index b12ef382fec7..110e8cf10985 100644
--- a/arch/powerpc/platforms/pseries/eeh_pseries.c
+++ b/arch/powerpc/platforms/pseries/eeh_pseries.c
@@ -33,6 +33,10 @@
 #include <asm/ppc-pci.h>
 #include <asm/rtas.h>
 
+#ifndef pr_fmt
+#define pr_fmt(fmt) "EEH: " fmt
+#endif
+
 /* RTAS tokens */
 static int ibm_set_eeh_option;
 static int ibm_set_slot_reset;
@@ -786,6 +790,263 @@ static int pseries_notify_resume(struct eeh_dev *edev)
 }
 #endif
 
+/**
+ * validate_addr_mask_in_pe - Validate that an addr+mask fall within PE's BARs
+ * @pe:  EEH PE containing one or more PCI devices
+ * @addr: Address to validate
+ * @mask: Address mask to validate
+ *
+ * Checks that @addr is mapped into a BAR/MMIO region of any device belonging
+ * to the PE. If @mask is non-zero, ensures it is consistent with @addr.
+ *
+ * Return: 0 if valid, RTAS_INVALID_PARAMETER on failure.
+ */
+
+static int validate_addr_mask_in_pe(struct eeh_pe *pe, unsigned long addr,
+				    unsigned long mask)
+{
+	struct eeh_dev *edev, *tmp;
+	struct pci_dev *pdev;
+	int bar;
+	resource_size_t bar_start, bar_len;
+	bool valid = false;
+
+	/* nothing to validate */
+	if (addr == 0 && mask == 0)
+		return 0;
+
+	eeh_pe_for_each_dev(pe, edev, tmp) {
+		pdev = eeh_dev_to_pci_dev(edev);
+		if (!pdev)
+			continue;
+
+		for (bar = 0; bar < PCI_NUM_RESOURCES; bar++) {
+			bar_start = pci_resource_start(pdev, bar);
+			bar_len = pci_resource_len(pdev, bar);
+
+			if (!bar_len)
+				continue;
+
+			if (addr >= bar_start && addr < (bar_start + bar_len)) {
+				/* ensure mask makes sense for the addr value */
+				if ((addr & mask) != addr) {
+					pr_err("Mask 0x%lx invalid for addr 0x%lx in BAR[%d] range 0x%llx-0x%llx\n",
+					       mask, addr, bar,
+					       (unsigned long long)bar_start,
+					       (unsigned long long)(bar_start + bar_len));
+					return RTAS_INVALID_PARAMETER;
+				}
+
+				pr_debug("addr=0x%lx with mask=0x%lx validated in BAR[%d] of %s\n",
+					 addr, mask, bar, pci_name(pdev));
+				valid = true;
+			}
+		}
+	}
+
+	if (!valid) {
+		pr_err("addr=0x%lx not valid within any BAR of any device in PE\n",
+		       addr);
+		return RTAS_INVALID_PARAMETER;
+	}
+
+	return 0;
+}
+
+/**
+ * validate_err_type - Basic sanity check for RTAS error type
+ * @type: RTAS error type
+ *
+ * Ensures that the error type is within the valid RTAS error type range.
+ *
+ * Return: true if valid, false otherwise.
+ */
+
+static bool validate_err_type(int type)
+{
+	if (type < RTAS_ERR_TYPE_FATAL ||
+	    type > RTAS_ERR_TYPE_UPSTREAM_IO_ERROR)
+		return false;
+
+	return true;
+}
+
+/**
+ * validate_special_event - Validate parameters for special-event injection
+ * @addr: Address parameter (should be zero)
+ * @mask: Mask parameter (should be zero)
+ *
+ * Special-event error injection should not take addr/mask.  Rejects if either
+ * is set.
+ *
+ * Return: 0 if valid, RTAS_INVALID_PARAMETER otherwise.
+ */
+
+static int validate_special_event(unsigned long addr, unsigned long mask)
+{
+	if (addr || mask) {
+		pr_err("Special-event should not specify addr/mask\n");
+		return RTAS_INVALID_PARAMETER;
+	}
+	return 0;
+}
+
+/**
+ * validate_corrupted_page - Validate parameters for corrupted-page injection
+ * @pe:   EEH PE (unused here, for consistency)
+ * @addr: Physical page address (required)
+ * @mask: Address mask (ignored if non-zero)
+ *
+ * Ensures a valid non-zero page address is provided. Warns if mask is set.
+ *
+ * Return: 0 if valid, RTAS_INVALID_PARAMETER otherwise.
+ */
+
+static int validate_corrupted_page(struct eeh_pe *pe __maybe_unused,
+				   unsigned long addr, unsigned long mask)
+{
+	if (!addr) {
+		pr_err("corrupted-page requires non-zero addr\n");
+		return RTAS_INVALID_PARAMETER;
+	}
+	/* Mask not meaningful for corrupted-page */
+	if (mask)
+		pr_warn("corrupted-page ignoring mask=0x%lx\n", mask);
+
+	return 0;
+}
+
+/**
+ * validate_ioa_bus_error - Validate parameters for IOA bus error injection
+ * @pe:   EEH PE whose BARs are validated against
+ * @addr: Address parameter (optional)
+ * @mask: Mask parameter (optional)
+ *
+ * For IOA bus error injections, @addr and @mask are optional. If present,
+ * they must map into the PE's MMIO/CFG space.
+ *
+ * Return: 0 if valid or addr/mask absent, RTAS_INVALID_PARAMETER otherwise.
+ */
+
+static int validate_ioa_bus_error(struct eeh_pe *pe,
+				  unsigned long addr, unsigned long mask)
+{
+	/* Must map into BAR/MMIO/CFG space of PE */
+	return validate_addr_mask_in_pe(pe, addr, mask);
+}
+
+
+/**
+ * prepare_errinjct_buffer - Prepare RTAS error injection work buffer
+ * @pe:   EEH PE for the target device(s)
+ * @type: RTAS error type
+ * @func: Error function selector (semantics vary by type)
+ * @addr: Address argument (type-dependent)
+ * @mask: Mask argument (type-dependent)
+ *
+ * Clears the global error injection work buffer and populates it based on
+ * the error type and parameters provided. Performs inline validation of the
+ * arguments for each supported error type.
+ *
+ * Return: 0 on success, or RTAS_INVALID_PARAMETER / -EINVAL on failure.
+ */
+
+static int prepare_errinjct_buffer(struct eeh_pe *pe, int type, int func,
+				   unsigned long addr, unsigned long mask)
+{
+	u64 *buf64;
+	u32 *buf32;
+
+	memset(rtas_errinjct_buf, 0, RTAS_ERRINJCT_BUF_SIZE);
+	buf64 = (u64 *)rtas_errinjct_buf;
+	buf32 = (u32 *)rtas_errinjct_buf;
+
+	switch (type) {
+	case RTAS_ERR_TYPE_RECOVERED_SPECIAL_EVENT:
+		/* func must be 1 = non-persistent or 2 = persistent */
+		if (func < 1 || func > 2)
+			return RTAS_INVALID_PARAMETER;
+
+		if (validate_special_event(addr, mask))
+			return RTAS_INVALID_PARAMETER;
+
+		buf32[0] = cpu_to_be32(func);
+		break;
+
+	case RTAS_ERR_TYPE_CORRUPTED_PAGE:
+		/* addr required: physical page address */
+		if (addr == 0)
+			return RTAS_INVALID_PARAMETER;
+
+		if (validate_corrupted_page(pe, addr, mask))
+			return RTAS_INVALID_PARAMETER;
+
+		buf32[0] = cpu_to_be32(upper_32_bits(addr));
+		buf32[1] = cpu_to_be32(lower_32_bits(addr));
+		break;
+
+	case RTAS_ERR_TYPE_IOA_BUS_ERROR:
+		/* 32-bit IOA bus error: addr/mask optional */
+		if (func < EEH_ERR_FUNC_LD_MEM_ADDR || func > EEH_ERR_FUNC_MAX)
+			return RTAS_INVALID_PARAMETER;
+
+		if (addr || mask) {
+			if (validate_ioa_bus_error(pe, addr, mask))
+				return RTAS_INVALID_PARAMETER;
+		}
+
+		buf32[0] = cpu_to_be32((u32)addr);
+		buf32[1] = cpu_to_be32((u32)mask);
+		buf32[2] = cpu_to_be32(pe->addr);
+		buf32[3] = cpu_to_be32(BUID_HI(pe->phb->buid));
+		buf32[4] = cpu_to_be32(BUID_LO(pe->phb->buid));
+		buf32[5] = cpu_to_be32(func);
+		break;
+
+	case RTAS_ERR_TYPE_IOA_BUS_ERROR_64:
+		/* 64-bit IOA bus error: addr/mask optional */
+		if (func < EEH_ERR_FUNC_MIN || func > EEH_ERR_FUNC_MAX)
+			return RTAS_INVALID_PARAMETER;
+
+		if (addr || mask) {
+			if (validate_ioa_bus_error(pe, addr, mask))
+				return RTAS_INVALID_PARAMETER;
+		}
+
+		buf64[0] = cpu_to_be64(addr);
+		buf64[1] = cpu_to_be64(mask);
+		buf32[4] = cpu_to_be32(pe->addr);
+		buf32[5] = cpu_to_be32(BUID_HI(pe->phb->buid));
+		buf32[6] = cpu_to_be32(BUID_LO(pe->phb->buid));
+		buf32[7] = cpu_to_be32(func);
+		break;
+
+	case RTAS_ERR_TYPE_CORRUPTED_DCACHE_START:
+	case RTAS_ERR_TYPE_CORRUPTED_DCACHE_END:
+	case RTAS_ERR_TYPE_CORRUPTED_ICACHE_START:
+	case RTAS_ERR_TYPE_CORRUPTED_ICACHE_END:
+		/* addr/mask optional, no strict validation */
+		buf32[0] = cpu_to_be32(addr);
+		buf32[1] = cpu_to_be32(mask);
+		break;
+
+	case RTAS_ERR_TYPE_CORRUPTED_TLB_START:
+	case RTAS_ERR_TYPE_CORRUPTED_TLB_END:
+		/* only addr field relevant */
+		buf32[0] = cpu_to_be32(addr);
+		break;
+
+	default:
+		pr_err("Unsupported error type 0x%x\n", type);
+		return -EINVAL;
+	}
+
+	pr_debug("RTAS: errinjct buffer prepared: type=%d func=%d addr=0x%lx mask=0x%lx\n",
+		 type, func, addr, mask);
+
+	return 0;
+}
+
 /**
  * pseries_eeh_err_inject - Inject specified error to the indicated PE
  * @pe: the indicated PE
-- 
2.51.1


