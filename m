Return-Path: <linuxppc-dev+bounces-8493-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2512BAB271C
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 May 2025 10:04:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZwFdF3sxHz2yf5;
	Sun, 11 May 2025 18:04:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746950673;
	cv=none; b=gJcdmKllU98qn3xLaOu+/8iDdGLdKl9roxhSVMkqDE4AOXOoVJ5gjLY4aJrHcpqw5bSyoh1WM1WAFjdEI2+34jVyvO8wkfsskf6VJmfbmqQyTVchUjp10Tte6RzasGs2PrpJdnN49c1Eoa9kSQlVMrMBkScIQ8vRhiLGW4/8vo6F+epy5xcAoigKhN6FrlR6QQWWTN3+AogPtDKwrwKsxJaXQMz8SB0uhLiY2VpfrkF6Dc0MiCrdLQE9aHsUZ4Kj/BGnz13eKe2K+ULCn207v5Px3hAWa9DcnSW8eprFTmg15kyU29txuwLODma7TxRiKvT3tyOo6plRGqpf6fAZKw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746950673; c=relaxed/relaxed;
	bh=DUCK09dwFCrB2CVorkVehhdHkTsNNOgekUtBXnRIkAY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=V1B5M6MDAz8N3qqoOwOxZhqYVSoxvdGCej9TXydBEpB58d2pxOnzFITHm8M0VOLe7gvcuZ9ZijZxItr26aKetNtIheYU03o+xYm8okExawxvXfa1OOrSRNeGyKy3zvTovmTiOm5wTYennF6PuspS+ndak8alhO3M6kmHPsW5IYj0aFIwV8wq+sGJ1PbejMpps6pcRL+vt6OITWkOe0vKXGIBPLPMnEyfJ5jEde9m5cYtlmFvSqHpnpqn6Brz/shjlQi+BAgLWITiqr+yh/8ECw3W0dgEoDJR1Jz0480ZboQQxoRl8K2EsfuXc4aX9IIq3AuKl9nOJs1zUfjnZopo3w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ctrc/ZhJ; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ctrc/ZhJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZwFdD3yk5z2y82
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 11 May 2025 18:04:32 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54B6K5n8026398;
	Sun, 11 May 2025 08:04:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=DUCK09dwFCrB2CVorkVehhdHkTsNNOgekUtBXnRIk
	AY=; b=ctrc/ZhJ7PDJicOoejKCSCHoyQMRh4/3mu7pjF0ZZZkEbgQNSwOLyfOgA
	m5DeYMXCqVrCeOsEhPTt8X/FUOrgqI2FJstCJ31jPa8pCohCc9kL9K4INCU268QP
	xFbqlDSjsN5k6+IXQELNhgPFWVcvlG5C71utJkZ2i/21xd9TEjNyh70LYu7hKExq
	beBw/dK9KSd68Qb/QYlcDfdLwEfHz4OqEz18IdD66hXrxbrjGx0kXxh8HlGeQyrY
	z05RF/3G3t9OS77/p6ZGxvEdXXIb3Jf7FCy5bUo8uKeDGLXrnuqR0PqLyIHr9fnI
	ITwDKefE+x9CyM2bS1VjB8sQ7b2vg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46jpgsg6bs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 11 May 2025 08:04:16 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54B84Fnl020151;
	Sun, 11 May 2025 08:04:16 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46jpgsg6bp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 11 May 2025 08:04:15 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54B5xcJ1016400;
	Sun, 11 May 2025 08:04:15 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 46jh4t96cy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 11 May 2025 08:04:14 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54B84DTV36569406
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 11 May 2025 08:04:13 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 255D22004E;
	Sun, 11 May 2025 08:04:13 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 24C2C2004F;
	Sun, 11 May 2025 08:04:10 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.94.111])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun, 11 May 2025 08:04:09 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu
Cc: naveen@kernel.org, linuxppc-dev@lists.ozlabs.org,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Tulio Magno <tuliom@ascii.art.br>
Subject: [PATCH] powerpc: Fix struct termio related ioctl macros
Date: Sun, 11 May 2025 13:34:04 +0530
Message-ID: <20250511080404.861898-1-maddy@linux.ibm.com>
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
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 8iUWdOhMvcuOmbaMGuHYxDO1OonZrw9v
X-Proofpoint-GUID: Sb8a2W7M-CNIeVEFOmlazBYCjveypkmS
X-Authority-Analysis: v=2.4 cv=JaC8rVKV c=1 sm=1 tr=0 ts=68205a00 cx=c_pps a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=VnNF1IyMAAAA:8 a=_0Tql7rU0DzFU8f1vMoA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTExMDA3NCBTYWx0ZWRfXwiCfyDyMVFp7 fJem0H/BMorScW33znJAHYIgidagT4DEyNu7Qg3ye7YFE/6BT26EtKRDEETHUgcLa06ojBRLXiZ VmSbFWnRvxinWMEO6j7NMqtMQSWHx/vyl/VCai5aJ0LYVK8YEOKP7vxngZ3DGWcUO13kn3UWWUF
 W4YP5/grTVrZd3WcsFJlK9Bn66IzZxmjv8JUvPZ1748ltLPgbb3G5gempYUuMtXxCsu3b5v3c0V omGQ4lYUcve3SUVuyfzF3lOuEY7UIVIPuE4ga+RDHUtQ0ymJOGlUVd/bc6XkzxKqzcJtjTiqyBu 7pAbCsNbyqHVr34lJdVS8K8U7bESXwqkkJU7WhbuAMQn1/WX5vU8HkocVpi0Eb1hrO3kfMc+0IB
 whx9VHS/UxEJoK1TUa74u2I4CDBwWQJJJSeVWDQbOkYKtNmZroC9PHo7RVnnAm+IgASodxfw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-11_03,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 clxscore=1011 phishscore=0 impostorscore=0 mlxlogscore=689
 priorityscore=1501 mlxscore=0 spamscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505110074
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Since termio interface is now obsolete, include/uapi/asm/ioctls.h
has some constant macros referring to "struct termio", this caused
build failure at userspace.

In file included from /usr/include/asm/ioctl.h:12,
                 from /usr/include/asm/ioctls.h:5,
                 from tst-ioctls.c:3:
tst-ioctls.c: In function 'get_TCGETA':
tst-ioctls.c:12:10: error: invalid application of 'sizeof' to incomplete type 'struct termio'
   12 |   return TCGETA;
      |          ^~~~~~

Even though termios.h provides "struct termio", trying to juggle definitions around to
make it compile could introduce regressions. So better to open code it.

Reported-by: Tulio Magno <tuliom@ascii.art.br>
Closes: https://lore.kernel.org/linuxppc-dev/8734dji5wl.fsf@ascii.art.br/
Suggested-by: Nicholas Piggin <npiggin@gmail.com>
Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
---
 arch/powerpc/include/uapi/asm/ioctls.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/include/uapi/asm/ioctls.h b/arch/powerpc/include/uapi/asm/ioctls.h
index 2c145da3b774..fb998bff4cd6 100644
--- a/arch/powerpc/include/uapi/asm/ioctls.h
+++ b/arch/powerpc/include/uapi/asm/ioctls.h
@@ -23,10 +23,10 @@
 #define TCSETSW		_IOW('t', 21, struct termios)
 #define TCSETSF		_IOW('t', 22, struct termios)
 
-#define TCGETA		_IOR('t', 23, struct termio)
-#define TCSETA		_IOW('t', 24, struct termio)
-#define TCSETAW		_IOW('t', 25, struct termio)
-#define TCSETAF		_IOW('t', 28, struct termio)
+#define TCGETA		0x80147417 /* _IOR('t', 23, struct termio) */
+#define TCSETA		0x40147418 /* _IOW('t', 24, struct termio) */
+#define TCSETAW		0x40147419 /* _IOW('t', 25, struct termio) */
+#define TCSETAF		0x4014741c /* _IOW('t', 28, struct termio) */
 
 #define TCSBRK		_IO('t', 29)
 #define TCXONC		_IO('t', 30)
-- 
2.49.0


