Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A6C5B68D0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Sep 2022 09:41:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MRb5H2tGTz3cFW
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Sep 2022 17:41:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CPAP/gRr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=disgoel@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CPAP/gRr;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MRb3v2HW0z2xkn
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Sep 2022 17:40:42 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28D7bwCd002806;
	Tue, 13 Sep 2022 07:40:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=Bg/TPnWX9eKD16sbsc58iLeRzxetuRhjyQIz+yCmLC8=;
 b=CPAP/gRrko83bEvGBHMdBr4C7UgODXChn2aWduusjKjmO3vbBg31bh6bWo76u+Fsx8Eo
 xflZaRlWHWKL0j4ygGVAbSqZsJNma5XeOOxbjjluOUtsFywrsEoQsO5pheBTnSOmO8w/
 KuT3SaqDVrFHH8bRUKeYffEyZhMGtTiAE5PR8w0woEu4vrSUmsG+8FGtMozKjIR3V9yF
 1ps88saeTV0xpny/Zlla542vWDbPa2+XxyvmZ463p0ekldx2yLt5UIuK50IxEHt82ag9
 34Kc7OHvcjEdF5yO2iLdmoRICzZgrJUi66bH1fvmeOkciAWWg+ahbIt1GIQVFHWeIQMA Yw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jjmjatb49-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Sep 2022 07:40:36 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28D7cCLt008222;
	Tue, 13 Sep 2022 07:40:36 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com [159.122.73.72])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jjmjatb3c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Sep 2022 07:40:36 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
	by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28D7b2O8003116;
	Tue, 13 Sep 2022 07:40:34 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
	by ppma06fra.de.ibm.com with ESMTP id 3jghuhthq7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Sep 2022 07:40:34 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com [9.149.105.62])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28D7eVDY35848522
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 13 Sep 2022 07:40:31 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EA5F2AE045;
	Tue, 13 Sep 2022 07:40:30 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8F501AE053;
	Tue, 13 Sep 2022 07:40:29 +0000 (GMT)
Received: from disgoel-ibm-com.in.ibm.com (unknown [9.199.154.114])
	by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Tue, 13 Sep 2022 07:40:29 +0000 (GMT)
From: Disha Goel <disgoel@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH 1/4] powerpc/asm-offset: Remove unused KVM_TLB_SETS macros
Date: Tue, 13 Sep 2022 13:10:22 +0530
Message-Id: <20220913074025.132160-2-disgoel@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220913074025.132160-1-disgoel@linux.vnet.ibm.com>
References: <20220913074025.132160-1-disgoel@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: vPXzMu6Bol0zZIHyakl6eAvG19Zw1iH_
X-Proofpoint-ORIG-GUID: azlXHVb8d6IjudpEMRLa-WfJE0OcDI3r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-13_02,2022-09-12_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 malwarescore=0 adultscore=0 mlxlogscore=999 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 mlxscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2209130033
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
Cc: atrajeev@linux.vnet.ibm.com, kjain@linux.ibm.com, npiggin@gmail.com, maddy@linux.ibm.com, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit 2e1ae9cd56f8 ("KVM: PPC: Book3S HV: Implement radix
prefetch workaround by disabling MMU") removed usage of
KVM_TLB_SETS macro as part of fixing radix prefetch workaround.
But the patch missed to remove the asm-offset macro definition
which was used in the assembly files and now this is un-used.
Patch fixes by removing this.

Fixes: 2e1ae9cd56f8 ("KVM: PPC: Book3S HV: Implement radix prefetch workaround by disabling MMU")
Signed-off-by: Disha Goel <disgoel@linux.vnet.ibm.com>
---
 arch/powerpc/kernel/asm-offsets.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/kernel/asm-offsets.c b/arch/powerpc/kernel/asm-offsets.c
index 8c10f536e478..d5d9c1dcef1c 100644
--- a/arch/powerpc/kernel/asm-offsets.c
+++ b/arch/powerpc/kernel/asm-offsets.c
@@ -418,7 +418,6 @@ int main(void)
 
 	/* book3s */
 #ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
-	OFFSET(KVM_TLB_SETS, kvm, arch.tlb_sets);
 	OFFSET(KVM_SDR1, kvm, arch.sdr1);
 	OFFSET(KVM_HOST_LPID, kvm, arch.host_lpid);
 	OFFSET(KVM_HOST_LPCR, kvm, arch.host_lpcr);
-- 
2.31.1

