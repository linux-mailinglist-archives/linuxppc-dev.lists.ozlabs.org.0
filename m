Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 965CA35D30A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Apr 2021 00:28:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FK3KJ3KRGz3brj
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Apr 2021 08:28:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jtqARDEJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=farosas@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=jtqARDEJ; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FK3JR154tz30Gp
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Apr 2021 08:27:18 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13CM3BAo110998; Mon, 12 Apr 2021 18:27:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=la24FiSgHRXv4Vel0hReRt4G1UKXNmiSWNh4ui/o+hY=;
 b=jtqARDEJfEnb9YGDbdHKd/AxSKjT+rJ2Jpk9JPH1Qtg14znRKjoemsg3m3sCE46eR5G0
 DRTVGw4V6ZcoPd/9jOGGWUKNYwB4jvHGd0d1xT3GFXo49KAO9bC/wAgDNLJ3J7ZC2c3A
 Kae0c1V7fm2Zr9pIjLMXfsYCVgKtaiiE2L9Prz/Riw749eQaAS1ldngewS8l4/C8F/5I
 /Qj7f/DxcsQekBxLwmItsDDqbXanp2CuR2Jnc7gROS7Z2wlVUx6Zk/v7sKtPmHHYuret
 pCoxUtbZHgCtN6fX9GWTSwDPm3WRW50lWcWrLdzGirVw7/QeZEPfgCDJoNLP6GHzStko aA== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37vuxqpc4t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Apr 2021 18:27:04 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13CMCBSS017215;
 Mon, 12 Apr 2021 22:27:03 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma02dal.us.ibm.com with ESMTP id 37u3n9gpq2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Apr 2021 22:27:03 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13CMR2vY22085992
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Apr 2021 22:27:02 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 647AABE054;
 Mon, 12 Apr 2021 22:27:02 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BB271BE051;
 Mon, 12 Apr 2021 22:27:00 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.82.34])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 12 Apr 2021 22:27:00 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: kvm-ppc@vger.kernel.org
Subject: [RFC PATCH 0/2] kvm selftests and MAX_VCPU_ID
Date: Mon, 12 Apr 2021 19:26:54 -0300
Message-Id: <20210412222656.3466987-1-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: GuoJSPSRBkheXNz70bwOoyPp8SKYN_fl
X-Proofpoint-ORIG-GUID: GuoJSPSRBkheXNz70bwOoyPp8SKYN_fl
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-12_11:2021-04-12,
 2021-04-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 clxscore=1015 mlxlogscore=926 impostorscore=0
 suspectscore=0 bulkscore=0 adultscore=0 mlxscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104060000 definitions=main-2104120142
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
Cc: linuxppc-dev@lists.ozlabs.org, groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

I've been experimenting with the kvm selftests to see if I can enable
them for powerpc and get some useful coverage going.

This series is just the initial boilerplate to get the simplest of the
tests to run. The test is arch agnostic and is already in the tree. It
just tries to start a vm with the maximum number of vcpus. It fails on
a P9:

$ cd tools/selftests/kvm
$ make ARCH=powerpc
$ ulimit -n
4096
$ ./kvm_create_max_vcpus
KVM_CAP_MAX_VCPU_ID: 16384
KVM_CAP_MAX_VCPUS: 2048
Testing creating 2048 vCPUs, with IDs 0...2047.
Testing creating 2048 vCPUs, with IDs 14336...16383.
==== Test Assertion Failure ====
  lib/kvm_util.c:983: vcpu->fd >= 0
  pid=74066 tid=74066 - Invalid argument
     1  0x0000000010002813: vm_vcpu_add at kvm_util.c:982
     2  0x000000001000176f: test_vcpu_creation at kvm_create_max_vcpus.c:34 (discriminator 3)
     3  0x00000000100014e7: main at kvm_create_max_vcpus.c:62
     4  0x00007fff89454077: ?? ??:0
     5  0x00007fff89454263: ?? ??:0
  KVM_CREATE_VCPU failed, rc: -1 errno: 22

The second patch is my attempt at improving the situation which,
admittedly, is mostly harmless, caused by the fact that
KVM_MAX_VCPU_IDS is set to a large value that is not always supported
by P9 so KVM HV aborts with -EINVAL.

I intended to get this first patch/test to work before implementing
the rest of the selftest infrastructure and adding more tests so I
thought it would be best to get some feedback before I delve in too
deep.

Fabiano Rosas (2):
  KVM: selftests: Add max vcpus test for ppc64le
  KVM: PPC: Book3S HV: Provide a more accurate MAX_VCPU_ID in P9

 arch/powerpc/kvm/powerpc.c                    |  5 ++-
 tools/testing/selftests/kvm/Makefile          |  7 +++
 .../testing/selftests/kvm/include/kvm_util.h  |  7 +++
 .../selftests/kvm/include/powerpc/processor.h |  7 +++
 tools/testing/selftests/kvm/lib/kvm_util.c    |  5 +++
 .../selftests/kvm/lib/powerpc/processor.c     | 44 +++++++++++++++++++
 6 files changed, 74 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/kvm/include/powerpc/processor.h
 create mode 100644 tools/testing/selftests/kvm/lib/powerpc/processor.c

--
2.29.2
