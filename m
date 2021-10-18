Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 40DB8431819
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Oct 2021 13:50:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HXwDj4jLlz2yxj
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Oct 2021 22:50:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mYHQhAfP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=mYHQhAfP; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HXwCy6lQ5z2yPc
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Oct 2021 22:50:06 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19IBTM3i022775; 
 Mon, 18 Oct 2021 07:49:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=jHctD2q+d+t0P2Bbjs3aTZrPD92riqxObcXyejoGBG0=;
 b=mYHQhAfPQcL6fXlwR28V+ubQfC0g6aCM+VylAgHnbtSibLhoW0Ymbbp3Ikw1a7EHLVxj
 sRar+L5qGIMjpB+GvpCl/vy5RH27iU96oDOKkHVvgHDbXeF7KkBLG7JKVaYWqpLdXlsL
 gq08vSc1XHHX5tm2dhhc3MIe6RNSmnCzXvqckG/LI8vbKdpz+FQB9myT090AU9hey71T
 N+wRcp3+GqM5GPpRkz+F1afNKQfJaX4gt+wX0fWLTu8MR3pbQCSPnuha0/8qF3fGq2IW
 tPLckmtvGfLOU9BibCSTHriiJpdl4mmsrgBoDzmtviVnQUu6iGTCV0uJ9JX3SYern5ta xA== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bs59b45nu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Oct 2021 07:49:56 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19IBlX63014023;
 Mon, 18 Oct 2021 11:49:55 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06ams.nl.ibm.com with ESMTP id 3bqp0jds8r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Oct 2021 11:49:54 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 19IBnpFQ3080764
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 18 Oct 2021 11:49:51 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BE74B52059;
 Mon, 18 Oct 2021 11:49:51 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.79.190.48])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 0AB4E5204E;
 Mon, 18 Oct 2021 11:49:49 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org
Subject: [V4 0/2] tools/perf: Add instruction and data address registers to
 extended regs in powerpc
Date: Mon, 18 Oct 2021 17:19:46 +0530
Message-Id: <20211018114948.16830-1-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.33.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: NyBCIZGg-t0Z6LADqoZfXxTah2IsfQ5y
X-Proofpoint-GUID: NyBCIZGg-t0Z6LADqoZfXxTah2IsfQ5y
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-18_03,2021-10-14_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 mlxscore=0
 phishscore=0 adultscore=0 clxscore=1011 priorityscore=1501 suspectscore=0
 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110180071
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
Cc: maddy@linux.vnet.ibm.com, rnsastry@linux.ibm.com,
 linux-perf-users@vger.kernel.org, kjain@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Patch set adds PMU registers namely Sampled Instruction Address Register
(SIAR) and Sampled Data Address Register (SDAR) as part of extended regs
in PowerPC. These registers provides the instruction/data address and
adding these to extended regs helps in debug purposes.

Patch 1/2 refactors the existing macro definition of
PERF_REG_PMU_MASK_300 and PERF_REG_PMU_MASK_31 to make it more
readable.
Patch 2/2 includes perf tools side changes to add the SPRs to
sample_reg_mask to use with -I? option.

Changelog:
Change from v3 -> v4:
- Spilt tools side patches separately since kernel side
  changes are in powerpc/next. There is no code wise changes
  from v3.
  Link to previous version:
  https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=265811&state=*

  Kernel patches are taken to powerpc/next:
  [1/4] powerpc/perf: Refactor the code definition of perf reg extended mask
  https://git.kernel.org/powerpc/c/02b182e67482d9167a13a0ff19b55037b70b21ad
  [3/4] powerpc/perf: Expose instruction and data address registers as part of extended regs
  https://git.kernel.org/powerpc/c/29908bbf7b8960d261dfdd428bbaa656275e80f3

Change from v2 -> v3:
Addressed review comments from Michael Ellerman
- Fixed the macro definition to use "unsigned long long"
  which otherwise will cause build error with perf on
  32-bit.
- Added Reviewed-by from Daniel Axtens for patch3.

Change from v1 -> v2:
Addressed review comments from Michael Ellerman
- Refactored the perf reg extended mask value macros for
  PERF_REG_PMU_MASK_300 and PERF_REG_PMU_MASK_31 to
  make it more readable. Also moved PERF_REG_EXTENDED_MAX
  along with enum definition similar to PERF_REG_POWERPC_MAX.

Athira Rajeev (2):
  tools/perf: Refactor the code definition of perf reg extended mask in
    tools side header file
  tools/perf: Add perf tools support to expose instruction and data
    address registers as part of extended regs

 .../arch/powerpc/include/uapi/asm/perf_regs.h | 28 ++++++++++++-------
 tools/perf/arch/powerpc/include/perf_regs.h   |  2 ++
 tools/perf/arch/powerpc/util/perf_regs.c      |  2 ++
 3 files changed, 22 insertions(+), 10 deletions(-)

-- 
2.33.0

