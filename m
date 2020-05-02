Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6021C249E
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 May 2020 13:16:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Dml611SPzDr5T
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 May 2020 21:16:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Dmj25fZ0zDr0d
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 May 2020 21:14:14 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 042B2pGO046109; Sat, 2 May 2020 07:14:07 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0b-001b2d01.pphosted.com with ESMTP id 30s3155nvj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 02 May 2020 07:14:07 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 042BApYn003288;
 Sat, 2 May 2020 11:14:06 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma04wdc.us.ibm.com with ESMTP id 30s0g62b2j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 02 May 2020 11:14:06 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 042BE6tu52756786
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 2 May 2020 11:14:06 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 19C4D2805E;
 Sat,  2 May 2020 11:14:06 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CB03328058;
 Sat,  2 May 2020 11:13:57 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.199.52.206])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Sat,  2 May 2020 11:13:57 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v2 00/12] powerpc/book3s/64/pkeys: Simplify the code
Date: Sat,  2 May 2020 16:43:35 +0530
Message-Id: <20200502111347.541836-1-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-05-02_06:2020-05-01,
 2020-05-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 mlxscore=0
 spamscore=0 malwarescore=0 mlxlogscore=999 adultscore=0 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2005020095
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linuxram@us.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This patch series update the pkey subsystem with more documentation and
rename variables so that it is easy to follow the code. The last patch
does fix a problem where we are treating keys above max_pkey as available.
But userspace is not impacted because using that key in mprotect_pkey returns
error due to limit check there. Also the uamor, value set by the platform is such
that it will deny modification of keys above max pkey.

Changes from V1:
* Rebase to the latest kernel.
* Added two new patches 6 and 12.


Aneesh Kumar K.V (12):
  powerpc/book3s64/pkeys: Fixup bit numbering
  powerpc/book3s64/pkeys: pkeys are supported only on hash on book3s.
  powerpc/book3s64/pkeys: Move pkey related bits in the linux page table
  powerpc/book3s64/pkeys: Explain key 1 reservation details
  powerpc/book3s64/pkeys: Simplify the key initialization
  powerpc/book3s64/pkeys: Prevent key 1 modification from userspace.
  powerpc/book3s64/pkeys: kill cpu feature key CPU_FTR_PKEY
  powerpc/book3s64/pkeys: Convert execute key support to static key
  powerpc/book3s64/pkeys: Simplify pkey disable branch
  powerpc/book3s64/pkeys: Convert pkey_total to max_pkey
  powerpc/book3s64/pkeys: Make initial_allocation_mask static
  powerpc/book3s64/pkeys: Mark all the pkeys above max pkey as reserved

 arch/powerpc/include/asm/book3s/64/hash-4k.h  |  21 +-
 arch/powerpc/include/asm/book3s/64/hash-64k.h |  12 +-
 .../powerpc/include/asm/book3s/64/hash-pkey.h |  32 +++
 arch/powerpc/include/asm/book3s/64/mmu-hash.h |   8 +-
 arch/powerpc/include/asm/book3s/64/pgtable.h  |  17 +-
 arch/powerpc/include/asm/book3s/64/pkeys.h    |  25 +++
 arch/powerpc/include/asm/cputable.h           |  10 +-
 arch/powerpc/include/asm/pkeys.h              |  43 +---
 arch/powerpc/kernel/dt_cpu_ftrs.c             |   6 -
 arch/powerpc/mm/book3s64/pkeys.c              | 210 ++++++++++--------
 10 files changed, 222 insertions(+), 162 deletions(-)
 create mode 100644 arch/powerpc/include/asm/book3s/64/hash-pkey.h
 create mode 100644 arch/powerpc/include/asm/book3s/64/pkeys.h

-- 
2.26.2

