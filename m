Return-Path: <linuxppc-dev+bounces-8629-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A52ABAAAC
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 May 2025 16:23:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b05lQ2tPnz2xTh;
	Sun, 18 May 2025 00:23:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747491794;
	cv=none; b=VQYXJPzjoVqtM0h3d7sFVYym10rALNmN/0l/Czmgkw7d7R+oo3O/FkbA5+bBhkVKQVotV5eLFDoSd/pl2XGVWmtqwYrTb8DKwaeo78aqmgWg6wL8zy/YVXTI/4eQehciZmPahmew7LvNl4GWrbaKjY5eImR2vkC9IjlYuyXSpqqz9bkddom1IQE4n5J+PnzOXMzj/Jl4CtT0r2xnXTMqkHQK6erh6Rj5RS122mcBfSaIjyUdJKMSh+4l5eypCSA1ghS+P8A9EvmPqeJe148K3cOHDNln+NyXNDGdyX92nAk53b8yo+VAx3KhSCeTJUdRmtR9AjX/3PMq/r0T/iK67g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747491794; c=relaxed/relaxed;
	bh=gNbTtplod8XJEc07XMPG72McUXDbBeFwFrNQw7vISX0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ioGfsNVEnYwXqGz8dpWaZet5YdACRjcnSBQjzryQAWhat8FgVrUtIFkUfR8fd4xalwUO2U7uHfVnVEFJVAvWXIMj3w1iGfK724w8AkUcIML6Ox4+QaZqGdjJ3X6iaD9Pf3iZYRNXD6lpq0jMgb4y3MsckQyAhtCFit/q7IOwC9DDqdqQiX8LxpsgcY4qPEQVKmDlkC+s5xSfJgBSdwN7VlyQSO9Ck35FxPEB3L4TSreNhMIhMbNc7NgiDlCD0LqDt6WZF4YiDH2Bi3SrPiOceG+YelcYaP49qNQ/5WAzHwymhohji9bT3r2/sh94DfSvY/dl6rdEcKAEk6p1YJkkNA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=e9kHB8WE; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=e9kHB8WE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b05lP27S8z2xJ1
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 18 May 2025 00:23:12 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54HDo4nX010524;
	Sat, 17 May 2025 14:22:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=gNbTtplod8XJEc07XMPG72McUXDbBeFwFrNQw7vIS
	X0=; b=e9kHB8WE/ZbFW88X8gefAb/9+3EAo3oeKH+esYe+ojjy4eJVwHf5kjAYq
	Q9yzAReHvf45qkQChVUuf0i8GHCf7G/lWgpjyQlDrObDhusUIXE0xVY2OCbcXLmz
	NpnJcMxEc+NA3gnddnFpeUzP08/xKvgaVKrDK2RcbDULP7sJa7j0CGM5np2oAko6
	fjxxH2IYuZ83QFyXA9kCZ/kapVyie18SL0e9YUygSC+7KqhcdAWngemZtVSp2xd3
	txVsFM2mXl3PHPlJgoPKGyJxger8FPuPTforihAV6KFRhcO5baJ+sG5GV7wjo78g
	5PeItIv8RradD4RHrbEaNOJ2y+jmA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46pup3027c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 17 May 2025 14:22:48 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54HEMmTK003509;
	Sat, 17 May 2025 14:22:48 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46pup30279-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 17 May 2025 14:22:47 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54HCBdgF024279;
	Sat, 17 May 2025 14:22:47 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 46mbfsmnb8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 17 May 2025 14:22:47 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54HEMk3n46531058
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 17 May 2025 14:22:46 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EE99520136;
	Sat, 17 May 2025 14:22:45 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3787B20135;
	Sat, 17 May 2025 14:22:42 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.74.117])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sat, 17 May 2025 14:22:41 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu
Cc: naveen@kernel.org, linuxppc-dev@lists.ozlabs.org,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Tulio Magno <tuliom@ascii.art.br>
Subject: [PATCH v2] powerpc: Fix struct termio related ioctl macros
Date: Sat, 17 May 2025 19:52:37 +0530
Message-ID: <20250517142237.156665-1-maddy@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: bX8aDpwjVAtmKB1C-M3igoK1U9qrJin5
X-Proofpoint-GUID: SEd0Ih-VpkUFIzGeG0B4Tx40uikaFVt8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE3MDEzOCBTYWx0ZWRfXx0om7sN5wxj7 FPqFm9hclXhxiHd1aaADfyUSohrTK/t5Xqr7qP8ObyJBtfEoYncH59qBUEC1qS/yXs0BABvL5+F vyG0KsMceDt4HE66Wun5DEy/5hnEogKNM7IsNgWrbNLJFHWfg+jjFVdup0RuA/04YotP+0UOTX6
 dhk/UnC2ykJG0vVD+Z03THy2LdBwETcL8Ev0vNuvl6yMrFL773qyde8WXT6gnw7TBTGKeI9qomo 5SVz58yxvzfPdF+jb0Ln3JU7OlwwPydXRTdGyvSRwbbQ11SuFdBmciW8GvLxi83OqLAiB5pQs66 JKK377j5G/6sTLg5iPylg1W/DwZQcQVxGqLG4OgBP4E9KXrG2eMlmO5Mg6L6pUe/HjzNwxo8jLu
 jWLR7cqihqYNG6/1yC4JJVOIlfJRHNFArStDX0qCzfjPf2mbeao5tptHiY8bm8JblHza22cA
X-Authority-Analysis: v=2.4 cv=NKXV+16g c=1 sm=1 tr=0 ts=68289bb8 cx=c_pps a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=VnNF1IyMAAAA:8 a=_0Tql7rU0DzFU8f1vMoA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-17_07,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=763
 priorityscore=1501 adultscore=0 impostorscore=0 phishscore=0 spamscore=0
 suspectscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505170138
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
Changelog v1:
- mpe pointing out mistake in hardcoded values.
  Fixed the same.

 arch/powerpc/include/uapi/asm/ioctls.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/include/uapi/asm/ioctls.h b/arch/powerpc/include/uapi/asm/ioctls.h
index 2c145da3b774..b5211e413829 100644
--- a/arch/powerpc/include/uapi/asm/ioctls.h
+++ b/arch/powerpc/include/uapi/asm/ioctls.h
@@ -23,10 +23,10 @@
 #define TCSETSW		_IOW('t', 21, struct termios)
 #define TCSETSF		_IOW('t', 22, struct termios)
 
-#define TCGETA		_IOR('t', 23, struct termio)
-#define TCSETA		_IOW('t', 24, struct termio)
-#define TCSETAW		_IOW('t', 25, struct termio)
-#define TCSETAF		_IOW('t', 28, struct termio)
+#define TCGETA		0x40147417 /* _IOR('t', 23, struct termio) */
+#define TCSETA		0x80147418 /* _IOW('t', 24, struct termio) */
+#define TCSETAW		0x80147419 /* _IOW('t', 25, struct termio) */
+#define TCSETAF		0x8014741c /* _IOW('t', 28, struct termio) */
 
 #define TCSBRK		_IO('t', 29)
 #define TCXONC		_IO('t', 30)
-- 
2.49.0


