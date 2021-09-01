Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C83703FE132
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Sep 2021 19:34:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H0B5R53hlz2yHD
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Sep 2021 03:34:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PEZkqU4l;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=farosas@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=PEZkqU4l; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H0B4j5rh1z2xYv
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Sep 2021 03:34:13 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 181HXcdV105955; Wed, 1 Sep 2021 13:34:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=CKNJFRwzN2ZBjkZlU88ostb4VI9CQSiBae6qBuRCY8Y=;
 b=PEZkqU4ljD0toBsfAzweTXDwVvsovy5ZXfQdLp60LNS+91vgD4Hi4+chkfr6ONAvYGfp
 3z2pLkwSLgMReTFQczr3GQl9cDo5p46M5pR0yGiPaMD27nV4cHAJGd85nousm8SMv2YU
 WFO9r7ZZuxr8u8mmDTEkUgkKn6BGGJAA31fif2YtOYPHuL2AXZDMp5P78rNQD9tufweL
 g84/kKl0cuHK/16L5T6Iqc0jCIjDin7SotER0LQxy5KXVl2ro+QratBPX3LALKDW/wXX
 p5Yz1jOipcPgDccZF9lX0uFmn7DDo5i6Rd8WtdiiM99NmKI+Dljc8q9eXzrHElvvPjIo DA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ate1br0j1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Sep 2021 13:34:05 -0400
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 181HXcwm105959;
 Wed, 1 Sep 2021 13:34:04 -0400
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ate1br0hd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Sep 2021 13:34:04 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 181HWujq027895;
 Wed, 1 Sep 2021 17:34:04 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma05wdc.us.ibm.com with ESMTP id 3atdxd03t7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Sep 2021 17:34:03 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 181HY2wH16712148
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 1 Sep 2021 17:34:03 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D1C3378074;
 Wed,  1 Sep 2021 17:34:02 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 565F67805F;
 Wed,  1 Sep 2021 17:34:01 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.58.54])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed,  1 Sep 2021 17:34:01 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH 0/5] KVM: PPC: Book3S: Modules cleanup and unification
Date: Wed,  1 Sep 2021 14:33:52 -0300
Message-Id: <20210901173357.3183658-1-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: cPBbFxdKJ9HjNQfaLWRmECOZ-2qi-Ndr
X-Proofpoint-ORIG-GUID: drMB0p7m-JNVvQfCO8ac41lXJvchRbRO
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-09-01_05:2021-09-01,
 2021-09-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 mlxscore=0 adultscore=0 bulkscore=0
 spamscore=0 mlxlogscore=714 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2108310000 definitions=main-2109010100
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
Cc: linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
 david@gibson.dropbear.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This series merges our three kvm modules kvm.ko, kvm-hv.ko and
kvm-pr.ko into one kvm.ko module.

The main reason for this is to deal with the issue that kvm.ko can be
loaded on its own without any of the other modules present. This can
happen if one or both of the modules fail to init or if the user loads
kvm.ko only.

With only kvm.ko loaded, the userspace can call any of the KVM ioctls
which will fail more or less gracefully depending on what kind of
verification we do in powerpc.c.

Instead of adding a check to every entry point or finding a hack to
link the modules so that when one fails (hv/pr), the other (kvm)
exits, I think it is cleaner to just make them all a single module.

The two KVM implementations are already selected by Kconfig options,
so the only thing that changes is that they are now in the same
module. I also kept kvm-hv and kvm-pr as aliases to kvm, so that
people don't get too surprised with the change.

There is a possible issue with the larger module size for kernel
builds that should support both HV-only and PR-only environments, but
PR is usually not used in production so I'm not sure if that is a real
issue.

Patches 1,2,3 are standalone cleanups.
Patches 4,5 are the unification work.

Fabiano Rosas (5):
  KVM: PPC: Book3S HV: Check return value of kvmppc_radix_init
  KVM: PPC: Book3S HV: Delay setting of kvm ops
  KVM: PPC: Book3S HV: Free allocated memory if module init fails
  KVM: PPC: Book3S: Unify kvm-hv and kvm-pr modules
  KVM: PPC: Book3S: Stop exporting non-builtin symbols

 arch/powerpc/configs/powernv_defconfig |  2 +-
 arch/powerpc/configs/ppc64_defconfig   |  2 +-
 arch/powerpc/configs/pseries_defconfig |  2 +-
 arch/powerpc/kvm/Kconfig               | 72 ++++++++++++--------------
 arch/powerpc/kvm/Makefile              | 11 ++--
 arch/powerpc/kvm/book3s.c              | 61 ++++++++++++++--------
 arch/powerpc/kvm/book3s.h              | 19 +++++++
 arch/powerpc/kvm/book3s_64_mmu_radix.c |  3 --
 arch/powerpc/kvm/book3s_64_vio.c       |  3 --
 arch/powerpc/kvm/book3s_hv.c           | 38 ++++++++------
 arch/powerpc/kvm/book3s_pr.c           | 13 -----
 arch/powerpc/kvm/book3s_rtas.c         |  1 -
 arch/powerpc/kvm/book3s_xics.c         |  4 --
 arch/powerpc/kvm/book3s_xive.c         |  6 ---
 arch/powerpc/kvm/emulate.c             |  1 -
 arch/powerpc/kvm/powerpc.c             | 14 -----
 kernel/irq/irqdesc.c                   |  2 +-
 17 files changed, 125 insertions(+), 129 deletions(-)

-- 
2.29.2

