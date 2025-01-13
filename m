Return-Path: <linuxppc-dev+bounces-5145-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D45A0B4B2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jan 2025 11:40:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YWpgk3VnDz3cXq;
	Mon, 13 Jan 2025 21:40:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736764834;
	cv=none; b=IsYQe3LTtSlW0bP9fUt8D6ezF1t41uAjgK+4pAU6DdoJUVNF8UmJVwc5Y6U7TVZ+8xOTcKCGammcoVfM74ftbjS1iH+pDFf3oKMv2nUu4rErdsWpzByn2tTtOnYKRAqT8jl4td8+GtiFxv942HqYBpvUmgiDmPDl+5RUNh3gBuO0wnZrbMDfR41FKlk7I7GZeKBLFOGqnZ9zkwaaDL4ui9HXIUCwq0WlbGhaM48ZYkVa4vRpbt1wFKRXKxt8a5ZI5PWNQmweUcweyoscezOxSVgTYYjT2ku/su8x5RsCFlXvIqXnXe8qSpf/gz4zfe60EP3SSmakeNyINs98tTgthA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736764834; c=relaxed/relaxed;
	bh=Zz1ewnf5umyRtwvW3ZFlsF0yM/dhD1hBvztkDt0HZcs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BJeKO83q3FFP/vpHDl9Xi9a7HgwRVHSc/GEqu5WqyzDsIJY6UmCpFKd4bPOqgQ40cG6QVEILiL6eVQ4rFZOAe6S0uF8VCXPaZ01uqnXR8Sl/caVGxUZ/0nMQvfSWanzM+HcEMikwiS2rGKslO7Q98e2fHCG7i1TboOE7vByt7kHsXypgFmQQ1qCxu5DlC/5s2DFkZ6LHJgitDBuf3osUOsMV4EuLHzd1MguRBrs2f2JtvJN87XCBY8y4gkJQzoOU/Q8+aHnHOISmvWBTc/s10BHC0UJKbkmqdIILJJ/3mIyFjpHVLm5NDpwdxbSChlwTQ/Gaq+9L8kaoW9K+AqWi0Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gzY+I8Y0; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=adubey@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gzY+I8Y0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=adubey@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YWpgj2fsXz2yRF
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2025 21:40:33 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50D85Wbl032628
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2025 10:40:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=Zz1ewnf5umyRtwvW3
	ZFlsF0yM/dhD1hBvztkDt0HZcs=; b=gzY+I8Y0ZcOotG58xnyMbY4P//sHOfrAG
	x75ekpTABR94lvvx1fD7IrXZUN3Ki915Bxk+DbONwxUE/giAo7VEDGRuYRVnRTaT
	pJGWxjOhjZ6fUn98TkcjLDh2AOYeLyMyezm67q6/+Dq1fcBB+d0XyI8RRkKF0TBc
	ecKG2tKlffhRRWLAC61JSp9EG2EgIHlghibH3uNE6honP7Tqzq/ejJ095oiVQ03p
	TcMzgLpqrkNS3MZKxxps0F+1fua9MzeojkbHlm7SuTMhYqpU367wyrmkRlCG6RTw
	FMKJGTQ0SdW4gtkgBVjQMSQepmlDUKWoykcrwJB94a5XuI1HRykLw==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 444y12gkvc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2025 10:40:30 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50D7kJWZ004540
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2025 10:40:30 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4442ysdwtt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2025 10:40:30 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50DAeQsZ53215564
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 13 Jan 2025 10:40:26 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A16A92005A;
	Mon, 13 Jan 2025 10:40:26 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D65D72004B;
	Mon, 13 Jan 2025 10:40:25 +0000 (GMT)
Received: from ltcden3-lp4.aus.stglabs.ibm.com (unknown [9.53.174.155])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 13 Jan 2025 10:40:25 +0000 (GMT)
From: adubey@linux.ibm.com
To: maddy@linux.ibm.com, atrajeev@linux.ibm.com, hbathini@linux.ibm.com
Cc: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 3/3] powerpc: Document details on H_HTM hcall
Date: Mon, 13 Jan 2025 05:40:15 -0500
Message-Id: <20250113104015.290566-3-adubey@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20250113104015.290566-1-adubey@linux.ibm.com>
References: <20250113104015.290566-1-adubey@linux.ibm.com>
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
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: XHFhM8lAefiXDx2H1Pgj9mkpFxXskmq5
X-Proofpoint-GUID: XHFhM8lAefiXDx2H1Pgj9mkpFxXskmq5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 mlxlogscore=999 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501130089
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: Abhishek Dubey <adubey@linux.ibm.com>

Add documentation to 'papr_hcalls.rst' describing the
input, output and return values of the H_HTM hcall as
per the internal specification.

v3 patch:
  https://lore.kernel.org/linuxppc-dev/20240828085223.42177-3-maddy@linux.ibm.com/

Signed-off-by: Abhishek Dubey <adubey@linux.ibm.com>
Co-developed-by: Madhavan Srinivasan <maddy@linux.ibm.com>
Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
---
 Documentation/arch/powerpc/papr_hcalls.rst | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/arch/powerpc/papr_hcalls.rst b/Documentation/arch/powerpc/papr_hcalls.rst
index 80d2c0aadab5..805e1cb9bab9 100644
--- a/Documentation/arch/powerpc/papr_hcalls.rst
+++ b/Documentation/arch/powerpc/papr_hcalls.rst
@@ -289,6 +289,17 @@ to be issued multiple times in order to be completely serviced. The
 subsequent hcalls to the hypervisor until the hcall is completely serviced
 at which point H_SUCCESS or other error is returned by the hypervisor.
 
+**H_HTM**
+
+| Input: flags, target, operation (op), op-param1, op-param2, op-param3
+| Out: *dumphtmbufferdata*
+| Return Value: *H_Success,H_Busy,H_LongBusyOrder,H_Partial,H_Parameter,
+		 H_P2,H_P3,H_P4,H_P5,H_P6,H_State,H_Not_Available,H_Authority*
+
+H_HTM supports setup, configuration, control and dumping of Hardware Trace
+Macro (HTM) function and its data. HTM buffer stores tracing data for functions
+like core instruction, core LLAT and nest.
+
 References
 ==========
 .. [1] "Power Architecture Platform Reference"
-- 
2.39.3


