Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5105F9650
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Oct 2022 02:32:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mm0Hl4mwVz3dsR
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Oct 2022 11:32:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qRutD9Lb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qRutD9Lb;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mm0Fj0t2Mz3bjc
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Oct 2022 11:31:04 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 299JH9Ed001360;
	Mon, 10 Oct 2022 00:30:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=MFfIgDfRRNLGMa/73NfUiw7Fag//pKKrcpkreOX1vbU=;
 b=qRutD9Lb6p90VFrykP784dIhkOAc2Eh9qH8nmQ9IU4tzPbh+5GtWaXo6UsmSIBcrejtC
 LXfJsoANAUS7NTQi7Q+uBCbAf/Onms6KdVuB7PpD3esHsyTxQ4D5EJz40k0xDPOcNUts
 Asb6ZaQrptrE6ckMBNJuojgozMz/HkxJi3zLlz1XSl1zGPr90SIzDh+AU1nzuwTrqlIS
 KOGwENkLmeE/SNmn19MKXQOujZXJCEB5VNSC3hiPze7VxqwXn3wBoo4mr94EVwESHldC
 6cQGtQxhkG95TAZKTyrZS0jy/BmmaopqIZei2HFGAV19RYrCec3bvHkRVjtk529qR59U tw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k3jhaw2u8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Oct 2022 00:30:39 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29A0Uco3001875;
	Mon, 10 Oct 2022 00:30:38 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k3jhaw2tq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Oct 2022 00:30:38 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29A0KOhc028537;
	Mon, 10 Oct 2022 00:30:36 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
	by ppma06ams.nl.ibm.com with ESMTP id 3k30fja1e0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Oct 2022 00:30:36 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 29A0UX2w3932746
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 10 Oct 2022 00:30:33 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B863111C050;
	Mon, 10 Oct 2022 00:30:33 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 618D511C04C;
	Mon, 10 Oct 2022 00:30:33 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon, 10 Oct 2022 00:30:33 +0000 (GMT)
Received: from li-0d7fa1cc-2c9d-11b2-a85c-aed20764436d.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 8212D6010D;
	Mon, 10 Oct 2022 11:30:30 +1100 (AEDT)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 0/6] Out-of-line static calls for powerpc64 ELF V2
Date: Mon, 10 Oct 2022 11:29:51 +1100
Message-Id: <20221010002957.128276-1-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.37.3
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: m-1TSLoGmA3OWYl2bgLoK4o0c2DfV8dI
X-Proofpoint-ORIG-GUID: zSnnNO9UnUggXLMInBrvMm_D5ppt6pb5
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-07_04,2022-10-07_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 phishscore=0 adultscore=0 impostorscore=0 suspectscore=0
 clxscore=1015 mlxscore=0 lowpriorityscore=0 malwarescore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210090155
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
Cc: ajd@linux.ibm.com, peterz@infradead.org, Benjamin Gray <bgray@linux.ibm.com>, npiggin@gmail.com, ardb@kernel.org, jbaron@akamai.com, rostedt@goodmis.org, jpoimboe@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Implementation of out-of-line static calls for PowerPC 64-bit ELF V2 ABI.
Static calls patch an indirect branch into a direct branch at runtime.
Out-of-line specifically has a caller directly call a trampoline, and
the trampoline gets patched to directly call the target.

Previous versions here:
V3: https://lore.kernel.org/all/20221005053234.29312-1-bgray@linux.ibm.com/
V2: https://lore.kernel.org/all/20220926064316.765967-1-bgray@linux.ibm.com/
V1: https://lore.kernel.org/all/20220916062330.430468-1-bgray@linux.ibm.com/
RFC: https://lore.kernel.org/linuxppc-dev/20220901055823.152983-1-bgray@linux.ibm.com/

Still rebased on top of
https://lore.kernel.org/all/0df84a2eea551c1d000c34c36d0c1d23cbe26a97.1664289176.git.christophe.leroy@csgroup.eu/

Changed for V4:

[1/6]
* IS_ENABLED(CONFIG_PPC64) added to patch size condition for better
  compiler optimisation

[2/6]
* Reworded message
* Refactored need r2 save expression. Parens are intentional, C operator
  precedence can be difficult to remember, especially when three different
  kinds are used in a single expression.

Benjamin Gray (6):
  powerpc/code-patching: Implement generic text patching function
  powerpc/module: Handle caller-saved TOC in module linker
  powerpc/module: Optimise nearby branches in ELF V2 ABI stub
  static_call: Move static call selftest to static_call_selftest.c
  powerpc/64: Add support for out-of-line static calls
  powerpc: Add tests for out-of-line static calls

 arch/powerpc/Kconfig                     |  26 ++-
 arch/powerpc/include/asm/code-patching.h |  30 +++
 arch/powerpc/include/asm/static_call.h   |  80 ++++++-
 arch/powerpc/kernel/Makefile             |   4 +-
 arch/powerpc/kernel/module_64.c          |  26 ++-
 arch/powerpc/kernel/static_call.c        | 183 +++++++++++++++-
 arch/powerpc/kernel/static_call_test.c   | 263 +++++++++++++++++++++++
 arch/powerpc/kernel/static_call_test.h   |  56 +++++
 arch/powerpc/lib/code-patching.c         |  73 +++++--
 kernel/Makefile                          |   1 +
 kernel/static_call_inline.c              |  43 ----
 kernel/static_call_selftest.c            |  41 ++++
 12 files changed, 753 insertions(+), 73 deletions(-)
 create mode 100644 arch/powerpc/kernel/static_call_test.c
 create mode 100644 arch/powerpc/kernel/static_call_test.h
 create mode 100644 kernel/static_call_selftest.c


base-commit: 86de6882270620777fe9cc16ece97e9ee407122c
--
2.37.3
