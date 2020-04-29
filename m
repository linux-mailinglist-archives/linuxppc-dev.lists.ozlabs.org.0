Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D652F1BD46B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 08:08:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Bp400szVzDqSg
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 16:08:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=anju@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49BnzJ5FWmzDqkL
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Apr 2020 16:04:41 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03T63kUg095440; Wed, 29 Apr 2020 02:04:32 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30mg17st2u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Apr 2020 02:04:32 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 03T5sbaf023927;
 Wed, 29 Apr 2020 06:04:30 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03ams.nl.ibm.com with ESMTP id 30mcu5qqfd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Apr 2020 06:04:30 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03T64SqK57016424
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 29 Apr 2020 06:04:28 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5F8FFA4064;
 Wed, 29 Apr 2020 06:04:28 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 90BFCA4054;
 Wed, 29 Apr 2020 06:04:26 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.85.127.103])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 29 Apr 2020 06:04:26 +0000 (GMT)
From: Anju T Sudhakar <anju@linux.vnet.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 0/2] powerpc/perf: Add support for perf extended regs in
 powerpc
Date: Wed, 29 Apr 2020 11:34:13 +0530
Message-Id: <20200429060415.25930-1-anju@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-29_01:2020-04-28,
 2020-04-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 malwarescore=0
 suspectscore=1 lowpriorityscore=0 spamscore=0 phishscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004290043
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
Cc: ravi.bangoria@linux.ibm.com, maddy@linux.vnet.ibm.com,
 linux-kernel@vger.kernel.org, acme@kernel.org, anju@linux.vnet.ibm.com,
 jolsa@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Patch set to add support for perf extended register capability in
powerpc. The capability flag PERF_PMU_CAP_EXTENDED_REGS, is used to
indicate the PMU which support extended registers. The generic code
define the mask of extended registers as 0 for non supported architectures.

patch 2/2 defines this PERF_PMU_CAP_EXTENDED_REGS mask to output the
values of mmcr0,mmcr1,mmcr2 for POWER9.                
                                                                           
x86/perf_regs.h is included by util/intel-pt.c, which will get compiled       
when buiding perf on powerpc. Since x86/perf_regs.h has                    
`PERF_EXTENDED_REG_MASK` defined, defining `PERF_EXTENDED_REG_MASK` for       
powerpc to add support for perf extended regs will result in perf build       
error on powerpc. Currently powerpc architecture is not having support
for auxtrace. So as a workaround for this issue, patch 1/2 set
NO_AUXTRACE for powerpc. (Any other solutions are welcome.)

Patch 2/2 also add extended regs to sample_reg_mask in the tool side to use
with `-I?` option.

Anju T Sudhakar (2):
  tools/perf: set no_auxtrace for powerpc
  powerpc/perf: Add support for outputting extended regs in perf
    intr_regs

 arch/powerpc/include/asm/perf_event_server.h  |  5 +++
 arch/powerpc/include/uapi/asm/perf_regs.h     | 13 +++++++-
 arch/powerpc/perf/core-book3s.c               |  1 +
 arch/powerpc/perf/perf_regs.c                 | 29 ++++++++++++++--
 arch/powerpc/perf/power9-pmu.c                |  1 +
 .../arch/powerpc/include/uapi/asm/perf_regs.h | 13 +++++++-
 tools/perf/arch/powerpc/Makefile              |  1 +
 tools/perf/arch/powerpc/include/perf_regs.h   |  6 +++-
 tools/perf/arch/powerpc/util/perf_regs.c      | 33 +++++++++++++++++++
 9 files changed, 96 insertions(+), 6 deletions(-)

-- 
2.20.1

