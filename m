Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2960D2DBEF5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Dec 2020 11:48:35 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CwsL84q41zDqSd
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Dec 2020 21:48:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ravi.bangoria@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=fWdZdtSr; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CwsDR21KNzDqLx
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Dec 2020 21:43:34 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0BGAVUGp074045; Wed, 16 Dec 2020 05:43:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=sTi5ENDvNYn/Nu6cWCNyjnsbtTWHyVrZRsMwWRoJwmY=;
 b=fWdZdtSr52y3gdyvh7hsCHrC5li8W4aI7388ehhNFlT4btNADdIxDgn9AigPkrJHYV/r
 3HS01300rQjpv3DlzEdTiCBOZ+ugLOsl5LQAKG3UCAUBNPVG3WuFTBKP4RrivtamUp68
 inPZgmNdOtaS8pVhiZBZNjWt5Cax78gR3sNlS7HsivDGbkwiyYPH1YB7Xs8V7/62AjPy
 IksFq4HHWB4k0a4aw1FpOGAJVo1TTpxnsh44cPSSrsNRH4jo79Hwq2J5k3ZwoiavqTpu
 ThmSUNkYMhN3LHvx5bQv8E9eHs0Omazti0j2VCKJ1zKVAY9IFieyU0XKizK1VINLEQPc lA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 35ff7k2p3u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Dec 2020 05:43:16 -0500
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0BGAVZHu074484;
 Wed, 16 Dec 2020 05:43:15 -0500
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0b-001b2d01.pphosted.com with ESMTP id 35ff7k2p36-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Dec 2020 05:43:15 -0500
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0BGAhE7P011329;
 Wed, 16 Dec 2020 10:43:14 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04fra.de.ibm.com with ESMTP id 35cng8a66n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Dec 2020 10:43:13 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0BGAhBKf29557034
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Dec 2020 10:43:11 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8DF7E11C052;
 Wed, 16 Dec 2020 10:43:11 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 62C7D11C05C;
 Wed, 16 Dec 2020 10:43:08 +0000 (GMT)
Received: from bangoria.ibmuc.com (unknown [9.199.41.249])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 16 Dec 2020 10:43:08 +0000 (GMT)
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
To: mpe@ellerman.id.au, paulus@samba.org
Subject: [PATCH v3 0/4] KVM: PPC: Power10 2nd DAWR enablement
Date: Wed, 16 Dec 2020 16:12:15 +0530
Message-Id: <20201216104219.458713-1-ravi.bangoria@linux.ibm.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-16_04:2020-12-15,
 2020-12-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 lowpriorityscore=0 mlxlogscore=966 adultscore=0 spamscore=0 mlxscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 bulkscore=0 impostorscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012160063
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
Cc: christophe.leroy@c-s.fr, ravi.bangoria@linux.ibm.com, mikey@neuling.org,
 kvm@vger.kernel.org, leobras.c@gmail.com, jniethe5@gmail.com,
 linux-kernel@vger.kernel.org, npiggin@gmail.com, kvm-ppc@vger.kernel.org,
 pbonzini@redhat.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Enable p10 2nd DAWR feature for Book3S kvm guest. DAWR is a hypervisor
resource and thus H_SET_MODE hcall is used to set/unset it. A new case
H_SET_MODE_RESOURCE_SET_DAWR1 is introduced in H_SET_MODE hcall for
setting/unsetting 2nd DAWR. Also, new capability KVM_CAP_PPC_DAWR1 has
been added to query 2nd DAWR support via kvm ioctl.

This feature also needs to be enabled in Qemu to really use it. I'll
post Qemu patches once kvm patches get accepted.

v2: https://lore.kernel.org/kvm/20201124105953.39325-1-ravi.bangoria@linux.ibm.com

v2->v3:
 - Patch #1. If L0 version > L1, L0 hv_guest_state will contain some
   additional fields which won't be filled while reading from L1
   memory and thus they can contain garbage. Initialize l2_hv with 0s
   to avoid such situations.
 - Patch #3. Introduce per vm flag dawr1_enabled.
 - Patch #4. Instead of auto enabling KVM_CAP_PPC_DAWR1, let user check
   and enable it manually. Also move KVM_CAP_PPC_DAWR1 check / enable
   logic inside #if defined(CONFIG_KVM_BOOK3S_HV_POSSIBLE).
 - Explain KVM_CAP_PPC_DAWR1 in Documentation/virt/kvm/api.rst 
 - Rebased on top of 5.10-rc3.

v1->v2:
 - patch #1: New patch
 - patch #2: Don't rename KVM_REG_PPC_DAWR, it's an uapi macro
 - patch #3: Increment HV_GUEST_STATE_VERSION
 - Split kvm and selftests patches into different series
 - Patches rebased to paulus/kvm-ppc-next (cf59eb13e151) + few
   other watchpoint patches which are yet to be merged in
   paulus/kvm-ppc-next.

Ravi Bangoria (4):
  KVM: PPC: Allow nested guest creation when L0 hv_guest_state > L1
  KVM: PPC: Rename current DAWR macros and variables
  KVM: PPC: Add infrastructure to support 2nd DAWR
  KVM: PPC: Introduce new capability for 2nd DAWR

 Documentation/virt/kvm/api.rst            | 12 ++++
 arch/powerpc/include/asm/hvcall.h         | 25 ++++++-
 arch/powerpc/include/asm/kvm_host.h       |  7 +-
 arch/powerpc/include/asm/kvm_ppc.h        |  1 +
 arch/powerpc/include/uapi/asm/kvm.h       |  2 +
 arch/powerpc/kernel/asm-offsets.c         |  6 +-
 arch/powerpc/kvm/book3s_hv.c              | 79 +++++++++++++++++++----
 arch/powerpc/kvm/book3s_hv_nested.c       | 70 ++++++++++++++++----
 arch/powerpc/kvm/book3s_hv_rmhandlers.S   | 43 +++++++++---
 arch/powerpc/kvm/powerpc.c                | 10 +++
 include/uapi/linux/kvm.h                  |  1 +
 tools/arch/powerpc/include/uapi/asm/kvm.h |  2 +
 tools/include/uapi/linux/kvm.h            |  1 +
 13 files changed, 216 insertions(+), 43 deletions(-)

-- 
2.26.2

