Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E8E3E0F21
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Aug 2021 09:25:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GgKsF1CWMz3cYW
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Aug 2021 17:25:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AejbVI4Q;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bharata@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=AejbVI4Q; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GgKrH0Z0Kz3bX3
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Aug 2021 17:25:01 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17573Fx8145808; Thu, 5 Aug 2021 03:24:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=xTOloxu+kX26mmcganPgGmVvIM+ZLnBpjMkSHkYV+To=;
 b=AejbVI4QolKMNDYPoJnC/UW9yt1nVrc1F4qdmeIclURG6oqOcvyCcn9PbWgu2QmQhFQx
 qjfo1o2HjHnDyQ9IS5K9fvSuZyw4Xy7u6z/X4fwAzY4kv1W3woQo8TglUqPnvgrULlkO
 vckR779OCCzbeDGtU8kTdlcyMC5tqwoCd3Qzh9srTFZRofM8ELZKNO/+0eccxgHqimZq
 ov3H/GUMVGffWSzzX4OHdlUDrhYXks5C0xk+yF8AK1rXvAjVsBCB/qxCefEyOj0v3uNp
 NNhFYtFTCRZ6JG5bBM9jhQBEpiyMxXsTtdxdDzD+2vgk+gDUefUBP234i52hnHX7AIik lg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3a87f65md6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Aug 2021 03:24:58 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 17573NoV146527;
 Thu, 5 Aug 2021 03:24:57 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3a87f65mcj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Aug 2021 03:24:57 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17577gwV030594;
 Thu, 5 Aug 2021 07:24:54 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma05fra.de.ibm.com with ESMTP id 3a4x58hnxk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Aug 2021 07:24:54 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1757OpfI50790844
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 5 Aug 2021 07:24:51 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7F0D0A4070;
 Thu,  5 Aug 2021 07:24:50 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7ABDCA405B;
 Thu,  5 Aug 2021 07:24:48 +0000 (GMT)
Received: from bharata.ibmuc.com (unknown [9.102.2.73])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  5 Aug 2021 07:24:48 +0000 (GMT)
From: Bharata B Rao <bharata@linux.ibm.com>
To: kvm-ppc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH v0 0/5] PPC: KVM: pseries: Asynchronous page fault
Date: Thu,  5 Aug 2021 12:54:34 +0530
Message-Id: <20210805072439.501481-1-bharata@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: rfyLg0DUXb31M9zppxGRRiZ3dvIe21_C
X-Proofpoint-GUID: 3bnfYHbwF8zasQ8ffrVI2dmJ-mCxSSWt
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-05_02:2021-08-04,
 2021-08-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 spamscore=0 priorityscore=1501 bulkscore=0 phishscore=0 mlxlogscore=900
 suspectscore=0 impostorscore=0 clxscore=1011 mlxscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108050041
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
Cc: aneesh.kumar@linux.ibm.com, Bharata B Rao <bharata@linux.ibm.com>,
 kvm@vger.kernel.org, bharata.rao@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

This series adds asynchronous page fault support for pseries guests
and enables the support for the same in powerpc KVM. This is an
early RFC with details and multiple TODOs listed in patch descriptions.

This patch needs supporting enablement in QEMU too which will be
posted separately.

Bharata B Rao (5):
  powerpc: Define Expropriation interrupt bit to VPA byte offset 0xB9
  KVM: PPC: Add support for KVM_REQ_ESN_EXIT
  KVM: PPC: Book3S: Enable setting SRR1 flags for DSI
  KVM: PPC: BOOK3S HV: Async PF support
  pseries: Asynchronous page fault support

 Documentation/virt/kvm/api.rst            |  15 ++
 arch/powerpc/include/asm/async-pf.h       |  12 ++
 arch/powerpc/include/asm/hvcall.h         |   1 +
 arch/powerpc/include/asm/kvm_book3s_esn.h |  24 +++
 arch/powerpc/include/asm/kvm_host.h       |  22 +++
 arch/powerpc/include/asm/kvm_ppc.h        |   4 +-
 arch/powerpc/include/asm/lppaca.h         |  20 +-
 arch/powerpc/include/uapi/asm/kvm.h       |   6 +
 arch/powerpc/kvm/Kconfig                  |   2 +
 arch/powerpc/kvm/Makefile                 |   5 +-
 arch/powerpc/kvm/book3s.c                 |   6 +-
 arch/powerpc/kvm/book3s_64_mmu_radix.c    |   9 +-
 arch/powerpc/kvm/book3s_hv.c              |  37 +++-
 arch/powerpc/kvm/book3s_hv_esn.c          | 189 +++++++++++++++++++
 arch/powerpc/kvm/book3s_hv_nested.c       |   4 +-
 arch/powerpc/kvm/book3s_pr.c              |   4 +-
 arch/powerpc/mm/fault.c                   |   7 +-
 arch/powerpc/platforms/pseries/Makefile   |   2 +-
 arch/powerpc/platforms/pseries/async-pf.c | 219 ++++++++++++++++++++++
 drivers/cpuidle/cpuidle-pseries.c         |   4 +-
 include/uapi/linux/kvm.h                  |   2 +
 tools/include/uapi/linux/kvm.h            |   1 +
 22 files changed, 574 insertions(+), 21 deletions(-)
 create mode 100644 arch/powerpc/include/asm/async-pf.h
 create mode 100644 arch/powerpc/include/asm/kvm_book3s_esn.h
 create mode 100644 arch/powerpc/kvm/book3s_hv_esn.c
 create mode 100644 arch/powerpc/platforms/pseries/async-pf.c

-- 
2.31.1

