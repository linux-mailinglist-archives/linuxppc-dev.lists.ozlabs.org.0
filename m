Return-Path: <linuxppc-dev+bounces-7906-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 916D1A96C2E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Apr 2025 15:12:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZhjMH3Zxwz3bxL;
	Tue, 22 Apr 2025 23:12:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745327547;
	cv=none; b=B3mGpYSFEEuKyJc6yJhIBi6OH5RTg+FWHoCSzWefJ65Cawx6M5P+mgh+V673FXjtCAZgeh6RoIxsWFoUAa+EN+rQFWcbQg67NrOS35fi7LLpxilPf9a4wjUg7qMsDQLEfsWRvULhDLHEkl/BXhZPNk/0PpJ1bTiGqkTBlf1/ovLVHmolv2GREMAZEGhMosWrOD+u9uBbgZ7k3Z8wLH2PGYmx1LRRo4m7VCRH80ZWe5It9HUzTiFKbTMKbI5flOiHVgAVYnAbr2vxkl8M8OuB5znulUxXb7hhBflJYH5HWQFSQnli0epxpQ99wvJ+LbB2ugwiaaXNG827cS+AoddD+A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745327547; c=relaxed/relaxed;
	bh=+4+wg2+6hIV1YuYSGh4g4k6eBwnWt6hvzeqg+9ZPuyA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TVdE+FD+45wEQmkbuWCq6uuHwHGMZqJw+FxuUXfgchp/dsOwhLiQ13NdkeGROFyFyndpWCDk6WUE3nOyuo7yMAVzBE85XGUm8J5nDGE5o6ibKPRfvqjBbTNGKr9q2w4MTwlJqm65AG2joqv4kgVnWO3/47N+XOZGxo2vxaQ9sk0q0j9glYlwNEvAy55iQBvxIsadxNp3jlAMv0GA+iVbEpfLIWC67vKlegX6YZfSI2UT5Y5+9suCdsKA9tQbe2+ld82KLFqExe8nrHFYl5YLuMc+ATOWc+s6Og9QoXEN5crE2vDROMW4AxcZbCHOd195V4i+FItSH77qdbt8WQP5+A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dAoe6Bvl; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dAoe6Bvl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZhjMG5jxLz3bsT
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Apr 2025 23:12:26 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53MA3rTF025939;
	Tue, 22 Apr 2025 13:12:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=+4+wg2+6hIV1YuYSG
	h4g4k6eBwnWt6hvzeqg+9ZPuyA=; b=dAoe6Bvl7/xqR1rvBuOunoqCkwlP1T3Xf
	QR6+xUsG3eiW83dlhlCYJQxPTVP4w1yxofX1/Macpd4WbAC3EqBqq6KlrF+jGCRG
	ZM4j/3iEenfoP7FtmgNRIm1XUIgtFe1M7rryK3QSuvx9d967mwfw15q4OePo5jCQ
	QzqQMML4qSU67Nr07ecBRjA9IQ4bW8nxoK+oM7NpknhHguHTBWNUW6p51Vh6FoPl
	DmV24ZyAVL9cuvsqJLxiHw3RSR7iVoPUn7oe9/P2OY/m72mzHhDJYjF4pQolUD1t
	ys1pf9ME56WkddtYH7L1p4sjSvoHZ7jZpxN7I5bsD0ocVUub56bCw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46691hgv11-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Apr 2025 13:12:14 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53MD7hP2000360;
	Tue, 22 Apr 2025 13:12:13 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46691hgv0v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Apr 2025 13:12:13 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53MB99kE002954;
	Tue, 22 Apr 2025 13:12:12 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 464q5njy4y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Apr 2025 13:12:12 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53MDCAlU50659656
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Apr 2025 13:12:10 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 656212006B;
	Tue, 22 Apr 2025 13:12:10 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 63C1520040;
	Tue, 22 Apr 2025 13:12:05 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.58.77])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 22 Apr 2025 13:12:03 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: mpe@ellerman.id.au, christophe.leroy@csgroup.eu
Cc: npiggin@gmail.com, naveen@kernel.org, linuxppc-dev@lists.ozlabs.org,
        Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: [PATCH 6/6] powerpc/boot/install.sh: Fix shellcheck warnings
Date: Tue, 22 Apr 2025 18:40:40 +0530
Message-ID: <20250422131040.374427-7-maddy@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=V7h90fni c=1 sm=1 tr=0 ts=680795ae cx=c_pps a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17 a=XR8D0OoHHMoA:10 a=VnNF1IyMAAAA:8 a=3dc1HHkJaZI8_K3iZDcA:9
X-Proofpoint-ORIG-GUID: XLMMcrqaTx6GfUavkDv5G-i8xHlvbCXs
X-Proofpoint-GUID: whZLM65DjEXfZlhIVP4JaQ9X5m2a7dHS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_06,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 clxscore=1015 mlxlogscore=981 bulkscore=0 phishscore=0
 lowpriorityscore=0 impostorscore=0 mlxscore=0 malwarescore=0 adultscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504220098
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Fix shellcheck warning such as
"Double quote to prevent globbing and word splitting." and
Use $(...) notation instead of legacy backticks `...`.

Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
---
 arch/powerpc/boot/install.sh | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/boot/install.sh b/arch/powerpc/boot/install.sh
index 101fcb397a0f..c3df6c27ce75 100755
--- a/arch/powerpc/boot/install.sh
+++ b/arch/powerpc/boot/install.sh
@@ -19,19 +19,19 @@
 set -e
 
 # this should work for both the pSeries zImage and the iSeries vmlinux.sm
-image_name=`basename $2`
+image_name=$(basename "$2")
 
 
 echo "Warning: '${INSTALLKERNEL}' command not available... Copying" \
      "directly to $4/$image_name-$1" >&2
 
-if [ -f $4/$image_name-$1 ]; then
-	mv $4/$image_name-$1 $4/$image_name-$1.old
+if [ -f "$4"/"$image_name"-"$1" ]; then
+	mv "$4"/"$image_name"-"$1" "$4"/"$image_name"-"$1".old
 fi
 
-if [ -f $4/System.map-$1 ]; then
-	mv $4/System.map-$1 $4/System-$1.old
+if [ -f "$4"/System.map-"$1" ]; then
+	mv "$4"/System.map-"$1" "$4"/System-"$1".old
 fi
 
-cat $2 > $4/$image_name-$1
-cp $3 $4/System.map-$1
+cat "$2" > "$4"/"$image_name"-"$1"
+cp "$3" "$4"/System.map-"$1"
-- 
2.49.0


