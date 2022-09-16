Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 992185BABD3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Sep 2022 12:58:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MTWJl1SBkz3c6X
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Sep 2022 20:58:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GCMR4VC0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=disgoel@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GCMR4VC0;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MTWJ253Grz2yxX
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Sep 2022 20:57:54 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28GAgLef025066;
	Fri, 16 Sep 2022 10:57:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=YDy8dn8A1URcqcTr4FzPz9TsL/tPhgTnmJkf8dTpnHc=;
 b=GCMR4VC0oWwLPQnHKbRalTNn6ZSWcog6Tbn416BwuAg78FAUqpwE82tJh2SRUuEpseMO
 +T0FxpypduXLDlkJ+A75kxMl844pFJ8Vk290y+07+0rmZn11cpMrnAs9d+p25Mw5b1xE
 J+MsZPsUCtlhz4qE1/lw2xPh0E6g8a4LWthx0/wESLivR0/PTtDU/unb1aV7+9aLKW4Q
 J2SUX6yTSFJn/9nIqomYlNRRpn7oTxBijBu+OYtye2KqlLHgQGJc/ov3JcMaeQRv0TEH
 jk9t6RJnsLsJFVbcSpJOhxaWxUI/iIx9jgUFycN9vRbcpTbCjpr2Ll5y+2HLyt6eVfnS Fg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jmqm9gdus-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Sep 2022 10:57:49 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28GAhO5n028159;
	Fri, 16 Sep 2022 10:57:49 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com [159.122.73.70])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jmqm9gdtv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Sep 2022 10:57:49 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
	by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28GAqhsI016577;
	Fri, 16 Sep 2022 10:57:46 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
	by ppma01fra.de.ibm.com with ESMTP id 3jm9168mvq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Sep 2022 10:57:46 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28GAvhUB42271222
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 16 Sep 2022 10:57:43 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 99FDCA4051;
	Fri, 16 Sep 2022 10:57:43 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2689BA404D;
	Fri, 16 Sep 2022 10:57:40 +0000 (GMT)
Received: from disgoel-ibm-com.ibm.com (unknown [9.43.57.26])
	by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Fri, 16 Sep 2022 10:57:39 +0000 (GMT)
From: Disha Goel <disgoel@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH v2 0/2] Remove unused macros from asm-offset
Date: Fri, 16 Sep 2022 16:27:34 +0530
Message-Id: <20220916105736.268153-1-disgoel@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 0o7VQ3xOAxEOms2S_P5a96o8gUWjc6F_
X-Proofpoint-ORIG-GUID: vBmJqekFaa-8oGmaSlNYo1Y6KSlipva7
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-16_05,2022-09-16_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=999 mlxscore=0 impostorscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209160077
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
Cc: atrajeev@linux.vnet.ibm.com, kjain@linux.ibm.com, npiggin@gmail.com, maddy@linux.ibm.com, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The kvm code was refactored to convert some of kvm assembly routines to C.
This includes commits which moved code path for the kvm guest entry/exit
for p7/8 from aseembly to C. As part of the code changes, usage of some of
the macros were removed. But definitions still exist in the assembly files.
Commits are listed below:

Commit 2e1ae9cd56f8 ("KVM: PPC: Book3S HV: Implement radix prefetch workaround by disabling MMU")
Commit 9769a7fd79b6 ("KVM: PPC: Book3S HV: Remove radix guest support from P7/8 path")
Commit fae5c9f3664b ("KVM: PPC: Book3S HV: remove ISA v3.0 and v3.1 support from P7/8 path")
Commit 57dc0eed73ca ("KVM: PPC: Book3S HV P9: Implement PMU save/restore in C")

Many of the asm-offset macro definitions were missed to remove. This patchset
fixes by removing the unused macro definitions.

Patch1 removes a set of unused kvm vcpu and hstate macros from the
asm-offset.c

Patch2 removes unused host_mmcr references for MMCR3/SIER2/SIER3

Changelog:
v1 -> v2:
Merge all the macro removal part from asm-offset.c file into a single patch
as suggested by Christophe Leroy.

Link to patchset v1:
http://patchwork.ozlabs.org/project/linuxppc-dev/patch/20220913074025.132160-2-disgoel@linux.vnet.ibm.com/

Link to the script used to get unused macro:
https://github.com/maddy-kerneldev/scripts/blob/master/check_asm-offset.sh

Link to linux-ci job result:
https://github.com/disgoel/linux-ci/actions?query=branch%3Akvmmacro.v2

Disha Goel (1):
  powerpc/kvm: Remove unused macros from asm-offset

Kajol Jain (1):
  powerpc/kvm: Remove unused references for MMCR3/SIER2/SIER3 registers

 arch/powerpc/include/asm/kvm_book3s_asm.h |  2 +-
 arch/powerpc/kernel/asm-offsets.c         | 25 -----------------------
 2 files changed, 1 insertion(+), 26 deletions(-)

-- 
2.31.1

