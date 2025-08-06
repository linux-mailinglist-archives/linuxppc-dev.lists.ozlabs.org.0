Return-Path: <linuxppc-dev+bounces-10687-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E03D4B1C01D
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Aug 2025 07:56:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bxfgC1CMDz3bkb;
	Wed,  6 Aug 2025 15:56:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754459783;
	cv=none; b=lUyW5H53+5YGD5XgFNpINveQJtB6oLoo8Mcze/D2NJE1uJPKxm5KJhbESTgb6nRto0DegqKXJTI74szxPv0OO2jJvKuYFGLwi7hl8+0IwMGU7mZdwJar4hgsMBLVwKONXCus5jdvseIR8i4eZ25Cqhu4wJycGJhFJfzkxrf2Am3n/Eh6csrb6KVSRPwTNq0e7wx2UhhrHRCqjikVTGgE8pk/1SIbHXS0RM/ib81U9AXIoz1RbXOWMABd1bygr8NAr7CFuCgOx6YmV9ylB7tj/4A6U6GJ01nRYHcUSiDlVpseSTjvnuXHpVIbODpkhzMlE33suJUOG4iJ484th70NRw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754459783; c=relaxed/relaxed;
	bh=YS/ILQBjmDtK+sCleswm9x2dCFYN64fiPVefPUMnyP0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=IcUK9g/TARfqG8cZnmTPVrbhxIbQPWcWhXKc8B86uyEox65JPUzC2n2tIvg2aZuxCLZeQnXgzfKA7QTUx2VHoTXk+RMGqdrWEBFr/vgf9KhPeHVnouS1h2zWJ0S94J932L8r8YCpcl36MszxGdRP+flwQe0atYbR68ChY3GkHX+7dvXFhdTEmMb6V3j4cBV70Yl7oT/qD0yctGgbfqr+yASocRf1rcX4F56eWoQHCoyuXIvMej9++GTkOxe2om5zA5YJ2LNDp7lM6y02MuVqbUm3o+zk5MycC0IyVolcOCxbdwpCyDEMGGInjm2W2NQO23CsHNfaz2oJM+2BxiuPdw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZXeo0DYA; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZXeo0DYA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bxfgB1Ldsz2xck
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Aug 2025 15:56:21 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 575IpRra012314;
	Wed, 6 Aug 2025 05:56:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=YS/ILQBjmDtK+sCleswm9x2dCFYN64fiPVefPUMny
	P0=; b=ZXeo0DYAzzny6hYPyzWWAnu2GlfVaHmGgkwrKolOgVnOZc0gB8/KZrESK
	4brO8yU1Xb4bACJbUwwTNdj7GUULpZuG2LBJop8e6zxXHvHIPzcb8HVlu0QH1AB4
	HmTXHjotWYVbqvAdgWJUSOPadwaSayfCfSJoshpgVbTx6Tk1ThlhiACQUCyTE2Tb
	neXjuSSjgbugYDjZ5Siyaz1FDN5QaN1gYX5zVxJS5D9af8qkA++5VfhVp+reOCg8
	iVzUgIJH65pq0LQtGWO2++AEPYE4ye3hEr5TzMwefcKAxiP/bO6Vse3+lfWETtOL
	Y+2kRRwNWqLh5PjM1HSIh8KkuKraw==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48bq63jaxt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Aug 2025 05:56:18 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5763Dri8020600;
	Wed, 6 Aug 2025 05:56:17 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([172.16.1.74])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 48bpwmt75m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Aug 2025 05:56:17 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5765uHkT20775660
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 6 Aug 2025 05:56:17 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E251658056;
	Wed,  6 Aug 2025 05:56:16 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 735965803F;
	Wed,  6 Aug 2025 05:56:15 +0000 (GMT)
Received: from jarvis.ozlabs.ibm.com.com (unknown [9.36.0.205])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  6 Aug 2025 05:56:15 +0000 (GMT)
From: Andrew Donnellan <ajd@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org
Subject: [PATCH] KVM: PPC: Fix misleading interrupts comment in kvmppc_prepare_to_enter()
Date: Wed,  6 Aug 2025 15:56:07 +1000
Message-ID: <20250806055607.17081-1-ajd@linux.ibm.com>
X-Mailer: git-send-email 2.50.1
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAzMCBTYWx0ZWRfX1n0iGyoe2r0m
 +N5bkh1eON6MyfxhwFeRIQlQYqicEJKaXlu9Cljl1yrrKSQjARftd2gqkkHz40BhABLx2xpbJyD
 +41CRyC7ly18r1Uv1JkFcNqNy00FZ3VIodT17TJjPGhLZwXxVCNXfgWDdwRz+vt5pWOhStycNVr
 5Sax8sCa9Ou1YAJyWqh3/L46h9tSVfzwN9rfiQV8H8EtTqeAewlB890iQdqP9kO4SZH67zhqjBn
 BQ2jXfk0p2IolYT3Cqn07QubUEgFB9/NnxNIUp6deAHvY5Vk3uJwdZXfhqjWG5gkw0/wW3CnmzP
 eT6c1MfpK5cHeEfMgGIwRR9xtKRrOQ+TeVFQaEtzpR6rTeCL6gvoab1fsBc1cG8CwIKgtcqagHd
 gW/1R7cnqxLKNhZyf4SBMBqxeced55dS7QUD5Kqo9m8T0AYQBYshpiFpORfcrhMpGHBxtGow
X-Proofpoint-ORIG-GUID: RiK7N33Soo0SePg9LqJA9kXtJqAvnHwF
X-Authority-Analysis: v=2.4 cv=LreSymdc c=1 sm=1 tr=0 ts=6892ee82 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=2OwXVqhp2XgA:10 a=VnNF1IyMAAAA:8 a=gr7D_48Ji271olD-KTQA:9
X-Proofpoint-GUID: RiK7N33Soo0SePg9LqJA9kXtJqAvnHwF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_05,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 mlxlogscore=618 bulkscore=0
 malwarescore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2507300000
 definitions=main-2508060030
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Until commit 6c85f52b10fd ("kvm/ppc: IRQ disabling cleanup"),
kvmppc_prepare_to_enter() was called with interrupts already disabled by
the caller, which was documented in the comment above the function.

Post-cleanup, the function is now called with interrupts enabled, and
disables interrupts itself.

Fix the comment to reflect the current behaviour.

Fixes: 6c85f52b10fd ("kvm/ppc: IRQ disabling cleanup")
Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
---
 arch/powerpc/kvm/powerpc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
index 153587741864..2ba057171ebe 100644
--- a/arch/powerpc/kvm/powerpc.c
+++ b/arch/powerpc/kvm/powerpc.c
@@ -69,7 +69,7 @@ int kvm_arch_vcpu_should_kick(struct kvm_vcpu *vcpu)
 
 /*
  * Common checks before entering the guest world.  Call with interrupts
- * disabled.
+ * enabled.
  *
  * returns:
  *
-- 
2.50.1


