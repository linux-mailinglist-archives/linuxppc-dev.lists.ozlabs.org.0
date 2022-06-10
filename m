Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C115469ED
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jun 2022 17:57:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LKQZP0HqFz3c8d
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jun 2022 01:57:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FWmKbiDJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FWmKbiDJ;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LKQYk3bPGz2xKf
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Jun 2022 01:56:26 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25ADgdQU000459;
	Fri, 10 Jun 2022 15:56:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=f+2+C36wMDbP1Lz6kw2wjIMFQljszvrYMVi61I/EaUA=;
 b=FWmKbiDJd2hMIVcRSAsC4RD99mvXZTnqbEz0n2BOVOW0ojB61vc4GTIFJIYDafVpX4Hm
 6rifSTp8zRCEm69RvTlKjWLfdilvBGOYNXx/+FTDHEiULdoju1GHNiZqC0EPBiECGIjP
 C8bCX9OJ2EZjVXC4nFxxYv0GZTlZlDripJBDmEz8ypKXN9blux203jCs8wyYBUfOJ6iI
 XY4CXxq3RBmUaPsazgtGUuOHCIFFdRDjpuW/jICrxdb0oqAZGZ5sSyzEAlg1CV25oKu3
 c7UVS/poNClquXL1pWk5yYiu8DpV3rs0j4tWxuCgVjj1x1ZiFex+D6Pw0uyMBBwtpxWq Mg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gm72vtmpb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jun 2022 15:56:02 +0000
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 25AFu1c1008835;
	Fri, 10 Jun 2022 15:56:02 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com [159.122.73.71])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gm72vtmnj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jun 2022 15:56:01 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
	by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25AFq2XM015689;
	Fri, 10 Jun 2022 15:55:59 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
	by ppma02fra.de.ibm.com with ESMTP id 3gfy196n47-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jun 2022 15:55:59 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com [9.149.105.58])
	by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 25AFtZMc22020402
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Jun 2022 15:55:35 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F09834C046;
	Fri, 10 Jun 2022 15:55:56 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7A6294C040;
	Fri, 10 Jun 2022 15:55:53 +0000 (GMT)
Received: from hbathini-workstation.in.ibm.com (unknown [9.203.106.231])
	by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Fri, 10 Jun 2022 15:55:53 +0000 (GMT)
From: Hari Bathini <hbathini@linux.ibm.com>
To: bpf@vger.kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH v2 0/5] Atomics support for eBPF on powerpc
Date: Fri, 10 Jun 2022 21:25:47 +0530
Message-Id: <20220610155552.25892-1-hbathini@linux.ibm.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: aemJ9QPeFSbAkEg-8m6HjSLmexGHySvC
X-Proofpoint-GUID: 9KDPoPBpEuTS3D55lso3y3lSDnxBOj3a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-10_06,2022-06-09_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 clxscore=1011
 priorityscore=1501 mlxlogscore=999 mlxscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2204290000 definitions=main-2206100061
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
Cc: Song Liu <songliubraving@fb.com>, Daniel Borkmann <daniel@iogearbox.net>, John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, netdev@vger.kernel.org, Paul Mackerras <paulus@samba.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Yonghong Song <yhs@fb.com>, KP Singh <kpsingh@kernel.org>, Jordan Niethe <jniethe5@gmail.com>, Martin KaFai Lau <kafai@fb.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This patchset adds atomic operations to the eBPF instruction set on
powerpc. The instructions that are added here can be summarised with
this list of kernel operations for ppc64:

* atomic[64]_[fetch_]add
* atomic[64]_[fetch_]and
* atomic[64]_[fetch_]or
* atomic[64]_[fetch_]xor
* atomic[64]_xchg
* atomic[64]_cmpxchg

and this list of kernel operations for ppc32:

* atomic_[fetch_]add
* atomic_[fetch_]and
* atomic_[fetch_]or
* atomic_[fetch_]xor
* atomic_xchg
* atomic_cmpxchg

The following are left out of scope for this effort:

* 64 bit operations on ppc32.
* Explicit memory barriers, 16 and 8 bit operations on both ppc32
  & ppc64.

The first patch adds support for bitwsie atomic operations on ppc64.
The next patch adds fetch variant support for these instructions. The
third patch adds support for xchg and cmpxchg atomic operations on
ppc64. Patch #4 adds support for 32-bit atomic bitwise operations on
ppc32. patch #5 adds support for xchg and cmpxchg atomic operations
on ppc32.

Validated these changes successfully with atomics test cases in
test_bpf testsuite and  test_verifier & test_progs selftests.
With test_bpf testsuite:

  all 147 atomics related test cases (both 32-bit & 64-bit) JIT'ed
  successfully on ppc64:

    test_bpf: Summary: 1026 PASSED, 0 FAILED, [1014/1014 JIT'ed]

  all 76 atomics related test cases (32-bit) JIT'ed successfully
  on ppc32:

    test_bpf: Summary: 1027 PASSED, 0 FAILED, [915/1015 JIT'ed]

Changes in v2:
* Moved variable declaration to avoid late declaration error on
  some compilers. Thanks to Russell for pointing this out.
* For ppc64, added an optimization for 32-bit cmpxchg with regard
  to commit 39491867ace5.
* For ppc32, used an additional register (BPF_REG_AX):
    - to avoid clobbering src_reg.
    - to keep the lwarx reservation as intended.
    - to avoid the odd switch/goto construct.
* For ppc32, zero'ed out the higher 32-bit explicitly when required.


Hari Bathini (5):
  bpf ppc64: add support for BPF_ATOMIC bitwise operations
  bpf ppc64: add support for atomic fetch operations
  bpf ppc64: Add instructions for atomic_[cmp]xchg
  bpf ppc32: add support for BPF_ATOMIC bitwise operations
  bpf ppc32: Add instructions for atomic_[cmp]xchg

 arch/powerpc/net/bpf_jit_comp32.c | 72 +++++++++++++++++++----
 arch/powerpc/net/bpf_jit_comp64.c | 96 ++++++++++++++++++++++---------
 2 files changed, 129 insertions(+), 39 deletions(-)

-- 
2.35.3

