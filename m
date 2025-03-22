Return-Path: <linuxppc-dev+bounces-7291-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 991C4A6CC97
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Mar 2025 22:11:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZKsSG0Jm8z2xmZ;
	Sun, 23 Mar 2025 08:11:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742677885;
	cv=none; b=b23TJy7gMp7Xd3mnrUes+dyHsHGViSyKdvbiC+ilR1Nopy6HANmifjtBJfDq1r8ReWy6mb96NkWkKYa1rhfKEavymZ1/lGMsfsWakbfX0jfRTqOyGMenyFSlMc0m5cR8sZF+cQbV2w6QekiIHla8538ehVMZQcVVA3tVB85UQWx85QsIoaOnzqceKc0tWSpKan1j9hvVW45rpZEKNIjpJM//+zm5BCU0DKIDQ0gA1rVPr3NsTGH372GbuVBKu2jmugsMW+duVeSH3rDL6NjvXRVFjMv9RguhLqeARw6KISIlu/tR4dw99sAKtaGU3KBfsL0kx8rXeVCy4vaUhFOugg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742677885; c=relaxed/relaxed;
	bh=bVVfrCJK+T/Fv+x04n5fAAuE5E9UgEqfzfsAU4caubo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=OnZfx4ThfcZnpSoa+b2z6fv2P41OcVsC/avRxht0vD5b6yJAGlqln2CxpuRgBDtSVAUC2Fqua4ES/618GjKP2fxrvle/WczNn5Nd5B6AXR4MYQU0/tZMmGPDNieKuT839cH3+8AAHd2sOnxAri2yxWLWzxMYQc06RpbSgUkH0HBzk5imu4EOjP0SWgEInPcv0O+oGB+OynVRuLrtIgD+WJilJtEJySPCI383TV23EtjGXP3bFAKehETv3u3TEV4qtb3PdfWpYUrtGXq8nr3RXvvfUVDlK0YUDQiJTnb+QAum13c82NoQujIQ64BdxSUqQNIm6n7WDWoILl3+1YasjQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VZS1nKi3; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=misanjum@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VZS1nKi3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=misanjum@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZKsSF0M38z2xjP
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 23 Mar 2025 08:11:24 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52MJkYnr005489;
	Sat, 22 Mar 2025 21:11:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=bVVfrCJK+T/Fv+x04n5fAAuE5E9U
	gEqfzfsAU4caubo=; b=VZS1nKi3WBhbPJy2VuAfNzXnvGFABjyCKIPZ4n7M2EXb
	FkS/L0V/lubE1+rP/4Wc/Kxx6oAlD//jMyMHQw8fo5HKtl/i71HJOiZGZNwmr+uW
	7Qt86VJ1ZPkkIhQv1mxQjcYcL4JzG4kjMtB2YIsfy9qDC6L1r1/bWBhfrjBA97L7
	lNHTNAM84mEulF7Xr//BuY/7oyk4RSDz1z1yYvgUFgmhfnGNapAg5eSyJ5P3/4HB
	rY/sMmwub+Hd2WwlvNA9ufDxp/5zcZLsqm50w3709ddcC72vnNYmhdSl8IPk5Z8X
	zX7b0TOjzSP3xIvm4Jj5elt49mcUsGwHPOQ/mHvj4g==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45hxmns5nx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 22 Mar 2025 21:11:12 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 52MLBCHK026265;
	Sat, 22 Mar 2025 21:11:12 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45hxmns5nu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 22 Mar 2025 21:11:12 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 52MJ6aGH003480;
	Sat, 22 Mar 2025 21:11:11 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 45hn8d2xr5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 22 Mar 2025 21:11:10 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 52MLB6f050069822
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 22 Mar 2025 21:11:06 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BE0A420043;
	Sat, 22 Mar 2025 21:11:06 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6974620040;
	Sat, 22 Mar 2025 21:11:05 +0000 (GMT)
Received: from ltcden6-lp1.aus.stglabs.ibm.com (unknown [9.3.101.155])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sat, 22 Mar 2025 21:11:05 +0000 (GMT)
From: Misbah Anjum N <misanjum@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, naveen@kernel.org,
        linux-kernel@vger.kernel.org
Subject: [RFC PATCH] arch/powerpc: Remove redundant typedef for bool
Date: Sat, 22 Mar 2025 16:11:04 -0500
Message-ID: <20250322211104.231795-1-misanjum@linux.ibm.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ukyu0jHVoQlVmz2zErze3Diy-8U7OqBB
X-Proofpoint-GUID: ckjNjkZ-Ay5mhKq30Y2qB9xrL7Bsd4Iw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-22_09,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 impostorscore=0 phishscore=0 mlxlogscore=415 lowpriorityscore=0
 malwarescore=0 suspectscore=0 mlxscore=0 priorityscore=1501 clxscore=1011
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503220158
X-Spam-Status: No, score=-1.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The custom 'bool' typedef in arch/powerpc/boot/types.h is incompatible with
the C23 standard, where 'bool', 'true', and 'false' are now reserved keywords.
With newer GCC versions (such as GCC 15), redefining 'bool' leads to compilation
errors. For example:
    error: 'bool' cannot be defined via 'typedef'

Since 'stdbool.h' is already included and provides a standard definition for
'bool', this typedef is redundant and can be removed to avoid conflicts.

Compilation Error:
    $ make -j$(nproc)
    ....
    In file included from arch/powerpc/boot/ops.h:13,
                     from arch/powerpc/boot/cuboot.c:12:
    arch/powerpc/boot/types.h:43:13: error: ‘bool’ cannot be defined via ‘typedef’
    43 | typedef int bool;
        |             ^~~~
    arch/powerpc/boot/types.h:43:13: note: ‘bool’ is a keyword with ‘-std=c23’ onwards
    arch/powerpc/boot/types.h:43:1: warning: useless type name in empty declaration
    43 | typedef int bool;
        | ^~~~~~~
    ....
    make[2]: *** [arch/powerpc/boot/Makefile:235: arch/powerpc/boot/devtree.o] Error 1
    make[2]: *** [arch/powerpc/boot/Makefile:235: arch/powerpc/boot/ofconsole.o] Error 1
    make[2]: *** [arch/powerpc/boot/Makefile:235: arch/powerpc/boot/ns16550.o] Error 1
    make[2]: *** [arch/powerpc/boot/Makefile:235: arch/powerpc/boot/main.o] Error 1
    make[1]: *** [arch/powerpc/Makefile:236: zImage] Error 2
    make: *** [Makefile:251: __sub-make] Error 2

Signed-off-by: Misbah Anjum N <misanjum@linux.ibm.com>
---
 arch/powerpc/boot/types.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/powerpc/boot/types.h b/arch/powerpc/boot/types.h
index 8a4c418b7..abae1e93a 100644
--- a/arch/powerpc/boot/types.h
+++ b/arch/powerpc/boot/types.h
@@ -40,8 +40,6 @@ typedef s64 int64_t;
 #define min_t(type, a, b) min(((type) a), ((type) b))
 #define max_t(type, a, b) max(((type) a), ((type) b))
 
-typedef int bool;
-
 #ifndef true
 #define true 1
 #endif
-- 
2.49.0


