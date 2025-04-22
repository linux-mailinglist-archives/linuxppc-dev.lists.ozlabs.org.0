Return-Path: <linuxppc-dev+bounces-7894-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 23555A967A2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Apr 2025 13:36:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZhgD74J7nz2yrM;
	Tue, 22 Apr 2025 21:36:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745321767;
	cv=none; b=UxM9Jj6l4Bcbm+syfpZEzQouBfc8oNx4+J/4sgbLKuKvRDvx+7f+QL+uh0gQJYwH2rrXmT2bdOGdxcOiyIGGL4hXXDCQ50t1zODUoTuzX0tN9H1dwdj+LJ7gCUjiknmlTtg5S2rXfEwPS+ldn4F5FwWWAN4o9n5BkPb2aR9Kc0/J3eYA2O66Ydy5ZRz6yiaDKooqtgVrguqqX+5cr2F2+dP+Zmxyoo6e7fCVP28WMjNdWlUaBgq3SWWH8XNPhjBcVTrKzKWiLiAHGxsTvxXLGTNuM+FqrLJjgNw5EAY3qo09RLqtRVQ4C6UXcDJU+viblmaqo432/kzInS3E/emOTw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745321767; c=relaxed/relaxed;
	bh=fpsJODj5JutLYmohCpLA3eB4xHy4F+tyVEr6wwbYVqc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LtGGH9aZqUbAzgdkSozJbdqDs6STnPAJHSf2IkvjG2YGxXWBUZxR9WWrUmrqt0J6yC+r5Y4L9KIhtkJMAvl4wPXr8NMtx9mrRwNCn0AllsGRKlu1hR3IWAquGhcQh9N45WduZWrXGIDkpikurC6mgdrPZAloLdWU9tkl0fZgGNp8y7mM1tjR678fbb5NwLmlKm6vNnKA28oHrU4aMgb4mgK8UaarLvx1bY8LZp/rJM0pjO1QbHUvZ0H/0f6UrhPdPcfv02jRP4lLvKe3F3qsMABNwCsV1asoonvdI2nZDom7zQDWjmiUOAKTPE4oea3WXki/AbJVokwh7nqXA6Xvqg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TuKGygT+; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TuKGygT+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZhgD42fMDz2yRZ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Apr 2025 21:36:03 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53MA48VQ026975;
	Tue, 22 Apr 2025 11:35:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=fpsJODj5JutLYmohCpLA3eB4xHy4F+tyVEr6wwbYV
	qc=; b=TuKGygT+T/VgN4q3+cAfCEHczpz20SPrgvGEMEqwzg7LH5CdSQdiJO+kc
	CFQ0ec6Djm36JYUX+UGS128PlAzgHWExRnZHmZPwldN1XUkJduh22zyvkCD18qyc
	ZnJNHnrKMd1bB0h3Sq7K4lED54XpE1DmdvZ4+C0zpLRjV1rKJ9djMMt9oBQrB02V
	fBA40RcXXQD3N164LW6JW8lIn1fc23Fbe+LWwiQI1uAWxjt9nYnyyHe70zijtf0a
	NKRfbRDpKGqrheB6pRMl8myf4xp4HRdegb5JxTqQLVZ6uL49sXFH18G9slQInt7X
	xthhoYuueKvGI33fqMn8RovPeW9Pg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46691hgcxs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Apr 2025 11:35:47 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53MBSEZg015608;
	Tue, 22 Apr 2025 11:35:47 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46691hgcxg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Apr 2025 11:35:47 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53MAkPZQ032622;
	Tue, 22 Apr 2025 11:30:45 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 464phyjsgd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Apr 2025 11:30:45 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53MBUhfV34013890
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Apr 2025 11:30:43 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 22F7920040;
	Tue, 22 Apr 2025 11:30:43 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 61C6B20043;
	Tue, 22 Apr 2025 11:30:38 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.89.251])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 22 Apr 2025 11:30:37 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu
Cc: naveen@kernel.org, linuxppc-dev@lists.ozlabs.org,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH] powerpc/boot: Fix dash warning
Date: Tue, 22 Apr 2025 17:00:23 +0530
Message-ID: <20250422113023.356883-1-maddy@linux.ibm.com>
X-Mailer: git-send-email 2.49.0
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
X-Authority-Analysis: v=2.4 cv=V7h90fni c=1 sm=1 tr=0 ts=68077f13 cx=c_pps a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17 a=XR8D0OoHHMoA:10 a=rOUgymgbAAAA:8 a=VnNF1IyMAAAA:8 a=eK3rdy_XGhdtUv4H5qYA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=MP9ZtiD8KjrkvI0BhSjB:22
X-Proofpoint-ORIG-GUID: ofL4Mf7a4W0W_2DqreU_HJwXjmI3Wr8F
X-Proofpoint-GUID: J5W66tde2a3UgPyuCGfAa32LR58ZAgWR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_05,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 clxscore=1015 mlxlogscore=999 bulkscore=0 phishscore=0
 lowpriorityscore=0 impostorscore=0 mlxscore=0 malwarescore=0 adultscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504220087
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Commit b2accfe7ca5b '("powerpc/boot: Check for ld-option support")' suppressed
linker warnings, but the expressed used did not go well with POSIX shell (dash)
resulting with this warning

arch/powerpc/boot/wrapper: 237: [: 0: unexpected operator
ld: warning: arch/powerpc/boot/zImage.epapr has a LOAD segment with RWX permissions

Fix the check to handle the reported warning. Patch also fixes
couple of shellcheck reported errors for the same line.

In arch/powerpc/boot/wrapper line 237:
if [ $(${CROSS}ld -v --no-warn-rwx-segments &>/dev/null; echo $?) -eq 0 ]; then
     ^-- SC2046 (warning): Quote this to prevent word splitting.
       ^------^ SC2086 (info): Double quote to prevent globbing and word splitting.
                                            ^---------^ SC3020 (warning): In POSIX sh, &> is undefined.

Fixes: b2accfe7ca5b '("powerpc/boot: Check for ld-option support")'
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Suggested-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
---
Patch applies clean on top of powerpc/fixes branch

 arch/powerpc/boot/wrapper | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/boot/wrapper b/arch/powerpc/boot/wrapper
index 267ca6d4d9b3..7dfd8e527253 100755
--- a/arch/powerpc/boot/wrapper
+++ b/arch/powerpc/boot/wrapper
@@ -234,7 +234,7 @@ fi
 
 # suppress some warnings in recent ld versions
 nowarn="-z noexecstack"
-if [ $(${CROSS}ld -v --no-warn-rwx-segments &>/dev/null; echo $?) -eq 0 ]; then
+if [ "$("${CROSS}"ld -v --no-warn-rwx-segments >/dev/null 2>&1; echo $?)" -eq 0 ]; then
 	nowarn="$nowarn --no-warn-rwx-segments"
 fi
 
-- 
2.49.0


