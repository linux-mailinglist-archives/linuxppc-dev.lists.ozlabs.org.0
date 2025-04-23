Return-Path: <linuxppc-dev+bounces-7933-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 136DDA982FF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Apr 2025 10:22:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZjBtF4HPbz2yRZ;
	Wed, 23 Apr 2025 18:22:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745396549;
	cv=none; b=Ntu7TaDXi/YybK8zj/BcOw7SuPZ+eZDGJb+e8DvMZAxw2VYGCR1+2V9b6hqbQYGCD+IWk0jJ/+HosCuT3zIhY7UsRMxCEj7v9WLZifrDQjTn9L4kmhilaw7P7uzOHR6nc9Bgt6NhxgCggcVAZnnzHNt46r6WnjyJeGGVZOmxSdIvPIib/RH7mLQk88UjcQP7pn2Vc4jRXB0OD9DcQHLwwV+r35n4G9ymWiDvuihPEFALSzE57iZDLM8YIpAkQ8dABZfvJiIutQEmqxe8laNvDJZC0yPHQ55hJD1jp/7WK5voLtwuhn2n0xH7/Hh/2DCPGyr/Ws6f51Qy53IFXeCHHw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745396549; c=relaxed/relaxed;
	bh=OCgqTmK++0s7Q8nDZmYjpgL8gYuVarkNIZKnLBkKk7w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Vj1LYOuPxnP6Nrz42SVCYSFpg27snr3QAs+x4tM2PIVmFbS7kL1VACpdgd2BUk5UVnt1ZJrOArP3JSkvym1Jgk+Oz0FakRTpYSVvv3CpPqnGaTgbXLngPwMgGVcpDeACs4ZAhuJu91SGlBf4zMX+OTy4y4UuaMu+Z+Phhqk8ImXq0Mr1fG3PpTebzQKi55ObZFg+rQaXICoGW7H0qI6sBBw823N6ntd9ut1TzTcyedH4FpHPMlCZ8aj/i3tgx1A05114XCz/UuNDBv8VzaBa+0PZqHJShXJCXqZ1UhzQHLBOa913UmXFMWVhs9E1c8JfnEwQd91CPA5fHHwKLijAeQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=q6N1cSz3; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=q6N1cSz3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZjBtD47Ynz2xQ5
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Apr 2025 18:22:27 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53N6fwEd002619;
	Wed, 23 Apr 2025 08:22:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=OCgqTmK++0s7Q8nDZmYjpgL8gYuVarkNIZKnLBkKk
	7w=; b=q6N1cSz3XFGFzJH9Y3wbu8f5yv16Ej3wewuupgN+k3/L05wzxAkp52L0y
	VMpOYUqQWlKCMQtZMEXRgPfieX8Pp/8Tdl/fUGiYm8jO7+qOTClrR4Mi1wFe4cGT
	71Lu0c4ut+9I/gfVmEIaty1jqKN9Y9qoVLV8LrGGvjXZhxhgWMFTsrFg8nmYupvW
	9hzQNIxnr3Gt7ZMBqz4ROJhpG/CaU3u5/pkXtBC0SRP1jgktbWzdrGg7L8FxcIS1
	OzWYS+xUkgw7/EfRzXT69UEHVbMNsVgCEcNS2GCyLJtHyJQ6veVSkgXLdq0DmHTB
	lLkk/jdpnHx3+JhcvxFWfsoI7WGQg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 466jpt27yu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Apr 2025 08:22:08 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53N8J8r5026976;
	Wed, 23 Apr 2025 08:22:08 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 466jpt27yq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Apr 2025 08:22:08 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53N6jGOF000976;
	Wed, 23 Apr 2025 08:22:06 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 466jfxt4nw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Apr 2025 08:22:06 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53N8M4cQ55640396
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 23 Apr 2025 08:22:04 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1AD4120063;
	Wed, 23 Apr 2025 08:22:04 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9314F2004F;
	Wed, 23 Apr 2025 08:21:59 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.11.234])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 23 Apr 2025 08:21:59 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: mpe@ellerman.id.au, christophe.leroy@csgroup.eu
Cc: npiggin@gmail.com, naveen@kernel.org, linuxppc-dev@lists.ozlabs.org,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH v2] powerpc/boot: Fix dash warning
Date: Wed, 23 Apr 2025 13:51:54 +0530
Message-ID: <20250423082154.30625-1-maddy@linux.ibm.com>
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
X-Proofpoint-GUID: LIxVjy3vYElhjmKZPDYRrSRyu75IXyQu
X-Proofpoint-ORIG-GUID: rbdOwCxZelALHt-y235a-KVBU1-0OrHy
X-Authority-Analysis: v=2.4 cv=a/Qw9VSF c=1 sm=1 tr=0 ts=6808a330 cx=c_pps a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17 a=XR8D0OoHHMoA:10 a=rOUgymgbAAAA:8 a=VnNF1IyMAAAA:8 a=eK3rdy_XGhdtUv4H5qYA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=MP9ZtiD8KjrkvI0BhSjB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDA1MCBTYWx0ZWRfXx8dbmZ1JjKcm R+8t/lH8WdXRW9WQemDGqCjLPo00+mp22nUV1eLZy8PM58Z1OX1DD8AIIFIaRdsnRYws779iY0N PrJCI+f4Ilf2GuVmnxavWK3/JiAnsWcblTFvf1sN9SpQGjAjCfc61f/xoMnXaZpJMPU/Wos1WSP
 bIH7VuCQU0Se9t44EpZnAuKgeKZo9mUw3VfIDIoqNSRahml5w5KBwuDwWFR1/Q5NLagpyZT7+E4 s3eWyRvxj9JvkWdfzPqtOZENF+6kYpS37PYo92n5NoR7SXUQst809go1CN5YguzXcuLZobCAQDA JWgzEvu9PiCnPT9NBizHWsl0UEqE8cTUbBXpwpo6t2K2eFn9KjAnxPDNd6JjvodFCcw2uR+RMNL
 /r97xzLk9Hw0HzwtFSfjX1b/VnHaaovkR8E7MoSmdiS4az1d/xw8GRL3NzG5weiSsFlAtIEQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-23_05,2025-04-22_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 mlxscore=0 phishscore=0 malwarescore=0 mlxlogscore=999
 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230050
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
Changelog v1:
- modified the check to use the command exit
  state instead explicit checking with exit code
  
Patch applies on top of powerpc/fixes

 arch/powerpc/boot/wrapper | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/boot/wrapper b/arch/powerpc/boot/wrapper
index 267ca6d4d9b3..3d8dc822282a 100755
--- a/arch/powerpc/boot/wrapper
+++ b/arch/powerpc/boot/wrapper
@@ -234,7 +234,7 @@ fi
 
 # suppress some warnings in recent ld versions
 nowarn="-z noexecstack"
-if [ $(${CROSS}ld -v --no-warn-rwx-segments &>/dev/null; echo $?) -eq 0 ]; then
+if "${CROSS}ld" -v --no-warn-rwx-segments >/dev/null 2>&1; then
 	nowarn="$nowarn --no-warn-rwx-segments"
 fi
 
-- 
2.49.0


