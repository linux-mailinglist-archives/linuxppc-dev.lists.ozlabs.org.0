Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ADDC4413418
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Sep 2021 15:31:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HDMky4fmpz304r
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Sep 2021 23:31:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=e+lU10Tf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=e+lU10Tf; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HDMkC1n7Xz2xvf
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Sep 2021 23:30:26 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18LChbhk022380; 
 Tue, 21 Sep 2021 09:30:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=Nt/HW0BXDDaCR0QLrLIVHDX3SBFrj5Qpvinm39FfqT4=;
 b=e+lU10TfB8nWMuT2FBh7dH0XtoaO9P/xqQsmoInORRS3+vCX+CkS/uO1RrAw/VjdoXEp
 FUKG/SXspmQ0Y5i+yccsVwboU4Ap4TKK5wLGTA1jIYkreTejEJjQW+bZVScHf8JozSAl
 yZO/O4+KVZeSsyDA2bLavVqUAh9mUcB+V2d5Nrnpq9rgoOdKLCvl18HYFwmrU2W3FSb4
 rMN33UrsnpgW0FDtaJW9ZwYTJL+N55mXCSLgiG5pSRFcwkEYD6Ky6Rn+SXbONyp1z5IZ
 mpjkaLjfZQcEoJ8Uqy2cvCwTTzofyWCnaILwqSlVyHVpJjxxqfNF80ux0LWD2FMdHxHm xQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3b7fndh952-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Sep 2021 09:30:00 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 18LCt4iL002156;
 Tue, 21 Sep 2021 09:29:58 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3b7fndh93c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Sep 2021 09:29:58 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 18LDNEiR010765;
 Tue, 21 Sep 2021 13:29:55 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06ams.nl.ibm.com with ESMTP id 3b57cjnp50-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Sep 2021 13:29:55 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 18LDTpWx41746876
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 21 Sep 2021 13:29:52 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B48BF4C071;
 Tue, 21 Sep 2021 13:29:51 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C65FE4C040;
 Tue, 21 Sep 2021 13:29:47 +0000 (GMT)
Received: from hbathini-workstation.ibm.com.com (unknown [9.43.117.91])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 21 Sep 2021 13:29:47 +0000 (GMT)
From: Hari Bathini <hbathini@linux.ibm.com>
To: naveen.n.rao@linux.ibm.com, christophe.leroy@csgroup.eu,
 mpe@ellerman.id.au, ast@kernel.org, daniel@iogearbox.net
Subject: [PATCH v3 0/8] bpf powerpc: Add BPF_PROBE_MEM support in powerpc JIT
 compiler
Date: Tue, 21 Sep 2021 18:59:35 +0530
Message-Id: <20210921132943.489732-1-hbathini@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: HqZUy-qa7iySiP65dyQqucNLU0GKMEbp
X-Proofpoint-ORIG-GUID: 2W1wYTfMEuVOz_p4ioiMYdP7Nab5betP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-21_01,2021-09-20_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 suspectscore=0 clxscore=1015 spamscore=0 impostorscore=0 adultscore=0
 bulkscore=0 mlxscore=0 mlxlogscore=883 malwarescore=0 lowpriorityscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109210082
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
Cc: songliubraving@fb.com, netdev@vger.kernel.org, john.fastabend@gmail.com,
 andrii@kernel.org, kpsingh@kernel.org, paulus@samba.org, yhs@fb.com,
 bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, kafai@fb.com,
 Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Patch #1 & #2 are simple cleanup patches. Patch #3 refactors JIT
compiler code with the aim to simplify adding BPF_PROBE_MEM support.
Patch #4 introduces PPC_RAW_BRANCH() macro instead of open coding
branch instruction. Patch #5 & #7 add BPF_PROBE_MEM support for PPC64
& PPC32 JIT compilers respectively. Patch #6 & #8 handle bad userspace
pointers for PPC64 & PPC32 cases respectively.

Changes in v3:
* Addressed all the review comments from Christophe.

Hari Bathini (4):
  bpf powerpc: refactor JIT compiler code
  powerpc/ppc-opcode: introduce PPC_RAW_BRANCH() macro
  bpf ppc32: Add BPF_PROBE_MEM support for JIT
  bpf ppc32: Access only if addr is kernel address

Ravi Bangoria (4):
  bpf powerpc: Remove unused SEEN_STACK
  bpf powerpc: Remove extra_pass from bpf_jit_build_body()
  bpf ppc64: Add BPF_PROBE_MEM support for JIT
  bpf ppc64: Access only if addr is kernel address

 arch/powerpc/include/asm/ppc-opcode.h |   2 +
 arch/powerpc/net/bpf_jit.h            |  19 +++--
 arch/powerpc/net/bpf_jit_comp.c       |  72 ++++++++++++++--
 arch/powerpc/net/bpf_jit_comp32.c     | 115 ++++++++++++++++++++++----
 arch/powerpc/net/bpf_jit_comp64.c     |  88 ++++++++++++++++----
 5 files changed, 254 insertions(+), 42 deletions(-)

-- 
2.31.1

