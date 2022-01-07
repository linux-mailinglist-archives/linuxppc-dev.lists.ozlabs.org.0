Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1E5487DED
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jan 2022 22:01:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JVwcQ508vz3bc6
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Jan 2022 08:01:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NJ0+8ek7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=farosas@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=NJ0+8ek7; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JVwbg0Fq5z2xBf
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Jan 2022 08:00:30 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 207JcbUh023263; 
 Fri, 7 Jan 2022 21:00:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=5DDf+9NbOOh3OuvbLKpRMf3oajy8sA/SKJB/KOBiorM=;
 b=NJ0+8ek7h4kIaqJCgzsdL94+x6mVFRz14dl6ItiaUym7SeeGXmjjaB3fi+cX85zCsQ25
 lRTdQQmCCwqk7cAm8M88PXgr4/xUuwXlqRTWj4zt7g1r0UfZwshNLJfne9vi5WEIrZNZ
 U2Psfe8xM14gUOMsFoPNNtvdThAG+VGvOk16CAiX3srgVIj51AUm2wI0U9YvycnTptvk
 F0Dc3VOyhoXAp3xanMyCjs1kqEx1VuAVT6b+Z/sdtCBXY+b+n1VDlTrcQUz9MWSqS0Rb
 WCet1SSWIVbi16MxYEczLT8LsPCyoIRdVvtloFVVTQJ60xSc5QH2bLPQQoTUK5DmrDrB 6w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3de4x3hh9y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Jan 2022 21:00:22 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 207L08og012970;
 Fri, 7 Jan 2022 21:00:22 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3de4x3hh9p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Jan 2022 21:00:22 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 207KqnU2002389;
 Fri, 7 Jan 2022 21:00:21 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma04dal.us.ibm.com with ESMTP id 3de53mn26r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Jan 2022 21:00:21 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 207L0KXS33030506
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 7 Jan 2022 21:00:20 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 502A47805C;
 Fri,  7 Jan 2022 21:00:20 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B79A878066;
 Fri,  7 Jan 2022 21:00:18 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.59.174])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri,  7 Jan 2022 21:00:18 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v3 0/6] KVM: PPC: MMIO fixes
Date: Fri,  7 Jan 2022 18:00:06 -0300
Message-Id: <20220107210012.4091153-1-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.33.1
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: FeSccrUYiFJ-Jne1hsyzBqOiMhpLjyc1
X-Proofpoint-GUID: 06sSYKglTkJ8QJuJszKdOKhBBMPTN7hV
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-07_08,2022-01-07_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 mlxlogscore=830 suspectscore=0
 malwarescore=0 phishscore=0 mlxscore=0 clxscore=1015 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201070123
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
Cc: linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, aik@ozlabs.ru
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This v3 addresses review comments:

Merge patches 3 and 7, now patch 6, which returns EMULATE_FAIL and now
also alters the error message.

Remove the now unnecessary 'advance' variable from emulate_loadstore
in patch 4.

v2:
https://lore.kernel.org/r/20220106200304.4070825-1-farosas@linux.ibm.com

v1:
https://lore.kernel.org/r/20211223211528.3560711-1-farosas@linux.ibm.com

Fabiano Rosas (6):
  KVM: PPC: Book3S HV: Stop returning internal values to userspace
  KVM: PPC: Fix vmx/vsx mixup in mmio emulation
  KVM: PPC: Don't use pr_emerg when mmio emulation fails
  KVM: PPC: mmio: Queue interrupt at kvmppc_emulate_mmio
  KVM: PPC: mmio: Return to guest after emulation failure
  KVM: PPC: mmio: Reject instructions that access more than mmio.data
    size

 arch/powerpc/kvm/emulate_loadstore.c |  8 +-------
 arch/powerpc/kvm/powerpc.c           | 24 +++++++++++++++++-------
 2 files changed, 18 insertions(+), 14 deletions(-)

-- 
2.33.1

