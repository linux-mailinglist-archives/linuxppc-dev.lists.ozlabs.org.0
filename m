Return-Path: <linuxppc-dev+bounces-13968-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 34772C434CA
	for <lists+linuxppc-dev@lfdr.de>; Sat, 08 Nov 2025 22:04:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d3pMn3g65z2yFJ;
	Sun,  9 Nov 2025 08:04:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762635877;
	cv=none; b=SU3RAJY+5UqOPXc2CBXnfF7XUFRKzaU57kN91m8/YF6CpyTdK7wpIBESkoYsz9ZmGhQDPU/AAM5xuLEHBuKdF3E5QRKjdm4z9bovaio9E5v9EfkjRfUn+6RzvHpP9mjm0ySfWhBLAnGlvp5bls0O9YKSfcHeVl3ufnrhEBz065dkVWYiTcefB8TKzq6FaQiNzG/3NESZ2exwZ04fo9zFdbjvo8XmZBw/FDaTq4wpTSfsPWeAFJDQYB//2/I5XEqLLZVlynHLORlO/kB40Lwbh7O2H+Qsfn/X4OfF2geJTlvSKNa1C8j2Se52zuyPKeB7fhsUMrR9QMJmw20HVLMAlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762635877; c=relaxed/relaxed;
	bh=r/C1clVn2kNhUfme3gLJloJ7m1Sg4mdeJO/aSpmZhl4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LhdxdeUndoBB4mecmBAJo4hxELHCQgZ9ViRK2Gn5qPCnQwNDoVqJ49nbP0MBkITVBiCBorRI27eiekODLhEFiFkzsWH41dkGXQN3oCRRwg211pF+ZUzmFcyfn0is5aoruWjFICdrUNzZDjHkjDsUSqPxNFfoEJRuMOHaOzQBCVvhgEFuRg3JPWzuXLPtASM8YwAZ65hghAU6R7qR3XVnXYxIp87EE3ldU6mia+vt2oUJabi0yBusBuJmTGSGDCKKeZJJqfdZ3RQUqU7wtGvRvviPnHAcgNMghNxcTFsQv7/ddfQ7UiLnWwzD9IZ1I4V86wO7I6pLAEcHBkBdEckCfw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GeudyQRz; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GeudyQRz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d3pMm1qYCz2xQ5
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  9 Nov 2025 08:04:35 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5A8IjeaU031047;
	Sat, 8 Nov 2025 21:04:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=r/C1clVn2kNhUfme3gLJloJ7m1Sg4mdeJO/aSpmZh
	l4=; b=GeudyQRzkAOWPjbmni0KBK8PEE7jCOxJce9u88J/at0sbGrJCiqwJcjqe
	u9H+G7dFcOYMR0lYueOefDjaXnUoMYZ1XxHI5L5YxVlW4JR6ANipLik5o1Jxtz1S
	HUy+j8DP1zEDaB7A11F3QAeTChBKOsVl2BlQCHauAWw1tTSY0t8TrUlpobl0DBoR
	EQPeZ1et1YSY1aMtyEIadv03csrg9uLaZ1g9SbyDBMkRGhQtsSmQ1p1bSlsGX0fe
	dbXyW49XrEWnYyaD45hT+TTUNIBPcCXxgQoeQ7QwGU0n5YJ2tVsGjnae/iojoK74
	wpc8n3EZUP/lNgCDq9x1ouG+0JU4Q==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a9wgwj2fn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 08 Nov 2025 21:04:14 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5A8I0qWu012875;
	Sat, 8 Nov 2025 21:04:13 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4a5y82g4ur-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 08 Nov 2025 21:04:13 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5A8L49qR28377348
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 8 Nov 2025 21:04:09 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 49B042004D;
	Sat,  8 Nov 2025 21:04:09 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B2C4620040;
	Sat,  8 Nov 2025 21:04:06 +0000 (GMT)
Received: from li-bd3f974c-2712-11b2-a85c-df1cec4d728e.ibm.com.com (unknown [9.43.99.186])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sat,  8 Nov 2025 21:04:06 +0000 (GMT)
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        "Naveen N. Rao" <naveen@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        linux-trace-kernel@vger.kernel.org,
        Mark Rutland <mark.rutland@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>, llvm@lists.linux.dev,
        Maryam Moghadas <maryammo@ca.ibm.com>
Subject: [PATCH 0/3] powerpc64/ftrace: fixes clang build issues
Date: Sun,  9 Nov 2025 02:34:02 +0530
Message-ID: <20251108210405.2375472-1-hbathini@linux.ibm.com>
X-Mailer: git-send-email 2.51.1
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
X-Proofpoint-GUID: wc92Ckzux93t2Jw3GDjJdetmD-I3piLP
X-Proofpoint-ORIG-GUID: wc92Ckzux93t2Jw3GDjJdetmD-I3piLP
X-Authority-Analysis: v=2.4 cv=VMPQXtPX c=1 sm=1 tr=0 ts=690fb04e cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8
 a=Ew1Gq7sKqn5lxjvi_p4A:9 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA4MDAyMiBTYWx0ZWRfXxpLUAX8Wgi9p
 JYub1skAWOGD2Vy/vMP2Hr4aZc3Z3V79cFe7+wrPEgOJGnyd0GIgdCO8XjHvoHHkD8XcC65MyWI
 HKHvw6bNtFVD4ySEDJkJjK1RPo2z13iFxdv7YCK3tdLn5+e7KR523yDW4ADqg7AnoWIsJbTdU0G
 J7tH6CBMaga+wSsxNcjs4cSZwxlIoVny8r3TDRlOAJgGHJ8PgpXe7jUR+e5Pp4H3PpGUOT4ZD+F
 6HWXPTyYR5aJ8mus2E4dUlI/nR72HxUTZqiJ/keNmtu/Xl1isAtofZYGfjl9WM7qmss6QypaR/e
 gIPEYCiX+9PmxM+h/rbFLo6Athi1gEY1cgyrE4YWFF8/G5ZDR25qZufdniafmpz6fJJPpn+XNVY
 NjWsUqrczYoCPYUk4+IzLrk7P6Z23A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-08_06,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 clxscore=1011 phishscore=0 spamscore=0 malwarescore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510240000
 definitions=main-2511080022
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Support for -fpatchable-function-entry on ppc64le was added in Clang
with [1]. Faced a couple of issues while building the linux kernel
with Clang though. Patches 1 & 2 address those issues. The last patch
provides workaround to ensure, an open issue [2] in Clang with
-fpatchable-function-entry support, does not impact the linux
ftrace subsystem.

[1] https://github.com/llvm/llvm-project/pull/151569
[2] https://github.com/llvm/llvm-project/issues/163706

Hari Bathini (3):
  powerpc64: make clang cross-build friendly
  powerpc64/ftrace: fix OOL stub count with clang
  powerpc64/ftrace: workaround clang recording GEP in
    __patchable_function_entries

 arch/powerpc/Kconfig                          |  5 ++--
 arch/powerpc/kernel/trace/ftrace.c            | 26 ++++++++++++++++---
 ....sh => check-fpatchable-function-entry.sh} |  0
 arch/powerpc/tools/ftrace-gen-ool-stubs.sh    |  4 +--
 4 files changed, 27 insertions(+), 8 deletions(-)
 rename arch/powerpc/tools/{gcc-check-fpatchable-function-entry.sh => check-fpatchable-function-entry.sh} (100%)

-- 
2.51.1


