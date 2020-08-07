Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A925223EB3C
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Aug 2020 12:09:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BNLgS69y4zDqx1
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Aug 2020 20:09:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=c689BRNS; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BNLZl1vwyzDqKP
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Aug 2020 20:05:18 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 077A1XHe188637; Fri, 7 Aug 2020 06:05:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject : date : message-id; s=pp1;
 bh=RGuXHRNra8QJCRZrAAm5fnU3IbxvAIMQHMdIFwRveyI=;
 b=c689BRNSLdFA9CMNv0xCX8uA8cBIG9FqnMUj+T7cqzOc5e12hl6KvFTm6rakq0tBNVgm
 phKFJgXg0tdbZqAZei6dU27p5RpSwhloGVbAG9bMpRklLN5Ywt1ze+UDNPf8T8vsKFu+
 9Seh6XoW9JRF0gM9hzzMjgY9RFX+buPhhlMjHG4nCcj3FdDZsl+4eyl/CeKXm2by5Hq/
 WVA0kbU6FCiiTS4n8sahoJ8tgTcGlu2/Mha15uIViputLWy9FUqsAiSbqVQYDi5Tgej/
 ZvHgdbhoNV5u1vPfIrgdHr1WCBPsBg4TcNnRazsKWdm1+1vlhZ8LiwAGLviZeARMdWmF RQ== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32rnu9rcgk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Aug 2020 06:05:09 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 077A1dV8025513;
 Fri, 7 Aug 2020 10:05:08 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03fra.de.ibm.com with ESMTP id 32nyyd3755-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Aug 2020 10:05:07 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 077A3ciu64684340
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 7 Aug 2020 10:03:38 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E8FB54C046;
 Fri,  7 Aug 2020 10:05:04 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B52294C044;
 Fri,  7 Aug 2020 10:05:02 +0000 (GMT)
Received: from localhost.localdomain.localdomain (unknown [9.199.53.190])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  7 Aug 2020 10:05:02 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH V6 0/2] powerpc/perf: Add support for perf extended regs in
 powerpc
Date: Fri,  7 Aug 2020 06:04:59 -0400
Message-Id: <1596794701-23530-1-git-send-email-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-07_05:2020-08-06,
 2020-08-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 mlxlogscore=999
 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008070071
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
 kjain@linux.ibm.com, acme@kernel.org, jolsa@kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Patch set to add support for perf extended register capability in
powerpc. The capability flag PERF_PMU_CAP_EXTENDED_REGS, is used to
indicate the PMU which support extended registers. The generic code
define the mask of extended registers as 0 for non supported architectures.

patch 1/2 defines the PERF_PMU_CAP_EXTENDED_REGS mask to output the
values of mmcr0,mmcr1,mmcr2 for POWER9. Defines `PERF_REG_EXTENDED_MASK`
at runtime which contains mask value of the supported registers under
extended regs.

patch 2/2 adds the extended regs support for power10 and exposes
MMCR3, SIER2, SIER3 registers as part of extended regs.

This patch series is based on powerpc/next and includes the kernel
side changes to support extended regs. perf tools side changes will
be sent as separate patchset.

Changelog:
Changes from v5 -> v6
- Split kernel changes to one patchset as suggested by
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
  powerpc/perf: Add support for outputting extended regs in perf
    intr_regs

Athira Rajeev (1):
  powerpc/perf: Add extended regs support for power10 platform

 arch/powerpc/include/asm/perf_event.h        |  3 ++
 arch/powerpc/include/asm/perf_event_server.h |  5 ++++
 arch/powerpc/include/uapi/asm/perf_regs.h    | 20 ++++++++++++-
 arch/powerpc/perf/core-book3s.c              |  1 +
 arch/powerpc/perf/perf_regs.c                | 44 ++++++++++++++++++++++++++--
 arch/powerpc/perf/power10-pmu.c              |  6 ++++
 arch/powerpc/perf/power9-pmu.c               |  6 ++++
 7 files changed, 81 insertions(+), 4 deletions(-)

-- 
1.8.3.1

