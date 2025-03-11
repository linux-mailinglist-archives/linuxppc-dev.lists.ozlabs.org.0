Return-Path: <linuxppc-dev+bounces-6883-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0591FA5BAF6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Mar 2025 09:42:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZBnLm1lr6z3bmy;
	Tue, 11 Mar 2025 19:42:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741682528;
	cv=none; b=P2gsIrStWUeSQq02nNh5oJxxzZWLdua0Hof5SKSriv+u8rAfIOt5D7L6cGPCOwn+4barXsVVUC2JT7qPgpJbgmk2LcbIXf/Kpb42QUGhqz1BVOMpa2ZFIjxJBHCHJMIudeET1WPzCRWzHqX9bxdS6jhaEJpu9w+27+0niDxqWrN8VBuNP2tHMoSo9e5V7ZvaDvuXXm/rJQNG+dG99qrV4VcdLSiPs0Yy+8w4MtBZJG/DRCZzTqz2ddvO6+SZn+0bBIO/K+Z7xh2HPa4Wm3d9qbienQxoq8SJwHNxJfkji9SDbkxIj44DxhxfphyiYgD+coNfnxEWpdHcW2Grse7Irw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741682528; c=relaxed/relaxed;
	bh=R7l+S7unw8HaDq3ycvl5vpv+2cv+Okn+aN2afRCN2Hs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=IdQkGQEaIAi9Wyhh7/BTd/hL7Ia6NC1+PAlsj1aAz0S65BGYQt2qpO6kzdJE2FZ0jJck1JtYUbZ5S589el8MVjpgnQDXeaSQaSe/tiE6axUR1d/sz/1C2J7Mc5UhMXx349keLHkeJgAEdBq8xk+XCPQ7bjO/gZm3QKNSleyQY6oH2xZXEI0D4U2jFlbIvg9NNJmsAjeVlYUj9yJLgDLMtjST6r8twGdTrCMV9YFklJBZrKpRDXwL+xwcbtUiYr8e4pZE7OL0KO7LMJ+J5CMf2uABvUQReiNhkdtsA7C7ROFTQzq152WI5l+WyGqUz9nY0yE3M0/slI8qoCBD5IOAMw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MRSacfzG; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MRSacfzG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZBnLl0tlkz3bmk
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Mar 2025 19:42:06 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52AKFblq016033;
	Tue, 11 Mar 2025 08:41:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=R7l+S7unw8HaDq3ycvl5vpv+2cv+
	Okn+aN2afRCN2Hs=; b=MRSacfzGOrk8njYP7aTBskXEB51mu73CoEhJVkDYsQ/A
	KtFVUoKch8E394WpLPC/T9eRnQxX7joEfxf6ebHwy2SxCAS8jCYvOSNh/0xJUO1R
	vPwDmdWLLjYPVFj98jaqoTvbpHVcM6BSgkSVsV2PLuzQuyXhZ2xuAkliJ/fH0GXp
	Ay9uBz4KSRBEgd7i2DR7RNsbYvVv0z4F1dAPOEl/6Pc8u6/OJ10YsNaWNRf88gxW
	3aUmBbDBTA2uNl6CDaB/zgrPgucDpxrgWfoqBzG5EvmCELMjyiFpelDBouXf54q0
	W4W8m0ZR/hGzi+J7MwnEeihxvYDO9ky+Y9l323dzsA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45a1gp4uj3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Mar 2025 08:41:41 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 52B8CLRd007304;
	Tue, 11 Mar 2025 08:41:41 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45a1gp4uj0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Mar 2025 08:41:41 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 52B6ei2x027566;
	Tue, 11 Mar 2025 08:41:39 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4591qkk508-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Mar 2025 08:41:39 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 52B8fZqN36307332
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 11 Mar 2025 08:41:35 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CF4F720049;
	Tue, 11 Mar 2025 08:41:35 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1395020040;
	Tue, 11 Mar 2025 08:41:33 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.in.ibm.com (unknown [9.204.206.207])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 11 Mar 2025 08:41:32 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: catalin.marinas@arm.com, shuah@kernel.org
Cc: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        naveen@kernel.org, yury.khrustalev@arm.com,
        linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Subject: [PATCH] selftest/powerpc/mm/pkey: fix build-break introduced by commit 00894c3fc917
Date: Tue, 11 Mar 2025 14:11:29 +0530
Message-ID: <20250311084129.39308-1-maddy@linux.ibm.com>
X-Mailer: git-send-email 2.48.1
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
X-Proofpoint-GUID: XjiArt6L0DCuKkUNmeos7SdNVMkgrYU4
X-Proofpoint-ORIG-GUID: SRAKZlZkEm18QLdCEcWQrintl1Z8lLK1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-11_01,2025-03-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1011
 mlxlogscore=631 suspectscore=0 spamscore=0 impostorscore=0 bulkscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2503110057
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Build break was reported in the powerpc mailing list for next-20250218 with below errors

make[1]: Nothing to be done for 'all'.
BUILD_TARGET=/root/venkat/linux-next/tools/testing/selftests/powerpc/mm; mkdir -p $BUILD_TARGET; make OUTPUT=$BUILD_TARGET -k -C mm all
  CC       pkey_exec_prot
In file included from pkey_exec_prot.c:18:
/root/venkat/linux-next/tools/testing/selftests/powerpc/include/pkeys.h: In function ‘pkeys_unsupported’:
/root/venkat/linux-next/tools/testing/selftests/powerpc/include/pkeys.h:96:34: error: ‘PKEY_UNRESTRICTED’ undeclared (first use in this function)
   96 |         pkey = sys_pkey_alloc(0, PKEY_UNRESTRICTED);
      |                                  ^~~~~~~~~~~~~~~~~

https://lore.kernel.org/all/20250113170619.484698-2-yury.khrustalev@arm.com/ patchset
has been queued to arm64/for-next/pkey_unrestricted which is causing a build break
in the selftest/powerpc builds.

Commit 6d61527d931ba ("mm/pkey: Add PKEY_UNRESTRICTED macro") added a macro
PKEY_UNRESTRICTED to handle implicit literal value of 0x0 (which is "unrestricted").
Add the same to selftest/powerpc/pkeys.h to fix the reported build break.

Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Closes: https://lore.kernel.org/lkml/3267ea6e-5a1a-4752-96ef-8351c912d386@linux.ibm.com/T/
Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
---
Catalin, can you take this fix via arm64/for-next/pkey_unrestricted?
Patch applies clean on top of arm64/for-next/pkey_unrestricted

 tools/testing/selftests/powerpc/include/pkeys.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/testing/selftests/powerpc/include/pkeys.h b/tools/testing/selftests/powerpc/include/pkeys.h
index c6d4063dd4f6..d6deb6ffa1b9 100644
--- a/tools/testing/selftests/powerpc/include/pkeys.h
+++ b/tools/testing/selftests/powerpc/include/pkeys.h
@@ -24,6 +24,9 @@
 #undef PKEY_DISABLE_EXECUTE
 #define PKEY_DISABLE_EXECUTE	0x4
 
+#undef PKEY_UNRESTRICTED
+#define PKEY_UNRESTRICTED	0x0
+
 /* Older versions of libc do not define this */
 #ifndef SEGV_PKUERR
 #define SEGV_PKUERR	4
-- 
2.48.1


