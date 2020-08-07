Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB5423EB5B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Aug 2020 12:17:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BNLs86PPLzDqxL
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Aug 2020 20:17:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=HhlntNg1; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BNLjx1wN9zDqqJ
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Aug 2020 20:11:32 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 077A3JTR104828; Fri, 7 Aug 2020 06:11:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject : date : message-id; s=pp1;
 bh=11PPJtKVF6GjWpY9oYYgP7Y1PQ/3wFUa4iOJQbwqaEw=;
 b=HhlntNg1d4nUI1mo1G2dIdEeb4Umrd+MR+FmYxFtPNSkA7jr8QWJ0RgogVKwoN4mXvfR
 72sBY2BTjbo1spcYmRQ5S4Tb6Aeq/bChUUmkel2FPr6vISIcxw79zFRUaTuk2Xif/gbk
 RFEhh36WhKNhOlpPT+mcFKlmXcb9QsG72hB4tUzLXL6W8H8cI8paTIMeEbXBhlyOdNJf
 kANiHrGZa3Rhtn5xbKt9Pj1piHXtnQTdsAaue+2TEA9e95KsyxGHVCDUz9yZ7hFRBlhW
 mnL1YQtdam/ZIOPwc7TFF8ehwpf8pUWym6eczf+ohC4aXrejwAhsQtCVtT9DpmYApruI VA== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32rhhm1dgc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Aug 2020 06:11:28 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 077A5p3o026246;
 Fri, 7 Aug 2020 10:11:25 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04ams.nl.ibm.com with ESMTP id 32n0186hpr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Aug 2020 10:11:25 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 077ABMRs61473042
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 7 Aug 2020 10:11:22 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BFD914C040;
 Fri,  7 Aug 2020 10:11:22 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AEE734C052;
 Fri,  7 Aug 2020 10:11:20 +0000 (GMT)
Received: from localhost.localdomain.localdomain (unknown [9.199.53.190])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  7 Aug 2020 10:11:20 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au, acme@kernel.org, jolsa@kernel.org
Subject: [PATCH V6 0/2] tools/perf: Add extended regs support for powerpc
Date: Fri,  7 Aug 2020 06:11:17 -0400
Message-Id: <1596795079-23601-1-git-send-email-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-07_06:2020-08-06,
 2020-08-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 adultscore=0 bulkscore=0 impostorscore=0 malwarescore=0 mlxscore=0
 suspectscore=0 mlxlogscore=999 phishscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008070075
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
Cc: ravi.bangoria@linux.ibm.com, mikey@neuling.org, maddy@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, kjain@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Patch set to add perf tools support for perf extended register capability
in powerpc. 

Patch 1/2 adds extended regs for power9 ( mmcr0, mmcr1 and mmcr2 )
to sample_reg_mask in the tool side to use with `-I?`.
Patch 2/2 adds extended regs for power10 ( mmcr3, sier2, sier3)
to sample_reg_mask in the tool side.

Ravi bangoria found an issue with `perf record -I` while testing the
changes. The same issue is currently being worked on here:
https://lkml.org/lkml/2020/7/19/413 and will be resolved once fix
from Jin Yao is merged.

This includes the perf tools side changes to support extended regs.
kernel side changes are sent as separate patchset.

Changelog:
Changes from v5 -> v6
- Split perf tools side changes to one patchset as suggested by
  Arnaldo
  Link to previous series:
  https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=192624

Changes from v4 -> v5
- initialize `perf_reg_extended_max` to work on
  all platforms as suggested by Ravi Bangoria
- Added Reviewed-and-Tested-by from Ravi Bangoria

Changes from v3 -> v4
- Split the series and send extended regs as separate patch set here.
  Link to previous series :
  https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=190462&state=*
  Other PMU patches are already merged in powerpc/next.

- Fixed kernel build issue when using config having
  CONFIG_PERF_EVENTS set and without CONFIG_PPC_PERF_CTRS
  reported by kernel build bot.
- Included Reviewed-by from Kajol Jain.
- Addressed review comments from Ravi Bangoria to initialize `perf_reg_extended_max`
  and define it in lowercase since it is local variable.

Anju T Sudhakar (1):
  tools/perf: Add perf tools support for extended register capability in
    powerpc

Athira Rajeev (1):
  tools/perf: Add perf tools support for extended regs in power10

 tools/arch/powerpc/include/uapi/asm/perf_regs.h | 20 ++++++++-
 tools/perf/arch/powerpc/include/perf_regs.h     |  8 +++-
 tools/perf/arch/powerpc/util/header.c           |  9 +---
 tools/perf/arch/powerpc/util/perf_regs.c        | 55 +++++++++++++++++++++++++
 tools/perf/arch/powerpc/util/utils_header.h     | 15 +++++++
 5 files changed, 97 insertions(+), 10 deletions(-)
 create mode 100644 tools/perf/arch/powerpc/util/utils_header.h

-- 
1.8.3.1

