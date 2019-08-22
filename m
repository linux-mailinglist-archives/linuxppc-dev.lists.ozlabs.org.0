Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8485C99745
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2019 16:48:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46DnT46CvxzDqQD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Aug 2019 00:48:08 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46DnM827qSzDqgG
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2019 00:42:59 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7MEdouc117527
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2019 10:42:57 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2uhv9wtegv-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2019 10:42:57 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <srikar@linux.vnet.ibm.com>;
 Thu, 22 Aug 2019 15:42:55 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 22 Aug 2019 15:42:53 +0100
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7MEgq9739583906
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 22 Aug 2019 14:42:52 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 68F624C04A;
 Thu, 22 Aug 2019 14:42:52 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1CAE84C05A;
 Thu, 22 Aug 2019 14:42:51 +0000 (GMT)
Received: from srikart450.in.ibm.com (unknown [9.122.211.52])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 22 Aug 2019 14:42:50 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 0/3] Early node associativity
Date: Thu, 22 Aug 2019 20:12:32 +0530
X-Mailer: git-send-email 2.17.1
X-TM-AS-GCONF: 00
x-cbid: 19082214-0020-0000-0000-00000362888C
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19082214-0021-0000-0000-000021B7C466
Message-Id: <20190822144235.19398-1-srikar@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-22_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=798 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908220148
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
 Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>
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

The below patches try to fix this problem.
Reported at : https://github.com/linuxppc/issues/issues/167

Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Abdul Haleem <abdhalee@linux.vnet.ibm.com>
Cc: Nathan Lynch <nathanl@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>

Srikar Dronamraju (3):
  powerpc/vphn: Check for error from hcall_vphn
  powerpc/numa: Early request for home node associativity
  powerpc/numa: Remove late request for home node associativity

 arch/powerpc/include/asm/topology.h   |  4 ---
 arch/powerpc/kernel/setup-common.c    |  5 ++--
 arch/powerpc/kernel/smp.c             |  5 ----
 arch/powerpc/mm/numa.c                | 53 ++++++++++++++++++++++++++---------
 arch/powerpc/platforms/pseries/vphn.c |  3 +-
 5 files changed, 45 insertions(+), 25 deletions(-)

-- 
1.8.3.1

