Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 509A87C4964
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Oct 2023 07:47:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YUjugAUk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S51y91Zmlz3vjd
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Oct 2023 16:47:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YUjugAUk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S51qL39Ppz3vfB
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Oct 2023 16:41:50 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39B5flMB003373
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Oct 2023 05:41:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=vb83JYFlbI4QN/9exgiXwuBWu+msoWsnAQRy9J4YDOM=;
 b=YUjugAUkRAH/eBebA/e0ZJuEEkKb9nnIoDif4xCbZ68LAgboAiIDpxAXCa1BmUczMk9e
 51OXpVCxWMPJYpGt/eikktJz5wlo0JJNGC9rZKoU+g8Rs+3N8tIfrQ5VNGQBjqKWApuK
 UYDwShjataiCs/4VeM3U4K/e1LIjE/lu1YJb0Cc81pGk6hYJP6ARZnsSWBZoXrROo5Uj
 k2DM1IUAftZk2Xpc3aef7JTrmLo+MzoY+lVwqoL6OKusulR+AFLllIFXTYbvVAD4nRoJ
 v8q8dwqOFSNyiBdgJabK4SfnWVd5AMMJfXsAfg2WRNrdkdAv6AFfuMlpW7APZRTX0Ce/ rQ== 
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tnnnvr2bv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Oct 2023 05:41:47 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 39B4h1AU028201
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Oct 2023 05:37:31 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3tkj1y63uk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Oct 2023 05:37:31 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 39B5bT3C23003720
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Oct 2023 05:37:29 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A3DFA2004E
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Oct 2023 05:37:29 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 316AC2004D
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Oct 2023 05:37:29 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Oct 2023 05:37:29 +0000 (GMT)
Received: from bgray-lenovo-p15.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 8505060807;
	Wed, 11 Oct 2023 16:37:24 +1100 (AEDT)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 07/12] powerpc/kvm: Force cast endianness of KVM shared regs
Date: Wed, 11 Oct 2023 16:37:06 +1100
Message-ID: <20231011053711.93427-8-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231011053711.93427-1-bgray@linux.ibm.com>
References: <20231011053711.93427-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Gz9ygmi0t1GkbD_hdM9CA2HgwSo9Wdmo
X-Proofpoint-ORIG-GUID: Gz9ygmi0t1GkbD_hdM9CA2HgwSo9Wdmo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-11_03,2023-10-10_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 bulkscore=0 adultscore=0 mlxlogscore=550 spamscore=0 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310110050
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
Cc: Benjamin Gray <bgray@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Sparse reports endianness mismatches in the KVM shared regs getter and
setter helpers.

This code has dynamic endianness behind a safe interface, so a force is
warranted here to tell sparse this is OK.

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
---
 arch/powerpc/include/asm/kvm_ppc.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/include/asm/kvm_ppc.h b/arch/powerpc/include/asm/kvm_ppc.h
index b4da8514af43..b547bcf1a995 100644
--- a/arch/powerpc/include/asm/kvm_ppc.h
+++ b/arch/powerpc/include/asm/kvm_ppc.h
@@ -943,18 +943,18 @@ static inline void kvmppc_set_##reg(struct kvm_vcpu *vcpu, ulong val)	\
 static inline u##size kvmppc_get_##reg(struct kvm_vcpu *vcpu)		\
 {									\
 	if (kvmppc_shared_big_endian(vcpu))				\
-	       return be##size##_to_cpu(vcpu->arch.shared->reg);	\
+		return be##size##_to_cpu((__be##size __force)vcpu->arch.shared->reg);	\
 	else								\
-	       return le##size##_to_cpu(vcpu->arch.shared->reg);	\
+		return le##size##_to_cpu((__le##size __force)vcpu->arch.shared->reg);	\
 }									\
 
 #define SHARED_WRAPPER_SET(reg, size)					\
 static inline void kvmppc_set_##reg(struct kvm_vcpu *vcpu, u##size val)	\
 {									\
 	if (kvmppc_shared_big_endian(vcpu))				\
-	       vcpu->arch.shared->reg = cpu_to_be##size(val);		\
+		vcpu->arch.shared->reg = (u##size __force)cpu_to_be##size(val);	\
 	else								\
-	       vcpu->arch.shared->reg = cpu_to_le##size(val);		\
+		vcpu->arch.shared->reg = (u##size __force)cpu_to_le##size(val);	\
 }									\
 
 #define SHARED_WRAPPER(reg, size)					\
-- 
2.39.2

