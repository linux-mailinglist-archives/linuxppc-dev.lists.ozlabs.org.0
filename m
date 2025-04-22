Return-Path: <linuxppc-dev+bounces-7903-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E11A96C28
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Apr 2025 15:12:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZhjLg41S3z3c0n;
	Tue, 22 Apr 2025 23:11:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745327515;
	cv=none; b=g2EC4ldrH8Anvds1QSXNnwDj2ccV4MSHYW81hgoXu3pO3DFkj32YC6rMkk/CobQoq5KVrnQjJb4jPdrrKvU4RC83qlO9NRYi3om9FjLBpVC77tRadVXL1Y3WWPlPDxM0sCEIN+xzYCJjWIgNMBsTx9xoXVw8TbhUAooE/qXyxq3QfnklFuMsm3XxEe6AgbA1Hg/XaUzMtkcl2tdSseOf1Z2teEK+w5jO60uzl6u1wdkZnwjC5hQZTp5EK9lcRZ4v1zAmNpEBRQFg45YMXn49DAao6tF6cYYpc2eg96o75/qL8+kYzP5FJzc2+WBTSUWnFjCBzkkAADXS/btJJnPEGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745327515; c=relaxed/relaxed;
	bh=YAJvx0cbiOoBz2Bbg2VR2VHgAKPnNinJBOSlulB7KS0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Fx86fT0/j3Zq5kGe0giUrV5FmsxLnB/KCFbWg3oFEU4dwvRbW/f2k7Qym+bLR5qrtoV1OBo9DG0KZr962L9iS/RxjUDFbPVI6pKjcRhtx4urwegG6/kOfYLMML9vHaeaL3kZebsAxldKZ6/2WmudMY+Iwc+1tcN9sdYZm03bPZnqxxijxV1R6Y+/vBK8Nw5LrUf004+3ft9bSAdW/SyAurtsYO9xKrb/ULaEfvGDiBM2OWgMZHUK2WhtfW7Vr6oGfXaZ3pNkFbLzW3XrzV4uiSO+8ibnd8WESSfMS1pzKgEXh9XuDPO9pQG5b8b4wD4PFQFzLCpZvQUO7SxrrEeDtw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rZLJWr65; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rZLJWr65;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZhjLf70Zhz304l
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Apr 2025 23:11:54 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53MD7OaI027680;
	Tue, 22 Apr 2025 13:11:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=YAJvx0cbiOoBz2Bbg
	2VR2VHgAKPnNinJBOSlulB7KS0=; b=rZLJWr65syCS0ce568ynyzpIJII9ImQiX
	NCvO1P+PfloCrkMtUNfHu49xkHpYCzCLsjBxsgKggJR5e/4VuHwAulPk9mxHgZBY
	Obi2lce9c8KHgnQA5ErrOtmi96m+WcI8indh89ckJToPeUq6GGoJAqLadCRnBw55
	ibfW4h7mkIK2s5JEFjypM81oVafLV/SpzN2FgVUg6Q0qVonE7vBHjq8KTJJhdk8Y
	mcoeIAmmuXMfweR1ofyEdFunMyC+fGsquBQ77D/JZvwih/vKprJ4PcmTrwsZ+lwA
	YJxlKTJtW1nbuxTKBPrLY7URcCRwfmNF2Oq3iAj2E0QpsIuzZjZsQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 466bq980kq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Apr 2025 13:11:42 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53MDBg8O005837;
	Tue, 22 Apr 2025 13:11:42 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 466bq980kj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Apr 2025 13:11:42 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53MAcj5X012501;
	Tue, 22 Apr 2025 13:11:41 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 464p5t362n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Apr 2025 13:11:41 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53MDBdT151642718
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Apr 2025 13:11:39 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 685BB20063;
	Tue, 22 Apr 2025 13:11:39 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5C6FB2004E;
	Tue, 22 Apr 2025 13:11:34 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.58.77])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 22 Apr 2025 13:11:32 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: mpe@ellerman.id.au, christophe.leroy@csgroup.eu
Cc: npiggin@gmail.com, naveen@kernel.org, linuxppc-dev@lists.ozlabs.org,
        Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: [PATCH 3/6] powerpc/perf:make isa207_pmu_format_group struct static
Date: Tue, 22 Apr 2025 18:40:37 +0530
Message-ID: <20250422131040.374427-4-maddy@linux.ibm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250422131040.374427-1-maddy@linux.ibm.com>
References: <20250422131040.374427-1-maddy@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: ARJxPHDwZZgtoRlVGZs91fKZ6r7pUzSm
X-Proofpoint-GUID: C0VT57MTYKSaP1AWX0EG74YwKOj6PyaK
X-Authority-Analysis: v=2.4 cv=cvabk04i c=1 sm=1 tr=0 ts=6807958e cx=c_pps a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17 a=XR8D0OoHHMoA:10 a=VnNF1IyMAAAA:8 a=vKaB1OlEhVtPGgZr2O4A:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_06,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=836
 priorityscore=1501 impostorscore=0 adultscore=0 suspectscore=0 spamscore=0
 bulkscore=0 phishscore=0 mlxscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504220098
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

isa207_pmu_format_group struct is local to the source and does not need to
be in global scope, so make it static

Cleans up sparse warning:
arch/powerpc/perf/isa207-common.c:40:30: warning: symbol 'isa207_pmu_format_group'
was not declared. Should it be static?

Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
---
 arch/powerpc/perf/isa207-common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/perf/isa207-common.c b/arch/powerpc/perf/isa207-common.c
index 2b3547fdba4a..bbef51849f33 100644
--- a/arch/powerpc/perf/isa207-common.c
+++ b/arch/powerpc/perf/isa207-common.c
@@ -37,7 +37,7 @@ static struct attribute *isa207_pmu_format_attr[] = {
 	NULL,
 };
 
-const struct attribute_group isa207_pmu_format_group = {
+static const struct attribute_group isa207_pmu_format_group = {
 	.name = "format",
 	.attrs = isa207_pmu_format_attr,
 };
-- 
2.49.0


