Return-Path: <linuxppc-dev+bounces-8492-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50880AB2686
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 May 2025 06:11:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zw8SR4rvnz2yMF;
	Sun, 11 May 2025 14:11:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746936695;
	cv=none; b=Inv7FHYOG4EuVCeeLrza3yiBXyKzcePnE6yDj8L8hmte1oJWDrMzWimx5F7xmy/Pmi+gnZjcaeNnvSBZ7rnc2UYp4QmrooTevYgwOWtbChL3j8Ynk0xT8R94a2sFZwk9axphtpJoZIw8dS+CHe3OeS1Q7TD9Cizju9PDZyqnTL7Ln1lT7t9/lRmL1XkXTfWk/8tdG8LOl/U69gvW2yFh/bdHOs+OgHwATRzqyNddTJNccNcZilkoOlkcHUuq3jPv6m8sYZbPqxzQzgf2/pkzeLMrDHteHsJgNcYEViQWnyNsD6COGzeJV6xHS2soDWtU5pdSlNYZQ/G7hIL3ICr80A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746936695; c=relaxed/relaxed;
	bh=Meoef2nuKgo1R35Xa8cQwAFXq4gxrfh7g/isjfhmZXI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lN9wMqafX58lJaSwtDt5CiRVF2RoEwFmAeGnTGtaDW2XP5oLG2nWZLRU/Xy0+v9Vx/nJRGCIxqMFX/6aNj99TIwogH0JD7AfVxB5Hhqpo/RHZqHslP0JWrc2NrcH83Fxo5Cfygv+4FjGjYRrOW20LROFvswjykA4nrrPFv8lVhv4UIArr0/VBYo6/phmYPSTB3thdBJLYm0ibboVCF2Ubh3Lfdb0HmFb+v0qIvKVfflldOL1/0LcQF7pikhRVDnYNYdIWFP1uOVzMgc5IQ1HWggNK0OMSPA7vgb4XRiCorKAT0MBHVXl2FAMBhE9p5IqEVjReD19QljHcOCJhPRYvg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UErQGQoM; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UErQGQoM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zw8SQ5SW4z2y8p
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 11 May 2025 14:11:34 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54B2fBEh021541;
	Sun, 11 May 2025 04:11:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=Meoef2nuKgo1R35Xa8cQwAFXq4gxrfh7g/isjfhmZ
	XI=; b=UErQGQoMNBWQq70bM0LMZjSKA8pSm5QX7CYu+iY4RNI/+KSb9WOIdhNbx
	ww/b96Zc0NzBDU/pZ5iMhERvZVfEXnTs5hFecRcr/iUkiJxc35mEiQnfKxHYhwLR
	814XUXKILmBUPVB4UrCco3YRpFzScFi1bo/MODqshafE9Up167919V2DyDHV1jVw
	7Cof1nbEUwUCrc/p4QFddO5940qxh22ofOnHdrwchzr87cEd9Q8zDE32ZXPS40I2
	y+jDD89vOPPpwPHIabfWWfYuRgC4DAUqYx+dXOztgABbNIFMKDh/GyTa6Y8mVJgz
	yXDDj8/XNuLhTRYmHENV5mbfXQXbA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46jce8gxum-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 11 May 2025 04:11:21 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54B4BK06020116;
	Sun, 11 May 2025 04:11:20 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46jce8gxuj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 11 May 2025 04:11:20 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54B1rKDS024427;
	Sun, 11 May 2025 04:11:19 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 46jjmkrb3s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 11 May 2025 04:11:19 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54B4BHVj56361376
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 11 May 2025 04:11:17 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7AF372004F;
	Sun, 11 May 2025 04:11:17 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BBF522004D;
	Sun, 11 May 2025 04:11:14 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.11.248])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun, 11 May 2025 04:11:14 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu
Cc: naveen@kernel.org, linuxppc-dev@lists.ozlabs.org,
        Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: [PATCH] powerpc/kernel: Fix ppc_save_regs inclusion in build
Date: Sun, 11 May 2025 09:41:11 +0530
Message-ID: <20250511041111.841158-1-maddy@linux.ibm.com>
X-Mailer: git-send-email 2.49.0
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 0j5SpEwrvtz1M0xn3Z9AZ3ZnSobcblS5
X-Proofpoint-GUID: R7W6onh325Ou_kJSw5jjy9jYDbaXRDAn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTExMDAzOSBTYWx0ZWRfX40Sr3bGmGnJd gmuQOkpKQNKzfE8bUNmymKWswY07nHRRt7OGXUTAZ2JmTxXr6nLNrttoKTe2WX5a9LSnawg5ugu Holg4LuAGt6H5Vtkkx/tbNpYdMHNnBBAEyhrJ25sERaLw2vwAso5ry5KGKPaKtXX6ZAIKff5qtA
 BGQW+6XdHjcjCktxIe5AECV+lwQujNowwm0TZWkZzqAoRnftxrDUGvKOT7zoZ77eo71a5u3ZeYS YQ6zfIhToJP23MNDhiK8uY9nLb2obQP03qfs+vqCfgvU8HC3rrDTjusPA/5ScIbhBDI+2yVcwSN sYGtZgI7afTJ8K3xV3FSa/YdAHG7HzII5qbakWkO0Q0/R6E8lj8FJNFN/ZsFUeUrV66d+Tj1n/B
 s8ZWBpWisq5ijB5I4aRl6cxL+eyVo2a7Q8wqdnQpsnmmP2dMd+h5v3zcLG7b2zaa+IhdAvZS
X-Authority-Analysis: v=2.4 cv=fvrcZE4f c=1 sm=1 tr=0 ts=68202369 cx=c_pps a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17 a=dt9VzEwgFbYA:10 a=VnNF1IyMAAAA:8 a=24Np_JXucUK6LjyfZy8A:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-11_01,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 mlxlogscore=592 lowpriorityscore=0
 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505110039
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Recent patch fixed an old commit
'fc2a5a6161a2 ("powerpc/64s: ppc_save_regs is now needed for all 64s builds")'
which is to include building of ppc_save_reg.c only when XMON
and KEXEC_CORE and PPC_BOOK3S are enabled. This was valid, since
ppc_save_regs was called only in replay_system_reset() of old
irq.c which was under BOOK3S.

But there has been multiple refactoring of irq.c and have
added call to ppc_save_regs() from __replay_soft_interrupts
-> replay_soft_interrupts which is part of irq_64.c included
under CONFIG_PPC64. And since ppc_save_regs is called in
CRASH_DUMP path as part of crash_setup_regs in kexec.h,
CONFIG_PPC32 also needs it.

So with this recent patch which enabled the building of
ppc_save_regs.c caused a build break when none of these
(XMON, KEXEC_CORE, BOOK3S) where enabled as part of config.
Patch to enable building of ppc_save_regs.c by defaults.

Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
---
Patch applies clean on powerpc-next

 arch/powerpc/kernel/Makefile | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
index 0c26b2412d17..9d1ab3971694 100644
--- a/arch/powerpc/kernel/Makefile
+++ b/arch/powerpc/kernel/Makefile
@@ -160,9 +160,7 @@ endif
 
 obj64-$(CONFIG_PPC_TRANSACTIONAL_MEM)	+= tm.o
 
-ifneq ($(CONFIG_XMON)$(CONFIG_KEXEC_CORE)$(CONFIG_PPC_BOOK3S),)
 obj-y				+= ppc_save_regs.o
-endif
 
 obj-$(CONFIG_EPAPR_PARAVIRT)	+= epapr_paravirt.o epapr_hcalls.o
 obj-$(CONFIG_KVM_GUEST)		+= kvm.o kvm_emul.o
-- 
2.49.0


