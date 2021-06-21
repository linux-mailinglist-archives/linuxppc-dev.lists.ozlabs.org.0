Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F8D83AE54C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Jun 2021 10:52:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G7jvc5kG7z3cC3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Jun 2021 18:52:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tT1nz/yx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=bharata@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=tT1nz/yx; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G7jsb4Sgrz2ykQ
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Jun 2021 18:50:26 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15L8XV93183046; Mon, 21 Jun 2021 04:50:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=pp1; bh=veGlPVlCtZqhaBqdj3dROkMnCIGJlqvmFjU72GF2qC8=;
 b=tT1nz/yxhDaOtHUiOBkZATORtWplnNf2xZULDUiyZk/CdfFtoIsf6QRn+Ty2bYuhUXXV
 OAC6H8nLHiRSFDFfUb4cw0EoiAKqOG96ERV87WKhhbjXQ+wlTIHeuQQ0keWbmJi/SfN7
 76rdDXhwni8Cv/x94Lf+vpURJghojq3SFct+iB0V5wlEPdIXhxC30Roi96l5Ts4r4GIn
 4o6HVjV6QIJQEiynktlHzm5oNia/IsaW+jxFVEg/yhK5aDVJcuTsgDYuKnjcRdAr59Mt
 oex4Hpd0igS6ewCN73F9md1JlYdzS2WRUxZrSpr8ifhDp0vRvYEY1LWrQEBPVuOSi0pQ pw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39aq868mxx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Jun 2021 04:50:14 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15L8XUbU183021;
 Mon, 21 Jun 2021 04:50:14 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39aq868mx7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Jun 2021 04:50:14 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15L8lO7k012519;
 Mon, 21 Jun 2021 08:50:12 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma02fra.de.ibm.com with ESMTP id 3998788e0r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Jun 2021 08:50:12 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15L8o94O23855500
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 21 Jun 2021 08:50:09 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 75066A4057;
 Mon, 21 Jun 2021 08:50:09 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B9EFFA4053;
 Mon, 21 Jun 2021 08:50:07 +0000 (GMT)
Received: from bharata.ibmuc.com (unknown [9.85.82.83])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 21 Jun 2021 08:50:07 +0000 (GMT)
From: Bharata B Rao <bharata@linux.ibm.com>
To: kvm-ppc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v8 0/6] Support for H_RPT_INVALIDATE in PowerPC KVM
Date: Mon, 21 Jun 2021 14:19:57 +0530
Message-Id: <20210621085003.904767-1-bharata@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: igsdm_EUCAfZPxzeuaZDGTKqsBIjenEa
X-Proofpoint-ORIG-GUID: wHle3_GDcoOzE6DC-VafdhIfajFb7pOG
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-21_02:2021-06-20,
 2021-06-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0
 mlxlogscore=912 clxscore=1011 impostorscore=0 lowpriorityscore=0
 bulkscore=0 malwarescore=0 priorityscore=1501 mlxscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106210049
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

Changes in v8:
-------------
- Used tlb_single_page_flush_ceiling in the process-scoped range
  flush routine to switch to full PID invalation if
  the number of pages is above the threshold
- Moved iterating over page sizes into the actual routine that
  handles the eventual flushing thereby limiting the page size
  iteration only to range based flushing
- Converted #if 0 section into a comment section to avoid
  checkpatch from complaining.
- Used a threshold in the partition-scoped range flushing
  to switch to full LPID invalidation

v7: https://lore.kernel.org/linuxppc-dev/20210505154642.178702-1-bharata@linux.ibm.com/

Aneesh Kumar K.V (1):
  KVM: PPC: Book3S HV: Fix comments of H_RPT_INVALIDATE arguments

Bharata B Rao (5):
  powerpc/book3s64/radix: Add H_RPT_INVALIDATE pgsize encodings to
    mmu_psize_def
  KVM: PPC: Book3S HV: Add support for H_RPT_INVALIDATE
  KVM: PPC: Book3S HV: Nested support in H_RPT_INVALIDATE
  KVM: PPC: Book3S HV: Add KVM_CAP_PPC_RPT_INVALIDATE capability
  KVM: PPC: Book3S HV: Use H_RPT_INVALIDATE in nested KVM

 Documentation/virt/kvm/api.rst                |  18 ++
 arch/powerpc/include/asm/book3s/64/mmu.h      |   1 +
 .../include/asm/book3s/64/tlbflush-radix.h    |   4 +
 arch/powerpc/include/asm/hvcall.h             |   4 +-
 arch/powerpc/include/asm/kvm_book3s.h         |   3 +
 arch/powerpc/include/asm/mmu_context.h        |   9 +
 arch/powerpc/kvm/book3s_64_mmu_radix.c        |  27 ++-
 arch/powerpc/kvm/book3s_hv.c                  |  89 +++++++++
 arch/powerpc/kvm/book3s_hv_nested.c           | 129 ++++++++++++-
 arch/powerpc/kvm/powerpc.c                    |   3 +
 arch/powerpc/mm/book3s64/radix_pgtable.c      |   5 +
 arch/powerpc/mm/book3s64/radix_tlb.c          | 176 +++++++++++++++++-
 include/uapi/linux/kvm.h                      |   1 +
 13 files changed, 456 insertions(+), 13 deletions(-)

-- 
2.31.1

