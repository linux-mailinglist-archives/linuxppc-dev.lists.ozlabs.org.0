Return-Path: <linuxppc-dev+bounces-10404-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 27443B11EEB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Jul 2025 14:45:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bpSJB07pGz30Yb;
	Fri, 25 Jul 2025 22:44:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753447497;
	cv=none; b=UVo89jUz3GozV/3Nc/mglJIGpGkb3Icd6nFNOqwRm0EgV4ymXylP+XqeJVYbSebmnOkAuxB49rGo+EI6AhO4JuJ8VAGOlS1tdzaP1Qucb9jN6SVBZaGkKSy3zPJ3NreblsGaKeYgMXRWXKUv9khtn4QJieT7AZybKs4NAsiE6NvWm/SyO5aVMNgeZVmTNtzfruyuf707aRXztHgfaybw8Z/7o8Xw8HfnDQXtmNVWln4M30JYo7P3fZYj79YiX/TvzpfX2gpCeYHJd7bMvqfOwjQ4HK2YF74VzBTabPQAAziyorrCeLL7tN4jKQ/U0yOdPR5HcIDyGVTmwzIdTaHM0w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753447497; c=relaxed/relaxed;
	bh=LhGoEkvDx81osjEVCD3xrJb4ydJ82npGxmrhpmy9hFA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eFTTNYgfawjNC1jjaqRB/5CQMxrANsvdVLY2YBFvu5jccDrltFqmtRCpQrwgnr2ox/RBSK2SZp973c6k2c9NQQyj2GN/EPgUODyRj/3XVnxbHZNXToO+lN98Vjf5dAPM31jkri9J1FClC2OVU76x2vkZFpUAic/PASvfQOCzPNS/nDBoiCPxnvBcWyZI6tdRH1fUy+PKowT9MEBd3mIGVGnsME5avpWJMhLN9BclHwwk0VWnlN/tY/GeA6I67ZIeHB6Mc0LURl27rjCqlF//bh5ocNdTV0pJHsCGo1UQ24j2hgrtCR42Q4ZRkccoxLG825aLnuDanfbRABNvwa1M8Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=noqytH8d; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=noqytH8d;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bpSJ86N7Rz30Qk
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Jul 2025 22:44:56 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56PBQ8od012183;
	Fri, 25 Jul 2025 12:44:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=LhGoEkvDx81osjEVCD3xrJb4ydJ82npGxmrhpmy9h
	FA=; b=noqytH8dGP/2wqcsnfZ1Wr8xJDeHIsHXqiQOzyCoNWUiurWInDPaQ7Lcd
	U5PhAhmpz+1cpB2/3cTis13Pawv/bOG8bBkNE5tyAxAspjyds4OmptQgdRaMtSgy
	rkY+z3dsCywGSHfK2+VQSPCJOmouXDoQUuuAeRuG+sy9x2NJWnvPbXb6b2ccGjZ8
	PrLhH/jWMXpbUE3p95KYFUmxlayUjTnAqa6org8yGH66XvFOQjPCxMQfZEyRZ6VG
	O6U8vvJYRTm/+8o5YsautKEbb/BNsfFxdWSYIuMoVNaKNKwhLR7/K8jHph2fIFcR
	CxoOqeGPJJqAwXdWhSsWxX2maaO9Q==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 483wchk365-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Jul 2025 12:44:46 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 56P9h5Ru024744;
	Fri, 25 Jul 2025 12:44:46 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 480rd2s9tx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Jul 2025 12:44:46 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 56PCigbB51511584
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Jul 2025 12:44:42 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 72A8120040;
	Fri, 25 Jul 2025 12:44:42 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 34E1920043;
	Fri, 25 Jul 2025 12:44:41 +0000 (GMT)
Received: from li-4f5ba44c-27d4-11b2-a85c-a08f5b49eada.ibm.com.com (unknown [9.111.62.194])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 25 Jul 2025 12:44:40 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>
Subject: powerpc/kexec_file: print configured kernel command line
Date: Fri, 25 Jul 2025 18:14:38 +0530
Message-ID: <20250725124438.327593-1-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.50.1
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
X-Authority-Analysis: v=2.4 cv=Q7rS452a c=1 sm=1 tr=0 ts=68837c3e cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=Wb1JkmetP80A:10 a=VnNF1IyMAAAA:8 a=fihODjdxrHx0HrrFdSIA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI1MDEwOCBTYWx0ZWRfXzj6762CCsJnJ
 ZH5+pgxkCpiXzBPR+yQ9jbxgMEfP6jZveJbj61FR76QaVWxl94ugXfhl3O/AuhCez8L55xUtQzp
 P3diHg644u8ilIxRe8yJRn0kV7N+l2uBLV3nyrg/IeuoDpIwS5jyWAoTVKCpF11q31fdk18gcD5
 ZuYW9mkrEo7GwOus8tVnGljhpsr3zhZ1aSH5pRuX9K6YaW9JdwpbETNwuiFbSWIyT0XfscmpSjD
 4o4iLwxr6FNDhcQQF7V4MFxZE6Ba8kJi5mf4l7Wkj8nWbaIWznIlrl9ex245IpDk5eb6ovyyTmZ
 YhN6HbswynU+H6GkwHFnAT9azu2CXx5sSt1Y/bdxKQgePJyXM0IbN9UunF8DQTnXezMJlJBoqWx
 edEi/PmFr956b3uNAX/AqK3zoJX+oIVSW2PMXN4YJNSwcw2vmaEToimlHJkd/WpvUrFQySBa
X-Proofpoint-GUID: k6kuGVEOV5CJha-ExvFjwGq8Wtg2Ygd_
X-Proofpoint-ORIG-GUID: k6kuGVEOV5CJha-ExvFjwGq8Wtg2Ygd_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-25_03,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxlogscore=999 impostorscore=0 adultscore=0
 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507250108
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Kexec with the -d option prints extra logs about the kexec/kdump kernel
that help debug kexec and kdump. For example, it shows what kexec
segments are loaded, their locations, and sizes.

One key piece of information still missing is the kernel command line
configured for the kexec/kdump kernel.

With this patch included, the kernel will print the kernel command line
configured for the kexec/kdump kernel as shown below:

kexec --initrd=./initrd ./kernel -lspd --command-line="test1 test2"

Loaded elf core header at 0x22e30000, bufsz=0x2000 memsz=0x80000
kexec_elf: Command line: elfcorehdr=0x22e30000 test1 test2   <--- New
kexec_elf: Loaded initrd at 0x22eb0000

Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
---
 arch/powerpc/kexec/elf_64.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/kexec/elf_64.c b/arch/powerpc/kexec/elf_64.c
index 5d6d616404cf..db0af790c784 100644
--- a/arch/powerpc/kexec/elf_64.c
+++ b/arch/powerpc/kexec/elf_64.c
@@ -90,6 +90,8 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
 		cmdline = modified_cmdline;
 	}
 
+	kexec_dprintk("Command line: %s", cmdline ? cmdline : "");
+
 	if (initrd != NULL) {
 		kbuf.buffer = initrd;
 		kbuf.bufsz = kbuf.memsz = initrd_len;
-- 
2.50.1


