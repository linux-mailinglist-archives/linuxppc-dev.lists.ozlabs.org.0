Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3375841D9B7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Sep 2021 14:22:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HKsnm0W3Yz3c8M
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Sep 2021 22:22:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bE4YLrbw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=bE4YLrbw; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HKsmM338mz2ywg
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Sep 2021 22:21:23 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18UBfu4F021600; 
 Thu, 30 Sep 2021 08:21:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=Ab5/GOk2A+XLaCKnvZToisUL08Sjjo2NsK3GoikZlpw=;
 b=bE4YLrbwLUd8kgxW5cZ0gX6nkQH0FK4qCisTTSzPAUhIbjYLWhRol+TVRjPK7LEE+XdV
 sCL1v/5aI0fIx2nCj+uLIAjZ83nx2MZJBBApXUiWML1CndtJkfnXhhAAuy/uhZffSFf7
 Hm2ieDNjmH3yYrjiUkWb6J1P3g5Pd3Qh13V1Tqd6eMplOUT9MeKBWRO4godCSEeNNFtL
 IkYxKP2YRwLX06vzrg6ODs6baRC/dj8l+xkgsQlcm+AssgfRBOSJDx39Y1mvjz67GbQm
 5J+htSFYljWXaNNiyS6+aw1a3BAcnDZLVR+9Nun2NwfWOPaZFJgjp4nOqQ5l9i+RJ7m/ Og== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bdck6gun2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Sep 2021 08:21:06 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 18UCHIPu016449;
 Thu, 30 Sep 2021 12:21:04 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma02fra.de.ibm.com with ESMTP id 3b9uda0kb9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Sep 2021 12:21:04 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 18UCFtTs59965700
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 30 Sep 2021 12:15:55 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4833AA4068;
 Thu, 30 Sep 2021 12:21:00 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 07118A406E;
 Thu, 30 Sep 2021 12:20:58 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.79.207.39])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 30 Sep 2021 12:20:57 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au, acme@kernel.org, jolsa@kernel.org
Subject: [V2 0/4] powerpc/perf: Add instruction and data address registers to
 extended regs
Date: Thu, 30 Sep 2021 17:50:51 +0530
Message-Id: <20210930122055.1390-1-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: NrBiXNyXe0dvWnpJ94rBhYVtf7W7G5Z-
X-Proofpoint-GUID: NrBiXNyXe0dvWnpJ94rBhYVtf7W7G5Z-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-30_04,2021-09-30_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 spamscore=0 phishscore=0
 mlxlogscore=918 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2109300076
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

