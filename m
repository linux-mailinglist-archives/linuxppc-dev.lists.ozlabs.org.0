Return-Path: <linuxppc-dev+bounces-4683-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A096BA01EC8
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jan 2025 06:19:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YRMtx71Lhz302D;
	Mon,  6 Jan 2025 16:19:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736140793;
	cv=none; b=NWUmsZAzccoo/FxcW3LG/IGo2fs7OAW4G57/cjv3yztiESx9goJMudY6dH5wS/jraCTYZkOJbdGTL2OWuvJFYRreL4nWEyjItIQsXWEbdxpxf5wQ6m5jEWgLwsXvHC2yZcq4bqVDUiDV3mfyLM6xm3JSH/3zK4oDFLBFvEwCgye/9zgy4NCYcW7+TifLk9XUptCzRCy8SFJQzt6jyc5fqVt9IwfVMYthWRriw4zPWYzUIyGxUqsj10oWuy1dVsHivRWfK5tKfplwDOPFbXfpQeZJ3jwUa6Ybf5RvGlWj/vpdaYz1qeCG3MWSM31ZeyfI5lgpY48m5S3p75Z/kBbgRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736140793; c=relaxed/relaxed;
	bh=gF8udn0/1Tn6n2SNh6ajeG2LXloICgwxTmxjeesVeic=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OpUN4hsRWArHRjrLGs/FBaNAoCfM7hHfe333xfAQMcchZ7Hsl5i/CIz3SOmxbhcPKGfwMtfVesDWoRunZhgaNdScMsZh5F+/9xesm4QuasQxz5h7fcMJza0ZHs+jFohW/S+g9luVwbqD8esAJk0wE3smU+Sqhr8uZ0aL90FD+XoI//xeOqft/wH6eWU47ixSsmTYVB0RwFykJ8NwDZ+A6ey4sg+hXbpAyIbM75Ho4l+AJaF4cVqJ74hizkTwf6wL5nNrZytByhYtNFuRaog0DbhGL1sGUupzvpc6qJzpj9b5xgKsgS5+4a1vdWYzucc7K1aOjFyQllZ8F8I5r38e/w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tNb8qhOw; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tNb8qhOw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YRMtw4l1Pz2yyD
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Jan 2025 16:19:51 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5063rYIf001042;
	Mon, 6 Jan 2025 05:19:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=gF8udn0/1Tn6n2SNh6ajeG2LXloICgwxTmxjeesVe
	ic=; b=tNb8qhOwkf3C/ChxfMTXseq5vMJoTIWgHFnq2v0o+ztizBzwmbI3oLssj
	fxAaiHaLuqJzBv1RISwEEw5hrxpeohTEUBtmuVXFFlF41qqjsyq9HOPsVO++cf+r
	c3OFHLgmUbahS57K9LTBfhtZdyN1BM0MiNZZHNefES8SUCX14tp8i30vWUSUmkVU
	KxfqHiVJv2S8XAkuSieBd+d9wHXfLYY1KPKG8o3Yau6rAHi7OvEYY2D9T1mh4g5p
	VpeEXp/dnaCxQK0BYPXDMxgTRlfLnjhHbckqJq1+mysrNeF3jh7S+AtnH7IgxQgJ
	ZzBh09/cK1vR7xlFHg1ViA2/ootjA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4407nbg8vq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Jan 2025 05:19:38 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5065JbUw009809;
	Mon, 6 Jan 2025 05:19:37 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4407nbg8vn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Jan 2025 05:19:37 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5064O1OF003572;
	Mon, 6 Jan 2025 05:19:36 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 43yfasvjcm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Jan 2025 05:19:36 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5065JXk933358178
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 6 Jan 2025 05:19:33 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1949720040;
	Mon,  6 Jan 2025 05:19:33 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9392B20043;
	Mon,  6 Jan 2025 05:19:31 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.in.ibm.com (unknown [9.109.215.252])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  6 Jan 2025 05:19:31 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: mpe@ellerman.id.au, maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Cc: sshegde@linux.ibm.com, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/1] powerpc: Enable dynamic preemption
Date: Mon,  6 Jan 2025 10:49:18 +0530
Message-ID: <20250106051919.55020-1-sshegde@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
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
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: vHBOMOFFXinbXWdfnMdVG2wPX9jfvavm
X-Proofpoint-GUID: Wz6qDdZ12vpRvab_Kl0hLlRu3iQvXyW0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 suspectscore=0 mlxscore=0 mlxlogscore=300 impostorscore=0 clxscore=1015
 adultscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501060042
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Now that preempt=lazy patches[1] are in powerpc-next tree, sending out the
patch to support dynamic preemption based on DYNAMIC_KEY. 

base: powerpc-next 

Once the arch supports static inline calls, it would be needed to
evaluate to see if that gives better performance. 

v2->v3:
- fixed a build error reported by linux test robot by including jump
  label header. 

v1->v2:
- Instead of copying asm-generic preempt.h content include it in
  arch/asm preempt.h. (Christophe Leroy)
- Merge the patches into one patch (Christophe Leroy)

v1: https://lore.kernel.org/all/20241125042212.1522315-1-sshegde@linux.ibm.com/
v2: https://lore.kernel.org/all/20250102191856.499424-1-sshegde@linux.ibm.com/
[1]: https://lore.kernel.org/all/173572211264.1875638.9927288574435880962.b4-ty@linux.ibm.com/

Shrikanth Hegde (1):
  powerpc: Enable dynamic preemption

 arch/powerpc/Kconfig               |  1 +
 arch/powerpc/include/asm/preempt.h | 12 ++++++++++++
 arch/powerpc/kernel/interrupt.c    |  6 +++++-
 arch/powerpc/kernel/traps.c        |  6 +++++-
 arch/powerpc/lib/vmx-helper.c      |  2 +-
 5 files changed, 24 insertions(+), 3 deletions(-)
 create mode 100644 arch/powerpc/include/asm/preempt.h

-- 
2.39.3


