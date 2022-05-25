Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CDDF533D42
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 May 2022 15:08:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L7Wbd6M3Lz3bs5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 May 2022 23:08:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IrnXkxbz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=farosas@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=IrnXkxbz; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L7Wb01C7kz2xfP
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 May 2022 23:08:11 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24PBwaAN005218;
 Wed, 25 May 2022 13:08:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=ae0KWr/nEX5BxzbziSDeEoIK7/ruZeeCVMSPMmZqKdo=;
 b=IrnXkxbzEcSdru1yBzilJLDwTccnfTMZlACCXeDlTMyBPOOW7JUgY4xe0PEmYMSyk7eg
 3up3vMLwW1WOkdJk0/KLb4fEtLXT2W6cSHu7Uk6ZvDWDQnGd6XY+UWjbc/3icLlOLXAF
 1+9iMSi+or01YLKkJP/MRTASiczHZlu8ac3PE1K+2xdrh/trAa8xl5GP4QTwSalckOqN
 9yTY0j97ToPJbLVPWPbI7U4IwByeQQJrzlGS3bxT1shBLx5Mr+yned85k8GxQeQBQ/m8
 jKW6eCTsQESRJ32phQXFyhOQX14SQqNbuOFJN0CQ68QN6DTsEzp9mnCC48xtGSFxMbSt CQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g9m1w9dd8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 May 2022 13:08:06 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 24PD4UJW012565;
 Wed, 25 May 2022 13:08:05 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g9m1w9dcx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 May 2022 13:08:05 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24PD29cn028638;
 Wed, 25 May 2022 13:08:05 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma04dal.us.ibm.com with ESMTP id 3g93utyktd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 May 2022 13:08:05 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 24PD846I54198684
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 25 May 2022 13:08:04 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 12153112065;
 Wed, 25 May 2022 13:08:04 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BE3FC112061;
 Wed, 25 May 2022 13:08:02 +0000 (GMT)
Received: from li-4707e44c-227d-11b2-a85c-f336a85283d9.ibm.com.com (unknown
 [9.160.108.97]) by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 25 May 2022 13:08:02 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 0/5] KVM: PPC: Book3S HV: Update debug timing code
Date: Wed, 25 May 2022 10:05:49 -0300
Message-Id: <20220525130554.2614394-1-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: qrPg7K3fdspNE7x980phdO-WCgAyQJ59
X-Proofpoint-ORIG-GUID: nMvFjICgGoUh8IVFaUFkpF_KPZujACxG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-25_03,2022-05-25_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=997 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015
 impostorscore=0 phishscore=0 bulkscore=0 mlxscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2205250067
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
Cc: npiggin@gmail.com, kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

We have some debug information at /sys/kernel/debug/kvm/<vm>/vcpu#/timings
which shows the time it takes to run various parts of the code.

That infrastructure was written in the P8 timeframe and wasn't updated
along with the guest entry point changes for P9.

Ideally we would be able to just add new/different accounting points
to the code as it changes over time but since the P8 and P9 entry
points are different code paths we first need to separate them from
each other. This series alters KVM Kconfig to make that distinction.

Currently:
CONFIG_KVM_BOOK3S_HV_EXIT_TIMING - timing infrastructure in asm (P8 only)
				   timing infrastructure in C (P9 only)
				   generic timing variables (P8/P9)
				   debugfs code
                                   timing points for P8

After this series:
CONFIG_KVM_BOOK3S_HV_EXIT_TIMING - generic timing variables (P8/P9)
				   debugfs code

CONFIG_KVM_BOOK3S_HV_P8_TIMING - timing infrastructure in asm (P8 only)
			         timing points for P8

CONFIG_KVM_BOOK3S_HV_P9_TIMING - timing infrastructure in C (P9 only)
			         timing points for P9

The new Kconfig rules are:

a) CONFIG_KVM_BOOK3S_HV_P8_TIMING selects CONFIG_KVM_BOOK3S_HV_EXIT_TIMING,
   resulting in the previous behavior. Tested on P8.

b) CONFIG_KVM_BOOK3S_HV_P9_TIMING selects CONFIG_KVM_BOOK3S_HV_EXIT_TIMING,
   resulting in the new behavior. Tested on P9.

c) CONFIG_KVM_BOOK3S_HV_P8_TIMING and CONFIG_KVM_BOOK3S_HV_P9_TIMING
   are mutually exclusive. If both are set, P9 takes precedence.

Fabiano Rosas (5):
  KVM: PPC: Book3S HV: Fix "rm_exit" entry in debugfs timings
  KVM: PPC: Book3S HV: Add a new config for P8 debug timing
  KVM: PPC: Book3S HV: Decouple the debug timing from the P8 entry path
  KVM: PPC: Book3S HV: Expose timing functions to module code
  KVM: PPC: Book3S HV: Provide more detailed timings for P9 entry path

 arch/powerpc/include/asm/kvm_host.h     | 10 +++++++
 arch/powerpc/kernel/asm-offsets.c       |  2 +-
 arch/powerpc/kvm/Kconfig                | 19 ++++++++++++-
 arch/powerpc/kvm/book3s_hv.c            | 26 ++++++++++++++++--
 arch/powerpc/kvm/book3s_hv.h            | 10 +++++++
 arch/powerpc/kvm/book3s_hv_p9_entry.c   | 36 +++++--------------------
 arch/powerpc/kvm/book3s_hv_rmhandlers.S | 24 ++++++++---------
 7 files changed, 82 insertions(+), 45 deletions(-)

-- 
2.35.1

