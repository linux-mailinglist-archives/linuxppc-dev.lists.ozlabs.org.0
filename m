Return-Path: <linuxppc-dev+bounces-6051-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EFA0A2F79C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Feb 2025 19:44:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YsD5Y1hrcz30TS;
	Tue, 11 Feb 2025 05:44:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739213089;
	cv=none; b=eYZ8E/nAmvR8Rt6O1TRRcbhY5hYz9ozlg/OE14sYbBwncow+S1ma3Wu5Namc26li+TnWsUFclDJrsfaD2Q75kSgpN6vzGbFGHktDYgttezqXhhdlC16Tui6h69HSvg/66j9dzGT03DamAhEExcBzXp8jATjU0vaWZKpPM8q/lViVXryEJFW74agxFxqXiDuj9g1ppBpNN6a/cOhL7XLbKx2YXjaDpA6aDNPVHF2dcW2GhNw+llNbfaBisWiTmUdtiaLfDKZXb0Opw2+JOo0D34AAqA9lOkUzxIFBvKfh7hquLXoCxKFx93Nf0yJUhwFlcaUewCQb5KVlHcv3Gv7QxA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739213089; c=relaxed/relaxed;
	bh=/sfZo4VnTTbgtBXOjHc1EMP0EjzaL6Vg1Lr6lCGxpsk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XVbY9ou8P+ojeZRtXNWGuSjTuROMZAoDlHgLeIcFwj3aQ2DARDPkt9nvqtOmtn61vpH5hr49EEW/C6LLFj8wcVQkNeuyoX+T3SmxMJsaWCBt5SKUWHN9OPsaoBHLI409ItXmiLYNM/0YTrYZ3eClg6a/uTynpDvPzHGLrPFZX2uLoUQR9BXNXDy5nu6tKyslhKFDNHW0wmAJofRgVPR6Ifh3ZbleLSgb7lNnyNR7X3iqMO+esFUuU7AtFXkzldOhElzsqB22uxZaZx7yAy2PqijWdWdv0Ir2Od2hLnHhKEOdCjJVg77RQbRIxXwvUSCCOGCXNw2q6+cZzVwk2XmL9w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ad/A+YmB; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ad/A+YmB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YsD5X1mtYz3054
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Feb 2025 05:44:47 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51AC7GSj014061;
	Mon, 10 Feb 2025 18:44:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=/sfZo4VnTTbgtBXOjHc1EMP0EjzaL6Vg1Lr6lCGxp
	sk=; b=Ad/A+YmBKeK9eO3NoDqP33y46uu9mSeY9lWQYBXfO5Y1z7ZmyEm/xf7cg
	/yXiWpDSNYBBtpRckRZDkRFrcvUh2iXEIB0sLSlVqkRDMMRaGIp0abrINLQ1veV3
	/E8XXjlk3+u75ZLgxioe1T0qTOSQ8Dbfyb90T0ZHDyqJwxY6uVwdIQwk5+0jaZ1T
	8bRtBpuFldXoMngcQO5nQAatmGBqDB5oVspspysgiJdCLDofU9RCKKpXSawxDyRg
	jxWj+ZC94N/vnBWYsse8K4RNI19ZLzaIhVnqpcsS36lHiFjQ37rinqJOZeQm0jW6
	qU8Be9RjhCQPUaCYoiNBL9hRlifDw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44q89yvenb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Feb 2025 18:44:23 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 51AIXHXB030868;
	Mon, 10 Feb 2025 18:44:22 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44q89yven8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Feb 2025 18:44:22 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 51AFOCuj028217;
	Mon, 10 Feb 2025 18:44:22 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 44phyy7vkg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Feb 2025 18:44:22 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 51AIiIIY50200834
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 10 Feb 2025 18:44:18 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 204E720040;
	Mon, 10 Feb 2025 18:44:18 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1BBD320043;
	Mon, 10 Feb 2025 18:44:16 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.39.21.225])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 10 Feb 2025 18:44:15 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
        christophe.leroy@csgroup.eu
Cc: sshegde@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        bigeasy@linutronix.de, will@kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/1] powerpc: Enable dynamic preemption
Date: Tue, 11 Feb 2025 00:13:33 +0530
Message-ID: <20250210184334.567383-1-sshegde@linux.ibm.com>
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
X-Proofpoint-GUID: TVaZM5MAqNqCkiNaS_iUsIIujLviuuZv
X-Proofpoint-ORIG-GUID: LPA-Cgz7nPLnLml3cyj4btBaBdbQBwiM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_10,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 mlxlogscore=582 clxscore=1015 impostorscore=0
 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0
 mlxscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502100149
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Now that preempt=lazy patches are merged upstream, sending out the
patch to support dynamic preemption based on DYNAMIC_KEY.

Once the arch supports static inline calls, it would be needed to
evaluate to see if that gives better performance.

This makes the same code for arm64 and powerpc. Will be sending an RFC
patch to move this static key into sched/core. 

v3->v4:
- Use static key instead of using preempt_model_preemptible 
  (Sebastian Andrzej Siewior and Christophe Leroy)
- Dropped printing the preemption model, since it is addressed 
  in a patchset from Sebastian Andrzej Siewior

v2->v3:
- fixed a build error reported by linux test robot by including jump
  label header.

v1->v2:
- Instead of copying asm-generic preempt.h content include it in
  arch/asm preempt.h. (Christophe Leroy)
- Merge the patches into one patch (Christophe Leroy)

v3: https://lore.kernel.org/all/20250106051919.55020-1-sshegde@linux.ibm.com/

Shrikanth Hegde (1):
  powerpc: enable dynamic preemption

 arch/powerpc/Kconfig               |  1 +
 arch/powerpc/include/asm/preempt.h | 16 ++++++++++++++++
 arch/powerpc/kernel/interrupt.c    |  6 +++++-
 arch/powerpc/lib/vmx-helper.c      |  2 +-
 4 files changed, 23 insertions(+), 2 deletions(-)
 create mode 100644 arch/powerpc/include/asm/preempt.h

-- 
2.39.3


