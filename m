Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF072805F6
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Oct 2020 19:54:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C2LNL36w1zDqcH
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Oct 2020 03:54:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ganeshgr@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=byA0B1Lm; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C2LLb5XmKzDqVv
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Oct 2020 03:52:39 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 091HWaEs138831; Thu, 1 Oct 2020 13:52:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=OfvnwLH516VrQML87JCXCUbIgnUzFHlxDL0rEy5+SQw=;
 b=byA0B1LmY++BlaE29NiIepV3KuM5qghZPAJgJzzeRnCgqmkB6B1kl5vvq2if7ERqDDH4
 jieqmXmADlOhQASQ0bh/oQQ6pUUmcd+QlP1lDpTQPKLI903m5RKyCXvPtKIj1o6tmlpk
 xBVMyVTvYlhAvwiSa75SXaLxz+FuSvbcB3GtQYSnzwp632L1S4HPunRvQqYvO+FSCBMg
 lWVjL+j1dDntFKBYOwSR3CNQerITifmkrV5wNEIYtOU36X20P11XSZHNOcyVeYEwMJ+G
 xFYsy/skQSkWD+MtVrvqeM641CiUrfW77AUl7cXCpydIiLEIHndoyNVg/rKg5nGJm0KQ Dw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 33wjwqhx5e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Oct 2020 13:52:32 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 091HoksX016300;
 Thu, 1 Oct 2020 13:52:31 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 33wjwqhx4p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Oct 2020 13:52:31 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 091HcL5x016303;
 Thu, 1 Oct 2020 17:52:29 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06ams.nl.ibm.com with ESMTP id 33v6mgtb3x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Oct 2020 17:52:29 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 091HqRVQ32899528
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 1 Oct 2020 17:52:27 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F0AA54203F;
 Thu,  1 Oct 2020 17:52:26 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 08CD342041;
 Thu,  1 Oct 2020 17:52:25 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.77.200.14])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  1 Oct 2020 17:52:24 +0000 (GMT)
From: Ganesh Goudar <ganeshgr@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v3 0/2] powerpc/mce: Fix mce handler and add selftest
Date: Thu,  1 Oct 2020 23:21:42 +0530
Message-Id: <20201001175144.286189-1-ganeshgr@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-01_06:2020-10-01,
 2020-10-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 mlxscore=0 phishscore=0
 impostorscore=0 adultscore=0 spamscore=0 mlxlogscore=999
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2010010144
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
Cc: msuchanek@suse.de, Ganesh Goudar <ganeshgr@linux.ibm.com>,
 keescook@chromium.org, npiggin@gmail.com, mahesh@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This patch series fixes mce handling for pseries, Adds LKDTM test
for SLB multihit recovery and enables selftest for the same,
basically to test MCE handling on pseries/powernv machines running
in hash mmu mode.

v3:
* Merging selftest changes with patch 2/2, Instead of having separate
  patch.
* Minor improvements like adding enough comments, Makefile changes,
  including header file and adding some prints.

v2:
* Remove in_nmi check before calling nmi_enter/exit,
  as nesting is supported.
* Fix build errors and remove unused variables.
* Integrate error injection code into LKDTM.
* Add support to inject multihit in paca.

Ganesh Goudar (2):
  powerpc/mce: remove nmi_enter/exit from real mode handler
  lkdtm/powerpc: Add SLB multihit test

 arch/powerpc/kernel/mce.c               |  10 +-
 drivers/misc/lkdtm/Makefile             |   1 +
 drivers/misc/lkdtm/core.c               |   3 +
 drivers/misc/lkdtm/lkdtm.h              |   3 +
 drivers/misc/lkdtm/powerpc.c            | 156 ++++++++++++++++++++++++
 tools/testing/selftests/lkdtm/tests.txt |   1 +
 6 files changed, 170 insertions(+), 4 deletions(-)
 create mode 100644 drivers/misc/lkdtm/powerpc.c

-- 
2.26.2

