Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F0BFF2C9C89
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Dec 2020 10:27:31 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ClcFV1hpLzDqw4
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Dec 2020 20:27:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=harish@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=LZO1kCgd; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ClcB32cVkzDqtK
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Dec 2020 20:24:23 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B192jKx009945; Tue, 1 Dec 2020 04:24:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=AIdodbyrgG95nk87RszlyYRxJO30B0CgwCgv2+U41WE=;
 b=LZO1kCgdylotvU54ufYS2WEiDv0SJE1n+BwSeSN2LOLgudHCGu5QmNIoQ1iE2rfmfuJ+
 Jn4++ddeYJldeBwKWn/rE44mnuWFQG5BKx1uLGcvRgba9UP1npSq98KPB9rl35NjP7v2
 DKhDH7zKJ62yRxtyLqFTonDaC2365+HRbSdNikaQJRNMpBvKR/ve1/zVpRqJ7ValGzVz
 K+ts2vt2nwkj0yptbrd6XaWtzXYS9Q350bY7W8tBeRK9CdqwDPbnWxbXKWO963Wei2qR
 4aNYnf92WLx0xfnlnHCY7E4KdEo5jIshEBD0G+mxm8pWvXyK+IRCKu/1G/MX+HJNMRNR UQ== 
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 355jjgh04g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Dec 2020 04:24:15 -0500
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B19DVrx003833;
 Tue, 1 Dec 2020 09:24:11 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma05fra.de.ibm.com with ESMTP id 353e689hh2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Dec 2020 09:24:11 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 0B19O8O953281076
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 1 Dec 2020 09:24:08 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D01DD11C050;
 Tue,  1 Dec 2020 09:24:08 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E2B2F11C04C;
 Tue,  1 Dec 2020 09:24:07 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.77.206.76])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Tue,  1 Dec 2020 09:24:07 +0000 (GMT)
From: Harish <harish@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH] selftests/powerpc: Fix uninitialized variable warning
Date: Tue,  1 Dec 2020 14:54:03 +0530
Message-Id: <20201201092403.238182-1-harish@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-12-01_01:2020-11-30,
 2020-12-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=1
 lowpriorityscore=0 bulkscore=0 adultscore=0 mlxlogscore=795
 priorityscore=1501 spamscore=0 phishscore=0 clxscore=1011 impostorscore=0
 mlxscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012010060
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Harish <harish@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Patch fixes uninitialized variable warning in bad_accesses test
which causes the selftests build to fail in older distibutions

bad_accesses.c: In function ‘bad_access’:
bad_accesses.c:52:9: error: ‘x’ may be used uninitialized in this function [-Werror=maybe-uninitialized]
   printf("Bad - no SEGV! (%c)\n", x);
         ^
cc1: all warnings being treated as errors

Signed-off-by: Harish <harish@linux.ibm.com>
---
 tools/testing/selftests/powerpc/mm/bad_accesses.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/powerpc/mm/bad_accesses.c b/tools/testing/selftests/powerpc/mm/bad_accesses.c
index fd747b2ffcfc..65d2148b05dc 100644
--- a/tools/testing/selftests/powerpc/mm/bad_accesses.c
+++ b/tools/testing/selftests/powerpc/mm/bad_accesses.c
@@ -38,7 +38,7 @@ static void segv_handler(int n, siginfo_t *info, void *ctxt_v)
 
 int bad_access(char *p, bool write)
 {
-	char x;
+	char x = 0;
 
 	fault_code = 0;
 	fault_addr = 0;
-- 
2.26.2

