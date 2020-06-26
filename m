Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9851720AF3F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jun 2020 11:54:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49tXK457PzzDqvN
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jun 2020 19:54:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bala24@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49tXHC1c9RzDqxq
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jun 2020 19:52:23 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05Q9Vd3e145448; Fri, 26 Jun 2020 05:52:17 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31wd7bu3yh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Jun 2020 05:52:17 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 05Q9Vm7H146347;
 Fri, 26 Jun 2020 05:52:17 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31wd7bu3xt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Jun 2020 05:52:17 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05Q9oDlw022331;
 Fri, 26 Jun 2020 09:52:15 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma02fra.de.ibm.com with ESMTP id 31uusk1cqy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Jun 2020 09:52:15 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 05Q9orWe54722914
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 26 Jun 2020 09:50:53 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 75661AE055;
 Fri, 26 Jun 2020 09:52:12 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3EEE2AE059;
 Fri, 26 Jun 2020 09:52:09 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.77.194.240])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 26 Jun 2020 09:52:08 +0000 (GMT)
From: Balamuruhan S <bala24@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH v2 0/4] Prefixed instruction tests to cover negative cases
Date: Fri, 26 Jun 2020 15:21:54 +0530
Message-Id: <20200626095158.1031507-1-bala24@linux.ibm.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-26_04:2020-06-26,
 2020-06-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0
 suspectscore=0 mlxlogscore=670 cotscore=-2147483648 clxscore=1015
 adultscore=0 malwarescore=0 impostorscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006260067
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
Cc: ravi.bangoria@linux.ibm.com, jniethe5@gmail.com,
 Balamuruhan S <bala24@linux.ibm.com>, paulus@samba.org, sandipan@linux.ibm.com,
 naveen.n.rao@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This patchset adds support to test negative scenarios and adds testcase
for paddi with few fixes. It is based on powerpc/next and on top of
Jordan's tests for prefixed instructions patchsets,

https://lists.ozlabs.org/pipermail/linuxppc-dev/2020-May/211394.html
https://lists.ozlabs.org/pipermail/linuxppc-dev/2020-June/211768.html

Changes in v2:
-------------
Fix review comments from Sandipan and Jordan,
* use helper function to print word/prefix instructions
* reuse bits of `flags` to represent negative test scenario
* always set NIP instead of only setting for relative prefixed
  instructions

Balamuruhan S (4):
  powerpc test_emulate_step: enhancement to test negative scenarios
  powerpc test_emulate_step: add negative tests for prefixed addi
  powerpc sstep: introduce macros to retrieve Prefix instruction
    operands
  powerpc test_emulate_step: move extern declaration to sstep.h

 arch/powerpc/include/asm/sstep.h     |  6 ++++
 arch/powerpc/lib/sstep.c             | 12 ++++----
 arch/powerpc/lib/test_emulate_step.c | 42 ++++++++++++++++++++--------
 3 files changed, 43 insertions(+), 17 deletions(-)


base-commit: 64677779e8962c20b580b471790fe42367750599
prerequisite-patch-id: 3fff52f42000e816e2e8b4f75a2bca651dec5efe
prerequisite-patch-id: 5d7904bf38248ec39ed0f6223500286b9eaf82a9
prerequisite-patch-id: 7236d3caa4dc6de6079ae893678223876a3bb364
prerequisite-patch-id: 733e7f9b5c6ade64b8a1c7458b5aefe6b7d6fcff
prerequisite-patch-id: 4793e7716f3f56577a49976539d06db37ba31a80
prerequisite-patch-id: ffb024c2590e7249190b0137acf267e821a816a7
prerequisite-patch-id: 86e64f47de2dc6e9a6e1404de12d7c91775c22c8
prerequisite-patch-id: 9fbe5c3af9590696c230944cdee3c45e01f44d6d
prerequisite-patch-id: 3f9c6238023c867e27d87de26487e7e665a9dc12
-- 
2.24.1

