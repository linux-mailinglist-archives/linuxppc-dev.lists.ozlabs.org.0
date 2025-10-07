Return-Path: <linuxppc-dev+bounces-12688-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4197ABC0809
	for <lists+linuxppc-dev@lfdr.de>; Tue, 07 Oct 2025 09:40:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cgp2y4XQ6z2ywC;
	Tue,  7 Oct 2025 18:40:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759822842;
	cv=none; b=YCBkfe2d5n0sxLtqPxEBkOji2wJ0d09a1SknTj+I5ImG9wW1SV+TKcPvMkpiiSRuYOciYhr4KNXeqdxrnAT6pOPnf3L6QgWLJckLYQxqikDMuiA/D1WXEsHMDs9b54nvqqny8KPzDEBRQJ+c/UNkF27L4RiIlpfoqomVPV0vqbshA8kcQ50J60VfF6c0MxnW9xGxEjQw/AdSA/nEQgxulFPkA7rhBRCYqex6uFtme4Tw0UeyaFML896WdI+w7d5XcxqS1EPx4HDMtvF2iZzbB0K2qQovwHI35Yi4rgFt6LpNwGQB16w7wCTvxOywKs7PSC9+d2GyJvtHYsO6Y/MpUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759822842; c=relaxed/relaxed;
	bh=6btHeG+cEec7LUDJMj4hmy3tByHcicC7LWgZCmAeg/M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=C8Bz1dut4Bi5wWMOK4QLxg5TAG8sWIR9J9OSu6Bm3xmCvwO80gy4E7+OC/gIroKtQbHk6qlTHQgLNV+t9uWjUij7OdoNShIxDdrS4LqWT3/DFr9mVNCa5uIVMhqC+k+mAvwWp8ogxiBsGcvpj2O8SCEaCm3eCmUs4+i7mB9O4SPWXktL4C3eQChb7LzrZDJIT3kAbjxXLfY+J33vQKBCVhck476cs78iya7MZ9YLheH94h2Ifp0b53AuN3j0P9qicwDJK3qLNo3kbmC8WO9EALpsQ4BGtPzhxnZQLCTdaKBl9olZ3PpReFMTLOfyjv+FuDLF4n8qDRSD1gFL6/KA+g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bFy7QuCt; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bFy7QuCt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cgp2x36VRz2xQ3
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Oct 2025 18:40:40 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 596JuXNs025919;
	Tue, 7 Oct 2025 07:40:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=6btHeG+cEec7LUDJMj4hmy3tByHcicC7LWgZCmAeg
	/M=; b=bFy7QuCtCUz/N0QTBsO/c6JVix8V9qKqwry/52R/AeJqT1NaoiWz5m2of
	Oh3VJNi/2PHQ5eXOpUuA+14icz9eluoJACAw9dVSSwgsmsYujrpsWex7Rm0NQfOM
	ZfPemY4818LpSonS6KdyMbq3ggTHn6ok2C7Ftun3O0WJ/S6/zoAL9YM81CZ1DGji
	IQzCZbZVir/eH9SNlAW4xb9+aTPw7PdYAi8TKgAokS7GFdrY7vl/h5U9oCiI2xD+
	K+6vQ2G1YzA1cgNE5HI63gXgOxkERToLJhfIMUA0jQl3djDJBuoOIV/Md5ubSK0L
	SwGV6D64FOdVyBWbN/GHgXumvHbCA==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 49ju8an646-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Oct 2025 07:40:31 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5974U3Cr000929;
	Tue, 7 Oct 2025 07:40:30 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 49ke9y29r9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Oct 2025 07:40:30 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5977eQ4Z16843056
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 7 Oct 2025 07:40:26 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CE5E12004D;
	Tue,  7 Oct 2025 07:40:26 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 790EB20043;
	Tue,  7 Oct 2025 07:40:25 +0000 (GMT)
Received: from li-4f5ba44c-27d4-11b2-a85c-a08f5b49eada.in.ibm.com (unknown [9.109.204.116])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  7 Oct 2025 07:40:25 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>,
        Hari Bathini <hbathini@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>
Subject: powerpc/fadump: skip parameter area allocation when fadump is disabled
Date: Tue,  7 Oct 2025 13:10:23 +0530
Message-ID: <20251007074023.176163-1-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.51.0
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
X-Proofpoint-GUID: IGELeIe_sL9KlD8wilj7T6OXz51OEdLl
X-Authority-Analysis: v=2.4 cv=BpiQAIX5 c=1 sm=1 tr=0 ts=68e4c3ef cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=x6icFKpwvdMA:10 a=VnNF1IyMAAAA:8 a=QiDuXLb1UPt30fVo6dwA:9 a=zZCYzV9kfG8A:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAyMiBTYWx0ZWRfX3EFT05ofCFQ/
 T4DuCFI3wKpxPBzWgUVOZ7B4/XiOWxjWfbY7MBW7V2sNbMFmLiNk12+LkOz7cQcc8bzf3VUTdvN
 JazsLLzTVvmFwVIdWqpatuj43wGBkQTMq/iX9oRNucMBuVNYLgbJLuCaYvKsdH7u2z2L66EMTHV
 DGauwHfGVDwlzkk/oFEYoWbmqe4xIzCff0nCyXXPv0TYHQI507rPDpNOTr4Yk38N0MRscaHH6bV
 ADTwt34ome+NOS2xexexPhfiFcycVPzC6M05VqSdVefEPzw+e+H0TLhJU+nGtFH2HRk9nhuULzP
 KNaw/wJXt3efwQgV3R8zVgru5yp6MzqMg6v9wnNfcp97DbhFm0oEslak8kT2CZ/kcO8ybUnzla6
 OWlUyTo+9zx0PcFUgwxVi1KRfhusww==
X-Proofpoint-ORIG-GUID: IGELeIe_sL9KlD8wilj7T6OXz51OEdLl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_07,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2510040022
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Fadump allocates memory to pass additional kernel command-line argument
to the fadump kernel. However, this allocation is not needed when fadump
is disabled. So avoid allocating memory for the additional parameter
area in such cases.

Cc: Hari Bathini <hbathini@linux.ibm.com>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
---
 arch/powerpc/kernel/fadump.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
index 5782e743fd27..4ebc333dd786 100644
--- a/arch/powerpc/kernel/fadump.c
+++ b/arch/powerpc/kernel/fadump.c
@@ -1747,6 +1747,9 @@ void __init fadump_setup_param_area(void)
 {
 	phys_addr_t range_start, range_end;
 
+	if (!fw_dump.fadump_enabled)
+		return;
+
 	if (!fw_dump.param_area_supported || fw_dump.dump_active)
 		return;
 
-- 
2.51.0


