Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B852872DA
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Oct 2020 12:54:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C6SkR6cZ4zDqVj
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Oct 2020 21:54:07 +1100 (AEDT)
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
 header.s=pp1 header.b=mlmItPyi; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C6ShQ5TYNzDqT6
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Oct 2020 21:52:22 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 098Agoqm024378; Thu, 8 Oct 2020 06:52:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject : date : message-id; s=pp1;
 bh=d2cWcdNK4/f5exs7n6jTUKcNQTFK23/fkj7dhijbc/w=;
 b=mlmItPyia9NvdiEEvmb8RcgtjncsCRMqqiNiSnGe2JjDHoXWvOKmthbsYFkFgwbabeCT
 7wHHODMeUZquck3aPbKARIRQd0ggqWHGbWJRvHqW2N0F63lNV31LsdTsVXVEgXGdbET+
 a/Slx0pEatbgM5uL3PBPe0tSefjPjkc20cGPphKacPseqFEKJAw8dbAc+2kxiv6qtqWJ
 JtbskL0m+TDT+mHNw+em4ZZD4/kT+r/Ns7yalAJ0eZjWSbZdSCVY5yXZDCcxPiPw7MFu
 HSCdfVEyIVKkEhsGxgF6W/xVNRmz75agZ+NwQnQehcDeqiK/t4N74G45LW5w35VkLACL Bg== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34218s08tm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Oct 2020 06:52:17 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 098AmKA7021216;
 Thu, 8 Oct 2020 10:52:14 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03fra.de.ibm.com with ESMTP id 33xgx7tr0p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Oct 2020 10:52:14 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 098AqCmf28574092
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 8 Oct 2020 10:52:12 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1B0104C04E;
 Thu,  8 Oct 2020 10:52:12 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9BC264C044;
 Thu,  8 Oct 2020 10:52:10 +0000 (GMT)
Received: from localhost.localdomain.localdomain (unknown [9.79.255.65])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  8 Oct 2020 10:52:10 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH 0/4] powerpc/perf: Power PMU fixes for power10 DD1
Date: Thu,  8 Oct 2020 06:52:05 -0400
Message-Id: <1602154329-2092-1-git-send-email-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-08_04:2020-10-08,
 2020-10-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 phishscore=0 spamscore=0
 mlxlogscore=751 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 suspectscore=1 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2010080075
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
Cc: mikey@neuling.org, maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The patch series addresses PMU fixes for power10 DD1

Patch1 introduces a new power pmu flag to include
conditional code changes for power10 DD1.
Patch2 and Patch3 includes fixes in core-book3s to address
issues with marked events during sampling.
Patch4 includes fix to drop kernel samples while
userspace profiling.

Athira Rajeev (4):
  powerpc/perf: Add new power pmu flag "PPMU_P10_DD1" for power10 DD1
  powerpc/perf: Using SIER[CMPL] instead of SIER[SIAR_VALID]
  powerpc/perf: Use the address from SIAR register to set cpumode flags
  powerpc/perf: Exclude kernel samples while counting events in user
    space.

 arch/powerpc/include/asm/perf_event_server.h |  1 +
 arch/powerpc/perf/core-book3s.c              | 35 +++++++++++++++++++++++++++-
 arch/powerpc/perf/power10-pmu.c              |  6 +++++
 3 files changed, 41 insertions(+), 1 deletion(-)

-- 
1.8.3.1

