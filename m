Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF7C6249D3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Nov 2022 19:44:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N7W3D4l1gz3f3p
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Nov 2022 05:44:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=J3th4Qqj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=J3th4Qqj;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N7W2G1FyBz3cKk
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Nov 2022 05:43:49 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2AAIflD3025941;
	Thu, 10 Nov 2022 18:43:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=XxpamRVRCdt9qvuSBAP0HIPKDfuNwKHeN4iEf3SmIOg=;
 b=J3th4QqjdzmQniy2NbEw40tsy4dWZ0MIt/9t/9/X3E3Pfd7HiKYIqv+2XADjueD7WgOs
 cpyI/xzhhLrEYuXutH1X8DSykv8ybMCvPCnjQGHpIXfYoGv7tz6wV53XsmG6v3ZhXmi8
 eHLZcilGMkWieMKUOsWZtfz78FSJ4dWj9nCgEuAAZCYNcT0OToCXp9bAx89sqyPTynSp
 fJBe06TvV1gamqRfD+9UMERr51vz59gnZz4J9TmI6qDw3/mM96tLG0gHSzUJ9PnvqE3j
 t+7dHJgbsKnnp/EGPE9MKYmQ0azUKsQP6X3Ggltt4l9emZzJP79TfmJDESm2n7t//GbP OQ== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ks6t8r16q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Nov 2022 18:43:24 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AAIaXja000794;
	Thu, 10 Nov 2022 18:43:21 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
	by ppma03ams.nl.ibm.com with ESMTP id 3kngqgfp8s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Nov 2022 18:43:21 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
	by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2AAIbVbx49152334
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 10 Nov 2022 18:37:31 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 587E7A4051;
	Thu, 10 Nov 2022 18:43:19 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 58549A404D;
	Thu, 10 Nov 2022 18:43:15 +0000 (GMT)
Received: from hbathini-workstation.ibm.com.com (unknown [9.163.72.10])
	by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Thu, 10 Nov 2022 18:43:14 +0000 (GMT)
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, bpf@vger.kernel.org
Subject: [RFC PATCH 0/3] enable bpf_prog_pack allocator for powerpc
Date: Fri, 11 Nov 2022 00:13:00 +0530
Message-Id: <20221110184303.393179-1-hbathini@linux.ibm.com>
X-Mailer: git-send-email 2.37.3
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: AtrBRS8GN6rS4KnIU9RtSzs3_d1ZLh6v
X-Proofpoint-ORIG-GUID: AtrBRS8GN6rS4KnIU9RtSzs3_d1ZLh6v
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-10_12,2022-11-09_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 clxscore=1011 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 mlxlogscore=828
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211100129
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
Cc: Song Liu <songliubraving@fb.com>, Daniel Borkmann <daniel@iogearbox.net>, Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Most BPF programs are small, but they consume a page each. For systems
with busy traffic and many BPF programs, this may also add significant
pressure on instruction TLB. High iTLB pressure usually slows down the
whole system causing visible performance degradation for production
workloads.

bpf_prog_pack, a customized allocator that packs multiple bpf programs
into preallocated memory chunks, was proposed [1] to address it. This
series extends this support on powerpc.

Patches 1 & 2 add the arch specific functions needed to support this
feature. Patch 3 enables the support for powerpc. The last patch
ensures cleanup is handled racefully.

Tested the changes successfully on a PowerVM. patch_instruction(),
needed for bpf_arch_text_copy(), is failing for ppc32. Debugging it.
Posting the patches in the meanwhile for feedback on these changes.

[1] https://lore.kernel.org/bpf/20220204185742.271030-1-song@kernel.org/

Hari Bathini (3):
  powerpc/bpf: implement bpf_arch_text_copy
  powerpc/bpf: implement bpf_arch_text_invalidate for bpf_prog_pack
  powerpc/bpf: use bpf_jit_binary_pack_[alloc|finalize|free]

 arch/powerpc/net/bpf_jit.h        |  18 +--
 arch/powerpc/net/bpf_jit_comp.c   | 194 ++++++++++++++++++++++++------
 arch/powerpc/net/bpf_jit_comp32.c |  26 ++--
 arch/powerpc/net/bpf_jit_comp64.c |  32 ++---
 4 files changed, 198 insertions(+), 72 deletions(-)

-- 
2.37.3

