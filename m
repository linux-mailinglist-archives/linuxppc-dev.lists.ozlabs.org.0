Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AAEABABA1A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Sep 2019 16:00:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Pzj45qP2zDqNP
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Sep 2019 00:00:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=srikar@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46PzTs24H8zDqQw
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Sep 2019 23:50:40 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x86Dl2dK008256
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 6 Sep 2019 09:50:37 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2uupb2wnek-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Sep 2019 09:50:36 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <srikar@linux.vnet.ibm.com>;
 Fri, 6 Sep 2019 14:50:34 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 6 Sep 2019 14:50:32 +0100
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x86DoWxr60096532
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 6 Sep 2019 13:50:32 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E123D4C04E;
 Fri,  6 Sep 2019 13:50:31 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 95FEA4C046;
 Fri,  6 Sep 2019 13:50:30 +0000 (GMT)
Received: from srikart450.in.ibm.com (unknown [9.122.211.241])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  6 Sep 2019 13:50:30 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v3 0/5] Early node associativity
Date: Fri,  6 Sep 2019 19:20:15 +0530
X-Mailer: git-send-email 2.17.1
X-TM-AS-GCONF: 00
x-cbid: 19090613-0012-0000-0000-000003478695
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19090613-0013-0000-0000-00002181E0EB
Message-Id: <20190906135020.19772-1-srikar@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-06_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=745 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1909060147
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

Abdul reported  a warning on a shared lpar.
"WARNING: workqueue cpumask: online intersect > possible intersect".
This is because per node workqueue possible mask is set very early in the
boot process even before the system was querying the home node
associativity. However per node workqueue online cpumask gets updated
dynamically. Hence there is a chance when per node workqueue online cpumask
is a superset of per node workqueue possible mask.

Link for v1: https://patchwork.ozlabs.org/patch/1151658
Changelog: v1->v2
 - Handled comments from Nathan Lynch.

Link for v2: http://lkml.kernel.org/r/20190829055023.6171-1-srikar@linux.vnet.ibm.com
Changelog: v2->v3
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
 arch/powerpc/mm/numa.c                | 96 ++++++++++++++++++++++++++---------
 arch/powerpc/platforms/pseries/vphn.c |  3 +-
 4 files changed, 74 insertions(+), 34 deletions(-)

-- 
1.8.3.1

