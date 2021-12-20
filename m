Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E2D47B3CB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Dec 2021 20:35:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JHqYv4s9Kz3c57
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Dec 2021 06:35:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WCtbU3dr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=WCtbU3dr; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JHqY71z3Rz2xCt
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Dec 2021 06:34:50 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BKICwIK023233; 
 Mon, 20 Dec 2021 19:34:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=7J1h3uuRtviJehrthEtGmvywVjIu2Gv0ODVB6EOi6Gw=;
 b=WCtbU3drE4HPA29H9SZbysxL1TkYCk/fvQSQ5QPw5GsUEoDwWlnRIfB8XgHzGkWedFfp
 9OdKRq3ENX+64QP8bPK50+rPRXC2ONbNyzqUZV/Kg5dfI20MDsx0x0lN3rCSSC3Xqm3Q
 IqQk71ub4Cv+HnOf5ZtFG/3aG1pDUotLKcEiFdH+LsrDi3lJj0d2om6zmWici7dEa+mH
 IpA+09DBFdTrLZtoodbmzHaUyOAMtsiQJYyKG8HZC1VqJGxO81PIJVGIa7cJfhg5e7oX
 76ZwjCTzwV7I9nbeeloE41KtXdhBquRXRKT0UKgttLy3tgQEyljFoxnL5+zXR2+kjioL Sw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3d1s2jc1dt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Dec 2021 19:34:41 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1BKJQWtk010979;
 Mon, 20 Dec 2021 19:34:41 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3d1s2jc1d1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Dec 2021 19:34:41 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BKJX2dN003152;
 Mon, 20 Dec 2021 19:34:39 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma01fra.de.ibm.com with ESMTP id 3d1799esyq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Dec 2021 19:34:39 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1BKJYZqx25493982
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 20 Dec 2021 19:34:35 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 49AE64C04E;
 Mon, 20 Dec 2021 19:34:35 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 445324C040;
 Mon, 20 Dec 2021 19:34:30 +0000 (GMT)
Received: from hbathini-workstation.ibm.com.com (unknown [9.211.62.204])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 20 Dec 2021 19:34:29 +0000 (GMT)
From: Hari Bathini <hbathini@linux.ibm.com>
To: akpm@linux-foundation.org, linux-mm@kvack.org, mpe@ellerman.id.au,
 linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 0/2] powerpc/fadump: handle CMA activation failure
 appropriately
Date: Tue, 21 Dec 2021 01:04:17 +0530
Message-Id: <20211220193419.104242-1-hbathini@linux.ibm.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: KC1W9IWiOr4AeXLJFpJYsWMn9DM70IwF
X-Proofpoint-ORIG-GUID: rIv-G4JtoTHNr-7qRLLI28m7bCZi61oZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-20_09,2021-12-20_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0
 suspectscore=0 mlxlogscore=999 adultscore=0 malwarescore=0 spamscore=0
 impostorscore=0 phishscore=0 priorityscore=1501 clxscore=1011
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112200109
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
Cc: david@redhat.com, mahesh@linux.ibm.com, sourabhjain@linux.ibm.com,
 osalvador@suse.de, Hari Bathini <hbathini@linux.ibm.com>,
 mike.kravetz@oracle.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

While commit a4e92ce8e4c8 ("powerpc/fadump: Reservationless firmware
assisted dump"), introduced Linux kernel's Contiguous Memory Allocator
(CMA) based reservation for fadump, it came with the assumption that
the memory remains reserved even if CMA activation fails. This
assumption ensures no kernel page resides in the reserved memory
region, which can't be mapped into the /proc/vmcore.

But commit 072355c1cf2d ("mm/cma: expose all pages to the buddy if
activation of an area fails") started returning all pages to buddy
allocator if CMA activation fails. This led to warning messages like
below while running crash-utility on vmcore of a kernel having above
two commits:

  crash: seek error: kernel virtual address: <from reserved region>

as reserved memory region ended up having kernel pages crash-utility
was looking for. Fix this by introducing an option in CMA, to opt out
from exposing pages to buddy allocator, on CMA activation failure.

Hari Bathini (2):
  mm/cma: provide option to opt out from exposing pages on activation
    failure
  powerpc/fadump: opt out from freeing pages on cma activation failure

 arch/powerpc/kernel/fadump.c |  6 ++++++
 include/linux/cma.h          |  2 ++
 mm/cma.c                     | 15 +++++++++++++--
 mm/cma.h                     |  1 +
 4 files changed, 22 insertions(+), 2 deletions(-)

-- 
2.33.1

