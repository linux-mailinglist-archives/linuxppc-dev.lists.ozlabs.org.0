Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B14574231F0
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Oct 2021 22:26:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HP8JK3jWCz2yhd
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Oct 2021 07:26:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fclNe8rn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=fclNe8rn; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HP8HY5FmZz2xWf
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Oct 2021 07:26:17 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 195K2TN5006942; 
 Tue, 5 Oct 2021 16:25:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=uVBp3kradOtQzQDWTiNwTty3Dme7j3p9ETm/D2GjOgc=;
 b=fclNe8rnbLpBUtyYHWqg4qaa4TImqspgPiDgGM8/IZozTRzwkkJthKmKKZewxKbJSqXw
 amVa26StCKqYXY3zU098JRsodEG1EP65fTeuiOiRxt5FP+YRakx6nLiJvJ3nXcp1G4Qg
 lZvPo0NQJqO+IG7388TGXI28l2zrk4AykyPJE8olkZ6ItY5Cb3UPOsH7UMYGSENJWZGb
 /vJ3yXzTGcciAO4LFTotI1FI6szTqBUmKalk3UKKtzs9QyVznm17fzp6yXTGwp7C16xx
 H0fvhNC/8JtO/xFzdRfpnCSsxbg6RVtkx6ZwDiInSvuHhn1ny/7mTem52hy3vLc5RA4P ag== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bgs36y3qu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Oct 2021 16:25:53 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 195KIqpu027895;
 Tue, 5 Oct 2021 16:25:53 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bgs36y3qb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Oct 2021 16:25:52 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 195KIf0E014426;
 Tue, 5 Oct 2021 20:25:50 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma02fra.de.ibm.com with ESMTP id 3bef29uqjw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Oct 2021 20:25:50 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 195KKR5r51249586
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 5 Oct 2021 20:20:27 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D54ADAE058;
 Tue,  5 Oct 2021 20:25:47 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 76C2FAE05D;
 Tue,  5 Oct 2021 20:25:44 +0000 (GMT)
Received: from naverao1-tp.ibm.com (unknown [9.43.5.112])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  5 Oct 2021 20:25:44 +0000 (GMT)
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Jordan Niethe <jniethe5@gmail.com>, Daniel Borkmann <daniel@iogearbox.net>,
 Alexei Starovoitov <alexei.starovoitov@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Johan Almbladh <johan.almbladh@anyfinetworks.com>,
 Song Liu <songliubraving@fb.com>
Subject: [PATCH v2 00/10] powerpc/bpf: Various fixes
Date: Wed,  6 Oct 2021 01:55:19 +0530
Message-Id: <cover.1633464148.git.naveen.n.rao@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: gnBSDfUAVRmtuXu3efVR6zWoOlsBDou8
X-Proofpoint-ORIG-GUID: aa3lWVTcM6oP109E-rKw0EznR52GTerj
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-05_04,2021-10-04_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0
 phishscore=0 adultscore=0 suspectscore=0 bulkscore=0 mlxlogscore=901
 clxscore=1011 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110050117
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
Cc: bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is v2 of the series posted at:
http://lkml.kernel.org/r/cover.1633104510.git.naveen.n.rao@linux.vnet.ibm.com

Only patches from v1 that need to go into powerpc/fixes are included.
Other patches will be posted as a separate series for inclusion into
powerpc/next. 

Patches 7 to 10 are new and fix issues in ppc32.


- Naveen


Naveen N. Rao (10):
  powerpc/lib: Add helper to check if offset is within conditional
    branch range
  powerpc/bpf: Validate branch ranges
  powerpc/bpf: Fix BPF_MOD when imm == 1
  powerpc/bpf: Fix BPF_SUB when imm == 0x80000000
  powerpc/security: Add a helper to query stf_barrier type
  powerpc/bpf: Emit stf barrier instruction sequences for BPF_NOSPEC
  powerpc/bpf ppc32: Fix ALU32 BPF_ARSH operation
  powerpc/bpf ppc32: Fix JMP32_JSET_K
  powerpc/bpf ppc32: Do not emit zero extend instruction for 64-bit
    BPF_END
  powerpc/bpf ppc32: Fix BPF_SUB when imm == 0x80000000

 arch/powerpc/include/asm/code-patching.h     |   1 +
 arch/powerpc/include/asm/security_features.h |   5 +
 arch/powerpc/kernel/security.c               |   5 +
 arch/powerpc/lib/code-patching.c             |   7 +-
 arch/powerpc/net/bpf_jit.h                   |  33 +++---
 arch/powerpc/net/bpf_jit64.h                 |   8 +-
 arch/powerpc/net/bpf_jit_comp.c              |   6 +-
 arch/powerpc/net/bpf_jit_comp32.c            |  16 +--
 arch/powerpc/net/bpf_jit_comp64.c            | 100 +++++++++++++++----
 9 files changed, 139 insertions(+), 42 deletions(-)


base-commit: cdcb1396e357bd198f81dc7fa4f5d819063abe44
-- 
2.33.0

