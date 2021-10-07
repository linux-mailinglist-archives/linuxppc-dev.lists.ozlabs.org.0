Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D8B424D83
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Oct 2021 08:56:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HQ2Ch3zz1z30R8
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Oct 2021 17:56:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gqX+WCFV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=gqX+WCFV; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HQ2Bz1plYz2yLV
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Oct 2021 17:55:22 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1975dejP030460; 
 Thu, 7 Oct 2021 02:55:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=IzdrZF8eFc7JwBzIUW8UTyCVwBnj/FUNeVeIN23DHDQ=;
 b=gqX+WCFVRI6xflL7DFBNxIIhNgPZTUGf+kMf4u4B89znQymv5pL6MI/QKXKtSSoiFqkw
 8wo7iMujeS8670J0cY+pDjOwZWvpHnuVldTfRgQdsOCGm/nRkEJOyCzTw+DSvBTw2BnG
 MZWMo36FhYV3y0RyvPpMj+F+rY2oXAJaVfEzoe9dD8XynD9l7XdV5lEd5waLPwj03Wxl
 +4HN433kcODENyFCVA1N6Yb6arLk2T8rmgqXlYoXEP4xR6A/Ut2jpFK0++CDrRcNZOxA
 A616UWz5wUYkV8hyF/dZe5L2RhvCay1MFGFEBZ9lbflGhrIEP+Rmgy8ssmKeAz5wghD3 4w== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3bhcsd4jmk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 07 Oct 2021 02:55:14 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1976rMFF007792;
 Thu, 7 Oct 2021 06:55:13 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03ams.nl.ibm.com with ESMTP id 3bef2amjm7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 07 Oct 2021 06:55:12 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1976njXB51708386
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 7 Oct 2021 06:49:45 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0A6A75204E;
 Thu,  7 Oct 2021 06:55:09 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.78.197.54])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 1ADBF52054;
 Thu,  7 Oct 2021 06:55:06 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au, acme@kernel.org, jolsa@kernel.org
Subject: [V3 0/4] powerpc/perf: Add instruction and data address registers to
 extended regs
Date: Thu,  7 Oct 2021 12:25:01 +0530
Message-Id: <20211007065505.27809-1-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: c6Yd3eH3dPI7cna_0AaqldndOSEhCDCt
X-Proofpoint-GUID: c6Yd3eH3dPI7cna_0AaqldndOSEhCDCt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-06_04,2021-10-07_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0
 clxscore=1015 phishscore=0 mlxlogscore=968 priorityscore=1501
 lowpriorityscore=0 adultscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110070043
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
Cc: kjain@linux.ibm.com, maddy@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, rnsastry@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Patch set adds PMU registers namely Sampled Instruction Address Register
(SIAR) and Sampled Data Address Register (SDAR) as part of extended regs
in PowerPC. These registers provides the instruction/data address and
adding these to extended regs helps in debug purposes.

Patch 1/4 and 2/4 refactors the existing macro definition of
PERF_REG_PMU_MASK_300 and PERF_REG_PMU_MASK_31 to make it more
readable.
Patch 3/4 adds SIAR and SDAR as part of the extended regs mask.
Patch 4/4 includes perf tools side changes to add the SPRs to
sample_reg_mask to use with -I? option.

Changelog:
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

Athira Rajeev (4):
  powerpc/perf: Refactor the code definition of perf reg extended mask
  tools/perf: Refactor the code definition of perf reg extended mask in
    tools side header file
  powerpc/perf: Expose instruction and data address registers as part of
    extended regs
  tools/perf: Add perf tools support to expose instruction and data
    address registers as part of extended regs

 arch/powerpc/include/uapi/asm/perf_regs.h     | 28 ++++++++++++-------
 arch/powerpc/perf/perf_regs.c                 |  4 +++
 .../arch/powerpc/include/uapi/asm/perf_regs.h | 28 ++++++++++++-------
 tools/perf/arch/powerpc/include/perf_regs.h   |  2 ++
 tools/perf/arch/powerpc/util/perf_regs.c      |  2 ++
 5 files changed, 44 insertions(+), 20 deletions(-)

-- 
2.30.1 (Apple Git-130)

