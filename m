Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3038114CBF0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jan 2020 14:57:11 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4874mN1kdPzDqRp
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jan 2020 00:57:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4874gy0NL7zDqQ3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jan 2020 00:53:17 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00TDihfp117179
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2020 08:53:15 -0500
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2xuagmssxq-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2020 08:53:14 -0500
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <srikar@linux.vnet.ibm.com>;
 Wed, 29 Jan 2020 13:53:12 -0000
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 29 Jan 2020 13:53:09 -0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 00TDr8Si39911830
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 29 Jan 2020 13:53:08 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9DD14A405F;
 Wed, 29 Jan 2020 13:53:08 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 06F7DA4054;
 Wed, 29 Jan 2020 13:53:07 +0000 (GMT)
Received: from srikart450.in.ibm.com (unknown [9.193.110.254])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 29 Jan 2020 13:53:06 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v6 0/5] Early node associativity
Date: Wed, 29 Jan 2020 19:22:56 +0530
X-Mailer: git-send-email 2.17.1
X-TM-AS-GCONF: 00
x-cbid: 20012913-0016-0000-0000-000002E1C526
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20012913-0017-0000-0000-000033448B3C
Message-Id: <20200129135301.24739-1-srikar@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-29_03:2020-01-28,
 2020-01-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015
 mlxlogscore=806 malwarescore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 suspectscore=0 bulkscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1911200001 definitions=main-2001290114
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Abdul Haleem <abdhalee@linux.vnet.ibm.com>,
 Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Note: (Only patch 4 changes from v5)

Abdul reported  a warning on a shared lpar.
"WARNING: workqueue cpumask: online intersect > possible intersect".
This is because per node workqueue possible mask is set very early in the
boot process even before the system was querying the home node
associativity. However per node workqueue online cpumask gets updated
dynamically. Hence there is a chance when per node workqueue online cpumask
is a superset of per node workqueue possible mask.

Link for v5: http://lkml.kernel.org/r/20191216144904.6776-1-srikar@linux.vnet.ibm.com
Changelog: v5->v6
 - Handled comments from Michael Ellerman
 - Rebased to v5.5-rc6

Link for v4: https://patchwork.ozlabs.org/patch/1161979
Changelog: v4->v5:
- Rebased to v5.5-rc2

Link for v3: http://lkml.kernel.org/r/20190906135020.19772-1-srikar@linux.vnet.ibm.com
Changelog: v3->v4
 - Added a warning as suggested by Nathan Lynch.

Link for v2: http://lkml.kernel.org/r/20190829055023.6171-1-srikar@linux.vnet.ibm.com
Changelog: v2->v3
 - Handled comments from Nathan Lynch.

Link for v1: https://patchwork.ozlabs.org/patch/1151658
Changelog: v1->v2
 - Handled comments from Nathan Lynch.

Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Abdul Haleem <abdhalee@linux.vnet.ibm.com>
Cc: Nathan Lynch <nathanl@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>

Srikar Dronamraju (5):
  powerpc/vphn: Check for error from hcall_vphn
  powerpc/numa: Handle extra hcall_vphn error cases
  powerpc/numa: Use cpu node map of first sibling thread
  powerpc/numa: Early request for home node associativity
  powerpc/numa: Remove late request for home node associativity

 arch/powerpc/include/asm/topology.h   |  4 --
 arch/powerpc/kernel/smp.c             |  5 --
 arch/powerpc/mm/numa.c                | 97 +++++++++++++++++++++++++++--------
 arch/powerpc/platforms/pseries/vphn.c |  3 +-
 4 files changed, 78 insertions(+), 31 deletions(-)

-- 
1.8.3.1

