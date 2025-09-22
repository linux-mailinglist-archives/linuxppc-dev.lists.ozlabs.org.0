Return-Path: <linuxppc-dev+bounces-12504-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 75676B8FB3F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Sep 2025 11:11:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cVcmj1bgqz307q;
	Mon, 22 Sep 2025 19:11:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758532293;
	cv=none; b=MmpSjtE2xlcxGHSiJTp2HUH2Cv35bOU2cgL4GzDPXyi7e6aSFRRZZ3yjHyzxJmruSZhFHp2wgz4u/EUeO9h8TYcJsdsWn7kOOIrlE5mQ5uy1i0gHU0l1SajK/MiBYOxAULeZrV6+43k/YWjM43q79mzomPY/rMex6p5MTJAOJdRztMHLFiT69HDthMHGUSg8VbKFurQfeS4qJYhg6PS7yS8R1ZinTvBEEWOkiZ2XS40WrmVAeSajzCpsj+836egbydDe9AawYRVm0REOxkEGSdgRErcnDAjnGcXNKsfbvNPUuElUfQMRjKSd9noXUiklmJ3VJ0qjzL+yilaW0IRm5w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758532293; c=relaxed/relaxed;
	bh=3BJrk0BdE0fOBGAbuCuEZ18blHaspCvJ9aAAGRPEOY8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bUeMAP44mLhCykDfir0FbHdOWfQsRLctWmCiL6OPL2VExuAl7bTuhnWCxrS7hl9KCKPJnH90lcrXZMiCdYykqZTDgli/CwwWC3JTcS+Hd6FyeF12iFcJkKXx3/EkLx6gqktHvqfb3MDWSp/v4Ag/3UOsN/th8DhpRsnVUf5XY0zIMMhOfibTzHLN11w5oSm6BvHqIqc4oBafUWFJ7OyGzJYNt3sPXmA+Ox1+dliNyBMtikdAQRnswBZTNOjFLfJeX7fy+x0cS//lP2cQnSytls7IDEWYqdJgPYCU7CX6r/X/eiheA7EP0W1jgt5hF4P/BK3n1On/SkBuIhpdfcCVaQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=b3rqtcjK; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=b3rqtcjK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cVcmh28K1z2xck
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Sep 2025 19:11:31 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58LN7EFW028147;
	Mon, 22 Sep 2025 09:11:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=3BJrk0BdE0fOBGAbuCuEZ18blHaspCvJ9aAAGRPEO
	Y8=; b=b3rqtcjKaIBbpaYdeURZh813ap4hBOr5/AAE34FCLSvS2Q3lswlHWiPwL
	ooq3OvY5ryXiNXvp7oJcq4JVFetkPPyuWGIzzvSyHkuiPKd7BH1VEHHaA7rmG2aF
	8O6R2LXqk3RtJShtO722Js13d3fKMqZvd1GgfJMZNIo24HY5WQr1IvqpNZiqi40x
	Yg5G5kI6uZCchAHJR5+ABRKr0Cek56AyyEOXpfzPkksRAjiCWVpD/TtnrHDlcBfW
	b7VL7zT94vWHlPdmbKu9lvcruk0QxK+Ug7Rx3fkj/gM2x7A/7dx6H2KociC3Cd19
	U8dFbcXHDZqXVd6pXUBrAth1bf65w==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 499jpk1gv6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Sep 2025 09:11:22 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 58M5mqHh013602;
	Mon, 22 Sep 2025 09:11:21 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([172.16.1.70])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 49a8tj55au-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Sep 2025 09:11:21 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 58M9B7qX28050112
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 22 Sep 2025 09:11:07 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B344D58059;
	Mon, 22 Sep 2025 09:11:17 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9FD5E5805C;
	Mon, 22 Sep 2025 09:11:16 +0000 (GMT)
Received: from li-4c4c4544-0038-3410-8038-c4c04f423534.ibm.com (unknown [9.61.38.248])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 22 Sep 2025 09:11:16 +0000 (GMT)
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, msuchanek@suse.de,
        mahesh@linux.ibm.com, tyreld@linux.ibm.com, hbabu@us.ibm.com,
        haren@linux.ibm.com, venkat88@linux.ibm.com
Subject: [PATCH] powerpc/pseries: Define __u{8,32} types in papr_hvpipe_hdr struct
Date: Mon, 22 Sep 2025 02:11:08 -0700
Message-ID: <20250922091108.1483970-1-haren@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=L50dQ/T8 c=1 sm=1 tr=0 ts=68d112ba cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=yJojWOMRYYMA:10 a=VnNF1IyMAAAA:8 a=eEXprAy8Ro1YEyqz3gwA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAxMCBTYWx0ZWRfX3ut5hfnHmGvj
 V8MIoS7bC8svUMomwwd5IIA5uot5eAMj+qqvYi2Ydn48nEMDp7zLgCakWGQBmdRPAXEKuqCSY+8
 6PH8r1jSlM8URBkfzG1RbVg2TSg/CdQ3FDMm/MpO4lk2BWrtvSQUbxJPu3Gixj8W7FVTCE3hdW1
 BnJgeeAFnksW5jR0abjjOwWdeuES2BMhLSxGNFipETm60qKf1J/p+EcZgAtQ2/6bbhWgEEpVcer
 Utz8DrIHa+5l0jEu0VTwN9ViLG2bTQTydeWGyBB9Lglbbym+Zaa5w8SO5FL/CqtLL6A54/fxzc0
 bKoXnVYG8pYCLmSzJyWHSnJEB/vcXIDjinStEjqO4qYZmMxmxa66fzOwdNkwLydkL2rfX3dy3ou
 NrQ+sk8l
X-Proofpoint-ORIG-GUID: ZMMPiZ8E_b29Wo_6AVc2fyJobgmo0ON0
X-Proofpoint-GUID: ZMMPiZ8E_b29Wo_6AVc2fyJobgmo0ON0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-22_01,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200010
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Fix the the following build errors with CONFIG_UAPI_HEADER_TEST:

./usr/include/asm/papr-hvpipe.h:16:9: error: unknown type name 'u8'
   16 |         u8 version;
./usr/include/asm/papr-hvpipe.h:17:9: error: unknown type name 'u8'
   17 |         u8 reserved[3];
./usr/include/asm/papr-hvpipe.h:18:9: error: unknown type name 'u32'
   18 |         u32 flags;
./usr/include/asm/papr-hvpipe.h:19:9: error: unknown type name 'u8'
   19 |         u8 reserved2[40];

Fixes: 043439ad1a23c ("powerpc/pseries: Define papr-hvpipe ioctl")
Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Signed-off-by: Haren Myneni <haren@linux.ibm.com>
Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
---
 arch/powerpc/include/uapi/asm/papr-hvpipe.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/include/uapi/asm/papr-hvpipe.h b/arch/powerpc/include/uapi/asm/papr-hvpipe.h
index 459a7bb0e6c9..f8794139d06a 100644
--- a/arch/powerpc/include/uapi/asm/papr-hvpipe.h
+++ b/arch/powerpc/include/uapi/asm/papr-hvpipe.h
@@ -13,10 +13,10 @@
  *        closed or the buffer has the payload.
  */
 struct papr_hvpipe_hdr {
-	u8 version;
-	u8 reserved[3];
-	u32 flags;
-	u8 reserved2[40];
+	__u8 version;
+	__u8 reserved[3];
+	__u32 flags;
+	__u8 reserved2[40];
 };
 
 /*
-- 
2.50.1


