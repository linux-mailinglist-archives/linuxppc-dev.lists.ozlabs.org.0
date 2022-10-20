Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F86060670B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Oct 2022 19:30:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MtZPC3s6jz3dsR
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Oct 2022 04:30:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mxUlKg26;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mxUlKg26;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MtZNH1g4vz3c2Q
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Oct 2022 04:29:34 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29KHOvYF013168;
	Thu, 20 Oct 2022 17:29:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=zlE2Hg6pgTC6Q/nYSTfzoek4GkDNcLyAQ+gTQC70U4w=;
 b=mxUlKg26ygQpIfMvQAtEkniSMTU5bRgF+8objRga6HfAvjhuJImA/XQAiNMY/Y92ZBnh
 6PsKQrZNe+Y6tff7B/yFO+Bb5uF8e8o0z+iP2+zgzlIgZZ1QhZAfQuYbIBPKNotPtiPa
 YmtKYmKl54kwZ1oJe1TZJKCB/IXjOhvsEb/ebnOE/Z/RBs/iBzJVbudlmgQVOcuzIgyv
 E005qpd8jl/I4BPQCM70ZSCzCPHbhtbRbRTuKADSM0xBy7xqS2qRBNdrMmdkebP2IrEx
 EniyVsuBpfKr0bCuFnXITp3ETvJrxxApfX7yS3wmj78PKWLl2IadmFDgg+BZt6ztyAzL Ug== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3kbaq4r2jn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Oct 2022 17:29:22 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29KHRHLI020968;
	Thu, 20 Oct 2022 17:29:22 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3kbaq4r2j0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Oct 2022 17:29:22 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29KHPPqB010922;
	Thu, 20 Oct 2022 17:29:20 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
	by ppma04ams.nl.ibm.com with ESMTP id 3k7mg997a2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Oct 2022 17:29:20 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 29KHTHsV459492
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 20 Oct 2022 17:29:18 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E1D6342047;
	Thu, 20 Oct 2022 17:29:17 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1560C4203F;
	Thu, 20 Oct 2022 17:29:16 +0000 (GMT)
Received: from li-NotSettable.ibm.com.com (unknown [9.43.39.233])
	by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Thu, 20 Oct 2022 17:29:15 +0000 (GMT)
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH 0/5] powerpc/kprobes: preempt related changes and cleanups
Date: Thu, 20 Oct 2022 22:58:56 +0530
Message-Id: <cover.1666262278.git.naveen.n.rao@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 2YLR7maXS2iVaHWBjvv1ExRhZJSQK07Z
X-Proofpoint-ORIG-GUID: UtXntru99l4BklNLThRqQHuILMfVY5Te
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-20_08,2022-10-20_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 malwarescore=0 phishscore=0 bulkscore=0 mlxscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 mlxlogscore=843 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210200101
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
Cc: Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org, Masami Hiramatsu <mhiramat@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This series attempts to address some of the concerns raised in 
https://github.com/linuxppc/issues/issues/440

The last two patches are minor cleanups in related kprobes code.

- Naveen


Naveen N. Rao (5):
  powerpc/kprobes: Remove preempt disable around call to get_kprobe() in
    arch_prepare_kprobe()
  powerpc/kprobes: Have optimized_callback() use preempt_enable()
  powerpc/kprobes: Use preempt_enable() rather than the no_resched
    variant
  powerpc/kprobes: Setup consistent pt_regs across kprobes, optprobes
    and KPROBES_ON_FTRACE
  powerpc/kprobes: Remove unnecessary headers from kprobes

 arch/powerpc/kernel/kprobes-ftrace.c        |  4 ----
 arch/powerpc/kernel/kprobes.c               | 16 ++++++----------
 arch/powerpc/kernel/optprobes.c             |  2 +-
 arch/powerpc/kernel/optprobes_head.S        |  5 +----
 arch/powerpc/kernel/trace/ftrace_mprofile.S |  6 ++++++
 5 files changed, 14 insertions(+), 19 deletions(-)


base-commit: 7dc2a00fdd44a4d0c3bac9fd10558b3933586a0c
-- 
2.38.0

