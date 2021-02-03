Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD2930D38E
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 07:57:09 +0100 (CET)
Received: from bilbo.ozlabs.org (unknown [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DVstV3S7BzDx2Q
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 17:57:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Qwg2B1oQ; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DVss53DcqzDqYD
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Feb 2021 17:55:53 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 1136kuY3150519; Wed, 3 Feb 2021 01:55:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject : date : message-id; s=pp1;
 bh=X8S29gXM9iqB4Ln0S5W0bTVX1HjVKZvBRCq3lepACoM=;
 b=Qwg2B1oQcMdQhaBKaeHacdvItnIVILi+b/6CEgoCl5NlQaZn+Tq52yBcGOf9+QZu5MYO
 +lXNRtGua0odb1LklhmZULuL/Y38NIPwBf9gY/oJIOq8yjuwNIrkqIU+7g+GBn1ZqlrA
 +h+n2lTHu1ZoTKFhz8s34jpzqA2f069qT3Xu+wr3krlzPFLwnE5hpEkEuhfbM2gO9ELN
 K+KVz6OKE29571f3O8ruPV9o88VA2vEft03tL0uKaj6yahtFPq9fSX7b8SIlagclgS4H
 PVMhfImnKlqof4O43ZlXUg9svauNrpo7hWmoK/lVXqKmGnXz+92fcdlp9iouWaTGKaFJ +g== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36fpv704a2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Feb 2021 01:55:44 -0500
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 1136qGU3015767;
 Wed, 3 Feb 2021 06:55:43 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03ams.nl.ibm.com with ESMTP id 36er8y9dat-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Feb 2021 06:55:43 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1136tesF33161582
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 3 Feb 2021 06:55:40 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 388474C044;
 Wed,  3 Feb 2021 06:55:40 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DE6B64C04E;
 Wed,  3 Feb 2021 06:55:38 +0000 (GMT)
Received: from localhost.localdomain.localdomain (unknown [9.79.224.72])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  3 Feb 2021 06:55:38 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au, acme@kernel.org, jolsa@kernel.org
Subject: [PATCH 0/3] powerpc/perf: Add Performance Monitor Counters to
 extended regs
Date: Wed,  3 Feb 2021 01:55:34 -0500
Message-Id: <1612335337-1888-1-git-send-email-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-03_01:2021-02-02,
 2021-02-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 clxscore=1015 mlxlogscore=841 priorityscore=1501 bulkscore=0
 suspectscore=0 malwarescore=0 impostorscore=0 phishscore=0 spamscore=0
 mlxscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102030035
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
Cc: kjain@linux.ibm.com, maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Patch set to add Performance Monitor Counter SPR's as
part of extended regs in powerpc.

Patch 1/3 saves the PMC values in the perf interrupt
handler as part of per-cpu array.
Patch 2/3 adds PMC1 to PMC6 as part of the extended
regs mask.
Patch 3/3 includes perf tools side changes to add
PMC1 to PMC6 to sample_reg_mask to use with -I? option.

Athira Rajeev (3):
  powerpc/perf: Include PMCs as part of per-cpu cpuhw_events struct
  powerpc/perf: Expose Performance Monitor Counter SPR's as part of
    extended regs
  tools/perf: Add perf tools support to expose Performance Monitor
    Counter SPRs as part of extended regs

 arch/powerpc/include/asm/perf_event.h           |  2 ++
 arch/powerpc/include/uapi/asm/perf_regs.h       | 28 +++++++++++++++++++------
 arch/powerpc/perf/core-book3s.c                 | 28 +++++++++++++++++++------
 arch/powerpc/perf/perf_regs.c                   | 13 ++++--------
 tools/arch/powerpc/include/uapi/asm/perf_regs.h | 28 +++++++++++++++++++------
 tools/perf/arch/powerpc/include/perf_regs.h     |  6 ++++++
 tools/perf/arch/powerpc/util/perf_regs.c        |  6 ++++++
 7 files changed, 84 insertions(+), 27 deletions(-)

-- 
1.8.3.1

