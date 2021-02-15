Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FBC731B571
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Feb 2021 07:44:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DfF2r1SPcz30QM
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Feb 2021 17:44:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qX81qz6B;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bharata@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=qX81qz6B; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DfF1t5gLrz30Hx
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Feb 2021 17:44:01 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 11F6XRMY139007; Mon, 15 Feb 2021 01:35:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=Zh4tiM0Evde4MAzUmu3bK4AGDwCVMa7MOld1H/rhWhA=;
 b=qX81qz6B8hrB/rF74rB4DXn9LPrZ1fA6zwB5Hy0E+BYIiS9MPodz4Olmy6g0g7peAbiC
 81hJVxcHfgM9h6pO2UAgukmZGSDTPp6yQtThot1Vg9BmpNNuz2iQia4zW1Y2J8YY5D6W
 +rzLH+juiQC/cCLjxHBH2L3zEHu/rOMedY57/NnViUh9lk6LWOO8m3kzDzdtQyLCbvdD
 9b7nLUFGLSPbJfUoCJwBF5w0BUUsEBN9ETlb5cy2SqdbyOupprl9/YhJTIYd/XOaJ5F5
 4zZLLtewwOL+46eUwL9e2d5+IMBB/SoUh/UBfU8DRcFdszrVjUEp+/i+3i+IvE5yUV5s yA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36qk3g1145-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Feb 2021 01:35:54 -0500
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 11F6Xg0H140452;
 Mon, 15 Feb 2021 01:35:53 -0500
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36qk3g1123-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Feb 2021 01:35:53 -0500
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 11F6ShdY006357;
 Mon, 15 Feb 2021 06:35:50 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma05fra.de.ibm.com with ESMTP id 36p6d8gsh1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Feb 2021 06:35:50 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 11F6ZlrJ26477006
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 Feb 2021 06:35:47 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B0EC042056;
 Mon, 15 Feb 2021 06:35:47 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0AC2442049;
 Mon, 15 Feb 2021 06:35:46 +0000 (GMT)
Received: from bharata.ibmuc.com (unknown [9.85.74.227])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 15 Feb 2021 06:35:45 +0000 (GMT)
From: Bharata B Rao <bharata@linux.ibm.com>
To: kvm-ppc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 0/3] Support for H_RPT_INVALIDATE in PowerPC KVM
Date: Mon, 15 Feb 2021 12:05:39 +0530
Message-Id: <20210215063542.3642366-1-bharata@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-15_02:2021-02-12,
 2021-02-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 bulkscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 spamscore=0 mlxlogscore=793
 adultscore=0 lowpriorityscore=0 mlxscore=0 malwarescore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102150056
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
Cc: farosas@linux.ibm.com, aneesh.kumar@linux.ibm.com, npiggin@gmail.com,
 Bharata B Rao <bharata@linux.ibm.com>, david@gibson.dropbear.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This patchset adds support for the new hcall H_RPT_INVALIDATE
and replaces the nested tlb flush calls with this new hcall
if support for the same exists.

Changes in v4:
-------------
- While reusing the tlb flush routines from radix_tlb.c in v3,
  setting of LPID got missed out. Take care of this by
  introducing new flush routines that set both PID and LPID
  when using tlbie instruction. This is required for
  process-scoped invalidations from guests (both L1 and
  nested guests). Added a new patch 1/3 for this.
- Added code to handle H_RPT_INVALIDATE hcall issued
  by nested guest in L0 nested guest exit path.

v3: https://lore.kernel.org/linuxppc-dev/20210105090557.2150104-1-bharata@linux.ibm.com/T/#t

Bharata B Rao (3):
  powerpc/book3s64/radix/tlb: tlbie primitives for process-scoped
    invalidations from guests
  KVM: PPC: Book3S HV: Add support for H_RPT_INVALIDATE
  KVM: PPC: Book3S HV: Use H_RPT_INVALIDATE in nested KVM

 Documentation/virt/kvm/api.rst                |  17 ++
 .../include/asm/book3s/64/tlbflush-radix.h    |  18 +++
 arch/powerpc/include/asm/kvm_book3s.h         |   3 +
 arch/powerpc/include/asm/mmu_context.h        |  11 ++
 arch/powerpc/kvm/book3s_64_mmu_radix.c        |  27 +++-
 arch/powerpc/kvm/book3s_hv.c                  |  91 +++++++++++
 arch/powerpc/kvm/book3s_hv_nested.c           | 108 ++++++++++++-
 arch/powerpc/kvm/powerpc.c                    |   3 +
 arch/powerpc/mm/book3s64/radix_tlb.c          | 147 +++++++++++++++++-
 include/uapi/linux/kvm.h                      |   1 +
 10 files changed, 415 insertions(+), 11 deletions(-)

-- 
2.26.2

