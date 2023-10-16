Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 264007C9E63
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Oct 2023 07:04:35 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=e75g1y3c;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S84m10c9Vz3cG3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Oct 2023 16:04:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=e75g1y3c;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S84l33mR2z2yhR
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Oct 2023 16:03:43 +1100 (AEDT)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39G3HKM2012140;
	Mon, 16 Oct 2023 05:03:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=QRPCJE3Nk0FqhNLGiCAo81Gvm4Bs8RbABjEzta/vxRM=;
 b=e75g1y3c6Y6JevgJ1Yr//KfumXa82zmglj7kj8hJcsgtyk/HVmSJqKc/H/aUjD9RB0sG
 7kyc3EOid5QTs4R7uu3GO67q73zfI93oib2EaqouZhYY5EgSy07I8SjXbg3WwW3Uz0eL
 Spa8wU9AjSXafw82+TA9DCI9y8wCF29/r7REPNYAMBuZlfbQ1BaqYjkgyLVZlp5kAl4I
 n3fINHD79L2o1hszc5yKb9AsD7+OEMJyykzQSKhOGE4bOVmrPY1OhXt2AJmOi8kFmPx+
 vPF6eef4LJWWwBQxj/Q7sRNSUYA0VMgdNl+1an5x9NJTLi3d49k9TREzZGhHeEDNU1BX IQ== 
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3trw4wa8qj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Oct 2023 05:03:36 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 39G2c7HB012858;
	Mon, 16 Oct 2023 05:03:35 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3tr5pxxsbs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Oct 2023 05:03:35 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 39G53XrL13042196
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Oct 2023 05:03:33 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EF46320040;
	Mon, 16 Oct 2023 05:03:32 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7EA0A2004B;
	Mon, 16 Oct 2023 05:03:32 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 16 Oct 2023 05:03:32 +0000 (GMT)
Received: from bgray-lenovo-p15.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 1F1D660419;
	Mon, 16 Oct 2023 16:03:30 +1100 (AEDT)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 0/3] Add generic data patching functions
Date: Mon, 16 Oct 2023 16:01:44 +1100
Message-ID: <20231016050147.115686-1-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: lvVLc5XuuYwhZWsz67S152yorm_LNnY2
X-Proofpoint-ORIG-GUID: lvVLc5XuuYwhZWsz67S152yorm_LNnY2
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-15_09,2023-10-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 malwarescore=0
 phishscore=0 impostorscore=0 priorityscore=1501 mlxscore=0 suspectscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 mlxlogscore=822
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2309180000
 definitions=main-2310160044
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
Cc: Benjamin Gray <bgray@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currently patch_instruction() bases the write length on the value being
written. If the value looks like a prefixed instruction it writes 8 bytes,
otherwise it writes 4 bytes. This makes it potentially buggy to use for
writing arbitrary data, as if you want to write 4 bytes but it decides to
write 8 bytes it may clobber the following memory or be unaligned and
trigger an oops if it tries to cross a page boundary.

To solve this, this series pulls out the size parameter to the 'top' of
the text patching logic, and propagates it through the various functions.

The two sizes supported are int and long; this allows for patching
instructions and pointers on both ppc32 and ppc64. On ppc32 these are the
same size, so care is taken to only use the size parameter on static
functions, so the compiler can optimise it out entirely. Unfortunately
GCC trips over its own feet here and won't optimise in a way that is
optimal for strict RWX (mpc85xx_smp_defconfig) and no RWX
(pmac32_defconfig).

In the first case, patch_memory() is very large and can only be inlined
if a single function calls it. While the source only calls it in
patch_instruction(), an earlier optimisation pass inlined
patch_instruction() into patch_branch(), so now there are 'two' references
to patch_memory() and it cannot be inlined into patch_instruction().
Instead patch_instruction() becomes a single branch directly to
patch_memory().

We can fix this by marking patch_instruction() as noinline, but this
prevents patch_memory() from being directly inlined into patch_branch()
when RWX is disabled and patch_memory() is very small.

It may be possible to avoid this by merging together patch_instruction()
and patch_memory() on ppc32, but the only way I can think to do this
without duplicating the implementation involves using the preprocessor
to change if is_dword is a parameter or a local variable, which is gross.

For now I've removed the noinline, because at least the compiler might
get smarter in future and do the inlines correctly. If noinline remains
then there is no chance of it working.

Changes from v1:
  * Addressed the v1 review actions
  * Removed noinline (for now)

v1: https://patchwork.ozlabs.org/project/linuxppc-dev/cover/20230207015643.590684-1-bgray@linux.ibm.com/

Benjamin Gray (3):
  powerpc/code-patching: Add generic memory patching
  powerpc/64: Convert patch_instruction() to patch_u32()
  powerpc/32: Convert patch_instruction() to patch_uint()

 arch/powerpc/include/asm/code-patching.h | 33 ++++++++++++
 arch/powerpc/kernel/module_64.c          |  5 +-
 arch/powerpc/kernel/static_call.c        |  2 +-
 arch/powerpc/lib/code-patching.c         | 66 ++++++++++++++++++------
 arch/powerpc/platforms/powermac/smp.c    |  2 +-
 5 files changed, 87 insertions(+), 21 deletions(-)

-- 
2.39.2
