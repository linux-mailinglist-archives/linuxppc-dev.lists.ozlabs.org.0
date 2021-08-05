Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 917E13E1DFF
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Aug 2021 23:27:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GghWl3tW8z3dCg
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Aug 2021 07:26:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=guR2XXtp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=farosas@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=guR2XXtp; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GghWJ18HGz2ypn
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Aug 2021 07:26:35 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 175L4APx099624; Thu, 5 Aug 2021 17:26:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=kGM3nA6GpWOtJed39Oh4wJ5svgcyafzlpWQNDVPgWRE=;
 b=guR2XXtpZ8aNylBSpD593snF+qf0EwSl31cP/iTeFx8q+RF2LE29CGCekf1RQboMifGB
 UuNk7FjRVMaXqOnj+X4cUXwRZ5BUhVjQpcDy3xHjGllkPjZ9cgEaB/oA+L+j1ZOrQl4x
 nWeGDQQIrj4sNScyCmgLAM2rfQZKBA2CwQBwIAaU5WSths8mCrD/CgL3tInMIET/C/Q8
 jyCT//Kdwf1J4Exju5DaNAcxXMvX+EJgbu1TD6stfcwvdxQCmAysPYczIXqR8jeqmh2s
 UPgN2hCNLZ4C/qYT732rq1c8g9KlpZEgKcZelCZ/jJ4pdFGnqRCs8bxqg0bHbW6fgb+E cw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3a89pr7kdj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Aug 2021 17:26:24 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 175LOsAU040174;
 Thu, 5 Aug 2021 17:26:24 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3a89pr7kd7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Aug 2021 17:26:24 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 175LMZBL029491;
 Thu, 5 Aug 2021 21:26:23 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma04wdc.us.ibm.com with ESMTP id 3a7yak94nr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Aug 2021 21:26:23 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 175LQNKX7865064
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 5 Aug 2021 21:26:23 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D848F112070;
 Thu,  5 Aug 2021 21:26:22 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A0B68112066;
 Thu,  5 Aug 2021 21:26:20 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.163.18.4])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu,  5 Aug 2021 21:26:20 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v2 0/3] KVM: PPC: Book3S HV: kvmhv_copy_tofrom_guest_radix
 changes
Date: Thu,  5 Aug 2021 18:26:13 -0300
Message-Id: <20210805212616.2641017-1-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.29.2
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 6sA_WgeY9c4MkynWawUrVx2GK1t59GyU
X-Proofpoint-ORIG-GUID: qpV8HuWXAxtBTe0x0xTSvuRcCP_86-GF
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-05_10:2021-08-05,
 2021-08-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0
 adultscore=0 mlxlogscore=378 impostorscore=0 lowpriorityscore=0
 clxscore=1015 mlxscore=0 spamscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108050124
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
Cc: linuxppc-dev@lists.ozlabs.org, christophe.leroy@c-s.fr, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This series contains the fix for __kvmhv_copy_tofrom_guest_radix plus
a couple of changes.

- Patch 1: The fix itself. I thought a smaller fix upfront would be
           better to facilitate any backports.

- Patch 2: Adds a sanity check to the low level function. Since the
           hcall API already enforces that the effective address must
           be on quadrant 0, moving the checks from the high level
           function would only add overhead to the hcall path, so I
           opted for a lightweight check at the low level.

- Patch 3: Cleans up the EXPORT_SYMBOL_GPL tags. I don't see how they
           would be needed since the functions are contained within
           kvm-hv.ko.

v1:

https://lkml.kernel.org/r/20210802234941.2568493-1-farosas@linux.ibm.com

Fabiano Rosas (3):
  KVM: PPC: Book3S HV: Fix copy_tofrom_guest routines
  KVM: PPC: Book3S HV: Add sanity check to copy_tofrom_guest
  KVM: PPC: Book3S HV: Stop exporting symbols from book3s_64_mmu_radix

 arch/powerpc/kvm/book3s_64_mmu_radix.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

-- 
2.29.2

