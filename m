Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A8710A6AC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Nov 2019 23:39:14 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47MzNH1M4nzDqld
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Nov 2019 09:39:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=leonardo@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47MzKd6cLmzDqkp
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Nov 2019 09:36:53 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAQMX26s057546; Tue, 26 Nov 2019 17:36:43 -0500
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2whcxpr31n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Nov 2019 17:36:42 -0500
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xAQMYrGQ013272;
 Tue, 26 Nov 2019 22:36:41 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma04wdc.us.ibm.com with ESMTP id 2wevd77a5d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Nov 2019 22:36:41 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xAQMafvx55116208
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Nov 2019 22:36:41 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 590C3AC05B;
 Tue, 26 Nov 2019 22:36:41 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3C769AC060;
 Tue, 26 Nov 2019 22:36:40 +0000 (GMT)
Received: from LeoBras.aus.stglabs.ibm.com (unknown [9.18.235.137])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 26 Nov 2019 22:36:40 +0000 (GMT)
From: Leonardo Bras <leonardo@linux.ibm.com>
To: Paul Mackerras <paulus@ozlabs.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v3 0/2] Replace current->mm by kvm->mm on powerpc/kvm
Date: Tue, 26 Nov 2019 19:36:29 -0300
Message-Id: <20191126223631.389779-1-leonardo@linux.ibm.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-26_07:2019-11-26,2019-11-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0
 suspectscore=2 spamscore=0 phishscore=0 mlxlogscore=606 bulkscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1911260191
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
Cc: Leonardo Bras <leonardo@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Replace current->mm by kvm->mm on powerpc/kvm

By replacing, we would reduce the use of 'global' current on code,
relying more in the contents of kvm struct.

On code, I found that in kvm_create_vm() there is:
kvm->mm = current->mm;

And that on every kvm_*_ioctl we have tests like that:
if (kvm->mm != current->mm)
        return -EIO;

So this change would be safe.

---
Changes since v2:
- Rebased on torvalds/master and updated the remaining patches.

Changes since v1:
- Fixes possible 'use after free' on kvm_spapr_tce_release (from v1)
- Fixes possible 'use after free' on kvm_vm_ioctl_create_spapr_tce
- Fixes undeclared variable error


Leonardo Bras (2):
  powerpc/kvm/book3s: Replace current->mm by kvm->mm
  powerpc/kvm/book3e: Replace current->mm by kvm->mm

 arch/powerpc/kvm/book3s_64_mmu_hv.c |  4 ++--
 arch/powerpc/kvm/book3s_64_vio.c    | 10 ++++++----
 arch/powerpc/kvm/book3s_hv.c        | 10 +++++-----
 arch/powerpc/kvm/booke.c            |  2 +-
 4 files changed, 14 insertions(+), 12 deletions(-)

-- 
2.23.0

