Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5759929CFED
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Oct 2020 13:40:13 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CLp7Z55v6zDqDX
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Oct 2020 23:40:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=cCznlyto; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CLp2m5Xn5zDqRv
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Oct 2020 23:36:00 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09SCW4Pf016767; Wed, 28 Oct 2020 08:35:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=MV2MBnKKYZiGBnNfPc84zyMszrhhiWoSY+vuWbX4zLY=;
 b=cCznlytoBN4iufLk15zpGbMCeEhHE5w+q85O21qDVv1KNAvQTq/SHRqmR8zs6/mFrTgO
 YdjYgG/47EtaYZFl5+p5Q07Jpv0mm9COdGZN/EezBXHkWqMZgq4vQ5S1RiPwyDXPWCQ6
 WGMDt9sgen50qHSGXscXcrFngM39Dkb71I4kDsphUK0FlQzpBMTfo1gqsnty6GEVDa6R
 Qa/eIjpBNCLyOtK72BlvXq5H0gzCzdiD6keSoHT122oZz/V04hm24dy2Nvo9M0BhfJ4k
 +KY85uHlocxnOEWK2x1FKbgBAMYmWHZRQyz+uJo/6mgpS0H8TneY67TXOaNTBIP+o8No Jg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 34ew3jafv7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Oct 2020 08:35:44 -0400
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 09SCXA3g025166;
 Wed, 28 Oct 2020 08:35:44 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 34ew3jafu2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Oct 2020 08:35:43 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09SCR1HK011222;
 Wed, 28 Oct 2020 12:35:42 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06ams.nl.ibm.com with ESMTP id 34cbhh4g5v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Oct 2020 12:35:41 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 09SCZdEV33620246
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 28 Oct 2020 12:35:39 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A1212A4059;
 Wed, 28 Oct 2020 12:35:39 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 95ABEA4051;
 Wed, 28 Oct 2020 12:35:37 +0000 (GMT)
Received: from srikart450.in.ibm.com (unknown [9.79.210.102])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 28 Oct 2020 12:35:37 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH 0/4] Powerpc: Better preemption for shared processor
Date: Wed, 28 Oct 2020 18:05:08 +0530
Message-Id: <20201028123512.871051-1-srikar@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-10-28_04:2020-10-26,
 2020-10-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 mlxlogscore=974 bulkscore=0 phishscore=0 clxscore=1015 impostorscore=0
 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2010280083
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
 Gautham R Shenoy <ego@linux.vnet.ibm.com>, Phil Auld <pauld@redhat.com>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Juri Lelli <juri.lelli@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 LKML <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Waiman Long <longman@redhat.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Valentin Schneider <valentin.schneider@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currently, vcpu_is_preempted will return the yield_count for
shared_processor. On a PowerVM LPAR, Phyp schedules at SMT8 core boundary
i.e all CPUs belonging to a core are either group scheduled in or group
scheduled out. This can be used to better predict non-preempted CPUs on
PowerVM shared LPARs.

perf stat -r 5 -a perf bench sched pipe -l 10000000 (lesser time is better)

powerpc/next
     35,107,951.20 msec cpu-clock                 #  255.898 CPUs utilized            ( +-  0.31% )
        23,655,348      context-switches          #    0.674 K/sec                    ( +-  3.72% )
            14,465      cpu-migrations            #    0.000 K/sec                    ( +-  5.37% )
            82,463      page-faults               #    0.002 K/sec                    ( +-  8.40% )
 1,127,182,328,206      cycles                    #    0.032 GHz                      ( +-  1.60% )  (66.67%)
    78,587,300,622      stalled-cycles-frontend   #    6.97% frontend cycles idle     ( +-  0.08% )  (50.01%)
   654,124,218,432      stalled-cycles-backend    #   58.03% backend cycles idle      ( +-  1.74% )  (50.01%)
   834,013,059,242      instructions              #    0.74  insn per cycle
                                                  #    0.78  stalled cycles per insn  ( +-  0.73% )  (66.67%)
   132,911,454,387      branches                  #    3.786 M/sec                    ( +-  0.59% )  (50.00%)
     2,890,882,143      branch-misses             #    2.18% of all branches          ( +-  0.46% )  (50.00%)

           137.195 +- 0.419 seconds time elapsed  ( +-  0.31% )

powerpc/next + patchset
     29,981,702.64 msec cpu-clock                 #  255.881 CPUs utilized            ( +-  1.30% )
        40,162,456      context-switches          #    0.001 M/sec                    ( +-  0.01% )
             1,110      cpu-migrations            #    0.000 K/sec                    ( +-  5.20% )
            62,616      page-faults               #    0.002 K/sec                    ( +-  3.93% )
 1,430,030,626,037      cycles                    #    0.048 GHz                      ( +-  1.41% )  (66.67%)
    83,202,707,288      stalled-cycles-frontend   #    5.82% frontend cycles idle     ( +-  0.75% )  (50.01%)
   744,556,088,520      stalled-cycles-backend    #   52.07% backend cycles idle      ( +-  1.39% )  (50.01%)
   940,138,418,674      instructions              #    0.66  insn per cycle
                                                  #    0.79  stalled cycles per insn  ( +-  0.51% )  (66.67%)
   146,452,852,283      branches                  #    4.885 M/sec                    ( +-  0.80% )  (50.00%)
     3,237,743,996      branch-misses             #    2.21% of all branches          ( +-  1.18% )  (50.01%)

            117.17 +- 1.52 seconds time elapsed  ( +-  1.30% )

This is around 14.6% improvement in performance.

Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Cc: LKML <linux-kernel@vger.kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Nathan Lynch <nathanl@linux.ibm.com>
Cc: Gautham R Shenoy <ego@linux.vnet.ibm.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Valentin Schneider <valentin.schneider@arm.com>
Cc: Juri Lelli <juri.lelli@redhat.com>
Cc: Waiman Long <longman@redhat.com>
Cc: Phil Auld <pauld@redhat.com>

Srikar Dronamraju (4):
  powerpc: Refactor is_kvm_guest declaration to new header
  powerpc: Rename is_kvm_guest to check_kvm_guest
  powerpc: Reintroduce is_kvm_guest
  powerpc/paravirt: Use is_kvm_guest in vcpu_is_preempted

 arch/powerpc/include/asm/firmware.h  |  6 ------
 arch/powerpc/include/asm/kvm_guest.h | 25 +++++++++++++++++++++++++
 arch/powerpc/include/asm/kvm_para.h  |  2 +-
 arch/powerpc/include/asm/paravirt.h  | 18 ++++++++++++++++++
 arch/powerpc/kernel/firmware.c       |  5 ++++-
 arch/powerpc/platforms/pseries/smp.c |  3 ++-
 6 files changed, 50 insertions(+), 9 deletions(-)
 create mode 100644 arch/powerpc/include/asm/kvm_guest.h

-- 
2.18.4

